//
//  EmployeeTableViewCell.swift
//  EmpManagementSystemCoreData
//
//  Created by Ritika Verma on 08/09/21.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var empNameLabel: UILabel!
    @IBOutlet weak var empIDLabel: UILabel!
    @IBOutlet weak var empDepartmentLabel: UILabel!
    @IBOutlet weak var empPhoneNumLabel: UILabel!
    @IBOutlet weak var empSalaryLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.employeeImage.clipsToBounds = true
        self.employeeImage.layer.cornerRadius = 45

    }

//    func configureItem(myData : Employee?) {
//        guard let data = myData else {
//            return
//        }
//        if data.img != nil {
//            employeeImage.image = UIImage(data: data.img!)
//        }
//        empNameLabel.text = "\(data.firstname!) \(data.lastname!)"
//        empIDLabel.text = data.id
//        empPhoneNumLabel.text = data.phonenumber
//        empDepartmentLabel.text = data.department
//        empSalaryLabel.text = data.salary
//    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
