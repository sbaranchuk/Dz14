//
//  PhotosTabBarController.swift
//  Dz14
//
//  Created by Admin on 15/01/2023.
//

import UIKit

class PhotosTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }

    private func setupTabBarController() {
    }

    private func setupTabBarViewControllers() {
        let first = LibraryTabBarViewController()
        let firstIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        first.tabBarItem = firstIcon

        let second = ForYouTabBarViewController()
        let secondIcon = UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        second.tabBarItem = secondIcon

        let third = AlbumsTabBarViewController()
        let thirdIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        third.tabBarItem = thirdIcon

        let fourth = SearchTabBarViewController()
        let fourthIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        fourth.tabBarItem = fourthIcon

        let controllers = [first, second, third, fourth]
        self.setViewControllers(controllers, animated: true)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.title {
        case "Library":
            self.navigationController?.navigationBar.topItem?.title = "Library"
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.topItem?.leftBarButtonItem = nil
        case "For You":
            self.navigationController?.navigationBar.topItem?.title = "For You"
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.topItem?.leftBarButtonItem = nil
        case "Albums":
            self.navigationController?.navigationBar.topItem?.title = "Albums"
            self.navigationController?.navigationBar.prefersLargeTitles = true
            let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
            self.navigationController?.navigationBar.topItem?.leftBarButtonItem = leftBarButtonItem
        case "Search":
            self.navigationController?.navigationBar.topItem?.title = "Search"
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.topItem?.leftBarButtonItem = nil
        default:
            return
        }
    }
}
