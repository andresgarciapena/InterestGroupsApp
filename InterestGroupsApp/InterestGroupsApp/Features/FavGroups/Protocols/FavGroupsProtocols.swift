//
//  FavGroupsProtocols.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

protocol FavGroupsPresenterProtocol {
    
    var view: FavGroupsViewController? {get set}
    var interactor: FavGroupsInteractor? {get set}
    var router: FavGroupsRouter? {get set}
    
    func viewDidLoad()
    func viewWillAppear()
    func readFromRealm()
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func setNameLabelText(indexPath: IndexPath) -> String?
    func setDateLabelText(indexPath: IndexPath) -> String?
    func setDescriptionLabelText(indexPath: IndexPath) -> String?
    func setImageView(indexPath: IndexPath) -> UIImage?
    func goToGroupDetail(groupDetail: GroupInfo)
}

protocol FavGroupsInteractorProtocol {
    
    var presenter: FavGroupsPresenter? {get set}
    
    func recoverGroupDetailByIndex(group: GroupInfo)
}

protocol FavGroupsRouterProtocol {
    
    static func createModule() -> UIViewController
    func pushToGroupDetailView(view: FavGroupsViewController, groupDetail: GroupInfo)
}
