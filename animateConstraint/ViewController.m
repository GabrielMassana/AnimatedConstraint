//
//  ViewController.m
//  animateConstraint
//
//  Created by Jose Antonio Gabriel Massana on 22/11/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSUInteger, ABAConstraintsFase)
{
    ABAConstraintsFaseUnknown   = 0,
    ABAConstraintsFaseUp        = 1,
    ABAConstraintsFaseDown      = 2,
};

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *navBarButton;

- (IBAction)touchDown:(UIButton *)sender;
- (IBAction)touchUpInside:(id)sender;

@property (nonatomic, strong) UIButton *one;
@property (nonatomic, strong) UIButton *two;

@property (nonatomic, assign) ABAConstraintsFase constraintsFase;

@property (nonatomic, strong) NSLayoutConstraint *addOneSizeConstraintWidth;
@property (nonatomic, strong) NSLayoutConstraint *addOneSizeConstraintHeight;
@property (nonatomic, strong) NSLayoutConstraint *addOneSizeConstraintTop;
@property (nonatomic, strong) NSLayoutConstraint *addOneSizeConstraintRight;

@property (nonatomic, strong) NSLayoutConstraint *addTwoSizeConstraintWidth;
@property (nonatomic, strong) NSLayoutConstraint *addTwoSizeConstraintHeight;
@property (nonatomic, strong) NSLayoutConstraint *addTwoSizeConstraintTop;
@property (nonatomic, strong) NSLayoutConstraint *addTwoSizeConstraintRight;

@end

@implementation ViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.one];
    [self.view addSubview:self.two];
    
    [self setUpConstraint];
    
    [self updateViewConstraints];
}

#pragma mark - Subviews

- (UIButton *)one
{
    if (!_one)
    {
        _one = [UIButton new];
        _one.translatesAutoresizingMaskIntoConstraints = NO;
        _one.alpha = 0.0f;
        _one.backgroundColor = [UIColor redColor];
    }
    
    return _one;
}

- (UIButton *)two
{
    if (!_two)
    {
        _two = [UIButton new];
        _two.translatesAutoresizingMaskIntoConstraints = NO;
        _two.alpha = 0.0f;
        _two.backgroundColor = [UIColor orangeColor];
    }
    
    return _two;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    if (self.constraintsFase == ABAConstraintsFaseUnknown)
    {
        [self.one addConstraint:self.addOneSizeConstraintWidth];
        [self.one addConstraint:self.addOneSizeConstraintHeight];
        [self.view addConstraint:self.addOneSizeConstraintTop];
        [self.view addConstraint:self.addOneSizeConstraintRight];
        
        /*-------------------*/
        
        [self.two addConstraint:self.addTwoSizeConstraintWidth];
        [self.two addConstraint:self.addTwoSizeConstraintHeight];
        [self.view addConstraint:self.addTwoSizeConstraintTop];
        [self.view addConstraint:self.addTwoSizeConstraintRight];
    }
}

- (void)setUpConstraint
{
    self.addOneSizeConstraintWidth = [NSLayoutConstraint constraintWithItem:self.one
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:0.0];
    
    self.addOneSizeConstraintHeight = [NSLayoutConstraint constraintWithItem:self.one
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:0.0];
    
    self.addOneSizeConstraintTop =[NSLayoutConstraint constraintWithItem:self.one
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:64.0];
    
    self.addOneSizeConstraintRight = [NSLayoutConstraint constraintWithItem:self.one
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:-70.0];
    
    /*-------------------*/
    
    self.addTwoSizeConstraintWidth = [NSLayoutConstraint constraintWithItem:self.two
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:0.0];
    
    self.addTwoSizeConstraintHeight = [NSLayoutConstraint constraintWithItem:self.two
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:0.0];
    
    self.addTwoSizeConstraintTop =[NSLayoutConstraint constraintWithItem:self.two
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:64.0];
    
    self.addTwoSizeConstraintRight = [NSLayoutConstraint constraintWithItem:self.two
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:-70.0];
}

#pragma mark - ButtonActions

- (IBAction)touchDown:(UIButton *)sender
{
    self.constraintsFase = ABAConstraintsFaseDown;
    
    self.addOneSizeConstraintWidth.constant = 90.0f;
    self.addOneSizeConstraintHeight.constant = 90.0f;
    self.addOneSizeConstraintTop.constant = 150.0f;
    self.addOneSizeConstraintRight.constant = -150.0f;
    
    self.addTwoSizeConstraintWidth.constant = 90.0f;
    self.addTwoSizeConstraintHeight.constant = 90.0f;
    self.addTwoSizeConstraintTop.constant = 300.0f;
    self.addTwoSizeConstraintRight.constant = -250.0f;
    
    [self animateButtonsWithFinalAlpha:1.0f];
}

- (IBAction)touchUpInside:(id)sender
{
    self.constraintsFase = ABAConstraintsFaseUp;
    
    self.addOneSizeConstraintWidth.constant = 0.0f;
    self.addOneSizeConstraintHeight.constant = 0.0f;
    self.addOneSizeConstraintTop.constant = 64.0f;
    self.addOneSizeConstraintRight.constant = -70.0f;
    
    self.addTwoSizeConstraintWidth.constant = 0.0f;
    self.addTwoSizeConstraintHeight.constant = 0.0f;
    self.addTwoSizeConstraintTop.constant = 64.0f;
    self.addTwoSizeConstraintRight.constant = -70.0f;
    
    [self animateButtonsWithFinalAlpha:0.0f];
}

#pragma mark - Animation

- (void)animateButtonsWithFinalAlpha:(CGFloat)alpha
{
    [self.view layoutIfNeeded];

    [UIView animateWithDuration:0.25
                     animations:^
     {
         [self.view layoutIfNeeded];
         
         self.one.alpha = alpha;
         self.two.alpha = alpha;
     }
                     completion:^(BOOL finished)
     {
     }];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
