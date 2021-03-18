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
}

protocol FavGroupsInteractorProtocol {
    
    var presenter: FavGroupsPresenter? {get set}
}

protocol FavGroupsRouterProtocol {
    
    static func createModule() -> UIViewController
}
