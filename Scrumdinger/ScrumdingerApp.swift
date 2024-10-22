//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Vanya Mutafchieva on 22/10/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
