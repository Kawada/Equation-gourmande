//
//  RESTClient.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 01/02/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

public class RESTClient: Client {
    
    func getRecipe(id: Int) -> [String : [String : String]] {
        
        var recipe:[String : [String : String]] = ["toto" : ["toto1" : "toto1value"]]
        
        request(.GET, "\(WebServiceConstants.ONE_RECIPE_URL)\(id)")
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
                
                recipe = ["totomod" : ["toto1mod" : "toto1valuemod"]]
                
                // recipe = (response as [String : [String : String]])
        }
        
        return recipe
        
    }
    
}
