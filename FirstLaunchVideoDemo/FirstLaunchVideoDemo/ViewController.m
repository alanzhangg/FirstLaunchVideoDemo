//
//  ViewController.m
//  FirstLaunchVideoDemo
//
//  Created by jinxin on 28/08/2017.
//  Copyright © 2017 jinxin. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"IMG_0230" ofType:@"MOV"];
	NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
	
	AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:sourceMovieURL options:nil];
	AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
	AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
	
	player.volume = 0.5;
	AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
	playerLayer.frame = self.view.layer.bounds;
	playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endVideo:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
	[self.view.layer addSublayer:playerLayer];
	[player play];
}

- (void)endVideo:(NSNotification *)notification{
	NSLog(@"end");
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
