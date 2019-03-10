//
//  RecipeCell.swift
//  FoodUdemyAPP
//
//  Created by Artem on 20/02/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //задаем картинке в коллектион корнер радиус
        recipeImg.layer.cornerRadius = 10
        
    }
    
    //передаем в функцию нашу дату Recipe.swift нашу структуру для определения нашей картинки или картинок
    func configureCell(recipe: Recipe) {
        recipeImg.image = UIImage(named: recipe.imageName)
        
    }
    
    
}
