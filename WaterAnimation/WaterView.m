//
//  WaterView.m
//  WaterAnimation
//
//  Created by Chanintorn Asavavichairoj on 4/4/2558 BE.
//  Copyright (c) 2558 SCB. All rights reserved.
//

#import "WaterView.h"

@interface WaterView () {
    UIColor *_currentWaterColor;
    
    float a;
    float b;
    BOOL jia;
}

@end

@implementation WaterView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        //self.layer.cornerRadius = frame.size.width/2;
        //self.layer.masksToBounds = YES;
        
        a = 1.5;
        b = 0;
        jia = NO;
        
        _currentWaterColor = [UIColor colorWithRed:52/255.0f green:152/255.0f blue:219/255.0f alpha:0.9];
        _currentLinePointY = 150;
        
        [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
        UIImageView *fish = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nemo-29"]];
        
        fish.frame = CGRectMake(0, _currentLinePointY+80, 40, 25);
        
        fish.center = CGPointMake(self.center.x, fish.center.y);
        [self addSubview:fish];
        
        CABasicAnimation *moveUp;
        moveUp          = [CABasicAnimation animationWithKeyPath:@"position.y"];
        moveUp.byValue  = @(-15.0f);
        moveUp.duration = 2.0;
        moveUp.repeatCount = INFINITY;
        moveUp.removedOnCompletion = NO;
        moveUp.autoreverses = YES;
        moveUp.fillMode = kCAFillModeBoth;
        moveUp.delegate = self;
        [[fish layer] addAnimation:moveUp forKey:@"y"];
        
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(addBubble) userInfo:nil repeats:YES];
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(addBubble) userInfo:nil repeats:YES];
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(addBubble) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)addBubble {
    UIView *bubble1 = [[UIView alloc] initWithFrame:CGRectMake(self.center.x-10-arc4random()%10, self.center.y+50+arc4random()%30, 5, 5)];
    bubble1.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    bubble1.layer.cornerRadius = 5;
    [self addSubview:bubble1];
    
    CABasicAnimation *moveUp;
    moveUp          = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveUp.byValue  = @(-40.0f);
    moveUp.duration = 1.5;
    moveUp.beginTime = (arc4random()%8)/10;
    moveUp.removedOnCompletion = NO;
    moveUp.fillMode = kCAFillModeBoth;
    moveUp.delegate = self;
    [[bubble1 layer] addAnimation:moveUp forKey:@"y"];
    
    [UIView animateWithDuration:1.0 animations:^{
        bubble1.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [bubble1 removeFromSuperview];
    }];
}

- (void)animateWave {
    if (jia) {
        a += 0.01;
    } else {
        a -= 0.01;
    }
    
    if (a <= 1) {
        jia = YES;
    }
    
    if (a >= 1.5) {
        jia = NO;
    }
    
    b += 0.1;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float y=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, 0, y);
    for(float x=0; x <= rect.size.width; x++){
        y = a * sin( x / 180 * M_PI + 4 * b / M_PI ) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}

@end
