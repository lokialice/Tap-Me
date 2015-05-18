//
//  ViewController.swift
//  Tap Me
//
//  Created by Main Account on 10/3/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var timerLabel: UILabel!
  var count = 0
  var seconds = 0
  var timer = NSTimer()
    var hinh:Int = 1
    
    @IBOutlet var btnTapOulet: UIButton!
    @IBOutlet var btnNextOultet: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    setupGame()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
    
    @IBAction func btnNextgirl(sender: UIButton) {
        var chuoi:NSString = "gai" + String(hinh) + ".jpg"
        btnTapOulet.setBackgroundImage(UIImage(named: chuoi as String), forState: UIControlState.Normal)
        hinh = hinh + 1
       if hinh == 12 {
          hinh = 1
        }
    }
    
  @IBAction func buttonPressed()  {
    count++
    scoreLabel.text = "Score: \(count)"
  }

  func setupGame()  {
    seconds = 30
    count = 0
   
    timerLabel.text = "Time: \(seconds)"
    scoreLabel.text = "Score: \(count)"
    
    timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
  }
  
  func subtractTime() {
    seconds--
    timerLabel.text = "Time: \(seconds)"
     
    if(seconds == 0)  {
      timer.invalidate()
      let alert = UIAlertController(title: "Time is up!",
         message: "You scored \(count) points",
         preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {
        action in self.setupGame()
      }))
      presentViewController(alert, animated: true, completion:nil)
    }
  }

}

