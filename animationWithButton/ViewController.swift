//
//  ViewController.swift
//  animationWithButton
//
//  Created by Мария  on 3.10.22.
//

import UIKit

class ViewController: UIViewController {
   private let buttonRight : UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 600, width: 70, height: 35))
        let image = UIImage(systemName: "arrow.right")
        button.setImage(image, for: .normal)
        return button
    }()
   private let buttonLeft : UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 600, width: 70, height: 35))
        let image = UIImage(systemName: "arrow.backward")
        button.setImage(image, for: .normal)
        return button
    }()
  var imageView = UIImageView()
  var imageArray = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3")
  ]
    
private var imageViewArray = [UIImageView]()
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageView = .init(frame: CGRect(x: self.view.frame.width, y: 200, width: self.view.frame.width, height: self.view.frame.width))
        imageView.image = imageArray[index]
        buttonLeft.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(imageView)
        view.addSubview(buttonLeft)
        view.addSubview(buttonRight)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc func leftButtonTapped(){
        showPreviousImage()
    }
    @objc func rightButtonTapped(){
        showNextImage()
    }
    private func createImageView() -> UIImageView{
        let imageView = UIImageView(frame: CGRect(x: self.view.frame.width, y: 200, width: self.view.frame.width, height: self.view.frame.width))
        self.view.addSubview(imageView)
        return imageView
    }
    private func showNextImage (){
        let imageView = createImageView()
        if index < imageArray.count - 1 {
        index += 1
        }else {
            index = 0
        }
        imageView.image = imageArray[index]
        imageViewArray.append(imageView)
       animateImageView(imageView)
    }
    private func showPreviousImage (){
        if index > 0 {
            index -= 1
        } else {
            index = imageArray.count - 1
        }
        check()
    }
    private func animateImageView (_ imageView : UIImageView){
        UIView.animate(withDuration: 0.5) {
           imageView.frame.origin.x -= self.view.frame.width
        }
    }
    private  func check(){
        if imageViewArray.count > 0 {
            let imageView = imageViewArray[imageViewArray.count - 1]
            imageViewArray.removeLast()
        animateImageView(imageView)
        }else{
            let imageView = createImageView()
            imageView.frame.origin.x -= imageView.frame.width
            imageView.image = self.imageView.image
            self.imageView.image = imageArray[index]
            animateImageView(imageView)
        }
    }
    
  
}
