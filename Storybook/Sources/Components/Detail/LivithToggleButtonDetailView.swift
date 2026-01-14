//
//  LivithToggleButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithToggleButtonStyle: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithToggleButtonStyle] = [.original, .pronunciation, .translation, .fanchant]

    public var description: String {
        switch self {
        case .original: return "original"
        case .pronunciation: return "pronunciation"
        case .translation: return "translation"
        case .fanchant: return "fanchant"
        }
    }
}

struct LivithToggleButtonDetailView: View {
    @State private var title = "원어"
    @State private var isOn = true
    @State private var style: LivithToggleButtonStyle = .original

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithToggleButton(title, isOn: isOn, style: style) {
                    isOn.toggle()
                }
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "title", type: "String", text: $title)
                    ToggleControlRow(title: "isOn", type: "Bool", isOn: $isOn)
                    PickerControlRow(title: "style", type: "LivithToggleButtonStyle", selection: $style)
                }
            }
        }
        .navigationTitle("LivithToggleButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithToggleButtonDetailView()
    }
}
