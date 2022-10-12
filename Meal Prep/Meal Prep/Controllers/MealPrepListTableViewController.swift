//
//  MealPrepListTableViewController.swift
//  Meal Prep
//
//  Created by Jicell on 10/6/22.
//

import UIKit

class MealPrepListTableViewController: UITableViewController {
    
    var tempMealArray: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkController.fetchMeals { meals in
            guard let meals = meals else {return}
            DispatchQueue.main.async {
                self.tempMealArray = meals
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tempMealArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        let meal = tempMealArray[indexPath.row]
        cell.textLabel?.text = meal.meal
        
        // Configure the cell...
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toMealDetails",
              let destinationVC = segue.destination as? MealPrepDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let mealToSend = tempMealArray[indexPath.row]
        destinationVC.mealReciever = mealToSend
}

}



