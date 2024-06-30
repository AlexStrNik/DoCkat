//
//  CatView.swift
//  DoCkat
//
//  Created by Aleksandr Strizhnev on 30.06.2024.
//

import SwiftUI

struct EyeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99416*width, y: 0.18076*height))
        path.addLine(to: CGPoint(x: 0.99485*width, y: 0.17143*height))
        path.addCurve(to: CGPoint(x: 0.32732*width, y: 0.09714*height), control1: CGPoint(x: 0.69716*width, y: -0.04329*height), control2: CGPoint(x: 0.51031*width, y: -0.03429*height))
        path.addCurve(to: CGPoint(x: 0.00515*width, y: 0.72571*height), control1: CGPoint(x: 0.14433*width, y: 0.22857*height), control2: CGPoint(x: 0.03608*width, y: 0.42857*height))
        path.addCurve(to: CGPoint(x: 0.83763*width, y: 0.83429*height), control1: CGPoint(x: 0.31186*width, y: 1.13714*height), control2: CGPoint(x: 0.71649*width, y: 0.99143*height))
        path.addCurve(to: CGPoint(x: 0.99416*width, y: 0.18076*height), control1: CGPoint(x: 0.95751*width, y: 0.67877*height), control2: CGPoint(x: 0.97236*width, y: 0.47693*height))
        path.closeSubpath()
        return path
    }
}

struct FaceShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.93056*width, y: 0.00984*height))
        path.addCurve(to: CGPoint(x: 0.60568*width, y: 0.20664*height), control1: CGPoint(x: 0.84783*width, y: -0.04979*height), control2: CGPoint(x: 0.60568*width, y: 0.20664*height))
        path.addCurve(to: CGPoint(x: 0.39493*width, y: 0.20664*height), control1: CGPoint(x: 0.52338*width, y: 0.18694*height), control2: CGPoint(x: 0.47723*width, y: 0.18526*height))
        path.addCurve(to: CGPoint(x: 0.07005*width, y: 0.00984*height), control1: CGPoint(x: 0.39493*width, y: 0.20664*height), control2: CGPoint(x: 0.15278*width, y: -0.04979*height))
        path.addCurve(to: CGPoint(x: 0.09903*width, y: 0.41697*height), control1: CGPoint(x: -0.01268*width, y: 0.06947*height), control2: CGPoint(x: 0.09903*width, y: 0.41697*height))
        path.addCurve(to: CGPoint(x: 0.39493*width, y: 0.99631*height), control1: CGPoint(x: -0.05556*width, y: 0.61808*height), control2: CGPoint(x: -0.07186*width, y: 0.91451*height))
        path.addCurve(to: CGPoint(x: 0.60568*width, y: 0.99631*height), control1: CGPoint(x: 0.47724*width, y: 1.00012*height), control2: CGPoint(x: 0.52336*width, y: 1.00008*height))
        path.addCurve(to: CGPoint(x: 0.90157*width, y: 0.41697*height), control1: CGPoint(x: 1.07246*width, y: 0.91451*height), control2: CGPoint(x: 1.05616*width, y: 0.61808*height))
        path.addCurve(to: CGPoint(x: 0.93056*width, y: 0.00984*height), control1: CGPoint(x: 0.90157*width, y: 0.41697*height), control2: CGPoint(x: 1.01329*width, y: 0.06947*height))
        path.closeSubpath()
        return path
    }
}

struct NoseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.97727*width, y: 0.19355*height))
        path.addCurve(to: CGPoint(x: 0.55682*width, y: 0.95162*height), control1: CGPoint(x: 0.84584*width, y: 0.61348*height), control2: CGPoint(x: 0.7507*width, y: 0.7678*height))
        path.addCurve(to: CGPoint(x: 0.03409*width, y: 0.25807*height), control1: CGPoint(x: 0.28487*width, y: 0.74652*height), control2: CGPoint(x: 0.17792*width, y: 0.58739*height))
        path.addCurve(to: CGPoint(x: 0.97727*width, y: 0.19355*height), control1: CGPoint(x: 0.38161*width, y: -0.02941*height), control2: CGPoint(x: 0.58857*width, y: -0.03599*height))
        path.closeSubpath()
        return path
    }
}

