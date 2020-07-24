//
//  DetailViewController.swift
//  CustomTransitionAnimationDemo
//
//  Created by Felix Yin on 2020/7/24.
//

import UIKit


public struct Layout {
    
    // MARK: - Properties
    public let cornerRadius: CGFloat
    public let topOffset: CGFloat
    public let closeButtonAlpha: CGFloat
    
    // MARK: - Init
    private init(cornerRadius: CGFloat, topOffset: CGFloat, closeButtonAlpha: CGFloat) {
        self.cornerRadius = cornerRadius
        self.topOffset = topOffset
        self.closeButtonAlpha = closeButtonAlpha
    }
    
    // MARK: - Layouts
    public static let collapsed = Layout(cornerRadius: 13,
                                         topOffset: 20,
                                         closeButtonAlpha: 0)
    
    public static let expanded = Layout(cornerRadius: 0,
                                        topOffset: 20 + UIWindow.safeAreaTopInset,
                                        closeButtonAlpha: 1)
}

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.systemPink;
    }
    
    func layout(presenting:Bool) -> Void {
        let cardLayout:Layout = presenting ? Layout.expanded : Layout.collapsed;
        self.view.layer.cornerRadius = cardLayout.cornerRadius;
        self.view.layer.masksToBounds = true;
    }
    
}


extension UIWindow {
    static var safeAreaTopInset: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        } else {
            return 20.0
        }
    }
}
