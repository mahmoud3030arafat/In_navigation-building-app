//
//  TopCollectionViewCell.swift
//  Smart City
//
//  Created by Mahmoud on 3/15/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
   // @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var topImages: UIImageView!
    override func awakeFromNib() {
         topImages.contentMode = .scaleToFill
    }
}
