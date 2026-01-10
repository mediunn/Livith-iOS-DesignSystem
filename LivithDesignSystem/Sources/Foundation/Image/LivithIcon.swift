//
//  LivithIcon.swift
//  LivithDesignSystem
//
//  Created by Youjin Lee on 1/12/26.
//  Copyright © 2026 Livith. All rights reserved.
//

import SwiftUI

public extension Image {
    enum LivithIcon {
        case apple
        case badge
        case backLineDefault, backLinePressed
        case calendarLine
        case cautionFill
        case cautionTriangleBig, cautionTriangleSmall
        case change
        case checkRed, checkYellow
        case checkboxFillDefault, checkboxFillEnabled
        case checkboxLineDefault, checkboxLineEnabled
        case closeLineSmall
        case deleteFillDefault, deleteFillPressed
        case down1_5LineSmall, downLineSmall
        case upLineSmall
        case durationLine
        case earth
        case genreLine
        case help
        case homeDisabled, homeEnabled, homePressed
        case kakao
        case linkBlackFill, linkGrayFill
        case locationLine
        case myDisabled, myEnabled, myPressed
        case playFillDefault, playFillPressed
        case plusFillBig, plusLine, plusLineSmall
        case profile, profileBig
        case rightLineDefault, rightLinePressed, rightLineSmall
        case searchLineDefault, searchLinePressed, searchLineVariant2
        case settingLine
        case ticketDisabled, ticketEnabled, ticketPressed
        case trash

