//
//  ApplePayVC.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 10/30/20.
//  Copyright © 2020 Delta Software LLC. All rights reserved.
//

import UIKit
import PassKit

class ApplePayVC: UIViewController {
    
    let tapToApplePay: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple Pay", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    let completionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Apple Pay", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10.0
        
        return button
    }()
    
    private var paymentRequest: PKPaymentRequest = {
        let request = PKPaymentRequest()
        request.merchantIdentifier = "merchant.com.omer.MediumDemoApp"
        request.supportedNetworks = [.amex, .masterCard, .visa, .mada, .quicPay]
        request.supportedCountries = ["US"]
        request.merchantCapabilities = .capability3DS
        request.countryCode = "US"
        request.currencyCode = "USD"
        request.requiredBillingContactFields = [.postalAddress, .phoneNumber, .name]
        
        let fare = PKPaymentSummaryItem(label: "Minimum Fare", amount: NSDecimalNumber(string: "9.99"), type: .final)
        let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "1.00"), type: .final)
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "10.99"), type: .pending)
        request.paymentSummaryItems = [fare, tax, total]
        
        //        request.paymentSummaryItems = [PKPaymentSummaryItem(label: "iPhone 12 Pro 128 GB", amount: 999),PKPaymentSummaryItem(label: "iPhone 11 Pro 64 GB", amount: 799), PKPaymentSummaryItem(label: "iPhone X 64 GB", amount: 599), PKPaymentSummaryItem(label: "Apple MacBook Pro 13' 512 GB", amount: 2999),]
        
        return request
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Apple Pay"
        
        view.backgroundColor = .secondarySystemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .green
        
        view.addSubview(tapToApplePay)
        view.addSubview(completionButton)
        
        NSLayoutConstraint.activate([
            tapToApplePay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapToApplePay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tapToApplePay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tapToApplePay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            tapToApplePay.widthAnchor.constraint(equalToConstant: 60),
            tapToApplePay.heightAnchor.constraint(equalToConstant: 40),
            
            completionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completionButton.topAnchor.constraint(equalTo: tapToApplePay.bottomAnchor, constant: 20),
            completionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            completionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        tapToApplePay.addTarget(self, action: #selector(applePayTapped), for: .touchUpInside)
        completionButton.addTarget(self, action: #selector(completionButtonTapped), for: .touchUpInside)
    }
    
    @objc func applePayTapped() {
        let controller = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
        if controller != nil {
            controller!.delegate = self
            present(controller!, animated: true) {
                print("Completed")
            }
        }
    }
    
    @objc func completionButtonTapped() {
        Webservice().fetchFakeData(isElectric: true, brand: "Volkswagen", model: "ID.3") { (message, isGoodOptionToBuy) in
            if isGoodOptionToBuy {
                print(message)
            } else {
                print(message)
            }
        }
    }
}

extension ApplePayVC: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
    }
}
