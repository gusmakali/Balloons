//
//  WebImage.swift
//  balloons.new
//
//  Created by Liliia Makashova on 2022-04-04.
//

import SwiftUI
import Combine

struct WebImage: View {
    
    @ObservedObject private var downloadImage: DownloadImage
    
    init(url: String) {
        self.downloadImage = DownloadImage(from: "https://balloons.thetc.se\(url)")
    }
    
    var image: UIImage? {
        downloadImage.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        Image(uiImage: image ?? UIImage(imageLiteralResourceName: "ImagePlaceholder"))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

class DownloadImage: ObservableObject {
    
    @Published var data: Data? = nil
    
    init(from imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
