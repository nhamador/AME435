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
    var leftSeq: SKAction!
    var rightSeq: SKAction!
    
  

    override func didMove(to view: SKView) {
        let l1 = SKTexture(imageNamed: "brassL1")
        let l2 = SKTexture(imageNamed: "brassL2")
        let l3 = SKTexture(imageNamed: "brassL3")
        
        let r1 = SKTexture(imageNamed: "brassR1")
        let r2 = SKTexture(imageNamed: "brassR2")
        let r3 = SKTexture(imageNamed: "brassR3")
        
        let leftArray = [l1,l2,l3,l2];
        let rightArray = [r1,r2,r3,r2];
        physicsWorld.contactDelegate = self
        let background = SKSpriteNode(imageNamed: "bed")
        background.size = frame.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
       //maybe add green background 
        
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
        

        let leftTalk = SKAction.animate(with: leftArray, timePerFrame: 0.1)
        let rightTalk = SKAction.animate(with: rightArray,timePerFrame: 0.1)
        let repeatLeft = SKAction.repeatForever(leftTalk)
        let repeatRight = SKAction.repeatForever(rightTalk)
        leftSeq = SKAction.sequence([repeatLeft])
        rightSeq = SKAction.sequence([repeatRight])
     
        //need to create sequence that runs when tapped and then text appears should be not too bad 
   
        

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return }
        let point = touch.location(in: self)
        print(point)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == lefty)
        {
            lefty.run(leftSeq)
        }
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == righty)
        {
            righty.run(rightSeq)
            
        }
    }
}

