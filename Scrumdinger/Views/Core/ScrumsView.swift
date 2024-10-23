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
                    .listRowBackground(scrum.theme.mainColor)
                }
            }
            .navigationDestination(for: DailyScrum.ID.self) { scrumId in
                if let index = scrums.firstIndex(where: { $0.id == scrumId }) {
                    DetailView(scrum: $scrums[index])
                }
            }
            .navigationDestination(isPresented: $isPresentingNewScrumView, destination: {
                //DetailEditView(scrum: $scrums[store.cursorIndex]) // CS193p code
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            })
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    //scrums.append(DailyScrum.emptyScrum) // CS193p does this via the viewModel intents. Apple's tutorial doesn't append here at all
                    isPresentingNewScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        // Apple's code
        //.sheet(isPresented: $isPresentingNewScrumView) {
        //    NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        //}
        .onChange(of: scenePhase) {
            if scenePhase == .inactive {
                saveAction()
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
