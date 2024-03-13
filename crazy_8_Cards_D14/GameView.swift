//
//  ContentView.swift
//  crazy_8_Cards_D14
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/10.
//

import SwiftUI

struct GameView: View {
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var backGround = "background1"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    var body: some View {
        ZStack {
            Image(backGround)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                
                VStack {
                    Button(action: {
                        back()
                    }, label: {
                        Image(systemName: "button.horizontal.fill")
                    })
                    .foregroundColor(.orange)
                    Text("Change the background")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
    
    func deal(){
        //Randomise the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomise the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Add 4 to player score
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 4 to cpu score
        if cpuCard > playerCard {
            cpuScore += 4
        }
        
        //Add 1 to both scores if it is a tie
        else if playerCard == cpuCard {
            playerScore += 1
            cpuScore += 1
        }
    }
    
    func back(){
        //Randomise the background
        let backGroundValue = Int.random(in: 1...4)
        backGround = "background" + String(backGroundValue)
    }
}

#Preview {
    GameView()
}
