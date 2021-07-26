//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by lijia xu on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        defer {
            navigationController?.popViewController(animated: true)
        }
        
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
    
        switch entry {
        case let entry?:
            EntryController.shared.updateEntry(entry, title: title, body: body)
        case nil:
            EntryController.shared.createEntry(title: title, body: body)
        }
        
    }
    
}//End Of VC
