//
//  ColorContainerViewController.swift
//  ColorKit-Swift
//
//  Created by Dixi-Chen on 2018/7/28.
//  Copyright © 2018年 Dixi-Chen. All rights reserved.
//

import UIKit

class CollectColorContainerViewController: BaseViewController {

    private var project:Project!
    
    private var tableVC:CollectColorDetailViewController!
    private var cardVC:CollectColorCardViewController!
    private var childSubView:[UIView] = []
    private var currenViewIndex:Int = 1
    
    

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title  = "收藏"
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    deinit {
        
    }

    override func viewWillLayoutSubviews() {
        updateFrame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI(){
        let sb1 = UIStoryboard(name: "CollectColorDetailViewController", bundle: nil)
        tableVC = sb1.instantiateInitialViewController() as! CollectColorDetailViewController
        
        let sb2 = UIStoryboard(name: "CollectColorCardViewController", bundle: nil)
        cardVC = sb2.instantiateInitialViewController() as! CollectColorCardViewController
        
        view.addSubview(cardVC.view)
        childSubView.append(cardVC.view)
        view.addSubview(tableVC.view)
        childSubView.append(tableVC.view)
        addChildViewController(tableVC)
        addChildViewController(cardVC)
        
        
        
        
    }
    
    private func updateFrame(){
        tableVC.view.frame = self.view.bounds
        cardVC.view.frame = self.view.bounds
    }
    
    
    @objc
    func switchVC(){
        currenViewIndex = 1-currenViewIndex
        view.bringSubview(toFront: childSubView[currenViewIndex])
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(motion == UIEventSubtype.motionShake){
            invokeNotificationFeedback(type: .success)
            switchVC()
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
