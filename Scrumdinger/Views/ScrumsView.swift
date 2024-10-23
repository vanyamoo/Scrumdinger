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
        NavigationStack {
            List {
                ForEach(scrums) { scrum in
                    NavigationLink(value: scrum.id) { // value needs to match the Type in .navigationDestination
                        CardView(scrum: scrum)
                    }
                }
            }
            .navigationDestination(for: DailyScrum.ID.self) { scrumId in
                if let index = scrums.firstIndex(where: { $0.id == scrumId }) {
                    DetailView(scrum: $scrums[index])
                }
            }
            .navigationTitle("Daily Scrums")
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
