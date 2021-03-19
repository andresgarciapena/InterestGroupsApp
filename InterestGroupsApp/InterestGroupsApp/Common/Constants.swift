//
//  Constants.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 19/03/2021.
//

import Foundation

struct Constants {
    
    struct URL {
        
        static let baseUrl = "https://practica-slashmobility.firebaseio.com/"
    }
    
    struct Routes {
        
        static let api = "groups.json"
    }
    
    struct StringText {
        
        static let navTitle = "Practica"
        static let downloadingText = "Descargando grupos..."
    }
    
    struct CellIds {
        
        static let groupCellId = "GroupTableViewCell"
    }
}
