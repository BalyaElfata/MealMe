import UIKit

class FilterButton: UIButton {
    
    private var isFilterSelected = false
    private let underlineHeight: CGFloat = 1.0
    private let underlineColor = UIColor.orange
    private var underlineLayer: CALayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.black, for: .normal)
        setTitleColor(.black, for: .selected)
        
        titleLabel?.font = UIFont(name: "Poppins-Regular", size: 15)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        isFilterSelected.toggle()
        updateButtonAppearance()
    }
    
    func setSelected(_ selected: Bool) {
        isFilterSelected = selected
        updateButtonAppearance()
    }
    
    private func updateButtonAppearance() {
        underlineLayer?.removeFromSuperlayer()
        
        if isFilterSelected {
            let underline = CALayer()
            underline.backgroundColor = underlineColor.cgColor
            
            guard let titleLabel = titleLabel else { return }
            
            underline.frame = CGRect(
                x: titleLabel.frame.size.width * 0.25,
                y: titleLabel.frame.size.height + 2,
                width: titleLabel.frame.size.width * 0.5,
                height: underlineHeight
            )
            
            titleLabel.layer.addSublayer(underline)
            self.underlineLayer = underline
        }
        
        isSelected = isFilterSelected
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update underline position if needed
        if isFilterSelected, let titleLabel = titleLabel, let underline = underlineLayer {
            underline.frame = CGRect(
                x: titleLabel.frame.size.width * 0.25,
                y: titleLabel.frame.size.height + 2,
                width: titleLabel.frame.size.width * 0.5,
                height: underlineHeight
            )
        }
    }
}
