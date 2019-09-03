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
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 50

    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: toLogin, sender: nil)
    }
    
}
