//
//  ViewController.swift
//  HeaderTest
//
//  Created by Diego Quimbo on 2/13/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit


class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let kMapHeaderHeight = 150
    var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.addHeaderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHeaderView() {
        
        self.tableView.sectionHeaderHeight = 150
        
        self.headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150))
        self.headerView.backgroundColor = UIColor.blue
        
        self.view.insertSubview(self.headerView, belowSubview: self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let tableHeader = UIView()
        tableHeader.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
        tableHeader.backgroundColor = UIColor.clear
        
        return tableHeader
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title \(indexPath.row)"
        return cell
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        var headerFrame = self.headerView.frame
        
        if scrollOffset < 0 {
            headerFrame.origin.y = 0
        }else{
            headerFrame.origin.y = 0 - scrollOffset
        }
        
        self.headerView.frame = headerFrame
    }

}

