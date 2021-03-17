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
        
        let urlString = "https://practica-slashmobility.firebaseio.com/groups.json"
        
        APIClient.shared.getArray(urlString: urlString, success: {(code, arrayOfGroups) in
            success(code, arrayOfGroups)
        }) { (code) in
            failure(code)
        }
    }
}
