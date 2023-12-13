//
//  KelinciCocok.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 07/12/23.
//

import SwiftUI

struct KelinciCocok: View {
    @Binding var displayMode: DisplayMode
    @State private var lastBuahPosition: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var buahOffset: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var dataXAwal: [Int] = [
        (Int(UIScreen.main.bounds.width * 0.18)),
        (Int(UIScreen.main.bounds.width * 0.08)),
        (Int(UIScreen.main.bounds.width * 0.28)),
        (Int(UIScreen.main.bounds.width * 0.13)),
        (Int(UIScreen.main.bounds.width * 0.23)),
    ]
    @State private var dataYAwal: [Int] = [
        (Int(UIScreen.main.bounds.height * 0.6)),
        (Int(UIScreen.main.bounds.height * 0.6)),
        (Int(UIScreen.main.bounds.height * 0.6)),
        (Int(UIScreen.main.bounds.height * 0.73)),
        (Int(UIScreen.main.bounds.height * 0.73)),
    ]
    @State private var dataXAwal2: [Int] = [
        (Int(UIScreen.main.bounds.width * 0.5)),
        (Int(UIScreen.main.bounds.width * 0.4)),
        (Int(UIScreen.main.bounds.width * 0.6)),
        (Int(UIScreen.main.bounds.width * 0.45)),
        (Int(UIScreen.main.bounds.width * 0.55)),
    ]
    @State private var dataXAwal3: [Int] = [
        (Int(UIScreen.main.bounds.width * 0.83)),
        (Int(UIScreen.main.bounds.width * 0.73)),
        (Int(UIScreen.main.bounds.width * 0.93)),
        (Int(UIScreen.main.bounds.width * 0.78)),
        (Int(UIScreen.main.bounds.width * 0.88)),
    ]
    @State private var angka: Int = Int.random(in: 1...5)
    @State private var angka2: Int = Int.random(in: 1...5)
    @State private var angka3: Int = Int.random(in: 1...5)
    @State private var isiBox: [Bool] = Array(repeating: false, count: 3)
    @State private var zIndexValues: [Double] = Array(repeating: 0.0, count: 5)
    @State private var zIndexV: Double = 0.0
    @State private var win: [Int] = Array(repeating: 0, count: 3)
    @State private var showingBenar: Bool = false
    
