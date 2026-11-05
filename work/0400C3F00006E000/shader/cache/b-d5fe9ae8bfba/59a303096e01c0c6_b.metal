#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment void main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    float _36 = gl_FragCoord.w;
    float _38 = in.m_29.x;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = in.m_29.y;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = gl_FragCoord.y;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = gl_FragCoord.x;
    float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _60 = _56 / _58;
    float _62 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _64 = 1.0 / _36;
    float _66 = trunc(_54);
    int _69 = int(_66);
    float _71 = _64 * _42;
    float _73 = trunc(_60);
    int _75 = int(_73);
    float _77 = _71 * _62;
    float _79 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _81 = _64 * _48;
    int _83 = _69 * 2;
    float _85 = _81 * _79;
    float _87 = trunc(_77);
    int _89 = int(_87);
    int _91 = _75 & 1;
    float _93 = trunc(_85);
    int _95 = int(_93);
    int _97 = 2 & _83;
    int _99 = (-3) & _91;
    int _101 = _97 | _99;
    int _103 = _95 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _105 = _103 + _89;
    int _107 = _105 << 2;
    int _109 = _107 + _101;
    int _111 = _109 << 2;
    int _113 = _111 + 9728;
    uint _116 = uint(int(uint(_113) >> uint(2)));
    uint _237 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_116)], 0u, memory_order_relaxed);
    uint _118 = _237;
}

