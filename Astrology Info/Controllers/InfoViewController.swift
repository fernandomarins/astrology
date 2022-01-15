//
//  InfoViewController.swift
//  Astrology Info
//
//  Created by Fernando Marins on 13/01/22.
//

import Foundation
import UIKit
import SnapKit

class InfoViewController: UIViewController {
    private let mainScrollView = UIScrollView()
    private let mainContainer = UIView()
    private let mainStackView = UIStackView()
    private let planetTitle = UILabel()
    private let signTitle = UILabel()
    private let signLabel = UILabel()
    private let houseTitle = UILabel()
    private let houseLabel = UILabel()
    var planet: String?
    var sign: String?
    var house: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setupInfos()
    }

    
    private func setLayout() {
        setScrollViewLayout()
        setContentLayout()
    }
    
    private func setScrollViewLayout() {
        view.addSubview(mainScrollView)
        mainScrollView.showsVerticalScrollIndicator = true
        mainScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        mainScrollView.addSubview(mainContainer)
        mainContainer.backgroundColor = .white
        mainContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview().priority(.medium)
        }
        
        mainContainer.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 20
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    private func setContentLayout() {
        mainStackView.addArrangedSubview(planetTitle)
        planetTitle.font = .systemFont(ofSize: 40, weight: .bold)
        planetTitle.text = planet
        planetTitle.textColor = .white
        planetTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-60)
            $0.leading.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(signTitle)
        signTitle.font = .systemFont(ofSize: 25, weight: .bold)
        if let sign = sign {
            signTitle.text = "Signo: \(String(describing: sign))"
        }
        signTitle.textColor = .black
        signTitle.snp.makeConstraints {
            $0.top.equalTo(planetTitle.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(signLabel)
        signLabel.font = .systemFont(ofSize: 20, weight: .regular)
        signLabel.numberOfLines = 0
        signLabel.textColor = .black
        signLabel.setContentHuggingPriority(.required, for: .vertical)
        signLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        signLabel.snp.makeConstraints {
            $0.top.equalTo(signTitle.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(houseTitle)
        houseTitle.font = .systemFont(ofSize: 25, weight: .bold)
        if let house = house {
            houseTitle.text = "Casa: \(String(describing: house))"
        }
        houseTitle.textColor = .black
        houseTitle.snp.makeConstraints {
            $0.top.equalTo(signLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(houseLabel)
        houseLabel.font = .systemFont(ofSize: 20, weight: .regular)
        houseLabel.numberOfLines = 0
        houseLabel.textColor = .black
        houseLabel.setContentHuggingPriority(.required, for: .vertical)
        houseLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        houseLabel.snp.makeConstraints {
            $0.top.equalTo(houseTitle.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
    }
    
    private func setupInfos() {
        if let planet = planet,
        let sign = sign,
        let house = house {
            signLabel.text = AstroDatabase.shared.dictionarySigns[planet]?[sign]
            houseLabel.text = AstroDatabase.shared.planetsHouses[planet]?[house]
        }
        
    }
}
