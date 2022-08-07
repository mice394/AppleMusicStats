//
//  NumberedCell.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-11-15.
//

import Foundation
import UIKit

class NumberedCell: UITableViewCell {

    var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.turquoise()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 11, weight: .light)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .left
        return label
    }()

    //need to call on setInformation() right after
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = UIColor.cardViewBG()
        setUpContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setInformation(number: Int, title: String, subtitle: String, mediaType: MediaType) {
        numberLabel.text = "\(number)"
        titleLabel.text = title.uppercased()
        subtitleLabel.text = subtitle.uppercased() + " MINUTES PLAYED"
    }

    func setUpContraints() {
        addSubviews([numberLabel, titleLabel, subtitleLabel])

        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            numberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 13),

            bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 5),
        ])

    }
}
