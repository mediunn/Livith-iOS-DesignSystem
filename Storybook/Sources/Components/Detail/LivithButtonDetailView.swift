//
//  LivithButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithButtonVariant: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithButtonVariant] = [.primary, .pink]

    public var description: String {
        switch self {
        case .primary: return "primary"
        case .pink: return "pink"
        }
    }
}

struct LivithButtonDetailView: View {
    @State private var title = "버튼"
    @State private var variant: LivithButtonVariant = .primary
    @State private var isFullWidth = true
    @State private var isLoading = false
    @State private var isDisabled = false

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithButton(title, variant: variant, isFullWidth: isFullWidth, isLoading: isLoading) { }
                    .disabled(isDisabled)
                    .padding(.horizontal, isFullWidth ? 20 : 0)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "title", type: "String", text: $title)
                    PickerControlRow(title: "variant", type: "LivithButtonVariant", selection: $variant)
                    ToggleControlRow(title: "isFullWidth", type: "Bool", isOn: $isFullWidth)
                    ToggleControlRow(title: "isLoading", type: "Bool", isOn: $isLoading)
                    ToggleControlRow(title: "disabled", type: "Bool", isOn: $isDisabled)
                }
            }
        }
        .navigationTitle("LivithButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithButtonDetailView()
    }
}
