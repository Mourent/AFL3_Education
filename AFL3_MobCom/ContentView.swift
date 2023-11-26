//
//  ContentView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var lastApplePosition: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var appleOffset: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var dataXAwal: [Int] = []
    @State private var dataYAwal: [Int] = []
    @State private var angka: Int = Int.random(in: 1...7)
    @State private var applesInBasket: Int = 0
    @State private var showingBenar: Bool = false
    @State private var showingSalah: Bool = false
    @State private var isPeternakanHitungActive = false
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("tree")
            
            Image("cewe")
                .position(CGPoint(x: (widthLayar * 0.835), y: heightLayar * 0.695))
            
            Image("basket")
                .position(CGPoint(x: widthLayar * 0.711, y: heightLayar * 0.815))
            
            Button("SUBMIT") {
                cekApple()
                if (applesInBasket == angka){
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
            
            ZStack{
                Image("awan")
                    .position(CGPoint(x: widthLayar * 0.745, y: heightLayar * 0.420))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.758, y: heightLayar * 0.401))
                Text("\(angka)")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(.red)
                    .position(CGPoint(x: widthLayar * 0.718, y: heightLayar * 0.404))
                    .border(Color.black)
            }
            
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
                .position(CGPoint(x: widthLayar * 0.544, y: heightLayar * 0.240))
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
                .position(CGPoint(x: widthLayar * 0.461, y: heightLayar * 0.300))
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
                .position(CGPoint(x: widthLayar * 0.586, y: heightLayar * 0.372))
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
                .position(CGPoint(x: widthLayar * 0.637, y: heightLayar * 0.480))
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
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.494, y: heightLayar * 0.444))
                .offset(appleOffset[5])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[5] = CGSize(
                                width: lastApplePosition[5].width + gesture.translation.width,
                                height: lastApplePosition[5].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[5] = appleOffset[5]
                        }
                )
            Image("apple")
                .position(CGPoint(x: widthLayar * 0.394, y: heightLayar * 0.540))
                .offset(appleOffset[6])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            appleOffset[6] = CGSize(
                                width: lastApplePosition[6].width + gesture.translation.width,
                                height: lastApplePosition[6].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastApplePosition[6] = appleOffset[6]
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
            ContentView().hidden()
        }
    }
    func cekApple(){
        dataXAwal += [(Int(widthLayar * 0.377)), Int(widthLayar * 0.544), Int(widthLayar * 0.461), Int(widthLayar * 0.586), Int(widthLayar * 0.637), Int(widthLayar * 0.494), Int(widthLayar * 0.394)]
        dataYAwal += [(Int(heightLayar * 0.360)), Int(heightLayar * 0.240), Int(heightLayar * 0.300), Int(heightLayar * 0.372), Int(heightLayar * 0.480), Int(heightLayar * 0.444), Int(heightLayar * 0.540)]
        applesInBasket = 0
        for index in 0..<7 {
            let lastAppleX = Int(lastApplePosition[index].width) + dataXAwal[index]
            let lastAppleY = Int(lastApplePosition[index].height) + dataYAwal[index]
            
            // Cek apakah posisi terakhir apel berada di dalam area keranjang
            if (lastAppleX >= Int(widthLayar * 0.670) && lastAppleX <= Int(widthLayar * 0.754) && lastAppleY >= Int(heightLayar * 0.755) && lastAppleY <= Int(heightLayar * 0.875)) {
                applesInBasket += 1
                print("Apel \(index + 1) masuk ke keranjang!")
            }
        }
    }
    func reset(){
        angka = Int.random(in: 1...7)
        appleOffset = Array(repeating: .zero, count: 7)
        lastApplePosition = Array(repeating: .zero, count: 7)
    }
}

#Preview {
    ContentView()
}
