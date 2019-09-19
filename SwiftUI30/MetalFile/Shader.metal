//
//  Shader.metal
//  SwiftUI30
//
//  Created by RainZhong on 2019/9/18.
//  Copyright © 2019 RainZhong. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct Vertex{
    float4 position [[position]];
    float4 color;
};

struct Uniforms{
    float4x4 MVP;
};

vertex Vertex vertex_func(constant Vertex* vertices [[buffer(0)]], constant Uniforms& uniforms[[buffer(1)]],uint vid [[vertex_id]])
{
    float4x4 matrix = uniforms.MVP;
    Vertex in = vertices[vid];
    Vertex out;
    out.position = matrix * float4(in.position);
    out.color = in.color;
    return out;
}

fragment float4 fragment_func(Vertex vert [[stage_in]])
{
    return vert.color;
}
