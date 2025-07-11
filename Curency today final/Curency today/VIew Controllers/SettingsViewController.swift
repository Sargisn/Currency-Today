//
//  SettingsViewController.swift
//  Curency today
//
//  Created by Student on 02.07.25.
//

import UIKit

class SettingsOption {
    var name: String
    var backgroundColor: UIColor
    var backgroundImage: UIImage
   
    
    init(name: String, backgroundColor: UIColor, backgroundImage: UIImage ) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.backgroundImage = backgroundImage
     
    }
}

class SettingsViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var models = [SettingsOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        configure()
    }
    
    func configure(){
        models.append(contentsOf: [
            SettingsOption(name: "About Programm", backgroundColor: .darkGray, backgroundImage: UIImage(systemName: "info.circle")!),
            SettingsOption(name: "Share", backgroundColor: .darkGray, backgroundImage: UIImage(systemName: "square.and.arrow.up.circle")!),
            SettingsOption(name: "Contact", backgroundColor: .darkGray, backgroundImage: UIImage(systemName: "envelope.circle")!),
            SettingsOption(name: "By", backgroundColor: .darkGray, backgroundImage: UIImage(systemName: "person.crop.circle")!),
            ])
    }
            
    
    
    
    @IBAction func home(_ sender: Any) {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CourceViewController") as? CourceViewController
            vc?.modalTransitionStyle = .crossDissolve
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
    
    }
    
  
    @IBAction func convert(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConvertViewController") as? ConvertViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as?
        SettingsTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if(models[indexPath.item].name == "About Programm"){
            let actionSheet = UIAlertController(title: "About Programm", message: "Our currency app is the perfect tool for anyone who wants to quickly and easily track exchange rates and perform currency exchange operations. You get up-to-date real-time data, allowing you to make informed financial decisions without delays. The app supports many world currencies, including major ones like the US dollar, euro, British pound, and many others.The user-friendly and intuitive interface makes the app easy to use, even for those without any special experience. You can save favorite currencies for quick access, view historical data, and analyze rate trends. Additionally, the app works offline using the last downloaded data, which is especially useful during travel.Whether you are a tourist, a businessperson, or just someone following financial news, our app helps you stay informed and make smart decisions.", preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(actionSheet, animated: true)
            
        }else if(models[indexPath.item].name == "Share"){
            let activityVc = UIActivityViewController(activityItems: [""], applicationActivities: nil)
            activityVc.popoverPresentationController?.sourceView = self.view
            self.present(activityVc, animated: true)
        }else if(models[indexPath.item].name == "Contact"){
            let actionSheet = UIAlertController(title: "instagram", message: nil, preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Instagram", style: .default, handler: { _ in
                if let url = URL(string: "https://www.instagram.com/navoyaann?igsh=YmZyMW15andjcWti") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(actionSheet, animated: true)
        }else if(models[indexPath.item].name == "By"){
            let actionSheet = UIAlertController(title: "Sargis Navoyan", message: nil, preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(actionSheet, animated: true)
            
        }
    }
}

