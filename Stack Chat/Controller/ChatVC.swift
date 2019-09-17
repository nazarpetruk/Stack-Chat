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
    
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChanged(_:)), name: USER_DATA_CHANGED, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLogged{
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: USER_DATA_CHANGED, object: nil)
            }
        }
    }
    @objc func userDataDidChanged(_ notif: Notification) {
        if AuthService.instance.isLogged{
            onLoginGetMessages()
        }else{
            topLbl.text = "Please Log In"
        }
    }
    @objc func channelSelected(_ notif: Notification){
        updateWithChannel()
    }
    func updateWithChannel(){
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        topLbl.text = "#\(channelName)"
        getMessages()
    }
    
    func onLoginGetMessages(){
        MessageService.instance.findChannels { (success) in
            if success {
                if MessageService.instance.channels.count > 0{
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                }else{
                    self.topLbl.text = "No channels yet!"
                }
            }
        }
    }
    func getMessages(){
        guard let channelId = MessageService.instance.selectedChannel?.id else { return }
        MessageService.instance.allMessagesForChannel(channelId: channelId) { (success) in
            if success{
                
            }
        }
    }
}
