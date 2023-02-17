//
//  iTuneCell.swift
//  iTuneDemo
//
//  Created by Arnav Singhal on 17/02/23.
//

import Foundation
import UIKit

class iTuneCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init method failed")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(_ artist: AdeleResult) {
                
        // Title
        titleLabel.text = artist.artistName
        contentView.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
//        // Subtitle
//        subTitleLabel.text = artist.collectionName
//        contentView.addSubview(subTitleLabel)
//        subTitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
//        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
//        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
//
//        // Desc
//        descLabel.text = iTune.longDescription
//        contentView.addSubview(descLabel)
//        descLabel.widthAnchor.constraint(equalTo: subTitleLabel.widthAnchor).isActive = true
//        descLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor).isActive = true
//        descLabel.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor).isActive = true
        
        contentView.backgroundColor = .systemGray
        
    }
}
