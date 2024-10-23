//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Vanya Mutafchieva on 23/10/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var scrum: DailyScrum
    
    var body: some View {
        Text(scrum.title)
    }
}

#Preview {
    DetailView(scrum: .constant(DailyScrum.sampleData[0]))
}
