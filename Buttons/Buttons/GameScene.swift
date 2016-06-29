//
//  GameScene.swift
//  Buttons
//
//  Created by Luca on 3/29/16.
//  Copyright (c) 2016 Space!, Ink. All rights reserved.
//

import SpriteKit
import Foundation
//import SpriteKit_Spring

class GameScene: SKScene {
    
    var buttonTotal = 1
    var buttonCount = 1
    var shapeNodes : [SKShapeNode] = []
    var correct = false
    var guessed = false
    var needDelete = false
    var rand = 0
    var randFillRedCorrect = CGFloat(0)
    var randFillRed = CGFloat(0)
    var randFillGreen = CGFloat(0)
    var randFillBlue = CGFloat(0)
    var randStrokeRed = CGFloat(0)
    var randStrokeGreen = CGFloat(0)
    var randStrokeBlue = CGFloat(0)
    var touchedNothing = true
    var mod = 1
    
    override func didMoveToView(view: SKView) {
        
        // Randomly generate number for picking which button is good
        rand = randRange(1, upper: buttonTotal)
        
        backgroundColor = SKColor.whiteColor()
        
        
        if needDelete == false {
            // Create random numbers for colors
            randColors()
            
            for _ in 1...buttonTotal {
                addButton((buttonCount - 1), buttonTotal: buttonTotal, rand: CGFloat(rand), randFillRedCorrect: randFillRedCorrect, randFillRed: randFillRed, randFillGreen: randFillGreen, randFillBlue: randFillBlue, randStrokeRed: randStrokeRed, randStrokeGreen: randStrokeGreen, randStrokeBlue: randStrokeBlue)
                buttonCount += 1
            }
            buttonTotal += 1
            guessed = false
            needDelete = true
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
                    correct = true
                    touchedNothing = false
                } else if touchedNode.name == "bad" {
                    correct = false
                    touchedNothing = false
                } else {
                    touchedNothing = true
                    print("twas nothing")
                }
            }
            
