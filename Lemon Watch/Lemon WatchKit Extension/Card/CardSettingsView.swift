//
//  CardSettingsView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 07/03/2022.
//

import SwiftUI

struct CardSettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var myCard: Card
    
    let titleText : String = "¿No encontrás tu Lemon Card?"
    
    let messageText : String = "No te preocupes. Si perdiste control momentáneo sobre tu tarjeta, pausala hasta que la recuperes, y así evitar consumos sin tu consentimiento."
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading, spacing: 5){
                Text("😩")
                    .font(.system(size: 32))
                Text(titleText)
                    .font(.title3)
                    .foregroundColor(Color.accentColor)
                Divider()
                    .padding(.vertical)
                Text(messageText)
                    .foregroundColor(Color.secondary)
                    .font(.body)
                Spacer()
                Button("Pausar Tarjeta"){
                    myCard.isLost.toggle()
                    dismiss()
                }.foregroundColor(Color.accentColor)
                    .cornerRadius(9)
                    .background(Color.accentColor.opacity(0.04))
            }.padding(.horizontal)
                .padding(.top)
            
        }
    }
}

struct CardSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CardSettingsView(myCard: Card(isLost: false, number: ""))
    }
 }
