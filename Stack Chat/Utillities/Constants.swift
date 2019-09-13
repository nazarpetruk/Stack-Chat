//
//  Constraints.swift
//  Stack Chat
//
//  Created by Nazar Petruk on 03/09/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: Segues
let toLogin = "toLogin"
let toCreateAccount = "toCreateAccount"
let unWind = "unwindToChannel"
let toAvatar = "toAvatarPicker"

//MARK: USER DEFAULTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//MARK: URL
let BASE_URL = "https://stacky.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"

//MARK: Headers
let HEADER = ["Content-Type" : "application/json; charset=utf-8"]
let BEARER_HEADER = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]

//MARK: Color
let placeholderClr = #colorLiteral(red: 0.3254901961, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//MARK: Notification Cons
let USER_DATA_CHANGED = Notification.Name("notifUserDataChanged")
