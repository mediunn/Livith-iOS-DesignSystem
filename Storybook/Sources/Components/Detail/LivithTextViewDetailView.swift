//
//  LivithTextViewDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

enum TextViewTypeOption: String, CaseIterable, CustomStringConvertible {
    case basic
    case report

    var description: String { rawValue }

    func toType(maxLength: Int) -> LivithTextViewType {
        switch self {
        case .basic: return .basic(maxLength: maxLength)
        case .report: return .report(maxLength: maxLength)
        }
    }
}

struct LivithTextViewDetailView: View {
    @State private var text = ""
    @State private var typeOption: TextViewTypeOption = .basic
    @State private var placeholder = "내용을 입력하세요"
    @State private var maxLength: CGFloat = 500
    @State private var height: CGFloat = 172

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithTextView(
                    text: $text,
                    type: typeOption.toType(maxLength: Int(maxLength)),
                    placeholder: placeholder,
                    height: height
                )
                .padding(.horizontal, 20)
            }

            Form {
                Section("Properties") {
                    TextControlRow(title: "placeholder", type: "String", text: $placeholder)
                    PickerControlRow(title: "type", type: "TextViewType", selection: $typeOption)
                    SliderControlRow(title: "maxLength", type: "Int", value: $maxLength, range: 50...1000)
                    SliderControlRow(title: "height", type: "CGFloat", value: $height, range: 100...300)
                }

                Section("State") {
                    HStack {
                        Text("text.count")
                            .font(.subheadline.weight(.semibold))
                        Spacer()
                        Text("\(text.count)")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("LivithTextView")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithTextViewDetailView()
    }
}
