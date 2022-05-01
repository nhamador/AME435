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
class duckEnding: SKScene, SKPhysicsContactDelegate
{
    override func didMove(to view: SKView)
    {
        let background = SKSpriteNode(imageNamed: "bills and bread")
        background.size = frame.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
    }
}
