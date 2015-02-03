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
    
    private var recipeService : RecipeService!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        recipeService = RecipeServiceImpl()
        
        
        println("appel du ws")
        // Chargement asynchrone de la recette
        recipeService.getRecipe(1, completionHandler: {
            recipe in
            
            self.titleLabel.text = recipe.title
            self.descriptionTextView.text = recipe.description
            // self.myImage.image = UIImage(named: recipe.photos[0]?[1] as String)
            
        })
        //println("valeur récupérée : \(test)")
        println("-----------------")
        
        
        // Mise en place de la disposition par défaut
        photoDisposition = CGRectMake(myImage.frame.minX, myImage.frame.minY, myImage.frame.size.width, myImage.frame.size.height)
        // Initialisation de l'UIImageViewModeScaleAspect
        myImage = UIImageViewModeScaleAspect(frame: photoDisposition)
        
        
        
        titleLabel.text = "Chargement...";
        descriptionTextView.text = "Chargement en cours"

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

