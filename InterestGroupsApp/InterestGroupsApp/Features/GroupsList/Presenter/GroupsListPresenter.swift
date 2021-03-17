//
//  GroupsListPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

class GroupsListPresenter: GroupsListPresenterProtocol {
    
    var view: GroupsListViewController?
    var interactor: GroupsListInteractor?
    var router: GroupsListRouter?
    
    var groupsList: [GroupInfo]?
    
    func viewDidLoad() {
        
        view?.showHUD()
        interactor?.loadGroupsList()
    }
    
    func refreshGroups() {
        
        view?.showHUD()
        interactor?.loadGroupsList()
    }
    
    func numberOfRowsInSection() -> Int {
        
        return groupsList?.count ?? 3
    }
    
    func setNameLabelText(indexPath: IndexPath) -> String? {
        guard let groupsList = self.groupsList else { return nil }
        
        return groupsList[indexPath.row].name
    }
    
    func setDateLabelText(indexPath: IndexPath) -> String? {
        guard let groupsList = self.groupsList else { return nil }
        
        return interactor?.convertTimestamp(serverTimestamp: Double(groupsList[indexPath.row].date!))
    }
    
    func setDescriptionLabelText(indexPath: IndexPath) -> String? {
        guard let groupsList = self.groupsList else { return nil }
        
        return groupsList[indexPath.row].descriptionShort
    }
    
    func setImageView(indexPath: IndexPath) -> UIImage? {
        guard let groupsList = self.groupsList else { return nil }
        
        guard let urlImage = groupsList[indexPath.row].defaultImageUrl else { return nil }
        
        return UIImage().urlToImage(urlString: urlImage)
    }
    
    func fetchGroupsListSuccess(groups: [GroupInfo]) {
        self.groupsList = groups
        view?.hideHUD()
        view?.onFetchGroupsListSuccess()
    }
    
    func fetchGroupsListFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchGoupsListFailure(popup: PopupDialogView().showResultPopup())
    }
}
