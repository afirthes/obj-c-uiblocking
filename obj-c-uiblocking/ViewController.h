//
//  ViewController.h
//  obj-c-uiblocking
//
//  Created by sehio on 11.07.2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSThread *thread;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)button:(id)sender;


@end

