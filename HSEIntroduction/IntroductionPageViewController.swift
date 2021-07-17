//
//  IntroductionPageViewController.swift
//  HSEIntroduction
//
//  Created by Kostya Bunsberry on 07.07.2020.
//

import UIKit

class IntroductionPageViewController: UIPageViewController {
    
    let pagesData: [PageStruct] = [
        PageStruct(imageName: "hello", headlineText: "Кто я такой?", descriptionText: "Зовут меня Костя, занимаюсь iOS разработкой уже почти 2 года, раньше делал сайты и андроид приложухи." ),
        PageStruct(imageName: "seriosly", headlineText: "Что я делал?", descriptionText: "В целом не так много, победил в номинации 'Прикольная фича' на прошлой летней школе ВШЭ с приложением Dream Price и для изучения Swift прогал всякую мелочь."),
        PageStruct(imageName: "accents", headlineText: "Что я люблю?", descriptionText: "Больше всего себя конечно, но вообще не могу жить без сочного дизайна и продуманного user experience'а в приложениях."),
        PageStruct(imageName: "contactme", headlineText: "Что посоветую?", descriptionText: "Чекай мой гитхаб и пиши в телегу [@KostyaBunsberry] если хочешь поработать со мной или просто так ;)")
    ]
    
    var currentIndex: Int = 0
    
    var appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.secondarySystemGroupedBackground
        
        appearance.pageIndicatorTintColor = UIColor.secondaryLabel
        appearance.currentPageIndicatorTintColor = UIColor.label

        self.dataSource = self
        self.delegate = self
        
        if let vc = self.pageViewController(for: 0) {
            self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(for index: Int) -> DataViewController? {
        if index < 0 || index >= pagesData.count {
            return nil
        }
        let vc = (storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController)
        
        vc.headlineLabelText = pagesData[index].headlineText
        vc.descriptionLabelText = pagesData[index].descriptionText
        vc.emojiImage = UIImage(named: pagesData[index].imageName)
        vc.index = index
        self.currentIndex = index
        
        return vc
    }

}

extension IntroductionPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pagesData.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? DataViewController)?.index ?? 0) - 1
        
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? DataViewController)?.index ?? 0) + 1
        
        return self.pageViewController(for: index)
    }
    
}
