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

    private lazy var coursePresenter = CoursePresenter(view: self, data: dummyData)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
        coursePresenter.fetchData()
    }

    private func setupList() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
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

extension ViewController: CourseView {

    func showData(courseViewData: [CourseViewData]) {
        self.courseViewDatas = courseViewData
        tableView.reloadData()
    }
}
