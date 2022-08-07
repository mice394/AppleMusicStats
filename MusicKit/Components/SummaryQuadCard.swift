//
//  SummaryCard.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-11-14.
//

import Foundation
import UIKit

enum SummaryType {
    case playTime
    case topGenre
    case newSongs
    case newArtists
}

class SummaryQuadCard: UIView {

    lazy var cardview: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cardViewBG()
        view.layer.cornerRadius = 8.0
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.neonPink()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    var type: SummaryType?

    public init(type: SummaryType) {
        self.type = type
        super.init(frame: .zero)

//        self.textLabel.text = text
//        switch type {
//        case .playTime:
//            titleLabel.text = "Play Time"
//        case .newSongs:
//            titleLabel.text = "New Songs"
//        case . topGenre:
//            titleLabel.text = "Top Genre"
//        case .newArtists:
//            titleLabel.text = "New Artist"
//        }

        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpConstraints() {
        addSubviews([cardview])
        cardview.addSubviews([titleLabel, textLabel])

        NSLayoutConstraint.activate([
            cardview.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardview.topAnchor.constraint(equalTo: topAnchor),
            cardview.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardview.centerYAnchor.constraint(equalTo: centerYAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: cardview.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: cardview.widthAnchor),
            titleLabel.topAnchor.constraint(equalTo: cardview.topAnchor, constant: 14),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),

            textLabel.leadingAnchor.constraint(equalTo: cardview.leadingAnchor),
            textLabel.widthAnchor.constraint(equalTo: cardview.widthAnchor),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            textLabel.heightAnchor.constraint(equalToConstant: 34),
            textLabel.bottomAnchor.constraint(equalTo: cardview.bottomAnchor, constant: -15)
        ])
    }
}
