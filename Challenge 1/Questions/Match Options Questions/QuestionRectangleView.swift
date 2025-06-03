//
//  RectangleView.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 3/6/25.
//

import SwiftUI

//struct RectangleView: View {
//    var drag: some Gesture {
//        DragGesture()
//    }
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .frame(width: 160, height: 150)
//            .padding()
//            .gesture(
//                DragGesture()
//            )
//    }
//}

struct QuestionRectangleView: View {
    @State var viewState = CGSize.zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.blue)
            .frame(width: 160, height: 150)
            .padding()
            .offset(x: viewState.width, y: viewState.height)
            .gesture(
                DragGesture().onChanged { value in
                    viewState = value.translation
                }
//                    .onEnded { value in
//                        withAnimation(.spring()) {
//                            viewState = .zero
//                        }
//                    }
            )
    }
    
}


#Preview {
    QuestionRectangleView()
}
