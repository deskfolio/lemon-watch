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
                
                // Coins List
                
                ForEach(walletsObject.wallets, id: \.id) { wallets in
                    Button(action: {
                        currentWallet = wallets.id
                        dismiss()
                    }){
                        HStack(spacing:8){
                            Image("\(wallets.image)")
                                .privacySensitive()
                            HStack(spacing:2){
                                Text(wallets.coin+" (\(wallets.name))")
                                    .lineLimit(1)
                            }.privacySensitive()
                            
                            if (currentWallet == wallets.id) {
                                Spacer()
                                Image(systemName: "checkmark").imageScale(.medium) // Selection icon
                                    .foregroundColor(Color.accentColor)
                                    .font(.system(size: 18, weight: .bold))
                            }
                        }
                    }
                }
            }
        }
    }
}
