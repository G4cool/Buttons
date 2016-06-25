//
//  GameScene.swift
//  Buttons
//
//  Created by Luca on 3/29/16.
//  Copyright (c) 2016 Space!, Ink. All rights reserved.
//

import SpriteKit
import Foundation

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
                    print("twas good")
                } else if touchedNode.name == "bad" {
                    correct = false
                    touchedNothing = false
                    print("twas bad")
                } else {
                    touchedNothing = true
                    print("twas nothing")
                }
            }
            
            if touchedNothing == false {
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
    }
    
    func addButton(buttonCount: Int, buttonTotal: Int, rand: CGFloat, randFillRedCorrect: CGFloat, randFillRed: CGFloat, randFillGreen: CGFloat, randFillBlue: CGFloat, randStrokeRed: CGFloat, randStrokeGreen: CGFloat, randStrokeBlue: CGFloat) {
        
        // Create color
        let customFillColor = UIColor(red: CGFloat(randFillRed/255), green: CGFloat(randFillGreen/255), blue: CGFloat(randFillBlue/255), alpha: 1)
        let customFillColorCorrect = UIColor(red: CGFloat(randFillRedCorrect/255), green: CGFloat(randFillGreen/255), blue: CGFloat(randFillBlue/255), alpha: 1)
        let customStrokeColor = UIColor(red: CGFloat(randStrokeRed/255), green: CGFloat(randStrokeGreen/255), blue: CGFloat(randStrokeBlue/255), alpha: 1)
        
        // Create a button
        let radius = ((size.height)/(CGFloat(buttonTotal)) - 10)/2
        let button = SKShapeNode(circleOfRadius: radius)
        
        // Created rounded corners and position button
        for i in 1...Int(sqrt(Double(buttonTotal))) {
            if (i != 1) && (buttonTotal % i == 0) {
                mod = i
                print("buttonTotal: " + String(buttonTotal) + ", i: " + String(i))
                break
            }
        }
        
        print("buttonCount: " + String(buttonCount + 1))
        
        button.position = CGPointMake((size.width/CGFloat(buttonTotal + 1) * CGFloat(buttonCount + 1)), size.height/2)
        
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
        
    }
}