//
//  SliderView.swift
//  SwiftUIEx
//
//  Created by KeenKim on 2022/09/21.
//

import SwiftUI

struct SliderView: View {
    @State var offset: CGFloat = 0 // silder offset
    @State var percentage: CGFloat = 0
    @State var isColored: [Bool] = Array.init(repeating: false, count: 5)
    
    let diameter: CGFloat = 30
    let radius: CGFloat = 15
    let padding: CGFloat = 16
    
    var body: some View {
        VStack {
            Text("Percentage: \(Int(round(percentage))) % (\(percentage))")
                .foregroundColor(.orange)
                .bold()
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Capsule()
                    .fill(.gray)
                    .frame(height: diameter / 3)
                
                Capsule()
                    .fill(.green)
                    .frame(width: offset + radius, height: diameter / 3)
                
                HStack {
                    ForEach(0..<isColored.count, id: \.self) {
                        if $0 != 0 {
                            Spacer()
                        }
                        
                        if isColored[$0] {
                            Circle()
                                .fill(.green)
                                .frame(width: diameter)
                        } else {
                            Circle()
                                .fill(.gray)
                                .frame(width: diameter)
                        }
                    }
                }
                
                Circle()
                    .fill(.green)
                    .frame(width: diameter)
                    .background(Circle().stroke(.white, lineWidth: diameter / 3))
                    .offset(x: offset)
                    .gesture(DragGesture().onChanged { value in
                        let screenWidth = UIScreen.main.bounds.width
                        let min = padding
                        let totalPadding = (padding * 2) + radius
                        let max = screenWidth - totalPadding
                        
                        if value.location.x > min && value.location.x <= max {
                            let newOffset = value.location.x - radius
                            offset = round(newOffset)
                            percentage = offset / (screenWidth - totalPadding - radius) * 100
                            
                            switch percentage {
                            case 0..<25:
                                isColored = [true, false, false, false, false]
                            case 25..<50:
                                isColored = [true, true, false, false, false]
                            case 50..<75:
                                isColored = [true, true, true, false, false]
                            case 75...100:
                                isColored = [true, true, true, true, false]
                            default:
                                break
                            }
                        } else if offset < 0 {
                            offset = 0
                        }
                    })
            }
            .padding(padding)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
