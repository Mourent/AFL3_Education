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
    @State private var dataXAwal: [Int] = [450, 650, 550, 700, 760, 590, 470]
    @State private var dataYAwal: [Int] = [300, 200, 250, 310, 400, 370, 450]
    @State private var angka: Int = Int.random(in: 1...7)
    @State private var applesInBasket: Int = 0
    @State private var showingBenar: Bool = false
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("tree")
            
            Image("cewe")
                .position(CGPoint(x: 990, y: 580))
            
            Image("basket")
                .position(CGPoint(x: 850, y: 680))
            
            Button("Submit") {
                cekApple()
                if (applesInBasket == angka){
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
                            reset()
                        }
                    )
                )
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .position(x: 850, y: 790)
            
            
            ZStack{
                Image("awan")
                    .position(CGPoint(x: 890, y: 350))
                Image("apple")
                    .position(CGPoint(x: 905, y: 335))
                Text("\(angka)")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(.red)
                    .position(CGPoint(x: 857, y: 337))
                    .border(Color.black)
            }
            
            Image("apple")
                .position(CGPoint(x: 450, y: 300))
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
                .position(CGPoint(x: 650, y: 200))
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
                .position(CGPoint(x: 550, y: 250))
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
                .position(CGPoint(x: 700, y: 310))
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
                .position(CGPoint(x: 760, y: 400))
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
                .position(CGPoint(x: 590, y: 370))
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
                .position(CGPoint(x: 470, y: 450))
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
        }
    }
    func cekApple(){
        applesInBasket = 0
        for index in 0..<7 {
            let lastAppleX = Int(lastApplePosition[index].width) + dataXAwal[index]
            let lastAppleY = Int(lastApplePosition[index].height) + dataYAwal[index]
            
            // Cek apakah posisi terakhir apel berada di dalam area keranjang
            if (lastAppleX >= 800 && lastAppleX <= 900 && lastAppleY >= 630 && lastAppleY <= 730) {
                applesInBasket += 1
                print("Apel \(index + 1) masuk ke keranjang!")
            }
        }
    }
    func reset(){
        angka = Int.random(in: 1...7)  
        lastApplePosition = Array(repeating: .zero, count: 7)
        appleOffset = Array(repeating: .zero, count: 7)
    }

}

#Preview {
    ContentView()
}
