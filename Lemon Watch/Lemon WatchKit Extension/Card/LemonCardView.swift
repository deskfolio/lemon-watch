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
        
        HStack(alignment:.top){
            VStack(alignment: .center, spacing:8){
                Spacer()
                Button(action: {
                    self.showingModalView.toggle()
                }){
                    Image("Lemon-card")
                        .resizable()
                        .frame(width: 70, height: 110)
                        .aspectRatio(contentMode: .fit)
                        //.scaledToFit()
                        .shadow(color: .accentColor.opacity(0.22), radius: 35, x: 0, y: 5.0)
                }.padding(.top)
                    .buttonStyle(PlainButtonStyle())
                Text(myCard.number)
                    .font(Font.system(.body, design: .rounded))
                    .foregroundColor(.secondary)
                    .privacySensitive()
                //.padding(.top,20)
            }
        }.sheet(isPresented: $showingModalView) {
            CardSettingsView(myCard : myCard)
        }
         
    }/*.toolbar {
        Text("AAAA")
    }*/
}

struct LemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        LemonCardView(myCard: Card(number: "", status: .active))
    }
}
