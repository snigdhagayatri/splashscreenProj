//
//  CustomCell.swift
//  DeepDive
//
//  Created by DeepDive on 28/02/15.
//  Copyright (c) 2015 CrazyNerds. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    //@IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(/*myImageName: String, */title:String, description:String)
    {
        //self.myImage.image=UIImage(named: myImageName)
        self.titleLabel.text=String(title)
        self.descriptionLabel.text=String(description)
    }
   


}
