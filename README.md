# Swift Image Cache

A SwiftUI iOS application that demonstrates how to download images from a remote source, cache them in the app's temporary directory, retrieve cached images, and clear the cache using `FileManager`.

## 📱 Overview

This project implements a simple image caching system that:

- Downloads images from a remote URL.
- Stores downloaded images in the application's temporary directory.
- Loads images from the cache when they are already available.
- Allows the user to manually clear the image cache.
- Demonstrates temporary file management using `FileManager`.

The project demonstrates fundamental concepts of networking, local file storage, caching, and asynchronous programming in iOS.

## 🛠️ Technologies

- Swift
- SwiftUI
- Foundation
- UIKit
- URLSession
- FileManager
- async/await
- iOS App Sandbox

## 🏗️ Project Structure

```text
SwiftImageCache/
│
├── SwiftImageCacheApp.swift
├── ContentView.swift
│
└── Services/
    ├── ImageDownloadService.swift
    └── ImageCacheService.swift
```

### `ContentView.swift`

Handles the SwiftUI interface and coordinates image downloading, caching, retrieval, and cache clearing.

### `ImageDownloadService.swift`

Responsible for downloading image data from remote URLs using `URLSession` and Swift's `async/await` concurrency model.

### `ImageCacheService.swift`

Responsible for managing cached image files using `FileManager` and the application's temporary directory.

It provides functionality to:

- Save image data.
- Load cached images.
- Check whether an image exists in the cache.
- Clear cached files.

## 📂 Cache Storage

Downloaded images are stored in the application's temporary directory:

```text
tmp/
└── landscape.jpg
```

The temporary directory is accessed through:

```swift
FileManager.default.temporaryDirectory
```

Temporary files are appropriate for cached data because they are not intended to be permanent application data and may be removed by the system when necessary.

## 🔄 Application Flow

### First Download

```text
User
  ↓
Download Image
  ↓
Check Cache
  ↓
Image not found
  ↓
URLSession
  ↓
Remote Image
  ↓
Data
  ↓
FileManager
  ↓
Temporary Directory
  ↓
Display Image
```

### Subsequent Download

```text
User
  ↓
Download Image
  ↓
Check Cache
  ↓
Image found
  ↓
Load Data from Temporary Directory
  ↓
UIImage
  ↓
Display Image
```

This prevents unnecessary network requests when the image is already cached.

## 🧹 Clear Cache

The application provides a **Clear Cache** button that removes cached files from the temporary directory using `FileManager`.

```swift
try cacheService.clearCache()
```

The system may also remove temporary files when storage resources are needed, so the application should not rely on temporary files being available indefinitely.

## 🎯 Learning Objectives

This project was created to practice:

- Downloading remote resources with `URLSession`.
- Using Swift's `async/await` concurrency.
- Working with `Data`.
- Understanding image caching.
- Using `FileManager` to manage files.
- Working with the iOS temporary directory.
- Checking whether cached files exist.
- Reading and writing binary data.
- Deleting cached files.
- Understanding temporary storage and the iOS App Sandbox.

## 📄 Exercise Requirements

This project implements the following requirements:

- Download images from a remote source.
- Cache downloaded images in the application's temporary directory.
- Retrieve images from the cache when available.
- Allow the user to manually clear the cache.
- Use `FileManager` for cache management.
- Use temporary storage for non-persistent image data.

## 👨‍💻 Author

Erik Valencia Cardona
