//
//  Untitled.swift
//  SlovoDay
//
//  Created by Aram Gokce on 7/6/26.
//

import SwiftUI

struct VerbDetailView: View {
    let word: Word
    let details: VerbDetails

    // Order and Turkish-friendly labels for the present/future table
    let personOrder: [(key: String, label: String)] = [
        ("ya", "я"), ("ty", "ты"), ("on", "он/она/оно"),
        ("my", "мы"), ("vy", "вы"), ("oni", "они")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                VStack(alignment: .leading, spacing: 4) {
                    Text(word.russian)
                        .font(.largeTitle.bold())
                    Text(word.translation)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                // Aspect section
                VStack(alignment: .leading, spacing: 6) {
                    Text("ASPECT")
                        .font(.caption.bold())
                        .foregroundColor(.secondary)
                    Text(details.aspect.capitalized)
                        .font(.body)
                    if let pair = details.aspectPair {
                        Text("Pair: \(pair)")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }

                // Present / future table
                VStack(alignment: .leading, spacing: 6) {
                    Text("PRESENT / FUTURE")
                        .font(.caption.bold())
                        .foregroundColor(.secondary)

                    ForEach(personOrder, id: \.key) { person in
                        HStack {
                            Text(person.label)
                                .frame(width: 100, alignment: .leading)
                                .foregroundColor(.secondary)
                            Text(details.present[person.key] ?? "—")
                                .fontWeight(.medium)
                        }
                    }
                }

                // Past tense
                VStack(alignment: .leading, spacing: 6) {
                    Text("PAST TENSE")
                        .font(.caption.bold())
                        .foregroundColor(.secondary)

                    HStack {
                        Text("masc.").frame(width: 100, alignment: .leading).foregroundColor(.secondary)
                        Text(details.pastMasculine).fontWeight(.medium)
                    }
                    HStack {
                        Text("fem.").frame(width: 100, alignment: .leading).foregroundColor(.secondary)
                        Text(details.pastFeminine).fontWeight(.medium)
                    }
                    HStack {
                        Text("neuter").frame(width: 100, alignment: .leading).foregroundColor(.secondary)
                        Text(details.pastNeuter).fontWeight(.medium)
                    }
                    HStack {
                        Text("plural").frame(width: 100, alignment: .leading).foregroundColor(.secondary)
                        Text(details.pastPlural).fontWeight(.medium)
                    }
                }

                // Imperative
                if details.imperativeInformal != nil || details.imperativeFormal != nil {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("IMPERATIVE")
                            .font(.caption.bold())
                            .foregroundColor(.secondary)

                        if let informal = details.imperativeInformal {
                            HStack {
                                Text("informal").frame(width: 100, alignment: .leading).foregroundColor(.secondary)
                                Text(informal).fontWeight(.medium)
                            }
                        }
                        if let formal = details.imperativeFormal {
                            HStack {
                                Text("formal").frame(width: 100, alignment: .leading).foregroundColor(.secondary)
                                Text(formal).fontWeight(.medium)
                            }
                        }
                    }
                }
            }
            .padding(24)
        }
        .navigationTitle("Verb Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        VerbDetailView(
            word: wordList[24], // говорить
            details: wordList[24].verbDetails!
        )
    }
}
