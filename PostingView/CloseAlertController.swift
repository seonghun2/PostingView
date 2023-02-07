//
//  CloseAlertController.swift
//  PostingView
//
//  Created by user on 2023/02/05.
//

import UIKit

class CloseAlertController: UIAlertController {

    var saveClosure: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAction(UIAlertAction(title: "저장하고 닫기", style: .default) { _ in
            self.saveClosure?()
        })
        
        addAction(UIAlertAction(title: "저장하지 않고 닫기", style: .default) { _ in
            print("aa")
        })
        
        addAction(UIAlertAction(title: "취소", style: .cancel))
    }
}
