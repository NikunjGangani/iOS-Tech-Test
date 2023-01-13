//
//  FruitListViewController.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import UIKit
import Combine

class FruitListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.registerCell(ofType: FruitCell.self)
            tableView?.addSubview(refreshControl)
        }
    }
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var viewModel: FruitViewModel!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                                    #selector(refresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
        return refreshControl
    }()
    private var cancellable: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupBinders()
        getFruitsAPI()
    }
}

// MARK: - Helper Methods
extension FruitListViewController {
    private func setupData() {
        self.title = Title.fruits
    }
    
    private func setupBinders() {
        viewModel = FruitViewModel(manager: ServiceManager())
        viewModel.$fruitList.sink { [weak self] (list) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.stopIndicator()
                self.tableView?.reloadData()
            }
        }.store(in: &cancellable)
        
        viewModel.$message.sink { message in
            DispatchQueue.main.async {
                self.stopIndicator()
            }
            print("\(message)")
        }.store(in: &cancellable)
    }
    
    func getFruitsAPI() {
        startIndicator()
        viewModel.getFruitsList()
    }
    
    private func startIndicator() {
        displayAnimatedActivityIndicatorView()
    }
    
    private func stopIndicator() {
        hideAnimatedActivityIndicatorView()
    }
}

// MARK: - Actions
extension FruitListViewController {
    @objc func refresh(_ sender: AnyObject) {
        getFruitsAPI()
    }
}

// MARK: - UITableView Delegate & UITableView DataSource methods
extension FruitListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FruitCell = tableView.dequeueCell(ofType: FruitCell.self)
        cell.fruit = viewModel.fruitList[indexPath.row]
        return cell
    }
}

