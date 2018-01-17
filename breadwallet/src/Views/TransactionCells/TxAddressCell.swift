//
//  TxAddressCell.swift
//  breadwallet
//
//  Created by Ehsan Rezaie on 2017-12-20.
//  Copyright © 2017 breadwallet LLC. All rights reserved.
//

import UIKit

class TxAddressCell: TxDetailRowCell {

    // MARK: - Vars
    
    private var store: Store?
    
    // MARK: Views
    
    private let addressButton = UIButton(type: .system)
    
    // MARK: - Init
    
    override func addSubviews() {
        super.addSubviews()
        container.addSubview(addressButton)
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        addressButton.constrain([
            addressButton.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: C.padding[1]),
            addressButton.constraint(.trailing, toView: container),
            addressButton.constraint(.top, toView: container),
            addressButton.constraint(.bottom, toView: container)
            ])
    }
    
    override func setupStyle() {
        super.setupStyle()
        addressButton.titleLabel?.font = .customBody(size: 13.0)
        addressButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
        addressButton.titleLabel?.textAlignment = .right
        addressButton.tintColor = .darkText
        
        addressButton.tap = strongify(self) { myself in
            myself.addressButton.tempDisable()
            myself.store?.trigger(name: .lightWeightAlert(S.Receive.copied))
            UIPasteboard.general.string = myself.addressButton.titleLabel?.text
        }
    }
    
    func set(address: String, store: Store) {
        addressButton.setTitle(address, for: .normal)
        self.store = store
    }

}
