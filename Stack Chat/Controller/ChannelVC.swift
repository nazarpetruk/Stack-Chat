//
//  ChannelVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 02/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 50
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: USER_DATA_CHANGED, object: nil)

    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLogged{
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated:true, completion: nil)
        }else{
        performSegue(withIdentifier: toLogin, sender: nil)
        }
    }
    @objc func userDataDidChange(_ notif: Notification){
        if AuthService.instance.isLogged{
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }else{
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    
}
