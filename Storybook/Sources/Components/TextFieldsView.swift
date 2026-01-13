//
//  TextFieldsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct TextFieldsView: View {
    @State private var searchText = ""
    @State private var inputText = ""
    @State private var commentText = ""
    @State private var textViewText = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: - LivithTextField (Search)
                componentSection("LivithTextField - Search") {
                    LivithTextField(
                        text: $searchText,
                        type: .search,
                        placeholder: "검색어를 입력하세요"
                    )
                }

                // MARK: - LivithTextField (Text)
                componentSection("LivithTextField - Text") {
                    LivithTextField(
                        text: $inputText,
                        type: .text(maxLength: 100),
                        placeholder: "텍스트를 입력하세요"
                    )
                }

                // MARK: - LivithTextField (Comment)
                componentSection("LivithTextField - Comment") {
                    LivithTextField(
                        text: $commentText,
                        type: .comment(maxLength: 500),
                        placeholder: "댓글을 입력하세요"
                    )
                }

                // MARK: - LivithTextView
                componentSection("LivithTextView") {
                    LivithTextView(
                        text: $textViewText,
                        type: .basic(maxLength: 500),
                        placeholder: "내용을 입력하세요"
                    )
                }

                // MARK: - MarqueeText
                componentSection("MarqueeText") {
                    MarqueeText(
                        text: "이것은 길어서 스크롤되는 텍스트입니다. MarqueeText 컴포넌트를 사용하면 긴 텍스트가 자동으로 스크롤됩니다.",
                        font: .body1Semibold,
                        textColor: Color.livithColor(.white100)
                    )
                    .frame(height: 30)
                }
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("TextFields")
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
        TextFieldsView()
    }
}
