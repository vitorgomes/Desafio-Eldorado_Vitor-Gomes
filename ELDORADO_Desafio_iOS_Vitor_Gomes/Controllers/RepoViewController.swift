//
//  RepoViewController.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import UIKit
import CoreData

class RepoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Variables and Constants
    
    private var pullListVM: PullListViewModel!
    
    var receivedOwner: String = ""
    var receivedName: String = ""
    var receivedID: Int = 0
    var receivedForks: Int = 0
    var receivedWatchers: Int = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var repoNameLb: UILabel!
    @IBOutlet weak var repoIDLb: UILabel!
    @IBOutlet weak var repoOwnerLb: UILabel!
    @IBOutlet weak var repoForksLb: UILabel!
    @IBOutlet weak var repoWatchersLb: UILabel!
    @IBOutlet weak var repoPullsTv: UITableView!
    @IBOutlet weak var saveRemoveBt: UIBarButtonItem!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repoPullsTv.dataSource = self
        repoPullsTv.delegate = self
        
        repoNameLb.text = receivedName
        repoIDLb.text = "\(receivedID)"
        repoOwnerLb.text = receivedOwner
        repoForksLb.text = "\(receivedForks)"
        repoWatchersLb.text = "\(receivedWatchers)"
        
        setup()
    }
    
    // MARK: - Functions
    
    private func setup() {
        
        let url = URL(string: "http://api.github.com/repos/\(receivedOwner)/\(receivedName)/pulls")! // Treat better
        
        Webservices().getPulls(url: url) { pulls in
            
            if  let pulls = pulls {
                self.pullListVM = PullListViewModel(pulls: pulls)

                DispatchQueue.main.async {
                    self.repoPullsTv.reloadData()
                }
            }
            
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func saveRemove(_ sender: UIBarButtonItem) {
        
        // Need to be checked
        pullListVM.name = repoNameLb.text!
        pullListVM.id = Int(repoIDLb.text!)!
        pullListVM.owner = repoOwnerLb.text!
        pullListVM.forks = Int(repoForksLb.text!)!
        pullListVM.watchers = Int(repoWatchersLb.text!)!
        
        pullListVM.save()
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TablewView methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.pullListVM == nil ? 0 : self.pullListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pullListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = repoPullsTv.dequeueReusableCell(withIdentifier: "pullsCell", for: indexPath) as UITableViewCell
        
        let pullVM = self.pullListVM.pullAtIndex(indexPath.row)
        
        cell.textLabel?.text = pullVM.title
        
        return cell
        
    }
    
}
