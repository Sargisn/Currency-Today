import UIKit

class CourceTableViewCell: UITableViewCell {
    
    static let identifier = "CourceTableViewCell"
    
    // MARK: - UI Elements
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.08
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        return view
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 1
        return image
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let courseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .right
        label.textColor = .label
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        contentView.addSubview(cardView)
        cardView.addSubview(iconImage)
        cardView.addSubview(countryLabel)
        cardView.addSubview(currencyLabel)
        cardView.addSubview(courseLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Card with padding
        cardView.frame = CGRect(
            x: 16,
            y: 8,
            width: contentView.frame.width - 32,
            height: contentView.frame.height - 16
        )
        
        // Apply gradient only once
        if gradientLayer.superlayer == nil {
            gradientLayer.frame = iconImage.bounds
            iconImage.layer.insertSublayer(gradientLayer, at: 0)
        }

        let padding: CGFloat = 12
        let imageSize: CGFloat = 48
        
        iconImage.frame = CGRect(
            x: padding,
            y: (cardView.frame.height - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )
        
        let labelStartX = iconImage.frame.maxX + 12
        let labelWidth = cardView.frame.width - labelStartX - 80
        
        countryLabel.frame = CGRect(
            x: labelStartX,
            y: iconImage.frame.minY,
            width: labelWidth,
            height: 22
        )
        
        currencyLabel.frame = CGRect(
            x: labelStartX,
            y: countryLabel.frame.maxY + 2,
            width: labelWidth,
            height: 18
        )
        
        courseLabel.frame = CGRect(
            x: cardView.frame.width - padding - 60,
            y: (cardView.frame.height - 22) / 2,
            width: 60,
            height: 22
        )
    }
    
    // MARK: - Configure
    
    public func configure(with model: CourceOption) {
        iconImage.image = model.backgroundImage
        countryLabel.text = model.name
        currencyLabel.text = model.currency
        courseLabel.text = model.course
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
