//
//  CardsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct CardsView: View {
    var body: some View {
        List {
            NavigationLink("LivithCard") {
                LivithCardDetailView()
            }
        }
        .navigationTitle("Cards")
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
}
