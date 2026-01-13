//
//  ModalsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ModalsView: View {
    @State private var showModal = false
    @State private var showDangerModal = false

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: - LivithModal
                componentSection("LivithModal") {
                    LivithButton("Modal 열기", variant: .primary) {
                        showModal = true
                    }
                }

                // MARK: - LivithDangerModal
                componentSection("LivithDangerModal") {
                    LivithButton("Danger Modal 열기", variant: .secondary) {
                        showDangerModal = true
                    }
                }

                // MARK: - LivithBottomSheet
                componentSection("LivithBottomSheet") {
                    Text("BottomSheet는 .sheet modifier로 사용합니다")
                        .notosans(.body3Regular)
                        .foregroundStyle(Color.livithColor(.black50))
                }
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Modals")
        .fullScreenCover(isPresented: $showModal) {
            LivithModal(
                type: .welcome(nickname: "리비터"),
                confirmTitle: "시작하기",
                onConfirm: {
                    showModal = false
                }
            )
        }
        .fullScreenCover(isPresented: $showDangerModal) {
            LivithDangerModal(
                message: "정말 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.",
                confirmTitle: "삭제",
                cancelTitle: "취소",
                type: .confirm(onConfirm: {
                    showDangerModal = false
                }),
                onCancel: {
                    showDangerModal = false
                }
            )
        }
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
        ModalsView()
    }
}
