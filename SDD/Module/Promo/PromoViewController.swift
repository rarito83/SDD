//
//  PromoViewController.swift
//  SDD
//
//  Created by Rahmat Susanto on 01/10/23.
//

import UIKit

protocol PromoViewProtocol {
    var presenter: PromoPresenterProtocol? { get set }
    
    func updateWithData(data: PromoResponse)
    func updateWithError(error: String)
}

class PromoViewController: UIViewController, PromoViewProtocol {

    private let reuseIdentifier = "promo"
    var presenter: PromoPresenterProtocol?
    var promos: [PromoResponse] = []
    
    private let promoListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: PromoCollectionViewCell.identifier)
        collection.isHidden = true
        return collection
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.startAnimating()
        return loading
    }()
    
    func updateWithData(data: PromoResponse) {
        DispatchQueue.main.async { [weak self] in
//            self?.promos.append(contentsOf: data.results ?? [])
//            self?.totalPages = data.total_pages ?? 0
            self?.loadingIndicator.stopAnimating()
            self?.loadingIndicator.isHidden = true
            self?.promoListCollectionView.isHidden = false
            self?.promoListCollectionView.reloadData()
        }
    }
    
    func updateWithError(error: String) {
        print(error.localizedLowercase)
    }
    
    override func loadView() {
        super.loadView()
        presenter?.fetchPromo()
        print("DEBUG: Fetch Promo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        
        view.addSubview(promoListCollectionView)
        view.addSubview(loadingIndicator)
        promoListCollectionView.delegate = self
        promoListCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        promoListCollectionView.frame = view.bounds
        loadingIndicator.frame = view.bounds
    }
}

extension PromoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.identifier, for: indexPath) as? PromoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let promo = promos[indexPath.row]
        
//        cell.configurePoster(url: promo.poster_path ?? "")
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        promoListCollectionView.deselectItem(at: indexPath, animated: true)
        let promo = promos[indexPath.row]
        presenter?.tapPromoDetail(promo: promo, view: self)
    }

}
