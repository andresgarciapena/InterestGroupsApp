//
//  GroupDetailRouter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

class GroupDetailRouter: GroupDetailRouterProtocol {
    
    static func createModule(groupDetail: GroupInfo, state: Bool) -> UIViewController {
        
        let viewController = GroupDetailViewController()
        
        let presenter: GroupDetailPresenter = GroupDetailPresenter()
        
        viewController.presenter = presenter
        viewController.favButtonPressed = state
        viewController.presenter?.router = GroupDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.groupDetail = groupDetail
        viewController.presenter?.interactor = GroupDetailInteractor()
        viewController.presenter?.interactor?.groupDetail = groupDetail
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushToGroupImagesView(view: GroupDetailViewController, id: Int) {
        
        let groupImagesViewController = GroupImagesRouter.createModule(id: id)
        
        view.navigationController?.pushViewController(groupImagesViewController, animated: true)
    }
}
