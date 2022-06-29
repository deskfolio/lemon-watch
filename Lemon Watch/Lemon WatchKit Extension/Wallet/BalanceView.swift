//
//  BalanceView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

struct BalanceView: View {
    
    @ObservedObject var walletsObject = WalletsObject()
    @State private var showCoinPicker = false
    @State private var currentWallet = 2 // ETH
    
    var body: some View {
        
        let myWallet = walletsObject.wallets[currentWallet]
        
        HStack(alignment:.center){
            
            VStack (alignment: .center){
            
                // Header
                Text("\(myWallet.balanceARS)")
                    .frame(maxWidth:.infinity)
                    .font(Font.system(.title, design: .rounded))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .privacySensitive()
 
                if (!myWallet.balance.isEmpty) {
                    Text("\(myWallet.balance)")
                        .frame(maxWidth:.infinity)
                        .font(Font.system(.body, design: .rounded))
                        .foregroundColor(Color.secondary)
                        .privacySensitive()
                }
                
                Spacer().frame(height: 5)
                
                // Wallets BTN
                Button(action: {
                    self.showCoinPicker.toggle()
                }){
                    HStack(spacing:8){
                        Image("\(myWallet.image)")
                            .privacySensitive()
                        
                        Text("\(myWallet.name)")
                            .font(.caption)
                            .fontWeight(.medium)
                            .privacySensitive()
                    }
                }
                .padding(.vertical)
                
                // Coin Picker Modal
                .sheet(isPresented: $showCoinPicker) {
                    WalletsView(currentWallet: self.$currentWallet)
                }
            }.padding(.all)
            .offset(y:15)
        }
        
    }
    
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
