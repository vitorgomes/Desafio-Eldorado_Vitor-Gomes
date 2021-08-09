//
//  HomeViewController.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import UIKit

//protocol HomeViewControllerDelegate {
//    func homeViewControllerDidSelect(repository: Item, controller: UIViewController)
//}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Variables and Constants
    
    private var repositoryListVM: RepositoryListViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet weak var repoSc: UISegmentedControl!
    @IBOutlet weak var repoTv: UITableView!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repoTv.dataSource = self
        repoTv.delegate = self
        
        setup()
    }
    
    // MARK: - Actions
    
    @IBAction func changeList(_ sender: UISegmentedControl) {
        
        if repoSc.selectedSegmentIndex == 0 {
            // Repo List
        } else {
            // Saved Repo
        }
        
    }
    
    // MARK: - Functions
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let navC = segue.destination as? UINavigationController, let repoViewController = navC.viewControllers.first as? RepoViewController {
            
            let indexPath = repoTv.indexPathForSelectedRow?.row
            let sendingRepo = self.repositoryListVM.repositoryAtIndex(indexPath!)
            
            navC.modalPresentationStyle = .fullScreen
            
            repoViewController.receivedID = sendingRepo.id
            repoViewController.receivedName = sendingRepo.name
            repoViewController.receivedOwner = sendingRepo.owner
            repoViewController.receivedForks = sendingRepo.forks
            repoViewController.receivedWatchers = sendingRepo.watchers
        }
        
    }
    
    // MARK: - TableView methods
    
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
        repoTv.deselectRow(at: indexPath, animated: true)
    }
    
}
