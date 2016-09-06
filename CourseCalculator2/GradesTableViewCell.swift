//
//  GradesTableViewCell.swift
//  CourseCalculator2
//
//  Created by Guillian Balisi on 2016-09-06.
//  Copyright © 2016 Guillian Balisi. All rights reserved.
//

import UIKit

class GradesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(gradeLabelText: Double, weightLabelText: Double) {
        self.gradeLabel.text = String(gradeLabelText) + "%"
        self.weightLabel.text = String(weightLabelText) + "%"
    }

}
