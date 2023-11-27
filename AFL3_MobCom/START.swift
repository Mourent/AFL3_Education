//
//  ContentView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct START: View {
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isBUAHActive = false
    var body: some View {
        ZStack {
            Image("bgstart")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Button {
                isBUAHActive = true
            } label: {
                Image("buttonplay")
            }
        }
        
        if isBUAHActive {
            buah()
            ContentView().hidden()
        }
    }
    
}


#Preview {
    START()
}
