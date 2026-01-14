//
//  LivithConfirmButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithConfirmButtonVariant: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithConfirmButtonVariant] = [.dark, .primary]

    public var description: String {
        switch self {
        case .dark: return "dark"
        case .primary: return "primary"
        }
    }
}

struct LivithConfirmButtonDetailView: View {
    @State private var title = "중복확인"
    @State private var variant: LivithConfirmButtonVariant = .dark
    @State private var isDisabled = false

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithConfirmButton(title, variant: variant) { }
                    .disabled(isDisabled)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "title", type: "String", text: $title)
                    PickerControlRow(title: "variant", type: "LivithConfirmButtonVariant", selection: $variant)
                    ToggleControlRow(title: "disabled", type: "Bool", isOn: $isDisabled)
                }
            }
        }
        .navigationTitle("LivithConfirmButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithConfirmButtonDetailView()
    }
}
