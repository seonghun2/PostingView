//
//  TopBarView.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class TopBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        let TitleLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "포스트 등록"
            return lbl
        }()
        
        let closeBtn: UIButton = {
            let btn = UIButton()
            btn.setTitle("닫기", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            return btn
        }()
        
        let registerBtn: UIButton = {
            let btn = UIButton()
            btn.setTitle("등록", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            return btn
        }()
        
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
