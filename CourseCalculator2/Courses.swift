//
//  Courses.swift
//  CourseCalculator2
//
//  Created by Guillian Balisi on 2016-08-31.
//  Copyright © 2016 Guillian Balisi. All rights reserved.
//

import Foundation

class Courses: NSObject, NSCoding {
    
    var courseList: [String]
    
    override init() {
        self.courseList = []
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.courseList = aDecoder.decodeObjectForKey("courseList") as! [String]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(courseList, forKey: "courseList")
    }
    
    
}
