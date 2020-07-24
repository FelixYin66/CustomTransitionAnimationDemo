//
//  CollectionViewCell.swift
//  CustomTransitionAnimationDemo
//
//  Created by Felix Yin on 2020/7/24.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        //添加圆角
        let backgroundView = UIView(frame: self.bounds);
        backgroundView.layer.cornerRadius = 10;
        backgroundView.layer.masksToBounds = true;
        backgroundView.backgroundColor = UIColor.systemPink;
        self.addSubview(backgroundView);
        
        //添加阴影
        self.layer.shadowColor = UIColor.black.cgColor;
        self.layer.shadowOffset = CGSize(width: 0, height: 10);
        self.layer.shadowRadius = 10;
        self.layer.shadowOpacity = 1.0;
        self.layer.masksToBounds = false;
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Never Code");
    }
}
