//
//  GroupsListRouter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

class GroupsListRouter: GroupsListRouterProtocol {
    
    static func createModule() -> UINavigationController {
        
        let viewController = GroupsListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: GroupsListPresenter = GroupsListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = GroupsListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = GroupsListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToGroupDetailView(view: GroupsListViewController, groupDetail: GroupInfo) {
        
        let groupDetailViewController = GroupDetailRouter.createModule(groupDetail: groupDetail)
        
        view.navigationController?.pushViewController(groupDetailViewController, animated: true)
    }
    
    func pushToFavGroupsView(view: GroupsListViewController) {
        
        let favGroupsViewController = FavGroupsRouter.createModule()
        
        view.navigationController?.pushViewController(favGroupsViewController, animated: true)
    }
}
