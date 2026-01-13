//
//  ButtonsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ButtonsView: View {
    @State private var toggleState = false

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: - LivithButton
                componentSection("LivithButton") {
                    VStack(spacing: 12) {
                        LivithButton("Primary 스타일", variant: .primary) { }
                        LivithButton("Secondary 스타일", variant: .secondary) { }
                        LivithButton("Pink 스타일", variant: .pink) { }
                        LivithButton("Dark 스타일", variant: .dark) { }
                        LivithButton("Disabled", variant: .primary) { }
                            .disabled(true)
                    }
                }

                // MARK: - LivithActionButton
                componentSection("LivithActionButton") {
                    HStack(spacing: 12) {
                        LivithActionButton("더 많은 정보 확인하기", type: .chevron) { }
                        LivithActionButton("관심 콘서트 설정하기", type: .plus) { }
                    }
                }

                // MARK: - LivithConfirmButton
                componentSection("LivithConfirmButton") {
                    HStack(spacing: 12) {
                        LivithConfirmButton("중복확인", variant: .dark) { }
                        LivithConfirmButton("등록", variant: .primary) { }
                    }
                }

                // MARK: - LivithFilterButton
                componentSection("LivithFilterButton") {
                    HStack(spacing: 8) {
                        LivithFilterButton(style: .genre, action: { })
                        LivithFilterButton(style: .status, selectedText: "진행중", action: { }, onClear: { })
                    }
                }

                // MARK: - LivithToggleButton
                componentSection("LivithToggleButton") {
                    HStack(spacing: 8) {
                        LivithToggleButton("원어", isOn: true, style: .original) {
                            toggleState.toggle()
                        }
                        LivithToggleButton("해석", isOn: false, style: .translation) { }
                    }
                }

                // MARK: - LivithOptionButton
                componentSection("LivithOptionButton") {
                    HStack(spacing: 0) {
                        LivithOptionButton("인기순", isSelected: true) { }
                        LivithOptionButton("최신순", isSelected: false) { }
                    }
                    .padding(4)
                    .background(Color.livithColor(.black80))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                // MARK: - LivithLoginButton
                componentSection("LivithLoginButton") {
                    VStack(spacing: 12) {
                        LivithLoginButton(provider: .kakao) { }
                        LivithLoginButton(provider: .apple) { }
                    }
                }
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Buttons")
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
        ButtonsView()
    }
}
