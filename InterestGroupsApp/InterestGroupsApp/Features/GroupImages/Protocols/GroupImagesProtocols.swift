//
//  GroupImagesProtocols.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

protocol GroupImagesPresenterProtocol {
    
    var view: GroupImagesViewController? {get set}
    var interactor: GroupImagesInteractor? {get set}
    var router: GroupImagesRouter? {get set}
    
    func viewDidLoad()
}

protocol GroupImagesInteractorProtocol {
    
    var presenter: GroupImagesPresenter? {get set}
    var groupId: Int? {get set}
}

protocol GroupImagesRouterProtocol {
    
    static func createModule(id: Int) -> UIViewController
}
