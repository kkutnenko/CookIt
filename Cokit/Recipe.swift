class Recipe {
  var title: String
  var steps: [String]
  var imageUrl: String
  
  init(title: String, steps: [String], imageUrl: String){
    self.title = title
    self.steps = steps
    self.imageUrl = imageUrl
  }
}
