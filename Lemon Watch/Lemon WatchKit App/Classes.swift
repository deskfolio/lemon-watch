//
//  Classes.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import Foundation

class Card: ObservableObject {

    @Published var number : String = ""
    @Published var status = status.active
    
    enum status {
        case active
        case paused // Paused: User manually paused the card
        case flagged // Flagged: Reported  by the user as permanently Lost or Stolen (card is unavailable)
    }
    
    init(number: String, status: status) {
            self.number = "•••• 1415"
        }
}

struct Wallet: Identifiable {
    
    var id: Int
    var coin: String
    var name: String
    var balance: String // Should be float and currency formatted
    var balanceARS: String // Should be float and currency formatted
    
}

class WalletsObject : ObservableObject{
    
    @Published var wallets = [Wallet]()
    
    init(){
        
        wallets = [
            Wallet(id: 0, coin: "ARS", name: "Pesos Arg.", balance: "", balanceARS: "$ 3.719,69"),
            Wallet(id: 1, coin: "BTC", name: "Bitcoin", balance: "0,00061835", balanceARS: "$ 4.692,45"),
            Wallet(id: 2, coin: "ETH", name: "Ethereum", balance: "0,00029444", balanceARS: "$ 161,69"),
            Wallet(id: 3, coin: "USDT", name: "Tether", balance: "0,41", balanceARS: "$ 78,68"),
            Wallet(id: 4, coin: "DAI", name: "Dai", balance: "1,17", balanceARS: "$ 221,51"),
            Wallet(id: 5, coin: "USDC", name: "USD Coin", balance: "1", balanceARS: "$ 130,59"),
        ]
        
        }
}
