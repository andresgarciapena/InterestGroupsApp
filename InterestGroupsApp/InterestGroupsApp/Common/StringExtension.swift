//
//  StringExtension.swift
//  InterestGroupsApp
//
//  Created by Andres Garcia on 17/03/2021.
//

import Foundation

extension String {
    
    func convertTimestamp(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        return formatter.string(from: date as Date)
    }
}
