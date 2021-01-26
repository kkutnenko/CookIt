//
//  RecipeDetailViewController.swift
//  Cokit
//
//  Created by user190425 on 1/19/21.
//

import UIKit

class RecipeDetailViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource{
  
  
  
  @IBOutlet weak var localRecipeImage: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  var recipe: Recipe?
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.title = recipe?.title    
    tableView.delegate = self
    tableView.dataSource = self
    
    if let url = URL(string: recipe?.imageUrl ?? ""),
      let data = try? Data(contentsOf: url) {
      localRecipeImage.image = UIImage(data: data)
    }
    
    //guard let unWrappedRecipe = recipe,
         // guard let unWrappedCecipe = recipe,
                //let url = URL(string: unWrapped)
    
    }
  
 
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipe?.steps.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "recipeStepCell", for: indexPath)
    
    cell.textLabel?.text = recipe?.steps[indexPath.row]
    return cell
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
