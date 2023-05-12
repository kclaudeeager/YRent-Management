//
//  DialogBoxLoading.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/10/23.
//

import Foundation
import SwiftUI

struct DialogBoxLoading: View {
    let cornerRadius: CGFloat
    let paddingStart: CGFloat
    let paddingEnd: CGFloat
    let paddingTop: CGFloat
    let paddingBottom: CGFloat
    let progressIndicatorColor: Color
    let progressIndicatorSize: CGFloat
    
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                ProgressIndicatorLoading(progressIndicatorSize: progressIndicatorSize, progressIndicatorColor: progressIndicatorColor)
                
                Spacer(minLength: 32)
                
                Text("Please wait...")
                    .font(.system(size: 16))
                    .foregroundColor(Color.black)
                    .padding(.bottom, paddingBottom)
            }
            .padding(.horizontal, paddingStart)
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                    .shadow(radius: 4)
            )
        }
    }
}

struct ProgressIndicatorLoading: View {
    let progressIndicatorSize: CGFloat
    let progressIndicatorColor: Color

    @State private var angle: Double = 0

    var body: some View {
        let gradient = RadialGradient(
            gradient: Gradient(
                colors: [
                    progressIndicatorColor.opacity(0.1),
                    progressIndicatorColor,
                    progressIndicatorColor.opacity(0.1)
                ]
            ),
            center: .center,
            startRadius: progressIndicatorSize * 0.2,
            endRadius: progressIndicatorSize * 0.9
        )

        let strokeStyle = StrokeStyle(
            lineWidth: progressIndicatorSize * 0.08,
            lineCap: .round,
            dash: [0.01, progressIndicatorSize * 0.08]
        )

        return Circle()
            .fill(gradient)
            .frame(width: progressIndicatorSize, height: progressIndicatorSize)
            .rotationEffect(.degrees(angle))
            .onAppear {
                withAnimation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false)) {
                    self.angle = 360
                }
            }
            .overlay(
                Circle()
                    .stroke(gradient, style: strokeStyle)
                    .frame(width: progressIndicatorSize * 0.8, height: progressIndicatorSize * 0.8)
            )
    }
}

struct ProgressAnimation: View {
    @State private var drawingWidth = false
 
    var body: some View {
        VStack(alignment: .leading) {
            Text("LOading...")
                .bold()
 
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(.systemGray6))
                RoundedRectangle(cornerRadius: 3)
                    .fill(.indigo.gradient)
                    .frame(width: drawingWidth ? 250 : 0, alignment: .leading)
                    .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false), value: drawingWidth)
            }
            .frame(width: 250, height: 12)
            .onAppear {
                drawingWidth.toggle()
            }
        }
    }
}

struct ProgressAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ProgressAnimation()
//        DialogBoxLoading(
//            cornerRadius: 16,
//            paddingStart: 16,
//            paddingEnd: 16,
//            paddingTop: 16,
//            paddingBottom: 16,
//            progressIndicatorColor: .red,
//            progressIndicatorSize: 64
//        )
    }
}
