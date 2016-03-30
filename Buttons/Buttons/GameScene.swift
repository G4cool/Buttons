//
//  GameScene.swift
//  Buttons
//
//  Created by Luca on 3/29/16.
//  Copyright (c) 2016 Space!, Ink. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var buttonTotal = 3
    var buttonCount = 1
    
    override func didMoveToView(view: SKView) {
        
        // Randomly generate number for picking which button is good
        let rand = random(min: CGFloat(1.0), max: CGFloat(buttonTotal))
        
        backgroundColor = SKColor.whiteColor()
        
        for _ in 1...buttonTotal {
            addButton((buttonCount - 1), buttonTotal: buttonTotal)
            buttonCount += 1
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            if touchedNode.name == "good" {
                print("yes")
            } else {
                print("no")
            }
        }
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addButton(buttonCount: Int, buttonTotal: Int) {
        
        // Creat color
        let customFillColor = UIColor(red: 1, green: 108/255, blue: 0, alpha: 1)
        let customStrokeColor = UIColor(red: 178/255, green: 75/255, blue: 0, alpha: 1)
        
        // Create a button
        let button = SKShapeNode()
        
        // Created rounded corners and position button
        let spacingFactor = CGFloat(4.5)/CGFloat(buttonTotal)
        let yPos = (((size.height - 10)/(CGFloat(buttonTotal))) + (CGFloat(2 * buttonCount) * ((size.height/(CGFloat(2 * buttonTotal))) - spacingFactor)))
        button.path = UIBezierPath(roundedRect: CGRect(x: 5, y: size.height - 5 - yPos, width: size.width - 10, height: ((size.height - 10)/(CGFloat(buttonTotal)) - (spacingFactor * CGFloat(buttonTotal)))), cornerRadius: 4).CGPath
        
        // Coloring and design
        button.fillColor = customFillColor
        button.strokeColor = customStrokeColor
        button.lineWidth = 3
        
        // Define some properties
        button.name = "good"
        button.userInteractionEnabled = false
        
        // Add the button to the scene
        addChild(button)
        
    }
}