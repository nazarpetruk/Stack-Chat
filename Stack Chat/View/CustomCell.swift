//
//  CustomCell.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 13/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var channelNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    func configureCell(channel: Channel){
        let title = channel.channelTitle ?? ""
        channelNameLbl.text = "#\(title)"
        channelNameLbl.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        for id in MessageService.instance.unreadChannels {
            if id == channel.id{
                channelNameLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
            }
        }
    }

}
