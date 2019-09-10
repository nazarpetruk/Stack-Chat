//
//  CreateAccountVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 03/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    //MARK : Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //Vars
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: unWind, sender: nil)
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        guard  let name = userNameTxt.text, userNameTxt.text != "" else { return }
        guard  let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("USER REGISTERED!")
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success{
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name,UserDataService.instance.avatarName )
                                self.performSegue(withIdentifier: unWind, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
}
