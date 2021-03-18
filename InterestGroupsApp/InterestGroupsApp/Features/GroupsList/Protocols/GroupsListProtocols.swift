//
//  GroupsListProtocols.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

protocol GroupsListPresenterProtocol {
    
    var view: GroupsListViewController? {get set}
    var interactor: GroupsListInteractor? {get set}
    var router: GroupsListRouter? {get set}
    
    func viewDidLoad()
    func refreshGroups()
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func setNameLabelText(indexPath: IndexPath) -> String?
    func setDateLabelText(indexPath: IndexPath) -> String?
    func setDescriptionLabelText(indexPath: IndexPath) -> String?
    func setImageView(indexPath: IndexPath) -> UIImage?
    func fetchGroupsListSuccess(groups: [GroupInfo])
    func fetchGroupsListFailure(errorCode: Int)
    func goToGroupDetail(groupDetail: GroupInfo)
    func goToFavGroups()
}

protocol GroupsListInteractorProtocol {
    
    var presenter: GroupsListPresenter? {get set}
    
    var groupsList: [GroupInfo]? {get set}
    
    func loadGroupsList()
    func recoverGroupDetailByIndex(index: Int)
}

protocol GroupsListRouterProtocol {
    
    static func createModule() -> UINavigationController
    func pushToGroupDetailView(view: GroupsListViewController, groupDetail: GroupInfo)
    func pushToFavGroupsView(view: GroupsListViewController)
}
