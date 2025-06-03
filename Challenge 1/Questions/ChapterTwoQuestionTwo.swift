//
//  ChapterTwoQuestionTwo.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 3/6/25.
//

import SwiftUI

struct ChapterTwoQuestionTwo: View {
    @State private var changeQuestion: Bool = false
    @State private var changeButtonView: Int = 0
    @State private var trueText: String = "True"
    @State private var falseText: String = "False"
    @State private var disabled: Bool = false
    @State private var changeView: Int = 0
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
    @Binding var progress: Float
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
                .fill(.blue)
                .frame(width: 385, height: 300)
                .overlay(
                    Text(question[1])
                        .foregroundStyle(.white)
                        .bold()
                        .font(.largeTitle)
                        .padding()
                )
            Spacer()
            if changeButtonView == 0 {
                HStack {
                    Button {
                        changeButtonView = 1
                        progress += 20
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .frame(width: 190)
                            .overlay(
                                Text(trueText)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            )
                    }
                    Button {
                        changeButtonView = 2
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .frame(width: 190)
                            .overlay(
                                Text(falseText)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            )
                    }
                }
            }else if changeButtonView == 1 {
                VStack {
                    Text("Correct! Singlish arose out of a situation of prolonged language contact between speakers of many different Asian languages in Singapore, such as Malay, Cantonese, Hokkien, Mandarin, Teochew, and Tamil.")
                        .font(.title)
                        .bold()
                        .padding()
                    Button {
                        changeQuestion = true
                        changeView = 3
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
            }else if changeButtonView == 2 {
                VStack {
                    Text("Wrong! Singlish arose out of a situation of prolonged language contact between speakers of many different Asian languages in Singapore, such as Malay, Cantonese, Hokkien, Mandarin, Teochew, and Tamil.")
                        .font(.title)
                        .bold()
                        .padding()
                    Button {
                        changeQuestion = true
                        changeView = 3
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 400, height: 50)
                            .overlay(
                                Text("Next")
                                    .foregroundStyle(.white)
                            )
                    }
                    .padding()
                    Spacer()
                }
            }
        }
        .fullScreenCover(isPresented: $changeQuestion) {
            ChapterTwoQuestionThree(progress: $progress)
        }
    }
}

#Preview {
    ChapterTwoQuestionTwo(progress: .constant(0))
}
