//
//  DatabaseFactory.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 31/01/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import Foundation

public class DatabaseFactory {
    class func loadDatabase() -> LevelDB {
        return LevelDB.databaseInLibraryWithName(DatabaseConstants.DATABASE_NAME, andOptions: LevelDBOptions(createIfMissing: true, createIntermediateDirectories: true, errorIfExists: false, paranoidCheck: false, compression: false, filterPolicy: Int32(), cacheSize: 15)) as LevelDB
    }
}