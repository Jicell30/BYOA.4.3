//
//  Meal.swift
//  Meal Prep
//
//  Created by Jicell on 10/6/22.
//

import Foundation

// Meal class
class Meal{
    
    //MARK: - keys
    
    enum Keys: String {
        case kMeal = "strMeal"
        case kInstructions = "strInstructions"
        case kCategory = "strCategory"
        
    }
    
    let meal: String
    let instructions: String
    let category: String
    
    //Memberwise Initializer
    init(meal: String, instructions: String, category: String) {
        self.meal = meal
        self.instructions = instructions
        self.category = category
    }
}// End of class.

extension Meal{
    // convenience initializer
    convenience init?(topLevelDictionary:[String:Any]) {
        guard let meal = topLevelDictionary[Keys.kMeal.rawValue] as? String,
              let instruct = topLevelDictionary[Keys.kInstructions.rawValue] as? String,
              let category = topLevelDictionary[Keys.kCategory.rawValue] as? String else {
            return nil
        }
        self.init(meal: meal, instructions: instruct, category: category)
        
    }
}

/**
 "meals": [
         {
             "idMeal": "52768",
             "strMeal": "Apple Frangipan Tart",
             "strDrinkAlternate": null,
             "strCategory": "Dessert",
             "strArea": "British",
             "strInstructions": "Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream."
 
 */
