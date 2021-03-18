//
//  GroupInfo.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class GroupInfo: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var descriptionLong: String?
    @objc dynamic var descriptionShort: String?
    @objc dynamic var defaultImageUrl: String?
    @objc dynamic var date: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        descriptionLong <- map["description"]
        descriptionShort <- map["descriptionShort"]
        defaultImageUrl <- map["defaultImageUrl"]
        date <- map["date"]
    }
}
