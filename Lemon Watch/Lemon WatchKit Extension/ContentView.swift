//
//  ContentView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var myCard: Card
    
    var body: some View {
        
        let firstTitle : String = "Lemon"
        let secondTitle : String = "Pagás con"
        
        Group{
            
            //Card is Active
            if myCard.status == .active {
                TabView {
                    LemonCardView(myCard: myCard)
                        .navigationTitle(firstTitle)
                        .tag(1)
                    BalanceView()
                        .navigationTitle(secondTitle)
                        .tag(2)
                }.tabViewStyle(PageTabViewStyle())
            //Card is Paused
            } else if myCard.status == .paused {
                CardPausedView(myCard: myCard)
                    .navigationTitle(firstTitle)
            //Card is Flagged (perm lost or stolen)
            } else if myCard.status == .flagged {
                CardFlaggedView(myCard: myCard)
                    .navigationTitle(firstTitle)
            }
        }.navigationTitle(firstTitle)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(myCard: Card(number: "", status: .active))
    }
}
