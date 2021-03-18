//
//  FavGroupsPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class FavGroupsPresenter: FavGroupsPresenterProtocol {
    
    var view: FavGroupsViewController?
    var interactor: FavGroupsInteractor?
    var router: FavGroupsRouter?
    
    func viewDidLoad() {
        
        view?.setupUI()
    }
}
