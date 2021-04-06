

import UIKit

class BotomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var myLable: UILabel!
    override func awakeFromNib() {
        myLable.isHidden = false
    }
}
