//
//  GroupsListRouter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

class GroupsListRouter: GroupsListProtocol {
    
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
}
