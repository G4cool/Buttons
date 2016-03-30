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
    let buttonTotal = 2
    let buttonCount = 1
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.whiteColor()
        
        //player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        
        //addChild(player)
        //for _ in 1...2 {
            addButton()
        //}
        
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
    
    func addButton() {
        
        // Create a button
        let button = SKSpriteNode(color:SKColor.blueColor(),size:CGSize(width: size.width - 10,height: ((size.height - 10)/2)))
        
        // Position the button
        button.position = CGPoint(x: size.width/2, y: ((size.height/2) + size.height/4))
        
        button.name = "good"
        button.userInteractionEnabled = false
        
        // Add the button to the scene
        addChild(button)
        
    }
}