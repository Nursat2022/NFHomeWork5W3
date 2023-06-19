//
//  HistoryTableViewController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 09.05.2023.
//

import UIKit

class HistoryTableViewController: UITableViewController {

var date = ["12.11.12", "21.23.34", "12.12.12"]
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
        tableView.backgroundColor =  UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        tableView.rowHeight = 54
        self.navigationItem.title = "History"
        label.textColor = .white
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
        ])
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return date.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        cell.timeMode.text = indexPath.row == 0 ? "Focus time" : "Break time"
        cell.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        cell.isUserInteractionEnabled = false
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionContentView = UILabel()
        sectionContentView.text = date[section]
        sectionContentView.textColor = .white
        sectionContentView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        sectionContentView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(sectionContentView)
        NSLayoutConstraint.activate([
            sectionContentView.heightAnchor.constraint(equalToConstant: 22),
            sectionContentView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 16)
        ])
        return headerView
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
}

//class HistoryCell: UITableViewCell {
//    let timeMode = UILabel()
//    let time = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        timeMode.textColor = .white
//        time.textColor = UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)
//        timeMode.text = "Focus time"
//        time.text = "hello"
//
//        [timeMode, time].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview($0)
//        }
//
//        NSLayoutConstraint.activate([
//            timeMode.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
//            timeMode.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11),
//            timeMode.widthAnchor.constraint(equalToConstant: 304),
//            timeMode.heightAnchor.constraint(equalToConstant: 22),
//
//            time.bottomAnchor.constraint(equalTo: timeMode.bottomAnchor),
//            time.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
//        ])
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
