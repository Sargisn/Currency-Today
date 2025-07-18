import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsTableViewCell"
    
    // MARK: - UI Elements
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 18
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.12).cgColor
        view.layer.shadowOpacity = 0.18
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 0.92, green: 0.40, blue: 0.40, alpha: 1).cgColor, // красивый красный оттенок
            UIColor(red: 0.75, green: 0.18, blue: 0.18, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(red: 0.12, green: 0.10, blue: 0.26, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        return label
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 18
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        iconBackground.layer.insertSublayer(gradientLayer, at: 0)
        iconBackground.addSubview(iconImage)
        
        mainStack.addArrangedSubview(iconBackground)
        mainStack.addArrangedSubview(label)
        
        cardView.addSubview(mainStack)
        contentView.addSubview(cardView)
        
        accessoryType = .disclosureIndicator
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = iconBackground.bounds
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            iconBackground.widthAnchor.constraint(equalToConstant: 52),
            iconBackground.heightAnchor.constraint(equalToConstant: 52),
            
            iconImage.centerXAnchor.constraint(equalTo: iconBackground.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: iconBackground.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 30),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            
            mainStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            mainStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -18),
            mainStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            mainStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18)
        ])
    }
    
    // MARK: - Configure
    
    public func configure(with model: SettingsOption) {
        iconImage.image = model.backgroundImage
        label.text = model.name
    }
}
