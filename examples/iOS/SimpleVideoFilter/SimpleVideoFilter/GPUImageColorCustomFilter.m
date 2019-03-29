//
//  GPUImageColorCustomFilter.m
//  SimpleVideoFilter
//
//  Created by qichao.ma on 2019/2/22.
//  Copyright © 2019 Cell Phone. All rights reserved.
//

#import "GPUImageColorCustomFilter.h"

NSString *const kGPUImageInvertFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 
 void main()
 {
     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
     
     gl_FragColor = vec4((1.0 - textureColor.rgb), textureColor.a);
 }
 );

@implementation GPUImageColorCustomFilter

- (id)init
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageInvertFragmentShaderString]))
    {
        return nil;
    }
    
    return self;
}

@end
