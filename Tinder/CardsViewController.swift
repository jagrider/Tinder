//
//  CardsViewController.swift
//  Tinder
//
//  Created by Jonathan Grider on 3/2/18.
//  Copyright © 2018 Jonathan Grider. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  
  var cardInitialCenter: CGPoint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cardInitialCenter = profileImageView.center
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    
    print("Image interaction!")
    
    let location = sender.location(in: view)
    let translation = sender.translation(in: view)
    
    if sender.state == .began {
      print("Gesture began")
      cardInitialCenter = profileImageView.center
    } else if sender.state == .changed {
      
      print("Gesture is changing")
      profileImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
      
      if (location.y > profileImageView.center.y) {
        let rotation = CGAffineTransform(rotationAngle: -translation.x / 100)
        self.profileImageView.transform = rotation
      } else {
        let rotation = CGAffineTransform(rotationAngle: translation.x / 100)
        self.profileImageView.transform = rotation
      }
      
    } else if sender.state == .ended {
      print("Gesture ended")
      
      if (translation.x > 50 || translation.x < -50) {
        UIView.animate(withDuration: 0.3, animations: {
          if(translation.x > 50) {
            self.profileImageView.center.x += 500
          }
          else {
            self.profileImageView.center.x -= 500
          }
          
        })
      }
      else {
        self.profileImageView.transform  = CGAffineTransform.identity
        self.profileImageView.center = cardInitialCenter
        
      }
    }
    
  }
  
  @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
    print("Image interaction!")
    self.performSegue(withIdentifier: "detailSegue", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? DetailViewController {
      if let image = profileImageView.image {
        destination.image = image
      }
    }
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
