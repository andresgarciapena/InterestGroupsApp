//
//  GroupsListInteractor.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import Foundation

class GroupsListInteractor: GroupsListInteractorProtocol {
    
    var presenter: GroupsListPresenter?
    
    func loadGroupsList() {
        
        presenter?.fetchGroupsListSuccess()
    }
}
