//
//  MVC_to_MVPTests.swift
//  MVC to MVPTests
//
//  Created by omrobbie on 10/07/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import XCTest

@testable
import MVC_to_MVP

class MVC_to_MVPTests: XCTestCase {

    var courseViewMock: CourseViewMock!

    override func setUp() {
        courseViewMock = CourseViewMock()
    }

    func testLessonList() {
        let course = Course(id: 0, name: "Learn with omrobbie", number_of_lessons: 10)
        let courseViewData = CourseViewData(course: course)

        XCTAssertEqual(courseViewData.title, course.name)
        XCTAssertEqual(courseViewData.detail, "Lesson \(course.number_of_lessons)")
        XCTAssertEqual(courseViewData.type, UITableViewCell.AccessoryType.none)
    }

    func testLessonListOverThreshold() {
        let course = Course(id: 0, name: "Learn with omrobbie", number_of_lessons: 100)
        let courseViewData = CourseViewData(course: course)

        XCTAssertEqual(courseViewData.title, course.name)
        XCTAssertEqual(courseViewData.detail, "Lesson 30+ Check it Out!")
        XCTAssertEqual(courseViewData.type, UITableViewCell.AccessoryType.detailDisclosureButton)
    }

    func testShowLessonData() {
        let coursePresenter = CoursePresenter(view: courseViewMock, data: dummyData)
        coursePresenter.fetchData()

        XCTAssertTrue(courseViewMock.dataShowOnList)
    }
}

class CourseViewMock: NSObject, CourseView {

    var dataShowOnList = false

    func showData(courseViewData: [CourseViewData]) {
        dataShowOnList = true
    }
}
