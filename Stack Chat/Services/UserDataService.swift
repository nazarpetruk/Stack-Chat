//
//  UserDataService.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 10/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    private(set) var id = ""
    private(set) var avatarColor = ""
    private(set) var avatarName = ""
    private(set) var email = ""
    private(set) var name = ""
   
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let scipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = scipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrap = r else { return defaultColor }
        guard let gUnwrap = g else { return defaultColor }
        guard let bUnwrap = b else { return defaultColor }
        guard let aUnwrap = a else { return defaultColor }
        
        let rFloat = CGFloat(rUnwrap.doubleValue)
        let gFloat = CGFloat(gUnwrap.doubleValue)
        let bFloat = CGFloat(bUnwrap.doubleValue)
        let aFloat = CGFloat(aUnwrap.doubleValue)
        
        let newColor = UIColor(displayP3Red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newColor
        
    }
    func logoutUser(){
        id = ""
        avatarColor = ""
        avatarName = ""
        email = ""
        name = ""
        AuthService.instance.isLogged = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
    }
    
}
