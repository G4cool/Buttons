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
    
    func buttonAction(_ sender: UIButton!) {
        // Recognizing button
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            // Go to GameSceen
            self.performSegue(withIdentifier: "toGameView", sender: self)
        }
    }
    
    func createPlayButton() {
        
        // Create colors
        let customFillColor = UIColor(red: 1, green: 108/255, blue: 0, alpha: 1)
        let customBorderColor = UIColor(red: 178/255, green: 75/255, blue: 0, alpha: 1).cgColor
        let customTintColor = UIColor(red: 0, green: 96/255, blue: 1, alpha: 1)
        
        // Create a button
        let button = UIButton(type: UIButtonType.system) as UIButton
        
        // Created rounded corners and position button
        button.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/2, width: view.bounds.width/2, height: 50)
        button.layer.cornerRadius = 4
     
        // Coloring and design
        button.backgroundColor = customFillColor
        button.layer.borderColor = customBorderColor
        button.layer.borderWidth = 3
        button.tintColor = customTintColor
        
        // Define some properties
        button.setTitle("Play", for: UIControlState())
        button.addTarget(self, action: #selector(MenuViewController.buttonAction(_:)), for: UIControlEvents.touchUpInside)
        button.tag = 1
        
        // Add the button to the array and to the scene
        self.view.addSubview(button)

    }
}
