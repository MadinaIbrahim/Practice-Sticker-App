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
    
    // The root class of the app extension.
    let principalClass: MSMessagesAppViewController
    
    /**
     Initializes an instance of StickerBrowserViewController. StickerBrowserViewController is a subclass of MSStickerBrowserViewController. It is therefore required to conform to the MSStickerBrowserViewDataSource protocol, and may optionally override MSStickerBrowserViewController's public functions.
     
     - parameter stickerSize: The Sticker size is used to control the display size of the stickers in the Sticker Browser View.
     - parameter bundle:      The bundle where sticker assets are located. We access assets (like images and fonts) via the app bundle. 
     - parameter imageNames:  The full list of sticker images file names. We will pull the image from the app bundle using the this String.
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

        // Tasks:
        
            // 1. Iterate through the imageNames array using Array's forEach function.
        
                /**
                    forEach { } example: 
         
                    Find out which numbers in an array are divisible by 3.
         
                     let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                     var containsNumberDivisibleByFive = false
                     
                     numbers.forEach {
                        let remainder = $0 % 3
                        if remainder > 0 {
                            containsNumberDivisibleByFive = false
                        }
                        else {
                            containsNumberDivisibleByFive = true
                        }
                     }
                 */
        
            // 2. For each image name make a URL which represents the path to the image...
        
                /**
                    Example: 
         
                    imageNames.forEach {
                        imageURLPath = bundle.url(forResource: "fileName", withExtension: "png")
                    }
                 */
        
            // 3. ...and then use that path to make a MSSticker object, and add each sticker you make to the stickers array.
        
                /**
                    Example:
         
                     do {
                        let sticker = try MSSticker(contentsOfFileURL: imageURLPath, localizedDescription: "imageURLPath")
                        stickers.append(sticker)
                     } catch {
                        print(error)
                     }
                 */
    }
    
    //MARK: - MSStickerBrowserViewDataSource
    
    public override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    public override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
