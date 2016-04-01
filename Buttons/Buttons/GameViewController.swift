//
//  GameViewController.swift
//  Buttons
//
//  Created by Luca on 3/29/16.
//  Copyright (c) 2016 Space!, Ink. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        NSNotificationCenter.defaultCenter().addObserver(self,selector:"AlertMessage:",name:"AlertMessage",object:nil);
    }
    
    func AlertMessage(notification:NSNotification)
    {
        if(let userInfo = notification.userInfo)
        {
            let message = userInfo["message"]
            ....//do alert view call here
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}