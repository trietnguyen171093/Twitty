//
//  HomePageViewController.swift
//  Twitty
//
//  Created by Triet on 7/2/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import UIKit
var homeTimeLines : [TimeLine]!
class HomePageViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  
  
  var arrTemp = [NSDictionary]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
      
        // fetch data from Twitter
//        fetchHomeLineData()
//        print(arrTemp)
//      arrTemp = (TwitterClient.shareInstance?.getHomeTimeLine())!
        homeTimeLines = TimeLine.TimeLines(array: (TwitterClient.shareInstance?.getHomeTimeLine())!)
        print(homeTimeLines)
        self.tableView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  func fetchHomeLineData(){
    arrTemp = (TwitterClient.shareInstance?.getHomeTimeLine())!
  }
  
  
  @IBAction func asd(_ sender: Any) {
      self.tableView.reloadData()
  }

  /*
   // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
extension HomePageViewController: UITableViewDataSource, UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    print("count")
    return homeTimeLines.count
  }
  

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    print("cellatrow")
    let cell = tableView.dequeueReusableCell(withIdentifier: "TwittyCellID", for: indexPath) as! TwittyCell
    cell.hometimeline = homeTimeLines[indexPath.row]
    return cell
    
  }
}
