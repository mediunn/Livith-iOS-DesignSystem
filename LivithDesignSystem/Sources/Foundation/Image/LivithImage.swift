//
//  LivithImage.swift
//  LivithDesignSystem
//
//  Created by Youjin Lee on 1/12/26.
//  Copyright © 2026 Livith. All rights reserved.
//

import SwiftUI

public extension Image {
    enum LivithImage {
        case concertCardEmpty
        case instagram
        case livithLogo, livithEmpty
        case splash, feedback
        case polygon
        case welcome
        case interestConcertComplete
        case youtubeEmpty

        public var image: Image {
            switch self {
            case .concertCardEmpty:
                LivithDesignSystemAsset.ImageAssets.imageConcertCardEmpty.swiftUIImage
            case .instagram:
                LivithDesignSystemAsset.ImageAssets.imageInstagram.swiftUIImage
            case .livithLogo:
                LivithDesignSystemAsset.ImageAssets.imageLivithLogo.swiftUIImage
            case .livithEmpty:
                LivithDesignSystemAsset.ImageAssets.imageLivithEmpty.swiftUIImage
            case .splash:
                LivithDesignSystemAsset.ImageAssets.imageSplash.swiftUIImage
            case .feedback:
                LivithDesignSystemAsset.ImageAssets.btnFeedback.swiftUIImage
            case .polygon:
                LivithDesignSystemAsset.ImageAssets.imagePolygon.swiftUIImage
            case .welcome:
                LivithDesignSystemAsset.ImageAssets.imageWelcome.swiftUIImage
            case .interestConcertComplete:
                LivithDesignSystemAsset.ImageAssets.imageInterestConcertComplete.swiftUIImage
            case .youtubeEmpty:
                LivithDesignSystemAsset.ImageAssets.imageYoutubeEmpty.swiftUIImage
            }
        }
    }

    // MARK: - livithImage

    /// LivithImage 열거형을 통해 앱의 이미지 에셋에 접근합니다.
    ///
    /// 사용 예시:
    /// ```swift
    /// Image.livithImage(.livithLogo)
    ///     .resizable()
    ///     .frame(width: 24, height: 24)
    /// ```
    /// - Parameter image: LivithImage 열거형 케이스
    /// - Returns: 해당 이미지에 맞는 Image 뷰
    static func livithImage(_ image: LivithImage) -> Image {
        return image.image
    }
}
