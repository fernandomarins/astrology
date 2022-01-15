//
//  ViewController.swift
//  Astrology Info
//
//  Created by Fernando Marins on 13/01/22.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let astroDB = AstroDatabase.shared
    
    private let mainScrollView = UIScrollView()
    private let mainContainer = UIView()
    private let mainStackView = UIStackView()
    private let planetLabel = UILabel()
    private let planetPicker = UIPickerView()
    private let signLabel = UILabel()
    private let signPicker = UIPickerView()
    private let houseLabel = UILabel()
    private let housePicker = UIPickerView()
    private let showButton = UIButton()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
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
        mainStackView.spacing = 5
        mainStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
    
    private func setContentLayout() {
        mainStackView.addArrangedSubview(planetLabel)
        planetLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        planetLabel.text = "Selecione o planeta"
        planetLabel.textColor = .black
        planetLabel.setContentHuggingPriority(.required, for: .vertical)
        planetLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        planetLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
        }
        
        mainStackView.addArrangedSubview(planetPicker)
        planetPicker.dataSource = self
        planetPicker.delegate = self
        planetPicker.tag = 0
        planetPicker.setValue(UIColor.black, forKeyPath: "textColor")

        planetPicker.snp.makeConstraints {
            $0.top.equalTo(planetLabel.snp.bottom)
            $0.height.equalTo(200)
        }
        
        mainStackView.addArrangedSubview(signLabel)
        signLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        signLabel.text = "Selecione o signo"
        signLabel.textColor = .black
        signLabel.setContentHuggingPriority(.required, for: .vertical)
        signLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        signLabel.snp.makeConstraints {
            $0.top.equalTo(planetPicker.snp.bottom)
        }
        
        mainStackView.addArrangedSubview(signPicker)
        signPicker.dataSource = self
        signPicker.delegate = self
        signPicker.tag = 1
        signPicker.setValue(UIColor.black, forKeyPath: "textColor")
        signPicker.snp.makeConstraints {
            $0.top.equalTo(signLabel.snp.bottom)
            $0.height.equalTo(200)
        }
        
        mainStackView.addArrangedSubview(houseLabel)
        houseLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        houseLabel.text = "Selecione a casa"
        houseLabel.textColor = .black
        houseLabel.setContentHuggingPriority(.required, for: .vertical)
        houseLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        houseLabel.snp.makeConstraints {
            $0.top.equalTo(signPicker.snp.bottom)
        }
        
        mainStackView.addArrangedSubview(housePicker)
        housePicker.dataSource = self
        housePicker.delegate = self
        housePicker.tag = 2
        housePicker.setValue(UIColor.black, forKeyPath: "textColor")
        housePicker.snp.makeConstraints {
            $0.top.equalTo(houseLabel.snp.bottom)
            $0.height.equalTo(200)
        }
        
        mainStackView.addArrangedSubview(showButton)
        showButton.setTitle("mostrar infos", for: .normal)
        showButton.backgroundColor = .lightGray
        showButton.setTitleColor(.white, for: .normal)
        showButton.layer.cornerRadius = 10
        showButton.addTarget(self, action: #selector(showInfo), for: .touchUpInside)
        showButton.snp.makeConstraints {
            $0.top.equalTo(housePicker.snp.bottom)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func showInfo() {
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            if let destination = segue.destination as? InfoViewController {
                destination.sign = astroDB.signs[signPicker.selectedRow(inComponent: 0)]
                destination.house = astroDB.houses[housePicker.selectedRow(inComponent: 0)]
                destination.planet = astroDB.planets[planetPicker.selectedRow(inComponent: 0)]
            }
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return astroDB.planets.count
        case 1:
            return astroDB.signs.count
        case 2:
            return astroDB.houses.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return astroDB.planets[row]
        case 1:
            return astroDB.signs[row]
        case 2:
            return astroDB.houses[row]
        default:
            return nil
        }
    }

}

