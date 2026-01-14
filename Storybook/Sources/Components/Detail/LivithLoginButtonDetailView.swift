//
//  LivithLoginButtonDetailView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

extension LivithLoginProvider: CaseIterable, CustomStringConvertible {
    public static var allCases: [LivithLoginProvider] = [.kakao, .apple]

    public var description: String {
        switch self {
        case .kakao: return "kakao"
        case .apple: return "apple"
        }
    }
}

struct LivithLoginButtonDetailView: View {
    @State private var provider: LivithLoginProvider = .kakao

    var body: some View {
        VStack(spacing: 0) {
            PreviewContainer {
                LivithLoginButton(provider: provider) { }
                    .padding(.horizontal, 20)
            }

            Form {
                Section("Properties") {
                    PickerControlRow(title: "provider", type: "LivithLoginProvider", selection: $provider)
                }
            }
        }
        .navigationTitle("LivithLoginButton")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LivithLoginButtonDetailView()
    }
}
