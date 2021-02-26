//
//  ViewController.swift
//  TestNASAClient
//
//  Created by Raghu, Reshma L on 26/02/21.
//

import UIKit
import NASAImageLibrary

class ViewController: UITableViewController {

    var imageModels: [ImageModel]?
    var indexOfSelectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self,
                             forCellReuseIdentifier: "Cell")
        NASAImageLibraryClient.fetchImageCollection(keyword: "moon", page: 1) { (imageModels, error) in
            self.imageModels = imageModels
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageModels?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
              tableView.dequeueReusableCell(withIdentifier: "customCell",
                                            for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.index.text = String(indexPath.row)
        cell.imageTitle.text = imageModels?[indexPath.row].title
        cell.date.text = imageModels?[indexPath.row].date_created
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexOfSelectedRow = indexPath.row
        self.performSegue(withIdentifier: "showImage", sender: self)
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let imageVC = segue.destination as? ImageViewController {
            imageVC.imageModel = self.imageModels![indexOfSelectedRow!]
        }
    }
}
