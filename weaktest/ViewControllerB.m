#import "ViewControllerB.h"


@implementation ViewControllerB {
    NSString *_string;
    void (^handler)(NSNumber *, NSUInteger, BOOL *);

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _string = @"";

    NSArray *array = @[ @1, @2, @3 ];
    // ブロックから ivar を参照
    // このクラスからブロックへの参照を持つので循環参照
    // Close ボタンタップ時に dealloc B のログが出力されない = 解放されない
    // AppCode の警告あり
    handler = ^(NSNumber *n, NSUInteger idx, BOOL *stop) {
        [_string stringByAppendingString:n.stringValue];
    };
    [array enumerateObjectsUsingBlock:handler];


    UIButton *button = [[UIButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:button];
    [button setTitle:@"Close" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:40];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];

    NSDictionary *views = NSDictionaryOfVariableBindings(button);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[button]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[button]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

}

- (void)onClick
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)dealloc
{
    NSLog(@"dealloc B");
}

@end
