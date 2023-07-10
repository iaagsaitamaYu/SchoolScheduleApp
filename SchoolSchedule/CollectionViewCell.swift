//
//  CollectionViewCell.swift
//  SchoolSchedule
//
//  Created by 箭内雄 on 2021/02/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var TopViewSubjectTitle: UILabel!
    // Do any additional setup after loading the view.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.systemGray4.cgColor
    }

}
