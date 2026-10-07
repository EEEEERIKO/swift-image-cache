//
//  ImageDownloadService.swift
//  Task2SwiftImageCache
//
//  Created by Erik Valencia Cardona on 6/10/26.
//

import Foundation

struct ImageDownloadService {
    
    func downloadImage(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}
