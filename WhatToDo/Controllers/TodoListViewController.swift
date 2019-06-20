//
//  ViewController.swift
//  WhatToDo
//
//  Created by Alexander Reitz on 19.06.19.
//  Copyright © 2019 Alexander Reitz. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem : Item = Item()
        newItem.title = "Take trash out"
        itemArray.append(newItem)
        
        let newItem2 : Item = Item()
        newItem2.title = "Clean up flat"
        itemArray.append(newItem2)
        
        let newItem3 : Item = Item()
        newItem3.title = "Go shopping"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    //    MARK: Tableview Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //    MARK: TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected \(itemArray[indexPath.row])")
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //    MARK: Add new ToDo items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new ToDo", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Add item", style: .default) { (action) in
//            what happens if new item is pressed
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
//          save array to default store
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertText) in
            alertText.placeholder = "Create new item..."
            textField = alertText
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
}

