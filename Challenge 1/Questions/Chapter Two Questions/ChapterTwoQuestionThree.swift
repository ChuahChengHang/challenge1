//
//  ChapterTwoQuestionThree.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 3/6/25.
//

import SwiftUI

struct ChapterTwoQuestionThree: View {
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
    @State private var disabled: Bool = false
    @State private var optionOrder: [Int] = [0, 1, 2, 3]
    @State private var accessNestledArray = ["", "", "", ""]
    @Binding var progress: Float
    @State private var changeView: Int = 0
    @State private var changeToLore: Bool = false
    @State private var changeViewsForContentView: Int = 0
    var body: some View {
        VStack {
            HStack {
                Image("progressViewImage")
                    .frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 305, height: 20)
                    .overlay(
                        ProgressView(value: progress, total: 100.0)
                            .frame(width: 260)
                    )
            }
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .frame(width: 385, height: 300)
                .overlay(
                    Text(question[2])
                        .bold()
                        .font(.largeTitle)
                        .padding()
                        .multilineTextAlignment(.center)
                )
            if changeView == 0 {
                VStack {
                    HStack {
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[0]] == "Schools, HDB housing estates, Hawker centres" {
                                changeView = 1
                                progress += 20
                            }else {
                                changeView = 2
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
                        .padding(.leading, 20)
                        .disabled(disabled)
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[1]] == "Schools, HDB housing estates, Hawker centres" {
                                changeView = 1
                                progress += 20
                            }else {
                                changeView = 2
                            }
                        }label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[1]])
                                        .font(.title)
                                        .foregroundStyle(.white)
                                )
                        }
                        .padding(.trailing, 20)
                        .disabled(disabled)
                    }
                    HStack {
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[2]] == "Schools, HDB housing estates, Hawker centres" {
                                changeView = 1
                                progress += 20
                            }else {
                                changeView = 2
                            }
                        }label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[2]])
                                        .font(.title)
                                        .foregroundStyle(.white)
                                )
                        }
                        .padding(.leading, 20)
                        .disabled(disabled)
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[3]] == "Schools, HDB housing estates, Hawker centres" {
                                changeView = 1
                                progress += 20
                            }else {
                                changeView = 2
                            }
                        }label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[3]])
                                        .font(.title)
                                        .foregroundStyle(.white)
                                )
                        }
                        .padding(.trailing, 20)
                        .disabled(disabled)
                    }
                    .padding(.bottom, -15)
                }
            }else if changeView == 1 {
                VStack {
                    Text("Correct! Singlish was developed mostly in Schools, HDB, housing estates and hawker centers! These were common area where people communicated.")
                        .font(.title)
                        .bold()
                        .padding()
                    Button {
                        changeToLore = true
                        changeViewsForContentView = 3
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 400, height: 50)
                            .overlay(
                                Text("Next")
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding()
                }
            }else if changeView == 2 {
                Text("Wrong! Singlish was developed mostly in Schools, HDB, housing estates and hawker centers! These were common area where people communicated.")
                    .font(.title)
                    .bold()
                    .padding()
                Button {
                    changeToLore = true
                    changeViewsForContentView = 3
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 400, height: 50)
                        .overlay(
                            Text("Next")
                                .foregroundStyle(.white)
                        )
                }
                .padding()
            }
            Spacer()
        }
        .onAppear {
            optionOrder.shuffle()
            accessNestledArray = answerOptions[2]
            print(optionOrder)
        }
        .fullScreenCover(isPresented: $changeToLore) {
            ContentView(changeViews: $changeViewsForContentView, progress: $progress)
        }
    }
}

#Preview {
    ChapterTwoQuestionThree(progress: .constant(0))
}
