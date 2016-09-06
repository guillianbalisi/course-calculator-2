//
//  Grades.swift
//  CourseCalculator2
//
//  Created by Guillian Balisi on 2016-08-31.
//  Copyright © 2016 Guillian Balisi. All rights reserved.
//

import Foundation

class Grades: NSObject, NSCoding {
    
    var gradeList: [Double]
    var weightList: [Double]
    
    override init() {
        gradeList = []
        weightList = []
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.gradeList = aDecoder.decodeObjectForKey("gradeList") as! [Double]
        self.weightList = aDecoder.decodeObjectForKey("weightList") as! [Double]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(gradeList, forKey: "gradeList")
        aCoder.encodeObject(weightList, forKey: "weightList")
    }
    
    func sumGrade() -> Double {
        let sum = gradeList.reduce(0, combine: +)
        return sum
    }
    
    func sumWeight() -> Double {
        let sum = weightList.reduce(0, combine: +)
        return sum
    }
    
    func add(grade: Double, weight: Double) {
        gradeList.append(grade)
        weightList.append(weight)
    }
    
    func currentAverage(gradeList: [Double], weightList: [Double]) -> Double {
        var currentGrade: Double = 0
        for i in 0..<gradeList.count {
            currentGrade += gradeList[i] * weightList[i] * 0.01
        }
        return currentGrade
    }
    
    func currentWeight() -> Double {
        return sumWeight()
    }
    
    func remainingWeight() -> Double {
        return 100 - sumWeight()
    }
    
    func requiredAverage(inputFinalGrade: Double) -> Double { // required average based on final grade
        let currentGrade = currentAverage(gradeList, weightList: weightList)
        return (inputFinalGrade - currentGrade / remainingWeight())
    }
    
    func overallAverage(inputRemainingGrade: Double) -> Double { // overall average based on remaining grade
        var tempGradeList = gradeList
        var tempWeightList = weightList
        tempGradeList.append(inputRemainingGrade)
        tempWeightList.append(remainingWeight())
        return currentAverage(tempGradeList, weightList: tempWeightList)
    }
    
}