//
//  ThirdViewController.swift
//  Smart City
//
//  Created by Mahmoud on 3/20/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    lazy var filter2 : [Place]?=[Place]()
    lazy var place2:[Place]?=[Place]()
    var  indexpath:Int!
    
//    lazy var places :[Place]={
//        let model  = Model()
//        if indexpath == 0 {
//        return model.PlaceList0
//        }else if indexpath == 1{
//            return model.PlaceList1
//        }else if indexpath == 2{
//            return model.PlaceList2
//        }else if indexpath == 3{
//            return model.PlaceList3
//        }
//        return model.PlaceList4
//        
//    }()
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var descriptionLable: UILabel!
    override func viewDidLoad() {
        // print(filter2!)
        super.viewDidLoad()
        if filter2?.isEmpty != true {
            
            
            image.image=filter2?[indexpath].imageOfPlace
        descriptionLable.text=filter2?[indexpath].description
        }else {
            
            image.image=place2?[indexpath].imageOfPlace
            descriptionLable.text=place2?[indexpath].description
        }
       
    }
    

    @IBAction func showOnMap(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ForthViewController") as! ForthViewController
        vc.coordinates  = (place2?[indexpath].coordinatesOfPlace)!
               self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
