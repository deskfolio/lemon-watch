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
        VStack{
            Spacer()
            HStack(alignment:.center){
                VStack (alignment: .center){
                    // Header
                    Text("\(myWallet.balanceARS)")
                        .frame(maxWidth:.infinity)
                        .font(Font.system(.title, design: .rounded))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .privacySensitive()

                    if (myWallet.coin != "ARS") {
                        Text("\(myWallet.balance)"+" \(myWallet.coin)")
                            .frame(maxWidth:.infinity)
                            .font(Font.system(.body, design: .rounded))
                            .foregroundColor(Color.secondary)
                            .privacySensitive()
                    }
                    
                    // Wallets BTN
                    Button(action: {
                        self.showCoinPicker.toggle()
                    }){
                        HStack(spacing:8){
                            Image("\(myWallet.coin)")
                                .privacySensitive()
                            
                            Text("\(myWallet.name)")
                                .font(.caption)
                                .fontWeight(.medium)
                                .privacySensitive()
                        }
                    }.padding(.vertical)
                        .padding(.horizontal)
                    // Coin Picker Modal
                        .sheet(isPresented: $showCoinPicker) {
                            WalletsView(currentWallet: self.$currentWallet)
                        }
                }
                .padding()
            }.padding(.bottom)
            .frame(maxHeight:.infinity)
            .frame(maxHeight:.infinity)
            .ignoresSafeArea()
        }
    }
    
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
            .previewDevice("Apple Watch Series 5 - 40mm")
    }
}
