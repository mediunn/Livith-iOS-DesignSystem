//
//  LivithActionButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithActionButtonType: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithActionButtonType] = [.chevron, .plus]

    public var description: String {
        switch self {
        case .chevron: return "chevron"
        case .plus: return "plus"
        }
    }
}

struct LivithActionButtonDetailView: View {
    @State private var title = "더 많은 정보 확인하기"
    @State private var type: LivithActionButtonType = .chevron

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithActionButton(title, type: type) { }
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "title", type: "String", text: $title)
                    PickerControlRow(title: "type", type: "LivithActionButtonType", selection: $type)
                }
            }
        }
        .navigationTitle("LivithActionButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithActionButtonDetailView()
    }
}
