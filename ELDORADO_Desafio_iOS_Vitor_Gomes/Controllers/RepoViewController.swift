//
//  RepoViewController.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 07/08/21.
//

import UIKit

class RepoViewController: UIViewController {

    @IBOutlet weak var repoNameLb: UILabel!
    @IBOutlet weak var repoIDLb: UILabel!
    @IBOutlet weak var repoOwnerLb: UILabel!
    @IBOutlet weak var repoForksLb: UILabel!
    @IBOutlet weak var repoWatchersLb: UILabel!
    @IBOutlet weak var repoPullsTv: UITableView!
    @IBOutlet weak var saveRemoveBt: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
