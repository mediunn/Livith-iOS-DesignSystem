//
//  ChipsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ChipsView: View {
    var body: some View {
        List {
            NavigationLink("LivithChip") {
                LivithChipDetailView()
            }
            NavigationLink("LivithIconBadge") {
                LivithIconBadgeDetailView()
            }
        }
        .navigationTitle("Chips")
    }
}

#Preview {
    NavigationStack {
        ChipsView()
    }
}
