//
//  Extension.swift
//  CovidStatus
//
//  Created by baris on 10.05.2020.
//  Copyright © 2020 baris. All rights reserved.
//

import Foundation

extension Int {
    func formatNumber() -> String {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension Int64 {
    func formatNumber() -> String {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self))!
    }
}

