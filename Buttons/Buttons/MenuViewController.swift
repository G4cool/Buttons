//
//  MenuViewController.swift
//  Buttons
//
//  Created by Luca on 4/2/16.
//  Copyright © 2016 Space!, Ink. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        let menuBackgroundColor = UIColor(red: 1, green: 200/255, blue: 0, alpha: 1)
        self.view.backgroundColor = menuBackgroundColor
        
        // Create Play Button
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.performSegueWithIdentifier("toGameView", sender: self)
        
    }
    
    func createPlayButton() {
        
    }
}