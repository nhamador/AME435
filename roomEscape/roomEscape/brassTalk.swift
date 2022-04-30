//
//  brassTalk.swift
//  roomEscape
//
//  Created by student on 4/30/22.
//
import Foundation
import SpriteKit
import SwiftUI
import CoreMotion
class brassTalk: SKScene, SKPhysicsContactDelegate
{
    var lefty: SKSpriteNode!
    var righty: SKSpriteNode!

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        let background = SKSpriteNode(imageNamed: "bed")
        background.size = frame.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        lefty = SKSpriteNode(imageNamed: "brassL1")
        lefty.position = CGPoint(x: (frame.midX * (0.75)), y: frame.midY)
        lefty.zPosition = 1.0;
        lefty.size = CGSize(width: frame.maxX/5 , height: frame.maxY/5)
        lefty.name = "lefty"
        addChild(lefty)
        
        righty = SKSpriteNode(imageNamed: "brassR1")
        righty.zPosition = 1.0
        righty.position = CGPoint(x: (frame.midX*(1.25)),y: frame.midY)
        righty.size = CGSize(width: frame.maxX/5 , height: frame.maxY/5)
        righty.name = "righty"
        addChild(righty)
        
        //need to create sequence that runs when tapped and then text appears should be not too bad 
   
        

    }
}

