//
//  duckEnding.swift
//  roomEscape
//
//  Created by student on 5/1/22.
//


import Foundation
import SpriteKit
import SwiftUI
import CoreMotion
import AVFoundation
class duckEnding: SKScene, SKPhysicsContactDelegate
{
    var endText = SKLabelNode(fontNamed: "Helvetica")
    var player: AVAudioPlayer!
    var sound = SKAction.playSoundFileNamed("bread", waitForCompletion: true)

    
    override func didMove(to view: SKView)
    {
        

        endText.position = CGPoint(x: frame.midX , y: frame.midY * (1.25))
        endText.fontSize = 60.0;
        endText.fontColor = SKColor.black
        endText.zPosition = 1.1;
        endText.text = "BAKERY END"
        addChild(endText)
        
        let background = SKSpriteNode(imageNamed: "bills and bread")
        background.size = frame.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        playSound(sound: sound)
        
    }


    func playSound(sound: SKAction)
    {
        run(sound)
    }
    
}
