//
//  ContentView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct buah: View {
    @State private var lastBuahPosition: [CGSize] = Array(repeating: .zero, count: 9)
    @State private var buahOffset: [CGSize] = Array(repeating: .zero, count: 9)
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var randomImageName: [String] = (0..<9).map { _ in Bool.random() ? "apple" : "lemon" }
    @State private var dataXAwal: [Int] = [
        (Int(UIScreen.main.bounds.width * 0.377)),
        (Int(UIScreen.main.bounds.width * 0.461)),
        (Int(UIScreen.main.bounds.width * 0.586)),
        (Int(UIScreen.main.bounds.width * 0.637)),
        (Int(UIScreen.main.bounds.width * 0.464)),
        (Int(UIScreen.main.bounds.width * 0.394)),
        (Int(UIScreen.main.bounds.width * 0.454)),
        (Int(UIScreen.main.bounds.width * 0.554)),
        (Int(UIScreen.main.bounds.width * 0.544))
    ]
    @State private var dataYAwal: [Int] = [
        (Int(UIScreen.main.bounds.height * 0.360)),
        (Int(UIScreen.main.bounds.height * 0.300)),
        (Int(UIScreen.main.bounds.height * 0.372)),
        (Int(UIScreen.main.bounds.height * 0.480)),
        (Int(UIScreen.main.bounds.height * 0.510)),
        (Int(UIScreen.main.bounds.height * 0.570)),
        (Int(UIScreen.main.bounds.height * 0.420)),
        (Int(UIScreen.main.bounds.height * 0.240)),
        (Int(UIScreen.main.bounds.height * 0.470))
    ]
    @State private var applesInBasket: Int = 0
    @State private var lemonsInBasket: Int = 0
    @State private var showingBenar: Bool = false
    @State private var showingSalah: Bool = false
    @State private var isPeternakanHitungActive = false
    @State private var isStartActive = false
    @State private var winCount: Int = 0
    @State private var buahJatuh: [Bool] = Array(repeating: false, count: 9)
    @State private var salahMasuk: [Bool] = Array(repeating: false, count: 9)
    @Binding var displayMode: DisplayMode

    
    var body: some View {
        ZStack {
            
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("tree")
            
            
            Button {
                //                isStartActive = true
                displayMode = .home
            } label: {
                Image("panah")
                    .resizable()
                    .scaledToFit()
            }
            
            .frame(width:100,height:80)
            .position(CGPoint(x: widthLayar * 0.05, y: heightLayar * 0.05))
            
            Image("lagu")
                .position(CGPoint(x: widthLayar * 0.95, y: heightLayar * 0.1))
            
            Image("basket")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
                .position(CGPoint(x: widthLayar * 0.811, y: heightLayar * 0.81))
            
            
            Image("basket")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
                .position(CGPoint(x: widthLayar * 0.241, y: heightLayar * 0.81))
            
            Image("papanapple")
                .position(CGPoint(x: widthLayar * 0.811, y: heightLayar * 0.65))
            
            Image("papanlemon")
                .position(CGPoint(x: widthLayar * 0.241, y: heightLayar * 0.65))
            
            ForEach(0..<9) { index in
                Image("\(randomImageName[index])")
                    .position(CGPoint(x: dataXAwal[index], y: dataYAwal[index]))
                    .offset(buahOffset[index])
                    .gesture(
                        DragGesture()
                            .onChanged{ gesture in
                                if !buahJatuh[index]{
                                    buahOffset[index] = CGSize(
                                        width: lastBuahPosition[index].width + gesture.translation.width,
                                        height: lastBuahPosition[index].height + gesture.translation.height
                                    )
                                } else {
                                    buahOffset[index] = CGSize(
                                        width: lastBuahPosition[index].width + gesture.translation.width,
                                        height: (heightLayar * 0.92 - CGFloat(dataYAwal[index])) + gesture.translation.height
                                    )
                                }
                                if salahMasuk[index]{
                                    buahOffset[index] = CGSize(
                                        width: 0 + gesture.translation.width,
                                        height: 0 + gesture.translation.height
                                    )
                                }
                            }
                            .onEnded{ gesture in
                                salahMasuk[index] = false
                                lastBuahPosition[index] = buahOffset[index]
                                
                                let lastBuahX = Int(lastBuahPosition[index].width) + Int(dataXAwal[index])
                                let lastBuahY = Int(lastBuahPosition[index].height) + Int(dataYAwal[index])
                                
                                if CGFloat(dataYAwal[index]) + lastBuahPosition[index].height < heightLayar * 0.85 {
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        buahOffset[index] = CGSize(
                                            width: lastBuahPosition[index].width,
                                            height: (heightLayar * 0.92 - CGFloat(dataYAwal[index]))
                                        )
                                    }
                                    buahJatuh[index] = true
                                }else {
                                    buahJatuh[index] = false
                                }
                                
                                if randomImageName[index] == "apple" {
                                    if (lastBuahX >= Int(widthLayar * 0.770) && lastBuahX <= Int(widthLayar * 0.854) && lastBuahY <= Int(heightLayar * 0.870)) {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            buahOffset[index] = CGSize(
                                                width: widthLayar*0.811 - CGFloat(dataXAwal[index]),
                                                height: (heightLayar * 0.83 - CGFloat(dataYAwal[index]))
                                            )
                                        }
                                        winCount += 1
                                        print(winCount)
                                    } else if (lastBuahX >= Int(widthLayar * 0.200) && lastBuahX <= Int(widthLayar * 0.284) && lastBuahY <= Int(heightLayar * 0.870)) {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            buahOffset[index] = CGSize(
                                                width: widthLayar*0.25 - CGFloat(dataXAwal[index]),
                                                height: (heightLayar * 0.84 - CGFloat(dataYAwal[index]))
                                            )
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            withAnimation(.easeInOut(duration: 1.5)) {
                                                buahOffset[index] = CGSize(
                                                    width: 0,
                                                    height: 0
                                                )
                                            }
                                        }
                                        salahMasuk[index] = true
                                    }
                                } else {
                                    if (lastBuahX >= Int(widthLayar * 0.200) && lastBuahX <= Int(widthLayar * 0.284) && lastBuahY <= Int(heightLayar * 0.870)) {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            buahOffset[index] = CGSize(
                                                width: widthLayar*0.25 - CGFloat(dataXAwal[index]),
                                                height: (heightLayar * 0.85 - CGFloat(dataYAwal[index]))
                                            )
                                        }
                                        winCount += 1
                                        print(winCount)
                                    } else if (lastBuahX >= Int(widthLayar * 0.770) && lastBuahX <= Int(widthLayar * 0.854) && lastBuahY <= Int(heightLayar * 0.870)) {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            buahOffset[index] = CGSize(
                                                width: widthLayar*0.811 - CGFloat(dataXAwal[index]),
                                                height: (heightLayar * 0.83 - CGFloat(dataYAwal[index]))
                                            )
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                            withAnimation(.easeInOut(duration: 1.5)) {
                                                buahOffset[index] = CGSize(
                                                    width: 0,
                                                    height: 0
                                                )
                                            }
                                        }
                                        salahMasuk[index] = true
                                    }

                                }
                                
                                if winCount == 9 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        showingBenar = true
                                    }
                                }
                            }
                    )
            }
            
            Image("basketdepan")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 159)
                .position(CGPoint(x: widthLayar * 0.811, y: heightLayar * 0.81))
            Image("basketdepan")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 159)
                .position(CGPoint(x: widthLayar * 0.241, y: heightLayar * 0.81))
            
            if showingBenar {
                ZStack{
                    Image("board")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                    
                    Button {
                        //                    isPeternakanHitungActive = true
                        displayMode = .BuahHitung
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
        }
    }
}


struct Buah_Previews: PreviewProvider {
    @State static var displayMode: DisplayMode = .buah

    static var previews: some View {
        buah(displayMode: $displayMode)
    }
}
