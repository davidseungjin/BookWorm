//
//  PushButton.swift
//  BookWorm
//
//  Created by David Lee on 6/19/22.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
            
    }
}
//
//struct PushButton_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        PushButton(title: "David", isOn: false)
//    }
//}