//
//  GroupsListInteractor.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import Foundation

class GroupsListInteractor: GroupsListInteractorProtocol {
    
    var presenter: GroupsListPresenter?
    
    var groupsList: [GroupInfo]?
    
    func loadGroupsList() {
        
        GroupsListService.shared.getGroupsList(success: { (code, groups) in
            self.groupsList = groups
            self.presenter?.fetchGroupsListSuccess(groups: groups)
            print(groups[0])
        }) { (code) in
            print(code)
        }
        //presenter?.fetchGroupsListSuccess()
    }
}
