//
//  ContentView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myCard: Card
    
    let firstTitle : String = "Lemon"
    let secondTitle : String = "Pagás con"
    
    var body: some View {
        
        if (!myCard.isPaused && !myCard.isFlagged) {
            TabView {
                LemonCardView(myCard: myCard)
                    .navigationTitle(firstTitle).navigationBarTitleDisplayMode(.inline).tag(1)
                BalanceView()
                    .navigationTitle(secondTitle).navigationBarTitleDisplayMode(.inline).tag(2)
            }.navigationTitle(firstTitle)
                .navigationBarTitleDisplayMode(.inline).tabViewStyle(PageTabViewStyle())
        } else if (myCard.isPaused){
            CardPausedView(myCard: myCard)
                .navigationTitle(firstTitle).navigationBarTitleDisplayMode(.inline)
        } else {
            CardFlaggedView(myCard: myCard)
                .navigationTitle(firstTitle).navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(myCard: Card(isPaused: false, isFlagged: false, number: ""))
    }
}
