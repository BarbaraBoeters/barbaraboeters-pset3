//
//  SecondViewController.swift
//  barbaraboeters-pset3
//
//  Created by Barbara Boeters on 18-11-16.
//  Copyright © 2016 Barbara Boeters. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userInput: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [String: String]()
    var name = [String]()
    var year = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Wanner je op 'search' klikt dan wordt de request pas uitgevoerd
    @IBAction func searchMovie(_ sender: Any) {
        if userInput.text != "" {
            var searchInput = userInput.text!.replacingOccurrences(of: " ", with: "+")
            print(searchInput)
            
            let myUrl = URL(string: "https://www.omdbapi.com/?t="+searchInput+"&y=&plot=short&r=json")
            
            var request = URLRequest(url:myUrl!)
            print(request)
            
            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                // Guards execute when the condition is NOT met
                guard let data = data, error == nil else {
                    
                    // Error handling: what does the user expect when this fails?
                    print("error getting the data ")
                    return
                }
                do {
                    // Convert data to JSON. You will need to do-catch code for this part
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                        print(json)
                        
                        // Get access to the main thread and the interface elements:
                        DispatchQueue.main.async {
                            // print(json.value(forKey: "imdbRating"))
                            
                            // self.label.text = json.value(forKey: "imdbRating") as! String
                            self.movies = json as! [String: String]
                            self.name.append(json["Title"] as! String)
                            print(self.name)
                            print(self.movies)
                            
                            self.tableView.reloadData()
                        }
                    } else {
                        print("couldn't convert data to JSON")
                        return
                    }
                } catch {
                    // Error handling what does the user expect when this fails?
                    print("Error trying to convert data to JSON")
                }
            }).resume()
            tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellSearch
        // Bij deze regel code gaat het mis!
        // cell.title?.text = self.name[indexPath.row]
        
        // print(movies[indexPath.row])
        
        // for the description (from demo)
//        if let description = descriptions[movies[indexPath.row]] {
//            cell.movies.text = description
//        } else {
//            cell.year.text = ""
//        }

        // for the image (from demo)
//        if let image = UIImage(named: movies[indexPath.row]) {
//            cell.poster.image = image
//        }
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
