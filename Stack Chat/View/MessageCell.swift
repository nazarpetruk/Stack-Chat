//
//  MessageCell.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 17/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell(message: Message){
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }
}
