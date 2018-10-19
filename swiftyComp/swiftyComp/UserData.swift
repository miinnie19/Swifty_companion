//
//  UserData.swift
//  swiftyComp
//
//  Created by Melissa NAIDOO on 2018/10/17.
//  Copyright © 2018 Melissa NAIDOO. All rights reserved.
//

import Foundation


struct Users: Decodable {
    let first_name : String
    let last_name :String
    let login :String
    let email:String
    let image_url: String
    let correction_point:Int
    let wallet:Int
    let cursus_users : [Cursus_users]
    let projects_users: [Project_users]
    //let skills: [Skills]



//    enum CodingKeys: String, CodingKey {
//
//        case first_name         = "first_name"
//        case last_name          = "last_name"
//        case login              = "login"
//        case email              = "email"
//        case image_url          = "image_url"
//        case correction_point   = "correction_point"
//        case wallet             = "wallet"
//        case cursus_users       = "cursus_users"
//        case skills             = "skills"
//    }
}
struct Cursus_users: Decodable {
    let level : Double
    let skills: [Skills]
}

struct Skills: Decodable{
    let level : Double
    let name :String
}

struct Project_users: Decodable {
    let final_mark: Int?
    let project: Project
 
}
struct Project: Decodable {
    let slug: String?
}
