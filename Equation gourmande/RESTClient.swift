//
//  RESTClient.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 01/02/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

public class RESTClient: Client {
    
    func getRecipe(id: Int, completionHandler: (jsonRecipe: NSDictionary) -> ()) {
        
        request(.GET, "\(WebServiceConstants.ONE_RECIPE_URL)\(id)")
        .responseJSON { (request, response, JSON, error) in
                println(JSON)
            
            
            if let recipe = JSON as? NSDictionary {
                
                completionHandler(jsonRecipe: recipe)
                
            }
            else {
                println("impossible de caster le JSON")
            }
            
        }
                
    }
    
    func getRecipesOfTheWeek(controller: FirstViewController) {
        request(.GET, "\(WebServiceConstants.ALL_RECIPES_OF_THE_WEEK_URL)")
        .responseJSON { (request, response, JSON, error) in
                println(JSON)
                
            
            if let recipes = JSON as? NSDictionary {
                
                for recipe in recipes {
                    // controller.datepicker =
                }
            }
            else {
                println("impossible de caster le JSON")
            }
            
                
        }
    }
    
}
