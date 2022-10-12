//
//  MealPrepDetailViewController.swift
//  Meal Prep
//
//  Created by Jicell on 10/6/22.
//

import UIKit

class MealPrepDetailViewController: UIViewController {

    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealCategoryLabel: UILabel!
    
    @IBOutlet weak var mealInstructionsLabel: UILabel!
    
    var mealReciever: Meal? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    

    func updateViews() {
        self.title = mealReciever?.meal
        mealNameLabel.text = mealReciever?.meal
        mealCategoryLabel.text = mealReciever?.category
        mealInstructionsLabel.text = mealReciever?.instructions
        mealInstructionsLabel.numberOfLines = 90
        mealInstructionsLabel.lineBreakMode = .byWordWrapping
        mealInstructionsLabel.sizeToFit()
    }

}
