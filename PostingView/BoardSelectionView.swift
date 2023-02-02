//
//  BoardSelectionView.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class BoardSelectionView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        self.backgroundColor = .brown
        
        let titleLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "일상게시판"
            lbl.backgroundColor = .green
            return lbl
        }()
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        let btn: UIButton = {
            let btn = UIButton()
            btn.setTitle("O", for: .normal)
            btn.setTitleColor(.cyan, for: .normal)
            return btn
        }()
        
        self.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.right.equalToSuperview().inset(20)
        }
    }

}
