//
//  ToastsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct ToastsView: View {
    var body: some View {
        List {
            NavigationLink("LivithToast") {
                LivithToastDetailView()
            }
            NavigationLink("LivithSnackBar") {
                LivithSnackBarDetailView()
            }
        }
        .navigationTitle("Toasts")
    }
}

#Preview {
    NavigationStack {
        ToastsView()
    }
}
