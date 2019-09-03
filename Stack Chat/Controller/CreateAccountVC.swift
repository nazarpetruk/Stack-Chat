//
//  CreateAccountVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 03/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: unWind, sender: nil)
    }
    
}
