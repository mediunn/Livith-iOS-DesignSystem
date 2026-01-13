//
//  CardsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct CardsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: - LivithCard
                componentSection("LivithCard") {
                    HStack(spacing: 12) {
                        LivithCard(
                            imageURL: nil,
                            title: "2026 IU Concert",
                            subtitle: "아이유 콘서트",
                            badge: .status(text: "D-7", remainDays: 7)
                        )
                        .frame(width: 160)

                        LivithCard(
                            imageURL: nil,
                            title: "Selected Card",
                            subtitle: "선택된 카드",
                            isSelected: true
                        )
                        .frame(width: 160)
                    }
                }

                // MARK: - NotchedCardShape
                componentSection("NotchedCardShape") {
                    NotchedCardShape()
                        .fill(Color.livithColor(.black90))
                        .frame(height: 200)
                        .overlay(
                            Text("Notched Card")
                                .notosans(.body2Semibold)
                                .foregroundStyle(Color.livithColor(.white100))
                        )
                }
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Cards")
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
        CardsView()
    }
}
