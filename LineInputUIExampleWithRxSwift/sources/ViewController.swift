import UIKit
import RxSwift
import RxCocoa
import RxKeyboard

class ViewController: UIViewController {

    @IBOutlet weak var messageInputView: MessageInputView!
    @IBOutlet weak var messageInputViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageInputViewHeightConstraint: NSLayoutConstraint!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessageInputView()
    }

    private func setupMessageInputView() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { [weak self] keyBoardHeight in
                self?.messageInputViewBottomConstraint.constant = -keyBoardHeight
                self?.view.layoutIfNeeded()
            })
            .disposed(by: disposeBag)
        
        let maxInputTextViewHeight: CGFloat = 100.0
        let inputTextViewVerticalMargin: CGFloat = 14.0
        messageInputView.inputTextView.rx.text
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let height = self?.messageInputView.inputTextView.contentSize.height else { return }
                let inputTextViewHeight = height + inputTextViewVerticalMargin
                if maxInputTextViewHeight > inputTextViewHeight {
                    self?.messageInputViewHeightConstraint.constant = inputTextViewHeight
                }
                self?.view.layoutIfNeeded()
            })
            .disposed(by: disposeBag)
    }

}

