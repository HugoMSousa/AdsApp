//
//  ViewController.swift
//  FixeAds
//
//  Created by Hugo Sousa on 21/11/2015.
//  Copyright © 2015 FixeAds. All rights reserved.
//

import UIKit

class AdCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdTableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var adCategoryScreenViewModel: AdCategoryScreenViewModel? = nil
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupInterface()
        
        adCategoryScreenViewModel?.fetchCategoryWithId("25", completion: { [weak self] (adCategoryViewModel, error) -> () in
            self?.tableView.reloadData()
        })
    }

    private func setupInterface() {
        // Table View setup
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (adCategoryScreenViewModel != nil) {
            return (self.adCategoryScreenViewModel?.adCategoryViewModel?.ads.count)!
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("AdCell", forIndexPath: indexPath) as! AdTableViewCell
        cell.delegate = self
        
        let ads = (self.adCategoryScreenViewModel?.adCategoryViewModel?.ads)!
        let adViewModel = ads[indexPath.row]
        
        cell.titleLabel.text = adViewModel.title
        cell.costLabel.text = adViewModel.listLabel
        cell.locationButton .setTitle(adViewModel.cityLocation, forState: UIControlState.Normal)
        cell.createdLabel.text = adViewModel.created
        
        if let url = adViewModel.photos.first {
            cell.headerImageView?.setImageWithURL(url)
        }
        return cell
    }
    
    // MARK: UITableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func adTableViewCellDidPressShare(cell: AdTableViewCell) {
        
        let indexPath = self.tableView.indexPathForCell(cell)
        
        let ads = (self.adCategoryScreenViewModel?.adCategoryViewModel?.ads)!
        let adViewModel = ads[indexPath!.row]
        
        let title: String = adViewModel.title + "\n"
        let URL: NSURL = adViewModel.url!
        
        let activityViewController = UIActivityViewController(activityItems: [title, URL], applicationActivities: nil)
        navigationController?.presentViewController(activityViewController, animated: true) {
        
        }
    }
    
    func adTableViewCellDidPressLocation(cell: AdTableViewCell) {
        let indexPath = self.tableView.indexPathForCell(cell)
        
        let ads = (self.adCategoryScreenViewModel?.adCategoryViewModel?.ads)!
        let adViewModel = ads[indexPath!.row]
        
        let mapViewController = ModuleFactory.mapScreen(adViewModel.mapLatitude, longitude: adViewModel.mapLongitude)
        mapViewController?.title = "Map"
        
        navigationController?.pushViewController(mapViewController!, animated: true)
    }

}

