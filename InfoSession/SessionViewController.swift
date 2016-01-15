//
//  SessionViewController.swift
//  InfoSession
//
//  Created by Oluwaseun Makinde on 2016-01-13.
//  Copyright © 2016 Seun Makinde. All rights reserved.
//

import UIKit

extension UINavigationController {
    public override func shouldAutorotate() -> Bool {
        return visibleViewController!.shouldAutorotate()
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask{
        return visibleViewController!.supportedInterfaceOrientations()
    }
}

class SessionViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var employerLabel: UILabel!
    @IBOutlet weak var sessionDateLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var audienceLabel: UILabel!
    @IBOutlet weak var programsLabel: UILabel!
    
    var selectedSession:Session!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        websiteLabel.text = selectedSession.website;
        employerLabel.text = selectedSession.companyName;
        sessionDateLabel.text = selectedSession.date;
        timesLabel.text = selectedSession.startTime + " to "+selectedSession.endTime ;
        locationLabel.text = selectedSession.location;
        if(selectedSession.audience == nil || selectedSession.audience == ""){
            audienceLabel.text = "not specific";
            audienceLabel.textColor = UIColor.grayColor();
        }
        else {
           audienceLabel.text = selectedSession.audience;
        }
        if(selectedSession.programs == nil || selectedSession.programs == ""){
            programsLabel.text = "not specific";
            programsLabel.textColor = UIColor.grayColor();
        }
        else {
            programsLabel.text = selectedSession.programs ;
        }
        websiteLabel.lineBreakMode = .ByCharWrapping;
        websiteLabel.numberOfLines = 0;
        websiteLabel.preferredMaxLayoutWidth = 280;
        programsLabel.lineBreakMode = .ByWordWrapping;
        programsLabel.numberOfLines = 0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func shouldAutorotate() -> Bool {
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.Unknown) {
                return false;
        }
        else {
            return true;
        }
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        let orientation: UIInterfaceOrientationMask =
        [UIInterfaceOrientationMask.Portrait, UIInterfaceOrientationMask.PortraitUpsideDown]
        return orientation
    }


}
