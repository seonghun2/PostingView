//
//  FilesView.swift
//  PostingView
//
//  Created by user on 2023/02/02.
//

import UIKit

class FilesView: UIView {
    
    var documentPickerClosure: (() -> ())?
    
    let filesStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

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
        addBtn.addTarget(self, action: #selector(presentDocumentPicker), for: .touchUpInside)
    
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .gray
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(addBtn.snp.bottom).offset(10)
        }
        
        scrollView.addSubview(filesStackview)
        filesStackview.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
    }
    
    @objc func presentDocumentPicker() {
        documentPickerClosure?()
    }
    
    func addFile() {
        let newFileView = FileRow()
        newFileView.backgroundColor = .systemGray6
        filesStackview.addArrangedSubview(newFileView)
        newFileView.snp.makeConstraints { make in
            make.height.equalTo(30)
            //make.width.equalTo(300)
        }
        newFileView.deleteClosure = {
            self.filesStackview.removeArrangedSubview(newFileView)
        }
    }
}
