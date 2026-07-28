//
//  SettingsView.swift
//  SlovoDay
//
//  Created by Aram Gokce on 7/27/26.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var store: LearningStore
    @Environment(\.dismiss) private var dismiss
    @State private var showResetConfirmation = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Words learned")
                        Spacer()
                        Text("\(store.learnedCount) / \(store.totalCount)")
                            .foregroundColor(.secondary)
                    }
                }

                Section {
                    Button(role: .destructive) {
                        showResetConfirmation = true
                    } label: {
                        Text("Reset Progress")
                    }
                } footer: {
                    Text("This clears every word you've marked as learned and reshuffles the deck.")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .alert("Reset all progress?", isPresented: $showResetConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Reset", role: .destructive) {
                    store.reset()
                    dismiss()
                }
            } message: {
                Text("This will mark all \(store.totalCount) words as not learned again.")
            }
        }
    }
}

#Preview {
    SettingsView(store: LearningStore())
}
