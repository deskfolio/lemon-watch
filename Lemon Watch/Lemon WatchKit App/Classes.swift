//
//  Classes.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import Foundation

class Card: ObservableObject {
    
    @Published var isLost = false
    @Published var number : String = ""
    
    init(isLost: Bool, number: String) {
            self.isLost = isLost
            self.number = "**** 1415"
        }
}

struct Wallet: Identifiable {
    
    var id: Int
    var image: String
    var coin: String
    var name: String
    var balance: String // Should be float and currency formatted
    var balanceARS: String // Should be float and currency formatted
    
}

class WalletsObject : ObservableObject{
    
    @Published var wallets = [Wallet]()
    
    init(){
        
        wallets = [
            Wallet(id: 0, image: "Currency-ARS", coin: "ARS", name: "Pesos Arg.", balance: "", balanceARS: "$ 3.719,69"),
            Wallet(id: 1, image: "Currency-BTC", coin: "BTC", name: "Bitcoin", balance: "0,00061835 BTC", balanceARS: "$ 4.692,45"),
            Wallet(id: 2, image: "Currency-ETH", coin: "ETH", name: "Ethereum", balance: "0,00029444 ETH", balanceARS: "$ 161,69"),
            Wallet(id: 3, image: "Currency-USDT", coin: "USDT", name: "Tether", balance: "0,41 USDT", balanceARS: "$ 78,68"),
            Wallet(id: 4, image: "Currency-DAI", coin: "DAI", name: "Dai", balance: "1,17 DAI", balanceARS: "$ 221,51"),
        ]
        
        }
}
