//
//  LivithOptionButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

struct LivithOptionButtonDetailView: View {
    @State private var title = "인기순"
    @State private var isSelected = true

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                HStack(spacing: 0) {
                    LivithOptionButton(title, isSelected: isSelected) {
                        isSelected.toggle()
                    }
                    LivithOptionButton("최신순", isSelected: !isSelected) {
                        isSelected.toggle()
                    }
                }
                .padding(4)
                .background(Color.livithColor(.black80))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "title", type: "String", text: $title)
                    ToggleControlRow(title: "isSelected", type: "Bool", isOn: $isSelected)
                }
            }
        }
        .navigationTitle("LivithOptionButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithOptionButtonDetailView()
    }
}
