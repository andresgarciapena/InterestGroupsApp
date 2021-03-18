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
    
    var groupImages: GroupImages?
    var actualId: Int?
    
    func viewDidLoad() {
        
        view?.setupUI()
        interactor?.loadGroupImages()
    }
    
    func viewWillDisappear() {
        
        view?.restartNavigationBar()
    }
    
    func fetchGroupImagesSuccess(images: GroupImages) {
        self.groupImages = images
        guard let image = images.arrayImages?[0] else { return }
        actualId = 0
        view?.imagesView.image = UIImage().urlToImage(urlString: image)
    }
    
    func showNextImage() {
        guard let imagesCount = groupImages?.arrayImages?.count, let id = actualId else { return }
        if imagesCount > id + 1 {
            self.actualId! += 1
            guard let image = groupImages?.arrayImages?[id+1] else { return }
            view?.imagesView.image = UIImage().urlToImage(urlString: image)
        }
    }
    
    func showPreviousImage() {
        guard let id = actualId else { return }
        if id - 1 >= 0 {
            self.actualId! -= 1
            guard let image = groupImages?.arrayImages?[id-1] else { return }
            view?.imagesView.image = UIImage().urlToImage(urlString: image)
        }
    }
}
