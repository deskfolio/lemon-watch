//
//  LemonCardView.swift
//  Lemon
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

struct LemonCardView: View {
    
    @ObservedObject var myCard: Card
    @State private var showingModalView = false
    
    var body: some View {
        
        HStack(alignment:.center){
            VStack(alignment: .center, spacing:5){
                
                Spacer()
                
                Button(action: {
                    self.showingModalView.toggle()
                }){
                    Image("Lemon-card")
                        .resizable().frame(width: 70, height: 110).shadow(color: .accentColor.opacity(0.25), radius: 35, x: 0, y: 5.0)
                }.padding(.all).buttonStyle(PlainButtonStyle())
                Text(myCard.number)
                    .foregroundColor(.secondary)
                    .privacySensitive()
                
            }.sheet(isPresented: $showingModalView) {
                CardSettingsView(myCard : myCard)
            }
        }
    }
}

struct LemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        LemonCardView(myCard: Card(isPaused: false, isFlagged: false, number: ""))
    }
 }
