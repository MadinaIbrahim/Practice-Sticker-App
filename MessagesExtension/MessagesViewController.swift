//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Tamar Nachmany on 10/23/16.
//  Copyright © 2016 Girl Develop It. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let imageFilenames = [
            "horse",
            "cat",
            "dog",
            "sheep",
            "goat",
            "cow"
        ]
        
        super.init(nibName: nil, bundle: nibBundleOrNil)
        let stickerBrowserViewController = StickerBrowserViewController(stickerSize: .large,
                                                                    bundle: Bundle.main,
                                                                    imageNames: imageFilenames,
                                                                    principalClass: self)
        
        properlyAddChildViewController(childViewController: stickerBrowserViewController,
                                        parentViewController: self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func properlyAddChildViewController(childViewController: UIViewController,
                                                 parentViewController: UIViewController) {
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: parentViewController)
    }
}
