#import "ViewController.h"
#import "ViewControllerA.h"
#import "ViewControllerB.h"


@implementation ViewController

- (void)loadView
{
    [super loadView];

    UIButton *buttonA = [[UIButton alloc] init];
    [buttonA setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:buttonA];
    [buttonA setTitle:@"A" forState:UIControlStateNormal];
    [buttonA setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    buttonA.titleLabel.font = [UIFont systemFontOfSize:40];
    [buttonA addTarget:self action:@selector(onA) forControlEvents:UIControlEventTouchUpInside];

    UIButton *buttonB = [[UIButton alloc] init];
    [buttonB setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:buttonB];
    [buttonB setTitle:@"B" forState:UIControlStateNormal];
    [buttonB setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    buttonB.titleLabel.font = [UIFont systemFontOfSize:40];
    [buttonB addTarget:self action:@selector(onB) forControlEvents:UIControlEventTouchUpInside];

    NSDictionary *views = NSDictionaryOfVariableBindings(buttonA, buttonB);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[buttonA]-[buttonB]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttonA]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)onA
{
    [self presentViewController:[[ViewControllerA alloc] init]
                       animated:NO
                     completion:nil];
}

- (void)onB
{
    [self presentViewController:[[ViewControllerB alloc] init]
                       animated:NO
                     completion:nil];
}


@end