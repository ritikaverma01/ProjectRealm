//
//  EmployeeListViewController.swift
//  EmpManagementSystemCoreData
//
//  Created by Ritika Verma on 08/09/21.
//

import UIKit

class EmployeeListViewController: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
//        employeeTableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEmpBtnTapped))
    }
    
    @objc func addEmpBtnTapped(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AddVC = storyboard.instantiateViewController(withIdentifier: "AddEmployeeViewController") as! AddEmployeeViewController
        AddVC.isUpdate = false
//        AddVC.delegate = self
        self.navigationController?.pushViewController(AddVC, animated: true)
    }
    
}
//
//
//extension EmployeeListViewController: UITableViewDataSource, UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return employeeData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
//        cell.configureItem(myData: employeeData[indexPath.row])
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let edit = UIContextualAction(style: .normal, title: "Edit"){ _, _, _ in
//            self.editBtnTapped(index:indexPath.row)
//        }
//
//        let delete = UIContextualAction(style: .destructive, title: "Delete"){ _, _, _ in
//            self.employeeData = DatabaseHelper.sharedInstance.deleteEmployeeData(index: indexPath.row)
//            self.employeeTableView.reloadData()
////            self.employeeTableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        let swipeConfig = UISwipeActionsConfiguration(actions: [delete, edit])
//        return swipeConfig
//    }
//
//    func editBtnTapped(index:Int) {
//        print("edit button tapped")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let AddVC = storyboard.instantiateViewController(withIdentifier: "AddEmployeeViewController") as! AddEmployeeViewController
//        AddVC.isUpdate = true
//        AddVC.empIndex = index
//        AddVC.configureData(data : self.employeeData[index])
//        AddVC.delegate = self
//        self.navigationController?.pushViewController(AddVC, animated: true)
//    }
//
//}
//
//
//extension EmployeeListViewController: AddEmployeeViewControllerProtocol {
//
//    func updateTableView() {
//        employeeData = DatabaseHelper.sharedInstance.getEmployeeData()
//        employeeTableView.reloadData()
//    }
//
//}
