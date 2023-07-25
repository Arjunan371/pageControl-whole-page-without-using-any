//
//  ViewController.swift
//  pageControl whole page without using any
//
//  Created by Mohammed Abdullah on 19/07/23.
//

import UIKit

class ViewController: UIViewController {
    var images = ["pdf","mp4","mp3"]
    var pages = ["page1","page2","page3"]
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        page.currentPage = 0
        if page.currentPage == 0{
            imageView.image = UIImage(named: images[0])
            label1.text = pages[0]
        }
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                
                if page.currentPage == 2{
                    page.currentPage = 1
                    imageView.image = UIImage(named: images[1])
                    label1.text = pages[1]
                } else if page.currentPage == 1{
                    page.currentPage = 0
                    imageView.image = UIImage(named: images[0])
                    label1.text = pages[0]
                }
                print("Swiped right")
                
            case .left:
                print("Swiped left")
                if page.currentPage == 0{
                    page.currentPage = 1
                    imageView.image = UIImage(named: images[1])
                    label1.text = pages[1]
                } else if page.currentPage == 1{
                    page.currentPage = 2
                    imageView.image = UIImage(named: images[2])
                    label1.text = pages[2]
                }
                
            default:
                break
            }
        }
    }
    
    @IBAction func pages(_ sender: UIPageControl) {
        page.numberOfPages = images.count
      //  page.currentPage = 0
        if page.currentPage == 0{
            imageView.image = UIImage(named: images[0])
            label1.text = pages[0]
        } else if page.currentPage == 1{
            imageView.image = UIImage(named: images[1])
            label1.text = pages[1]
        } else {
            imageView.image = UIImage(named: images[2])
            label1.text = pages[2]
        }
    }
    
}

