//
//  GroupImagesPresenter.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import UIKit

class GroupImagesPresenter: GroupImagesPresenterProtocol {
    
    var view: GroupImagesViewController?
    var interactor: GroupImagesInteractor?
    var router: GroupImagesRouter?
    
    func viewDidLoad() {
        
        view?.setupUI()
    }
}
