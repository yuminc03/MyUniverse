//
//  HomeViewModel.swift
//  MyUniverse
//
//  Created by Yumin Chu on 2023/03/16.
//

import Foundation

final class HomeViewModel {
    
    private let homeTopTitleString: String = "Home"
    private let homeTableHeaderTitles: [String] = ["별자리", "태양계", "성간물질", "휴식공간"]
    private let collectionViewCellTitles: [[String]] = [["탄생 별자리", "계절별 별자리"], ["행성", "태양"], ["소행성", "성운", "은하"], ["Universe Quiz", ""]]
    
    func numberOfSections() -> Int {
        return homeTableHeaderTitles.count
    }
    
    func numberOfRowsInSection() -> Int {
        return 1
    }
    
    func getHomeTableHeaderTitles() -> [String] {
        return homeTableHeaderTitles
    }
    
    func getCollectionNumberOfItemsInSection(section: Int) -> Int {
        return collectionViewCellTitles[section].count
    }
    
    func getCollectionViewCellTitles(section: Int, item: Int) -> String {
        return collectionViewCellTitles[section][item]
    }
}
 