        public var image: Image {
            switch self {
            case .apple:
                LivithDesignSystemAsset.ImageAssets.icnApple.swiftUIImage
            case .badge:
                LivithDesignSystemAsset.ImageAssets.icnBadge.swiftUIImage
            case .backLineDefault:
                LivithDesignSystemAsset.ImageAssets.icnBackLineDefault.swiftUIImage
            case .backLinePressed:
                LivithDesignSystemAsset.ImageAssets.icnBackLinePressed.swiftUIImage
            case .calendarLine:
                LivithDesignSystemAsset.ImageAssets.icnCalendarLine.swiftUIImage
            case .cautionFill:
                LivithDesignSystemAsset.ImageAssets.icnCautionFill.swiftUIImage
            case .cautionTriangleBig:
                LivithDesignSystemAsset.ImageAssets.icnCautionTriangleBig.swiftUIImage
            case .cautionTriangleSmall:
                LivithDesignSystemAsset.ImageAssets.icnCautionTriangleSmall.swiftUIImage
            case .change:
                LivithDesignSystemAsset.ImageAssets.icnChange.swiftUIImage
            case .checkRed:
                LivithDesignSystemAsset.ImageAssets.icnCheckRed.swiftUIImage
            case .checkYellow:
                LivithDesignSystemAsset.ImageAssets.icnCheckYellow.swiftUIImage
            case .checkboxFillDefault:
                LivithDesignSystemAsset.ImageAssets.icnCheckboxFillDefault.swiftUIImage
            case .checkboxFillEnabled:
                LivithDesignSystemAsset.ImageAssets.icnCheckboxFillEnabled.swiftUIImage
            case .checkboxLineDefault:
                LivithDesignSystemAsset.ImageAssets.icnCheckboxLineDefault.swiftUIImage
            case .checkboxLineEnabled:
                LivithDesignSystemAsset.ImageAssets.icnCheckboxLineEnabled.swiftUIImage
            case .closeLineSmall:
                LivithDesignSystemAsset.ImageAssets.icnCloseLineSmall.swiftUIImage
            case .deleteFillDefault:
                LivithDesignSystemAsset.ImageAssets.icnDeleteFillDefault.swiftUIImage
            case .deleteFillPressed:
                LivithDesignSystemAsset.ImageAssets.icnDeleteFillPressed.swiftUIImage
            case .down1_5LineSmall:
                LivithDesignSystemAsset.ImageAssets.icnDown15LineSmall.swiftUIImage
            case .downLineSmall:
                LivithDesignSystemAsset.ImageAssets.icnDownLineSmall.swiftUIImage
            case .durationLine:
                LivithDesignSystemAsset.ImageAssets.icnDurationLine.swiftUIImage
            case .earth:
                LivithDesignSystemAsset.ImageAssets.icnEarth.swiftUIImage
            case .genreLine:
                LivithDesignSystemAsset.ImageAssets.icnGenreLine.swiftUIImage
            case .help:
                LivithDesignSystemAsset.ImageAssets.icnHelp.swiftUIImage
            case .homeDisabled:
                LivithDesignSystemAsset.ImageAssets.icnHomeDisabled.swiftUIImage
            case .homeEnabled:
                LivithDesignSystemAsset.ImageAssets.icnHomeEnabled.swiftUIImage
            case .homePressed:
                LivithDesignSystemAsset.ImageAssets.icnHomePressed.swiftUIImage
            case .kakao:
                LivithDesignSystemAsset.ImageAssets.icnKakao.swiftUIImage
            case .linkBlackFill:
                LivithDesignSystemAsset.ImageAssets.icnLinkBlackFill.swiftUIImage
            case .linkGrayFill:
                LivithDesignSystemAsset.ImageAssets.icnLinkGrayFill.swiftUIImage
            case .locationLine:
                LivithDesignSystemAsset.ImageAssets.icnLocationLine.swiftUIImage
            case .myDisabled:
                LivithDesignSystemAsset.ImageAssets.icnMyDisabled.swiftUIImage
            case .myEnabled:
                LivithDesignSystemAsset.ImageAssets.icnMyEnabled.swiftUIImage
            case .myPressed:
                LivithDesignSystemAsset.ImageAssets.icnMyPressed.swiftUIImage
            case .playFillDefault:
                LivithDesignSystemAsset.ImageAssets.icnPlayFillDefault.swiftUIImage
            case .playFillPressed:
                LivithDesignSystemAsset.ImageAssets.icnPlayFillPressed.swiftUIImage
            case .plusFillBig:
                LivithDesignSystemAsset.ImageAssets.icnPlusFillBig.swiftUIImage
            case .plusLine:
                LivithDesignSystemAsset.ImageAssets.icnPlusLine.swiftUIImage
            case .plusLineSmall:
                LivithDesignSystemAsset.ImageAssets.icnPlusLineSmall.swiftUIImage
            case .profile:
                LivithDesignSystemAsset.ImageAssets.icnProfile.swiftUIImage
            case .profileBig:
                LivithDesignSystemAsset.ImageAssets.icnProfileBig.swiftUIImage
            case .rightLineDefault:
                LivithDesignSystemAsset.ImageAssets.icnRightLineDefault.swiftUIImage
            case .rightLinePressed:
                LivithDesignSystemAsset.ImageAssets.icnRightLinePressed.swiftUIImage
            case .rightLineSmall:
                LivithDesignSystemAsset.ImageAssets.icnRightLineSmall.swiftUIImage
            case .searchLineDefault:
                LivithDesignSystemAsset.ImageAssets.icnSearchLineDefault.swiftUIImage
            case .searchLinePressed:
                LivithDesignSystemAsset.ImageAssets.icnSearchLinePressed.swiftUIImage
            case .searchLineVariant2:
                LivithDesignSystemAsset.ImageAssets.icnSearchLineVariant2.swiftUIImage
            case .settingLine:
                LivithDesignSystemAsset.ImageAssets.icnSettingLine.swiftUIImage
            case .ticketDisabled:
                LivithDesignSystemAsset.ImageAssets.icnTicketDisabled.swiftUIImage
            case .ticketEnabled:
                LivithDesignSystemAsset.ImageAssets.icnTicketEnabled.swiftUIImage
            case .ticketPressed:
                LivithDesignSystemAsset.ImageAssets.icnTicketPressed.swiftUIImage
            case .trash:
                LivithDesignSystemAsset.ImageAssets.icnTrash.swiftUIImage
            case .upLineSmall:
                LivithDesignSystemAsset.ImageAssets.icnLineSmallUp.swiftUIImage
            }
        }
    }

    // MARK: - livithIcon

    /// LivithIcon 열거형을 통해 앱의 아이콘 에셋에 접근합니다.
    ///
    /// 사용 예시:
    /// ```swift
    /// Image.livithIcon(.apple)
    ///     .resizable()
    ///     .frame(width: 24, height: 24)
    /// ```
    /// - Parameter icon: LivithIcon 열거형 케이스
    /// - Returns: 해당 아이콘에 맞는 Image 뷰
    static func livithIcon(_ icon: LivithIcon) -> Image {
        return icon.image
    }
}
