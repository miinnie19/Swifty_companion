//
//  ParentViewController.swift
//  swiftyComp
//
//  Created by Melissa NAIDOO on 2018/10/18.
//  Copyright © 2018 Melissa NAIDOO. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var skillTbale: UITableView!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var projectsTable: UITableView!
    @IBOutlet weak var projectLabel: UILabel!
      var User: Users!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillTbale.delegate = self
        skillTbale.dataSource = self
        
        //print our skills label
        skillsLabel.text = "\((User.first_name).capitalized)'s Skills"
        projectLabel.text = "\((User.first_name).capitalized)'s Projects"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView.tag == 1)
        {
          return (User.cursus_users.first?.skills.count)!
        }
        else if(tableView.tag == 2)
        {
            return(User.projects_users.count)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView.tag == 1)
        {
            let cell : SkillsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "skills", for: indexPath) as! SkillsTableViewCell
            cell.skillLevel.text = "\(String(format: "%.2f", (self.User.cursus_users.first?.skills[indexPath.row].level)!))"
            cell.skillName.text = User.cursus_users.first?.skills[indexPath.row].name
            return cell
        }
        else
        {
            let cell : ProjectsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "projects", for: indexPath) as! ProjectsTableViewCell
            cell.projectLevel.text = "\(self.User.projects_users[indexPath.row].final_mark ?? 0)%"
            cell.projectName.text = User.projects_users[indexPath.row].project.slug
            return cell
        }
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "UserInfoChild")
        {
            if let nextViewController = segue.destination as? TopProfileViewController{
                nextViewController.User = self.User
            }
        }
    }


}
