//
//  GameScene.swift
//  Buttons
//
//  Created by Luca on 3/29/16.
//  Copyright (c) 2016 Space!, Ink. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var buttonTotal = 1
    var buttonCount = 1
    var shapeNodes : [SKShapeNode] = []
    var correct = false
    var guessed = false
    
    override func didMoveToView(view: SKView) {
        
        // Randomly generate number for picking which button is good
        let rand = randRange(1, upper: buttonTotal)
        
        backgroundColor = SKColor.whiteColor()
        
        // Repeat
        
        for _ in 1...buttonTotal {
            addButton((buttonCount - 1), buttonTotal: buttonTotal, rand: CGFloat(rand))
            buttonCount += 1
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Check if valid
        if guessed == false {
            // Identify touch
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                let touchedNode = self.nodeAtPoint(location)
                
                if touchedNode.name == "good" {
                    print("yes")
                    correct = true
                } else {
                    print("no")
                    correct = false
                }
            }
            
            // Change color of SKShapeNodes
            for node in shapeNodes {
                if (node.name == "good") {
                    node.fillColor = UIColor(red: 11/255, green: 1, blue: 0, alpha: 1)
                    node.strokeColor = UIColor(red: 7/255, green: 178/225, blue: 0, alpha: 1)
                } else {
                    node.fillColor = UIColor(red: 1, green: 10/255, blue: 0, alpha: 1)
                    node.strokeColor = UIColor(red: 178/255, green: 7/225, blue: 0, alpha: 1)
                }
            }
            
            guessed = true
            buttonTotal += 1
            
            /*
            // Remove the SKShapeNodes
            for node in shapeNodes {
                node.removeFromParent()
            }
            // Check keepCapacity
            shapeNodes.removeAll(keepCapacity: false)
            */
            buttonCount = 1
            correct = false
        }
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func addButton(buttonCount: Int, buttonTotal: Int, rand: CGFloat) {
        
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