//
//  ChatVC.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 02/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: IBOutlets
    
    @IBOutlet weak var messageTxt: UITextField!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var typingUserLbl: UILabel!
    
    //MARK: Variables
    var isTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        sendBtn.isHidden = true
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToDismissKeyBoard))
        view.addGestureRecognizer(tap)
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChanged(_:)), name: USER_DATA_CHANGED, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: CHANNEL_SELECTED, object: nil)
        
        SocketService.instance.getMessage { (newMessage) in
            if newMessage.channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLogged {
                MessageService.instance.messages.append(newMessage)
                self.tableView.reloadData()
                if MessageService.instance.messages.count > 0 {
                    let index = IndexPath(row: MessageService.instance.messages.count - 1, section: 0)
                    self.tableView.scrollToRow(at: index, at: .bottom, animated: false)
                }
            }
        }
        
        SocketService.instance.getTypingUsers { (typingUsers) in
            guard let channelId = MessageService.instance.selectedChannel?.id else { return }
            var names = ""
            var numberOfTypers = 0
            for (typingUser, channel) in typingUsers {
                if typingUser != UserDataService.instance.name && channel == channelId {
                    if names == ""{
                        names = typingUser
                    }else{
                        names = "\(names), \(typingUser)"
                    }
                    numberOfTypers += 1
                }
            }
            if numberOfTypers > 0 && AuthService.instance.isLogged == true {
                var verb = "is"
                if numberOfTypers > 1{
                    verb = "are"
                }
                self.typingUserLbl.text = "\(names)\(verb) typing a message"
            }else{
                self.typingUserLbl.text = ""
            }
        }
        
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
            tableView.reloadData()
        }
    }
    @objc func channelSelected(_ notif: Notification){
        updateWithChannel()
    }
    @objc func tapToDismissKeyBoard (){
        view.endEditing(true)
    }
    func updateWithChannel(){
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        topLbl.text = "#\(channelName)"
        getMessages()
    }
    
    @IBAction func messageEditing(_ sender: Any) {
        guard let channelId = MessageService.instance.selectedChannel?.id else { return }
        if messageTxt.text == ""{
            isTyping = false
            sendBtn.isHidden = true
            SocketService.instance.socket.emit("stopType", UserDataService.instance.name, channelId)
        }else{
            if isTyping == false{
                sendBtn.isHidden = false
                SocketService.instance.socket.emit("startType", UserDataService.instance.name, channelId)
            }
            isTyping = true
        }
    }
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        if AuthService.instance.isLogged {
            guard let channelId = MessageService.instance.selectedChannel?.id else { return }
            guard let message = messageTxt.text else { return }
            SocketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelId) { (success) in
                if success {
                    self.messageTxt.text = ""
                    self.messageTxt.resignFirstResponder()
                    SocketService.instance.socket.emit("stopType", UserDataService.instance.name, channelId)
                }
            }
        }
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
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell{
            let message =  MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
