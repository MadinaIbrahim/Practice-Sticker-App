//
//  StickerBrowserViewController.swift
//  Sticker-App
//
//  Created by Tamar Nachmany on 10/23/16.
//  Copyright © 2016 Girl Develop It. All rights reserved.
//

import UIKit
import Messages

class StickerBrowserViewController: MSStickerBrowserViewController {

    // An Array of MSStickers to show in the Sticker Browser.
    var stickers = [MSSticker]()
    
    // An Array of Strings corresponding to the name each images is saved by in the Assets.xcassets directory.
    let imageNames = ["image1", "image2", "image3"]

    // The root class of the app extension.
    let principalClass: MSMessagesAppViewController
    
    /**
     Initializes an instance of StickerBrowserViewController. StickerBrowserViewController is a subclass of MSStickerBrowserViewController. It is therefore required to conform to the MSStickerBrowserViewDataSource protocol, and may optionally override MSStickerBrowserViewController's public functions.
     
     - parameter stickerSize: The Sticker size is used to control the display size of the stickers in the Sticker Browser View.
     - parameter bundle:      The bundle where sticker assets are located. We access assets (like images and fonts) via the app bundle. 
     - parameter imageNames:  The full list of names sticker images are stored as. Each local image is saved with a specific name. We pull the image from the app bundle using the image's name.
     */
    public init(stickerSize: MSStickerSize, bundle: Bundle, imageNames: [String], principalClass: MSMessagesAppViewController) {
        self.principalClass = principalClass
        super.init(stickerSize: stickerSize)
        makeStickerArray(bundle: bundle, imageNames: imageNames)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeStickerArray(bundle: Bundle, imageNames: [String]) {
        
            // For each image name...
            imageNames.forEach {
                
                // 1. Get the location of the image as represented by an NSURL
                guard let imageURLPath = bundle.url(forResource: $0, withExtension: "png") else {
                    return
                }
                
                // Using a Do-Catch statement...
                do {
                    // 2. Attempt to make a MSSticker instance at the location derived above.
                    let sticker = try MSSticker(contentsOfFileURL: imageURLPath, localizedDescription: $0)
                    
                    // 2a. If the try succeeds, add that MSSticker object to the mutable stickerPack array.
                    stickers.append(sticker)
                } catch {
                    
                    // 2b. If the try fails, print the resulting error.
                    print(error)
                }
            }
    }
    
    //MARK: - MSStickerBrowserViewDataSource
    
    public override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    public override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
