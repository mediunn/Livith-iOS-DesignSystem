//
//  LivithSnackBarDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

struct LivithSnackBarDetailView: View {
    @State private var message = "항목이 삭제되었습니다"
    @State private var actionTitle = "실행취소"
    @State private var showSnackBar = false

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                VStack {
                    if showSnackBar {
                        LivithSnackBar(
                            message: message,
                            actionTitle: actionTitle,
                            onActionTapped: { showSnackBar = false },
                            onDismiss: { showSnackBar = false }
                        )
                        .padding(.horizontal, 16)
                    }

                    LivithButton("SnackBar 표시", variant: .primary) {
                        showSnackBar = true
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, showSnackBar ? 20 : 0)
                }
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "message", type: "String", text: $message)
                    TextControlRow(title: "actionTitle", type: "String", text: $actionTitle)
                }
            }
        }
        .navigationTitle("LivithSnackBar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithSnackBarDetailView()
    }
}
