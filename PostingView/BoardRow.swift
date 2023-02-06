//
//  boardRow.swift
//  PostingView
//
//  Created by user on 2023/01/31.
//

import UIKit

class BoardRow: UIView {
    
    var boardName = ""
    
    var boardDetail = ""
    
    var boardSelectionClosure: ((String) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        self.layer.cornerRadius = 8
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
            lbl.font = UIFont(name: "NanumGothicOTFBold", size: 13)
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
            lbl.font = UIFont(name: "NanumGothicOTF", size: 13)
            lbl.text = boardDetail
            return lbl
        }()
        
        addSubview(boardDetailLbl)
        boardDetailLbl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(9)
            make.left.equalTo(boardNameLbl.snp.left)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(boardName)")
        boardSelectionClosure?(boardName)
    }
}
