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
        
        // Create colors
        let customFillColor = UIColor(red: 1, green: 108/255, blue: 0, alpha: 1)
        let customStrokeColor = UIColor(red: 178/255, green: 75/255, blue: 0, alpha: 1)
        
        // Create a button
        let button = SKShapeNode()
        
        // Created rounded corners and position button
        let spacingFactor = CGFloat(4.5)/CGFloat(buttonTotal)
        //let yPos = (((size.height - 10)/(CGFloat(buttonTotal))) + (CGFloat(2 * buttonCount) * ((size.height/(CGFloat(2 * buttonTotal))) - spacingFactor)))
        let xPos = (((size.width - 10)/(CGFloat(buttonTotal))) + (CGFloat(2 * buttonCount) * ((size.width/(CGFloat(2 * buttonTotal))) - spacingFactor)))
        //button.path = UIBezierPath(roundedRect: CGRect(x: 5, y: size.height - 5 - yPos, width: size.width - 10, height: ((size.height - 10)/(CGFloat(buttonTotal)) - (spacingFactor * CGFloat(buttonTotal)))), cornerRadius: 4).CGPath
        button.path = UIBezierPath(roundedRect: CGRect(x: size.width - 5 - xPos, y: 5, width: ((size.width - 10)/(CGFloat(buttonTotal)) - (spacingFactor * CGFloat(buttonTotal))), height: size.height - 10), cornerRadius: 4).CGPath
        
        
        // Coloring and design
        button.fillColor = customFillColor
        button.strokeColor = customStrokeColor
        button.lineWidth = 3
        
        // Define some properties
        if CGFloat((buttonCount + 1)) == rand {
            button.name = "good"
        } else {
            button.name = "bad"
        }
        print(rand)
        print(buttonCount + 1)
        print(button.name)
        button.userInteractionEnabled = false
        
        // Add the button to the array and to the scene
        shapeNodes.append(button)
        addChild(button)

    }
}