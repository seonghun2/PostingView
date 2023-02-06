//
//  FileRow.swift
//  PostingView
//
//  Created by user on 2023/02/03.
//

import UIKit

class FileRow: UIView {
    
    var deleteClosure: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        deleteClosure?()
        print("삭제 ㄲ")
    }
}
