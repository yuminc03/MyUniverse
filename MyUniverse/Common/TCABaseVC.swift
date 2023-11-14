//
//  BaseVC.swift
//  LabsProject
//
//  Created by Yumin Chu on 2023/06/26.
//

import UIKit
import Combine

import CombineCocoa
import ComposableArchitecture
import SnapKit

class TCABaseVC<R: Reducer>: MyUniVC where R.State: Equatable {
    
    var store: StoreOf<R>
    var viewStore: ViewStoreOf<R>

    init(store: StoreOf<R>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("Do not use Storyboard.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
