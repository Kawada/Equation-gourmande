//
//  RecipeServiceImpl.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 03/02/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

class RecipeServiceImpl: RecipeService {
    
    private let database : LevelDB!
    
    private let client : Client!
    
    init() {
        // Création / chargement de la base locale
        database = DatabaseFactory.loadDatabase();
        client = RESTClient()
    }
    
    func getRecipe(id: Int, completionHandler: (recipe: Recipe) -> ()) {
        client.getRecipe(id, completionHandler: {
            jsonRecipe in
            
            let title = jsonRecipe[String(id)]?["title"] as? String
            let description = jsonRecipe[String(id)]?["description"] as? String
            let photos = jsonRecipe[String(id)]?["photo"] as? NSDictionary
            
            var recipe: Recipe = Recipe(id: id, title: title, description: description, photos: photos)
            
            //controller.titleLabel.text = recipe[String(id)]?["title"] as? String
            //controller.descriptionTextView.text = recipe[String(id)]?["description"] as? String
            
            completionHandler(recipe: recipe)
        })
    }

}
