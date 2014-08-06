#import <UIKit/UIKit.h>
#import "UnityAppController.h"
#import "UI/UnityView.h"
#import "UI/UnityViewControllerBase.h"

@interface TNAppController : UnityAppController

- (void)createViewHierarchyImpl;

@end

@implementation TNAppController

- (void)createViewHierarchyImpl {
    
	_rootController	= [[UIViewController alloc] init];
	_rootView		= [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _rootController.view = _rootView;
    
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnNext.backgroundColor = [UIColor whiteColor];
    [btnNext setTitle:@"Switch scenes" forState:UIControlStateNormal];
    btnNext.frame = CGRectMake(0, 0, 200, 44);
    btnNext.center = CGPointMake(_rootView.bounds.size.height / 2, _rootView.bounds.size.width  - 80);
    
    [btnNext addTarget:self action:@selector(switchScenesTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [_rootView addSubview:_unityView];
    [_rootView addSubview:btnNext];
}

- (void)switchScenesTapped:(id)sender {
	NSLog(@"[TNAppController] Switch scenes tapped");
    
    [self callUnityObject:"dummy" Method:"ChangeScene" Parameter:"scene2"];
}

- (void)callUnityObject:(const char*)object Method:(const char*)method Parameter:(const char*)parameter {
    UnitySendMessage(object, method, parameter);
}

@end

IMPL_APP_CONTROLLER_SUBCLASS(TNAppController)