//
//  ViewController.swift
//  iOS_18_Lab07
//
//  Created by Gianni Savini on 07/06/18.
//  Copyright © 2018 Gianni Savini. All rights reserved.
//

import UIKit

// http://demoweb.labinfo.net/univ/utenti.php

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var users : [Utente] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let url = URL(string: "http://demoweb.labinfo.net/univ/utenti.php")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { [unowned self](data, response, error) in
            
            if let errore = error {
                // visualizzo messaggio di errore
                
                return
            }
            
    }
}


}

