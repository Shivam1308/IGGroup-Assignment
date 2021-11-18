/**
 *  * *****************************************************************************
 *  * Filename: DetailsTableViewController.swift
 *  * Author  : Shivam Singh
 *  * Creation Date: 17/11/21
 *  * *
 *  * *****************************************************************************
 *  * Description:
 *  * This viewcontroller will show the API response using tableView
 *  *                                                                             *
 *  * *****************************************************************************
 */

import UIKit

class DetailsTableViewController: UIViewController {
    var detailsViewModel = DetailsViewModel()
    weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    
    // MARK: - View life cycle methods
    
    override func loadView() {
        super.loadView()
        self.addTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        self.addPullToRefresh()
        self.updateUI(pullRefresh: false)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Private functions
    
    private func configTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isHidden = true
    }
    
    private func addTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.separatorColor = .black
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        ])
        self.tableView = tableView
    }
    
    private func updateUI(pullRefresh: Bool) {
        DispatchQueue.main.async {
            ActivityIndicatorView.shared.showActivityIndicator(inView: self.view)
        }
        
        detailsViewModel.fetchDetails { [weak self] response in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch response {
                case .failure(let error):
                    if error.localizedDescription ==  NetworkError.alertMessage {
                        self.showAlert(strError: error.localizedDescription)
                    }
                    
                case .success:
                    self.updateNavTitle(strTitle: self.detailsViewModel.navigationTitle)
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                }
                
                if pullRefresh {
                    self.refreshControl.endRefreshing()
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delay) {
                        self.tableView.reloadData()
                    }
                }
                ActivityIndicatorView.shared.hideActivityIndicator()
            }
        }
    }
    
    private func updateNavTitle(strTitle: String) {
        navigationItem.title = nil
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        titleLabel.textColor = .black
        titleLabel.text = strTitle
        titleLabel.backgroundColor = .clear
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    private func addPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: Constants.pullToRefresh)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    private func showAlert(strError: String) {
        let alertController = UIAlertController(title: "", message: strError, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Selector methods
    
    @objc func refresh(_ sender: AnyObject) {
        self.updateUI(pullRefresh: true)
    }
    
    private func fetchImage(urlString: String, completion: @escaping(UIImage) -> Void) {
        DispatchQueue.main.async {
            ActivityIndicatorView.shared.showActivityIndicator(inView: self.view)
        }
        
        detailsViewModel.fetchImageData(urlString: urlString) { (imgData, error) in
            DispatchQueue.main.async {
                ActivityIndicatorView.shared.hideActivityIndicator()
                if error != nil && error?.localizedDescription == NetworkError.alertMessage {
                    self.showAlert(strError: error?.localizedDescription ?? "")
                }
                if let image = UIImage(data: imgData) {
                    completion(image)
                } else {
                    completion(UIImage(named: "placeholder") ?? UIImage())
                }
            }
        }
    }
}

extension DetailsTableViewController: UITableViewDataSource {
    // MARK: - UITableViewDataSource functions

    func numberOfSections(in tableView: UITableView) -> Int {
        return detailsViewModel.arrDetails.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return detailsViewModel.arrDetails.breakingNews?.count ?? 0
        case 1:
            return detailsViewModel.arrDetails.topNews?.count ?? 0
        case 2:
            return 0
        case 3:
            return detailsViewModel.arrDetails.dailyBriefings?.eu?.count ?? 0
        case 4:
            return detailsViewModel.arrDetails.dailyBriefings?.asia?.count ?? 0
        case 5:
            return detailsViewModel.arrDetails.dailyBriefings?.us?.count ?? 0
        case 6:
            return detailsViewModel.arrDetails.technicalAnalysis?.count ?? 0
        case 7:
            return detailsViewModel.arrDetails.specialReport?.count ?? 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return detailsViewModel.arrDetails.allCases[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? DetailsTableViewCell
        var value: DescriptionModel?
        switch indexPath.section {
        case 0:
            value = detailsViewModel.arrDetails.breakingNews?[indexPath.row]
        case 1:
            value = detailsViewModel.arrDetails.topNews?[indexPath.row]
        case 2:
            value = nil
        case 3:
            value = detailsViewModel.arrDetails.dailyBriefings?.eu?[indexPath.row]
        case 4:
            value = detailsViewModel.arrDetails.dailyBriefings?.asia?[indexPath.row]
        case 5:
            value = detailsViewModel.arrDetails.dailyBriefings?.us?[indexPath.row]
        case 6:
            value = detailsViewModel.arrDetails.technicalAnalysis?[indexPath.row]
        case 7:
            value = detailsViewModel.arrDetails.specialReport?[indexPath.row]
        default:
            value = nil
        }
        if let description = value {
            cell?.titleLabel.text = description.title
            cell?.subTitleLabel.text = description.description

            let authorsArray = description.authors?.compactMap { $0.name }
            let authorText = authorsArray?.reduce("") { $0 + $1} ?? ""
            cell?.authorLabel.text = "Authors: \(authorText)"
            self.fetchImage(urlString: description.headlineImageUrl ?? "", completion: { (img) in
                DispatchQueue.main.async {
                    cell?.imgView.image = img
                }
            })
        }
        return cell ?? DetailsTableViewCell()
    }
}

extension DetailsTableViewController: UITableViewDelegate {
    // MARK: - UITableViewDelegate functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
