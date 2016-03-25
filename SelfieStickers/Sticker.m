//
//  Sticker.m
//  SelfieStickers
//
//  Created by Jamar Gibbs on 1/21/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "Sticker.h"

@interface Sticker () <UIGestureRecognizerDelegate>

@end

@implementation Sticker

-(instancetype) initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
        
        UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotation:)];
        
            self.userInteractionEnabled = YES;
            self.gestureRecognizers = @[pan,pinch,rotation];
            for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.delegate = self;
            }
        }
    return self;
}

- (void) handlePan: (UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];

        [gestureRecognizer.view setTransform:CGAffineTransformTranslate(gestureRecognizer.view.transform, translation.x, translation.y)];
        
        [gestureRecognizer setTranslation:(CGPointZero) inView:gestureRecognizer.view];
    }
}

-(void) handlePinch: (UIPinchGestureRecognizer *) gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat scale = [gestureRecognizer scale];
        
        [gestureRecognizer.view setTransform:CGAffineTransformScale(gestureRecognizer.view.transform, scale, scale)];
        [gestureRecognizer setScale:1.0];
    }
}

-(void) handleRotation: (UIRotationGestureRecognizer *) gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat rotation = [gestureRecognizer rotation];
        [gestureRecognizer.view setTransform:CGAffineTransformRotate(gestureRecognizer.view.transform, rotation)];
        [gestureRecognizer setRotation:0];
        }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}














/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
