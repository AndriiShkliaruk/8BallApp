//
//  SettingsViewController.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 15.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    private let cellIdentifier = "answerCell"
    private let tableView = UITableView()
    var viewModel: SettingsViewModel
    let coordinator: MainCoordinator
    
    init(viewModel: SettingsViewModel, coordinator: MainCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    
    override func loadView() {
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.saveAnswers()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = viewModel.constants.titleText
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationItem.backBarButtonItem?.tintColor = .gray
    }
    
    
    // MARK: - User interaction methods
    
    @objc func addBarButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: viewModel.constants.alertTitleText, message: nil, preferredStyle: .alert)
        alert.addTextField { answerTextField in
            answerTextField.placeholder = self.viewModel.constants.alertPlaceholderText
        }
        let action = UIAlertAction(title: viewModel.constants.alertActionText, style: .default) { _ in
            guard let answer = alert.textFields?.first?.text else { return }
            self.viewModel.answers.append(answer)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStylefor: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if editingStylefor == .delete, index < viewModel.answers.count {
            viewModel.answers.remove(at: index)
            tableView.reloadData()
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.answers[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
}
