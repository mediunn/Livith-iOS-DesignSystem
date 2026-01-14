//
//  ModalsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ModalsView: View {
    var body: some View {
        List {
            NavigationLink("LivithModal") {
                LivithModalDetailView()
            }
            NavigationLink("LivithDangerModal") {
                LivithDangerModalDetailView()
            }
        }
        .navigationTitle("Modals")
    }
}

#Preview {
    NavigationStack {
        ModalsView()
    }
}
