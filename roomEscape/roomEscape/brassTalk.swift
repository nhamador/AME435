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
    var leftTalk = SKLabelNode(fontNamed: "Papyrus")
    var rightTalk = SKLabelNode(fontNamed: "Papyrus")
    var leftTalky : SKAction!
    var rightTalky : SKAction!


    
  

    override func didMove(to view: SKView) {
        
        leftTalk.position = CGPoint(x: frame.midX * (0.50) , y: frame.midY * (1.5));
        leftTalk.fontSize = 10.0;
        leftTalk.fontColor = SKColor.systemPink
        leftTalk.zPosition = 1.1;
        addChild(leftTalk)
        
        
        rightTalk.position = CGPoint(x: frame.midX * (1.50) , y: frame.midY * (1.5))
        rightTalk.fontSize = 10.0;
        rightTalk.fontColor = SKColor.systemPink
        rightTalk.zPosition = 1.1;
        addChild(rightTalk)
        
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
        

        leftTalky = SKAction.animate(with: leftArray, timePerFrame: 0.1)
        rightTalky = SKAction.animate(with: rightArray,timePerFrame: 0.1)
        let repeatLeft = SKAction.repeatForever(leftTalky)
        let repeatRight = SKAction.repeatForever(rightTalky)
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
            leftTalk.text = "why wont you punch your way out of here"
            lefty.run(leftTalky)
        }
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == righty)
        {
            rightTalk.text = "dont listen to lefty, trust the duck"
            righty.run(rightTalky)
            
            //leaving this here rn for testing moving later after I fill out dialouge
            let firstRoom = firstRoom()
            firstRoom.size = CGSize(width: 600, height: 200)
            firstRoom.scaleMode = .fill
            scene?.view?.presentScene(firstRoom)
            
        }
    }
}

