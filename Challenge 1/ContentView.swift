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
    @Binding var changeViews: Int
    @Binding var progress: Float
    @State private var changeToChapterThreeQuestions: Bool = false
    var body: some View {
        if changeViews == 3 {
            ScrollView {
                HStack {
                    Image("bookImage")
                    Text("Story Time")
                        .font(.largeTitle)
                }
                Text("Read carefully as there will be some questions asked based on context from this passage.")
                    .foregroundStyle(.red)
                    .padding(.trailing)
                    .padding(.bottom)
                    .bold()
                Text("Chapter 3:")
                    .bold()
                    .padding(.trailing, 285)
                    .padding(.bottom, -20)
                Text("James and Tristan followed Sean to a school. In the classroom, there is a little boy and his teacher.\n\nSean: This is my neighbour’s son, Xiao Weiyue. He’s at work, so I’m here at the parent-teacher meeting in his place. The problem is, his teacher, Ms. Cai, and I don’t fully understand what I’m telling her. Can you help?\n\nMs. Cai: Paiseh to mafan you.\n\nSean: No problem. Can you update me on how Xiao Weiyue has been?\n\nMs. Cai: Xiao Weiyue is very blur in class. I’m afraid that he’s going to sabo his own education. Hen jialat!\n\nSean: Oh no! I’ll inform his father, he’ll take action right away.")
                    .padding()
                Button {
                    changeToChapterThreeQuestions = true
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 370, height: 50)
                        .overlay(
                            Text("Next")
                                .foregroundStyle(.white)
                        )
                }
            }
            .onAppear() {
                changeView = 4
            }
            .fullScreenCover(isPresented: $changeToChapterThreeQuestions) {
                ChapterThreeQuestionOne(progress: $progress)
            }
        }else if changeViews == 4 {
            ScrollView {
                HStack {
                    Image("bookImage")
                    Text("Story Time")
                        .font(.largeTitle)
                }
                Text("Final Chapter:")
                    .bold()
                    .padding(.trailing, 250)
                    .padding(.bottom, -20)
                Text("Tristan: It’s really interesting to see how in the past, when people came to our little island from all over the world, they relied a lot on emotive language to understand each other! Not everything was a direct translation.")
                    .padding()
                VStack {
                    Text("PROGRESS:")
                        .font(.title)
                        .bold()
                        .padding(.bottom, -10)
                        .padding(.leading, -190)
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
                }
                Text("THE END")
                    .bold()
                    .font(.largeTitle)
                if progress != 100 {
                    Text("(p.s. you didn't manage to defeat ChatGPFlower. James and Tristan are still stuck in the past! try again to bring them back to the present!)")
                        .padding()
                }else if progress == 100 {
                    Text("Congratulations! Tristan and James were managed to bring back to the present!")
                        .padding()
                }
            }
                .onAppear {
                    changeView = 4
                }
        }
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
                Text("When they woke up, they were in an unfamiliar place. Suddenly, a white man appeared above them, and they screamed, clinging to each other.\n\nJames: Who are you? Stay back!\n\nSean: I am Seanathan Lake, but you may address me as Sean. I relocated here from London last week. But, if I may inquire, who are YOU? And it seems you are able to speak the language of us English fluently!\n\nTristan: Abuden? Who cannot speak English in this day and age? It’s the 21st century!\n\nSean: The 21st century? But my goodfellows, it is the Year 1970 of our Good Lord! Unless… you are guests, from the future! How bloody marvelous!\n\nJames (to Tristan): It seems that ChatGPFlower has sent us to the past! But… How can we get back? T-tristan… I’m scared…\n\nTristan: Just stay calm, I’ve got that. Maybe this is like a video game, and he’s the quest-giver! Let’s just follow him and see what happens.\n\nSean: Can you help me communicate with the locals here? Nothing I say seems to be translating to them. Perhaps you could use.. Singlish?\n\nJames: Okay. Where to, then?\n\nSean: Bloody marvelous! Now, there are two places we need to go…")
                    .padding()
                Button {
                    goToQuestions = true
                }label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 370, height: 50)
                        .overlay(
                            Text("Go to Questions")
                                .foregroundStyle(.white)
                        )
                }
            }
            .fullScreenCover(isPresented: $goToQuestions){
                ChapterTwoQuestionOne()
            }
        }
    }
}

#Preview {
    ContentView(changeViews: .constant(0), progress: .constant(0))
}
