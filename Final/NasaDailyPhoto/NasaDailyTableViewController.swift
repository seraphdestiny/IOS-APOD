import UIKit
class NasaDailyTableViewController: UITableViewController {
    
    var year: String?

    
    var nasas = [Nasa]()
    override func viewDidLoad() {
        super.viewDidLoad()
        NasaController.shared.get_songs { (nasas) in
            if let nasas = nasas {
                self.updateUI(nasas: nasas)
            }
        }
    }

    func updateUI(nasas: [Nasa]) {
        DispatchQueue.main.async {
            self.nasas = nasas
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nasas.count
    }

    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let nasa = nasas[indexPath.row]
        cell.textLabel?.text = nasa.title
        cell.detailTextLabel?.text = nasa.picture
        cell.imageView?.image = #imageLiteral(resourceName: "nasa")

        NasaController.shared.get_image(url: nasa.url) { (image) in
            guard let image = image else {
                return
            }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell), currentIndexPath == indexPath {
                    cell.imageView?.image = image
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NasaCell", for: indexPath)
       configure(cell: cell, forItemAt: indexPath)
       
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nasaDetailViewController = segue.destination as? NasaDetailViewController, let row = tableView.indexPathForSelectedRow?.row {
            nasaDetailViewController.nasa = nasas[row]
            }
    }
}
