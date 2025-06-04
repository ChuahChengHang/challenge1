//
//  ChapterThreeQuestionTwo.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 3/6/25.
//

import SwiftUI

struct ChapterThreeQuestionTwo: View {
    @State private var changeViewsInContentView: Int = 0
    @State private var changeToContentView: Bool = false
    @State private var changeView: Int = 0
    @State private var disabled: Bool = false
    @State private var optionOrder: [Int] = [0, 1, 2, 3]
    @State private var accessNestledArray = ["", "", "", ""]
    let question = [
        "Translate: 'Paiseh to mafan you.' to english terms.",
        "Fill in the blanks in 'Xiao Weiyue is very ___ in class. I’m afraid he’s going to ____ his own education. ____.' according to 'Xiao Weiyue is very blur in class. I’m afraid that he’s going to sabo his own education. Hen jialat!'"
    ]
    let answer = [
        ["Sorry to bother you.", "embarrassed", "Help my child", "Any other comment?"],
        ["unaware, sabotage, It’s terrible", "happy, eat, He loves it", "dumb, ruin, He is very scared", "happy, cook, James is a dog"]
    ]
    @Binding var progress: Float
    var body: some View {
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
                Text(question[1])
                    .bold()
                    .font(.title2)
                    .padding()
            )
        Spacer()
        if changeView == 0 {
            VStack {
                HStack {
                    Button {
                        disabled = true
                        if accessNestledArray[optionOrder[0]] == "unaware, sabotage, It’s terrible" {
                            changeView = 1
                            progress += 20
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
                        if accessNestledArray[optionOrder[1]] == "unaware, sabotage, It’s terrible" {
                            changeView = 1
                            progress += 20
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
                        if accessNestledArray[optionOrder[2]] == "unaware, sabotage, It’s terrible" {
                            changeView = 1
                            progress += 20
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
                        if accessNestledArray[optionOrder[3]] == "unaware, sabotage, It’s terrible" {
                            changeView = 1
                            progress += 20
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
                        accessNestledArray = answer[1]
                        optionOrder.shuffle()
                    }
            }
        }else if changeView == 1 {
            Text("Correct! 'Blur' means he is not focusing in class and 'sabo' is sabotage in a short form. 'Hen jialat' means very terrible!")
                .font(.largeTitle)
                .bold()
                .padding()
            Button {
                changeToContentView = true
                changeViewsInContentView = 4
            }label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 400, height: 50)
                    .overlay(
                        Text("Next")
                            .foregroundStyle(.white)
                    )
            }
            .fullScreenCover(isPresented: $changeToContentView) {
                ContentView(changeViews: $changeViewsInContentView, progress: $progress)
            }
            Spacer()
        }else if changeView == 2 {
            Text("Wrong! 'Blur' means he is not focusing in class and 'sabo' is sabotage in a short form. 'Hen jialat' means very terrible!")
                .font(.largeTitle)
                .bold()
                .padding()
            Button {
                changeToContentView = true
                changeViewsInContentView = 4
            }label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 400, height: 50)
                    .overlay(
                        Text("Next")
                            .foregroundStyle(.white)
                    )
            }
            Spacer()
                .fullScreenCover(isPresented: $changeToContentView) {
                    ContentView(changeViews: $changeViewsInContentView, progress: $progress)
                }
        }
    }
}

#Preview {
    ChapterThreeQuestionTwo(progress: .constant(0))
}
