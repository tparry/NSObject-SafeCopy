NSObject+SafeCopy
===========

`NSObject+SafeCopy` is a Mac and iOS category for `NSObject` which makes working with unknown class types easier.

It removes the need to write common boilerplate code to first check an objects type before assigning or copying it to a property or variable.

Usage
-----

    id unknownObject;
    
    //	No type checking needed
    NSString* string = [unknownObject safeStringCopy];
    const NSInteger number = [unknownObject safeIntegerValue];

Example
-----

When extracting information from a server response you often want to type check variables before using them. Not doing this may cause an unexpected server response to crash your app.

**The old**

    - (instancetype) initWithJSONDictionary:(NSDictionary*) dictionary
    {
    	self = [super init];
    	
    	if(self != nil)
    	{
    		id untypedTitle = dictionary[@"title"];
    		if([untypedTitle isKindOfClass:[NSString class]])
    			_title = [untypedTitle copy];
    		
    		id untypedAuthor = dictionary[@"author"];
    		if([untypedAuthor isKindOfClass:[NSString class]])
    			_author = [untypedAuthor copy];
    		
    		id untypedTags = dictionary[@"tags"];
    		if([untypedTags isKindOfClass:[NSArray class]])
    			_tags = [untypedTags copy];
    		
    		id untypedLikeCount = dictionary[@"like_count"];
    		if([untypedLikeCount respondsToSelector:@selector(integerValue)])
    			_likeCount = [untypedLikeCount integerValue];
    		
    		id untypedFeatured = dictionary[@"featured"];
    		if([untypedFeatured respondsToSelector:@selector(boolValue)])
    			_featured = [untypedFeatured boolValue];
    	}
    	
    	return self;
    }

**The new**

    - (instancetype) initWithJSONDictionary:(NSDictionary*) dictionary
    {
    	self = [super init];
    	
    	if(self != nil)
    	{
    		_title = [dictionary[@"title"] safeStringCopy];
    		_author = [dictionary[@"author"] safeStringCopy];
    		_tags = [dictionary[@"tags"] safeArrayCopy];
    		_likeCount = [dictionary[@"like_count"] safeIntegerValue];
    		_featured = [dictionary[@"featured"] safeBoolValue];
    	}
    	
    	return self;
    }
