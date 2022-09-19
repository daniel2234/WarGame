//
//  ContentView.swift
//  SwiftUIBeginner
//
//  Created by daniel on 2022-09-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct Title: View {
    var body: some View {
        Text("Title")
            .font(.largeTitle)
    }
}

struct AddVStruct: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
        }
    }
}

struct Subtitle: View {
    
    var title: String
    var subtitle: String
    var description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
            
            Text(subtitle)
                .font(.title)
                .foregroundColor(Color.gray)
            
            Text(description)
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue) // Add the color bluw behind the text.
        }
    }
}

struct Version2: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Title", subtitle: "Subtitle", desc: "Short description of what I am demonstrating goes here.", back: .purple, textColor: .white)
                .font(.title)
        }
    }
}

//struct Button: View {
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Hello World")
//                .padding()
//                .background(Color.green)
//                .cornerRadius(8)
//                .foregroundColor(.white)
//        }
//        .padding()
//        .background(Color.blue)
//        .cornerRadius(8)
//    }
//}

struct CityImageTile: View {
    var body: some View {
        
        VStack {
            ZStack {
                Image("toronto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    
                ZStack {
                    VStack {
                        Text("CN Tower").foregroundColor(.white).padding().font(.largeTitle)
                        Text("Toronto").font(.caption).foregroundColor(.white)
                    }
                    .padding()
                    .background(.black)
                    .cornerRadius(8)
                    .opacity(0.8)
                }
            }
            .padding()
            
            ZStack {
                Image("london")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    
                ZStack {
                    VStack {
                        Text("Big Ben").foregroundColor(.white).padding([.top, .leading, .trailing]).font(.largeTitle)
                        Text("London").font(.caption).padding([.leading, .bottom, .trailing]).foregroundColor(.white)
                    }
                    .background(.black)
                    .cornerRadius(8)
                    .opacity(0.8)
                }
            }
            .padding()
        }
    }
}

struct WarGame: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    //Generate a random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    //Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    //Update the score
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if cpuRand > playerRand {
                        cpuScore += 1
                    }
    
                }) {
                    Image("dealbutton")
                }

                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        Text("\(playerScore)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        Text("\(cpuScore)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView()
//                Title()
        //        AddVStruct()
        //        Version2()
        //        Button()
//        CityImageTile()
        WarGame()
    }
}
