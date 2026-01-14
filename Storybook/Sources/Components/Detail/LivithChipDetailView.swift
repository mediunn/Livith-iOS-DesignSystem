//
//  LivithChipDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithChipStyle: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithChipStyle] = [.status, .selected, .tag, .dark, .outline]

    public var description: String {
        switch self {
        case .status: return "status"
        case .selected: return "selected"
        case .tag: return "tag"
        case .dark: return "dark"
        case .outline: return "outline"
        }
    }
}

struct LivithChipDetailView: View {
    @State private var text = "D-3"
    @State private var style: LivithChipStyle = .status

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithChip(text, style: style)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "text", type: "String", text: $text)
                    PickerControlRow(title: "style", type: "LivithChipStyle", selection: $style)
                }
            }
        }
        .navigationTitle("LivithChip")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithChipDetailView()
    }
}
