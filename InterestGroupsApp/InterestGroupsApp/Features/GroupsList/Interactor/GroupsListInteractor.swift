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
        }) { (code) in
            self.presenter?.fetchGroupsListFailure(errorCode: code)
        }
    }
    
    func recoverGroupDetailByIndex(index: Int) {
        guard let groupDetail = self.groupsList?[index] else {
            return
        }
        self.presenter?.goToGroupDetail(groupDetail: groupDetail)
    }
    
    func convertTimestamp(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        return formatter.string(from: date as Date)
    }
}
