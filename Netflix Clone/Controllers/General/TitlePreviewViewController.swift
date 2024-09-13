 import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
  
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 22, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let overViewLable: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 18, weight: .regular)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0
        return lable
    }()

    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        view.addSubview(webView)
        view.addSubview(titleLable)
        view.addSubview(overViewLable)
        view.addSubview(downloadButton)

        configureConstrains()
    }
    
   private func configureConstrains(){
        
        let webViewConstrains = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300 )
        ]
        
        let titleLableConstrains = [
            titleLable.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ]
        
        let overViewLableConstrains = [
            overViewLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 15),
            overViewLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLable.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ]
        
        let downloadButtonConstrains = [
            downloadButton.topAnchor.constraint(equalTo: overViewLable.bottomAnchor, constant: 35),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
            downloadButton.widthAnchor.constraint(equalToConstant: 135)
        ]
        
        NSLayoutConstraint.activate(webViewConstrains)
        NSLayoutConstraint.activate(titleLableConstrains)
        NSLayoutConstraint.activate(overViewLableConstrains)
        NSLayoutConstraint.activate(downloadButtonConstrains)
    }
    
    func configure(with model: TitlePreviewViewModel){
        
        titleLable.text = model.title
        overViewLable.text = model.titleOverview
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {return}
        
        webView.load(URLRequest(url: url))
    }
   
}
