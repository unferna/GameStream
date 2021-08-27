//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Fernando Florez on 14/08/21.
//

import SwiftUI

// App LifeCycle
@main
struct GameStreamApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            // 1 - Active (enum = .active)
            // 2 - Inactive (enum = .inactive)
            // 3 - Background (enum = .background)
            print(phase)
        }
    }
}
