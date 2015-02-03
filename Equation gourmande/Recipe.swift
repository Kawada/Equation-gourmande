//
//  Recipe.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 03/02/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

class Recipe {
    
    var id: Int
    var title: String
    var description: String
    var photos: NSDictionary
    
    init(id: Int, title: String?, description: String?, photos: NSDictionary?) {
        self.id = id
        self.title = title!
        self.description = description!
        self.photos = photos!
    }
}