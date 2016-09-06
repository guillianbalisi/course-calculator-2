//
//  FirstViewController.swift
//  CourseCalculator2
//
//  Created by Guillian Balisi on 2016-08-31.
//  Copyright © 2016 Guillian Balisi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var currentAverageLabel: UILabel!
    @IBOutlet weak var weightAcheivedLabel: UILabel!
    
    @IBOutlet weak var gradesTableView: UITableView!
    
    var grades = Grades()
    
    @IBAction func add(sender: UIButton) {
        let grade = (gradeTextField.text as! NSString).doubleValue
        let weight = (weightTextField.text as! NSString).doubleValue
        grades.add(grade, weight: weight)
        displayCurrent()
        resetTextFields()
        viewTapped()
    }
    
    @IBAction func viewTapped() {
        weightTextField.resignFirstResponder()
        gradeTextField.resignFirstResponder()
    }
    
    @IBAction func compute() {
            self.tabBarController?.selectedIndex = 1
    }
    
    func resetTextFields() {
        gradeTextField.text = ""
        weightTextField.text = ""
    }
    
    func displayCurrent() {
        let currentAverage = grades.currentAverage(grades.gradeList, weightList: grades.weightList) / grades.currentWeight() * 100
        currentAverageLabel.text = String(format: "%0.2f", currentAverage) + "%"
        weightAcheivedLabel.text = String(format: "%0.2f", grades.currentWeight()) + "%"
        gradesTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController as! CourseCalculatorTabController
        grades = tbvc.grades
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func viewDidAppear(animated: Bool) {
//        print(grades.gradeList)
//        print(grades.weightList)
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.gradeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: GradesTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! GradesTableViewCell
        let grade = grades.gradeList[indexPath.row]
        let weight = grades.weightList[indexPath.row]
        
        cell.setCell(grade, weightLabelText: weight)
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            grades.gradeList.removeAtIndex(indexPath.row)
            grades.weightList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            displayCurrent()
        }
    }
    


}

