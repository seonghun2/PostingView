//
//  TextViews.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class TextViews: UIView {
    
    let textViewPlaceHolder = "포스팅 내용을 적어주세요. (최소 20자)"
    
    var saveBtnActivate: (() -> ())?
    var saveBtnDisable: (() -> ())?
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "제목을 입력해주세요"
        tf.backgroundColor = .white
        tf.font = UIFont(name: "NanumGothicOTF", size: 16)
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        tf.leftViewMode = .always
        return tf
    }()
    
    let detailTextView: UITextView = {
        let tv = UITextView()
        tv.text = "포스팅 내용을 적어주세요. (최소 20자)"
        tv.textColor = .systemGray3
        tv.font = UIFont(name: "NanumGothicOTF", size: 16)
        tv.textContainerInset = UIEdgeInsets(top: 13, left: 12, bottom: 13, right: 13)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if !titleTextField.text!.isEmpty && detailTextView.text.count >= 20 && detailTextView.text != textViewPlaceHolder {
            saveBtnActivate?()
        } else {
            saveBtnDisable?()
        }
    }
    
    func setUI() {
        detailTextView.delegate = self
        
        self.addSubview(titleTextField)
        
        titleTextField.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        titleTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        self.addSubview(detailTextView)
        detailTextView.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(2)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension TextViews: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if !titleTextField.text!.isEmpty && textView.text.count >= 20 && textView.text != textViewPlaceHolder {
            saveBtnActivate?()
        } else {
            saveBtnDisable?()
        }
    }
}


