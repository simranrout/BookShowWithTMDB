//
//  AnalyticsManager.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 27/08/21.
//


import Foundation
import FirebaseAnalytics

//Making it singleton class
final class AnalyticsManager {
    
    //creating Instance
    static let shared = AnalyticsManager()
    
    //Making Initializer Private
    private init(){}
    
    let analytics: Void = Analytics.logEvent("", parameters: [:])
}

