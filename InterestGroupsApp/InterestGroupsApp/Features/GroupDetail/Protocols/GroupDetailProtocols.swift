//
//  GroupDetailProtocols.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

protocol GroupDetailPresenterProtocol {
    
    var view: GroupDetailViewController? {get set}
    var interactor: GroupDetailInteractor? {get set}
    var router: GroupDetailRouter? {get set}
    var groupDetail: GroupInfo? {get set}
    
    func viewDidLoad()
    func viewWillAppear()
    func setImageAndDate()
    func addRemoveGroupToFavList(state: Bool)
    func addToFavList()
    func removeFromFavList()
    func addGroupToFavList()
    func goToGroupImages()
}

protocol GroupDetailInteractorProtocol {
    
    var presenter: GroupDetailPresenter? {get set}
    
    var groupDetail: GroupInfo? {get set}
}

protocol GroupDetailRouterProtocol {
    
    static func createModule(groupDetail: GroupInfo, state: Bool) -> UIViewController
    func pushToGroupImagesView(view: GroupDetailViewController, id: Int)
}
