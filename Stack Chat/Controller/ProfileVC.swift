//
//  ProfileVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 12/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPView()
    }
    //IBActions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: USER_DATA_CHANGED, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setUPView(){
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.name
        userMail.text = UserDataService.instance.email
        let closeTouchTap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouchTap)
    }
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
