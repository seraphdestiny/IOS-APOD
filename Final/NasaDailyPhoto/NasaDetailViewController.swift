import UIKit

class NasaDetailViewController: UIViewController {
    var nasa: Nasa!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    func updateUI() {
        navigationItem.title = nasa.picture
        titleLabel.text = nasa.title
        descriptionLabel.text = nasa.explanation
        NasaController.shared.get_image(url: nasa.url) { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
