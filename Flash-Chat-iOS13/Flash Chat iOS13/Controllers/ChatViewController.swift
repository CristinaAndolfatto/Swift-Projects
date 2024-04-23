//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    // array of Message objects, message is defined in Models>Message
    var messages : [Message] = []
    
    // create a reference to Firestore database
    let db = Firestore.firestore()
    
    // logout button pressed: logout and return to rootview
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            // if the process is successfull, I will continue here the execution
            // return to the root view
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set up the table view datasource as the chatviewController class
        tableView.dataSource = self
        // update the title label in the nav bar
        title = Constants.appName
        // hide the back button on the navigation bar
        navigationItem.hidesBackButton = true
        
        // register the xib file with the cell design
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        // load messages
        loadMessages()

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        // take the message body text and the sender, if available
        if let  messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email
        {
            // Add a new document with a generated id as a dictionary, n.b. this method return a error void object
                db.collection(Constants.FStore.collectionName).addDocument(data: [
                    Constants.FStore.bodyField: messageBody,
                    Constants.FStore.senderField: messageSender,
                    Constants.FStore.dateField: Date().timeIntervalSince1970
                ]) {(error) in
                if let e = error
                    {
                    print("There was an error")
                    
                } else {
                    print("Data saved")
                    // delete the messageTextBox
                    DispatchQueue.main.async {self.messageTextfield.text = "" }
                }
                    
                }
        }
            
        
    }
    
    func loadMessages(){

        // get collections of data
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField, descending: false).addSnapshotListener { querySnapshot, error in
            
            //  delete messages after update so we display only the new ones
            self.messages = []
            
            // if there was an error
            if let e = error{
                // error
                print("Error")
            }
            // else
            if let snapshotDocuments = querySnapshot?.documents {
                for doc in snapshotDocuments {
                    let data = doc.data()
                    // if there is a sender and a  message, add to messages collection
                    if let messageSender = data[Constants.FStore.senderField] as? String, let messageBody = data[Constants.FStore.bodyField] as? String {
                        // create a new message
                        let newMessage = Message(sender: messageSender, body: messageBody)
                        //  add it to the messages array
                        self.messages.append(newMessage)
                        DispatchQueue.main.async{
                            // force reload data in tableview in the background
                            self.tableView.reloadData()
                            // scroll to the final row
                            // get the final row (array starts from 0) of a tableView in section 0
                            let finalRow = IndexPath(row: self.messages.count-1, section: 0)
                            // scroll to final index with animation
                            self.tableView.scrollToRow(at: finalRow, at: .top, animated: true)
                            
                        }
                        
                        
                    }
                        
                    
                }
                
            }
            
        }
    }

}


// MARK: adopt UITableViewDataSource protocol for tableView data filling
extension ChatViewController : UITableViewDataSource {
    // implement method for return the number of rows for the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    // Asks the data source for a cell to insert in a particular location of the table view
    // so we have to create a cell and add it to the tableview
    // this method gets called everytime a new cell is added
    // how many cells are added?  the number defined in the method above
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // read the single message at position
        let message = messages[indexPath.row]
        
        // Fetch a cell of the appropriate type (we use the identifier of our reusable cell in main.storyboard)
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        // add some data to the cell
        cell.Label.text = message.body
        
        // check if the user the current one
        if message.sender == Auth.auth().currentUser?.email {
            // hide the external user avatar
            cell.leftImageView.isHidden = true
            // show the current user avatar
            cell.rightImageView.isHidden = false
            // change the cell background color
            cell.MessageBubble.backgroundColor =  UIColor(named: Constants.BrandColors.lightPurple)
            // change the text color
            cell.Label.textColor = UIColor(named: Constants.BrandColors.purple)
        } else { // if the user is external
            // show the external user avatar
            cell.leftImageView.isHidden = false
            // hide the current user avatar
            cell.rightImageView.isHidden = true
            // change the cell background color
            cell.MessageBubble.backgroundColor =  UIColor(named: Constants.BrandColors.purple)
            // change the text color
            cell.Label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        }
        
        // return the cell
        return cell
    }
}



