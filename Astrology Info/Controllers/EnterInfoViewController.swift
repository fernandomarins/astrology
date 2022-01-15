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
    
    // Sun
    private let titleSun = UILabel()
    private let viewSun = UIView()
    private let labelSun = UILabel()
    private let buttonSun = UIButton()
    private let dropDownSun = DropDown()
    
    // Moon
    private let titleMoon = UILabel()
    private let viewMoon = UIView()
    private let labelMoon = UILabel()
    private let buttonMoon = UIButton()
    private let dropDownMoon = DropDown()
    
    override func viewDidLoad() {
        
        view.addSubview(titleSun)
        titleSun.font = .systemFont(ofSize: 25, weight: .heavy)
        titleSun.text = "Sol"
        titleSun.textColor = .black
        titleSun.setContentHuggingPriority(.required, for: .vertical)
        titleSun.setContentCompressionResistancePriority(.required, for: .vertical)
        titleSun.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(viewSun)
        viewSun.backgroundColor = .gray
        viewSun.snp.makeConstraints {
            $0.top.equalTo(titleSun.snp.bottom).offset(20)
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
        buttonSun.tag = 0
        buttonSun.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        viewSun.addSubview(dropDownSun)

        dropDownSun.anchorView = viewSun
        dropDownSun.direction = .bottom
        dropDownSun.bottomOffset = CGPoint(x: 0, y:(dropDownSun.anchorView?.plainView.bounds.height)!)
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDownSun.topOffset = CGPoint(x: 0, y:-(dropDownSun.anchorView?.plainView.bounds.height)!)

        // The list of items to display. Can be changed dynamically
        dropDownSun.dataSource = astroDB.signs
        
        // Action triggered on selection
        dropDownSun.selectionAction = { [unowned self] (index: Int, item: String) in
            labelSun.text = astroDB.signs[index]
        }

        // Will set a custom width instead of the anchor view width
        dropDownSun.width = 200
        
        view.addSubview(titleMoon)
        titleMoon.font = .systemFont(ofSize: 25, weight: .heavy)
        titleMoon.text = "Lua"
        titleMoon.textColor = .black
        titleMoon.setContentHuggingPriority(.required, for: .vertical)
        titleMoon.setContentCompressionResistancePriority(.required, for: .vertical)
        titleMoon.snp.makeConstraints {
            $0.top.equalTo(viewSun.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(viewMoon)
        viewMoon.backgroundColor = .gray
        viewMoon.snp.makeConstraints {
            $0.top.equalTo(titleMoon.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        viewMoon.addSubview(labelMoon)
        labelMoon.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        viewMoon.addSubview(buttonMoon)
        buttonMoon.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        buttonMoon.tag = 1
        buttonMoon.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        viewMoon.addSubview(dropDownMoon)

        dropDownMoon.anchorView = viewSun
        dropDownMoon.direction = .bottom
        dropDownMoon.bottomOffset = CGPoint(x: 0, y:(dropDownMoon.anchorView?.plainView.bounds.height)!)
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDownMoon.topOffset = CGPoint(x: 0, y:-(dropDownMoon.anchorView?.plainView.bounds.height)!)

        // The list of items to display. Can be changed dynamically
        dropDownMoon.dataSource = astroDB.signs
        
        // Action triggered on selection
        dropDownMoon.selectionAction = { [unowned self] (index: Int, item: String) in
            labelMoon.text = astroDB.signs[index]
        }

        // Will set a custom width instead of the anchor view width
        dropDownMoon.width = 200
    }
    
//    func createDropDownStructure(mainView: UIView, ) ->  DropDown {
//
//    }

    @objc func showMenu(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            dropDownSun.show()
        case 1:
            dropDownMoon.show()
        default:
            break
        }
    }

    
}
