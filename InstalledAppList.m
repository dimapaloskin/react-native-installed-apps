#include <objc/runtime.h>
#import "InstalledAppList.h"

@implementation InstalledAppList

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getAll:(RCTResponseSenderBlock)callback)
{
    NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
    NSString *sandBoxPath = [bundleRoot stringByDeletingLastPathComponent];
    NSString *appFolderPath = [sandBoxPath stringByDeletingLastPathComponent];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:appFolderPath error:nil];
    
    NSMutableArray *appNames = [[NSMutableArray alloc]init];
    for(NSString *application in dirContents)
    {
        NSString *appPath = [appFolderPath stringByAppendingPathComponent:application];
        NSArray *appcontents = [fm contentsOfDirectoryAtPath:appPath error:nil];
        NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.app'"];
        NSArray *onlyApps = [appcontents filteredArrayUsingPredicate:fltr];
        NSString *infoPlistPath;
        infoPlistPath = [NSString stringWithFormat:@"%@/%@/%@", appPath , onlyApps[0], @"Info.plist"];
        NSDictionary *plistContent = [NSDictionary dictionaryWithContentsOfFile:infoPlistPath];
        
        if (!plistContent) {
            plistContent = @{};
        }
        
        if(onlyApps.count > 0) {
            
            NSDictionary *item = @{
                                   @"app": onlyApps[0],
                                   @"appPath": appPath,
                                   @"info": plistContent
                                   };
            [appNames addObject:item];
        }
        
    }
    
    callback(@[appNames]);
    
}

@end