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
    var doorOne: SKSpriteNode!
    var doorTwo: SKSpriteNode!
    var bed : SKSpriteNode!
    var sheets: SKSpriteNode!
    var wall: SKSpriteNode!
    var prisoner: SKSpriteNode!
    var cameraNode: SKCameraNode!
    var motionManager: CMMotionManager!
    var didSetup = 0;
    override func didMove(to view: SKView) {
        
            physicsWorld.contactDelegate = self
            setup()
            
        
        
       // backgroundColor = SKColor.systemPink
        
        
        
        
    }
    
    func setup() {
        //set this to gyro later
        cameraNode = SKCameraNode()
        cameraNode.position.x = size.width/2
        cameraNode.position.y = size.height/2
        
        let blankStart = CGPoint(x: frame.midX, y: frame.midY);
        let duckStart = CGPoint(x: frame.midX + (0.10)*frame.midX, y: frame.midY + (0.75)*frame.midY)
        let doorStart = CGPoint(x: frame.midX - (0.45)*frame.midX, y: frame.midY)
        
        let background = SKSpriteNode(imageNamed: "wall")
        background.size = frame.size
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        prisoner = SKSpriteNode(texture: SKTexture(imageNamed: "duckChained2"))
        prisoner.position = duckStart;
        prisoner.zPosition = 1.0;
        prisoner.size = CGSize(width: frame.maxX / 5, height: frame.maxY / 4)
        prisoner.name = "ducky"
        addChild(prisoner)
        
        doorOne = SKSpriteNode(texture: SKTexture(imageNamed: "doorOne"))
        doorOne.position = doorStart;
        doorOne.zPosition = 1.0;
        doorOne.size = CGSize(width: frame.maxX / 5, height: frame.maxY / 3)
        doorOne.name = "doorOne"
        addChild(doorOne)
        
        bed = SKSpriteNode(texture: SKTexture(imageNamed: "bed"))
        bed.position = blankStart;
        bed.zPosition = 1.0;
        bed.size = CGSize(width: frame.maxX / 5, height: frame.maxY / 5)
        bed.name = "bed"
        addChild(bed)
        
        
        /*
        landlord = SKSpriteNode(texture: SKTexture(imageNamed: "landlord1"))
        landlord.position = blankStart;
        landlord.zPosition = 1.0
        landlord.size = CGSize(width: 235, height: 141)
        landlord.name = "leftEye"
        addChild(landlord)
         */
        
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
        didSetup = 1;
                    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return }
        let point = touch.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == prisoner)
        {
           //the dang duck talks
        }
        //if I touch sheets make sheets disappear and leave something under it
        //if i touch door make locked door sound
        
      
       // prisoner.position = location;
        
        
    }
    
    
}
