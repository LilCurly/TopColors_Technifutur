//
//  ViewController.swift
//  TopColors
//
//  Created by Roman Muzikantov on 10/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mErrorLabel: UILabel!
    @IBOutlet weak var mIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var mTitleLabel: UILabel!
    
    var colors = [Color]()
    
    let manager = ColorsManager(api: ColorsApiImpl())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        retrieveColors()
    }
    
    func setupUI() {
        mIndicatorView.isHidden = true
        mErrorLabel.isHidden = true
        
        mTitleLabel.textColor = .black
        mTitleLabel.font = .montserratBold(18)
        mTitleLabel.text = "Top colors"
    }
    
    func setupTableView() {
        mTableView.delegate = self
        mTableView.dataSource = self
        
        mTableView.register(UINib(nibName: TitleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableViewCell.identifier)
        mTableView.register(UINib(nibName: ColorTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ColorTableViewCell.identifier)
        
        mTableView.separatorStyle = .none
    }
    
    func retrieveColors() {
        mIndicatorView.startAnimating()
        mIndicatorView.isHidden = false
        manager.getColors { (success, colors) in
            self.mIndicatorView.isHidden = true
            self.mIndicatorView.stopAnimating()
            if success && colors != nil {
                if colors!.isEmpty {
                    self.mErrorLabel.isHidden = false
                    self.mErrorLabel.text = "No colors has been found!"
                } else {
                    self.mErrorLabel.isHidden = true
                    self.colors = colors!
                    self.mTableView.reloadData()
                }
            } else {
                self.mErrorLabel.isHidden = false
                self.mErrorLabel.text = "An error occured!"
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let colorCell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.identifier, for: indexPath) as? ColorTableViewCell {
            colorCell.setupCell(self.colors[indexPath.row])
            cell = colorCell
        }
        cell.selectionStyle = .none
        return cell
    }
}

