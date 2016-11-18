//
//  SecondViewController.swift
//  barbaraboeters-pset3
//
//  Created by Barbara Boeters on 18-11-16.
//  Copyright © 2016 Barbara Boeters. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let movies = ["godfather", "hallo", "doei"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        cell.title.text = movies[indexPath.row]
        
        // for the description
//        if let description = descriptions[movies[indexPath.row]] {
//            cell.movies.text = description
//        } else {
//            cell.year.text = ""
//        }

        // for the image
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
