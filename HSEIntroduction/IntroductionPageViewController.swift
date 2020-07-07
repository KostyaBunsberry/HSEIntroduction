//
//  IntroductionPageViewController.swift
//  HSEIntroduction
//
//  Created by Kostya Bunsberry on 07.07.2020.
//

import UIKit

class IntroductionPageViewController: UIPageViewController {
    
    let pagesData: [PageStruct] = [
        PageStruct(imageName: "hello", headlineText: "Представлюсь!", descriptionText: "Да, еще раз, но я люблю говорить о себе, так что потерпите) Меня зовут Костя, я жуткий гик и просто плохой человек ¯|_(ツ)_|¯" ),
        PageStruct(imageName: "clown", headlineText: "Также я немного клоун", descriptionText: "Как вы уже заметили по несмешным шуткам и неуместному сарказму. Будьте к этому готовы!"),
        PageStruct(imageName: "seriosly", headlineText: "Ну, а если сириосли?", descriptionText: "Оценивать свои навыки кодинга я не осмелюсь, но скажу, что я уделяю много внимания таким вещам как дизайн и UX."),
        PageStruct(imageName: "accents", headlineText: "Расстановка акцентов", descriptionText: "Как я и сказал, не всегда важно что, зачастую главное как. Так что буду рад продумывать до мельчайших деталей вашу идею, если она мне понравится конечно ;)"),
        PageStruct(imageName: "contactme", headlineText: "Хочешь со мной работать?", descriptionText: "Тогда пиши в телегу: @KostyaBunsberry ...Ну или просто так пиши, все равно отвечу :)")
    ]
    
    var currentIndex: Int = 0
    
    var appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.secondarySystemGroupedBackground
        
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.black

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
