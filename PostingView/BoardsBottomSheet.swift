//
//  BoardsBottomSheet.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit

class BoardsBottomSheet: UIViewController {

    let boards = [("자유게시판","자유롭게 이야기를 나눠요"),("일상게시판","일상 이야기를 나눠요"),("취업게시판","취업 이야기를 나눠요"),("상담게시판","질문 상담을 나눠요"),]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.backgroundColor = UIColor.gray.cgColor.copy(alpha: 0.5)
        
        let bottomsheet = UIView()
        
        bottomsheet.backgroundColor = .systemGray
        bottomsheet.layer.cornerRadius = 15
        bottomsheet.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        
        view.addSubview(bottomsheet)
        bottomsheet.snp.makeConstraints { make in
            make.height.equalTo(400)
            make.left.right.bottom.equalToSuperview()
        }
        
        let xBtn: UIButton = {
            let btn = UIButton()
            btn.setTitle("X", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            return btn
        }()
        
        bottomsheet.addSubview(xBtn)
        xBtn.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(15)
        }
        
        xBtn.addTarget(self, action: #selector(xBtnTapped), for: .touchUpInside)
        
        let titleLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "게시판을 선택해주세요"
            lbl.font = UIFont(name: "", size: 20)
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
            stk.backgroundColor = .darkGray
            stk.alignment = .fill
            stk.distribution = .fill
            return stk
        }()
        
        bottomsheet.addSubview(boardsStackView)
        boardsStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(30)
        }
        
        for board in boards {
            let boardCell = BoardCell()
            boardCell.boardName = board.0
            boardCell.boardDetail = board.1
            boardCell.setUI()
            boardsStackView.addArrangedSubview(boardCell)
        }
    
    }
    
    @objc func xBtnTapped() {
        self.dismiss(animated: true)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dismiss(animated: true)
//    }
}
