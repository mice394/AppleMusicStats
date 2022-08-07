//
//  TabBarController.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-10-09.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        tabBar.barTintColor = UIColor.tabbarUnselectedColor()
        tabBar.isTranslucent = false

        tabBar.tintColor = UIColor.tabbarSelectedColor()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let homeView = HomeViewController()
        let homeModel = HomeModel()
        homeView.presenter = HomePresenter(model: homeModel, view: homeView)
        let icon1 = UITabBarItem(title: "STATISTICS", image: UIImage(systemName: "chart.bar.xaxis"), selectedImage: nil)
        homeView.tabBarItem = icon1

        let postView = PostViewController()
        let icon2 = UITabBarItem(title: "POST", image: UIImage(systemName: "photo.on.rectangle.angled"), selectedImage: nil)
        postView.tabBarItem = icon2

        let settingsView = SettingViewController()
        let icon3 = UITabBarItem(title: "SETTINGS", image: UIImage(systemName: "gearshape.fill"), selectedImage: nil)
        settingsView.tabBarItem = icon3

        let controllers = [homeView, postView, settingsView]  //array of the root view controllers displayed by the tab bar interface
        self.selectedIndex = 0
        self.viewControllers = controllers
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("didSelect: \(item.title ?? "error")")
    }
}
