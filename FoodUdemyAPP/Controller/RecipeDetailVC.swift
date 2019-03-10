//
//  RecipeDetailVC.swift
//  FoodUdemyAPP
//
//  Created by Artem on 10/03/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {
    
    
    @IBOutlet weak var recipeImg: UIImageView!
    
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeInstruction: UILabel!
    
    var selectedRecipe: Recipe!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImg.image = UIImage(named: selectedRecipe.imageName)
        recipeTitle.text = selectedRecipe.title
        recipeInstruction.text = selectedRecipe.instructions

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
