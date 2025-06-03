//
//  ChapterTwoQuestionThree.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 3/6/25.
//

import SwiftUI

struct randomQuestion: View {
    let question = [
        "When was the term 'Singlish' coined?",
        "Did the introduction of Singlish come from The British?",
        "In which key places did Singlish develop?"
    ]
    let answerOptions = [
        ["1960s", "1970s", "1980s", "1990s"],
        ["True", "False"],
        ["Schools, HDB housing estates, Hawker centres", "Schools, Shopping Centres, Airport", "Hawker centres ONLY", "Everywhere in Singapore"]]
    @State private var shuffleAnswerOptions: [Int] = [0, 1, 2, 3]
    @Binding var progress: Float
    var body: some View {
        VStack {
            Spacer()
            Spacer()
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
            ZStack{
                VStack{
                    HStack {
                        QuestionRectangleView()
                        AnswerQuestionRectangleView()
                    }
                    HStack {
                        QuestionRectangleView()
                        AnswerQuestionRectangleView()
                    }
                    HStack {
                        QuestionRectangleView()
                        AnswerQuestionRectangleView()
                    }
                    HStack {
                        QuestionRectangleView()
                        AnswerQuestionRectangleView()
                    }
                    Spacer()
                }
            }
        }
        .onAppear() {
            shuffleAnswerOptions.shuffle()
        }
    }
}

#Preview {
    randomQuestion(progress: .constant(0))
}
