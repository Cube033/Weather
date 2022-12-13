//
//  CitiesPageController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class CitiesPageController: UIPageViewController {

    lazy var viewControllersArray = {
        var array:[UIViewController] = []
        
        let locationManager = LocationManager()
        if locationManager.locationAllowed {
            array.append(CityViewController())
        } else {
            array.append(BlankCityViewController())
        }
        let citiesArray = StorageManager.shared.getCities()
        for oneCity in citiesArray {
            array.append(CityViewController())
        }
        return array
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.isUserInteractionEnabled = false
        control.currentPageIndicatorTintColor = .systemOrange
        control.pageIndicatorTintColor = .systemGray5
        control.currentPage = 0
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        delegate = self
        dataSource = self
        
        pageControl.numberOfPages = viewControllersArray.count
        
        view.backgroundColor = .clear

        view.addSubview(pageControl)

            NSLayoutConstraint.activate([
                pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
        setViewControllers([viewControllersArray[0]], direction: .forward, animated: true)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CitiesPageController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = viewControllersArray.firstIndex(of: viewController) {
            if index > 0 {
                return viewControllersArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = viewControllersArray.firstIndex(of: viewController) {
            if index < viewControllersArray.count - 1 {
                return viewControllersArray[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllersArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}

extension CitiesPageController: UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            
            if let index = viewControllersArray.firstIndex(of: pageViewController.viewControllers!.first!) {
                self.pageControl.currentPage = index
            }
        }
    }
    
}
