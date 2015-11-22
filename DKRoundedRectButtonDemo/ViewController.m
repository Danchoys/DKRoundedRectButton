//
//  ViewController.m
//  DKRoundedRectButtonDemo
//
//  Created by Daniil Konoplev on 22/11/15.
//  Copyright © 2015 Daniil Konoplev. All rights reserved.
//

#import "ViewController.h"
#import <DKRoundedRectButton/DKRoundedRectButton.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *programmaticButtonContainerView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* buttons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add a rounded rect button programmatically
    DKRoundedRectButton *button = [[DKRoundedRectButton alloc] initWithFrame:self.programmaticButtonContainerView.bounds];
    button.cornerRadius = 10.0;
    button.fillsBorders = NO;
    button.borderWidth = 4.0;
    [button setTitle:@"I am programmatic!" forState:UIControlStateNormal];
    // I know that the autolayout is ON, but it is actually way simpler to do
    // the following using the springs and struts, which will be translated
    // into the constraints by the system.
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.programmaticButtonContainerView addSubview:button];
    // Add the programmatic button to the buttons array
    NSMutableArray *buttons = [self.buttons mutableCopy];
    [buttons addObject:button];
    self.buttons = buttons;
}

- (IBAction)toggleEnabled:(id)sender {
    for (UIButton *button in self.buttons) {
        button.enabled = !button.enabled;
    }
}

- (IBAction)showAlert:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:@"Note how the alert dimms the buttons"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
