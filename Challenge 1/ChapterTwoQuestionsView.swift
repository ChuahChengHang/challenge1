//
//  ChapterTwoQuestionsView.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 31/5/25.
//

import SwiftUI

struct ChapterTwoQuestionsView: View {
    @State private var disabled: Bool = false
    @State private var progress: Float = 0.0
    @State private var correctOrNot: Bool = false
    @State private var optionOrder: [Int] = [0, 1, 2, 3]
    @Binding var randomiseQuestion: Int
    @State private var accessNestledArray = ["", "", "", ""]
    @State private var changeViews: Int = 1
    let question = [
        "When was the term 'Singlish' coined?",
        "Did the introduction of Singlish come from The British?",
        "In which key places did Singlish develop?"
    ]
    let answerOptions = [
        ["1960s", "1970s", "1980s", "1990s"],
        ["True", "False"],
        ["Schools, HDB housing estates, Hawker centres", "Schools, Shopping Centres, Airport", "Hawker centres ONLY", "Everywhere in Singapore"]
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
                        Text(question[0])
                            .bold()
                            .font(.largeTitle)
                            .padding()
                    )
                Spacer()
                if changeViews == 0 {
                    HStack {
                        Spacer()
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[0]] == "1970s" {
                                changeViews = 1
                            }else {
                                changeViews = 2
                            }
                        }label: {
                            Rectangle()
                                .frame(width: 180, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[0]])
                                        .foregroundStyle(.white)
                                )
                            Spacer()
                        }
                        .disabled(disabled)
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[1]] == "1970s" {
                                changeViews = 1
                            }else {
                                changeViews = 2
                            }
                        }label: {
                            Rectangle()
                                .frame(width: 190, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[1]])
                                        .foregroundStyle(.white)
                                )
                            Spacer()
                        }
                        .disabled(disabled)
                    }
                    HStack {
                        Spacer()
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[2]] == "1970s" {
                                changeViews = 1
                            }else {
                                changeViews = 2
                            }
                        }label: {
                            Rectangle()
                                .frame(width: 180, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[2]])
                                        .foregroundStyle(.white)
                                )
                            Spacer()
                        }
                        .disabled(disabled)
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[3]] == "1970s" {
                                changeViews = 1
                            }else {
                                changeViews = 2
                            }
                        }label: {
                            Rectangle()
                                .frame(width: 190, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[3]])
                                        .foregroundStyle(.white)
                                )
                            Spacer()
                        }
                        .disabled(disabled)
                    }
                    Spacer()
                }else if changeViews == 1 {
                    Text("Correct!\nSinglish was indeed first coined in the early 1970s!")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                        Button {
//                            randomiseQuestion = 3
//                            print(randomiseQuestion)
                        }label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 400, height: 50)
                                .overlay(
                                    Text("Next")
                                        .foregroundStyle(.white)
                                )
                    }
                    Spacer()
                }else if changeViews == 2 {
                    Text("Wrong!\nSinglish was first coined in the early 1970s.")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
            }
            .onAppear {
                optionOrder.shuffle()
                accessNestledArray = answerOptions[0]
                print(optionOrder)
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