            if touchedNothing == false {
                // Change color of SKShapeNodes
                for node in shapeNodes {
                    if (node.name == "good") {
                        node.fillColor = UIColor(red: 20/255, green: 204/255, blue: 10/255, alpha: 1)
                        node.strokeColor = UIColor(red: 61/255, green: 153/225, blue: 106/255, alpha: 1)
                    } else {
                        node.fillColor = UIColor(red: 204/255, green: 44/255, blue: 20/255, alpha: 1)
                        node.strokeColor = UIColor(red: 153/255, green: 73/225, blue: 61/255, alpha: 1)
                    }
                }
            
                guessed = true
                buttonCount = 1
                correct = false
                needDelete = true
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if touchedNothing == false {
            // Delay (for now, change later)
            sleep(1)
            
            // Remove the SKShapeNodes
            removeNodes()
        
            buttonCount = 1
        
            if needDelete == false {
                // Create random numbers for colors
                randColors()
                
                // Start the timer
                _ = buttonTotal
                _ = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(GameScene.updateCounter), userInfo: nil, repeats: true)
                
                for _ in 1...buttonTotal {
                    addButton((buttonCount - 1), buttonTotal: buttonTotal, rand: CGFloat(rand), randFillRedCorrect: randFillRedCorrect, randFillRed: randFillRed, randFillGreen: randFillGreen, randFillBlue: randFillBlue, randStrokeRed: randStrokeRed, randStrokeGreen: randStrokeGreen, randStrokeBlue: randStrokeBlue)
                    buttonCount += 1
                }
                buttonTotal += 1
                rand = randRange(1, upper: buttonTotal)
                guessed = false
                needDelete = true
            }
            
            mod = 1
        }
    }
    
    func updateCounter() {
        
    }
    
    func removeNodes() {
        if needDelete == true {
            // Remove the SKShapeNodes
            for node in shapeNodes {
                node.removeFromParent()
            }
            shapeNodes.removeAll()
        }
        needDelete = false
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
    
    func randColors() {
        // Create random numbers for colors
        randFillRed = CGFloat(randRange(0, upper: 255))
        randFillGreen = CGFloat(randRange(0, upper: 255))
        randFillBlue = CGFloat(randRange(0, upper: 255))
        randStrokeRed = CGFloat(randRange(0, upper: 255))
        randStrokeGreen = CGFloat(randRange(0, upper: 255))
        randStrokeBlue = CGFloat(randRange(0, upper: 255))
        if randFillRed < 100 {
            randFillRedCorrect = randFillRed + 100
        } else {
            randFillRedCorrect = randFillRed - 100
        }
        
        if randFillRed > 0 {
            randStrokeRed = randFillRed - 15
        }
        
        if randFillGreen > 0 {
            randStrokeGreen = randFillGreen - 15
        }
        
        if randFillBlue > 0 {
            randStrokeBlue = randFillBlue - 15
        }
    }
    
    func addButton(buttonCount: Int, buttonTotal: Int, rand: CGFloat, randFillRedCorrect: CGFloat, randFillRed: CGFloat, randFillGreen: CGFloat, randFillBlue: CGFloat, randStrokeRed: CGFloat, randStrokeGreen: CGFloat, randStrokeBlue: CGFloat) {
        
        // Create color
        let customFillColor = UIColor(red: CGFloat(randFillRed/255), green: CGFloat(randFillGreen/255), blue: CGFloat(randFillBlue/255), alpha: 1)
        let customFillColorCorrect = UIColor(red: CGFloat(randFillRedCorrect/255), green: CGFloat(randFillGreen/255), blue: CGFloat(randFillBlue/255), alpha: 1)
        let customStrokeColor = UIColor(red: CGFloat(randStrokeRed/255), green: CGFloat(randStrokeGreen/255), blue: CGFloat(randStrokeBlue/255), alpha: 1)
        
        // Get mod (number of rows)
        if buttonTotal <= 24 {
            for i in 1...Int(sqrt(Double(buttonTotal))) {
                if (i != 1) && (buttonTotal % i == 0) {
                    mod = i
                    //break
                }
            }
        } else {
            for i in 1...5 {
                if (i != 1) && (buttonTotal % i == 0) {
                    mod = i
                    //break
                }
            }
        }
        
        while (buttonTotal + 1)/mod > 16 { // Decrease the left side of inequality to increase rows (mod)
            mod += 1
        }
        
        // Create a button with properties
        let xDist = size.width/CGFloat(buttonTotal + 2)
        var yDist = CGFloat(0)
        if (mod == 1) {
            yDist = size.height/CGFloat(2 + 1)
        } else {
            yDist = size.height/CGFloat(mod + 1)
        }
        let distance = sqrt((xDist) * (xDist) + (yDist) * (yDist))
        var radius = distance/2
        if xDist < radius {
            radius = xDist
            if mod == 1 || mod == 2 {
                radius = xDist - 5
            }
        } else if yDist < radius {
            radius = yDist
        } else {
            radius = distance/2 - 4
        }
        
        let button = SKShapeNode(circleOfRadius: radius)
        var buttonX = CGFloat(0)
        var buttonY = CGFloat(0)
        
        // Created rounded corners and position button
        if (buttonTotal != 1) && (mod == 1) {
            button.position = CGPointMake((size.width/CGFloat(buttonTotal + 1) * CGFloat(buttonCount + 1)), ((size.height * (((CGFloat(buttonCount) + 1) % CGFloat(2)) + 1))/CGFloat(2 + 1)))
            buttonX = (size.width/CGFloat(buttonTotal + 1) * CGFloat(buttonCount + 1))
            buttonY = ((size.height * (((CGFloat(buttonCount) + 1) % CGFloat(2)) + 1))/CGFloat(2 + 1))
        } else {
            button.position = CGPointMake((size.width/CGFloat(buttonTotal + 1) * CGFloat(buttonCount + 1)), ((size.height * (((CGFloat(buttonCount) + 1) % CGFloat(mod)) + 1))/CGFloat(mod + 1)))
            buttonX = (size.width/CGFloat(buttonTotal + 1) * CGFloat(buttonCount + 1))
            buttonY = ((size.height * (((CGFloat(buttonCount) + 1) % CGFloat(mod)) + 1))/CGFloat(mod + 1))
        }
        
        // Define some properties
        if CGFloat((buttonCount + 1)) == rand {
            button.name = "good"
        } else {
            button.name = "bad"
        }
        button.userInteractionEnabled = false
        
        // Coloring and design
        if button.name == "good" {
            button.fillColor = customFillColorCorrect
        } else {
            button.fillColor = customFillColor
        }
        button.strokeColor = customStrokeColor
        button.lineWidth = 3
        
        // Add the button to the array and to the scene
        shapeNodes.append(button)
        addChild(button)
        
        // Animation
        let xCenter = size.width/2
        let yCenter = size.height/2
        let xDistFromCenter = xCenter - buttonX
        let yDistFromCenter = yCenter - buttonY
        let distFromCenter = sqrt((xDistFromCenter)*(xDistFromCenter) + (yDistFromCenter)*(yDistFromCenter))
        // Using xCenter and yCenter because the distance is the same as the farthest distance
        let farthestDist = sqrt((xCenter)*(xCenter) + (yCenter)*(yCenter))
        let delayCustom = Double(distFromCenter/farthestDist)
        button.setScale(0)
        let pulse = SKAction.scaleTo(1.0, duration: 5, delay: delayCustom, usingSpringWithDamping: 0.2, initialSpringVelocity: 0)
        button.runAction(pulse)
    }
}