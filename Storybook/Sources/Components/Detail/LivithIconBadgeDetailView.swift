//
//  LivithIconBadgeDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

struct LivithIconBadgeDetailView: View {
    @State private var text = "많이 찾는 콘서트 1위"
    @State private var usePopularStyle = true

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                if usePopularStyle {
                    LivithIconBadge.popular(text)
                } else {
                    LivithIconBadge(icon: .badge, text: text)
                }
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "text", type: "String", text: $text)
                    ToggleControlRow(title: "usePopularStyle", type: "Bool", isOn: $usePopularStyle)
                }
            }
        }
        .navigationTitle("LivithIconBadge")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithIconBadgeDetailView()
    }
}
