//
//  NoDataView.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 13/08/21.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("No Data")
                    .font(Font.custom("Mulish-Regular", size: 25))
                    .foregroundColor(.white)
            }
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
