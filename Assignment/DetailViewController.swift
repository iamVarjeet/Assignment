//
//  DetailViewController.swift
//  Assignment
//
//  Created by ios developer on 28/05/24.
//

import UIKit

struct DetailItem {
    var ID :String
    var Body :String
    var title :String
}

class DetailViewController: UIViewController {
    
    //MARK: OUTLETS
        
    @IBOutlet weak var jobTitle_Label: UILabel!
    @IBOutlet weak var jobBody_Label: UILabel!
    @IBOutlet weak var jobID_Label: UILabel!
    
    var Details : DetailItem =  DetailItem(ID: "1", Body: "Body", title: "Title")
        
    @IBOutlet var BackView: UIView!
    
    @IBOutlet weak var back_Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem?.tintColor = .white
        back_Button.layer.cornerRadius = 15
        jobID_Label.text = "\(Details.ID )"
        jobTitle_Label.text = "\(Details.title)"
        jobBody_Label.text = "\(Details.Body)"
    }
    

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
 

}
