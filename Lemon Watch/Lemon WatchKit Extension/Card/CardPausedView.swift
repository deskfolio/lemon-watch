//
//  CardLostView.swift
//  Lemon WatchKit Extension
//
//  Created by Antonio García Aprea on 26/06/2022.
//

import SwiftUI

struct CardPausedView: View {
    
    @State private var showAlert = false
    @ObservedObject var myCard: Card
    
    let titleText : String = "Tu Lemon Card está pausada"
    let subtitleText : String = "No podés realizar consumos"
    let alertMessage : String = "¿Ya encontraste tu Lemon Card?"
    
    var body: some View {
        Button(action: {
            self.showAlert.toggle()
        }) {
            
            VStack(alignment: .center, spacing:5){
                Image("Lemon-card")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 60).padding(.vertical)
                Text(titleText)
                    .padding(.horizontal).font(.body).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true)
                Text(subtitleText)
                    .font(.system(size: 14)).foregroundColor(.secondary).multilineTextAlignment(.center).fixedSize(horizontal: false, vertical: true).padding(.horizontal)
                
            }.alert(isPresented: $showAlert) { // Alert View
                
                Alert.sideBySideButtons(title: Text(alertMessage), primaryButton: .default(Text("Activar")){
                    myCard.status = .active
                    WKInterfaceDevice.current().play(.success) // Play sound
                }, secondaryButton: .cancel(Text("No")))
                
            }.padding(.top)
                .offset(y: 5)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct CardLostView_Previews: PreviewProvider {
    static var previews: some View {
        CardPausedView(myCard: Card(number: "", status: .active))
    }
 }
