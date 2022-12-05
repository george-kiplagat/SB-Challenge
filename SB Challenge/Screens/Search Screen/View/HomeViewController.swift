//
//  HomeViewController.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var recentSearchesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        viewModel.fetchRecentSearches()
        self.tableView.reloadData()
    }
    
    func initView(){
        
        self.searchButton.layer.cornerRadius = self.searchButton.frame.height/2
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchTF.delegate = self
    }
    
    
    @IBAction func searchPressed(_ sender: Any) {
   
        if (self.searchTF.text!.isEmpty){
            searchTF.shake()
        } else {
            
            viewModel.checkConnection(username: self.searchTF.text!, completionHandler: {[weak self] (success, message) in
                
                if (!success){
                    self?.showAlert(message!, dismissed: nil)
                }
            })
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows = viewModel.numberOrRows()
        
        if (numberOfRows == 0) {
            self.recentSearchesLabel.isHidden = true
        } else {
            self.recentSearchesLabel.isHidden = false
        }
        
        return numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell, let userData = self.viewModel.getUserDetails(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setUserData(userData: userData)
        return cell
    }
    
}
    
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell, let userData = self.viewModel.getUserDetails(index: indexPath.row) else {
            return
        }
        viewModel.goToProfile(username: userData.login!)
    }
}


