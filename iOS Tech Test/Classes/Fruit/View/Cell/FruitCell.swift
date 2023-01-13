//
//  FruitCell.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import UIKit

class FruitCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var orangeLabel: UILabel!
    
    var fruit: Fruit? {
        didSet {
            setData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        self.nameLabel.text = fruit?.name ?? ""
        self.familyLabel.text = fruit?.family ?? ""
        self.fatLabel.text = "\(fruit?.nutritions.fat ?? 0)"
        self.proteinLabel.text = "\(fruit?.nutritions.protein ?? 0)"
        self.orangeLabel.text = "\(fruit?.nutritions.sugar ?? 0)"
    }
    
}
