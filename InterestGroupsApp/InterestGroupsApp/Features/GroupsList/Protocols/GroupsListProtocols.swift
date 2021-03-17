//
//  GroupsListProtocols.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

protocol GroupsListProtocol {
    
}

protocol GroupsListPresenterProtocol {
    
    var view: GroupsListViewController? {get set}
    var interactor: GroupsListInteractor? {get set}
    var router: GroupsListRouter? {get set}
    
    func viewDidLoad()
}

protocol GroupsListInteractorProtocol {
    
    var presenter: GroupsListPresenter? {get set}
}

protocol GroupsListRouterProtocol {
    
}
