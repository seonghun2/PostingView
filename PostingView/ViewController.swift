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
    
    let topBarView = TopBarView()
    let selectionView = BoardSelectionView()
    let textViews = TextViews()
    let imagesView = ImagesView()
    
    var numberOfImage = 0
    
    let filePicker = UIDocumentPickerViewController(forExporting:[.homeDirectory
    ], asCopy: true)
    
    var images: [UIImage] = []
    
    var files: [String] = []
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        filePicker.delegate = self
        filePicker.modalPresentationStyle = .overFullScreen
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.backgroundColor = .systemGray6
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.distribution = .fill
            stackView.alignment = .fill
            return stackView
        }()
        
        scrollView.addSubview(stackView)
        //*
        stackView.snp.makeConstraints { make in
            //make.edges.equalTo(view.snp.edges).inset(10)
//            make.edges.equalToSuperview().inset(10)
            make.width.equalToSuperview().inset(17)
            make.centerX.top.bottom.equalToSuperview()
        }
        
        topBarView.closeBtnClosure = {
            let vc = CloseAlertController()
            vc.saveClosure = {
                self.post?.board = self.selectionView.titleLabel.text!
                self.post?.title = self.textViews.titleTextField.text ?? ""
                self.post?.content = self.textViews.detailTextView.text ?? ""
                self.post?.images = self.images
                print("post saved \(self.post)")
            }
            self.present(vc, animated: true)
        }
        
        stackView.addArrangedSubview(topBarView)
        topBarView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(70)
        }
        
        stackView.addArrangedSubview(selectionView)
        selectionView.snp.makeConstraints { make in
            make.height.equalTo(70)
            //make.left.right.equalToSuperview().inset(10)
            //make.top.equalTo(topBarView.snp.bottom).inset(10)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(boardSelecting))
        selectionView.addGestureRecognizer(gesture)
        selectionView.isUserInteractionEnabled = true

        textViews.saveBtnActivate = {
            self.topBarView.registerBtn.setTitleColor(.black, for: .normal)
            self.topBarView.registerBtn.isEnabled = true
        }
        textViews.saveBtnDisable = {
            self.topBarView.registerBtn.setTitleColor(.gray, for: .normal)
            self.topBarView.registerBtn.isEnabled = false
        }
        
        stackView.addArrangedSubview(textViews)
        textViews.snp.makeConstraints { make in
            make.height.equalTo(400)
            //make.left.right.equalToSuperview().inset(20)
            //make.top.equalTo(selectionView.snp.bottom).offset(40)
        }
        
        imagesView.imagePickerClosure = {
            if self.numberOfImage < 5 {
                self.present(self.imagePicker, animated: true)
            } else {
                print("이미지는 5개만..")
            }
        }
        imagesView.imageRemoveClosure = {
            self.numberOfImage -= 1
            print("이미지 수: \(self.numberOfImage)")
        }
        
        stackView.addArrangedSubview(imagesView)
        imagesView.snp.makeConstraints { make in
            make.height.equalTo(90)
            //make.left.right.equalToSuperview().inset(20)
            //make.top.equalTo(textViews.snp.bottom).offset(30)
        }
        
        let filesView = FilesView()
        stackView.addArrangedSubview(filesView)
        filesView.snp.makeConstraints { make in
            //make.left.right.equalToSuperview().inset(20)
           // make.top.equalTo(imagesView.snp.bottom).offset(50)
            //make.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(300)
        }
        filesView.documentPickerClosure = {
            self.present(self.filePicker, animated: true)
        }
        let margin = UIView()
        margin.backgroundColor = .systemGray6
        view.addSubview(margin)
        margin.snp.makeConstraints { make in
            make.top.equalTo(imagesView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(7)
        }
    }
    
    @objc func boardSelecting() {
        print("게시판 선택ㄱㄱ")
        let vc = BoardsBottomSheet()
        vc.modalPresentationStyle = .overFullScreen
        vc.boardSelectionClosure = { boardName in
            print(boardName)
            self.selectionView.titleLabel.text = boardName
        }
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
        
        self.numberOfImage += 1
        self.images.append(newImage!)
        imagesView.addImage(image: newImage!)
        print("이미지 수: \(self.numberOfImage)")
    
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
}

extension ViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        dismiss(animated: true)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print(url.absoluteString)
    }
}

