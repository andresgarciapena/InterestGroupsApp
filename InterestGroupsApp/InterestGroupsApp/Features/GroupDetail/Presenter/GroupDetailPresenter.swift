//
//  GroupDetailPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit
import RealmSwift

class GroupDetailPresenter: GroupDetailPresenterProtocol {
    
    var view: GroupDetailViewController?
    var interactor: GroupDetailInteractor?
    var router: GroupDetailRouter?
    
    var groupDetail: GroupInfo?
    
    func viewDidLoad() {
        
        view?.setupUI()
        view?.groupDetail = self.groupDetail
    }
    
    func viewWillAppear() {
        
        view?.configureView()
        setImageAndDate()
    }
    
    func setImageAndDate() {
        guard let urlImage = groupDetail?.defaultImageUrl else { return }
        view?.setGroupImage(image: UIImage().urlToImage(urlString: urlImage))
        guard let timestamp = groupDetail?.date else { return }
        view?.setDate(date: String().convertTimestamp(serverTimestamp: timestamp))
    }
    
    func addRemoveGroupToFavList(state: Bool) {
        
        interactor?.addOrRemoveFavGroup(state: state)
    }
    
    func addToFavList() {
        
        view?.addGroupToFavList()
    }
    
    func removeFromFavList() {
        
        guard let group = groupDetail else { return }
        
        let realm = try! Realm()
        let results = realm.objects(GroupInfo.self)
        for item in results {
            if group.isEqual(item) {
                try! realm.write {
                    realm.delete(item)
                }
            }
        }
        view?.removeGroupFromFavList()
    }
    
    func addGroupToFavList() {
        
        guard let group = groupDetail else { return }
        
        let realm = try! Realm()
        realm.beginWrite()
        realm.add(group, update: Realm.UpdatePolicy.modified)
        if realm.isInWriteTransaction {
            try! realm.commitWrite()
        }
    }
    
    func goToGroupImages() {
        guard let gImagesView = view, let id = groupDetail?.id else { return }
        router?.pushToGroupImagesView(view: gImagesView, id: id)
    }
}
