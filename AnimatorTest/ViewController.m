//
//  ViewController.m
//  AnimatorTest
//
//  Created by GK on 2018.10.11..
//  Copyright © 2018. Kwindoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIView *redBox;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *currentAnimatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *debugLabel;

@property (nonatomic, strong) UIViewPropertyAnimator *animator1;
@property (nonatomic, strong) UIViewPropertyAnimator *animator2;
@property (nonatomic, strong) UIViewPropertyAnimator *animator3;
@property (nonatomic, strong) UIViewPropertyAnimator *animator4;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.animator1 = [[UIViewPropertyAnimator alloc] initWithDuration:1.f curve:UIViewAnimationCurveLinear animations:^{
        self.leftConstraint.constant = 200.f;
        self.redBox.alpha = 0.1f;
        [self.view layoutIfNeeded];
    }];
    
    self.animator2 = [[UIViewPropertyAnimator alloc] initWithDuration:1.f curve:UIViewAnimationCurveLinear animations:^{
        self.topConstraint.constant = 200.f;
        self.redBox.alpha = 1.f;
        [self.view layoutIfNeeded];
    }];
    
    self.animator3 = [[UIViewPropertyAnimator alloc] initWithDuration:1.f curve:UIViewAnimationCurveLinear animations:^{
        self.leftConstraint.constant = 30.f;
        self.redBox.alpha = 0.4f;
        [self.view layoutIfNeeded];
    }];

    self.animator4 = [[UIViewPropertyAnimator alloc] initWithDuration:1.f curve:UIViewAnimationCurveLinear animations:^{
        self.topConstraint.constant = 30.f;
        self.redBox.alpha = 1.f;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)sliderChanged:(id)sender {
    CGFloat value = self.slider.value;
    
    self.label.text = [NSString stringWithFormat:@"%.2f", value];
        
    if (value < 0) {
        // pass
    } else if (value < 1.f) {
        self.animator1.fractionComplete = value;
        self.currentAnimatorLabel.text = [NSString stringWithFormat:@"a1 %.2f", value];
    } else if (value < 2.f) {
        self.animator2.fractionComplete = value - 1.f;
        self.currentAnimatorLabel.text = [NSString stringWithFormat:@"a2 %.2f", value - 1.f];
    } else if (value < 3.f) {
        self.animator3.fractionComplete = value - 2.f;
        self.currentAnimatorLabel.text = [NSString stringWithFormat:@"a3 %.2f", value - 2.f];
    } else if (value < 4.f) {
        self.animator4.fractionComplete = value - 3.f;
        self.currentAnimatorLabel.text = [NSString stringWithFormat:@"a4 %.2f", value - 3.f];
    }
    
    [self refreshDebugLabel];
}

- (void)refreshDebugLabel {
    self.debugLabel.text = [NSString stringWithFormat:@"left: %.2f, top: %.2f, alpha: %.2f", self.leftConstraint.constant, self.topConstraint.constant, self.redBox.alpha];
}

@end
