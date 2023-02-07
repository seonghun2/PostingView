//
//  BoardSelectionView.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class BoardSelectionView: UIView {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "일상게시판"
        lbl.font = UIFont(name: "NanumGothicOTFBold", size: 16)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 8
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        let selectionImage = UIImageView(image: UIImage(named: "selectionArrow"))
        
        self.addSubview(selectionImage)
        selectionImage.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(12)
            make.height.equalTo(6)
        }
    }

}
