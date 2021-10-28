//
//  ViewController.swift
//  rgtarkovskiyPW4
//
//  Created by Al Stark on 23.10.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource{

    @IBOutlet weak var notesCollectionView: UICollectionView!
    
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    
    let context: NSManagedObjectContext = {
            let container = NSPersistentContainer(name: "CoreDataNotes")
            container.loadPersistentStores { _, error in
                if let error = error {
                    fatalError("Container loading failed")
                }
            }
            return container.viewContext
        }()
    
    var notes: [Note] = [] {
        
        didSet {
            emptyCollectionLabel.isHidden = notes.count != 0
            notesCollectionView.reloadData()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return notes.count
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:
                                                                #selector(createNote(sender:)))
    }
    
    func loadData() {
        if let notes = try? context.fetch(Note.fetchRequest()) {
            let a = (notes as? [Note] ?? [])
            self.notes = a.sorted(by:
                                    { $0.creationData.compare($1.creationData) == .orderedDescending})
        } else {
            self.notes = []
        }
    }
    
    
    
    func saveChanges() {
        if context.hasChanges {
            try? context.save()
        }
        if let notes = try? context.fetch(Note.fetchRequest()) {
            self.notes = (notes as? [Note] ?? [])
        } else {
            self.notes = []
        }
        
    }
    
    
    
    @objc func createNote(sender: UIBarButtonItem) {
        guard let vc =
                storyboard?.instantiateViewController(withIdentifier:
                                                        "NoteViewController") as? NoteViewController else {
            return
        }
        vc.outputVC = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier:
                                                "NoteCell", for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        print( note.description)
        cell.descriptionLabel.text = note.descriptionText
        return cell
        
    }
    
    
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        contextMenuConfigurationForItemAt indexPath: IndexPath, point:
                            CGPoint) -> UIContextMenuConfiguration? {
        let identifier = "\(indexPath.row)" as NSString
        return UIContextMenuConfiguration(identifier: identifier,
                                          previewProvider: .none) { _ in
            let deleteAction = UIAction(title: "Delete", image:
                                            UIImage(systemName: "trash"), attributes:
                                                UIMenuElement.Attributes.destructive) { value in
                self.context.delete(self.notes[indexPath.row])
                self.saveChanges()
            }
                                            return UIMenu(title: "", image: nil, children: [deleteAction])
        }
    }
}


