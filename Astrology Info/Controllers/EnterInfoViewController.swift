//
//  EnterInfoViewController.swift
//  Astrologia
//
//  Created by Fernando Marins on 14/01/22.
//

import Foundation
import UIKit
import DropDown
import SnapKit

class EnterInfoViewController: UIViewController {
    
    let dropDown = DropDown()
    private let viewSun = UIView()
    private let labelSun = UILabel()
    private let buttonSun = UIButton()
    
    override func viewDidLoad() {
        
        view.addSubview(viewSun)
        viewSun.backgroundColor = .green
        view.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(20)
            $0.height.equalTo(40)
        }
        
        view.addSubview(labelSun)
        labelSun.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(buttonSun)
        buttonSun.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
//        // The view to which the drop down will appear on
//        dropDown.snp.makeConstraints {
//            $0.top.equalTo(view.snp.top).offset(20)
//        } // UIView or UIBarButtonItem
//
//        // The list of items to display. Can be changed dynamically
//        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
//        
//        // Action triggered on selection
//        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//          print("Selected item: \(item) at index: \(index)")
//        }

        // Will set a custom width instead of the anchor view width
//        dropDown.width = 200
    }

    
}
