//
//  GroupImagesInteractor.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import Foundation

class GroupImagesInteractor: GroupImagesInteractorProtocol {
    
    var presenter: GroupImagesPresenter?
    
    var groupId: Int?
    var groupImages: GroupImages?
    
    func loadGroupImages() {
        
        guard let id = groupId else { return }
        
        GroupImagesService.shared.getGroupImages(id: id, success: { (images) in
            self.groupImages = images
            self.presenter?.fetchGroupImagesSuccess(images: images)
        })
    }
}