struct EarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.93805*width, y: 0.01471*height))
        path.addCurve(to: CGPoint(x: 0.79646*width, y: 0.99632*height), control1: CGPoint(x: 1.0708*width, y: 0.10294*height), control2: CGPoint(x: 0.9469*width, y: 1.02757*height))
        path.addCurve(to: CGPoint(x: 0.39823*width, y: 0.7114*height), control1: CGPoint(x: 0.64602*width, y: 0.96507*height), control2: CGPoint(x: 0.54867*width, y: 0.80331*height))
        path.addCurve(to: CGPoint(x: 0.01327*width, y: 0.50551*height), control1: CGPoint(x: 0.24779*width, y: 0.61949*height), control2: CGPoint(x: 0.11947*width, y: 0.5864*height))
        path.addCurve(to: CGPoint(x: 0.93805*width, y: 0.01471*height), control1: CGPoint(x: -0.09292*width, y: 0.42463*height), control2: CGPoint(x: 0.80531*width, y: -0.07353*height))
        path.closeSubpath()
        return path
    }
}

struct CatEye: View {
    var eyeVector: CGPoint
    var blinkState: CGFloat
    
    var left: Bool = false
    
    @AppStorage(
        "eyeColor", store: UserDefaults(suiteName: "xyz.alexstrnik.DoCkat")
    ) private var eyeColor: Color = .yellow
    
    private func blinkAtTime(t: Double) -> Double {
        return pow(min(abs((t.truncatingRemainder(dividingBy: 16)) - 8), 1), 4)
    }
    
    var body: some View {
        EyeShape()
            .fill(eyeColor)
            .scaleEffect(x: left ? -1 : 1)
            .frame(
                width: 35,
                height: 30
            )
            .overlay {
                ZStack {
                    Ellipse()
                        .fill(.black)
                        .frame(
                            width: 20,
                            height: 25
                        )
                    Circle()
                        .fill(.white)
                        .frame(
                            width: 7,
                            height: 7
                        )
                        .offset(
                            x: 5,
                            y: -5
                        )
                }
                .compositingGroup()
                .offset(
                    x: eyeVector.x,
                    y: eyeVector.y
                )
            }
            .scaleEffect(
                CGSize(
                    width: 1,
                    height: blinkAtTime(t: blinkState)
                )
            )
            .cornerRadius(10)
    }
}

struct CatView: View {
    var eyeVector: CGPoint = .zero
    var blinkState: CGFloat = 0

    @AppStorage(
        "catColor", store: UserDefaults(suiteName: "xyz.alexstrnik.DoCkat")
    ) private var catColor: Color = Color(red: 0.455, green: 0.455, blue: 0.455)
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                FaceShape()
                    .fill(
                        catColor
                    )
                
                HStack {
                    EarShape()
                        .fill(
                            Color(red: 0.89, green: 0.639, blue: 0.635)
                        )
                        .scaleEffect(x: -1)
                        .frame(
                            width: 30,
                            height: 36
                        )
                    
                    Spacer()
                    
                    EarShape()
                        .fill(
                            Color(red: 0.89, green: 0.639, blue: 0.635)
                        )
                        .frame(
                            width: 30,
                            height: 36
                        )
                }
                .frame(
                    maxHeight: .infinity,
                    alignment: .top
                )
                .padding(
                    .horizontal, 12
                )
                .padding(
                    .top, 8
                )
                
                VStack(spacing: 0) {
                    Spacer()
                        .frame(
                            height: 30
                        )
                    
                    HStack(spacing: 10) {
                        CatEye(
                            eyeVector: eyeVector,
                            blinkState: blinkState,
                            left: true
                        )

                        CatEye(
                            eyeVector: eyeVector,
                            blinkState: blinkState
                        )
                    }
                    
                    NoseShape()
                        .fill(.white)
                        .frame(
                            width: 12,
                            height: 6
                        )
                }
            }
            .padding(
                .bottom, 3 / 16 / 2 * proxy.size.height
            )
        }
    }
}
