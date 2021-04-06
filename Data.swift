

import Foundation

import UIKit


struct Place {
    
    var imageOfPlace:UIImage
    
    var nameOfPlace: String
    
    var coordinatesOfPlace : [Double]
    
    var description:String
 
}

struct Categories  {
    var image : UIImage
    var places : [Place]
    
}

class Model {
    
    var PlaceList0: [Place] = [Place]()
    var PlaceList1: [Place] = [Place]()
    var PlaceList2: [Place] = [Place]()
    var PlaceList3: [Place] = [Place]()
    var PlaceList4: [Place] = [Place]()
    var PlaceList5: [Place] = [Place]()
    var PlaceList6: [Place] = [Place]()
    var PlaceList7: [Place] = [Place]()
    var PlaceList8: [Place] = [Place]()
    var PlaceList9: [Place] = [Place]()
    
   // var users: [User] = [User]()
    
    var CategoriesList: [Categories] = [Categories]()
    
    init() {
        
        // RESTAURANT DATA
        
        let place1 = Place(imageOfPlace:UIImage(named: "Buffalo Burger")!, nameOfPlace: "Buffalo Burger ", coordinatesOfPlace: [30.58811392924653, 31.4908377080731], description: "Address: - Shaybah al-Nakari, Zagazig Center Service is provided from 11 am to 2 am, you can contact the number 1991")
        PlaceList0.append(place1)
        
        let place2 = Place(imageOfPlace:UIImage(named: "Tasty")!, nameOfPlace: "Tasty", coordinatesOfPlace: [30.58897601570703, 31.489066937577004], description: "Shaybah Alnakaria, Zagazig Center, Sharkia, working hours are from 9 am to 4 am, you can communicate through Zagazig 01016481402 ")
        PlaceList0.append(place2)
        
        let place3 = Place(imageOfPlace:UIImage(named: "Rafal restaurant")!, nameOfPlace: "Rafal restaurant", coordinatesOfPlace: [30.578093431826577, 31.488591797732465], description: "Address: - Al-Fateh Street extension, in front of Al-Ghazzawi Mall, 24-hour service, you can contact through 0552387597")
        PlaceList0.append(place3)
         let place4 = Place(imageOfPlace:UIImage(named: "Maxim Restaurant and Cafe")!, nameOfPlace: "Maxim Restaurant and Cafe ", coordinatesOfPlace: [30.59023669567153, 31.488369563156024], description: "Address: - Zagazig, Hariri, First Section, Zagazig, Eastern, Eastern, working hours, the service is available 24 hours, you can communicate through 0552353070")
         PlaceList0.append(place4)
         
         let place5 = Place(imageOfPlace:UIImage(named: "Meet & Eat")!, nameOfPlace: "Meet & Eat ", coordinatesOfPlace: [30.587927745564155, 31.487253764169466
             ], description: "Address: - Shaybah Alnakaria, Zagazig Center, Sharkia, working hours: The service is provided from 10 am to 12 am, you can communicate through 0552303444")
         PlaceList0.append(place5)
        
        let palce6 = Place(imageOfPlace:UIImage(named: "Duken Chicken")!, nameOfPlace: "Duken Chicken", coordinatesOfPlace: [30.588768209746863,31.487511256297655], description: "Address: - 16 Omar Ibn Al-Khattab Street, Shaybah Al-Nakaria, Zagazig Center, Al-Sharqiya, working hours are from 11 am to 3 am, you can contact us on 01101180056")
        PlaceList0.append(palce6)
        
        // COFFES
        
        let place11 = Place(imageOfPlace:UIImage(named: "Baleno Cafe")!, nameOfPlace: "Baleno Cafe ", coordinatesOfPlace: [30.589255232324696,31.491226131093725], description: "a good bank and support the customers  well")
        PlaceList1.append(place11)
        
        let place22 = Place(imageOfPlace:UIImage(named: "Be cafe")!, nameOfPlace: "Be cafe", coordinatesOfPlace: [12,13], description: "a very  good bank")
        PlaceList1.append(place22)
        
        let place33 = Place(imageOfPlace:UIImage(named: "Black Wins")!, nameOfPlace: "Black Wins", coordinatesOfPlace: [12,13], description: "a very very  good bank")
        PlaceList1.append(place33)
         let place44 = Place(imageOfPlace:UIImage(named: "Blue Nile Cafe")!, nameOfPlace: "Blue Nile Cafe ", coordinatesOfPlace: [12,13], description: "a good bank and support the customers  well")
         PlaceList1.append(place44)
         
         let place55 = Place(imageOfPlace:UIImage(named: "Bros")!, nameOfPlace: "Bros", coordinatesOfPlace: [12,13], description: "a very  good bank")
         PlaceList1.append(place55)
         
         let place66 = Place(imageOfPlace:UIImage(named: "Elmarkeb Cafe")!, nameOfPlace: "Elmarkeb Cafe", coordinatesOfPlace: [12,13], description: "a very very  good bank")
         PlaceList1.append(place66)
        
        // restusrant
        
        let place111 = Place(imageOfPlace:UIImage(named: "enterainment")!, nameOfPlace: "Bank misrrr ", coordinatesOfPlace: [30.589255232324696,31.491226131093725], description: "a good bank and support the customers  well")
        PlaceList2.append(place111)
        
        //let place211 = Place(imageOfPlace:UIImage(named: "enterainment")!, nameOfPlace: "bank cairo ", coordinatesOfPlace: [12,13], description: "a very  good bank")
        //PlaceList0.append(place211)
        
        let place311 = Place(imageOfPlace:UIImage(named: "BB")!, nameOfPlace: "bank Ahly ", coordinatesOfPlace: [12,13], description: "a very very  good bank")
        PlaceList2.append(place311)
         let place411 = Place(imageOfPlace:UIImage(named: "enterainment")!, nameOfPlace: "Misr ", coordinatesOfPlace: [12,13], description: "a good bank and support the customers  well")
         PlaceList2.append(place411)
         
         let place511 = Place(imageOfPlace:UIImage(named: "BB")!, nameOfPlace: "bank cairo ", coordinatesOfPlace: [12,13], description: "a very  good bank")
         PlaceList2.append(place511)
        
        
        
        let category1 = Categories(image: UIImage(named: "Dinning")!, places: PlaceList0)
        CategoriesList.append(category1)
        let category2 = Categories(image: UIImage(named: "Fashion")!, places: PlaceList1)
        CategoriesList.append(category2)
        let category3 = Categories(image: UIImage(named: "Finance")!, places: PlaceList2)
        CategoriesList.append(category3)
        let category4 = Categories(image: UIImage(named: "Medical")!, places: PlaceList3)
        CategoriesList.append(category4)
        let category5 = Categories(image: UIImage(named: "supermarket")!, places: PlaceList4)
        CategoriesList.append(category5)
        let category6 = Categories(image: UIImage(named: "entertainment")!, places: PlaceList5)
        CategoriesList.append(category6)
        let category7 = Categories(image: UIImage(named: "Hotels")!, places: PlaceList6)
        CategoriesList.append(category7)
        let category8 = Categories(image: UIImage(named: "Eduaction")!, places: PlaceList7)
        CategoriesList.append(category8)
        let category9 = Categories(image: UIImage(named: "Government")!, places: PlaceList9)
        CategoriesList.append(category9)
//        let category10 = Categories(image: UIImage(named: "Fashion")!, places: PlaceList9)
//        CategoriesList.append(category10)

        
  
      
        
      
      
    
    
  }
    
}
