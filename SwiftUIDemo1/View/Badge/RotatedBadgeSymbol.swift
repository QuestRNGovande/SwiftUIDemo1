//
//  RotatedBadgeSymbol.swift
//  SwiftUIDemo1
//
//  Created by Ratnadeep Govande on 8/29/19.
//  Copyright © 2019 Ratnadeep Govande. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle : Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
