//
//  FilesView.swift
//  PostingView
//
//  Created by user on 2023/02/02.
//

import UIKit

class FilesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        let titleLable: UILabel = {
            let lbl = UILabel()
            lbl.text = "파일"
            return lbl
        }()
        self.addSubview(titleLable)
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(12)
        }
        
        let addBtn: UIButton = {
            let btn = UIButton()
            btn.setTitle("파일추가", for: .normal)
            btn.setTitleColor(.systemYellow, for: .normal)
            return btn
        }()
        self.addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.centerY.equalTo(titleLable.snp.centerY)
            make.right.equalToSuperview().inset(12)
        }
    }

}
