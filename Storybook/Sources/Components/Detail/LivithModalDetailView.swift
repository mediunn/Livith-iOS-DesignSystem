//
//  LivithModalDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

enum ModalTypeOption: String, CaseIterable, CustomStringConvertible {
    case welcome
    case error

    var description: String { rawValue }
}

struct LivithModalDetailView: View {
    @State private var typeOption: ModalTypeOption = .welcome
    @State private var nickname = "리비터"
    @State private var errorTitle = "오류가 발생했어요"
    @State private var errorMessage = "다시 시도해주세요"
    @State private var confirmTitle = "확인"
    @State private var showModal = false

    private var modalType: LivithModalType {
        switch typeOption {
        case .welcome: return .welcome(nickname: nickname)
        case .error: return .error(title: errorTitle, message: errorMessage)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithButton("Modal 열기", variant: .primary) {
                    showModal = true
                }
                .padding(.horizontal, 40)
            }

            Form {
                Section("Properties") {
                    PickerControlRow(title: "type", type: "LivithModalType", selection: $typeOption)

                    if typeOption == .welcome {
                        TextControlRow(title: "nickname", type: "String", text: $nickname)
                    } else {
                        TextControlRow(title: "errorTitle", type: "String", text: $errorTitle)
                        TextControlRow(title: "errorMessage", type: "String", text: $errorMessage)
                    }

                    TextControlRow(title: "confirmTitle", type: "String", text: $confirmTitle)
                }
            }
        }
        .navigationTitle("LivithModal")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showModal) {
            LivithModal(
                type: modalType,
                confirmTitle: confirmTitle,
                onConfirm: {
                    showModal = false
                }
            )
        }
    }
}

#Preview {
    NavigationStack {
        LivithModalDetailView()
    }
}
