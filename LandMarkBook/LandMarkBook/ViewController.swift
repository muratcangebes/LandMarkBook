//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Muratcan Gebeş on 22.02.2025.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //Bütün fonksiyonlardan erişilebilir hale getirdik.
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLendMarkName = ""
    var chosenLendMarkImage = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        //var landMarkNames = [String]() tableview burada göremediği için yukarı almalıyız
        landMarkNames.append("Coloseum")
        landMarkNames.append("Great Wall")
        landMarkNames.append("Black Sea (Reynisfjara)")
        landMarkNames.append("Stonghenge")
        
        //var landMarkImages = [UIImage]() tableview burada göremediği için yukarı almalıyız
        landMarkImages.append(UIImage(named: "colosseum")!)
        landMarkImages.append(UIImage(named: "greatwall")!)
        landMarkImages.append(UIImage(named: "blacksand")!)
        landMarkImages.append(UIImage(named: "stonghenge")!)
    }

    //UITableView Yapıyorsak bunlar zorunlu.(UITableViewDelegate, UITableViewDataSource bunlar olmazsa çalışmaz.)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test"  ESKİ KULLANIM KALDIRILACAK.
        
        var content = cell.defaultContentConfiguration( )
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLendMarkName = landMarkNames[indexPath.row]
        chosenLendMarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandMarkName = chosenLendMarkName
            destinationVC.selectedLandMarkImage = chosenLendMarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }

}

