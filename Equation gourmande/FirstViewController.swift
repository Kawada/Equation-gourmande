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
    
    private var myImage : UIImageViewModeScaleAspect!
    private var photoDisposition : CGRect!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mise en place de la disposition par défaut
        photoDisposition = CGRectMake(self.view.frame.minX, self.view.frame.minY, self.view.frame.size.width, self.view.frame.size.height / 2)
        
        titleLabel.text = "Sandwitch au caca";
        descriptionTextView.text = "Cette semaine nous allons voir la recette du sandwitch au caca. La recette de la poire à lavement d'hier" +
                                   "a eu beaucoup de succès.\n" +
                                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nUne tombola pour gagner son sandwitch au caca est prévue le 16 février 2015 à 13h ! \nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

        myImage = UIImageViewModeScaleAspect(frame: photoDisposition)
        myImage.contentMode = .ScaleAspectFill // Add the first contentMode
        
        NSLog("Image disponible ?")
        if let image = UIImage(named: "photo_main_example") {
            NSLog("oui")
            NSLog("Tentative d'ajout de l'image")
            myImage.image = image
            myImage.backgroundColor = UIColor.blackColor()
            self.view.addSubview(myImage)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("animateImage:"))
        myImage.addGestureRecognizer(tap);
    }
    
    func animateImage(recognizer:UITapGestureRecognizer) {
        ////////////////////////
        //
        // Use automatic function to animate
        //
        ////////////////////////
        
        if myImage.contentMode == .ScaleAspectFit {
            myImage.animateToScaleAspectFillToFrame(photoDisposition, withDuration: 0.4, afterDelay: 0.0)
        }
        else {
            myImage.animateToScaleAspectFitToFrame(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), withDuration: 0.4, afterDelay: 0.0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

