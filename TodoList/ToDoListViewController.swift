//
//  ViewController.swift
//  TodoList
//
//  Created by Shalini on 1/17/19.
//  Copyright © 2019 Shalini. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

	var itemArray = ["Find Mike", "Buy Eggs", "Destory Demo"]
	let defaults = UserDefaults.standard
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
			itemArray = items
		}
		
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemArray.count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
		cell.textLabel?.text = itemArray[indexPath.row]
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//print(itemArray[indexPath.row])
	
		if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
			tableView.cellForRow(at: indexPath)?.accessoryType = .none
		} else {
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		}
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
	@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
		
		var textField = UITextField()
	let alert = UIAlertController(title: "Add New ToDoList Item", message: "", preferredStyle: .alert)
		let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
		self.itemArray.append(textField.text!)
		self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
	self.tableView.reloadData()
		}
		alert.addTextField { (alertTextField) in
			
			alertTextField.placeholder = "Create New Item"
			textField = alertTextField
			
		}
		
			alert.addAction(action)
			present(alert, animated: true, completion: nil)
		}
	}
	