    var body: some View {
        ZStack{
            Image("bgstartpage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
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
            
            Image("box")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 150)
                .position(CGPoint(x: widthLayar * 0.83, y: heightLayar * 0.88))
            Image("box")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 150)
                .position(CGPoint(x: widthLayar * 0.17, y: heightLayar * 0.88))
            Image("box")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 150)
                .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.88))
            
            ForEach(0..<angka, id: \.self) { index in
                Image("ayam")
                    .scaleEffect(0.7)
                    .position(CGPoint(x: dataXAwal[index], y: dataYAwal[index]))
            }
            ForEach(0..<angka2, id: \.self) { index in
                Image("ayam")
                    .scaleEffect(0.7)
                    .position(CGPoint(x: dataXAwal2[index], y: dataYAwal[index]))
            }
            ForEach(0..<angka3, id: \.self) { index in
                Image("ayam")
                    .scaleEffect(0.7)
                    .position(CGPoint(x: dataXAwal3[index], y: dataYAwal[index]))
            }
            
            Group{
                Image("box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 150)
                    .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.25))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.5, y: heightLayar * 0.23))
            }
            .offset(buahOffset[0])
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        zIndexValues[0] = 100.0
                            buahOffset[0] = CGSize(
                                width: lastBuahPosition[0].width + gesture.translation.width,
                                height: lastBuahPosition[0].height + gesture.translation.height
                            )
                    }
                    .onEnded{gesture in
                        lastBuahPosition[0] = buahOffset[0]
                        
                        let lastBuahX = Int(lastBuahPosition[0].width) + Int(widthLayar * 0.5)
                        let lastBuahY = Int(lastBuahPosition[0].height) + Int(heightLayar * 0.25)
                        
                        if lastBuahX >= Int(widthLayar * 0.78) && lastBuahX <= Int(widthLayar * 0.88) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[0] = CGSize(
                                width: widthLayar * 0.83 - widthLayar * 0.5,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                                )
                            isiBox[0] = true
                            zIndexV += 0.1
                            zIndexValues[0] = zIndexV
                            if angka3 == 1 {
                                win[2] += 1
                            }else if angka3 != 1 && win[2] == 1{
                                win[2] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.45) && lastBuahX <= Int(widthLayar * 0.55) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[0] = CGSize(
                                width: widthLayar * 0.5 - widthLayar * 0.5,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[1] = true
                            zIndexV += 0.1
                            zIndexValues[0] = zIndexV
                            if angka2 == 1 {
                                win[1] += 1
                            }else if angka2 != 1 && win[1] == 1{
                                win[1] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.12) && lastBuahX <= Int(widthLayar * 0.22) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[0] = CGSize(
                                width: widthLayar * 0.17 - widthLayar * 0.5,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[2] = true
                            zIndexV += 0.1
                            zIndexValues[0] = zIndexV
                            if angka == 1 {
                                win[0] += 1
                            }else if angka != 1 && win[0] == 1{
                                win[0] -= 1
                            }
                        }
                        
                        if win[0] == 1 && win[1] == 1 && win[2] == 1{
                            showingBenar = true
                        }
                    }
            ).zIndex(zIndexValues[0])
            Group{
                Image("box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 150)
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.25))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.725, y: heightLayar * 0.23))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.7, y: heightLayar * 0.23))
            }
            .offset(buahOffset[1])
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        zIndexValues[1] = 100.0
                        buahOffset[1] = CGSize(
                            width: lastBuahPosition[1].width + gesture.translation.width,
                            height: lastBuahPosition[1].height + gesture.translation.height
                        )
                    }
                    .onEnded{gesture in
                        lastBuahPosition[1] = buahOffset[1]
                        
                        let lastBuahX = Int(lastBuahPosition[1].width) + Int(widthLayar * 0.7)
                        let lastBuahY = Int(lastBuahPosition[1].height) + Int(heightLayar * 0.25)
                        
                        if lastBuahX >= Int(widthLayar * 0.78) && lastBuahX <= Int(widthLayar * 0.88) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[1] = CGSize(
                                width: widthLayar * 0.83 - widthLayar * 0.7,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[0] = true
                            zIndexV += 0.1
                            zIndexValues[1] = zIndexV
                            if angka3 == 2 {
                                win[2] += 1
                            }else if angka3 != 2 && win[2] == 1{
                                win[2] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.45) && lastBuahX <= Int(widthLayar * 0.55) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[1] = CGSize(
                                width: widthLayar * 0.5 - widthLayar * 0.7,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[1] = true
                            zIndexV += 0.1
                            zIndexValues[1] = zIndexV
                            if angka2 == 2 {
                                win[1] += 1
                            }else if angka2 != 2 && win[1] == 1{
                                win[1] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.12) && lastBuahX <= Int(widthLayar * 0.22) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[1] = CGSize(
                                width: widthLayar * 0.17 - widthLayar * 0.7,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[2] = true
                            zIndexV += 0.1
                            zIndexValues[1] = zIndexV
                            if angka == 2 {
                                win[0] += 1
                            }else if angka != 2 && win[0] == 1{
                                win[0] -= 1
                            }
                        }
                        
                        if win[0] == 1 && win[1] == 1 && win[2] == 1{
                            showingBenar = true
                        }

                    }
            ).zIndex(zIndexValues[1])
            Group{
                Image("box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 150)
                    .position(CGPoint(x: widthLayar * 0.3, y: heightLayar * 0.25))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.325, y: heightLayar * 0.23))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.3, y: heightLayar * 0.23))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.275, y: heightLayar * 0.23))
            }
            .offset(buahOffset[2])
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        zIndexValues[2] = 100.0
                        buahOffset[2] = CGSize(
                            width: lastBuahPosition[2].width + gesture.translation.width,
                            height: lastBuahPosition[2].height + gesture.translation.height
                        )
                    }
                    .onEnded{gesture in
                        lastBuahPosition[2] = buahOffset[2]
                        
                        let lastBuahX = Int(lastBuahPosition[2].width) + Int(widthLayar * 0.3)
                        let lastBuahY = Int(lastBuahPosition[2].height) + Int(heightLayar * 0.25)
                        
                        if lastBuahX >= Int(widthLayar * 0.78) && lastBuahX <= Int(widthLayar * 0.88) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[2] = CGSize(
                                width: widthLayar * 0.83 - widthLayar * 0.3,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[0] = true
                            zIndexV += 0.1
                            zIndexValues[2] = zIndexV
                            if angka3 == 3 {
                                win[2] += 1
                            }else if angka3 != 3 && win[2] == 1{
                                win[2] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.45) && lastBuahX <= Int(widthLayar * 0.55) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[2] = CGSize(
                                width: widthLayar * 0.5 - widthLayar * 0.3,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[1] = true
                            zIndexV += 0.1
                            zIndexValues[2] = zIndexV
                            if angka2 == 3 {
                                win[1] += 1
                            }else if angka2 != 3 && win[2] == 1{
                                win[2] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.12) && lastBuahX <= Int(widthLayar * 0.22) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[2] = CGSize(
                                width: widthLayar * 0.17 - widthLayar * 0.3,
                                height: heightLayar * 0.88 - heightLayar * 0.25
                            )
                            isiBox[2] = true
                            zIndexV += 0.1
                            zIndexValues[2] = zIndexV
                            if angka == 3 {
                                win[0] += 1
                            }else if angka != 3 && win[0] == 1{
                                win[0] -= 1
                            }
                        }
                        
                        if win[0] == 1 && win[1] == 1 && win[2] == 1{
                            showingBenar = true
                        }

                    }
            ).zIndex(zIndexValues[2])
            Group{
                Image("box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 150)
                    .position(CGPoint(x: widthLayar * 0.4, y: heightLayar * 0.4))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.450, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.425, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.4, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.375, y: heightLayar * 0.38))
            }
            .offset(buahOffset[3])
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        zIndexValues[3] = 100.0
                        buahOffset[3] = CGSize(
                            width: lastBuahPosition[3].width + gesture.translation.width,
                            height: lastBuahPosition[3].height + gesture.translation.height
                        )
                    }
                    .onEnded{gesture in
                        lastBuahPosition[3] = buahOffset[3]
                        
                        let lastBuahX = Int(lastBuahPosition[3].width) + Int(widthLayar * 0.4)
                        let lastBuahY = Int(lastBuahPosition[3].height) + Int(heightLayar * 0.4)
                        
                        if lastBuahX >= Int(widthLayar * 0.78) && lastBuahX <= Int(widthLayar * 0.88) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[3] = CGSize(
                                width: widthLayar * 0.83 - widthLayar * 0.4,
                                height: heightLayar * 0.88 - heightLayar * 0.4
                            )
                            isiBox[0] = true
                            zIndexV += 0.1
                            zIndexValues[3] = zIndexV
                            if angka3 == 4 {
                                win[2] += 1
                            }else if angka3 != 4 && win[2] == 1{
                                win[2] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.45) && lastBuahX <= Int(widthLayar * 0.55) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[3] = CGSize(
                                width: widthLayar * 0.5 - widthLayar * 0.4,
                                height: heightLayar * 0.88 - heightLayar * 0.4
                            )
                            isiBox[1] = true
                            zIndexV += 0.1
                            zIndexValues[3] = zIndexV
                            if angka2 == 4 {
                                win[1] += 1
                            }else if angka2 != 4 && win[1] == 1{
                                win[1] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.12) && lastBuahX <= Int(widthLayar * 0.22) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[3] = CGSize(
                                width: widthLayar * 0.17 - widthLayar * 0.4,
                                height: heightLayar * 0.88 - heightLayar * 0.4
                            )
                            isiBox[2] = true
                            zIndexV += 0.1
                            zIndexValues[3] = zIndexV
                            if angka == 4 {
                                win[0] += 1
                            }else if angka != 4 && win[0] == 1{
                                win[0] -= 1
                            }
                        }

                        if win[0] == 1 && win[1] == 1 && win[2] == 1{
                            showingBenar = true
                        }

                    }
            ).zIndex(zIndexValues[3])
            Group{
                Image("box")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 150)
                    .position(CGPoint(x: widthLayar * 0.6, y: heightLayar * 0.4))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.650, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.625, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.6, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.575, y: heightLayar * 0.38))
                Image("apple")
                    .position(CGPoint(x: widthLayar * 0.550, y: heightLayar * 0.38))
            }
            .offset(buahOffset[4])
            .gesture(
                DragGesture()
                    .onChanged{ gesture in
                        zIndexValues[4] = 100.0
                        buahOffset[4] = CGSize(
                            width: lastBuahPosition[4].width + gesture.translation.width,
                            height: lastBuahPosition[4].height + gesture.translation.height
                        )
                    }
                    .onEnded{gesture in
                        lastBuahPosition[4] = buahOffset[4]
                        
                        let lastBuahX = Int(lastBuahPosition[4].width) + Int(widthLayar * 0.6)
                        let lastBuahY = Int(lastBuahPosition[4].height) + Int(heightLayar * 0.4)
                        
                        if lastBuahX >= Int(widthLayar * 0.78) && lastBuahX <= Int(widthLayar * 0.88) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[4] = CGSize(
                                width: widthLayar * 0.83 - widthLayar * 0.6,
                                height: heightLayar * 0.88 - heightLayar * 0.4
                            )
                            isiBox[0] = true
                            zIndexV += 0.1
                            zIndexValues[4] = zIndexV
                            if angka3 == 5 {
                                win[2] += 1
                            }else if angka3 != 5 && win[2] == 1{
                                win[2] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.45) && lastBuahX <= Int(widthLayar * 0.55) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[4] = CGSize(
                                width: widthLayar * 0.5 - widthLayar * 0.6,
                                height: heightLayar * 0.88 - heightLayar * 0.4
                            )
                            isiBox[1] = true
                            zIndexV += 0.1
                            zIndexValues[4] = zIndexV
                            if angka2 == 5 {
                                win[1] += 1
                            }else if angka2 != 5 && win[1] == 1{
                                win[1] -= 1
                            }
                        } else if lastBuahX >= Int(widthLayar * 0.12) && lastBuahX <= Int(widthLayar * 0.22) && lastBuahY >= Int(heightLayar * 0.83) && lastBuahY <= Int(heightLayar * 0.93){
                            buahOffset[4] = CGSize(
                                width: widthLayar * 0.17 - widthLayar * 0.6,
                                height: heightLayar * 0.88 - heightLayar * 0.4
                            )
                            isiBox[2] = true
                            zIndexV += 0.1
                            zIndexValues[4] = zIndexV
                            if angka == 5 {
                                win[0] += 1
                            } else if angka != 5 && win[0] == 1{
                                win[0] -= 1
                            }
                        }
                        
                        if win[0] == 1 && win[1] == 1 && win[2] == 1{
                            showingBenar = true
                        }


                    }
            ).zIndex(zIndexValues[4])

            
            if showingBenar {
                ZStack{
                    Image("board")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
                    
                    Button {
                        //                    isPeternakanHitungActive = true
                        displayMode = .buah
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
                }.zIndex(101.0)
            }
        }.onAppear{
            while angka2 == angka {
                angka2 = Int.random(in: 1...5)
            }
            while angka3 == angka || angka3 == angka2{
                angka3 = Int.random(in: 1...5)
            }
        }
    }
}

struct Kelinci_Previews: PreviewProvider {
    @State static var displayMode: DisplayMode = .kelinci

    static var previews: some View {
        KelinciCocok(displayMode: $displayMode)
    }
}
