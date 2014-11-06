//
//  LegCell.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-11-06.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import UIKit

class LegCell: UITableViewCell {
    
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var originTimeLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    
    var tripLeg: TripLeg? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView() {
        originLabel.text = tripLeg?.origin.name
        destinationLabel.text = tripLeg?.destination.name
        
        if let originTime = tripLeg?.origin.time {
            originTimeLabel.text = dateFormatter.stringFromDate(originTime)
        }
        
        if let destinationTime = tripLeg?.destination.time {
            destinationTimeLabel.text = dateFormatter.stringFromDate(destinationTime)
        }
        
        if let lineBackgroundColor = tripLeg?.line.backgroundColor {
            lineLabel.backgroundColor = tripLeg?.line.backgroundColor
            lineLabel.textColor = tripLeg?.line.foregroundColor
            lineLabel.text = tripLeg?.line.labelName
        } else {
            lineLabel.hidden = true
        }
        
    }
    
    lazy var dateFormatter: NSDateFormatter = {
        var _dateFormatter = NSDateFormatter()
        _dateFormatter.dateFormat = "HH:mm"
        
        return _dateFormatter
    }()

}
