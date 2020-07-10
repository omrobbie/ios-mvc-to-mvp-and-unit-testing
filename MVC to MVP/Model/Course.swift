//
//  Course.swift
//  MVC to MVP
//
//  Created by omrobbie on 09/07/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

struct Course: Decodable {

    let id: Int
    let name: String
    let number_of_lessons: Int
}

let dummyData: [Course] = [
    Course(id: 0, name: "Instagram Firebase", number_of_lessons: 40),
    Course(id: 1, name: "Podcast Course", number_of_lessons: 50),
    Course(id: 2, name: "Intermediate Training", number_of_lessons: 32),
    Course(id: 3, name: "Kindle Basic Training", number_of_lessons: 19)
]

struct CourseViewData {

    let title: String
    let detail: String
    let type: UITableViewCell.AccessoryType

    init(course: Course) {
        title = course.name

        if course.number_of_lessons > 35 {
            detail = "Lesson 30+ Check it Out!"
            type = .detailDisclosureButton
        } else {
            detail = "Lesson \(course.number_of_lessons)"
            type = .none
        }
    }
}
