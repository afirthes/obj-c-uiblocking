//
//  ViewController.m
//  obj-c-uiblocking
//
//  Created by sehio on 11.07.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSThread *)thread {
    if(!_thread) {
        _thread = [[NSThread alloc]
                   initWithTarget:self
                   selector:@selector(longloop)
                   object:nil];
    }
    return _thread;
}

- (void)longloop {
    for(long i=0; YES; i++) {
        [self performSelector:@selector(updateOutput:) onThread:[NSThread mainThread] withObject:[NSNumber numberWithLong:i] waitUntilDone:NO];
        sleep(1);
        if ([self.thread isCancelled]) {
            self.thread = nil;
            break;
        }
    }
}

- (void)updateOutput:(NSNumber *)count {
    self.label.text = [NSString stringWithFormat:@"%ld", [count longValue]];
}

- (IBAction)button:(id)sender {
    
    if([self.thread isExecuting]) {
        NSLog(@"Stopping thread");
        [self.thread cancel];
    } else {
        NSLog(@"Starting thread");
        [self.thread start];
    }
}
@end
