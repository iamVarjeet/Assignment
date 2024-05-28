//
//  ViewController.swift
//  Assignment
//
//  Created by ios developer on 28/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//MARK:- OUTLETS
    @IBOutlet weak var useIDLabel: UILabel!
    @IBOutlet weak var PostsTableView: UITableView!
    
//MARK:- Variables
    let Viewmodel:MyViewModel = MyViewModel()
    
//MARK: VIEW Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        Viewmodel.getAllPostsWithPagination(completion: { isSuccess  in
            if isSuccess {
                DispatchQueue.main.async {
                    print(self.Viewmodel.allPostsArray.count)
                    self.useIDLabel.text = "User ID: \(self.Viewmodel.allPostsArray.first?.userID ?? 1)"
                    self.PostsTableView.reloadData()
                }
            }
        })
    }
    
//    MARK : CUSTOM FUNCTIONS
    func setTableView(){
        PostsTableView.delegate = self
        PostsTableView.dataSource = self
        PostsTableView.reloadData()
    }
    
//    MARK : TABLE VIEW METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Viewmodel.allPostsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath ) as! PostsTableViewCell
        cell.jobID_Label.text = "ID: \(Viewmodel.allPostsArray[indexPath.row].id ?? 0)"
        cell.jobTitle_Label.text = "Title: \(Viewmodel.allPostsArray[indexPath.row].title ?? "")"
        cell.jobBody_Label.text = "Body: \(Viewmodel.allPostsArray[indexPath.row].body ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController 
        vc.Details = DetailItem(ID: "\(Viewmodel.allPostsArray[indexPath.row].id ?? 0)", Body: "\(Viewmodel.allPostsArray[indexPath.row].body ?? "")", title: "\(Viewmodel.allPostsArray[indexPath.row].title ?? "")")
        self.navigationController?.pushViewController(vc, animated: true)
    }
     
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == Viewmodel.allPostsArray.count - 1 {
                print("Last cell reached")
                if !Viewmodel.lastPage {
                    
                
                Viewmodel.getAllPostsWithPagination(completion: { isSuccess  in
                    if isSuccess {
                        DispatchQueue.main.async {
                            print(self.Viewmodel.allPostsArray.count)
                            self.useIDLabel.text = "User ID: \(self.Viewmodel.allPostsArray.first?.userID ?? 1)"
                            self.PostsTableView.reloadData()
                        }
                    }
                })
                }else{
                    print("No more Data ")
                }
            }
        }

}

