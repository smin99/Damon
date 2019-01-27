//
//  User.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import Foundation
class User {
    var ID: Int64!
    var Name: String!
    var Sex: Int!
    var Age: Int!
    var Latitude: Double!
    var Longitude: Double!
    
    init(ID: Int64 = 0, Name: String = "", Sex: Int = 0, Age: Int = 0, Latitude: Double = 0.0, Longitude: Double = 0.0) {
        self.ID = ID
        self.Name = Name
        self.Sex = Sex
        self.Age = Age
        self.Latitude = Latitude
        self.Longitude = Longitude
    }
}
