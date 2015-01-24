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
    @IBOutlet var photoImageView: UIImageViewModeScaleAspect!
    
    var myImage : UIImageViewModeScaleAspect!;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = "BLA";
        descriptionTextView.text = "Bla description"

        NSLog("Image disponible ?")
        if let image = UIImage(named: "photo_main_example") {
            NSLog("oui")
            NSLog("Tentative d'ajout de l'image")
            photoImageView.image = image
        }
        
        myImage = UIImageViewModeScaleAspect(frame: CGRectMake(self.view.frame.minX, self.view.frame.minY, self.view.frame.size.width, self.view.frame.size.height / 2))
        myImage.contentMode = .ScaleAspectFill // Add the first contentMode
        myImage.image = UIImage(named: "photo_main_example")
        myImage.backgroundColor = UIColor.blackColor()
        self.view.addSubview(myImage)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("animateImage:"))
        self.view.addGestureRecognizer(tap);
    }
    
    func animateImage(recognizer:UITapGestureRecognizer) {
        ////////////////////////
        //
        // Use automatic function to animate
        //
        ////////////////////////
        
        if myImage.contentMode == .ScaleAspectFit {
            myImage.animateToScaleAspectFillToFrame(CGRectMake(self.view.frame.minX, self.view.frame.minY, self.view.frame.size.width, self.view.frame.size.height / 2), withDuration: 0.4, afterDelay: 0.0)
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

