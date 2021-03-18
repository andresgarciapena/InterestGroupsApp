//
//  GroupImagesService.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 18/03/2021.
//

import ObjectMapper
import Alamofire

class GroupImagesService {
    
    static let shared = { GroupImagesService() }()
    
    func getGroupImages(id: Int, success: @escaping (GroupImages) -> ()) {
        
        let urlString = self.configureUrlApi(baseUrl: "https://practica-slashmobility.firebaseio.com/", value: "images/\(id).json")
        
        let request = AF.request(urlString)
        
        request.responseJSON { (response) in
            guard let images = response.value else { return }
            success(self.parseResponse(array: images))
        }
    }
    
    func configureUrlApi(baseUrl: String, value: String) -> String {
        return baseUrl + value
    }
    
    func parseResponse(array: Any) -> GroupImages {
        var images = GroupImages()
        if let arrayImages = array as? [String] {
            images.arrayImages = arrayImages
        }
        return images
    }
}

