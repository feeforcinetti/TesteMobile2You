//
//  ConfiViewProtocol.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import Foundation

protocol ConfigViewProtocol {
    func configureView()
    func configureSubviews()
    func configureConstraints()
}

extension ConfigViewProtocol {
    func configureView() {
        configureSubviews()
        configureConstraints()
    }
}
