//
//  RemoteImage.swift
//  ElektraGo-
//
//  Created by Brayan Gutierrez Juarez on 04/09/25.
//

import SwiftUI

struct RemoteImage: View {
    let url: String
    let height: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(height: height)
                 .clipped()
        } placeholder: {
            Rectangle().fill(Color.gray.opacity(0.2)).frame(height: height)
        }
    }
}
