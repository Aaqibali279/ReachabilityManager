//
//  ReachabilityManager.swift
//  ReachabilityManager
//
//  Created by Aquib on 30/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
import Network


class ReachabilityManager: NSObject {
    static let instance = ReachabilityManager()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    weak var vc:UIViewController?
    
    private let alert:UIAlertController = { () -> UIAlertController in
        let alert = UIAlertController(title: "Network Disconneted", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }()
    
    private override init() {
        super.init()
        startMonitoring()
    }
    
    
    private func startMonitoring(){
        monitor.pathUpdateHandler = { [weak self] path in
            switch  path.status {
            case .satisfied:
                print("Connected")
                self?.hideAlert()
            default:
                print("Disconnected")
                self?.showAlert()
            }
            
            print(path.isExpensive)
        }
        
        monitor.start(queue: queue)
    }
    
    func showAlert(){
        DispatchQueue.main.async { [weak self] in
            guard let this = self else {return}
            this.vc?.present(this.alert, animated: true)
        }
    }
    
    func hideAlert(){
        DispatchQueue.main.async { [weak self] in
            guard let this = self else {return}
            this.alert.dismiss(animated: true)
        }
    }
    
    deinit {
        print("Items")
    }
    
    
}


