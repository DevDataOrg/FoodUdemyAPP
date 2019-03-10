//
//  CategoryCell.swift
//  FoodUdemyAPP
//
//  Created by Artem on 19/02/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit


//описываем все параметры нашей ячейки и модулей в ней
class CategoryCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryImg: UIImageView!
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //задаем радиус нашей картинке
        categoryImg.layer.cornerRadius = 10
        
    }
    //метод описывающие что выводить в нашей картинке categoryImg и нашем лейбле categoryTitle
    //берем данные из нашей модели FoodCategory.swift вызываем  структуру FoodCategory как входящие параметры в функцию  configureCell
    func configureCell (category: FoodCategory) {
        categoryImg.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
        
    }

}
