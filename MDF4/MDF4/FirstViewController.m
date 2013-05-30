//
//  FirstViewController.m
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "FirstViewController.h"
#import "Stream.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
	// Access XML Data from Justin.tv API
	url = [[NSURL alloc] initWithString:@"http://api.justin.tv/api/stream/list.xml?meta_game=League%20of%20Legends&limit=10"];
    request = [[NSURLRequest alloc] initWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    requestData = [NSMutableData data];
    
    // Parse the XML into an array of Stream objects
    NSData *xmlData = [self GetFileDataFromFile:@"streamData.xml"];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    if (parser) {
    	[parser setDelegate:self];
        [parser parse];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if (data) {
    	[requestData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	// Get path to Documents to save the XML
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"streamData.xml"];
    [requestData writeToFile:fullPath atomically:true];
}

-(NSData*)GetFileDataFromFile:(NSString*)filename
{
	NSString *filePath = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    if ([fileManager fileExistsAtPath:filePath]) {
    	return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	currentElement = [elementName copy];
    currentElementValue = [[NSMutableString alloc] init];
    if ([elementName isEqualToString:@"stream"]) {
    	// allocate and initialize Stream object
        currentStream = [[Stream alloc] init];
        NSLog(@"Found new <stream>");
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	[currentElementValue appendString:string];
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"stream"]) {
    	// add Stream object to array
        NSLog(@"Title - %@", [currentStream title]);
        NSLog(@"Username - %@", [currentStream username]);
        NSLog(@"Viewers - %@", [currentStream viewers]);
        NSLog(@"Total Views - %@", [currentStream totalViews]);
        NSLog(@"Stream Link - %@", [currentStream streamLink]);
        [streamArray addObject:currentStream];
        NSLog(@"End of <stream>");
    } else if ([elementName isEqualToString:@"title"]){
        // Only takes the first <title> tag value, the second one is incorrect
        if (![currentStream title]) {
        	[currentStream setTitle:currentElementValue];
        }
    } else if ([elementName isEqualToString:@"name"]){
    	[currentStream setUsername:currentElementValue];
    } else if ([elementName isEqualToString:@"stream_count"]){
    	[currentStream setViewers:currentElementValue];
    } else if ([elementName isEqualToString:@"channel_view_count"]){
    	[currentStream setTotalViews:currentElementValue];
    } else if ([elementName isEqualToString:@"channel_url"]){
        [currentStream setStreamLink:currentElementValue];
    }
}
@end
