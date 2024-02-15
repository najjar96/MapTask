//
//  LocationViewModel.swift
//  SampleMapApp
//
//  Created by Mhmd Najjar on 14/02/2024.
//

import Foundation
import MapKit

class LocationListViewModel {
    var locations: [Location] = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 31.951598, longitude: 35.939170), title: "Roman Theater",image: UIImage(named: "RomanTheater")!,details: "The Roman theater, on the other hand, was characterized by a tall, wide scaenae frons (stage-front) with multiple stories, articulated by freestanding columns and lavishly ornamented"),
        Location(coordinate: CLLocationCoordinate2D(latitude: 32.276606, longitude: 35.8500), title: "Jerash", image: UIImage(named: "jerash")!,details: "The earliest evidence of settlement in Jerash is in a Neolithic site known as Tal Abu Sowan, where rare human remains dating to around 7500 BC were uncovered."),
        Location(coordinate: CLLocationCoordinate2D(latitude: 30.328392, longitude: 35.444152), title: "Petra", image: UIImage(named: "petra")!,details: "Petra is half-built, half-carved into the rock, and is surrounded by mountains riddled with passages and gorges."),
        Location(coordinate: CLLocationCoordinate2D(latitude: 29.529352, longitude: 35.001885), title: "Aqaba", image: UIImage(named: "aqaba")!,details: "Aqaba has an ideal combination of city-life, beaches and history. The southernmost city in Jordan, Aqaba sits on the northeastern tip of the Red Sea and is surrounded by mountains and desert."),
    ]
}
