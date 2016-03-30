//
//  GameScene.swift
//  Buttons
//
//  Created by Luca on 3/29/16.
//  Copyright (c) 2016 Space!, Ink. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // 1
    //let player = SKSpriteNode(imageNamed: "player")
    var buttonTotal = 3
    var buttonCount = 1
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.whiteColor()
        
        //player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        
        //addChild(player)
        for _ in 1...buttonTotal {
            addButton((buttonCount - 1), buttonTotal: buttonTotal)
            buttonCount += 1
        }
        
        /*
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addMonster),
                SKAction.waitForDuration(1.0)
            ])
        ))
        */
    }
    
    /*
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let touch = touches.anyObject() as! UITouch
        
        let touchLocation = touch.locationInNode(self)
        
        if([button containsPoint: touchLocation])
        {
            //sprite contains touch
        }
    }
    */
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addMonster() {
        
        // Create sprite
        let monster = SKSpriteNode(imageNamed: "monster")
        
        // Determine where to spawn the monster along the Y axis
        let actualY = random(min: monster.size.height/2, max: size.height - monster.size.height/2)
        
        // Position the monster slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        
        // Add the monster to the scene
        addChild(monster)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    func addButton(buttonCount: Int, buttonTotal: Int) {
        
        // Creat color
        let customFillColor = UIColor(red: 1, green: 108/255, blue: 0, alpha: 1)
        let customStrokeColor = UIColor(red: 178/255, green: 75/255, blue: 0, alpha: 1)
        
        // Create a button
        //let button = SKShapeNode(color:customColor,size:CGSize(width: size.width - 10,height: ((size.height - 10)/(CGFloat(buttonTotal)))))
        let button = SKShapeNode()
        
        // Created rounded corners and position button
        //button.path = UIBezierPath(roundedRect: CGRect(x: 0, y: -64, width: (size.width - 10), height: ((size.height - 10)/(CGFloat(buttonTotal)))), cornerRadius: 64).CGPath
        let yPos = (((size.height - 10)/(CGFloat(buttonTotal))) + (CGFloat(2 * buttonCount) * (size.height/(CGFloat(2 * buttonTotal)))))
        button.path = UIBezierPath(roundedRect: CGRect(x: 5, y: size.height - 5 - yPos, width: size.width - 10, height: ((size.height - 10)/(CGFloat(buttonTotal)))), cornerRadius: 4).CGPath
        
        // Coloring and design
        button.fillColor = customFillColor
        button.strokeColor = customStrokeColor
        button.lineWidth = 3
        
        // Position the button
        //button.position = CGPoint(x: size.width/2, y: ((size.height/(CGFloat(buttonTotal))) + (CGFloat(2 * buttonCount) * (size.height/(CGFloat(2 * buttonTotal)))) - size.height/(CGFloat(2 * buttonTotal))))
        
        button.name = "good"
        button.userInteractionEnabled = false
        
        // Add the button to the scene
        addChild(button)
        
    }
}