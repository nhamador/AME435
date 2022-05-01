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
 need asset of both brass knuckles together in one pic
 from there need to move to scene with just brass knuckles talking to player
 and then assets for punching
 duck victory screen
 
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
    var bread: SKSpriteNode!
    var wall: SKSpriteNode!
    var prisoner: SKSpriteNode!
    var freeman: SKSpriteNode!
    var cameraNode: SKCameraNode!
    var motionManager: CMMotionManager!
    var didSetup = 0;
    
    
    var duckTalk = SKLabelNode(fontNamed: "Papyrus")
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
        
        freeman = SKSpriteNode(texture: SKTexture(imageNamed: "duckUnchained"))
        freeman.zPosition = 1.0;
        freeman.size = CGSize(width: frame.maxX/5, height: frame.maxY/4)
        freeman.name = "empoweredDucky"
        addChild(freeman)
        
        
        
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
        
        sheets = SKSpriteNode(texture: SKTexture(imageNamed: "sheets"))
        sheets.position = blankStart;
        sheets.zPosition = 1.0;
        sheets.size = CGSize(width: frame.maxX/5 , height: frame.maxY/5)
        sheets.name = "sheets"
        addChild(sheets)
        
        bread = SKSpriteNode(texture: SKTexture(imageNamed: "bread"))
        bread.zPosition = 1.2;
        bread.size = CGSize(width: frame.maxX/6, height: frame.maxY/6)
        bread.name = "bread"
        addChild(bread)
        
        duckTalk.position = CGPoint(x: duckStart.x , y: duckStart.y * 0.8)
        duckTalk.fontSize = 10.0;
        duckTalk.fontColor = SKColor.systemPink
        duckTalk.zPosition = 1.1;
        addChild(duckTalk)
        
        
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
        print(point)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == prisoner)
        {
            duckTalk.text = "im sooooo hungrryyyyy"
            print("wokwokwok")
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == sheets)
        {
            sheets.removeFromParent() //hopefully deletes
            print("time for bread")
            bread.position = CGPoint(x: frame.midX, y: frame.midY)
            //brasskunckles.position blah blah
            
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == bread)
        {
            bread.position = CGPoint(x: point.x, y: point.y) //test this on iphone might be better on touches moved instead of touches began
            if(bread.position.x > 287) && (bread.position.x < 383)
            {
                if(bread.position.y > 153)&&(bread.position.y < 192)
                {
                    bread.removeFromParent()
                    duckTalk.text = "THIS IS SOME GOOD BREAD COME MAKE MORE FOR ME"
                    prisoner.removeFromParent()
                    freeman.position = CGPoint(x: frame.midX + (0.10)*frame.midX, y: frame.midY + (0.75)*frame.midY)
                }
            }
            
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == freeman)
        {
            //Victory!!! If you have time draw duck at bakery victory screen
            let brassConvo = brassTalk()
            brassConvo.size = CGSize(width: 600, height: 200)
            brassConvo.scaleMode = .fill
            scene?.view?.presentScene(brassConvo)
        }
        
        //nodes at point brass knuckles then change scenes
        
        //if i touch door make locked door sound
        
      
       // prisoner.position = location;
        
        
    }
  
    
    
}
