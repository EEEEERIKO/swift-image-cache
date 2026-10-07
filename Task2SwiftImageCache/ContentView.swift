//
//  ContentView.swift
//  Task2SwiftImageCache
//
//  Created by Erik Valencia Cardona on 6/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var message = ""
    @State var image: UIImage?
    
    private let downloadService = ImageDownloadService()
    private let cacheService = ImageCacheService()
    
    private let imageURL = URL(
        string: "https://images.unsplash.com/photo-1506744038136-46273834b3fb"
    )!
    
    private let cacheFileName = "landscape.jpg"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Image Cache").font(.title)
            
            Group{
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                } else{
                    ContentUnavailableView(
                        "No Image",
                        systemImage: "photo"
                    )
                }
                
                Button("Download Image"){
                    Task {
                        await downloadImage()
                    }
                }
                
                Button("Clear Cache") {
                    clearCache()
                }
                
                Text(message).font(.caption)
            }
        }
        .padding()
    }
    
    private func downloadImage() async {
        do {
            if cacheService.imageExist(withName: cacheFileName) {
                let data = try cacheService.loadImage(
                    withName: cacheFileName
                )
                
                if let downloadedImage = UIImage(data: data) {
                    image = downloadedImage
                    message = "Loaded from cache"
                }
                
                return
            }
            
            let data = try await downloadService.downloadImage(
                from: imageURL
            )
            
            try cacheService.saveImage(
                data,
                withName: cacheFileName
            )
            
            if let downloadedImage = UIImage(data: data){
                image = downloadedImage
                message = "Downloaded and cached"
            }
            
            
        } catch {
            message = "Error: \(error.localizedDescription)"
        }
        
    }
    
    func clearCache(){
        do {
            try cacheService.clearCache()
            image = nil
            message = "Cache cleared"
        } catch {
            message = "Error clearing cache: \(error.localizedDescription)"
        }
        
    }
}

#Preview {
    ContentView()
}
