//
//  NoteViewController.swift
//  rgtarkovskiyPW4
//
//  Created by Al Stark on 23.10.2021.
//

import UIKit

class NoteViewController:  UIViewController { 
    var outputVC: ViewController!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:
                        #selector(didTapSaveNote(button:)))
        
    }
    
    
    @objc func didTapSaveNote(button: UIBarButtonItem) {
            let title = titleTextField.text ?? ""
           
            let descriptionText = textView.text ?? ""
            if !title.isEmpty {
                let newNote = Note(context: outputVC.context)
                newNote.title = title
                newNote.descriptionText = descriptionText
                let date = NSDate()
                newNote.creationData = date as Date
                outputVC.saveChanges()
            }
            self.navigationController?.popViewController(animated: true)
        }
    
    
}

