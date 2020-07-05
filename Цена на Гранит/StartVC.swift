//
//  StartVC.swift
//  Цена на Гранит
//
//  Created by Дмитрий on 05.07.20.
//  Copyright © 2020 Sachkov Dmitry. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    
    @IBOutlet weak var graniteType: UISegmentedControl!
    
    @IBOutlet weak var lengthTxt: UITextField!
    @IBOutlet weak var widthTxt: UITextField!
    @IBOutlet weak var heightTxt: UITextField!
    
    var length = ""
    var width = ""
    var height = ""
    var graniteColor: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configeruTapGesture()
    }
    
    private func configeruTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(StartVC.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    private func configureTextFields() {
        lengthTxt.delegate = self
        widthTxt.delegate = self
        heightTxt.delegate = self
    }

    @IBAction func showPriceBtn(_ sender: Any) {
        length = lengthTxt.text!
        width = widthTxt.text!
        height = heightTxt.text!
        if graniteType.selectedSegmentIndex == 0 {
            graniteColor = 3200
        }else{
            graniteColor = 2800
        }
        performSegue(withIdentifier: "showPrice", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let priceVC = segue.destination as? PriceVC {
            priceVC.length = length
            priceVC.width = width
            priceVC.height = height
            priceVC.graniteType = graniteColor
        }
    }
}

extension StartVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
