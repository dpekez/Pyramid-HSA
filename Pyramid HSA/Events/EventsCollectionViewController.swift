//
//  EventsCollectionViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 12.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EventsCollectionViewController: UICollectionViewController {
    let eventHeader = ["Catch it if you can",
                    "Workshop",
                    "Torwandschießen",
                    "Bewerbungsbilder"]
    let eventBody = ["Kurzvorstellungsgespräche\n…",
                    "Die perfekte Bewerbung\n…",
                    "Treffe ins Loch und gewinne\n…",
                    "Kostenlose Bewerbungsbilder\n…"]
    let eventLocation = ["M1.02 (M-Gebäude)", "M1.01 (M-Gebäude)", "Zwischen den Messezelten", "Irgendwo"]
    let eventImage = ["catchit", "workshop", "football", "shooting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let statWindow = UIApplication.shared.value(forKey:"statusBarWindow") as! UIView
//        let statusBar = statWindow.subviews[0] as UIView
//        statusBar.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.3)
        
//        self.preferredStatusBarStyle
//        navigationController?.navigationBar.barTintColor = PyramidColor.pyramidBlue
//        let blurEffect = UIBlurEffect(style: .regular)
//        let blurredStatusBar = UIVisualEffectView(effect: blurEffect)
//        blurredStatusBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(blurredStatusBar)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventHeader.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EventCollectionViewCell else {
            fatalError("dequed cell is not an instance of EventCollectionViewCell")
        }
    
        cell.headerLabel.text = eventHeader[indexPath.row]
        cell.bodyLabel.text = eventBody[indexPath.row]
        cell.locationLabel.text = eventLocation[indexPath.row]
        cell.image.image = UIImage(named: eventImage[indexPath.row])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
