//
//  homeless.swift
//  roomEscape
//
//  Created by Emma Hoffmann on 5/1/22.
//

import Foundation
import SpriteKit
import SwiftUI
import CoreMotion
import AVFoundation
class homeless: SKScene, SKPhysicsContactDelegate
{
    var endText = SKLabelNode(fontNamed: "Helvetica")
    var sound = SKAction.playSoundFileNamed("homeless", waitForCompletion: true)

    
    override func didMove(to view: SKView)
    {
        playSound(sound: sound)


        let background = SKSpriteNode(imageNamed: "noHome")
        background.size = CGSize(width: frame.width * 3, height: frame.height * 1)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        endText.position = CGPoint(x: frame.midX , y: frame.midY * (1.25))
        endText.fontSize = 30.0;
        endText.fontColor = SKColor.white
        endText.zPosition = 1.1;
        endText.text = "HOMELESS END"
        addChild(endText)
        
        
    }
    
    func playSound(sound: SKAction)
    {
        run(sound)
    }
 
}
