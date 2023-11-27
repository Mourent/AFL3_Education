//
//  ContentView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct buah: View {
    @State private var lastApplePosition: [CGSize] = Array(repeating: .zero, count: 9)
    @State private var appleOffset: [CGSize] = Array(repeating: .zero, count: 9)
    @State private var lastLemonPosition: [CGSize] = Array(repeating: .zero, count: 9)
    @State private var lemonOffset: [CGSize] = Array(repeating: .zero, count: 9)
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var dataXAwal: [Int] = []
    @State private var dataYAwal: [Int] = []
    @State private var applesInBasket: Int = 0
    @State private var dataXAwall: [Int] = []
    @State private var dataYAwall: [Int] = []
    @State private var lemonsInBasket: Int = 0
    @State private var showingBenar: Bool = false
    @State private var showingSalah: Bool = false
    @State private var isPeternakanHitungActive = false
    @State private var isStartActive = false
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("tree")
            
            
            Button {
                isStartActive = true
            } label: {
                Image("panah")
                    .position(CGPoint(x: widthLayar * 0.05, y: heightLayar * 0.08))
            }
            
            Image("lagu")
                .position(CGPoint(x: widthLayar * 0.95, y: heightLayar * 0.1))
            
            Image("basket")
                .position(CGPoint(x: widthLayar * 0.711, y: heightLayar * 0.755))
            
            Image("basket")
                .position(CGPoint(x: widthLayar * 0.341, y: heightLayar * 0.755))
            
            Image("papanapple")
                .position(CGPoint(x: widthLayar * 0.711, y: heightLayar * 0.915))
            
            Image("papanlemon")
                .position(CGPoint(x: widthLayar * 0.341, y: heightLayar * 0.915))
            
            
            
            Button("SUBMIT") {
                cekApple()
                cekLemon()
                if (lemonsInBasket == 4 && applesInBasket == 5){
                    showingBenar = true
                }
                else {
                    showingSalah = true
                }
            }
            .padding()
            .background(Color(UIColor(red: 0x70/255.0, green: 0x9F/255.0, blue: 0x19/255.0, alpha: 1.0)))
            .shadow(radius: 50)
            .foregroundColor(.white)
            .font(.custom("PaytoneOne-Regular", size: 24))
            .cornerRadius(10)
            .position(x: widthLayar * 0.532, y: heightLayar * 0.915)
    
            
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.377, y: heightLayar * 0.360))
                .offset(appleOffset[0])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[0] = CGSize(
                                width: lastApplePosition[0].width + gesture.translation.width,
                                height: lastApplePosition[0].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[0] = appleOffset[0]
                        }
                )
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.461, y: heightLayar * 0.300))
                .offset(appleOffset[1])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[1] = CGSize(
                                width: lastApplePosition[1].width + gesture.translation.width,
                                height: lastApplePosition[1].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[1] = appleOffset[1]
                        }
                )
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.586, y: heightLayar * 0.372))
                .offset(appleOffset[2])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[2] = CGSize(
                                width: lastApplePosition[2].width + gesture.translation.width,
                                height: lastApplePosition[2].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[2] = appleOffset[2]
                        }
                )
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.637, y: heightLayar * 0.480))
                .offset(appleOffset[3])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[3] = CGSize(
                                width: lastApplePosition[3].width + gesture.translation.width,
                                height: lastApplePosition[3].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[3] = appleOffset[3]
                        }
                )
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.464, y: heightLayar * 0.510))
                .offset(appleOffset[4])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[4] = CGSize(
                                width: lastApplePosition[4].width + gesture.translation.width,
                                height: lastApplePosition[4].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[4] = appleOffset[4]
                        }
                )
            Image("lemon")
                .position(CGPoint(x: widthLayar * 0.394, y: heightLayar * 0.570))
                .offset(lemonOffset[0])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            lemonOffset[0] = CGSize(
                                width: lastLemonPosition[0].width + gesture.translation.width,
                                height: lastLemonPosition[0].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastLemonPosition[0] = lemonOffset[0]
                        }
                )
            Image("lemon")
                .position(CGPoint(x: widthLayar * 0.454, y: heightLayar * 0.420))
                .offset(lemonOffset[1])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            lemonOffset[1] = CGSize(
                                width: lastLemonPosition[1].width + gesture.translation.width,
                                height: lastLemonPosition[1].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastLemonPosition[1] = lemonOffset[1]
                        }
                )
            Image("lemon")
                .position(CGPoint(x: widthLayar * 0.554, y: heightLayar * 0.240))
                .offset(lemonOffset[2])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            lemonOffset[2] = CGSize(
                                width: lastLemonPosition[2].width + gesture.translation.width,
                                height: lastLemonPosition[2].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastLemonPosition[2] = lemonOffset[2]
                        }
                )
            Image("lemon")
                .position(CGPoint(x: widthLayar * 0.544, y: heightLayar * 0.470))
                .offset(lemonOffset[3])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            lemonOffset[3] = CGSize(
                                width: lastLemonPosition[3].width + gesture.translation.width,
                                height: lastLemonPosition[3].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastLemonPosition[3] = lemonOffset[3]
                        }
                )
            
            if showingBenar {
                ZStack{
                    Image("board")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                    
                Button {
                    isPeternakanHitungActive = true
                } label: {
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.25)
                }
                .position(CGPoint(x: widthLayar * 0.51, y: heightLayar * 0.57))
                    
                Text("Next")
                    .foregroundColor(.black)
                    .font(.custom("PaytoneOne-Regular", size: 50))
                    .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.42))
                Text("Correct")
                    .foregroundColor(.white)
                    .font(.custom("PaytoneOne-Regular", size: 50))
                    .position(CGPoint(x: widthLayar * 0.50, y: heightLayar * 0.275))
                }
            }
            if showingSalah {
                ZStack{
                    Image("board")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                    
                Button {
                    reset()
                    showingSalah = false
                } label: {
                    Image("tryagain")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.2)
                }
                .position(CGPoint(x: widthLayar * 0.51, y: heightLayar * 0.57))
                    
                Text("Try Again")
                    .foregroundColor(.black)
                    .font(.custom("PaytoneOne-Regular", size: 50))
                    .position(CGPoint(x: widthLayar * 0.51, y: heightLayar * 0.42))
                Text("Wrong")
                    .foregroundColor(.white)
                    .font(.custom("PaytoneOne-Regular", size: 50))
                    .position(CGPoint(x: widthLayar * 0.503, y: heightLayar * 0.275))
                    
                }
            }
        }
        if isPeternakanHitungActive {
            PeternakanHitung()
            buah().hidden()
        }
        if isStartActive {
            ContentView()
            buah().hidden()
        }
    }
    func cekApple(){
        dataXAwal += [(Int(widthLayar * 0.377)),Int(widthLayar * 0.461), Int(widthLayar * 0.586),Int(widthLayar * 0.637), Int(widthLayar * 0.464)]
        dataYAwal += [(Int(heightLayar * 0.360)),Int(heightLayar * 0.300), Int(heightLayar * 0.372), Int(heightLayar * 0.480), Int(heightLayar * 0.510)]

        for index in 0..<5 {
            let lastAppleX = Int(lastApplePosition[index].width) + dataXAwal[index]
            let lastAppleY = Int(lastApplePosition[index].height) + dataYAwal[index]
            
            // Cek apakah posisi terakhir apel berada di dalam area keranjang
            if (lastAppleX >= Int(widthLayar * 0.670) && lastAppleX <= Int(widthLayar * 0.754) && lastAppleY >= Int(heightLayar * 0.705) && lastAppleY <= Int(heightLayar * 0.925)) {
                applesInBasket += 1
                print("Apel \(index + 1) masuk ke keranjang!")
            }
        }
    }
    
    func cekLemon(){
        dataXAwall += [(Int(widthLayar * 0.394)), Int(widthLayar * 0.454), Int(widthLayar * 0.554), Int(widthLayar * 0.544)]
        dataYAwall += [(Int(heightLayar * 0.570)), Int(heightLayar * 0.420), Int(heightLayar * 0.240), Int(heightLayar * 0.470)]

        for indexx in 0..<4 {
            let lastLemonX = Int(lastLemonPosition[indexx].width) + dataXAwall[indexx]
            let lastLemonY = Int(lastLemonPosition[indexx].height) + dataYAwall[indexx]
            
            // Cek apakah posisi terakhir apel berada di dalam area keranjang
            if (lastLemonX >= Int(widthLayar * 0.300) && lastLemonX <= Int(widthLayar * 0.384) && lastLemonY >= Int(heightLayar * 0.705) && lastLemonY <= Int(heightLayar * 0.925)) {
                lemonsInBasket += 1
                print("Lemon \(indexx + 1) masuk ke keranjang!")
            }
        }
    }
    func reset(){
        appleOffset = Array(repeating: .zero, count: 9)
        lastApplePosition = Array(repeating: .zero, count: 9)
        lemonOffset = Array(repeating: .zero, count: 9)
        lastLemonPosition = Array(repeating: .zero, count: 9)
    }
}

#Preview {
    buah()
}
