//
//  DebugViewController.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 20/01/22.
//

import Foundation
import UIKit

/*
Use este ViewController para depurar seus componentes View.

  1) Altere o tipo `myView` para sua subclasse UIView
  2) Defina `myViewHeight` de acordo com sua visualização
  3) Defina uma instância de DebugViewController como rootViewController da janela no arquivo `SceneDelegate.swift`*/


class DebugViewController: UIViewController {

    private let myView: UIView = {

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let myViewHeight: CGFloat = 200

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white

        view.addSubview(myView)

        NSLayoutConstraint.activate([

            myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myView.heightAnchor.constraint(equalToConstant: myViewHeight),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

