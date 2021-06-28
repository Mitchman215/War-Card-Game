//
//  ContentView.swift
//  warCardGame
//
//  Created by Mitchell Salomon on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            // background
            Image("background").ignoresSafeArea()
            
            VStack(){
                
                Spacer()
                Image("logo").padding()
                Spacer()
                
                // cards
                HStack(){
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                Button(action: {
                    // Generate random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // update the score
                    if playerRand > cpuRand{
                        playerScore += 1
                    }
                    else if cpuRand > playerRand{
                        cpuScore += 1
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                
                // score labels
                HStack(){
                   // player score
                    VStack(){
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom)
                            
                        Text(String(playerScore)).font(.largeTitle)
                    }.padding()
                    
                    // CPU score
                    VStack(){
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom)
                        
                        Text(String(cpuScore)).font(.largeTitle)
                    }.padding()
                    
                }.foregroundColor(Color.white)
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
