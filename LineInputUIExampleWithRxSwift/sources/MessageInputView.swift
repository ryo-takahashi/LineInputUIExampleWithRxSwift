import UIKit
import RxSwift
import RxCocoa
import RxOptional

class MessageInputView: UIView {

    @IBOutlet weak var inputTextViewHolder: UIView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    private func setupView() {
        inputTextViewHolder.layer.borderWidth = 1.0
        inputTextViewHolder.layer.borderColor = UIColor(red: 211, green: 211, blue: 211, alpha: 0.0).cgColor
        inputTextViewHolder.layer.cornerRadius = 3.0
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib.init(nibName: "MessageInputView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(view)
    }
}
