//
//  ChapterTwoQuestionsView.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 31/5/25.
//

import SwiftUI

struct ChapterTwoQuestionOne: View {
    @State private var disabled: Bool = false
    @State private var progress: Float = 0.0
    @State private var correctOrNot: Bool = false
    @State private var optionOrder: [Int] = [0, 1, 2, 3]
    @State private var accessNestledArray = ["", "", "", ""]
    @State private var changeViews: Int = 0
    @State private var changeQuestion: Bool = false
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
        VStack {
            HStack {
                Image("progressViewImage")
                    .frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 335, height: 20)
                    .overlay(
                        ProgressView(value: progress, total: 100.0)
                            .frame(width: 300)
                )
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
                    Button {
                        disabled = true
                        if accessNestledArray[optionOrder[0]] == "1970s" {
                            changeViews = 1
                            progress += 20.0
                        }else {
                            changeViews = 2
                        }
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[0]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                        
                    }
                    .disabled(disabled)
                    Button {
                        disabled = true
                        if accessNestledArray[optionOrder[1]] == "1970s" {
                            changeViews = 1
                            progress += 20
                        }else {
                            changeViews = 2
                        }
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 182.5, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[1]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                    .disabled(disabled)
                }
                .padding()
                HStack {
                    Button {
                        disabled = true
                        if accessNestledArray[optionOrder[2]] == "1970s" {
                            changeViews = 1
                            progress += 20
                        }else {
                            changeViews = 2
                        }
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 182.5, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[2]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                    .disabled(disabled)
                    Button {
                        disabled = true
                        if accessNestledArray[optionOrder[3]] == "1970s" {
                            changeViews = 1
                            progress += 20
                        }else {
                            changeViews = 2
                        }
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 182.5, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[3]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                    .disabled(disabled)
                }
                .padding(.top, -15)
                Spacer()
            }else if changeViews == 1 {
                Text("Correct!\nSinglish was indeed first coined in the early 1970s!")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
                Button {
                    changeQuestion = true
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 400, height: 50)
                        .overlay(
                            Text("Next")
                                .foregroundStyle(.white)
                        )
                        .padding()
                }
                Spacer()
            }else if changeViews == 2 {
                Text("Wrong!\nSinglish was first coined in the early 1970s.")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
                Button {
                    changeQuestion = true
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 400, height: 50)
                        .overlay(
                            Text("Next")
                                .foregroundStyle(.white)
                        )
                        .padding()
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $changeQuestion) {
            ChapterTwoQuestionTwo(progress: $progress)
        }
        .onAppear {
            optionOrder.shuffle()
            accessNestledArray = answerOptions[0]
        }
    }
    }

#Preview {
    ChapterTwoQuestionOne()
}
