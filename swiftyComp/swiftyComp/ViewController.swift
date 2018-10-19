//
//  ViewController.swift
//  swifty_companion
//
//  Created by Melissa NAIDOO on 2018/10/16.
//  Copyright © 2018 Melissa NAIDOO. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBAction func searchUsername(_ sender: UIButton) {

        if (usernameText.text == "" && usernameText.text == nil)
        {
            self.creatAlert(title: "Error", message: "no text")
        }
        else
        {
            APIController().getUser(username: usernameText.text!, with: { data in
                
//                if let dic: NSDictionary = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    print(dic)
//
                    guard let userData = try? JSONDecoder().decode(Users.self, from: data) else {
                        print("Error: Couldn't decode data into Blog")
                        return
                    }
                    print("first_name: \(userData.first_name)")
                    print("last_name: \(userData.last_name)")
                    print("login: \(userData.login)")
                    print("email: \(userData.email)")
                    print("imageUrl: \(userData.image_url)")
                    print("correction_point: \(userData.correction_point)")
                    print("wallet : \(userData.wallet)")
                APIController.USER = userData
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "profilePage", sender: self)
                }
            }, with: { err in
                print("error: ", err.localizedDescription)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            print("start")
        APIController().request(req: APIController().getCodeRequest(), with: {data in
            print("Ok")

        }, with: {error in print("Err")})
            print("end")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        if(segue.identifier == "profilePage")
        {
            print("prepare2")
            if let nextViewController = segue.destination as? ParentViewController{
                 nextViewController.User = APIController.USER
            }
        }
    }
    
    func creatAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//curl -H "Authorization: Bearer aef852cfbeedb57f3441af058418bd2ad1eaa69f02d55ff7d710b5bad6396ac6" https://api.intra.42.fr/oauth/token/info
