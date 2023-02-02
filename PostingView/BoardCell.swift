//
//  BoardCell.swift
//  PostingView
//
//  Created by user on 2023/01/31.
//

import UIKit

class BoardCell: UIView {
    
    var boardName = ""
    
    var boardDetail = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.snp.makeConstraints { make in
            make.height.equalTo(57)
        }
        
        let boardNameLbl: UILabel = {
            let lbl = UILabel()
            lbl.text = boardName
            return lbl
        }()
        
        self.addSubview(boardNameLbl)
        boardNameLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(9)
            make.left.equalToSuperview().inset(13)
        }
        
        let boardDetailLbl: UILabel = {
            let lbl = UILabel()
            lbl.text = boardDetail
            return lbl
        }()
        
        addSubview(boardDetailLbl)
        boardDetailLbl.snp.makeConstraints { make in
            make.top.equalTo(boardNameLbl.snp.bottom).offset(3)
            make.left.equalToSuperview().inset(13)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(boardName)")
    }
}
