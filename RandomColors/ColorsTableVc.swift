//
//  ColorsTableVc.swift
//  RandomColors
//
//  Created by Sergio Silva Macedo on 09/03/23.
//

import UIKit

class ColorsTableVc: UIViewController{
    
    var colors :[UIColor] = []
    enum cells {
        static let colorCell = "ColorCell"
    }
    enum Segue{
        static let toDetails = "ToColorsDetailsVC"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        adddRandomColors()
    }
    
    func adddRandomColors( ){
        for _ in 0..<50 {
            colors.append(UIColor.random())
        }
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailsVC
        destVC.color = sender as? UIColor
    }
}

    

extension ColorsTableVc: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cells.colorCell) else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segue.toDetails, sender: color)
    }
}
