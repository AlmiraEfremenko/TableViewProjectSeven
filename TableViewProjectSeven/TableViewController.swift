//
//  ViewController.swift
//  TableViewProjectSeven
//
//  Created by MAC on 12.08.2021.
//

import UIKit

enum CellType {
    case tableViewCell
    case switchViewCell
    case arrowWithTextViewCell
}

struct ModelCell {
    let type: CellType
    let label: String
    var icon: UIImage
    var labelDescription: String? = nil
}

class TableViewController: UIViewController {
    
    // MARK: - Property
    
    var data = [
        
        "Section0":  [ModelCell(
                        type: .switchViewCell,
                        label: "Авиарежим",
                        icon: UIImage(systemName: "airplane")?.withTintColor(.orange, renderingMode: .alwaysOriginal) ?? .add),
                       
                       ModelCell(
                        type: .arrowWithTextViewCell,
                        label: "Wi-Fi",
                        icon: UIImage(systemName: "wifi")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add,
                        labelDescription: "Не беспокоить"),
                       
                       ModelCell(
                        type: .arrowWithTextViewCell,
                        label: "Bluetooth",
                        icon: UIImage(named: "icons8-блютуз-24")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add,
                        labelDescription: "Выкл."),
                       
                       ModelCell(
                        type: .tableViewCell,
                        label: "Сотовая связь",
                        icon: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withTintColor(.green, renderingMode: .alwaysOriginal) ?? .add),
                       
                       ModelCell(
                        type: .tableViewCell,
                        label: "Режим модема",
                        icon: UIImage(systemName: "link")?.withTintColor(.green, renderingMode: .alwaysOriginal) ?? .add),
                       
                       ModelCell(
                        type: .switchViewCell,
                        label: "VPN",
                        icon: UIImage(systemName: "arrow.right.arrow.left.circle")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add)],
        
        "Section1": [ModelCell(
                        type: .tableViewCell,
                        label: "Уведомления",
                        icon: UIImage(systemName: "bubble.left.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Звуки,тактильные сигналы",
                        icon: UIImage(systemName: "speaker.3.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Не беспокоить",
                        icon: UIImage(systemName: "moon.fill")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Экранное время",
                        icon: UIImage(systemName: "hourglass")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add)],
        
        "Section2": [ModelCell(
                        type: .tableViewCell,
                        label: "Основные",
                        icon: UIImage(systemName: "gear")?.withTintColor(.gray, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Пункт управления",
                        icon: UIImage(systemName: "switch.2")?.withTintColor(.gray, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Экран и яркость",
                        icon: UIImage(systemName: "rays")?.withTintColor(.purple, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Экран Домой",
                        icon: UIImage(systemName: "textformat.size")?.withTintColor(.purple, renderingMode: .alwaysOriginal) ?? .add),
                      
                      ModelCell(
                        type: .tableViewCell,
                        label: "Универсальный доступ",
                        icon: UIImage(systemName: "person.crop.square.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal) ?? .add)]
    ]
    
    private lazy var tableView: UITableView = {
        
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.register(SwitchViewCell.self, forCellReuseIdentifier: SwitchViewCell.identifier)
        tableView.register(ArrowWithTextViewCell.self, forCellReuseIdentifier: ArrowWithTextViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Lifecycle
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Amount Section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.keys.count
    }
    
    // MARK: - Amount Cell in Section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data["Section\(section)"]?.count ?? 0
    }
    
    // MARK: View Cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = data["Section\(indexPath.section)"]?[indexPath.row] else { return UITableViewCell() }
        switch data.type {
        case .tableViewCell:
            return setupTableViewCell(for: indexPath, with: data)
        case .arrowWithTextViewCell:
            return setupArrowWithTextViewCell(for: indexPath, with: data)
        case .switchViewCell:
            return setupSwitchViewCell(for: indexPath, with: data)
        }
    }
    
    func setupTableViewCell(for indexPath: IndexPath, with data: ModelCell) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.label.text = data.label
        cell.imageView?.image = data.icon
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func setupArrowWithTextViewCell(for indexPath: IndexPath, with data: ModelCell) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArrowWithTextViewCell.identifier, for: indexPath) as? ArrowWithTextViewCell else { return UITableViewCell() }
        cell.label.text = data.label
        cell.imageView?.image = data.icon
        cell.labelDescription.text = data.labelDescription
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func setupSwitchViewCell(for indexPath: IndexPath, with data: ModelCell) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchViewCell.identifier, for: indexPath) as? SwitchViewCell else { return UITableViewCell() }
        cell.label.text = data.label
        cell.imageView?.image = data.icon
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        print("Нажата ячейка \(data["Section\(indexPath.section)"]?[indexPath.row].label ?? "Отсутствует значение")")
            tableView.deselectRow(at: indexPath, animated: true)
        }
}

