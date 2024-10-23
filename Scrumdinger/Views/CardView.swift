//
//  CardView.swift
//  Scrumdinger
//
//  Created by Vanya Mutafchieva on 22/10/2024.
//

import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            
            title
            
            Spacer()
            
            HStack {
                attendeesLabel
                Spacer()
                minutesLabel
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
    
    private var title: some View {
        Text(scrum.title)
            .font(.headline)
            .accessibilityAddTraits(.isHeader)
    }
    
    private var attendeesLabel: some View {
        Label("\(scrum.attendees.count)", systemImage: "person.3")
            .accessibilityLabel("\(scrum.attendees.count) attendees")
    }
    
    private var minutesLabel: some View {
        Label("\(scrum.lengthInMinutes)", systemImage: "clock")
            .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
    }
}

#Preview {
    var scrum0 = DailyScrum.sampleData[0]
    var scrum1 = DailyScrum.sampleData[1]
    var scrum2 = DailyScrum.sampleData[2]
    
    VStack {
        CardView(scrum: scrum0)
            .background(scrum0.theme.mainColor)
            .frame(height: 60)
        
        CardView(scrum: scrum1)
            .background(scrum1.theme.mainColor)
            .frame(height: 60)
        
        CardView(scrum: scrum2)
            .background(scrum2.theme.mainColor)
            .frame(height: 60)
    }
    .padding()
}
