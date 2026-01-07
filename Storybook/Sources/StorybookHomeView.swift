
//
//  StorybookHomeView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/6/26.
//

import SwiftUI
import LivithDesignSystem

struct StorybookHomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Foundation") {
                    NavigationLink("Colors") {
                        Text("Colors Catalog")
                    }
                    NavigationLink("Typography") {
                        Text("Typography Catalog")
                    }
                    NavigationLink("Icons") {
                        Text("Icons Catalog")
                    }
                }

                Section("Components") {
                    NavigationLink("Buttons") {
                        Text("Buttons Catalog")
                    }
                    NavigationLink("TextFields") {
                        Text("TextFields Catalog")
                    }
                    NavigationLink("Cards") {
                        Text("Cards Catalog")
                    }
                }
            }
            .navigationTitle("Livith Storybook")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("v\(LivithDesignSystem.version)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    StorybookHomeView()
}
