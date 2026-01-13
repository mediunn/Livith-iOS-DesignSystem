//
//  ToastsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ToastsView: View {
    @State private var showToast = false
    @State private var showSnackBar = false

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 32) {
                    // MARK: - LivithToast
                    componentSection("LivithToast") {
                        LivithButton("Toast 표시", variant: .primary) {
                            showToast = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showToast = false
                            }
                        }
                    }

                    // MARK: - LivithSnackBar
                    componentSection("LivithSnackBar") {
                        LivithButton("SnackBar 표시", variant: .secondary) {
                            showSnackBar = true
                        }
                    }
                }
                .padding()
            }

            if showToast {
                VStack {
                    Spacer()
                    LivithToast(type: .success, message: "저장되었습니다")
                        .padding(.bottom, 100)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.easeInOut, value: showToast)
            }

            if showSnackBar {
                LivithSnackBar(
                    message: "항목이 삭제되었습니다",
                    actionTitle: "실행취소",
                    onActionTapped: {
                        showSnackBar = false
                    },
                    onDismiss: {
                        showSnackBar = false
                    }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.easeInOut, value: showSnackBar)
            }
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Toasts")
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
        ToastsView()
    }
}
