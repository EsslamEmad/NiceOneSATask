//
//  CartViewController.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 6/10/21.
//

import UIKit
import SnapKit


class CartViewController: UIViewController {
    
    
    
    // MARK:- Views
    lazy var cartTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        CartItemCellController.registerCell(on: table)
        table.allowsSelection = false
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.tableFooterView = UIView()
        return table
    }()

    
    lazy var freeDeliveryFilledProgressBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 202/255, green: 40/255, blue: 232/255, alpha: 1.0)
        view.layer.cornerRadius = 3.5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var freeDeliveryEmptyProgressBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0)
        view.layer.cornerRadius = 3.5
        view.clipsToBounds = true
        view.addSubview(freeDeliveryFilledProgressBar)
        return view
    }()
    
    lazy var freeDeliveryTitleLabel: UILabel = {
       let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Want Free Shipping ? Add SR 50.00 more ", attributes: [
            .font: UIFont.systemFont(ofSize: 15, weight: .semibold),
          .foregroundColor: UIColor.black
        ])
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: NSRange(location: 19, length: 5))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 220/255, green: 0, blue: 240/255, alpha: 1.0), range: NSRange(location: 25, length: 8))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: NSRange(location: 34, length: 4))
        label.attributedText = attributedString
        return label
    }()
    
    lazy var headerStackView : UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [freeDeliveryTitleLabel, freeDeliveryEmptyProgressBar])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .groupTableViewBackground
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        indicator.hidesWhenStopped = true
        indicator.stopAnimating()
        return indicator
    }()
    
    
    //MARK:- Variables
    var viewModel: CartViewModel?
    var cellControllers: [CartItemCellController] = []
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        setupUI()
    }
    

    //MARK:- Setup and configuration
    func configureViewModel(){
        viewModel = CartViewModel(view: self)
    }
    
    func setupUI(){
        self.title = "Shopping bag"
        view.backgroundColor = .white

        view.addSubview(headerStackView)
        view.addSubview(seperatorView)
        view.addSubview(cartTableView)
        view.addSubview(activityIndicator)
        
        
        headerStackView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.trailing.equalToSuperview().inset(17)
            
        })
        
        freeDeliveryEmptyProgressBar.snp.makeConstraints({ make in
            make.height.equalTo(7)
            make.trailing.leading.equalToSuperview()
        })
        
        freeDeliveryFilledProgressBar.snp.makeConstraints({ make in
            make.width.equalToSuperview().multipliedBy(0.75)
            make.leading.height.centerY.equalToSuperview()
        })
        
        seperatorView.snp.makeConstraints({ make in
            make.top.equalTo(headerStackView.snp.bottom).inset(-14)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.5)
        })
        
        cartTableView.snp.makeConstraints({make in
            make.top.equalTo(seperatorView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        })
        
        activityIndicator.snp.makeConstraints({ make in
            make.centerX.centerY.equalToSuperview()
        })
        
    }
    
    
    //MARK:- Actions
    @objc func refreshCart(){
        viewModel?.getCart()
    }

}


//MARK:- ViewModel Delegate
extension CartViewController: CartViewModelDelegate{
    
    func cartDidUpdate() {
        
        cellControllers = []
        
        if let products = viewModel?.products{
            for product in products{
                cellControllers.append(CartItemCellController(product: product, viewModel: viewModel))
            }
        }
            
        cartTableView.reloadData()
    }
    
    func requestDidFailWith(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func isViewLoading(value: Bool){
        if value{ activityIndicator.startAnimating()}
        else{ activityIndicator.stopAnimating()}
    }
    
}

//MARK:- TableView Delegate and DataSource
extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cellControllers[indexPath.row].cellFromReusableCellHolder(cartTableView, forIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
