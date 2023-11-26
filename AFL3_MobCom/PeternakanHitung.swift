//
//  PeternakanHitung.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 26/11/23.
//

import SwiftUI

struct PeternakanHitung: View {
    @State private var lastSheepPosition: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var sheepOffset: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var dataXAwal: [Int] = []
    @State private var dataYAwal: [Int] = []
    @State private var angka: Int = Int.random(in: 1...5)
    @State private var sheepInBasket: Int = 0
    @State private var showingBenar: Bool = false
    @State private var goHitungApel: Bool = false
    
    var body: some View {
        ZStack {
            Image("bgternak")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("kandang")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.47)
                .position(CGPoint(x: widthLayar * 0.22, y: heightLayar * 0.660))
            
            Image("cowo")
                .position(CGPoint(x: widthLayar * 0.400, y: heightLayar * 0.700))
            
            Button("SUBMIT") {
                cekSheep()
                if (sheepInBasket == angka){
                    showingBenar = true
                }
                else {
                    
                }
            }
            .alert(isPresented: $showingBenar) {
                Alert(
                    title: Text("Jawaban Benar"),
                    message: Text("Selamat! Jawaban Anda benar."),
                    dismissButton: .default(
                        Text("OK"),
                        action: {
                            goHitungApel = true
                        }
                    )
                )
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
                    .position(CGPoint(x: widthLayar * 0.320, y: heightLayar * 0.450))
                Image("sheep")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.07)
                    .position(CGPoint(x: widthLayar * 0.340, y: heightLayar * 0.433))
                Text("\(angka)")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(.red)
                    .position(CGPoint(x: widthLayar * 0.290, y: heightLayar * 0.433))
                    .border(Color.black)
            }
            Image("sheep")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.18)
                .position(CGPoint(x: widthLayar * 0.600, y: heightLayar * 0.35))
                .offset(sheepOffset[0])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            sheepOffset[0] = CGSize(
                                width: lastSheepPosition[0].width + gesture.translation.width,
                                height: lastSheepPosition[0].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastSheepPosition[0] = sheepOffset[0]
                        }
                )
            
            Image("sheep")
                .resizable()
                .scaledToFit()
                .scaleEffect(x: -0.14, y: 0.14)
                .position(CGPoint(x: widthLayar * 0.458, y: heightLayar * 0.45))
                .offset(sheepOffset[1])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            sheepOffset[1] = CGSize(
                                width: lastSheepPosition[1].width + gesture.translation.width,
                                height: lastSheepPosition[1].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastSheepPosition[1] = sheepOffset[1]
                        }
                )
            
            Image("sheep")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.15)
                .position(CGPoint(x: widthLayar * 0.130, y: heightLayar * 0.35))
                .offset(sheepOffset[2])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            sheepOffset[2] = CGSize(
                                width: lastSheepPosition[2].width + gesture.translation.width,
                                height: lastSheepPosition[2].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastSheepPosition[2] = sheepOffset[2]
                        }
                )
            
            Image("sheep")
                .resizable()
                .scaledToFit()
                .scaleEffect(x: -0.17, y: 0.17)
                .position(CGPoint(x: widthLayar * 0.600, y: heightLayar * 0.633))
                .offset(sheepOffset[3])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            sheepOffset[3] = CGSize(
                                width: lastSheepPosition[3].width + gesture.translation.width,
                                height: lastSheepPosition[3].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastSheepPosition[3] = sheepOffset[3]
                        }
                )
            
            Image("sheep")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.2)
                .position(CGPoint(x: widthLayar * 0.830, y: heightLayar * 0.7))
                .offset(sheepOffset[4])
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            sheepOffset[4] = CGSize(
                                width: lastSheepPosition[4].width + gesture.translation.width,
                                height: lastSheepPosition[4].height + gesture.translation.height
                            )
                        }
                        .onEnded { gesture in
                            lastSheepPosition[4] = sheepOffset[4]
                        }
                )
        }
        if goHitungApel {
            ContentView()
            PeternakanHitung().hidden()
        }
    }
    func cekSheep(){
        dataXAwal += [(Int(widthLayar * 0.600)), Int(widthLayar * 0.458), Int(widthLayar * 0.130), Int(widthLayar * 0.600), Int(widthLayar * 0.830)]
        dataYAwal += [(Int(heightLayar * 0.35)), Int(heightLayar * 0.45), Int(heightLayar * 0.35), Int(heightLayar * 0.633), Int(heightLayar * 0.7)]
        sheepInBasket = 0
        for index in 0..<5 {
            let lastAppleX = Int(lastSheepPosition[index].width) + dataXAwal[index]
            let lastAppleY = Int(lastSheepPosition[index].height) + dataYAwal[index]
            
            // Cek apakah posisi terakhir apel berada di dalam area keranjang
            if (lastAppleX >= Int(widthLayar * 0.0) && lastAppleX <= Int(widthLayar * 0.25) && lastAppleY >= Int(heightLayar * 0.5) && lastAppleY <= Int(heightLayar * 0.8)) {
                sheepInBasket += 1
                print("Kambing \(index + 1) masuk ke keranjang!")
            }
        }
    }
}

#Preview {
    PeternakanHitung()
}
