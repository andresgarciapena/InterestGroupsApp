//
//  GroupDetailInteractor.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import Foundation

class GroupDetailInteractor: GroupDetailInteractorProtocol {
    
    var presenter: GroupDetailPresenter?
    
    var groupDetail: GroupInfo?
    
    func addOrRemoveFavGroup(state: Bool) {
        
        if state {
            presenter?.addToFavList()
        } else {
            presenter?.removeFromFavList()
        }
    }
}
