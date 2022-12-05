//
//  FollowersAndFollowingsViewController.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import UIKit

class FollowersAndFollowingsViewController: UIViewController {

    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var viewModel: FollowerAndFollowingViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        loadData()
        
    }
    
    @IBAction func back(_ sender: Any) {
        viewModel.goToPreviousScreen()
    }
    
    
    private func setupUI() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func loadData(){
        
        self.viewModel.callService(completionHandler:  { [weak self] (message, success) in
            if success {
                self?.indicatorView.isHidden = true
                self?.tableView.reloadData()
                
            } else {
                self?.showAlert("An error occured while processing your request", dismissed: {[weak self] (dismiss) in
                    self?.viewModel.goToPreviousScreen()
                })
            }
            
        })
    }

}

extension FollowersAndFollowingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowersAndFollowingsTableViewCell", for: indexPath) as? FollowersAndFollowingsTableViewCell, let userData = self.viewModel.getUser(index: indexPath.row) else {
            return
        }
        viewModel.goToProfileSearch(username: userData.login!)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastElement = viewModel.numberOrRows() - 1
        if !viewModel.isFetchInProgress && !viewModel.isEndOfList && indexPath.row == lastElement {
        
            loadData()
        }
    }
}

extension FollowersAndFollowingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOrRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowersAndFollowingsTableViewCell", for: indexPath) as? FollowersAndFollowingsTableViewCell, let userData = self.viewModel.getUser(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setUserData(userData: userData)
        return cell
    }
    
    
}

