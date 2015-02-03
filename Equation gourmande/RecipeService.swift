//
//  RecipeService.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 03/02/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

protocol RecipeService {
    
    func getRecipe(id: Int, completionHandler: (recipe: Recipe) -> ())
    
}