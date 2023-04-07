//
//  AppTextField.swift
//  TableView
//
//  Created by Abdulaziz Boyqoziyev on 15/03/23.
//

import UIKit

class AppTextField: UITextField {
    private let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    init(placeholder: String?, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        commonInit()
       
        
    }
    private func commonInit() {
        textColor = .black
        backgroundColor = .clear
        attributedPlaceholder = .init(string: placeholder ?? "", attributes: [.foregroundColor: UIColor(ciColor: .black)])
        layer.cornerRadius = 6
        layer.masksToBounds = true
        layer.borderWidth = 0.75
        backgroundColor = .white
        
//        titleLabel.textColor = .black
//        addSubview(titleLabel)
//        titleLabel.snp.makeConstraints{ make in
//            make.top.equalTo(0)
//            make.leading.equalTo(5)
//            make.trailing.equalTo(-5)
//        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayerColor()
    }
    
    
    
    private func updateLayerColor() {
        layer.borderColor = isEditing ? UIColor.green.cgColor : UIColor.green.cgColor
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            let superRect: CGRect = super.textRect(forBounds: bounds)
            let leftRect: CGRect = super.leftViewRect(forBounds: bounds)
            let rightRect: CGRect = super.rightViewRect(forBounds: bounds)
            let hasLeftView: Bool = leftRect.size.width > 0
            let hasRightView: Bool = rightRect.size.width > 0
            let leftPadding: CGFloat = hasLeftView ? (insets.left +  leftRect.width + insets.left / 2.0) : insets.left
            let rightPadding: CGFloat = hasRightView ? (insets.right + rightRect.size.width + insets.right / 2.0) : insets.right
            let textRect = CGRect(x: leftPadding, y: superRect.origin.y, width: bounds.size.width - rightPadding - leftPadding, height: superRect.size.height)
            return textRect
        }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect: CGRect = super.rightViewRect(forBounds: bounds)
        rightViewRect.origin.x -= 16//insets.right
        return rightViewRect
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var leftViewRect: CGRect = super.leftViewRect(forBounds: bounds)
        leftViewRect.origin.x = 16//insets.left
        return leftViewRect
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 52 + 10
        return size   //.init(width: UIView.noIntrinsicMetric, height: 52)
    }
}

extension UITextField {
    func setupLeftSideImage(ImageViewNamed: String) {
        let imageView = UIImageView(frame: CGRect(x: 8/2, y: -8/2, width: 46, height: 46))
        imageView.image = UIImage(named: ImageViewNamed)
        let imageViewContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageViewContainerView.addSubview(imageView)
        leftView = imageViewContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}
