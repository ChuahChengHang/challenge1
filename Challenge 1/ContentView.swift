//
//  ContentView.swift
//  Challenge 1
//
//  Created by Chuah Cheng Hang on 31/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var changeView: Int = 0
    @State private var goToQuestions: Bool = false
    @State private var randomNumber: Int = 0
    var body: some View {
        if changeView == 0 {
            VStack {
                Text("DISCOVERING SINGLISH")
                    .font(.title)
                Button {
                    changeView = 1
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 50)
                        .overlay(
                            Text("Play")
                                .foregroundStyle(.white)
                        )
                }
            }
        }else if changeView == 1 {
                ScrollView {
                    HStack {
                        Image("bookImage")
                        Text("Story Time")
                            .font(.largeTitle)
                    }
                    Text("Introduction:")
                        .bold()
                        .padding(.trailing, 266)
                        .padding(.bottom, -20)
                    Text("Once upon a time, there were two very, very, very good friends called Tristan and James.\n\nJames: Where do you want to go for our next outing, Tristan?\n\nTristan: We have gone to every cafe and cinema in Singapore! I want to experience something new with you.\n\nAnd so, after robbing POSB Bank, James bought a time machine.\n\nJames: With a machine like this, we can even travel to the future!\n\nSo they stepped in. However, all of a sudden, the lights started flickering. An evil voice echoed  around them. It was… ChatGPFlower!\n\nChatGPFlower: Hahahaha, foolish humans. Now that I have my hands on your technology, I will hack it for myself. You will never return to the present!\n\nTristan: Oh no, James! Save me!!\n\nTristan falls into a black hole.\n\nJames: I’m coming for you!!\n\nJames jumps into the hole.")
                        .padding()
                    Button {
                        changeView = 2
                    }label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 370, height: 50)
                            .overlay(
                                Text("Next")
                                    .foregroundStyle(.white)
                            )
                    }
                }
        }else if changeView == 2 {
            ScrollView {
                HStack {
                    Image("bookImage")
                    Text("Story Time")
                        .font(.largeTitle)
                }
                Text("Chapter 2:")
                    .bold()
                    .padding(.trailing, 275)
                    .padding(.bottom, -20)
                Text("When they woke up, they were in an unfamiliar place. Suddenly, a white man appeared above them, and they screamed, clinging to each other.\n\nJames: Who are you? Stay back!\n\nSean: I am Seanathan Lake, but you may address me as Sean. I relocated here from London last week. But, if I may inquire, who are YOU? And it seems you are able to speak the language of us English fluently!\n\nTristan: Abuden? Who cannot speak English in this day and age? It’s the 21st century!\n\nSean: The 21st century? But my goodfellows, it is the Year 1970 of our Good Lord! Unless… you are guests, from the future! How bloody marvelous!\n\nJames (to Tristan): It seems that ChatGPFlower has sent us to the past! But… How can we get back? T-tristan… I’m scared…\n\nTristan: Just stay calm, I’ve got that. Maybe this is like a video game, and he’s the quest-giver! Let’s just follow him and see what happens.\n\nSean: Can you help me communicate with the locals here? Nothing I say seems to be translating to them. Perhaps you could use.. Singlish?\n\nJames: Okay. Where to, then?\n\nSean: Bloody marvelous! Now, there are three places we need to go…")
                    .padding()
                Button {
                    goToQuestions = true
                    randomNumber = Int.random(in: 1..<4)
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 370, height: 50)
                        .overlay(
                            Text("Go to Questions")
                                .foregroundStyle(.white)
                        )
                }
            }
            .fullScreenCover(isPresented: $goToQuestions) {
                ChapterTwoQuestionsView(randomiseQuestion: $randomNumber)
            }
        }
    }
}

#Preview {
    ContentView()
}
