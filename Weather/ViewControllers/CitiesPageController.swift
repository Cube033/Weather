//
//  CitiesPageController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class CitiesPageController: UIPageViewController {
    
    //MARK: - Variables
    
    var mainCoordinator: MainCoordinator?
    
    var coordinator: MainCoordinator {
        get {
            return mainCoordinator ?? MainCoordinator(window: UIWindow())
        }
    }
    
    lazy var viewControllersArray = {
        var array:[UIViewController] = []
        let locationManager = LocationManager()
        if locationManager.locationAllowed {
            let cityViewController = CityViewController(navController: coordinator.navigationController)
            array.append(cityViewController)
        } else {
            let blankCityViewController = BlankCityViewController()
            blankCityViewController.mainCoordinator = mainCoordinator
            array.append(blankCityViewController)
        }
        let citiesArray = StorageManager.shared.getCities()
        for oneCity in citiesArray {
            let cityViewController = CityViewController(navController: coordinator.navigationController)
            array.append(cityViewController)
        }
        return array
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.isUserInteractionEnabled = false
        control.currentPageIndicatorTintColor = .black
        control.pageIndicatorTintColor = .systemGray4
        control.currentPage = 0
        return control
    }()
    
    //MARK: - Init
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(mainCoordinator: MainCoordinator) {
        self.init()
        self.mainCoordinator = mainCoordinator
        setViewControllers([viewControllersArray[0]], direction: .forward, animated: true)
    }
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - Functions
    
    private func setupView() {
        delegate = self
        dataSource = self
        
        navigationItem.title = "Добавьте город"
        
        pageControl.numberOfPages = viewControllersArray.count
        
        view.backgroundColor = .clear
        
        addElements()
        
        let settingsBarButtonImage: UIImage = UIImage(named: "menuIcon") ?? UIImage()
        let addCityButtonImage: UIImage = UIImage(named: "addCityIcon") ?? UIImage()
        let settingsBarButtonItem = UIBarButtonItem(image: settingsBarButtonImage, style: .plain, target: self, action: #selector(settingsBarButtonTapped))
        let addCityBarButtonItem = UIBarButtonItem(image: addCityButtonImage, style: .plain, target: self, action: #selector(addCityButtonTapped))
        
        navigationItem.leftBarButtonItem = settingsBarButtonItem
        navigationItem.rightBarButtonItem = addCityBarButtonItem
        
        
    }
    
    @objc private func settingsBarButtonTapped() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    @objc private func addCityButtonTapped() {
        mainCoordinator?.addCityButtonTapped(viewController: self)
    }
    
    private func addElements() {
        view.addSubview(pageControl)
        setConstraints()
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
}

//MARK: - Extensions

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
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return viewControllersArray.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        0
//    }
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
