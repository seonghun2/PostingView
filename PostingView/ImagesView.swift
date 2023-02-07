//
//  ImagesView.swift
//  PostingView
//
//  Created by user on 2023/02/01.
//

import UIKit

class ImagesView: UIView {
    
    let imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    var imagePickerClosure: (() -> ())?
    
    var imageRemoveClosure: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        backgroundColor = .white
        let addBtn: UIButton = {
            let btn = UIButton()
            btn.setTitle("이미지 추가\n(최대 5개)", for: .normal)
            btn.titleLabel?.lineBreakMode = .byWordWrapping
            btn.titleLabel?.textAlignment = .center
            btn.titleLabel?.font = UIFont(name: "NanumGothicOTFBold", size: 12)
            btn.backgroundColor = .white
            btn.setTitleColor(.gray, for: .normal)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.layer.cornerRadius = 15
            return btn
        }()
        
        addBtn.addTarget(self, action: #selector(presentImagePicker), for: .touchUpInside)
        
        addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(90)
        }
        
        let imagesScrollView = UIScrollView()
        addSubview(imagesScrollView)
        imagesScrollView.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(addBtn.snp.right).offset(15)
        }
    
        imagesScrollView.addSubview(imagesStackView)
        imagesStackView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    @objc func presentImagePicker() {
        print("이미지피커뷰 나와라")
        imagePickerClosure?()
    }
    
    @objc func removeImage(image: UIImageView) {
        print("이미지 삭제")
        imagesStackView.removeArrangedSubview(image)
    }
    
    func addImage(image: UIImage) {
        
        let newImage: UIImageView = {
            let img = UIImageView(image: image)
            img.backgroundColor = .systemMint
            img.contentMode = .scaleAspectFill
            img.clipsToBounds = true
            img.layer.cornerRadius = 16
            img.isUserInteractionEnabled = true
            return img
        }()
        
        let xBtn: UIButton = {
            let btn = UIButton()
            btn.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
            btn.layer.cornerRadius = 15
            btn.backgroundColor = .gray
            btn.tintColor = .white
            btn.addAction(UIAction{ _ in
                self.imagesStackView.removeArrangedSubview(newImage)
                newImage.removeFromSuperview()
                self.imageRemoveClosure?()
            }, for: .touchUpInside)
            return btn
        }()
        
        newImage.addSubview(xBtn)
        xBtn.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(2)
            make.width.height.equalTo(30)
        }
        
        imagesStackView.addArrangedSubview(newImage)
        newImage.snp.makeConstraints { make in
            //make.top.bottom.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
        
        //xBtn.addTarget(self, action: #selector(removeImage(image: newImage)), for: .touchUpInside)
    }
}
