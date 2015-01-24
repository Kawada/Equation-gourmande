//
//  FirstViewController.swift
//  Equation gourmande
//
//  Created by Dimitri Leguis on 22/01/2015.
//  Copyright (c) 2015 FST. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = "BLA";
        descriptionTextView.text = "Bla description";

        
        if let image = UIImage(named: "photo_main_example") {
            photoImageView?.image = image;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

