//
//  CourseDetailsController.swift
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

import UIKit

class CourseDetailsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var tableView: UITableView!
    var arrayOfCertificates: [Certi] = [Certi]()
    var arrayToStoreJSONData = [String]()
    var titleArray = [String]()
    var descArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
        self.setUpImage()
        self.loadVideo()
        
        //            .loadRequest(NSURLRequest(URL: NSURL(string: "google.ca")))
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func fetchJSON()
    {
        let path = NSBundle.mainBundle().pathForResource("viewController1", ofType: "json")
        var raw:NSData? = NSData.dataWithContentsOfMappedFile(path!) as NSData?
        var jsonData:NSArray = NSJSONSerialization.JSONObjectWithData(raw!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
        for (var i = 0;i<jsonData.count;i++)
        {
            descArray.append(jsonData[i]["Description"]! as String)
            titleArray.append(jsonData[i]["Title"]! as String)
            
        }
        println(descArray)
        println(titleArray)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadVideo(){
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.youtube.com/embed/KuNQgln6TL0")!))
        view.addSubview(webView)
        println(webView.loading)
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            dispatch_async(dispatch_get_main_queue()) {
            }
        }
        
        
    }
    func setUpImage(){
        
        var cert1 = Certi(Title:titleArray[0], Desc: descArray[0])
        var cert2 = Certi(Title:titleArray[1], Desc: descArray[1])
        var cert3 = Certi(Title:titleArray[2], Desc: descArray[2])
        
        arrayOfCertificates.append(cert1)
        arrayOfCertificates.append(cert2)
        arrayOfCertificates.append(cert3)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCertificates.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as CustomCell
        
        let Certi = arrayOfCertificates[indexPath.row]
        cell.setCell(/*Certi.imgName, */Certi.title, description: Certi.desc)
        //    cell1.setTitleNDescription(TitleNDescription.title)
        return cell
    }
    

}
