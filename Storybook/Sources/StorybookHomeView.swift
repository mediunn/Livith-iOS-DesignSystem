//
//  StorybookHomeView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/6/26.
//

import SwiftUI
import LivithDesignSystem

struct StorybookHomeView: View {
    private var lastModifiedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }

    private func navigationRow<Destination: View>(_ title: String, @ViewBuilder destination: () -> Destination) -> some View {
        NavigationLink {
            destination()
        } label: {
            Text(title)
                .notosans(.body3Medium)
                .foregroundStyle(Color.livithColor(.white100))
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    navigationRow("Colors") { ColorsView() }
                    navigationRow("Typography") { TypographyView() }
                    navigationRow("Icons") { IconsView() }
                } header: {
                    Text("Foundation")
                        .notosans(.body2Semibold)
                        .foregroundStyle(Color.livithColor(.white100))
                        .textCase(.none)
                }

                Section {
                    navigationRow("Buttons") { ButtonsView() }
                    navigationRow("TextFields") { TextFieldsView() }
                    navigationRow("Cards") { CardsView() }
                    navigationRow("Chips") { ChipsView() }
                    navigationRow("Modals") { ModalsView() }
                    navigationRow("Toasts") { ToastsView() }
                } header: {
                    Text("Components")
                        .notosans(.body2Semibold)
                        .foregroundStyle(Color.livithColor(.white100))
                        .textCase(.none)
                }

                Section {
                    Text("Last Updated: \(lastModifiedDate)")
                        .notosans(.caption1Regular)
                        .foregroundStyle(Color.livithColor(.black50))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowBackground(Color.clear)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.livithColor(.black100))
            .navigationTitle("Livith Storybook")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    StorybookHomeView()
}
