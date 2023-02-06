//
//  CloseAlertController.swift
//  PostingView
//
//  Created by user on 2023/02/05.
//

import UIKit

class CloseAlertController: UIAlertController {

    var closeClosure: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAction(UIAlertAction(title: "저장하고 닫기", style: .default) { _ in
            print("aa")
            self.closeClosure?()
        })
        
        addAction(UIAlertAction(title: "저장하지 않고 닫기", style: .default) { _ in
            print("aa")
        })
        
        addAction(UIAlertAction(title: "취소", style: .cancel))

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
