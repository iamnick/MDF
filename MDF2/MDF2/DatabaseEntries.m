//
//  DatabaseEntries.m
//  MDF2
//
//  Created by Nick Stelzer on 5/16/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DatabaseEntries.h"

@implementation DatabaseEntries

static DatabaseEntries *_instance = nil;

+(void)CreateInstance
{
	if (_instance == nil) {
    	[[self alloc] init];
    }
}

+(DatabaseEntries*)GetInstance
{
	return _instance;
}

+(id)alloc
{
	_instance = [super alloc];
    return _instance;
}

-(id)init
{
	if (self = [super init]){
    	//custom init
        [self setTitles:@[@"The Evolution of Web Development for Mobile Devices", @"Why You Should Always Pay for Apps", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
        [self setAuthors:@[@"Zakas, Nicholas C.", @"Sega, Sascha", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
    	[self setDocTypes:@[@"Academic Journal", @"Periodical", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"A"]];
        [self setSources:@[@"Communications of the ACM. Apr2013, Vol. 56 Issue 4, p42-48. 7p.", @"PC Magazine. Mar2013, p24-27, 4p.", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
        [self setLinks:@[@"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?vid=6&sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=7&hid=28", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
    }
    return self;
}

// This function loops through all of the data entries, returning the index values of entries that match the document type we want
-(NSMutableArray*)GetValidEntries:(NSString*)ofDocType
{
	NSMutableArray *validEntries = [[NSMutableArray alloc] init];
	for (int i = 0; i < [_docTypes count]; i++) {
    	if ([_docTypes objectAtIndex:i] == ofDocType) {
        	NSNumber *validEntry = [NSNumber numberWithInteger:i];
    		[validEntries addObject:validEntry];
        }
    }
    return validEntries;
}

// This function gets all of the entry information at a specific index and returns an array containing all of it
-(NSArray*)GetSpecificEntry:(int)index
{
	NSArray *entry = @[[self.titles objectAtIndex:index], [self.authors objectAtIndex:index], [self.sources objectAtIndex:index], [self.links objectAtIndex:index]];
    return entry;
}
@end
