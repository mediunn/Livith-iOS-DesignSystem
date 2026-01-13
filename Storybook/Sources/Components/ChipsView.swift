//
//  ChipsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ChipsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: - LivithChip
                componentSection("LivithChip") {
                    FlowLayout(spacing: 8) {
                        LivithChip("콘서트", style: .selected)
                        LivithChip("페스티벌", style: .status)
                        LivithChip("팬미팅", style: .status)
                        LivithChip("전시회", style: .status)
                    }
                }

                // MARK: - LivithIconBadge
                componentSection("LivithIconBadge") {
                    VStack(alignment: .leading, spacing: 12) {
                        LivithIconBadge.popular("많이 찾는 콘서트 1위")
                        LivithIconBadge(icon: .badge, text: "HOT")
                    }
                }
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Chips")
    }

    private func componentSection<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .notosans(.body1Semibold)
                .foregroundStyle(Color.livithColor(.yellow60))

            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        ChipsView()
    }
}
