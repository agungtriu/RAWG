//
//  LoadingIndicator.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 12/08/21.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var degress = 0.0
    let color: Color
    let size: CGFloat
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(color, lineWidth: 5.0)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: degress))
            .onAppear { self.start()}
    }
    func start() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(color: Color.green, size: 80)
    }
}
