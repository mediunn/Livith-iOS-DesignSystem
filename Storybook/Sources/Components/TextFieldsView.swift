//
//  TextFieldsView.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/13/26.
//

import SwiftUI
import LivithDesignSystem

struct TextFieldsView: View {
    var body: some View {
        List {
            NavigationLink("LivithTextField") {
                LivithTextFieldDetailView()
            }
            NavigationLink("LivithTextView") {
                LivithTextViewDetailView()
            }
        }
        .navigationTitle("TextFields")
    }
}

#Preview {
    NavigationStack {
        TextFieldsView()
    }
}
