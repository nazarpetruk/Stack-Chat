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

//MARK: Headers
let HEADER = ["Content-Type" : "application/json; charset=utf-8"]
