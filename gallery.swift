import UIKit

class ImageGalleryViewController: UIViewController {
    let images = ["image1", "image2", "image3", "image4"]
    
    var currentImageIndex = 0
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 20, y: view.frame.height - 80, width: 80, height: 40)
        view.addSubview(backButton)
        
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.frame = CGRect(x: view.frame.width - 100, y: view.frame.height - 80, width: 80, height: 40)
        view.addSubview(nextButton)
        
        updateImage()
    }
    
    @objc func backButtonTapped() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
            updateImage()
        }
    }
    
    @objc func nextButtonTapped() {
        if currentImageIndex < images.count - 1 {
            currentImageIndex += 1
            updateImage()
        }
    }
    
    func updateImage() {
        let imageName = images[currentImageIndex]
        imageView.image = UIImage(named: imageName)
    }
}

let imageGalleryViewController = ImageGalleryViewController()
// Replace with your view controller presentation logic
// For example, if you're using UIKit:
let navigationController = UINavigationController(rootViewController: imageGalleryViewController)
navigationController.modalPresentationStyle = .fullScreen
// Present the navigation controller
// ...

