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
            ScrumsView(scrums: $store.scrums) {
                // try to save the scrums
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                // load the scrums
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                            store.scrums = DailyScrum.sampleData
                        } content: { wrapper in
                            ErrorView(errorWrapper: wrapper)
                        }
        }
    }
}
