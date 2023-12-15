//
//  ContentView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isMusicPlaying = true
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var isBUAHActive = false
    @State private var displayMode: DisplayMode = .home
    var body: some View {
        
        switch displayMode {
        case .kelinci:
            KelinciCocok(displayMode: $displayMode)
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
                    //                isStartActive = true
                    toggleMusic()
                } label: {
                    Image(isMusicPlaying ? "lagu" : "lagu")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width:100,height:80)
                .position(CGPoint(x: widthLayar * 0.95, y: heightLayar * 0.1))

                
                Button {
//                    isBUAHActive = true
                    displayMode = .kelinci
                } label: {
                    Image("buttonplay")
                }
            }.onAppear{
                playSound(sound: "soundtrack", type: "mp3")
            }
            
//            if isBUAHActive {
//                BuahHitung()
//                ContentView().hidden()
//            }
        }
    }
    func toggleMusic() {
            if isMusicPlaying {
                audioPlayer?.stop()
            } else {
                audioPlayer?.play()
            }
            isMusicPlaying.toggle()
        }
}

enum DisplayMode {
    case home
    case buah
    case BuahHitung
    case PeternakanHitung
    case HewanMasuk
    case kelinci
}
#Preview {
    ContentView()
}
