//
//  ContentView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isBUAHActive = false
    @State private var displayMode: DisplayMode = .home
    var body: some View {
        
        switch displayMode {
        case .buah:
            buah(displayMode: $displayMode) // View dari file BuahView.swift
        case .BuahHitung:
            BuahHitung(displayMode: $displayMode) // View dari file HewanMasukView.swift
        case .PeternakanHitung:
            PeternakanHitung(displayMode: $displayMode) // View dari file ModeKetigaView.swift
        case .HewanMasuk:
            HewanMasuk(displayMode: $displayMode) // View dari file ModeKeempatView.swift
        case .home:
            ZStack {
                Image("bgstart")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Button {
//                    isBUAHActive = true
                    displayMode = .buah
                } label: {
                    Image("buttonplay")
                }
            }
            
//            if isBUAHActive {
//                BuahHitung()
//                ContentView().hidden()
//            }
        }
        
    }
}

enum DisplayMode {
    case home
    case buah
    case BuahHitung
    case PeternakanHitung
    case HewanMasuk
}
#Preview {
    ContentView()
}
