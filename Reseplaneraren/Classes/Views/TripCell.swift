//
//  TripCell.swift
//  Reseplaneraren
//
//  Created by Johan Larsson on 2014-11-05.
//  Copyright (c) 2014 Johan Larsson. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var trip: Trip? {
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
        
        if let startTime = trip?.startTime {
            if let endTime = trip?.endTime {
                timeLabel.text = "\(dateFormatter.stringFromDate(startTime)) - \(dateFormatter.stringFromDate(endTime)) (xx min)"
            }
        }
        
        var dx = timeLabel.frame.origin.x
        var dy = timeLabel.frame.origin.y + timeLabel.frame.size.height
        
        for leg in trip!.legs {
            if let foregroundColor = leg.line.foregroundColor {
                if let backgroundColor = leg.line.backgroundColor {
                    var legLabel = UILabel(frame: CGRectMake(dx, dy, 30, 30))
                    legLabel.backgroundColor = backgroundColor
                    legLabel.textColor = foregroundColor
                    legLabel.textAlignment = NSTextAlignment.Center
                    legLabel.text = leg.line.labelName!
                    
                    self.contentView.addSubview(legLabel)
                    
                    dx += 40
                }
            }
        }
    }
    
    lazy var dateFormatter: NSDateFormatter = {
        var _dateFormatter = NSDateFormatter()
        _dateFormatter.dateFormat = "HH:mm"
        
        return _dateFormatter
    }()
    
    

}
