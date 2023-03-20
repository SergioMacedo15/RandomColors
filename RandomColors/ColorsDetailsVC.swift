//
//  ColorsDetailsVC.swift
//  RandomColors
//
//  Created by Sergio Silva Macedo on 09/03/23.
//

import UIKit

class ColorsDetailsVC: UIViewController {

    var color : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }

}
