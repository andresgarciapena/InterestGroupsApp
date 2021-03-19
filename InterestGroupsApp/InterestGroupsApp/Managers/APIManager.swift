//
//  APIManager.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return Constants.URL.baseUrl
    }()
}
