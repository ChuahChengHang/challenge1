//
//  ChapterTwoQuestionsView.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 31/5/25.
//

import SwiftUI

struct QuestionsStruct {
    var question: String
    var answer: String
    var extra: String
    var extraTwo: String
    var extraThree: String
    var questionType: String
}
struct comments {
    var comments: String
}

struct ChapterTwoQuestionsView: View {
    @State private var disabled: Bool = false
    @State private var progress: Float = 0.0
    @Binding var randomiseQuestion: Int
    let question = [
        QuestionsStruct(question: "When was the term “Singlish” first coined?", answer: "1970s", extra: "1980s", extraTwo: "1950s", extraThree: "1990s", questionType: "MutipleChoice"),
        QuestionsStruct(question: "Did the introduction of Singlish come from The British?", answer: "True", extra: "False", extraTwo: "", extraThree: "", questionType: "TrueFalse"),
        QuestionsStruct(question: "In which key places did Singlish develop?", answer: "Schools, HDB housing estates, hawker centres", extra: "Schools, Shopping Centers, China Town", extraTwo: "Hawker Center, Condominiums, Little India", extraThree: "Little India, China Town, Geylang", questionType: "MutipleChoice")
    ]
    var body: some View {
        if randomiseQuestion == 1 {
            VStack {
                HStack {
                    Image("progressViewImage")
                        .frame(width: 50, height: 50)
                    ProgressView(value: progress)
                        .frame(width: 300)
                }
                RoundedRectangle(cornerRadius: 10)
                    .fill(.green)
                    .frame(width: 385, height: 300)
                    .overlay(
                        Text(question[1].question)
                    )
                HStack {
                    Spacer()
                    Button {
                        disabled = true
                    }label: {
                        Rectangle()
                            .frame(width: 180, height: 210)
                        Spacer()
                    }
                    .disabled(disabled)
                    Button {
                        disabled = true
                    }label: {
                        Rectangle()
                            .frame(width: 190, height: 210)
                        Spacer()
                    }
                    .disabled(disabled)
                }
                HStack {
                    Spacer()
                    Button {
                        disabled = true
                    }label: {
                        Rectangle()
                            .frame(width: 180, height: 210)
                        Spacer()
                    }
                    .disabled(disabled)
                    Button {
                        disabled = true
                    }label: {
                        Rectangle()
                            .frame(width: 190, height: 210)
                        Spacer()
                    }
                    .disabled(disabled)
                }
                Spacer()
            }
        }else if randomiseQuestion == 2 {
            VStack {
                Text("QuestioNumber2")
            }
        }else if randomiseQuestion == 3 {
            VStack {
                Text("QuestionNumber3")
            }
        }
    }
}

#Preview {
    ChapterTwoQuestionsView(randomiseQuestion: .constant(1))
}
