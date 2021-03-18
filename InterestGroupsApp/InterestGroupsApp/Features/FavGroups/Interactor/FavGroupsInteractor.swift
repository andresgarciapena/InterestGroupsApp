//
//  FavGroupsInteractor.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import Foundation

class FavGroupsInteractor: FavGroupsInteractorProtocol {
    
    var presenter: FavGroupsPresenter?
    
    func recoverGroupDetailByIndex(group: GroupInfo) {
        
        self.presenter?.goToGroupDetail(groupDetail: group)
    }
}
