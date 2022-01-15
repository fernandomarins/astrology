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
    
    private let astroDB = AstroDatabase.shared
    let dropDown = DropDown()
    private let viewSun = UIView()
    private let labelSun = UILabel()
    private let buttonSun = UIButton()
    
    override func viewDidLoad() {
        
        view.addSubview(viewSun)
        viewSun.backgroundColor = .gray
        viewSun.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }

        viewSun.addSubview(labelSun)
        labelSun.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        viewSun.addSubview(buttonSun)
        buttonSun.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        buttonSun.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        viewSun.addSubview(dropDown)

        
        dropDown.anchorView = viewSun
        dropDown.direction = .bottom
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = astroDB.signs
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            labelSun.text = astroDB.signs[index]
        }

        // Will set a custom width instead of the anchor view width
        dropDown.width = 200
    }
    
    @objc func showMenu() {
        dropDown.show()
    }

    
}
