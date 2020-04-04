//
//  ImagePersistence.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 04/04/2020.
//

import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

final class ImagePersistence {

    private var existingFiles: Set<AnyHashable> = Set()
    private let fileManager: FileManager
    private let operationQueue = OperationQueue(maxConcurrentOperationCount: 1)
    private lazy var cachesDirectoryURL: URL = try! self.fileManager.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

    init?(
        fileManager: FileManager = .default,
        imagesFolderName: String = "images") {

        guard let cachesDirectory = try? fileManager.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else {
            return nil
        }

        let cachesDirectoryURL = cachesDirectory.appendingPathComponent(imagesFolderName)

        if !fileManager.fileExists(atPath: cachesDirectoryURL.absoluteString) {
            if (try? fileManager.createDirectory(at: cachesDirectory, withIntermediateDirectories: true, attributes: nil)) == nil {
                return nil
            }
        }

        self.fileManager = fileManager
        self.cachesDirectoryURL = cachesDirectoryURL

        debugPrint("Image Cache Directory: \(cachesDirectoryURL)")

        loadContentsInCache()
    }

    private func loadContentsInCache() {

        do {
            let files = try fileManager.contentsOfDirectory(at: cachesDirectoryURL, includingPropertiesForKeys: nil).map {
                $0.lastPathComponent
            }
            existingFiles = Set(arrayLiteral: files)
        } catch {
            print("Error while enumerating image caches: \(error.localizedDescription)")
        }
    }
}

extension ImagePersistence {

    func persist(image: ImageCacheType.Image, key: AnyHashable) {

        let url = cachesDirectoryURL.appendingPathComponent(key.description)
        operationQueue.addOperation { [weak self] in

            guard let data = image.encodedImage() else { return }

            do {
                try data.write(to: url)
                self?.existingFiles.insert(key)
            }
            catch(let exception) { print("ERROR: Failed to write iamge data to path: \(key), exception: \(exception)") }
        }
    }

    func imageForKeyExists(key: AnyHashable) -> Bool {
        existingFiles.contains(key)
    }

    func fetchImage(for key: AnyHashable) -> ImageCacheType.Image? {
        guard imageForKeyExists(key: key) else {
            print("ERROR: file for key: \(key) doesn't exist in diskCache")
            return nil
        }

        let url = cachesDirectoryURL.appendingPathComponent(key.description)
        guard let data = try? Data(contentsOf: url) else {
            print("ERROR: cache miss for key: \(key)")
            return nil
        }

        return .from(data: data)
    }
}
