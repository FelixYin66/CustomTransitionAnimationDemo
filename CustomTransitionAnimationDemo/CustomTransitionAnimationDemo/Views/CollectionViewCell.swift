//
//  CollectionViewCell.swift
//  CustomTransitionAnimationDemo
//
//  Created by Felix Yin on 2020/7/24.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    let imgView = UIImageView(); //苹果在iOS 10中对UIImageView离屏渲染进行了优化，添加圆角不会出现离屏渲染
    
    let btn = UIButton(); //苹果在iOS 10 没有对UIButton添加圆角后出现离屏渲染问题进行优化
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        //添加圆角
        
        //圆角方式1 帧率平均达到56fps，GPU使用率平均在24%，CPU使用率在5%
        let backgroundView = UIButton(frame: self.bounds);//UIView(frame: self.bounds);
        //运行在iPhone 6plus iOS 10.4系统上，btn没有设置标题时 UIButton当做一个普通View,添加圆角效果后 不会出现离屏渲染。当添加标题及圆角效果会出现离屏渲染效果
        backgroundView.setTitle("BackgroundView", for: UIControl.State.normal);
        backgroundView.layer.cornerRadius = 10;
//        backgroundView.layer.masksToBounds = true;
        backgroundView.backgroundColor = UIColor.systemPink;
        self.contentView.addSubview(backgroundView);
        
        //圆角方式2 帧率平均达到55fps，GPU使用率平均在30%，CPU使用率在5%
//        self.layer.cornerRadius = 10;
//        self.backgroundColor = UIColor.systemPink;
        
        //添加阴影
        self.layer.shadowColor = UIColor.black.cgColor;
        self.layer.shadowOffset = CGSize(width: 0, height: 10);
        self.layer.shadowRadius = 10;
        self.layer.shadowOpacity = 1.0;
        self.layer.masksToBounds = false;

        //添加路径是为了解决阴影带来的离屏渲染问题
        let shadowPath = UIBezierPath(rect: self.bounds);
        self.layer.shadowPath = shadowPath.cgPath;
        
        imgView.image = UIImage(named: "idcard");
        imgView.translatesAutoresizingMaskIntoConstraints = false;
        self.contentView.addSubview(imgView);
        imgView.layer.cornerRadius = 25;
        imgView.layer.masksToBounds = true;
//        imgView.backgroundColor = UIColor.blue
//        imgView.frame = CGRect(x: 30, y: 10, width: 50, height: 50);
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        imgView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true;
        imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true;
        
        
        btn.translatesAutoresizingMaskIntoConstraints = false;
        btn.setTitle("ButtonButton", for: UIControl.State.normal);
        btn.backgroundColor = UIColor.darkGray;
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = true;
        self.contentView.addSubview(btn);
        
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true;
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        btn.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 20).isActive = true;
        btn.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 20).isActive = true;
    }
    
    required init?(coder: NSCoder) {
        fatalError("Never Code");
    }
}
