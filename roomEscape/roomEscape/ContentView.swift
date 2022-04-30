//
//  ContentView.swift
//  roomEscape
//
//  Created by student on 4/18/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = firstRoom()
        scene.size = CGSize(width: 600, height: 200)
        scene.scaleMode = .fill
        return scene
    }
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 600, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
