//
//  TypographyView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct TypographyView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                fontSection("Title", styles: [
                    .title,
                ])

                fontSection("Head", styles: [
                    .headSemibold,
                    .headMedium,
                    .headRegular,
                ])

                fontSection("Body1", styles: [
                    .body1Semibold,
                ])

                fontSection("Body2", styles: [
                    .body2Semibold,
                    .body2Medium,
                    .body2Regular,
                ])

                fontSection("Body3", styles: [
                    .body3Semibold,
                    .body3Medium,
                    .body3Regular,
                ])

                fontSection("Body4", styles: [
                    .body4Semibold,
                    .body4Medium,
                    .body4Regular,
                ])

                fontSection("Caption1", styles: [
                    .caption1Bold,
                    .caption1Semibold,
                    .caption1Regular,
                ])

                fontSection("Caption2", styles: [
                    .caption2Semibold,
                    .caption2Regular,
                ])
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Typography")
    }

    private func fontSection(_ title: String, styles: [Font.Notosans]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .notosans(.body1Semibold)
                .foregroundStyle(Color.livithColor(.yellow30))

            ForEach(styles, id: \.self) { style in
                fontRow(style: style)
            }
        }
    }

    private func fontRow(style: Font.Notosans) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("모두가 라이브를 통해\n빛나는 순간, Livith")
                .notosans(style)
                .foregroundStyle(Color.livithColor(.white100))

            HStack(spacing: 16) {
                Text("\(style.rawValue)")
                    .notosans(.caption1Semibold)
                    .foregroundStyle(Color.livithColor(.black50))

                Text("\(Int(style.size))pt")
                    .notosans(.caption1Regular)
                    .foregroundStyle(Color.livithColor(.black50))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.livithColor(.black90))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        TypographyView()
    }
}
