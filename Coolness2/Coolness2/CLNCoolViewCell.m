// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

UIEdgeInsets CLNTextInsets = { .left = 12, .top = 7, .right = 12, .bottom = 8 };
CGPoint CLNTextOrigin = { 12, 7 };

@interface CLNCoolViewCell ()
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (class, readonly) NSDictionary<NSAttributedStringKey, id> *textAttributes;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@end

@implementation CLNCoolViewCell

- (CGFloat)cornerRadius { return self.layer.cornerRadius; }
- (void)setCornerRadius:(CGFloat)cornerRadius { self.layer.cornerRadius = cornerRadius; }

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureLayer {
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}


+ (NSDictionary<NSAttributedStringKey, id> *)textAttributes {
    static NSDictionary<NSAttributedStringKey, id> *attributes;
    
//    if (attributes == nil) {
//        attributes = @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
//                        NSForegroundColorAttributeName : UIColor.whiteColor };
//    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        attributes = @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                        NSForegroundColorAttributeName : UIColor.whiteColor };
    });
    return attributes;
    
//    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
//              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Custom drawing and resizing

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CLNTextOrigin withAttributes:self.class.textAttributes];
}


// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                     animations:^{
                         typeof(self) __strong strongSelf = weakSelf;
                         [UIView setAnimationRepeatAutoreverses:YES];
                         [UIView setAnimationRepeatCount:4];
                         CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
                         strongSelf.transform = CGAffineTransformRotate(translation, M_PI_2);
                     }
                     completion:^(BOOL finished) {
                         typeof(self) __strong strongSelf = weakSelf;
                         strongSelf.transform = CGAffineTransformIdentity;
                     }
     ];
}

// MARK: - UIResponder methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat dx = currLocation.x - prevLocation.x;
    CGFloat dy = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, dx, dy);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
