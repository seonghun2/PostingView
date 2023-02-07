//
//  BoardsBottomSheet.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class BoardsBottomSheet: UIViewController {

    let boards = [("자유게시판","자유롭게 이야기를 나눠요"),("일상게시판","일상 이야기를 나눠요"),("취업게시판","취업 이야기를 나눠요"),("상담게시판","질문 상담을 나눠요"),]
    
    var boardSelectionClosure: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.backgroundColor = UIColor.gray.cgColor.copy(alpha: 0.5)
        
        let bottomsheet = UIView()
        
        bottomsheet.backgroundColor = .white
        bottomsheet.layer.cornerRadius = 15
        bottomsheet.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        
        view.addSubview(bottomsheet)
        bottomsheet.snp.makeConstraints { make in
            make.height.equalTo(400)
            make.left.right.bottom.equalToSuperview()
        }
        
        let xBtn: UIButton = {
            let btn = UIButton()
            btn.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
            btn.tintColor = .darkGray
            return btn
        }()
        
        bottomsheet.addSubview(xBtn)
        xBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(25)
            make.right.equalToSuperview().inset(16)
        }
        
        xBtn.addTarget(self, action: #selector(xBtnTapped), for: .touchUpInside)
        
        let titleLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "게시판을 선택해주세요"
            lbl.font = UIFont(name: "NanumGothicOTFBold", size: 20)
            return lbl
        }()
        
        bottomsheet.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(xBtn)
            make.left.equalToSuperview().inset(20)
        }
        
        let boardsStackView: UIStackView = {
            let stk = UIStackView()
            stk.axis = .vertical
            stk.spacing = 10
            stk.alignment = .fill
            stk.distribution = .fill
            return stk
        }()
        
        bottomsheet.addSubview(boardsStackView)
        boardsStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        for board in boards {
            let boardRow = BoardRow()
            boardRow.boardName = board.0
            boardRow.boardDetail = board.1
            boardRow.setUI()
            boardRow.boardSelectionClosure = { boardName in
                self.boardSelectionClosure?(boardName)
                self.dismiss(animated: true)
            }
            boardsStackView.addArrangedSubview(boardRow)
        }
    }
    
    @objc func xBtnTapped() {
        self.dismiss(animated: true)
    }
    
}
