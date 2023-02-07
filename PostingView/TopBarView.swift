//
//  TopBarView.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class TopBarView: UIView {
    
    var closeBtnClosure:(() -> ())?
    
    let registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("등록", for: .normal)
        btn.setTitleColor(.systemGray4, for: .normal)
        btn.titleLabel?.font = UIFont(name: "NanumGothicOTF", size: 14)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeBtnTapped() {
        closeBtnClosure?()
    }
    
    func setUI() {
        backgroundColor = .white
        let TitleLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "포스트 등록"
            lbl.font = UIFont(name: "NanumGothicOTFBold", size: 16)
            return lbl
        }()
        
        let closeBtn: UIButton = {
            let btn = UIButton()
            btn.setTitle("닫기", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = UIFont(name: "NanumGothicOTF", size: 14)
            return btn
        }()
        closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
    
        self.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        self.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
