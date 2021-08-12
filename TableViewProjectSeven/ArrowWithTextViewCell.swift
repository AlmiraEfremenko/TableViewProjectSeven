//
//  ArrowWithTextViewCell.swift
//  TableViewProjectSeven
//
//  Created by MAC on 12.08.2021.
//

import UIKit

 class ArrowWithTextViewCell: UITableViewCell {
    
    static let identifier = "ArrowWithTextViewCell"
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var icon: UIImageView = {
        var icon = UIImageView()
        return icon
    }()
    
    var labelDescription: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 17.0)
        return label
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
        contentView.addSubview(labelDescription)
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
        
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        labelDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
 }


