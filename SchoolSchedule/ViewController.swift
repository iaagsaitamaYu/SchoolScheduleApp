//
//  ViewController.swift
//  SchoolSchedule
//
//  Created by 箭内雄 on 2021/02/20.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
   
    
    var giveTimeName:[String] = ["月曜日１限","火曜日1限","水曜日1限","木曜日1限","金曜日1限","土曜日1限",
                           "月曜日2限","火曜日2限","水曜日2限","木曜日2限","金曜日2限","土曜日2限",
                           "月曜日3限","火曜日3限","水曜日3限","木曜日3限","金曜日3限","土曜日3限",
                           "月曜日4限","火曜日4限","水曜日4限","木曜日4限","金曜日4限","土曜日4限",
                           "月曜日5限","火曜日5限","水曜日5限","木曜日5限","金曜日5限","土曜日5限",
                           "月曜日6限","火曜日6限","水曜日6限","木曜日6限","金曜日6限","土曜日6限",
                           "月曜日7限","火曜日7限","水曜日7限","木曜日7限","金曜日7限","土曜日7限"]
    var CellTitle:String = ""
    var GiveTappedCellIndex:Int = 0
    
    var receiveSubjectInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var receiveTeachersInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var receiveClassroomInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var receiveCreditInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    
    var ownScheduleSubjectTitle = UserDefaults.standard
    var ownScheduleTeacherName = UserDefaults.standard
    var ownScheduleClassroom = UserDefaults.standard
    var ownScheduleCredit = UserDefaults.standard

    @IBOutlet weak var ScheduleCollectionView: UICollectionView!
    
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var forthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var seventhLabel: UILabel!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
    }
    func setupViews(){
        navigationItem.title = "時間割"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        originLabel.layer.borderWidth = 1
        originLabel.layer.borderColor = UIColor.white.cgColor
        mondayLabel.layer.borderWidth = 1
        mondayLabel.layer.borderColor = UIColor.white.cgColor
        tuesdayLabel.layer.borderWidth = 1
        tuesdayLabel.layer.borderColor = UIColor.white.cgColor
        wednesdayLabel.layer.borderWidth = 1
        wednesdayLabel.layer.borderColor = UIColor.white.cgColor
        thursdayLabel.layer.borderWidth = 1
        thursdayLabel.layer.borderColor = UIColor.white.cgColor
        fridayLabel.layer.borderWidth = 1
        fridayLabel.layer.borderColor = UIColor.white.cgColor
        saturdayLabel.layer.borderWidth = 1
        saturdayLabel.layer.borderColor = UIColor.white.cgColor
        firstLabel.layer.borderWidth = 1
        firstLabel.layer.borderColor = UIColor.white.cgColor
        secondLabel.layer.borderWidth = 1
        secondLabel.layer.borderColor = UIColor.white.cgColor
        thirdLabel.layer.borderWidth = 1
        thirdLabel.layer.borderColor = UIColor.white.cgColor
        forthLabel.layer.borderWidth = 1
        forthLabel.layer.borderColor = UIColor.white.cgColor
        fifthLabel.layer.borderWidth = 1
        fifthLabel.layer.borderColor = UIColor.white.cgColor
        sixthLabel.layer.borderWidth = 1
        sixthLabel.layer.borderColor = UIColor.white.cgColor
        seventhLabel.layer.borderWidth = 1
        seventhLabel.layer.borderColor = UIColor.white.cgColor
        
        
        ScheduleCollectionView.delegate = self
        ScheduleCollectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController!.navigationBar.shadowImage = UIImage()
        
        if let defaltInfo = ownScheduleSubjectTitle.stringArray(forKey: "Subject") {
            receiveSubjectInfo = defaltInfo
            print(receiveSubjectInfo)
            ScheduleCollectionView.reloadData()
            if let defaltInfo = ownScheduleTeacherName.stringArray(forKey: "Teacher") {
                          receiveTeachersInfo = defaltInfo
                        ScheduleCollectionView.reloadData()
                if let defaltInfo = ownScheduleClassroom.stringArray(forKey: "Classroom") {
                      receiveClassroomInfo = defaltInfo
                    if let defaltInfo = ownScheduleCredit.stringArray(forKey: "Credit") {
                          receiveCreditInfo = defaltInfo
                        return
                    }else {receiveCreditInfo = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
                    }
                    return
                }else {receiveClassroomInfo = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
                }
                        return
                    }else {receiveTeachersInfo = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
                        ScheduleCollectionView.reloadData()
                    }
            return
        }else {receiveSubjectInfo = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
            ScheduleCollectionView.reloadData()
        }
        
       
       
     
       }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cellid", for: indexPath) as! CollectionViewCell
        let subject = receiveSubjectInfo[indexPath.row]
            cell.TopViewSubjectTitle.text = subject
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard:UIStoryboard = self.storyboard!
        let textFieldViewController = storyboard.instantiateViewController(withIdentifier: "TextFieldViewController") as! TextFieldViewController
        let nav = UINavigationController(rootViewController: textFieldViewController)
        nav.modalPresentationStyle = .fullScreen
        textFieldViewController.TopVC = self
        let giveTime = giveTimeName[indexPath.row]
        textFieldViewController.receiveTime = giveTime
        textFieldViewController.receiveTapedCellIndex = indexPath.row
        textFieldViewController.reReceiveSubject = receiveSubjectInfo[indexPath.row]
        textFieldViewController.reReceiveTeacherName = receiveTeachersInfo[indexPath.row]
        
        textFieldViewController.reReceiveClassroom = receiveClassroomInfo[indexPath.row]
        textFieldViewController.reReceiveCredit = receiveCreditInfo[indexPath.row]
        self.present(nav ,animated: true, completion: nil)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let CellWidth = collectionView.frame.width / 6
        let cellHeight = collectionView.frame.height / 7
        return .init(width :CellWidth,height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout ,minimumInteritemSpacingForSectionAt section :Int) -> CGFloat{
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

