//
//  GroupsListPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import Foundation

class GroupsListPresenter: GroupsListPresenterProtocol {
    
    var view: GroupsListViewController?
    var interactor: GroupsListInteractor?
    var router: GroupsListRouter?
    
    var groupsList: [String]?
    
    func viewDidLoad() {
        
        interactor?.loadGroupsList()
    }
    
    func numberOfRowsInSection() -> Int {
        
        return groupsList?.count ?? 3
    }
    
    func fetchGroupsListSuccess() {
        
    }
}
