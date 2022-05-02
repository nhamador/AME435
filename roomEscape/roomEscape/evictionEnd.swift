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
import AVFoundation
class evictionEnd: SKScene, SKPhysicsContactDelegate
{
    var sound = SKAction.playSoundFileNamed("nolandlord", waitForCompletion: true)

    var player: AVAudioPlayer!
    var endText = SKLabelNode(fontNamed: "Papyrus")
    var endText2 = SKLabelNode(fontNamed: "Papyrus")
    var beEvicted = SKLabelNode(fontNamed: "Helvetica")
    var noMoreRent = SKLabelNode(fontNamed: "Papyrus")
    var land1: SKTexture!
    var land2: SKTexture!
    var land3: SKTexture!
    var land4: SKTexture!
    var landPunch1: SKTexture!
    var landPunch2: SKTexture!
    var landPunch3: SKTexture!
    var landPunch4: SKTexture!
    var landPunch5: SKTexture!
    var landPunch6: SKTexture!
    var landPunch7: SKTexture!
    var landPunch8: SKTexture!
    var landlord: SKSpriteNode!
    var talkArray: [SKTexture] = []
    var punchArray: [SKTexture] = []
    var isPunching = 0
    var punchCounter = 0
    var punchPicker = 0
    var punchSeq: SKAction!
    var landTalk: SKAction!
    var talkSeq: SKAction!
    var tapCounter = 0;
    var lefty: SKSpriteNode!
    var righty: SKSpriteNode!
    var leftHook : SKAction!
    var rightHook : SKAction!
    var brassPunchl1 : SKTexture!
    var brassPunchl2: SKTexture!
    var brassPunchr1: SKTexture!
    var brassPunchr2: SKTexture!
    var empty : SKTexture!
    var brassLeftArray: [SKTexture] = []
    var brassRightArray: [SKTexture] = []
    override func didMove(to view: SKView)
    {
        
        
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
        
        brassPunchl1 = SKTexture(imageNamed: "brasspunchl1")
        brassPunchl2 = SKTexture(imageNamed: "brasspunchl2")
        brassPunchr1 = SKTexture(imageNamed: "brasspunchr1")
        brassPunchr2 = SKTexture(imageNamed: "brasspunchr2")
        empty = SKTexture(imageNamed: "empty")
        brassLeftArray = [brassPunchl1, brassPunchl2,brassPunchl1, brassPunchl2, empty]
        brassRightArray = [brassPunchr1, brassPunchr2, brassPunchr1, brassPunchr2, empty]
        leftHook = SKAction.animate(with: brassLeftArray, timePerFrame: 0.3)
        rightHook = SKAction.animate(with: brassRightArray, timePerFrame: 0.3)
        
        let background = SKSpriteNode(imageNamed: "wall")
        background.size = CGSize(width: frame.width * 3, height: frame.height * 1)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        
        beEvicted.fontSize = 30.0;
        beEvicted.fontColor = SKColor.white
        beEvicted.zPosition = 1.2;
        beEvicted.text = "BE EVICTED"
        addChild(beEvicted)
        
        
        noMoreRent.fontSize = 30.0;
        noMoreRent.fontColor = SKColor.white
        noMoreRent.zPosition = 1.2;
        noMoreRent.text = "NO"
        endText.text = "WHAT"
        endText2.text = "?"
        addChild(noMoreRent)
        
        endText.position = CGPoint(x: frame.midX , y: frame.midY * (1.75))
        endText.fontSize = 30.0;
        endText.fontColor = SKColor.white
        endText.zPosition = 1.1;
        endText.text = "YOU HAVE RUINED"
        addChild(endText)
        
        endText2.position = CGPoint(x: frame.midX , y: frame.midY * (1.55))
        endText2.fontSize = 30.0;
        endText2.fontColor = SKColor.white
        endText2.zPosition = 1.1;
        endText2.text = "YOUR BEAUTIFUL ROOM"
        addChild(endText2)
        
        land1 = SKTexture(imageNamed:"landlord1")
        land2 = SKTexture(imageNamed:"landlord2")
        land3 = SKTexture(imageNamed:"landlord3")
        land4 = SKTexture(imageNamed:"landlord4")
        
        landPunch1 = SKTexture(imageNamed:"landPunch1")
        landPunch2 = SKTexture(imageNamed:"landPunch2")
        landPunch3 = SKTexture(imageNamed:"landPunch3")
        landPunch4 = SKTexture(imageNamed:"landPunch4")
        landPunch5 = SKTexture(imageNamed:"landPunch5")
        landPunch6 = SKTexture(imageNamed:"landPunch6")
        landPunch7 = SKTexture(imageNamed:"landPunch7")
        landPunch8 = SKTexture(imageNamed:"landPunch8")
        
        

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
       
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == landlord)
        {
            tapCounter = tapCounter+1
            if(tapCounter == 1)
            {
                endText.text = "AS YOUR LANDLORD"
                endText2.text = "PREPARE TO BE..."
            }
            if(tapCounter == 2)
            {
                endText.text = "EVICTED"
                endText2.text = "!!!!"
            }
            if(tapCounter == 3)
            {
                noMoreRent.position = CGPoint(x: frame.midX * (0.50) , y: frame.midY * (0.75))
                beEvicted.position = CGPoint(x: frame.midX * (1.60) , y: frame.midY * (0.75))
                landlord.removeAllActions()
            }
            switch(punchCounter)
            {
            case 0:
                if(isPunching == 1)
                {
                    landlord.texture = landPunch1
                    punchCounter = punchCounter + 1;
                    if(punchPicker == 0)
                    {
                        righty.position = (CGPoint(x:-10000,y:-1000))
                        lefty.position = point
                        lefty.run(leftHook)
                        punchPicker = 1;
                    }
                    else
                    {
                        lefty.position = (CGPoint(x: -10000, y:-10000)); righty.position = point
                        righty.run(rightHook)
                        punchPicker = 0;
                      
                    }
                }
                break;
            case 1:
                landlord.texture = landPunch2
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                        righty.position = (CGPoint(x:-10000,y:-1000))
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));             righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 2:
                landlord.texture = landPunch3
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                    righty.position = (CGPoint(x:-10000,y:-1000));
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));
                    righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 3:
                landlord.texture = landPunch4
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                    righty.position = (CGPoint(x:-10000,y:-1000));
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));                righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 4:
                landlord.texture = landPunch5
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                    righty.position = (CGPoint(x:-10000,y:-1000));
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));                righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 5:
                landlord.texture = landPunch6
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                    righty.position = (CGPoint(x:-10000,y:-1000));
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));            righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 6:
                landlord.texture = landPunch7
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                    righty.position = (CGPoint(x:-10000,y:-1000));
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));               righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 7:
                landlord.texture = landPunch8
                punchCounter = punchCounter + 1;
                if(punchPicker == 0)
                {
                    righty.position = (CGPoint(x:-10000,y:-1000));
                    lefty.position = point
                    lefty.run(leftHook)
                    punchPicker = 1;
                }
                else
                {
                    lefty.position = (CGPoint(x: -10000, y:-10000));                    righty.position = point
                    righty.run(rightHook)
                    punchPicker = 0;
                  
                }
                break;
            case 8:
                endText.text = "YOU WON"
                endText2.text = "I THINK ..."
                playSound(sound: sound)

              
                break;
            default:
                break;
                
            
            }
            
        }
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == noMoreRent)
        {
            isPunching = 1
            noMoreRent.removeFromParent()
            beEvicted.removeFromParent()

        }
        if(nodesAtPoint.count > 0)&&(nodesAtPoint[0] == beEvicted)
        {
            noMoreRent.removeFromParent()
            beEvicted.removeFromParent()
            let eviction = homeless()
            eviction.size = CGSize(width: 400, height: 600)
            eviction.scaleMode = .fill
            scene?.view?.presentScene(eviction)

            //transition scene
        }
    }

    func playSound(sound: SKAction)
    {
        run(sound)
    }

}

