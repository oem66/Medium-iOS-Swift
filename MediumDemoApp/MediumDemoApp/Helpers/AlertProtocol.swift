//
//  AlertHelper.swift
//  MediumDemoApp
//
//  Created by Omer Rahmanovic on 1/25/21.
//  Copyright © 2021 Delta Software LLC. All rights reserved.
//

import UIKit

protocol AlertProtocol {
    func showCustomAlertFirst(title: String, message: String, actionTitle: String)
    func showCustomAlertSecond(title: String, message: String, actionTitle: String, actionTitle2: String)
    func showCustomAlertThird(title: String, message: String, actionTitle: String, actionTitle2: String, actionTitle3: String)
}
