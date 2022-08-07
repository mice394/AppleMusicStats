//
//  HomeViewController.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-04-25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    private var screenScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        return scrollView
    }()

    private var screenView: UIView = {
        let screenView = UIView()
        return screenView
    }()

    private lazy var screenHeader: UILabel = {
        let label = UILabel()
        label.text = presenter?.screenHeader
        label.textColor = .white
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private lazy var topLeftQuadView: UIView = {
        let view = SummaryQuadCard(type: .playTime)
        view.titleLabel.text = presenter?.topLeftQuadTitle
        view.textLabel.text = "Hello World"
        return view
    }()

    private lazy var topRightQuadView: UIView = {
        let view = SummaryQuadCard(type: .topGenre)
        view.titleLabel.text = presenter?.topRightQuadTitle
        view.textLabel.text = "Hello World"
        return view
    }()

    private lazy var bottomLeftQuadView: UIView = {
        let view = SummaryQuadCard(type: .newSongs)
        view.titleLabel.text = presenter?.bottomLeftQuadTitle
        view.textLabel.text = "Hello World"
        return view
    }()

    private lazy var bottomRightQuadView: UIView = {
        let view = SummaryQuadCard(type: .newArtists)
        view.titleLabel.text = presenter?.bottomRightQuadTitle
        view.textLabel.text = "Hello World"
        return view
    }()

    lazy var allTimeCardview: UIView = {
        let view = TopTensCard(type: .allTime)
        view.songs = presenter?.topSongs
        view.artists = presenter?.topArtsts
        view.albums = presenter?.topAlbums
        return view
    }()

    lazy var thisYearCardview: UIView = {
        let view = TopTensCard(type: .thisYear, buttonDelegate: self)
        view.songs = presenter?.topSongs
        view.artists = presenter?.topArtsts
        view.albums = presenter?.topAlbums
        return view
    }()

    var presenter: HomePresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.title = "Profile"

        view.backgroundColor = UIColor.screenBG()

        buildView()
    }

    private func buildView() {
        view.addSubviews([screenScrollView])
        screenScrollView.addSubviews([screenView])
        screenView.addSubviews([screenHeader, topLeftQuadView, topRightQuadView, bottomLeftQuadView, bottomRightQuadView])

        screenView.addSubviews([allTimeCardview, thisYearCardview])

        NSLayoutConstraint.activate([
            screenScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            screenScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            screenScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            screenScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            screenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),//screenScrollView.leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),//screenScrollView.trailingAnchor),
            screenView.topAnchor.constraint(equalTo: screenScrollView.topAnchor),
            screenView.bottomAnchor.constraint(equalTo: screenScrollView.bottomAnchor),
            screenView.heightAnchor.constraint(equalToConstant: 1080), // TODO: Investigate why this is necessary for scrolling (1080 == height of screen to top of tab bar)

            screenHeader.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 20),
            screenHeader.trailingAnchor.constraint(equalTo: screenView.trailingAnchor, constant: -20),
            screenHeader.topAnchor.constraint(equalTo: screenView.topAnchor, constant: 15),
            screenHeader.heightAnchor.constraint(equalToConstant: 25),

            topLeftQuadView.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 20),
            topLeftQuadView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/2),
            topLeftQuadView.topAnchor.constraint(equalTo: screenHeader.bottomAnchor, constant: 20),
            topLeftQuadView.heightAnchor.constraint(equalToConstant: 95),

            topRightQuadView.trailingAnchor.constraint(equalTo: screenView.trailingAnchor, constant: -20),
            topRightQuadView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/2),
            topRightQuadView.topAnchor.constraint(equalTo: screenHeader.bottomAnchor, constant: 20),
            topRightQuadView.heightAnchor.constraint(equalToConstant: 95),

            bottomLeftQuadView.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 20),
            bottomLeftQuadView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/2),
            bottomLeftQuadView.topAnchor.constraint(equalTo: topLeftQuadView.bottomAnchor, constant: 14),
            bottomLeftQuadView.heightAnchor.constraint(equalToConstant: 95),

            bottomRightQuadView.trailingAnchor.constraint(equalTo: screenView.trailingAnchor, constant: -20),
            bottomRightQuadView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/2),
            bottomRightQuadView.topAnchor.constraint(equalTo: topRightQuadView.bottomAnchor, constant: 14),
            bottomRightQuadView.heightAnchor.constraint(equalToConstant: 95),

            allTimeCardview.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 20),
            allTimeCardview.trailingAnchor.constraint(equalTo: screenView.trailingAnchor, constant: -20),
            allTimeCardview.topAnchor.constraint(equalTo: bottomLeftQuadView.bottomAnchor, constant: 20),
            allTimeCardview.heightAnchor.constraint(equalToConstant: 380),

            thisYearCardview.leadingAnchor.constraint(equalTo: screenView.leadingAnchor, constant: 20),
            thisYearCardview.trailingAnchor.constraint(equalTo: screenView.trailingAnchor, constant: -20),
            thisYearCardview.topAnchor.constraint(equalTo: allTimeCardview.bottomAnchor, constant: 20),
            thisYearCardview.heightAnchor.constraint(equalToConstant: 380),

        ])

//        topRightQuadView.isHidden = true
//        topRightText.isHidden = true
//        topRightQuadTitle.isHidden = true
    }
}

@available(iOS 15.0, *)
extension HomeViewController: PresentNUXDelegate {
//    func showMyViewControllerInACustomizedSheet() {
//        let viewControllerToPresent = MyViewController()
//        if let sheet = viewControllerToPresent.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.largestUndimmedDetentIdentifier = .medium
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//            sheet.prefersEdgeAttachedInCompactHeight = true
//            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
//        }
//        present(viewControllerToPresent, animated: true, completion: nil)
//    }
    func openNUX() {
        print("openNux")
        let subtext = "The statistics for your yearly top tens is computed within the app. Therefore, if you haven’t had this app since January 1, 2021, then the statistics will be not be completely accurate as it begins accumulating the data from the day you download it"
        let NUXSheet = BottomSheet(image: nil, title: "Hello", subtext: subtext)
        if let sheet = NUXSheet.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(NUXSheet, animated: true, completion: nil)
    }
}

extension HomeViewController: HomeViewType {
    //
}


