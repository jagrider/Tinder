//
//  DetailViewController.swift
//  Tinder
//
//  Created by Jonathan Grider on 3/2/18.
//  Copyright © 2018 Jonathan Grider. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  var image: UIImage!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let image = image {
      profileImageView.image = image
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func didTapDone(_ sender: UITapGestureRecognizer) {
    
    dismiss(animated: true, completion: nil)
    
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
