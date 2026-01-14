//
//  LivithTextFieldDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

enum TextFieldTypeOption: String, CaseIterable, CustomStringConvertible {
    case search
    case text
    case comment

    var description: String { rawValue }

    func toType(maxLength: Int) -> LivithTextFieldType {
        switch self {
        case .search: return .search
        case .text: return .text(maxLength: maxLength)
        case .comment: return .comment(maxLength: maxLength)
        }
    }
}

struct LivithTextFieldDetailView: View {
    @State private var text = ""
    @State private var typeOption: TextFieldTypeOption = .search
    @State private var placeholder = "검색어를 입력하세요"
    @State private var maxLength: CGFloat = 100

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithTextField(
                    text: $text,
                    type: typeOption.toType(maxLength: Int(maxLength)),
                    placeholder: placeholder
                )
                .padding(.horizontal, 20)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "placeholder", type: "String", text: $placeholder)
                    PickerControlRow(title: "type", type: "TextFieldType", selection: $typeOption)

                    if typeOption != .search {
                        SliderControlRow(title: "maxLength", type: "Int", value: $maxLength, range: 10...500)
                    }
                }

                Section("State") {
                    HStack {
                        Text("text")
                            .font(.subheadline.weight(.semibold))
                        Spacer()
                        Text(text.isEmpty ? "(empty)" : text)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }
            }
        }
        .navigationTitle("LivithTextField")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithTextFieldDetailView()
    }
}
