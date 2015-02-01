//
//  FirstViewController.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 22/01/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import UIKit
// import Foundation


class FirstViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var datepicker: DIDatepicker!
    @IBOutlet var myImage: UIImageViewModeScaleAspect!
    
    private var photoDisposition : CGRect!
    
    private var database : LevelDB!
    
    private let client : Client = RESTClient()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("appel du ws")
        var test = client.getRecipe(2)
        println("valeur récupérée : \(test)")
        println("-----------------")
        
        
        // Mise en place de la disposition par défaut
        photoDisposition = CGRectMake(myImage.frame.minX, myImage.frame.minY, myImage.frame.size.width, myImage.frame.size.height)
        // Initialisation de l'UIImageViewModeScaleAspect
        myImage = UIImageViewModeScaleAspect(frame: photoDisposition)
        
        // Création / chargement de la base locale
        database = DatabaseFactory.loadDatabase();
        
        println("entrée en base existante ?")
        if let entry: AnyObject = database["31-01-2015"] {
            println("Oui")
            var test1:AnyObject! = entry["title"]
            println("title : \(test1)")
            
        }
        else {
            println("Non")
            
            var entry:[String: [String: String]] = ["31-01-2015" : ["title" : "Sandwitch au caca original", "desc" : "Le seul, l'unique", "photo" : "photo-main-example"]]
            
            database.addEntriesFromDictionary(entry)
            
            
            //database["31-01-2015"]["image"] = ("photo-main-example" as AnyObject)
            //database["31-01-2015"]["title"] = ("Sandwitch au caca" as AnyObject)
            
            

            var test:AnyObject! = database.valueForKey("31-01-2015");
            
            println("objet récupéré : \(test)");
            
            for item in database.allKeys() {
                println("\(item)")
            }
        }
        
        titleLabel.text = "Sandwitch au caca";
        descriptionTextView.text = "Cette semaine nous allons voir la recette du sandwitch au caca. La recette de la poire à lavement d'hier" +
                                   "a eu beaucoup de succès.\n" +
                                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nUne tombola pour gagner son sandwitch au caca est prévue le 16 février 2015 à 13h ! \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

        // myImage = UIImageViewModeScaleAspect(frame: photoDisposition)
        myImage.contentMode = .ScaleAspectFill // Add the first contentMode
        
        // datepicker = DIDatepicker(frame: CGRectMake(self.view.frame.minX, self.view.frame.minY, self.view.frame.size.width, photoDisposition.height + 30));
        //[self.datepicker addTarget:self action:@selector(updateSelectedDate) forControlEvents:UIControlEventValueChanged];
        //datepicker.addTarget(self, action: Selector(":updateSelectedDate"), forControlEvents: .ValueChanged);
        //datepicker.fillCurrentYear();
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date:NSDate = dateFormatter.dateFromString("08-02-2015")!
        
        datepicker.dates = [NSDate(), date]
        datepicker.selectDateAtIndex(0);
        
        
        NSLog("Image disponible ?")
        if let image = UIImage(named: "photo_third_example") {
            NSLog("oui")
            NSLog("Tentative d'ajout de l'image")
            myImage.image = image
            myImage.backgroundColor = .blackColor()
            self.view.addSubview(myImage)
        }
        else {
            NSLog("non");
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("animateImage:"))
        myImage.addGestureRecognizer(tap);
    }
    
    func animateImage(recognizer:UITapGestureRecognizer) {

        if myImage.contentMode == .ScaleAspectFit {
            myImage.animateToScaleAspectFillToFrame(photoDisposition, withDuration: 0.4, afterDelay: 0.0)
        }
        else {
            myImage.animateToScaleAspectFitToFrame(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), withDuration: 0.4, afterDelay: 0.0)
        }
    }
    
    func updateSelectedDate(recognizer:UITapGestureRecognizer) {
        var formatter: NSDateFormatter = NSDateFormatter();
        formatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("EEEEddMMMM", options: 0, locale: nil);
    
        // self.selectedDateLabel.text = [formatter stringFromDate:self.datepicker.selectedDate];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

