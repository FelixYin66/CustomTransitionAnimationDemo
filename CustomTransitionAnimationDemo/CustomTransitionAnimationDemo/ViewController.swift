//
//  ViewController.swift
//  CustomTransitionAnimationDemo
//
//  Created by Felix Yin on 2020/7/22.
//

import UIKit
import EasyTransitions

struct AppStoreAnimatorInfo {
    var animator: AppStoreAnimator
    var index: IndexPath
}

class ViewController: UIViewController {
    
    lazy var modalTransitionDelegate:ModalTransitionDelegate = {
        let delegate = ModalTransitionDelegate();
        return delegate;
    }();
    
    var animatorInfo:AppStoreAnimatorInfo?;
    
    lazy var collectionView:UICollectionView = {
        let collectionViewLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        collectionViewLayout.itemSize = CGSize(width: 345, height: 412);
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height);
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: collectionViewLayout);
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(CollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "Cell");
        collectionView.backgroundColor = UIColor.white;
        return collectionView;
    }();
    
    lazy var tableView:UITableView = {
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height);
        let tableView = UITableView(frame: rect, style: UITableView.Style.plain);
        tableView.register(TableViewCell.classForCoder(), forCellReuseIdentifier: "Cell");
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        
        return tableView;
    }()
    
    lazy var testView = UIView();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        self.view.addSubview(self.collectionView);
//        self.view.addSubview(self.tableView);
//        self.view.addSubview(self.testView);
//        testView.frame = CGRect(x: 100, y: 100, width: 150, height: 50);
//        testView.backgroundColor = UIColor.red;
//        testView.layer.cornerRadius = 10;
//        testView.layer.masksToBounds = true;
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath);
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath)!;
        self.transitionVC(cell: cell, indexPath: indexPath);
    }
    
    func transitionVC(cell:UICollectionViewCell,indexPath:IndexPath) -> Void {
        
        let detailVC:DetailViewController = DetailViewController();
        
        let cellFrame = view.convert(cell.frame, from: collectionView);
        let animator:AppStoreAnimator = AppStoreAnimator(initialFrame: cellFrame);
        animator.onReady = {
            cell.isHidden = true;
        };
        animator.onDismissed = {
            cell.isHidden = false
        };
        animator.auxAnimation = {
            detailVC.layout(presenting: $0);
        };
        
        self.modalTransitionDelegate.set(animator: animator, for: ModalOperation.present);
        self.modalTransitionDelegate.set(animator: animator, for: ModalOperation.dismiss);
        self.modalTransitionDelegate.wire(viewController: detailVC, with: Pan.regular(PanDirection.fromTop), navigationAction: {
            detailVC.dismiss(animated: true, completion: nil);
        });
        detailVC.transitioningDelegate = self.modalTransitionDelegate;
        detailVC.modalPresentationStyle = UIModalPresentationStyle.custom;
        
        self.present(detailVC, animated: true, completion: nil);
        self.animatorInfo = AppStoreAnimatorInfo(animator: animator, index: indexPath);

    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 412;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
