//
//  Buttons .swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class Bigbuttons : UIButton{
    override func awakeFromNib() {
        setupView()
    }
    
    
    func setupView() {
        self.layer.cornerRadius = 7
    }
}
