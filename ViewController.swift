

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var bottomCollectionView: UICollectionView!
 
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    
    let topImages : [UIImage] = [UIImage(named: "WayFinder")!,UIImage(named: "Directory")!,UIImage(named: "CityMap")!]
    
    
    lazy var categories :[Categories]={
        let model  = Model()
        return model.CategoriesList
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topCollectionView.delegate=self
        topCollectionView.dataSource=self
        bottomCollectionView.delegate=self
        bottomCollectionView.dataSource=self
       
        
    }
    
    
    
    // collection view funcs
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        if collectionView == self.topCollectionView{
            
            return topImages.count
        }
        return categories.count
        
    }

     // cellForItemAt
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == self.topCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCollectionViewCell
            cell.topImages.image = topImages[indexPath.row]
            return cell
        }
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! BotomCollectionViewCell
        cell2.bottomImage.image=categories[indexPath.row].image
            //cell2.myLable.text = contents[indexPath.row].localized()
        return cell2
  
      }

    //didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.bottomCollectionView {
       let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as! SecondViewController
            vc.bottomindexpath = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        }else{
            if collectionView == self.topCollectionView {
                  let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondViewController") as! SecondViewController
                       vc.topindexpath = indexPath.row
                   self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    }

    // sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView{
        let height = view.frame.size.height
        let width = view.frame.size.width
        
        return CGSize(width: width * (1/3)-2, height: height * (1/3))
        }
        return CGSize()

    }

    // minimumLineSpacingForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == self.topCollectionView{
           return 1
        }
        return 1

    }
    
    // insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if collectionView == self.topCollectionView{
        let sectionInset = UIEdgeInsets(top: 2, left: 1, bottom: 2, right: 1)
        return sectionInset
        }

        let sectionInset2 = UIEdgeInsets(top: 3, left: 4, bottom: 3, right: 4)
        return sectionInset2

    }

   }
    
   
   
    

extension String{
func localized()->String{
    
    return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
}
    
}
