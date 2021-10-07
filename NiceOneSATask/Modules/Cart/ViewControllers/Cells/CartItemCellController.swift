//
//  CartItemCellController.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 7/10/21.
//

import Foundation
import GenericCellControllers
import Kingfisher

class CartItemCellController: GenericCellController<CartItemTableViewCell> {

    //MARK:- Variables
    private let product: Product
    private let viewModel: CartViewModel?

    //MARK:- Init
    init(product: Product,
         viewModel: CartViewModel?) {
        self.product = product
        self.viewModel = viewModel
    }

    
    //MARK:- Data Configuration
    override func configureCell(_ cell: CartItemTableViewCell) {
        cell.setupUI()
        if let imgURL = URL(string: String((product.thumb.split(separator: " ").first) ?? "")){
            // Coudln't fetch the images because images are uploaded to AWS and I don't have the credentials to access them
            //cell.itemThumbImageView.kf.setImage(with: imgURL)
        }
        cell.itemNameLabel.text = product.name
        cell.manufacturerNameLabel.text = product.manufacturerName
        cell.itemPriceLabel.text = product.totalPriceString
        cell.itemCountLabel.text = product.quantity
        cell.increaseCountButton.addTarget(self, action: #selector(didPressAddItem), for: .touchUpInside)
    }

    
    //MARK:- Actions
    @objc func didPressAddItem(_ sender: UIButton){
        viewModel?.addProduct(withID: product.id)
    }
    
    


}
