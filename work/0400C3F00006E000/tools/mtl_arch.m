#import <Metal/Metal.h>
int main(void) { @autoreleasepool { id<MTLDevice> d = MTLCreateSystemDefaultDevice(); if (!d) return 1; printf("%s\n", d.architecture.name.UTF8String); return 0; } }
