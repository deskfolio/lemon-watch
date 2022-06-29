//
//  CardFlaggedView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 29/06/2022.
//

import SwiftUI

struct CardFlaggedView: View {
    //@State private var showAlert = false
    @ObservedObject var myCard: Card
    
    let titleText : String = "Tu Lemon Card no está disponible"
    let subtitleText : String = "Cuando recibas la tarjeta física, vas a poder activarla desde tu celular."
    
    var body: some View {
            VStack(alignment: .center, spacing:5){
                Text("🍋")
                    .font(.system(size: 32))
                Text(titleText)
                    .padding(.horizontal).font(.body).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                Text(subtitleText)
                    .font(.system(size: 14)).foregroundColor(.secondary).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).padding(.horizontal)
            }
    }
}

struct CardFlaggedView_Previews: PreviewProvider {
    static var previews: some View {
        CardFlaggedView(myCard: Card(isPaused: false, isFlagged: false, number: ""))
    }
}
