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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
    }

    private func setupList() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        let item = dummyData[indexPath.row]
        cell.textLabel?.text = item.name

        if item.number_of_lessons > 35 {
            cell.detailTextLabel?.text = "Lesson 30+ Check it Out!"
            cell.accessoryType = .detailDisclosureButton
        } else {
            cell.detailTextLabel?.text = "Lesson \(item.number_of_lessons)"
            cell.accessoryType = .none
        }
        return cell
    }
}
