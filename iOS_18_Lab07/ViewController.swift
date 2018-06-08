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
            do {
                // converto i dati ricevuti in oggetto
                let object = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                let dictionary = object as? [Utente:Any]
                
                // leggo il parametro "data" e faccio il cast ad array
                let dati = dictionary!["data"] as? Array<[String:Any]>
                self.lista = dati ?? []
                
                DispatchQueue.main.async {
                    // effettuo il caricamento della tabella nel thread main
                    // self.tableView.reloadData()
                }
            }
            catch {
                DispatchQueue.main.async {
                    // visualizzazio il messaggio di errore nel thread main
                    let alert = UIAlertController(title: "Errore", message: "Errore nel caricamento dei dati", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        task.resume()
            
    }
}




