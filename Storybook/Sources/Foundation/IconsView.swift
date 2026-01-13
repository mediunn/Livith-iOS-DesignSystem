//
//  IconsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct IconsView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    private let icons: [Image.LivithIcon] = [
        .apple, .badge, .backLineDefault, .backLinePressed,
        .calendarLine, .cautionFill, .cautionTriangleBig, .cautionTriangleSmall,
        .change, .checkRed, .checkYellow,
        .checkboxFillDefault, .checkboxFillEnabled, .checkboxLineDefault, .checkboxLineEnabled,
        .closeLineSmall, .deleteFillDefault, .deleteFillPressed,
        .down1_5LineSmall, .downLineSmall, .upLineSmall,
        .durationLine, .earth, .genreLine, .help,
        .homeDisabled, .homeEnabled, .homePressed,
        .kakao, .linkBlackFill, .linkGrayFill, .locationLine,
        .myDisabled, .myEnabled, .myPressed,
        .playFillDefault, .playFillPressed,
        .plusFillBig, .plusLine, .plusLineSmall,
        .profile, .profileBig,
        .rightLineDefault, .rightLinePressed, .rightLineSmall,
        .searchLineDefault, .searchLinePressed, .searchLineVariant2,
        .settingLine, .ticketDisabled, .ticketEnabled, .ticketPressed,
        .trash
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(icons, id: \.self) { icon in
                    iconItem(icon)
                }
            }
            .padding()
        }
        .background(Color.livithColor(.black100))
        .navigationTitle("Icons (\(icons.count))")
    }

    private func iconItem(_ icon: Image.LivithIcon) -> some View {
        VStack(spacing: 12) {
            Image.livithIcon(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color.livithColor(.white100))

            Text(icon.rawValue.replacingOccurrences(of: "icn_", with: ""))
                .notosans(.caption1Semibold)
                .foregroundStyle(Color.livithColor(.black30))
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .padding(.horizontal, 12)
        .background(Color.livithColor(.black90))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        IconsView()
    }
}
