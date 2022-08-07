//
//  BottomSheet.swift
//  MusicKit
//
//  Created by Emily Shao on 2022-08-03.
//

import Foundation
import UIKit

class BottomSheet: UIViewController {

    var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    lazy var subtextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.overrideUserInterfaceStyle = .dark
        button.addTarget(self, action: #selector(dismissSheet(_:)), for: .touchUpInside)
        return button
    }()

    public init(image: UIImage? = nil, title: String? = nil, subtext: String? = nil) {
        super.init(nibName: nil, bundle: nil)

        self.imageView.image = image
        self.titleLabel.text = title
        self.subtextLabel.text = subtext

        view.backgroundColor = UIColor.cardViewBG()

        setUpContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpContraints() {
        var currentTopAnchor = view.topAnchor

        if let _ = imageView.image {
            view.addSubviews([imageView])
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: currentTopAnchor, constant: 14),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 100)
//                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            currentTopAnchor = imageView.bottomAnchor
        }

        if let _ = titleLabel.text {
            view.addSubviews([titleLabel])
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: currentTopAnchor, constant: 14),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                titleLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
            currentTopAnchor = titleLabel.bottomAnchor
        }

        if let _ = subtextLabel.text {
            view.addSubviews([subtextLabel])
            NSLayoutConstraint.activate([
                subtextLabel.topAnchor.constraint(equalTo: currentTopAnchor, constant: 14),
                subtextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                subtextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
        }

        view.addSubviews([closeButton])
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 14),
//            closeButton.leadingAnchor.constraint(equalTo: titleLabel.tr, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            closeButton.heightAnchor.constraint(equalToConstant: 63)
        ])
    }

    @objc func dismissSheet(_ sender:UIButton!) {
        print("dismissSheet tapped")

        dismiss(animated: true, completion: nil)
    }
}
