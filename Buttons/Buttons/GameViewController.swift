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
    
    var SwiftTimer = Timer()
    var SwiftCounter = 0
    
    // Add the timer label
    @IBOutlet weak var timer: UILabel!
    func startTimer(_ sender: AnyObject) {
        _ = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(GameViewController.updateCounter), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func updateCounter() {
        
    }
}
