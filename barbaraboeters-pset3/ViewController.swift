//
//  ViewController.swift
//  barbaraboeters-pset3
//
//  Created by Barbara Boeters on 14-11-16.
//  Copyright © 2016 Barbara Boeters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func searchApi(_ sender: Any) {
        if userInput.text != "" {
            var searchInput = userInput.text!.replacingOccurrences(of: " ", with: "+")

            let myUrl = URL(string: "https://www.omdbapi.com/?t="+searchInput+"&y=&plot=short&r=json")
            var request = URLRequest(url:myUrl!)
            // print(request)
            URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                // Guards execute when the condition is NOT met
                guard let data = data, error == nil else {
                    // Error handling: what does the user expect when this fails?
                    print("error while ")
                    return
                }
                do {
                    // Convert data to JSON. You will need to do-catch code for this part
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                        print(json)
                        // Check if the respons is true (was the movie found? what to do if not?
                        // print(json.description)
                        // if json.value(forKey: "Response") as! String = "True" {
                        // return
                        // } else {
                        // print("this movie does not exist")
                        // }
                        // Get access to the main thread and the interface elements:
                        DispatchQueue.main.async {
                            // print(json.value(forKey: "imdbRating"))
                            
                            self.label.text = json.value(forKey: "imdbRating") as! String
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
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

