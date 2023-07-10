//
//  TextFieldViewController.swift
//  SchoolSchedule
//
//  Created by 箭内雄 on 2021/02/20.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    var TopVC:ViewController?
    var receiveTime:String = ""
    var receiveTapedCellIndex:Int = 0
    var ownScheduleSubjectTitle = UserDefaults.standard
    var ownScheduleTeacherName = UserDefaults.standard
    var ownScheduleClassroom = UserDefaults.standard
    var ownScheduleCredit = UserDefaults.standard
    var reReceiveSubject:String = ""
    var reReceiveTeacherName:String = ""
    var reReceiveClassroom:String = ""
    var reReceiveCredit:String = ""
    var subject:String = ""
    var teacher:String = ""
    var classroom:String = ""
    var credit:String = ""
    
    
    var receiveSubjectInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var receiveTeachersInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var receiveClassroomInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var receiveCreditInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    
    @IBOutlet weak var SubjectTextField: UITextField!
    @IBOutlet weak var SaveButtonOutlet: UIButton!
    @IBOutlet weak var TeacherNameTextField: UITextField!
    @IBOutlet weak var ClassroomTextField: UITextField!
    @IBOutlet weak var CreditValueTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpViews()
        DefaltSet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    private func DefaltSet(){
        receiveSubjectInfo = ownScheduleSubjectTitle.stringArray(forKey: "Subject") ?? ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
        receiveTeachersInfo = ownScheduleTeacherName.stringArray(forKey: "Teacher") ?? ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
        receiveClassroomInfo = ownScheduleClassroom.stringArray(forKey: "Classroom") ?? ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
        receiveCreditInfo = ownScheduleCredit.stringArray(forKey: "Credit") ?? ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    }
    private func SetUpViews(){
        SubjectTextField.delegate = self
        TeacherNameTextField.delegate = self
        ClassroomTextField.delegate = self
        CreditValueTextField.delegate = self
        
        SubjectTextField.layer.cornerRadius = 8
        SubjectTextField.layer.borderWidth = 1
        
        SubjectTextField.text = reReceiveSubject
        TeacherNameTextField.text = reReceiveTeacherName
        ClassroomTextField.text = reReceiveClassroom
        CreditValueTextField.text = reReceiveCredit

        navigationItem.title = receiveTime
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        TeacherNameTextField.layer.borderWidth = 1
        TeacherNameTextField.layer.cornerRadius = 8
        
        ClassroomTextField.layer.borderWidth = 1
        ClassroomTextField.layer.cornerRadius = 8
        
        CreditValueTextField.layer.cornerRadius = 8
        CreditValueTextField.layer.borderWidth = 1

        SaveButtonOutlet.layer.cornerRadius = 10
    }
    @IBAction func tappedBackButton(_ sender: Any) {
           self.dismiss(animated: true, completion: nil)
       }
    @IBAction func SaveButtonAction(_ sender: Any) {
        Save()
        self.dismiss(animated: true)
    }
    
    private func Save(){
        receiveSubjectInfo[receiveTapedCellIndex] = subject
        ownScheduleSubjectTitle.set(receiveSubjectInfo,forKey: "Subject")
        
        receiveTeachersInfo[receiveTapedCellIndex] = teacher
        ownScheduleTeacherName.set(receiveTeachersInfo,forKey: "Teacher")
        
        receiveClassroomInfo[receiveTapedCellIndex] = classroom
        ownScheduleClassroom.set(receiveClassroomInfo,forKey: "Classroom")
        
        receiveCreditInfo[receiveTapedCellIndex] = credit
        ownScheduleCredit.set(receiveCreditInfo,forKey: "Credit")
    }
}


extension TextFieldViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let sub = SubjectTextField.text else {return}
        guard let tea = TeacherNameTextField.text else {return}
        guard let cla = ClassroomTextField.text else {return}
        guard let cre = CreditValueTextField.text else {return}
        
        subject = sub
        teacher = tea
        classroom = cla
        credit = cre
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
