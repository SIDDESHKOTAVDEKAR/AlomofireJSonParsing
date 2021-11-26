//  ViewController.swift
//  AlomofireJSonParsing
//  Created by Siddhesh Kotavdekar on 11/22/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.


import UIKit
import Alamofire
class ViewController: UIViewController,Siddesh{
    @IBOutlet weak var myTabel : UITableView!
    var getdataobj: getData?
    var arr:[genderizeModel] = [genderizeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getdataobj = getData()
        self.getdataobj?.getDataWithAF()
        self.getdataobj?.dele = self
        myTabel.delegate = self
        myTabel.dataSource = self
    }
    func delegateMethod(ent: genderizeModel) {
        self.arr.append(ent)
        DispatchQueue.main.async {
            self.myTabel.reloadData()
        }
        print(arr)
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTabel.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.lblName.text = arr[indexPath.row].name
        cell.lblgender.text = arr[indexPath.row].gender
        cell.lblProbability.text = "\( arr[indexPath.row].probability)"
        cell.lblCount.text = "\(arr[indexPath.row].count)"
        return cell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
