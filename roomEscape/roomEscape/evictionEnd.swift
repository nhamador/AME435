//
//  evictionEnd.swift
//  roomEscape
//
//  Created by Emma Hoffmann on 5/1/22.
//

import Foundation
import SpriteKit
import SwiftUI
import CoreMotion
class evictionEnd: SKScene, SKPhysicsContactDelegate
{
    var endText = SKLabelNode(fontNamed: "Papyrus")
    var endText2 = SKLabelNode(fontNamed: "Papyrus")
    var land1: SKTexture!
    var land2: SKTexture!
    var land3: SKTexture!
    var land4: SKTexture!
    var landlord: SKSpriteNode!
    var talkArray: [SKTexture] = []
    var landTalk: SKAction!
    var talkSeq: SKAction!
    var tapCounter = 0;
    override func didMove(to view: SKView)
    {
        
        let background = SKSpriteNode(imageNamed: "wall")
        background.size = CGSize(width: frame.width * 3, height: frame.height * 1)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        endText.position = CGPoint(x: frame.midX , y: frame.midY * (1.75))
        endText.fontSize = 30.0;
        endText.fontColor = SKColor.systemRed
        endText.zPosition = 1.1;
        endText.text = "YOU HAVE RUINED"
        addChild(endText)
        
        endText2.position = CGPoint(x: frame.midX , y: frame.midY * (1.55))
        endText2.fontSize = 30.0;
        endText2.fontColor = SKColor.systemRed
        endText2.zPosition = 1.1;
        endText2.text = "YOUR BEAUTIFUL ROOM"
        addChild(endText2)
        
        land1 = SKTexture(imageNamed:"landlord1")
        land2 = SKTexture(imageNamed:"landlord2")
        land3 = SKTexture(imageNamed:"landlord3")
        land4 = SKTexture(imageNamed:"landlord4")

        talkArray = [land2,land3,land4]


        
        landlord = SKSpriteNode(texture: land1)
        landlord.position = CGPoint(x: frame.midX, y: frame.midY)
        landlord.zPosition = 1.1;
        landlord.size = CGSize(width: frame.maxX , height: frame.maxY/2 )
        landlord.name = "someguy"
        addChild(landlord)
        
        
        landTalk = SKAction.animate(with: talkArray, timePerFrame: 0.1)
        
        let repeatTalk = SKAction.repeatForever(landTalk)
       
        talkSeq = SKAction.sequence([repeatTalk])
        landlord.run(talkSeq)
        
        

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return }
        let point = touch.location(in: self)
        print(point)
        let nodesAtPoint = nodes(at: point)
        tapCounter = tapCounter+1
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == landlord)
        {
            if(tapCounter == 0)
            {
                endText.text = "AS YOUR LANDLORD"
                endText2.text = "PREPARE TO BE..."
            }
            
        }
    }
}

