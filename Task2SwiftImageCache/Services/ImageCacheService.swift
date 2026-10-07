//
//  ImageCacheService.swift
//  Task2SwiftImageCache
//
//  Created by Erik Valencia Cardona on 6/10/26.
//
import Foundation

struct ImageCacheService {
    private let fileManager = FileManager.default
    
    private var temporaryDirectory: URL {
        fileManager.temporaryDirectory
    }
    
    func saveImage(_ data: Data, withName name: String) throws {
        let fileURL = temporaryDirectory.appendingPathComponent(name)
        
        try data.write(to: fileURL)
    }
    
    func loadImage(withName name: String) throws -> Data {
        let fileURL = temporaryDirectory.appendingPathComponent(name)
        
        return try Data(contentsOf: fileURL)
    
    }
    
    
    func imageExist(withName name: String) -> Bool {
        let fileURL = temporaryDirectory.appendingPathComponent(name)
        
        return fileManager.fileExists(atPath: fileURL.path)
    }
    
    func clearCache() throws {
        
        let files = try  fileManager.contentsOfDirectory(
            at: temporaryDirectory,
            includingPropertiesForKeys: nil
        )
        
        for file in files {
            try fileManager.removeItem(at: file)
        }
    }
}
