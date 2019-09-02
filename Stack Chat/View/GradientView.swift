//
//  GradientView.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 02/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.3631127477, green: 0.4045833051, blue: 0.8775706887, alpha: 1){
        didSet{
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1){
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradiantLayer.startPoint = CGPoint(x: 0, y: 0)
        gradiantLayer.endPoint = CGPoint(x: 1, y: 1)
        gradiantLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradiantLayer, at: 0)
        
    }
}
