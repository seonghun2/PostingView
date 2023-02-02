//
//  ViewController.swift
//  PostingView
//
//  Created by user on 2023/01/30.
//

import UIKit
import SnapKit

class ViewController: UIViewController{
    
    let imagePicker = UIImagePickerController()
    
    let imagesView = ImagesView()
    
    var numberOfImage = 0
    
    let filePicker = UIDocumentPickerViewController(forExporting:[.applicationDirectory
    ], asCopy: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        filePicker.delegate = self
        filePicker.modalPresentationStyle = .overFullScreen
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .blue
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.backgroundColor = .lightGray
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.distribution = .fill
            stackView.alignment = .fill
            return stackView
        }()
        
        scrollView.addSubview(stackView)
        //*
        stackView.snp.makeConstraints { make in
            //make.edges.equalTo(view.snp.edges).inset(10)
//            make.edges.equalToSuperview().inset(10)
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        let topBarView = TopBarView()
        topBarView.backgroundColor = .green
        stackView.addArrangedSubview(topBarView)
        topBarView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(70)
            //make.left.right.equalToSuperview().inset(20)
        }
        
        let selectionView = BoardSelectionView()
        stackView.addArrangedSubview(selectionView)
        selectionView.snp.makeConstraints { make in
            make.height.equalTo(70)
            //make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(topBarView.snp.bottom).offset(20)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(boardSelecting))
        selectionView.addGestureRecognizer(gesture)
        selectionView.isUserInteractionEnabled = true
        
        let textViews = TextViews()
        
        stackView.addArrangedSubview(textViews)
        textViews.snp.makeConstraints { make in
            make.height.equalTo(400)
            //make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(selectionView.snp.bottom).offset(40)
        }
        
        imagesView.imagePickerClosure = {
            if self.numberOfImage < 5 {
                self.numberOfImage += 1
                self.present(self.imagePicker, animated: true)
            } else {
                print("이미지는 5개만..")
            }
        }
        
        stackView.addArrangedSubview(imagesView)
        imagesView.snp.makeConstraints { make in
            make.height.equalTo(90)
            //make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(textViews.snp.bottom).offset(30)
        }
        
        
        let filesView = FilesView()
        stackView.addArrangedSubview(filesView)
        filesView.snp.makeConstraints { make in
            //make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(imagesView.snp.bottom).offset(20)
            //make.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //self.present(filePicker, animated: true)
        
    }
    
    @objc func boardSelecting() {
        print("게시판 선택ㄱㄱ")
        let vc = BoardsBottomSheet()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        imagesView.addImage(image: newImage!)
    
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
}

extension ViewController: UIDocumentPickerDelegate {
    
}

