//
//  CartItemTableViewCell.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 6/10/21.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {

    
    //MARK:- Views
    lazy var itemThumbImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "shopping-bag")
        return imageView
    }()
    
    lazy var manufacturerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var itemCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var increaseCountButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    lazy var decreaseCountButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    lazy var countStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [decreaseCountButton, itemCountLabel, increaseCountButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var countContainerView: UIView = {
        let view = UIView()
        view.addSubview(countStackView)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        return view
    }()
    
    lazy var deleteButton: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "bin"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .groupTableViewBackground
        return view
    }()
    
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    //MARK:- UI & Constraints
    func setupUI(){
        self.contentView.addSubview(itemThumbImageView)
        self.contentView.addSubview(itemNameLabel)
        self.contentView.addSubview(manufacturerNameLabel)
        self.contentView.addSubview(itemPriceLabel)
        self.contentView.addSubview(deleteButton)
        self.contentView.addSubview(countContainerView)
        self.contentView.addSubview(seperatorView)


        itemThumbImageView.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
            make.width.equalTo(itemThumbImageView.snp.height).multipliedBy(0.5)
            make.leading.equalToSuperview().inset(30)
        })
        
        itemThumbImageView.snp.makeConstraints({ make in
            make.width.equalTo(itemThumbImageView.snp.height).multipliedBy(0.5)
        })
        
        increaseCountButton.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        
        countStackView.snp.makeConstraints({ make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(4)
        })
        
        countContainerView.snp.makeConstraints({ make in
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(98)
        })
        
        manufacturerNameLabel.snp.makeConstraints({ make in
            make.top.equalTo(itemThumbImageView.snp.top)
            make.leading.equalTo(itemThumbImageView.snp.trailing).inset(-10)
            make.trailing.greaterThanOrEqualTo(countContainerView.snp.leading).inset(5)
        })
        
        itemPriceLabel.snp.makeConstraints({ make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(manufacturerNameLabel.snp.leading)
            make.trailing.greaterThanOrEqualTo(countContainerView.snp.leading).inset(5)
        })
        
        itemNameLabel.snp.makeConstraints({ make in
            make.top.equalTo(manufacturerNameLabel.snp.bottom).inset(-4)
            make.leading.equalTo(manufacturerNameLabel.snp.leading)
            make.trailing.lessThanOrEqualTo(countContainerView.snp.leading).inset(-5)
            make.bottom.greaterThanOrEqualTo(itemPriceLabel.snp.top).inset(-15)
        })
     
        deleteButton.snp.makeConstraints({make in
            make.trailing.equalTo(countContainerView.snp.trailing)
            make.top.equalTo(itemThumbImageView.snp.top)
            make.width.height.equalTo(25)
        })
        
        seperatorView.snp.makeConstraints({ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1.5)
        })
    }
    
    
    

}
