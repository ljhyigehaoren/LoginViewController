//
//  UIButton+shake.h
//  SCViewShakerExample
//
//  Created by TianHaoShengShi on 15/11/24.
//
//

#import <UIKit/UIKit.h>
#define kDefaultShakeOptions (SCShakeOptionsDirectionHorizontal | SCShakeOptionsForceInterpolationExpDown | SCShakeOptionsAtEndComplete)
#define kDefaultShakeForce (0.075)
#define kDefaultShakeDuration (0.5)
#define kDefaultShakeIterationDuration (0.03)

typedef enum : NSUInteger {
    SCShakeOptionsDirectionRotate = 0,
    SCShakeOptionsDirectionHorizontal = 1,
    SCShakeOptionsDirectionVertical = 2,
    SCShakeOptionsDirectionHorizontalAndVertical = 3,
    SCShakeOptionsForceInterpolationNone = 4,
    SCShakeOptionsForceInterpolationLinearUp = 8,
    SCShakeOptionsForceInterpolationLinearDown = 16,
    SCShakeOptionsForceInterpolationExpUp = 32,
    SCShakeOptionsForceInterpolationExpDown = 64,
    SCShakeOptionsForceInterpolationRandom = 128,
    SCShakeOptionsAtEndRestart = 256,
    SCShakeOptionsAtEndComplete = 512,
    SCShakeOptionsAtEndContinue = 1024,
    SCShakeOptionsAutoreverse = 2048
    
} SCShakeOptions;

typedef void(^ShakeCompletionHandler)();

@interface UIButton (shake)
/*
 该属性判断当前的运动状态
 */
@property (readonly, nonatomic) BOOL isShaking;

/*
 Shake the view using the default options. The view will be shaken for a short amount of time.
 */

- (void)shake;

/*
 Shake the view using the specified options.
 |shakeOptions| 设置你需要的按钮跳动的类型.
 
 |force| 按钮运动的幅度.
 
 |duration| 振动运动的总持续时间
 
 |completionHandler|, 此参数不为空的时候,按钮结束运动时会吊用此代码块.
 */
- (void)shakeWithOptions:(SCShakeOptions)shakeOptions force:(CGFloat)force duration:(CGFloat)duration iterationDuration:(CGFloat)iterationDuration completionHandler:(ShakeCompletionHandler)completionHandler;

/*
 结束抖动
 */
- (void)endShake;

@end
