//
//  TopTensCard.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-11-14.
//

import Foundation
import UIKit

enum TopTenType {
    case allTime
    case thisYear
}

protocol PresentNUXDelegate: AnyObject {
    func openNUX()
}

class TopTensCard: UIView {

    lazy var cardview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cardViewBG()
        view.layer.cornerRadius = 8.0
        return view
    }()

    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    var buttonDelegate: PresentNUXDelegate?

    lazy var infoNUXButton: UIButton = {
        let button = UIButton(type: .infoDark)
        let image = UIImage(systemName: "questionmark.circle.fill")
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }()

    lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Songs", "Albums", "Artists"])
        segmentControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = UIColor.segmentControlColor()
        return segmentControl
    }()

    var songs: [Song]?
    var albums: [Album]?
    var artists: [Artist]?

    var data: [Media]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 8.0
        tableView.bounces = false
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.layer.borderWidth = 1
        tableView.separatorColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return tableView
    }()

    let type: TopTenType

    public init(type: TopTenType, buttonDelegate: PresentNUXDelegate? = nil) {
        self.type = type
        self.data = songs ?? []
        self.buttonDelegate = buttonDelegate

        super.init(frame: .zero)

        headerLabel.text = type == .allTime ? "All Time Top Tens" : "2021 Top Tens"

        setUpConstraints()
        setUpTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpConstraints() {
        addSubviews([cardview])
        cardview.addSubviews([headerLabel, segmentControl, tableView])

        NSLayoutConstraint.activate([
            cardview.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardview.topAnchor.constraint(equalTo: topAnchor),
            cardview.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardview.centerYAnchor.constraint(equalTo: centerYAnchor),

            headerLabel.leadingAnchor.constraint(equalTo: cardview.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: cardview.trailingAnchor, constant: -20),
            headerLabel.topAnchor.constraint(equalTo: cardview.topAnchor, constant: 14),
            headerLabel.heightAnchor.constraint(equalToConstant: 25),

            segmentControl.leadingAnchor.constraint(equalTo: cardview.leadingAnchor, constant: 18),
            segmentControl.trailingAnchor.constraint(equalTo: cardview.trailingAnchor, constant: -17),
            segmentControl.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 14),
            segmentControl.heightAnchor.constraint(equalToConstant: 23),

            tableView.leadingAnchor.constraint(equalTo: cardview.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: cardview.trailingAnchor, constant: -9),
            tableView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 14),
            tableView.bottomAnchor.constraint(equalTo: cardview.bottomAnchor, constant: -14),
        ])

        if type == .thisYear {
            cardview.addSubviews([infoNUXButton])
            NSLayoutConstraint.activate([
                infoNUXButton.trailingAnchor.constraint(equalTo: cardview.trailingAnchor, constant: -20),
                infoNUXButton.topAnchor.constraint(equalTo: cardview.topAnchor, constant: 14),
                infoNUXButton.heightAnchor.constraint(equalToConstant: 25),
            ])
        }
    }

    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            print("Songs")
           refreshTableView(segmentIndex: 0)
          case 1:
            print("Albums")
           refreshTableView(segmentIndex: 1)
          case 2:
            print("Artists")
           refreshTableView(segmentIndex: 2)
       default:
        break
       }
    }

    @objc func buttonAction(_ sender:UIButton!) {
        print("infoNUXButton tapped")
        buttonDelegate?.openNUX()
    }
}

extension TopTensCard: UITableViewDataSource {
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(NumberedCell.self, forCellReuseIdentifier: "numberedCell")
    }

    private func refreshTableView(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            data = songs ?? []
        case 1:
            data = albums ?? []
        case 2:
            data = artists ?? []
        default:
            data = songs ?? []
        }
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NumberedCell(style: .default, reuseIdentifier: "numberedCell")
        let number = indexPath.row + 1
        guard let title = data[indexPath.row].name, let subtitle = data[indexPath.row].numListens else {
            return cell
        }
        cell.setInformation(number: number, title: title, subtitle: "\(subtitle)")

        return cell
    }
}

