//
//  Calculate Class : Entry Struct.swift
//  Tipsy Driver
//
//  Created by Nathan Standage on 10/15/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import Foundation

enum CalculateError: Error {
    case Error1234
}


struct Entry {
    var hoursWorked: Double
    var tips: Double
    let date: Date
    
}

class Calculate {
    
    static func dailyHourly(entry: Entry) -> String {
        let finalTotal = rounded(entry.tips / entry.hoursWorked)
        return "\(finalTotal)"
    }

    
    static func totalHourly(entries: [Entry]) -> String {
        
        var totalHours: Double = 0
        var totalTips: Double = 0
        
        for currentEntry in entries {
            
            totalTips += currentEntry.tips
            totalHours += currentEntry.hoursWorked
        }
        
        let finalTotal = rounded(totalTips / totalHours)
        return "\(finalTotal)"
    }
    
    static func rounded(_ number: Double) -> Double {
        
        return round(100 * number) / 100
    }
}

