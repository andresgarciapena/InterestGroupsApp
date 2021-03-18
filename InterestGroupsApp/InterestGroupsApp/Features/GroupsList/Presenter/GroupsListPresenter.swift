//
//  GroupsListPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit
import RealmSwift

class GroupsListPresenter: GroupsListPresenterProtocol {
    
    var view: GroupsListViewController?
    var interactor: GroupsListInteractor?
    var router: GroupsListRouter?
    
    var groupsList: [GroupInfo]?
    var realmGroupList: [GroupInfo]?
    
    func viewDidLoad() {
        
        view?.showHUD()
        interactor?.loadGroupsList()
        readFromRealm()
    }
    
    func refreshGroups() {
        
        view?.showHUD()
        interactor?.loadGroupsList()
    }
    
    func numberOfRowsInSection() -> Int {
        
        return groupsList?.count ?? 0
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.recoverGroupDetailByIndex(index: index)
    }
    
    func setNameLabelText(indexPath: IndexPath) -> String? {
        guard let groupsList = self.groupsList else { return nil }
        
        return groupsList[indexPath.row].name
    }
    
    func setDateLabelText(indexPath: IndexPath) -> String? {
        guard let groupsList = self.groupsList else { return nil }
        
        return String().convertTimestamp(serverTimestamp: groupsList[indexPath.row].date)
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
    
    func goToGroupDetail(groupDetail: GroupInfo) {
        guard let gListView = view else { return }
        guard let realmList = realmGroupList else { return }
        let fav = realmList.contains(groupDetail)
        router?.pushToGroupDetailView(view: gListView, groupDetail: groupDetail, state: fav)
    }
    
    func goToFavGroups() {
        guard let fGroupsView = view else { return }
        router?.pushToFavGroupsView(view: fGroupsView)
    }
    
    func readFromRealm() {
        
        realmGroupList = []
        let realm = try! Realm()
        let results = realm.objects(GroupInfo.self)
        for item in results {
            realmGroupList?.append(item)
        }
    }
}
