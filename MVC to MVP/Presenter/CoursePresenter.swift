//
//  CoursePresenter.swift
//  MVC to MVP
//
//  Created by omrobbie on 10/07/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation

protocol CourseView: AnyObject {

    func showData(courseViewData: [CourseViewData])
}

class CoursePresenter {

    private weak var courseView: CourseView?
    private let courses: [Course]!

    init(view: CourseView, data: [Course]) {
        self.courseView = view
        self.courses = data
    }

    func fetchData() {
        let courseViewData = courses.map({return CourseViewData(course: $0)})
        courseView?.showData(courseViewData: courseViewData)
    }
}
