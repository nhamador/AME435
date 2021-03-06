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
 make bed and door breakable
 after breaking both of them play landlord scene and get eviction ending
 
 */
class firstRoom: SKScene, SKPhysicsContactDelegate
{
    var sound = SKAction.playSoundFileNamed("cat", waitForCompletion: true)

    
    let manager = CMMotionManager()
 
    var landlord : SKSpriteNode!
    var doorOne: SKSpriteNode!
    var doorTwo: SKSpriteNode!
    var bed : SKSpriteNode!
    var sheets: SKSpriteNode!
    var bread2: SKSpriteNode!
    var wall: SKSpriteNode!
    var prisoner: SKSpriteNode!
    var freeman: SKSpriteNode!
    var brassKnucks: SKSpriteNode!
    var lefty: SKSpriteNode!
    var righty: SKSpriteNode!
    var cameraNode: SKCameraNode!
    
    var brassPunchl1 : SKTexture!
    var brassPunchl2: SKTexture!
    var brassPunchr1: SKTexture!
    var brassPunchr2: SKTexture!
    var doorb1: SKTexture!
    var doorb2: SKTexture!
    var doorb3: SKTexture!
    var bedb1: SKTexture!
    var bedb2: SKTexture!
    var bedb3: SKTexture!
    var bedb4: SKTexture!
    var empty : SKTexture!
    var brassLeftArray: [SKTexture] = []
    var brassRightArray: [SKTexture] = []
    var brassEquip = 0;
    var leftHook : SKAction!
    var rightHook : SKAction!
    var didSetup = 0;
    var punchPicker = 0;
    var doorPunchCounter = 0;
    var bedPunchCounter = 0;
    let wait = SKAction.wait(forDuration: 1.2)
    var duckTalk = SKLabelNode(fontNamed: "Papyrus")
    
    var x = 300.0
    var y = 300.0
    
    override func didMove(to view: SKView)
    {
        playSound(sound: sound)
        physicsWorld.contactDelegate = self
        
   print("outside timer")
        print(x)
        print(y)
     
        
    
        setup()
    }
    func setup()
    {
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.2
        cameraNode = SKCameraNode()
        cameraNode.position.x = abs((1000*x))
        if(cameraNode.position.x > 1000)
        {
            cameraNode.position.x = 1000;
            
        }
        if(cameraNode.position.x <= 0)
        {
            cameraNode.position.x = 1;
        }
        cameraNode.position.y = abs((1000*y))
        if (cameraNode.position.y < 0)
        {
            cameraNode.position.y = 0;
        }
        if (cameraNode.position.y > 600)
        {
            cameraNode.position.y = 599;
        }
        addChild(cameraNode)
        camera = cameraNode
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
            
            if let data = self.manager.accelerometerData {
             
                self.x = data.acceleration.x
                self.y = data.acceleration.y
                /*
                print("x:")
                print(self.x)
                print("y:")
                print(self.y)
                 */
               
                if(self.x > 0.33)
                {
                    self.x = 0.33;
                }
                if(self.x < -0.33)
                {
                    self.x = -0.33;
                }
                self.cameraNode.position.x = self.x * 2500 + 500
                print(self.x)
                
                
                    self.y = 0.49
                    
                
                self.cameraNode.position.y = self.y * 1000
                
                if(bedPunchCounter >= 4)&&(doorPunchCounter >= 3) //need this to be checked a lot
                {
                    let landEnd = evictionEnd()
                    landEnd.size = CGSize(width: 400, height: 600)
                    landEnd.scaleMode = .fill
                    scene?.view?.presentScene(landEnd)
                    
                }
                
                
            }
       
        }
 
        //set this to gyro later

        
        
        let blankStart = CGPoint(x: frame.midX, y: frame.midY);
        let duckStart = CGPoint(x: frame.midX - (0.10)*frame.midX, y: frame.midY + (0.70)*frame.midY)
        let doorStart = CGPoint(x: frame.midX * (-1), y: frame.midY)
        
        let background = SKSpriteNode(imageNamed: "wall")
        background.size = CGSize(width: frame.width * 3, height: frame.height * 1)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        prisoner = SKSpriteNode(texture: SKTexture(imageNamed: "duckChained2"))
        prisoner.position = duckStart;
        prisoner.zPosition = 1.0;
        prisoner.size = CGSize(width: frame.maxX / 3, height: frame.maxY / 3)
        prisoner.name = "ducky"
        addChild(prisoner)
        
