//
//  ImageExtension.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import UIKit

extension UIImage {
    
    func urlToImage(urlString: String) -> UIImage {
        var imageToShow = UIImage()
        if let imageUrl = URL(string: urlString) {
            let imageData = try! Data(contentsOf: imageUrl)
            if let image = UIImage(data: imageData) {
                imageToShow = image
            }
        }
        return imageToShow
    }
}
