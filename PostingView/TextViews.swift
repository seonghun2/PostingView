//
//  TextViews.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class TextViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.backgroundColor = .red
        let titleTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "제목을 입력해주세요"
            tf.backgroundColor = .orange
            return tf
        }()
        
        self.addSubview(titleTextField)
        
        titleTextField.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        let detailTextView: UITextView = {
            let tv = UITextView()
            tv.text = "ADfadf"
            tv.backgroundColor = .cyan
            return tv
        }()
        
        self.addSubview(detailTextView)
        detailTextView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }

}
