//
//  PriceVC.swift
//  Цена на Гранит
//
//  Created by Дмитрий on 05.07.20.
//  Copyright © 2020 Sachkov Dmitry. All rights reserved.
//

import UIKit

class PriceVC: UIViewController {
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var volumeLbl: UILabel!
    @IBOutlet weak var areaLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    
    var length = ""
    var width = ""
    var height = ""
    var graniteType: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let x = Double(length)
        let y = Double(width)
        let z = Double(height)
        
        areaLbl.text = "Площадь: \(calculateArea(length: x!, width: y!)) м2"
        volumeLbl.text = "Объем: \(calculateVolume(length: x!, width: y!, height: z!)) м3"
        weightLbl.text = "Вес: \(calculateWeight(length: x!, width: y!, height: z!, specificGravity: graniteType)) кг"
        priceLbl.text = "Цена: \(calculatePrice(length: x!, width: y!, height: z!)) руб"
    }
    
    func calculateArea(length: Double, width: Double) -> Double {
        let area = length * width
        return area
    }
    
    func calculateVolume(length: Double, width: Double, height: Double) -> Double {
       let volume = length * width * height
        return volume
    }
    
    func calculateWeight(length: Double, width: Double, height: Double, specificGravity: Double) -> Double {
        let weight = length * width * height * specificGravity
        return weight
    }
    
    func calculatePrice(length: Double, width: Double, height: Double) -> Double {
        let price = length * width * height * 110000
        return price
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
