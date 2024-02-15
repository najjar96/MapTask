//
//  ViewController.swift
//  SampleMapApp
//
//  Created by Mhmd Najjar on 14/02/2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dialogView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var desicriptionLabel: UILabel!

    var viewModel = LocationListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        let jordanRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.951598, longitude: 35.939170), span: MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0))
        mapView.setRegion(jordanRegion, animated: true)
        
        for location in viewModel.locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = location.title
            mapView.addAnnotation(annotation)
        }
        
        imageView.isHidden = true
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        dialogView.layer.cornerRadius = 5
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardMapCollectionViewCell", for: indexPath) as! CardMapCollectionViewCell
        cell.bgView.layer.cornerRadius = 9
        cell.itemImage.layer.cornerRadius = 5
        let location = viewModel.locations[indexPath.row]
        cell.titleLabel.text = location.title
        cell.itemImage.image = location.image
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLocation = viewModel.locations[indexPath.row]
        let region = MKCoordinateRegion(center: selectedLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
        imageView.isHidden = false
        dialogView.isHidden = false
        imageView.image = selectedLocation.image
        desicriptionLabel.text = selectedLocation.details
    }

}