        freeman = SKSpriteNode(texture: SKTexture(imageNamed: "duckUnchained"))
        freeman.position = CGPoint(x: -10000, y: -10000)
        freeman.zPosition = 1.0;
        freeman.size = CGSize(width: frame.maxX/3, height: frame.maxY/3)
        freeman.name = "empoweredDucky"
        addChild(freeman)
        
        
        
        doorOne = SKSpriteNode(texture: SKTexture(imageNamed: "doorOne"))
        doorOne.position = doorStart;
        doorOne.zPosition = 1.0;
        doorOne.size = CGSize(width: frame.maxX / 3, height: frame.maxY / 2)
        doorOne.name = "doorOne"
        addChild(doorOne)
        doorb1 = SKTexture(imageNamed: "doorb1")
        doorb2 = SKTexture(imageNamed: "doorb2")
        doorb3 = SKTexture(imageNamed: "doorb3")
        
        bed = SKSpriteNode(texture: SKTexture(imageNamed: "bed"))
        bed.position = CGPoint(x: frame.midX * 3.25, y: frame.midY);
        bed.zPosition = 1.0;
        bed.size = CGSize(width: frame.maxX/2 , height: frame.maxY / 4)
        bed.name = "bed"
        addChild(bed)
        bedb1 = SKTexture(imageNamed: "bedb1")
        bedb2 = SKTexture(imageNamed: "bedb2")
        bedb3 = SKTexture(imageNamed: "bedb3")
        bedb4 = SKTexture(imageNamed: "bedb4")
        
        brassKnucks = SKSpriteNode(texture: SKTexture(imageNamed: "brassKnucks"))
        brassKnucks.zPosition = 1.0;
        brassKnucks.size = CGSize(width: (frame.maxX / 7), height: (frame.maxY / 7))
        brassKnucks.name = "brassKnucks."
        addChild(brassKnucks)
        
        brassPunchl1 = SKTexture(imageNamed: "brasspunchl1")
        brassPunchl2 = SKTexture(imageNamed: "brasspunchl2")
        brassPunchr1 = SKTexture(imageNamed: "brasspunchr1")
        brassPunchr2 = SKTexture(imageNamed: "brasspunchr2")
        empty = SKTexture(imageNamed: "empty")
        brassLeftArray = [brassPunchl1, brassPunchl2,brassPunchl1, brassPunchl2, empty]
        brassRightArray = [brassPunchr1, brassPunchr2, brassPunchr1, brassPunchr2, empty]
        leftHook = SKAction.animate(with: brassLeftArray, timePerFrame: 0.3)
        rightHook = SKAction.animate(with: brassRightArray, timePerFrame: 0.3)
        
        lefty = SKSpriteNode(texture: SKTexture(imageNamed: "brassL1"))
        lefty.size = CGSize(width: (frame.maxX/3), height: (frame.maxY / 5))
        lefty.name = "lefty"
        lefty.position = CGPoint(x: -10000, y: -10000)
        lefty.zPosition = 1.5
        addChild(lefty)
        
        righty = SKSpriteNode(texture: SKTexture(imageNamed: "brassR1"))
        righty.size = CGSize(width: (frame.maxX/3), height: (frame.maxY/5))
        righty.name = "righty"
        righty.position = CGPoint(x: -10000, y: -10000)
        righty.zPosition = 1.5
        addChild(righty)
        
        sheets = SKSpriteNode(texture: SKTexture(imageNamed: "sheets"))
        sheets.position = CGPoint(x: frame.midX * 3.25, y: frame.midY);
        sheets.zPosition = 1.0;
        sheets.size = CGSize(width: frame.maxX/2 , height: frame.maxY/4)
        sheets.name = "sheets"
        addChild(sheets)
        
        bread2 = SKSpriteNode(texture: SKTexture(imageNamed: "bread2"))
        bread2.zPosition = 1.2;
        bread2.size = CGSize(width: frame.maxX/6, height: frame.maxY/6)
        bread2.name = "bread2"
        addChild(bread2)
        
        duckTalk.position = CGPoint(x: duckStart.x , y: duckStart.y * 0.8)
        duckTalk.fontSize = 30.0;
        duckTalk.fontColor = SKColor.white
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
        
        

