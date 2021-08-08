//
//  HomeViewController.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var repositoryListVM: RepositoryListViewModel!
    
    @IBOutlet weak var repoSc: UISegmentedControl!
    @IBOutlet weak var repoTv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repoTv.dataSource = self
        repoTv.delegate = self
        
        setup()
    }
    
    @IBAction func changeList(_ sender: UISegmentedControl) {
        
        if repoSc.selectedSegmentIndex == 0 {
            // Repo List
        } else {
            // Saved Repo
        }
        
    }
    
    private func setup() {
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars")! // Treat better!!!
        
        Webservices().getRepositories(url: url) { repositories in
            
            if  let repositories = repositories {
                self.repositoryListVM = RepositoryListViewModel(repositories: repositories)

                DispatchQueue.main.async {
                    self.repoTv.reloadData()
                }
            }
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.repositoryListVM == nil ? 0 : self.repositoryListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoryListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = repoTv.dequeueReusableCell(withIdentifier: "repositoriesCell", for: indexPath) as UITableViewCell
        
        let repoVM = self.repositoryListVM.repositoryAtIndex(indexPath.row)
        
        cell.textLabel?.text = repoVM.name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}
