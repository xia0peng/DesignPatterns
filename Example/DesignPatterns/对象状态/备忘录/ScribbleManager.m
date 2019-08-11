//
//  ScribbleManager.m
//  DesignPatterns_Example
//
//  Created by 王小朋 on 2019/8/11.
//  Copyright © 2019 xiaopengwang. All rights reserved.
//

#import "ScribbleManager.h"
#import "ScribbleMemento.h"
#import "Scribble.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@implementation ScribbleManager

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image
{
    // get a new index for the new scribble data and its thumbnail
    NSInteger newIndex = [self numberOfScribbles] + 1;
    
    // use the index as part of the name for each of them
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%ld", (long)newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%ld.png",
                                       (long)newIndex];
    
    // 从涂鸦取得备忘录
    // 保存到文件系统
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath]
                             stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    // save the thumbnail directly in
    // the file system
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumbnailPath]
                           stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];
}

- (NSInteger) numberOfScribbles
{
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    return [scribbleDataPathsArray count];
}

- (Scribble *) scribbleAtIndex:(NSInteger)index
{
    Scribble *loadedScribble = nil;
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    
    // load scribble data from the path indicated
    // by the index
    NSString *scribblePath = [scribbleDataPathsArray objectAtIndex:index];
    if (scribblePath)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:[kScribbleDataPath
                                                            stringByAppendingPathComponent:
                                                            scribblePath]];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        loadedScribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return loadedScribble;
}


- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index
{
    return nil;
}

#pragma mark -
#pragma mark Private Methods

- (NSString *) scribbleDataPath
{
    // lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleDataPath;
}


- (NSString *) scribbleThumbnailPath
{
    // lazy create the scribble thumbnail directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleThumbnailPath;
}


- (NSArray *) scribbleDataPaths
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath]
                                                                       error:&error];
    
    return scribbleDataPathsArray;
}


- (NSArray*) scribbleThumbnailPaths
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath]
                                                                            error:&error];
    return scribbleThumbnailPathsArray;
}

@end
