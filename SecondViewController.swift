

import UIKit

class SecondViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var searchBar: UISearchBar!
    var bottomindexpath:Int!
    var topindexpath:Int!
    @IBOutlet weak var tabelview: UITableView!
    
     
    lazy var filter : [Place]=[Place]()
    var searching = false
    
    

    //bottom
     lazy var places:[Place]={
           let model  = Model()
       if bottomindexpath == 0 {
            return model.PlaceList0
        }else if  bottomindexpath == 1 {
        return model.PlaceList1
       }else if bottomindexpath == 2 {
        return model.PlaceList2
       }else if bottomindexpath == 3 {
        return model.PlaceList3
        }
        return model.PlaceList4
        }()
    
    // top
    lazy var placess:[Place]={
        let model  = Model()
    if  topindexpath == 0 {
         return model.PlaceList0
     }
     return model.PlaceList1
     }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate=self
        tabelview.dataSource=self
        searchBar.delegate=self
        
    tabelview.tableFooterView = UIView()
        
    }
    
    //tableview code
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if bottomindexpath != nil{
        if searching {
            return filter.count
        }else{
        return places.count
        }
        }
        if searching {
                   return filter.count
               }else{
               return placess.count
               }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)as!SecondTableViewCell
        if (bottomindexpath != nil) {
        
        if searching{
            
            
        cell.imagecell.image=filter[indexPath.row].imageOfPlace
        cell.labelcell.text=filter[indexPath.row].nameOfPlace
        }else{
            
            cell.imagecell.image=places[indexPath.row].imageOfPlace
            cell.labelcell.text=places[indexPath.row].nameOfPlace
            
        }
            
               return cell
            
        }else {
            if searching{
                
                
            cell.imagecell.image=filter[indexPath.row].imageOfPlace
            cell.labelcell.text=filter[indexPath.row].nameOfPlace
            }else{
                
                cell.imagecell.image=placess[indexPath.row].imageOfPlace
                cell.labelcell.text=placess[indexPath.row].nameOfPlace
            
            
        }
                return cell
        }
        
        
        
    }

    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100
        
      }
    
    // didselect
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // bottomindexpath = indexPath.row
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        vc.filter2 = filter
        if bottomindexpath != nil{
        vc.place2 = places
        }else {
            
            vc.place2 = placess
        }
        vc.indexpath=indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    }



extension SecondViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // coding
       
        if bottomindexpath != nil{ filter=places.filter({$0.nameOfPlace.lowercased().prefix(searchText.count)==searchText.lowercased()})
        searching = true
        tabelview.reloadData()
        }else{
            
            print("#####################"); filter=placess.filter({$0.nameOfPlace.lowercased().prefix(searchText.count)==searchText.lowercased()})
            searching = true
            tabelview.reloadData()
        }
        
    }
    
}

