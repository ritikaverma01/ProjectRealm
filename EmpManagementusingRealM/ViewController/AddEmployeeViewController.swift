//
//  AddEmployeeViewController.swift
//  EmpManagementSysCoreData
//
//  Created by Ritika Verma on 08/09/21.
//

import UIKit
import AVFoundation

class AddEmployeeViewController: UIViewController {
        
    @IBOutlet weak var empFirstNameTF: UITextField!
    @IBOutlet weak var empLastNameTF: UITextField!
    @IBOutlet weak var empIDTF: UITextField!
    @IBOutlet weak var empPhoneNumberTF: UITextField!
    @IBOutlet weak var empDepartmentTF: UITextField!
    @IBOutlet weak var empSalaryTF: UITextField!
    @IBOutlet weak var empBtn: UIButton!
    @IBOutlet weak var capturedImageView: UIImageView!
    let imagePickerController = UIImagePickerController()
    

    var isUpdate:Bool = false
    var empIndex:Int = 0
    
    weak var delegate:AddEmployeeViewControllerProtocol? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardTappedAround()
        setup()
    }
    
    
    func setup() {
        self.capturedImageView.clipsToBounds = true
        self.capturedImageView.layer.cornerRadius = 45
        
        if isUpdate {
        
            self.empBtn.setTitle("UPDATE", for: .normal)
        }else{
            self.empBtn.setTitle("ADD", for: .normal)
        }
    }
    
    @IBAction func addEmpBtnTapped(_ sender: UIButton) {
        
                
        if empFirstNameTF.text!.isEmpty ||  empLastNameTF.text!.isEmpty ||  empIDTF.text!.isEmpty ||  empPhoneNumberTF.text!.isEmpty ||  empDepartmentTF.text!.isEmpty ||  empSalaryTF.text!.isEmpty {
            let firstAlert: UIAlertController = UIAlertController(title: "Enter All Fields", message: "", preferredStyle: .alert)
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            }
            firstAlert.addAction(cancelAction)
            self.present(firstAlert, animated: true, completion: nil)
            return
        }
        
        
        self.addData()
    }
    
    func addData() {
        
        let empDict = ["firstname":empFirstNameTF.text, "lastname":empLastNameTF.text, "id":empIDTF.text, "phonenumber":empPhoneNumberTF.text, "department":empDepartmentTF.text, "salary":empSalaryTF.text]
        let png = self.capturedImageView.image?.pngData()
        
        self.delegate?.updateTableView()
        self.navigationController?.popViewController(animated: true)
    }
}


extension AddEmployeeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBAction func didTapImageView(_ sender: UIButton) {
        self.checkCameraPermission()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        capturedImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- CameraPermission
    
    func callCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePickerController.sourceType = .savedPhotosAlbum
            imagePickerController.delegate = self
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func presentCameraSettings() {
        let alert = UIAlertController(title: "Error", message: "Camera access is denied", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(UIAlertAction(title: "Settings", style: .cancel) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    _ in
                })
            }
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkCameraPermission(){
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
        case .denied:
            print("Denied status")
            self.presentCameraSettings()
            break
        case .restricted:
            print("user doesn't allow")
            break
        case .authorized:
            print("success")
            self.callCamera()
            break
        case .notDetermined:
            print("not determined status")
            AVCaptureDevice.requestAccess(for: .video) { (success) in
                if success{
                    print("permission granted")
                    self.callCamera()
                }else{
                    print("permission not granted")
                }
            }
            break
        default:
            print("not valid")
        }
    }
        
}


extension AddEmployeeViewController {
    
    func hideKeyboardTappedAround() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddEmployeeViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


protocol AddEmployeeViewControllerProtocol: AnyObject {
    func updateTableView()
}
