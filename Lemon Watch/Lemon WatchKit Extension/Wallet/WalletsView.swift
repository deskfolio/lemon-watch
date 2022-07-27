//
//  WalletsView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

struct WalletsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var walletsObject = WalletsObject()
    @Binding var currentWallet: Int
    
    let titleText : String = "¿Con qué moneda querés pagar?"
    let headerText : String = "Billeteras"
    let footerText : String = "¡Próximamente vas a poder pagar con más criptomonedas!"
    
    var body: some View {
        List{
            
            Text(titleText)
                .font(.title3).foregroundColor(Color.accentColor).listRowBackground(Color.clear)
            
            Section(header: Text(headerText), footer: Text(footerText)){
                
                // Coins Picker
                Picker("", selection: $currentWallet) {
                    ForEach(walletsObject.wallets, id: \.id) { wallet in
                        HStack(spacing:8){
                            Image("\(wallet.coin)")
                            HStack(spacing:2){
                                Text(wallet.coin+" (\(wallet.name))")
                                    .lineLimit(1)
                            }
                        }.foregroundColor(Color.primary)
                    }
                }.pickerStyle(.inline)
                    .foregroundColor(Color.accentColor)
                    //.accentColor(.accentColor) // <-- Does not work!
                    .labelsHidden()
                    .onChange(of: currentWallet) { _ in dismiss() } // Dimiss Sheet
            }
        }
    }
}

struct WalletsView_Previews: PreviewProvider {
    static var previews: some View {
        WalletsView(currentWallet: .constant(0))
    }
 }
