//
//  GroupInfo.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import ObjectMapper

struct GroupInfo: Mappable {
    
    var id: Int?
    var name: String?
    var description: String?
    var descriptionShort: String?
    var defaultImageUrl: String?
    var date: Double?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        descriptionShort <- map["descriptionShort"]
        defaultImageUrl <- map["defaultImageUrl"]
        date <- map["date"]
    }
}

