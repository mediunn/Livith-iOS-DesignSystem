//
//  ButtonsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ButtonsView: View {
    var body: some View {
        List {
            NavigationLink("LivithButton") {
                LivithButtonDetailView()
            }
            NavigationLink("LivithActionButton") {
                LivithActionButtonDetailView()
            }
            NavigationLink("LivithConfirmButton") {
                LivithConfirmButtonDetailView()
            }
            NavigationLink("LivithFilterButton") {
                LivithFilterButtonDetailView()
            }
            NavigationLink("LivithToggleButton") {
                LivithToggleButtonDetailView()
            }
            NavigationLink("LivithOptionButton") {
                LivithOptionButtonDetailView()
            }
            NavigationLink("LivithLoginButton") {
                LivithLoginButtonDetailView()
            }
        }
        .navigationTitle("Buttons")
    }
}

#Preview {
    NavigationStack {
        ButtonsView()
    }
}
