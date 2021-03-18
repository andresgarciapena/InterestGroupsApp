//
//  FavGroupsPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit
import RealmSwift

class FavGroupsPresenter: FavGroupsPresenterProtocol {
    
    var view: FavGroupsViewController?
    var interactor: FavGroupsInteractor?
    var router: FavGroupsRouter?
    
    var groupsList: [GroupInfo]?
    
    func viewDidLoad() {
        
        view?.setupUI()
    }
    
    func viewWillAppear() {
        
        readFromRealm()
        view?.tableView.reloadData()
    }
    
    func readFromRealm() {
        
        groupsList = []
        let realm = try! Realm()
        let results = realm.objects(GroupInfo.self)
        if results.isEmpty {
            view?.showLabel()
        } else {
            for item in results {
                groupsList?.append(item)
            }
            view?.showGroupTable()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        
        return groupsList?.count ?? 0
    }
    
    func didSelectRowAt(index: Int) {
        guard let group = groupsList?[index] else { return }
        interactor?.recoverGroupDetailByIndex(group: group)
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
    
    func goToGroupDetail(groupDetail: GroupInfo) {
        guard let gListView = view else { return }
        router?.pushToGroupDetailView(view: gListView, groupDetail: groupDetail)
    }
}
