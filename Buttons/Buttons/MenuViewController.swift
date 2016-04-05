//
//  MenuViewController.swift
//  Buttons
//
//  Created by Luca on 4/2/16.
//  Copyright © 2016 Space!, Ink. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        let menuBackgroundColor = UIColor(red: 1, green: 200/255, blue: 0, alpha: 1)
        self.view.backgroundColor = menuBackgroundColor
        
        // Create play button
        createPlayButton()
    }
    
    func buttonAction(sender: UIButton!) {
        // Recognizing button
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            // Go to GameSceen
            self.performSegueWithIdentifier("toGameView", sender: self)
        }
    }
    
    func createPlayButton() {
        
        // Create colors
        let customFillColor = UIColor(red: 1, green: 108/255, blue: 0, alpha: 1)
        //let customStrokeColor = UIColor(red: 178/255, green: 75/255, blue: 0, alpha: 1)
        
        // Create a button
        //let button = SKShapeNode()
        let button = UIButton(type: UIButtonType.System) as UIButton
        
        // Created rounded corners and position button
        //button.path = UIBezierPath(roundedRect: CGRect(x: view.bounds.width/2, y: view.bounds.height/2, width: view.bounds.width/2, height: 20), cornerRadius: 4).CGPath
        //button.frame(roundedRect: CGRectMake(x: view.bounds.width/2, y: view.bounds.height/2, width: view.bounds.width/2, height: 20), cornerRadius: 4).CGPath
        button.frame = CGRectMake(view.bounds.width/2, view.bounds.height/2, view.bounds.width/2, 20)
     
        // Coloring and design
        //button.fillColor = customFillColor
        button.backgroundColor = customFillColor
        //button.strokeColor = customStrokeColor
        //button.lineWidth = 3
        
        // Define some properties
        button.setTitle("playButton", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(MenuViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = 1
        
        // Add the button to the array and to the scene
        self.view.addSubview(button)

    }
}