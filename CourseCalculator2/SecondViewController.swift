//
//  SecondViewController.swift
//  CourseCalculator2
//
//  Created by Guillian Balisi on 2016-08-31.
//  Copyright © 2016 Guillian Balisi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var currentAverageLabel: UILabel!
    @IBOutlet weak var weightAcheivedLabel: UILabel!
    
    @IBOutlet weak var finalGradeTextField: UITextField!
    @IBOutlet weak var finalGradeLabel: UILabel!
    
    @IBOutlet weak var remainingGradeTextField: UITextField!
    @IBOutlet weak var remainingGradeLabel: UILabel!
    
    var grades = Grades()

    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController as! CourseCalculatorTabController
        grades = tbvc.grades
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        displayCurrent()
        if finalGradeTextField.text != "" && remainingGradeTextField.text != "" {
        calcFinalGrade()
        calcRemainingGrade()
        }
    }
    
    func displayCurrent() {
        let currentAverage = grades.currentAverage(grades.gradeList, weightList: grades.weightList) / grades.currentWeight() * 100
        currentAverageLabel.text = String(format: "%0.2f", currentAverage) + "%"
        weightAcheivedLabel.text = String(format: "%0.2f", grades.currentWeight()) + "%"
    }
    
    @IBAction func calcFinalGrade() {
        finalGradeLabel.text = String(format: "%0.2f", grades.requiredAverage(((finalGradeTextField.text as? NSString)?.doubleValue)!)) + "%"
    }
    
    @IBAction func calcRemainingGrade() {
        remainingGradeLabel.text = String(format: "%0.2f", grades.overallAverage(((remainingGradeTextField.text as? NSString)?.doubleValue)!)) + "%"
    }

}

