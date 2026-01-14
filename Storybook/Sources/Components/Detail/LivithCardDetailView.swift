//
//  LivithCardDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

enum CardBadgeOption: String, CaseIterable, CustomStringConvertible {
    case none
    case status
    case tag

    var description: String { rawValue }
}

struct LivithCardDetailView: View {
    @State private var title = "2026 IU Concert"
    @State private var subtitle = "아이유 콘서트"
    @State private var hasSubtitle = true
    @State private var badgeOption: CardBadgeOption = .status
    @State private var badgeText = "D-7"
    @State private var remainDays: CGFloat = 7
    @State private var isSelected = false

    private var badge: LivithCardBadge {
        switch badgeOption {
        case .none: return .none
        case .status: return .status(text: badgeText, remainDays: Int(remainDays))
        case .tag: return .tag(text: badgeText)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithCard(
                    imageURL: nil,
                    title: title,
                    subtitle: hasSubtitle ? subtitle : nil,
                    badge: badge,
                    isSelected: isSelected
                )
                .frame(width: 160)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "title", type: "String", text: $title)
                    ToggleControlRow(title: "hasSubtitle", type: "Bool", isOn: $hasSubtitle)

                    if hasSubtitle {
                        TextControlRow(title: "subtitle", type: "String?", text: $subtitle)
                    }

                    ToggleControlRow(title: "isSelected", type: "Bool", isOn: $isSelected)
                }

                Section("Badge") {
                    PickerControlRow(title: "badge", type: "LivithCardBadge", selection: $badgeOption)

                    if badgeOption != .none {
                        TextControlRow(title: "badgeText", type: "String", text: $badgeText)

                        if badgeOption == .status {
                            SliderControlRow(title: "remainDays", type: "Int", value: $remainDays, range: 0...30)
                        }
                    }
                }
            }
        }
        .navigationTitle("LivithCard")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithCardDetailView()
    }
}
