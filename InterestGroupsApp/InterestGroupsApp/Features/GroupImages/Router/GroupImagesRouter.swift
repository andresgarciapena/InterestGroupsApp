//
//  GroupImagesRouter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class GroupImagesRouter: GroupImagesRouterProtocol {
    
    static func createModule(id: Int) -> UIViewController {
        
        let viewController = GroupImagesViewController()
        
        let presenter: GroupImagesPresenter = GroupImagesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = GroupImagesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = GroupImagesInteractor()
        viewController.presenter?.interactor?.groupId = id
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
