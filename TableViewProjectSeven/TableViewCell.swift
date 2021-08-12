//
//  TableViewCell.swift
//  TableViewProjectSeven
//
//  Created by MAC on 12.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var icon: UIImageView = {
        var icon = UIImageView()
        return icon
    }()
       
    // MARK: Initinal
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Settings
    
    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(icon)
    }
    
    // MARK: Lifecycle
    
    private func setupLayout() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

