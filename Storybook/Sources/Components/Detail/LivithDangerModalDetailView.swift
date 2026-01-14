//
//  LivithDangerModalDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

enum DangerModalTypeOption: String, CaseIterable, CustomStringConvertible {
    case confirm
    case report

    var description: String { rawValue }
}

struct LivithDangerModalDetailView: View {
    @State private var message = "정말 로그아웃 하시겠어요?"
    @State private var confirmTitle = "로그아웃 할래요"
    @State private var cancelTitle = "취소할래요"
    @State private var typeOption: DangerModalTypeOption = .confirm
    @State private var showModal = false

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithButton("Danger Modal 열기", variant: .pink) {
                    showModal = true
                }
                .padding(.horizontal, 40)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "message", type: "String", text: $message)
                    TextControlRow(title: "confirmTitle", type: "String", text: $confirmTitle)
                    TextControlRow(title: "cancelTitle", type: "String", text: $cancelTitle)
                    PickerControlRow(title: "type", type: "DangerModalType", selection: $typeOption)
                }
            }
        }
        .navigationTitle("LivithDangerModal")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showModal) {
            LivithDangerModal(
                message: message,
                confirmTitle: confirmTitle,
                cancelTitle: cancelTitle,
                type: typeOption == .confirm
                    ? .confirm(onConfirm: { showModal = false })
                    : .report(onConfirm: { _ in showModal = false }),
                onCancel: { showModal = false }
            )
        }
    }
}

#Preview {
    NavigationStack {
        LivithDangerModalDetailView()
    }
}
