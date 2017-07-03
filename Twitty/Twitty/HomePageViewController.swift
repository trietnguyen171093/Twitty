//
//  HomePageViewController.swift
//  Twitty
//
//  Created by Triet on 7/2/17.
//  Copyright © 2017 Triet. All rights reserved.
//

import UIKit



class HomePageViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  var homeTimeLines : [TimeLine]!
  var numCell  = 0
  var curCell = 0
  var arrTemp = [NSDictionary]()
  let refreshControl = UIRefreshControl()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
      
        // fetch data from Twitter
        fetchHomeLineData()
      
        self.homeTimeLines = TimeLine.TimeLines(array: arrTemp)
        print("ENDviewdidload")
      
      // declare refresh control
      
      
      refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
      refreshControl.addTarget(self, action: #selector(refreshdata(_:)), for: UIControlEvents.valueChanged)
      tableView.insertSubview(refreshControl, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func refreshdata(_ refreshControl: UIRefreshControl)
  {
//    self.homeTimeLines.removeAll()
    fetchHomeLineData()
  }
  func fetchHomeLineData(){
    arrTemp = (TwitterClient.shareInstance?.getHomeTimeLine{
      (timeLines, error) in
      if (error != nil) {
        print("\(error!.localizedDescription)")
      }
      else {
        self.homeTimeLines = timeLines
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
      }
      })!
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
    print("count = \(homeTimeLines.count)")
    numCell = homeTimeLines.count
    return homeTimeLines.count
  }
  

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    print("cellatrow \(indexPath.row)")
    let cell = tableView.dequeueReusableCell(withIdentifier: "TwittyCellID", for: indexPath) as! TwittyCell
    if (homeTimeLines.count > 0)  // avoid case app crashes because data query is nil
    {
      cell.hometimeline = homeTimeLines[indexPath.row]
    }
    return cell
    
  }
}
