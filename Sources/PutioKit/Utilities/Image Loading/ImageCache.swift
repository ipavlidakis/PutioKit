//
//  ImageCache.swift
//  PutioKit
//
//  Created by Ilias Pavlidakis on 03/04/2020.
//

import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

final class ImageCache: ImageCacheType {

    struct Config {
        let countLimit: Int
        let memoryLimit: Int

        static let defaultConfig = Config(
            countLimit: 100,
            memoryLimit: 1024 * 1024 * 100) // 100 MB
    }

    #if os(macOS)
    typealias Image = NSImage
    #else
    typealias Image = UIImage
    #endif

    // 1st level cache, that contains encoded images
    private lazy var imageCache = NSCache<AnyObject, AnyObject>(countLimit: config.countLimit)
    // 2nd level cache, that contains decoded images
    private lazy var decodedImageCache = NSCache<AnyObject, AnyObject>(countLimit: config.memoryLimit)

    private let lock = NSLock()
    private let config: Config

    init(config: Config = Config.defaultConfig) { self.config = config }

    func image(for url: URL) -> Image? {
        lock.lock(); defer { lock.unlock() }
        // the best case scenario -> there is a decoded image in memory
        if let decodedImage = decodedImageCache.object(forKey: url as AnyObject) as? Image {
            return decodedImage
        }
        // search for image data
        if let image = imageCache.object(forKey: url as AnyObject) as? Image {
            let decodedImage = image.decodedImage()
            decodedImageCache.setObject(image as AnyObject, forKey: url as AnyObject, cost: decodedImage.diskSize)
            return decodedImage
        }
        return nil
    }

    func insertImage(_ image: Image?, for url: URL) {
        guard let image = image else { return removeImage(for: url) }
        let decompressedImage = image.decodedImage()

        lock.lock(); defer { lock.unlock() }
        imageCache.setObject(decompressedImage, forKey: url as AnyObject, cost: 1)
        decodedImageCache.setObject(image as AnyObject, forKey: url as AnyObject, cost: decompressedImage.diskSize)
    }

    func removeImage(for url: URL) {
        lock.lock(); defer { lock.unlock() }
        imageCache.removeObject(forKey: url as AnyObject)
        decodedImageCache.removeObject(forKey: url as AnyObject)
    }

    func removeAllImages() {
        lock.lock(); defer { lock.unlock() }
        imageCache.removeAllObjects()
        decodedImageCache.removeAllObjects()
    }

    subscript(_ key: URL) -> Image? {
        get { image(for: key) }
        set { insertImage(newValue, for: key) }
    }
}
