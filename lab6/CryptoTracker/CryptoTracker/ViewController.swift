//
//  ViewController.swift
//  CryptoTracker
//
//  Created by David [Entei] Xiong on 3/7/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let currencyData = Data()
    var selectedCurrency: String!
    var selectedCrypto: String!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.currencyData.cryptoNames.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.currencyData.cryptoNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCrypto = currencyData.cryptoData[currencyData.cryptoNames[row]]
    }
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    @IBOutlet weak var currencySegmentControl: UISegmentedControl!
    @IBOutlet weak var currencyPickerview: UIPickerView!
    
    @IBAction func currencySelectedChanged(_ sender: UISegmentedControl) {
        switch currencySegmentControl.selectedSegmentIndex {
        case 0:
            selectedCurrency = "USD"
        case 1:
            selectedCurrency = "EUR"
        case 2:
            selectedCurrency = "GBP"
        default:
            selectedCurrency = "USD"
        }
    }
    
    @IBAction func refreshData(_ sender: UIButton) {
        if let currency = selectedCurrency as? String,
           let crypto = selectedCrypto as? String {
            fetchAndDisplayData(currency: currency, crypto: crypto)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPickerview.dataSource = self
        currencyPickerview.delegate = self
        selectedCrypto = "BIT"
        selectedCurrency = "USD"
        fetchAndDisplayData(currency: "USD", crypto: "BIT")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func fetchAndDisplayData(currency: String, crypto: String) {
        guard let link = URL(string: "https://api.cryptonator.com/api/ticker/\(crypto)-\(currency)") else {return}
        print(link)
        URLSession.shared.dataTask(with: link, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                guard let data = data else {return}
                do {
                    let decoded = try JSONDecoder().decode(TickerData.self, from: data) //decoded will be of type Course
                    DispatchQueue.main.async {
                        self.symbolLabel.text = decoded.ticker.base
                        self.nameLabel.text = self.selectedCrypto
                        if let symbol = self.currencyData.currencyData[currency] as? String,
                            let price = Float(decoded.ticker.price) {
                            let multiplier = Float(pow(10.0, 2.0))
                            let rounded = round(price * multiplier) / multiplier
                            self.priceLabel.text = "\(symbol)\(rounded)"
                        }
                        if let change = decoded.ticker.change as? String {
                            self.changeLabel.text = "\(change)%"
                        }
                        if let change = Float(decoded.ticker.change) {
                            if (change < 0.0) {
                                self.changeLabel.textColor = .red
                            } else {
                                self.changeLabel.textColor = .green
                            }
                        }
                    }
                } catch let jsonError {
                    print("Error serializing JSON: ", jsonError)
                }
                
            }
        }).resume()
    }
}

struct TickerData: Decodable{
    let ticker: Ticker!
    let timestamp: Int!
    let success: Bool!
    let error: String!
}

struct Ticker: Decodable {
    let base: String!
    let target: String!
    let price: String!
    let volume: String!
    let change: String!
}
