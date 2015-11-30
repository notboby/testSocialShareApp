//
//  ViewController.m
//  testSocialShareApp
//
//  Created by Robin Fabre on 29/11/2015.
//  Copyright © 2015 Robin Fabre. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;


- (void) showAlertMessage:(NSString *) myMessage;

@property (weak, nonatomic) IBOutlet UITextView *facebookTextView;

@property (weak, nonatomic) IBOutlet UITextView *shareTextView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showAlertMessage:(NSString *) myMessage{
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"TwitterShare" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

// Share button 1
- (IBAction)twitterShareAction:(id)sender {
    
    if([self.tweetTextView isFirstResponder]){
        [self.tweetTextView resignFirstResponder];
    }
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        if([self.tweetTextView.text length] < 140){
            [twitterVC setInitialText:self.tweetTextView.text];
            
        }
        else{
            NSString *shortText = [self.tweetTextView.text substringToIndex:140];
            [twitterVC setInitialText:shortText];
        }
        
        [self presentViewController:twitterVC animated:YES completion:nil];
        
    }
    else{
        [self showAlertMessage:@"Vous n'êtes pas connecté à Twitter"];
        
    }


    
    
    
}

// Share button 2

- (IBAction)facebookShareAction:(id)sender {
    
    if([self.facebookTextView isFirstResponder]){
        [self.facebookTextView resignFirstResponder];
    }
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:self.facebookTextView.text];
        [self presentViewController:facebookVC animated:YES completion:nil];
        
    }else{
        [self showAlertMessage:@"Veuillez vous connecter à Facebook"];
    }





}

// Share button 3

- (IBAction)shareAction:(id)sender {
    if([self.shareTextView isFirstResponder]){
        [self.shareTextView resignFirstResponder];
    }
    
    UIActivityViewController *moreVC = [[UIActivityViewController alloc]initWithActivityItems:@[self.shareTextView.text] applicationActivities:nil];
    
    [self presentViewController:moreVC animated:YES completion:nil];



}

// Share button 4

- (IBAction)nothingAction:(id)sender {
    [self showAlertMessage:@"Je ne fais rien"];
}





@end
