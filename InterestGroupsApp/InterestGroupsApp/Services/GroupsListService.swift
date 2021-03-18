//
//  GroupsListService.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import ObjectMapper

class GroupsListService {
    
    static let shared = { GroupsListService() }()
    
    func getGroupsList(success: @escaping (Int, [GroupInfo]) -> (), failure: @escaping (Int) -> ()) {
        
        let urlString = self.configureUrlApi(baseUrl: "https://practica-slashmobility.firebaseio.com/", value: "groups.json")
        
        APIClient.shared.getArray(urlString: urlString, success: {(code, arrayOfGroups) in
            success(code, arrayOfGroups)
        }) { (code) in
            failure(code)
        }
    }
    
    func configureUrlApi(baseUrl: String, value: String) -> String {
        return baseUrl + value
    }
}
