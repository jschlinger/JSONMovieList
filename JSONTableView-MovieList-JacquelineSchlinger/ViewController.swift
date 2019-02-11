//
//  ViewController.swift
//  JSONTableView-MovieList-JacquelineSchlinger
//
//  Created by Jackie Schlinger on 11/29/18.
//  Copyright © 2018 Jacqueline Schlinger. All rights reserved.
//

import UIKit

struct Movie: Decodable {
    let MOVIENAME: String
    let DIRECTORNAME: String
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell")
        myCell?.textLabel?.text = movie[indexPath.row].MOVIENAME
        myCell?.detailTextLabel?.text = String(movie[indexPath.row].DIRECTORNAME)
        
        return myCell!
    }
    

    
    
    
    
    
    var movie = [Movie]()
    
    @IBOutlet weak var movieTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        //construct a path to the file
        let path = Bundle.main.path(forResource: "movie", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            self.movie = try
                JSONDecoder().decode([Movie].self, from: data)
        }
        
        catch {
            print("JSON Error.")
        }
    }


}

