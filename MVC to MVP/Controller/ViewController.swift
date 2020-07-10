//
//  ViewController.swift
//  MVC to MVP
//
//  Created by omrobbie on 09/07/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let cellId = "cell"
    private var courseViewDatas = [CourseViewData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
        fetchData()
    }

    private func setupList() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
    }

    private func fetchData() {
        courseViewDatas = dummyData.map({return CourseViewData(course: $0)})
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewDatas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! CourseCell
        cell.courseViewData = courseViewDatas[indexPath.row]
        return cell
    }
}
