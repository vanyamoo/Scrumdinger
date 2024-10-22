//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Vanya Mutafchieva on 22/10/2024.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void
    
    var body: some View {
        List($scrums) { $scrum in
            CardView(scrum: scrum)
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
