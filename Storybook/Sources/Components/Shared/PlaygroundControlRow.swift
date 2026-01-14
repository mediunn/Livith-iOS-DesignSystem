//
//  PlaygroundControlRow.swift
//  LivithStorybook
//
//  Created by Youjin Lee on 1/14/26.
//

import SwiftUI
import LivithDesignSystem

// MARK: - Control Section Header

struct ControlSectionHeader: View {
    let title: String
    let type: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.primary)

            Text(type)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Toggle Control Row

struct ToggleControlRow: View {
    let title: String
    let type: String
    @Binding var isOn: Bool

    var body: some View {
        Toggle(isOn: $isOn) {
            ControlSectionHeader(title: title, type: type)
        }
    }
}

// MARK: - Text Control Row

struct TextControlRow: View {
    let title: String
    let type: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ControlSectionHeader(title: title, type: type)

            TextField("입력", text: $text)
                .textFieldStyle(.roundedBorder)
        }
    }
}

// MARK: - Picker Control Row

struct PickerControlRow<T: Hashable & CaseIterable & CustomStringConvertible>: View where T.AllCases: RandomAccessCollection {
    let title: String
    let type: String
    @Binding var selection: T

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ControlSectionHeader(title: title, type: type)

            Picker(title, selection: $selection) {
                ForEach(Array(T.allCases), id: \.self) { item in
                    Text(item.description).tag(item)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

// MARK: - Slider Control Row

struct SliderControlRow: View {
    let title: String
    let type: String
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                ControlSectionHeader(title: title, type: type)
                Spacer()
                Text("\(Int(value))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Slider(value: $value, in: range)
        }
    }
}

// MARK: - Preview Container

struct PreviewContainer<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            Spacer()
            content
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .background(Color.livithColor(.black100))
    }
}

// MARK: - Control Panel

struct ControlPanel<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        Form {
            content
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var isOn = false
        @State private var text = "테스트"
        @State private var value: CGFloat = 50

        var body: some View {
            NavigationStack {
                VStack(spacing: 0) {
                    PreviewContainer {
                        Text("Preview Area")
                            .foregroundStyle(.white)
                    }

                    Form {
                        Section("Controls") {
                            ToggleControlRow(
                                title: "isEnabled",
                                type: "Bool",
                                isOn: $isOn
                            )

                            TextControlRow(
                                title: "title",
                                type: "String",
                                text: $text
                            )

                            SliderControlRow(
                                title: "height",
                                type: "CGFloat",
                                value: $value,
                                range: 0...100
                            )
                        }
                    }
                }
                .navigationTitle("Component")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    return PreviewWrapper()
}
