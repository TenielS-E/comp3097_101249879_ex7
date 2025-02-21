//
//  ViewController.swift
//  LabExercise7
//
//  Created by Teniel Smith-Edwards on 2025-02-21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var numText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var ttable: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func generateTable(_ sender: UIButton) {
        guard let input = numText.text, let num = Int(input) else {return }
        
        ttable = (1...10).map {"\(num * $0)"}
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ttable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timesCell", for: indexPath)
        
        let ans = ttable[indexPath.row]
        cell.textLabel?.text = ans
        
        return cell
    }

}

