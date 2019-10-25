//
//  Badge.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/28/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import SwiftUI

struct HexagonParameters {
    struct Segment {
        let useWidth: (CGFloat, CGFloat, CGFloat)
        let xFactors: (CGFloat, CGFloat, CGFloat)
        let useHeight:(CGFloat, CGFloat, CGFloat)
        let yFactors: (CGFloat, CGFloat, CGFloat)
    }
    static let adjustment: CGFloat = 0.085
    
    static let points = [
        Segment(
            useWidth: (1.00, 1.00, 1.00), xFactors: (0.60, 0.40, 0.50), useHeight: (1.00, 1.00, 0.00 ), yFactors: (0.05, 0.05, 0.00)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 0.00),
            xFactors:  (0.05, 0.00, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.20 + adjustment, 0.30 + adjustment, 0.25 + adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 0.00),
            xFactors:  (0.00, 0.05, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.70 - adjustment, 0.80 - adjustment, 0.75 - adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.40, 0.60, 0.50),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.95, 0.95, 1.00)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.95, 1.00, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.80 - adjustment, 0.70 - adjustment, 0.75 - adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (1.00, 0.95, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.30 + adjustment, 0.20 + adjustment, 0.25 + adjustment)
        )
    ]
}

struct Badge: View {
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
                       
        }.opacity(0.5)
       
    }
    var body: some View {
        
        ZStack {
                BadgeBackground()
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
    .scaledToFit()
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
