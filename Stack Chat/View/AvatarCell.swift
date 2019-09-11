//
//  AvatarCell.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 11/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
