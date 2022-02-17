//
//  SettingsViewController.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 15.01.2022.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var answers = [String]()
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    
    override func loadView() {
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "answerCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        answers = StoredAnswers.load()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        StoredAnswers.save(answers)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Settings"
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationItem.backBarButtonItem?.tintColor = .gray
    }
    
    
    //MARK: - Table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
        if !answers.isEmpty {
            var content = cell.defaultContentConfiguration()
            content.text = answers[indexPath.row]
            cell.contentConfiguration = content
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStylefor: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if editingStylefor == .delete, index < answers.count {
            answers.remove(at: index)
            tableView.reloadData()
        }
    }
    
    
    // MARK: - User interaction methods
    
    @objc func addBarButtonTapped(_ sender:UIButton!) {
        let alert = UIAlertController(title: "Add answer", message: nil, preferredStyle: .alert)
        alert.addTextField { answerTextField in
            answerTextField.placeholder = "Enter answer"
        }
        let action = UIAlertAction(title: "Add", style: .default) { _ in
            guard let answer = alert.textFields?.first?.text else { return }
            self.answers.append(answer)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
}
