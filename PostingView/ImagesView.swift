//
//  ImagesView.swift
//  PostingView
//
//  Created by user on 2023/02/01.
//

import UIKit

class ImagesView: UIView {
    
    let imagesScrollView: UIScrollView = {
        let scrView = UIScrollView()
        scrView.backgroundColor = .systemYellow
        scrView.contentSize = .init(width: 400, height: 90)
        return scrView
    }()
    
    let imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    var imagePickerClosure: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        let addBtn: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .purple
            btn.layer.borderWidth = 1
            btn.setTitle("추가", for: .normal)
            btn.layer.cornerRadius = 3
            return btn
        }()
        
        addBtn.addTarget(self, action: #selector(presetImagePicker), for: .touchUpInside)
        
        addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(90)
        }
        
        addSubview(imagesScrollView)
        imagesScrollView.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(addBtn.snp.right).offset(15)
        }
        
        //스크롤뷰 위에 스택뷰 얹어서 이미지 하나씩 추가하려고했는데 스택뷰 얹으니 스크롤이 안먹음
        imagesScrollView.addSubview(imagesStackView)
        imagesStackView.backgroundColor = .lightGray
        imagesStackView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    @objc func presetImagePicker() {
        print("이미지피커뷰 나와라")
        imagePickerClosure?()
    }
    
    func addImage(image: UIImage) {
        
        let newImage: UIImageView = {
            let img = UIImageView(image: image)
            img.backgroundColor = .systemMint
            img.contentMode = .scaleAspectFit
            return img
        }()
        
        imagesStackView.addArrangedSubview(newImage)
        newImage.snp.makeConstraints { make in
            //make.top.left.bottom.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
    
    }
}
