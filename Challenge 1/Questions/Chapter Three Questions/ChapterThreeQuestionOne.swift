//
//  ChapterThreeQuestionOne.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 3/6/25.
//

import SwiftUI

struct ChapterThreeQuestionOne: View {
    @Binding var progress: Float
    @State private var disabled: Bool = false
    @State private var accessNestledArray = ["", "", "", ""]
    @State private var optionOrder: [Int] = [0, 1, 2, 3]
    @State private var changeView: Int = 0
    @State private var changeQuestion: Bool = false
    let question = [
        "Translate: 'Paiseh to mafan you.' to english terms.",
        "Fill in the blanks in 'Xiao Weiyue is very ___ in class. I’m afraid he’s going to ____ his own education. ____.' according to 'Xiao Weiyue is very blur in class. I’m afraid that he’s going to sabo his own education. Hen jialat!'"
    ]
    let answer = [
        ["Sorry to bother you.", "embarrassed", "Help my child", "Any other comment?"],
        ["blur, sabotage, It’s terrible"]
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
            if changeView == 0 {
                VStack {
                    HStack {
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[0]] == "Sorry to bother you." {
                                progress += 20
                                changeView = 1
                            }else {
                                changeView = 2
                            }
                        }label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 182.5, height: 210)
                                .overlay(
                                    Text(accessNestledArray[optionOrder[0]])
                                        .font(.title)
                                        .foregroundStyle(.white)
                                )
                        }
                        .disabled(disabled)
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[1]] == "Sorry to bother you." {
                                progress += 20
                                changeView = 1
                            }else {
                                changeView = 2
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
                    HStack {
                        Button {
                            disabled = true
                            if accessNestledArray[optionOrder[2]] == "Sorry to bother you." {
                                progress += 20
                                changeView = 1
                            }else {
                                changeView = 2
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
                            if accessNestledArray[optionOrder[3]] == "Sorry to bother you." {
                                progress += 20
                                changeView = 1
                            }else {
                                changeView = 2
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
                    
                    Spacer()
                        .onAppear() {
                            accessNestledArray = answer[0]
                            optionOrder.shuffle()
                        }
                }
            }else if changeView == 1 {
                Text("Correct! In this case, 'Paiseh' means 'sorry' and 'mafan' means to 'trouble'!")
                    .font(.largeTitle)
                    .bold()
                Button {
                    changeQuestion = true
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 400, height: 50)
                        .overlay(
                            Text("Next")
                                .foregroundStyle(.white)
                        )
                }
                Spacer()
                    .fullScreenCover(isPresented: $changeQuestion) {
                        ChapterThreeQuestionTwo(progress: $progress)
                    }
            }else if changeView == 2 {
                Text("Wrong! In this case, 'Paiseh' means 'sorry' and 'mafan' means to 'trouble'!")
                    .font(.largeTitle)
                    .bold()
                Button {
                    changeQuestion = true
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 400, height: 50)
                        .overlay(
                            Text("Next")
                                .foregroundStyle(.white)
                        )
                }
                Spacer()
                    .fullScreenCover(isPresented: $changeQuestion) {
                        ChapterThreeQuestionTwo(progress: $progress)
                    }
            }
        }
    }
}

#Preview {
    ChapterThreeQuestionOne(progress: .constant(0))
}
