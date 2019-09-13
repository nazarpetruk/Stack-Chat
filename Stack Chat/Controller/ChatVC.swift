//
//  ChatVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 02/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    //MARK: IBOutlets
    
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        if AuthService.instance.isLogged{
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: USER_DATA_CHANGED, object: nil)
            }
        }
    }
    
}
