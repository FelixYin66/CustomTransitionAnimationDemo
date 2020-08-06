//
//  TableViewCell.swift
//  CustomTransitionAnimationDemo
//
//  Created by Felix Yin on 2020/8/5.
//

import UIKit

class TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        //添加圆角
//        let backgroundView = UIView(frame: self.bounds);
//        backgroundView.tag = 100;
//        backgroundView.layer.cornerRadius = 10;
//        backgroundView.layer.masksToBounds = true;
//        backgroundView.backgroundColor = UIColor.systemPink;
//        self.contentView.addSubview(backgroundView);
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true;
        self.backgroundColor = UIColor.systemPink;
        
        //添加阴影
//        self.layer.shadowColor = UIColor.black.cgColor;
//        self.layer.shadowOffset = CGSize(width: 0, height: 10);
//        self.layer.shadowRadius = 10;
//        self.layer.shadowOpacity = 1.0;
//        self.layer.masksToBounds = false;
//
//        let shadowPath = UIBezierPath(rect: self.bounds);
//        self.layer.shadowPath = shadowPath.cgPath;
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        let view = self.viewWithTag(100);
        view?.frame = self.bounds;
    }
}
