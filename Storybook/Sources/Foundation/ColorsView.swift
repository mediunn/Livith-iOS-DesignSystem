//
//  ColorsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ColorsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                colorSection("Gray Scale", colors: [
                    ("Livith Black 100", "black100", Color.LivithColor.black100),
                    ("Livith Black 90", "black90", Color.LivithColor.black90),
                    ("Livith Black 80", "black80", Color.LivithColor.black80),
                    ("Livith Black 50", "black50", Color.LivithColor.black50),
                    ("Livith Black 30", "black30", Color.LivithColor.black30),
                    ("Livith Black 5", "black5", Color.LivithColor.black5),
                    ("Livith White", "white100", Color.LivithColor.white100),
                ])

                colorSection("Main", colors: [
                    ("Livith Yellow 30", "yellow30", Color.LivithColor.yellow30),
                    ("Livith Yellow 60", "yellow60", Color.LivithColor.yellow60),
                ])

                colorSection("Caution", colors: [
                    ("Caution 100", "caution100", Color.LivithColor.caution100),
                ])

                colorSection("Lyrics", colors: [
                    ("Translation", "translation", Color.LivithColor.translation),
                    ("Original", "original", Color.LivithColor.original),
                ])
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Colors")
    }

    private func colorSection(_ title: String, colors: [(String, String, Color.LivithColor)]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .notosans(.body1Semibold)
                .foregroundStyle(Color.livithColor(.white100))

            ForEach(colors, id: \.0) { name, caseName, colorCase in
                colorRow(name: name, caseName: caseName, color: colorCase)
            }
        }
    }

    private func colorRow(name: String, caseName: String, color: Color.LivithColor) -> some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color.color)
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.livithColor(.black50), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .notosans(.body2Semibold)
                    .foregroundStyle(Color.livithColor(.white100))

                Text("Color.livithColor(.\(caseName))")
                    .notosans(.caption1Regular)
                    .foregroundStyle(Color.livithColor(.black30))
            }

            Spacer()
        }
        .padding(12)
        .background(Color.livithColor(.black90))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        ColorsView()
    }
}
