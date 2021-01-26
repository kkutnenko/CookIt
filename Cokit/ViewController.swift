//
//  ViewController.swift
//  Cokit
//
//  Created by user190425 on 1/19/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let recipes = [
      Recipe(title: "Best Brownies", steps: ["Step 1","Step 2","Step 3"], imageUrl: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
      Recipe(title: "Chocolate Chip Cookies", steps: ["Step 1","Step 2","Step 3"], imageUrl: "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg"),
      Recipe(title: "Banana Bread", steps: ["Step 1","Step 2","Step 3"], imageUrl: "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg")
  ]

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
    let localRecipe = recipes[indexPath.row]
    cell.textLabel?.text = localRecipe.title
    
    guard let url = URL(string: localRecipe.imageUrl),
          let data = try? Data(contentsOf: url),
          let validImage = UIImage(data:data)
    else {
      print("error retrieving image from recipe image url")
      return cell
    }
    
    cell.imageView?.image = validImage
    //if let url = URL(string: localRecipe.imageUrl),
      // let data = try? Data(contentsOf: url) {
      // populate the imageView if Recipe.imageURL is in fact a URL that contains data
      //cell.imageView?.image = UIImage(data: data)
    //}
    
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? RecipeDetailViewController,
       let index = tableView.indexPathForSelectedRow?.row{
      destination.recipe = recipes[index]
      
    }
  }
}

