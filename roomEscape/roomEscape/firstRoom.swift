//
//  firstRoom.swift
//  roomEscape
//
//  Created by student on 4/18/22.
//

import Foundation
import SpriteKit
import SwiftUI
import CoreMotion
/*
 TODO LIST
 /\/\/\/\/\/\//\/\/\/\/\/\/\/\/
 MAKE ASSETS FOR 4 WALLS
 CREATE SCENE
 PUSH TO GITHUB AND TEST ON EMMAS MAC
 RECONFIGURE PLACEMENT AND GYRO
 */
class firstRoom: SKScene, SKPhysicsContactDelegate
{
    var landlord : SKSpriteNode!
    var cameraNode: SKCameraNode!
    var motionManager: CMMotionManager!
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.systemPink
        cameraNode = SKCameraNode()
        
        setup()
        
    }
    
    func setup() {
        
        let blankStart = CGPoint(x: frame.midX, y: frame.midY);
        
        landlord = SKSpriteNode(texture: SKTexture(imageNamed: "landlord1"))
        landlord.position = blankStart;
        landlord.zPosition = 1.0
        landlord.size = CGSize(width: 235, height: 141)
        landlord.name = "leftEye"
        addChild(landlord)
        
        addChild(cameraNode)
        camera = cameraNode
        motionManager = CMMotionManager();
        motionManager.gyroUpdateInterval = 0.2
        motionManager.startGyroUpdates(to: OperationQueue.current!){(data, error) in
            if let myData = data
            {
                print(myData.rotationRate)
            }
        }
                    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return }
        let location = touch.location(in: self)
        cameraNode.position.x = size.width/2
        cameraNode.position.y = size.height/2
    }
    
    
}
