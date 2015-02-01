//
//  Client.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 01/02/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

protocol Client {
    func getRecipe(id:Int) -> [String:[String:String]]
}