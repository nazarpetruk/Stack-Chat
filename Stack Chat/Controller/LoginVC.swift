//
//  LoginVCViewController.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 03/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: toCreateAccount, sender: nil)
    }
    
}
