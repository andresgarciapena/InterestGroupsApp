//
//  FavGroupsRouter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class FavGroupsRouter: FavGroupsRouterProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = FavGroupsViewController()
        
        let presenter: FavGroupsPresenter = FavGroupsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FavGroupsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = FavGroupsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
