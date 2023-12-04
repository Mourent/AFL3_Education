//
//  BuahHitung.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 27/11/23.
//

import SwiftUI


struct BuahHitung: View {
    @State private var lastBuahPosition: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var buahOffset: [CGSize] = Array(repeating: .zero, count: 7)
    @State private var heightLayar = UIScreen.main.bounds.height
    @State private var widthLayar = UIScreen.main.bounds.width
    @State private var dataXAwal: [Int] = [
        (Int(UIScreen.main.bounds.width * 0.377)),
        (Int(UIScreen.main.bounds.width * 0.544)),
        (Int(UIScreen.main.bounds.width * 0.461)),
        (Int(UIScreen.main.bounds.width * 0.586)),
        (Int(UIScreen.main.bounds.width * 0.637)),
        (Int(UIScreen.main.bounds.width * 0.494)),
        (Int(UIScreen.main.bounds.width * 0.394))
    ]
    @State private var dataYAwal: [Int] = [
        (Int(UIScreen.main.bounds.height * 0.360)),
        (Int(UIScreen.main.bounds.height * 0.240)),
        (Int(UIScreen.main.bounds.height * 0.300)),
        (Int(UIScreen.main.bounds.height * 0.372)),
        (Int(UIScreen.main.bounds.height * 0.480)),
        (Int(UIScreen.main.bounds.height * 0.444)),
        (Int(UIScreen.main.bounds.height * 0.540))
    ]
    @State private var angka: Int = Int.random(in: 1...7)
    @State private var buahJatuh: [Bool] = Array(repeating: false, count: 7)
    @State private var applesInBasket: Int = 0
    @State private var showingBenar: Bool = false
    @State private var showingSalah: Bool = false
    @State private var isPeternakanHitungActive = false
   
    @Binding var displayMode: DisplayMode
    
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
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
                .position(CGPoint(x: widthLayar * 0.711, y: heightLayar * 0.815))
            
            Image("board")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.13)
                .position(CGPoint(x: widthLayar * 0.705, y: heightLayar * 0.65))
            
            Text("\(applesInBasket)")
                .font(.system(size: 55, weight: .bold))
                .foregroundColor(.red)
                .position(CGPoint(x: widthLayar * 0.707, y: heightLayar * 0.659))
                .border(Color.black)
    
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
            Button("SUBMIT") {
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
    
            ForEach(0..<7) { index in
                Image("apple")
                    .position(CGPoint(x: dataXAwal[index], y: dataYAwal[index]))
                    .offset(buahOffset[index])
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
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
                                    lastBuahPosition[index].height = (heightLayar * 0.92 - CGFloat(dataYAwal[index]))
                                }
                            }
                            .onEnded { gesture in
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
                                
                                if (lastBuahX >= Int(widthLayar * 0.670) && lastBuahX <= Int(widthLayar * 0.754) && lastBuahY <= Int(heightLayar * 0.870)) {
                                    withAnimation(.easeInOut(duration: 1.5)) {
                                        buahOffset[index] = CGSize(
                                            width: widthLayar*0.71 - CGFloat(dataXAwal[index]),
                                            height: (heightLayar * 0.835 - CGFloat(dataYAwal[index]))
                                        )
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        applesInBasket += 1
                                        print(applesInBasket)
                                    }
                                }
                            }
                    )
            }
            
            Image("basketdepan")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 159)
                .position(CGPoint(x: widthLayar * 0.712, y: heightLayar * 0.815))
            
            if showingBenar {
                ZStack{
                    Image("board")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.5)
    
                Button {
//                    isPeternakanHitungActive = true
                    displayMode = .PeternakanHitung
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
//        if isPeternakanHitungActive {
//            buah()
//            BuahHitung().hidden()
//        }
    }
    func reset(){
        angka = Int.random(in: 1...7)
        buahOffset = Array(repeating: .zero, count: 7)
        lastBuahPosition = Array(repeating: .zero, count: 7)
        applesInBasket = 0
        buahJatuh = Array(repeating: false, count: 7)
    }
}

//#Preview {
//  
//     
//    BuahHitung(displayMode: $displayMode)
//}

struct BuahHitung_Previews: PreviewProvider {
    @State static var displayMode: DisplayMode = .BuahHitung

    static var previews: some View {
        BuahHitung(displayMode: $displayMode)
    }
}
