//
//  FilmesViewController.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class FilmesViewController: UIViewController {
    
    var filmes: FilmesView?
    
    override func loadView() {
        self.filmes = FilmesView()
        self.view = filmes
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
