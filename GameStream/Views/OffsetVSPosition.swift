//
//  OffsetVSPosition.swift
//  GameStream
//
//  Created by Fernando Florez on 26/08/21.
//

import SwiftUI

struct OffsetVSPosition: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                //Offsets()
                //Positions()
                Image("profilePlaceholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: geometry.size.width / 2,
                        height: geometry.size.height / 3
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Offsets: View {
    var body: some View {
        VStack {
            Image("profilePlaceholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .offset(x: 10, y: 30)
            
            Text("Test Text")
                .bold()
                .foregroundColor(.red)
        }
    }
}

struct Positions: View {
    var body: some View {
        VStack {
            Image("profilePlaceholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .position(x: 100, y: 50)
        }
    }
}

struct OffsetVSPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetVSPosition()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
