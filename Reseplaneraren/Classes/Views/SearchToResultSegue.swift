//
//  SearchToResultSegue.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-11-05.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import Foundation
import UIKit

class SearchToResultSegue: UIStoryboardSegue {
    
    override func perform() {
        let sourceViewController = self.sourceViewController as UIViewController
        let destinationViewController = self.destinationViewController as UIViewController
        let duplicatedSourceView: UIView = sourceViewController.view.snapshotViewAfterScreenUpdates(false)
        
        destinationViewController.view.addSubview(duplicatedSourceView)
        
        sourceViewController.presentViewController(destinationViewController, animated: false) { () -> Void in
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                duplicatedSourceView.transform = CGAffineTransformMakeTranslation(0, -duplicatedSourceView.frame.size.height)
            }) { (finished) -> Void in
                duplicatedSourceView.removeFromSuperview()
            }
        }
        
        
        
    }
}