        didSetup = 1;
                    
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return }
        let point = touch.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == bread2)
        {
            bread2.position = CGPoint(x: point.x, y: point.y)
            
        }
        if((nodesAtPoint[0] == bread2)&&(nodesAtPoint[1] == prisoner))
        {
            bread2.removeFromParent()
            duckTalk.text = "THIS IS SOME GOOD BREAD COME MAKE MORE FOR ME"
            prisoner.removeFromParent()
            freeman.position = CGPoint(x: frame.midX + (0.10)*frame.midX, y: frame.midY + (0.75)*frame.midY)
        }
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
            print("time for bread2")
            bread2.position = CGPoint(x: frame.midX * 3.35, y: frame.midY);
            brassKnucks.position = CGPoint(x: frame.midX * 3.10, y: frame.midY);
            
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == bread2)
        {
            //test this on iphone might be better on touches moved instead of touches began
            if(bread2.position.x > 287) && (bread2.position.x < 383) //this is wrong now
            {
                if(bread2.position.y > 153)&&(bread2.position.y < 192)
                {
                    
                }
            }
            
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == freeman)
        {
            let duckWin = duckEnding()
            duckWin.size = CGSize(width: 400, height: 600)
            duckWin.scaleMode = .fill
            scene?.view?.presentScene(duckWin)
          
        }
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == brassKnucks)
        {
            brassKnucks.removeFromParent()// they should be on hands now
            brassEquip = 1;
            let brassConvo = brassTalk()
            brassConvo.size = CGSize(width: 600, height: 200)
            brassConvo.scaleMode = .fill
            //removed for now cuz im testing other stuff
           // scene?.view?.presentScene(brassConvo)
        }
        if((nodesAtPoint.count > 0)&&(nodesAtPoint[0] == bed)) || ((nodesAtPoint[0] == bed)&&(nodesAtPoint[1] == righty)) || ((nodesAtPoint[0] == bed)&&(nodesAtPoint[1] == lefty))
        {
            if(brassEquip == 1)
            {
                if(punchPicker == 0)
                {
                    
                    righty.position = (CGPoint(x:-1000,y:-1000))
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                    print("lefty")
                    bedPunchCounter = bedPunchCounter + 1;
               
                 
                }
                else
                {
                    lefty.position = (CGPoint(x: -1000, y:-1000))
                    righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;

                    print("rigfty")
                    bedPunchCounter = bedPunchCounter + 1;
                }
                if(bedPunchCounter == 1)
                {
                    bed.texture = bedb1;
                    
                }
                if(bedPunchCounter == 2)
                {
                    bed.texture = bedb2;
                    
                }
                if(bedPunchCounter == 3)
                {
                    bed.texture = bedb3
                }
                if(bedPunchCounter == 4)
                {
                    bed.texture = bedb4
                }
                
                
            }
            
            
        }
        if((nodesAtPoint.count > 0)&&(nodesAtPoint[0] == doorOne)) || ((nodesAtPoint[0] == doorOne)&&(nodesAtPoint[1] == righty)) || ((nodesAtPoint[0] == doorOne)&&(nodesAtPoint[1] == lefty))
        {
            
            
            //play sound cuz its locked
            if(brassEquip == 1)
            {
                if(punchPicker == 0)
                {
                    
                    righty.position = (CGPoint(x:-1000,y:-1000))
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                    print("lefty")
                    doorPunchCounter = doorPunchCounter + 1;
               
                 
                }
                else
                {
                    lefty.position = (CGPoint(x: -1000, y:-1000))
                    righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                 
                    print("rigfty")
                    doorPunchCounter = doorPunchCounter + 1;
                }
                if(doorPunchCounter == 1)
                {
                    doorOne.texture = doorb1;
                    
                }
                if(doorPunchCounter == 2)
                {
                    doorOne.texture = doorb2;
                    
                }
                if(doorPunchCounter == 3)
                {
                    doorOne.texture = doorb3
                }
                
            }
        }
        
        //nodes at point brass knuckles then change scenes
        
        //if i touch door make locked door sound
        
      
       // prisoner.position = location;
        
        
    }
    func playSound(sound: SKAction)
    {
        run(sound)
    }
    
    
}
