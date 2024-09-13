import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35))
        button.setImage(image, for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let titlesPosterUIImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlesPosterUIImage)
        contentView.addSubview(titleLable)
        contentView.addSubview(playTitleButton)

        applyConstraints()
    }
    
    private func applyConstraints(){
        
        let titlesPosterUIImageViewConstraints = [
            titlesPosterUIImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterUIImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLableConstraints = [
            
            titleLable.leadingAnchor.constraint(equalTo: titlesPosterUIImage.trailingAnchor, constant: 20),
            titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLableConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: TitleViewModel){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.postURL)") else {
            return
        }
        titlesPosterUIImage.sd_setImage(with: url, completed: nil)
        titleLable.text = model.titleName
    }
    
    override func layoutSubviews() {
        contentView.frame = bounds
    }

}
