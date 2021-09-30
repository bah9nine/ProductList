//
//  TabelViewController.swift
//  ProductApp
//
//  Created by Иван Миронов on 20.01.2021.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductViewInput {
    var output: ProductViewOutput!
    var indexForSelectedRow: Int?
    
    @IBOutlet weak var listIsEmptyLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var tabelView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        output = ProductPresenter(view: self)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateVisability()
        tabelView.reloadData()
    }
    
    func setupInitialState() {
        setupTableView()
        navigationItem.title = "List"
    }
    
    func setupTableView() {
        let nib = UINib(nibName: ProductCell.identifier, bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: ProductCell.identifier)
        tabelView.rowHeight = 50
        tabelView.dataSource = self
        tabelView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.productStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as! ProductCell
        let product = output.productStore[indexPath.row]
        cell.fill(with: product, index: indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexForSelectedRow = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output.deleteProduct(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
           
            var indexPathArray: [IndexPath] = []
            for row in indexPath.row..<output.productStore.count {
                let indexPath = IndexPath(row: row, section: 0)
                indexPathArray.append(indexPath)
            }
        
            tableView.reloadRows(at: indexPathArray, with: .automatic)
            updateVisability()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController {
            vc.indexRow = indexForSelectedRow
        }
    }
    
    func updateVisability() {
        listIsEmptyLabel.isHidden = !output.productStore.isEmpty
        tabelView.isHidden = output.productStore.isEmpty
        shareButton.isHidden = output.productStore.isEmpty
    }
    
    @IBAction func clearProductStore(_ sender: Any) {
        output.deleteAllproducts()
        tabelView.reloadData()
        updateVisability()
    }
    
    @IBAction func share(_ sender: UIButton) {
        let text = output.prepareTextForShare()
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: [])
        present(activityVC, animated: true, completion: nil)
    }

    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {
    }
}
