//
//  ViewController.m
//  CookieMonster
//
//  Created by Mike Keller on 8/9/16.
//  Copyright © 2016 meek apps. All rights reserved.
//

#import "CookieMonster.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) CookieMonster *cookieMonster;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.cookieMonster = [[CookieMonster alloc] init];
}

#pragma mark - Actions

- (IBAction)tappedActionButton:(id)sender {  
  
  __weak typeof(self) weakSelf = self;
  [self.cookieMonster fetchStoredCookiesWithViewController:self
                                                completion:^(NSString *code) {
                                                  [weakSelf showSuccessWithCode:code];
                                                }];
}

#pragma mark - Private

- (void) showSuccessWithCode:(NSString*)code {
  NSString *title = code ? @"Ate a cookie" : @"Error";
  NSString *message = code ? [NSString stringWithFormat:@"Code: %@", code] : @"Could not fetch cookie.";
  NSString *buttonTitle = code ? @"Nom Nom" : @"OK";
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *okAction = [UIAlertAction actionWithTitle:buttonTitle
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {}];
  [alert addAction:okAction];
  
  [self presentViewController:alert
                     animated:YES
                   completion:^{}];
}

@end
