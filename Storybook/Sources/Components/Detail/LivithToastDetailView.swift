//
//  LivithToastDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithToastType: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithToastType] = [.success, .failure, .deletionSuccess]

    public var description: String {
        switch self {
        case .success: return "success"
        case .failure: return "failure"
        case .deletionSuccess: return "deletionSuccess"
        }
    }
}

struct LivithToastDetailView: View {
    @State private var type: LivithToastType = .success
    @State private var message = "저장되었습니다"
    @State private var showToast = false

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                VStack {
                    LivithToast(type: type, message: message)

                    LivithButton("Toast 표시", variant: .primary) {
                        showToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showToast = false
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                }
            }

            Form {
                Section("Properties") {
                    PickerControlRow(title: "type", type: "LivithToastType", selection: $type)
                    TextControlRow(title: "message", type: "String", text: $message)
                }
            }
        }
        .navigationTitle("LivithToast")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithToastDetailView()
    }
}
