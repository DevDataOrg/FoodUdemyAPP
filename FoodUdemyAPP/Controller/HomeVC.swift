//
//  ViewController.swift
//  FoodUdemyAPP
//
//  Created by Artem on 18/02/2019.
//  Copyright © 2019 Artem. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var tableView: UITableView!
    
    //инициализация классаа ДатаСет - DataSet.swift в котором написаны все наши данные от структур
    // FoodCategory.swift и Recipe.swift
    let data = DataSet()
    
    //категория для прохождения сегвея конкретной ячейки
    var categoryToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //подписываем на делегат  датасоурс
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    //MARK: - Методы протокола UITableViewDelegate и UITableViewDataSource
    
    //инициализирует и возвращает количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //берем из инициализации класса data = DataSet() категории и считаем их количество
        return data.categories.count
    }
    
    //НУЖНО убрать separator у таблицы  и  selection у ячейки в стоиибоарде - для красоты и у лейбел поставить Autoshrink фона minimum font scale - 0.5 = 50%
    //ЛЕКЦИЯ 56  17 минута Нужно задать идентифайр ячейки в стори борд нашей ячейке categoryCell потом создаем класс во View
    // CategoryCell.swift и указываем нашей ячейке этот класс в стори боард
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //**При каждом скроле, как только ячейка уходит с экрана, она помечается на повторное использование, и новые данные записываются в нее. То есть, тебе приходит ответ с сети на 12 постов. А на экран у тебя помещается только 3. Вот чтобы в памяти тебе не держать все 12 ячеек, создается только (если не ошибаюсь 5), и когда ты скролишь, в них просто перезаписывается информация.**//
        
        //задаем переменную ячейки и указываем ее индентификатор categoryCell указываем индексПаф
        // и говорим что кастим данные из as? класса CategoryCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            //когда инициализировали переменную cell можем присовить ей данные из нашей DataSet.swift
            //categories и берем значение row
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
        
    }
    
    //высота ячейки метод взят из делагата UITableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //действие при нажатии на ячейку didSelectRowAt метод взят из делегата UITableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //прописывем какие данные будут относиться к подготовке нашего сигвея и передаваться
        //данные будут браться из нашей Даты которые прописаны в DataSet.swift
        categoryToPass = data.categories[indexPath.row].title
        //указываем по какому сегвею перейти указав идентификатор сегвея
        performSegue(withIdentifier: "toRecipesSelection", sender: self)
    
    }
    
    
    //подготовка сегвея к передачи данных с указаннием к каждой ячейки какие данные брать
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionVC {
            recipesVC.selectedCategory = categoryToPass
        }
    }
    

}

