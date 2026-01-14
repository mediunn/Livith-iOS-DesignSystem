//
//  LivithFilterButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithFilterButtonStyle: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithFilterButtonStyle] = [.genre, .status]

    public var description: String {
        switch self {
        case .genre: return "genre"
        case .status: return "status"
        }
    }
}

struct LivithFilterButtonDetailView: View {
    @State private var style: LivithFilterButtonStyle = .genre
    @State private var hasSelection = false
    @State private var selectedText = "J-POP"

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithFilterButton(
                    style: style,
                    selectedText: hasSelection ? selectedText : nil,
                    action: { },
                    onClear: hasSelection ? { hasSelection = false } : nil
                )
            }

            Form {
                Section("Properties") {
                    PickerControlRow(title: "style", type: "LivithFilterButtonStyle", selection: $style)
                    ToggleControlRow(title: "hasSelection", type: "Bool", isOn: $hasSelection)

                    if hasSelection {
                        TextControlRow(title: "selectedText", type: "String?", text: $selectedText)
                    }
                }
            }
        }
        .navigationTitle("LivithFilterButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithFilterButtonDetailView()
    }
}
