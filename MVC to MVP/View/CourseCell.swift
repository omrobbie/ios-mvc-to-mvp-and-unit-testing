//
//  CourseCell.swift
//  MVC to MVP
//
//  Created by omrobbie on 09/07/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    var courseViewData: CourseViewData! {
        didSet {
            textLabel?.text = courseViewData.title
            detailTextLabel?.text = courseViewData.detail
            accessoryType = courseViewData.type
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
