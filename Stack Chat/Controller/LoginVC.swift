//
//  LoginVCViewController.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 03/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        spinner.isHidden = true
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: toCreateAccount, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = userNameTxt.text, userNameTxt.text != "" else { return }
        guard let password = userPassword.text, userPassword.text != "" else { return }
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success{
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success{
                        NotificationCenter.default.post(name: USER_DATA_CHANGED, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
        
    }
    
    func setUpView(){
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "User name", attributes: [NSAttributedString.Key.foregroundColor : placeholderClr])
        userPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : placeholderClr])
        
    }
    
}
