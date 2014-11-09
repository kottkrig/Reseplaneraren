//
//  FavouriteDestinationCollectionViewCell.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-11-07.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import UIKit

class FavouriteDestinationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var favouriteDestination: FavouriteDestination? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    
    func configureView() {
        
        println("FavouriteDestinationCell: " + favouriteDestination!.name)
        self.nameLabel.text = favouriteDestination?.name
    }
}
