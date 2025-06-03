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
    @State private var optionOrder: [Int] = [0, 1, 2, 3]
    @State private var accessNestledArray = ["", "", "", ""]
    @Binding var progress: Float
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
            
            VStack {
                HStack {
                    Button {
                        
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[0]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                    Button {
                        
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[1]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                }
                HStack {
                    Button {
                        
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[2]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                    Button {
                        
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 210)
                            .overlay(
                                Text(accessNestledArray[optionOrder[3]])
                                    .font(.title)
                                    .foregroundStyle(.white)
                            )
                    }
                }
                .padding(.top, -15)
            }
            Spacer()
        }
        .onAppear {
            optionOrder.shuffle()
            accessNestledArray = answerOptions[2]
            print(optionOrder)
        }
    }
}

#Preview {
    ChapterTwoQuestionThree(progress: .constant(0))
}
