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

struct main0_out
{
    float4 m_32 [[color(2)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = gl_FragCoord.y;
    float _55 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _57 = _53 / _55;
    float _59 = gl_FragCoord.x;
    float _61 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _63 = _59 / _61;
    float _65 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _67 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _69 = 1.0 / _39;
    float _71 = trunc(_57);
    int _74 = int(_71);
    float _76 = _69 * _45;
    float _78 = trunc(_63);
    int _80 = int(_78);
    float _82 = _76 * _65;
    float _84 = _69 * _51;
    int _86 = _74 * 2;
    float _88 = _84 * _67;
    float _90 = trunc(_82);
    int _92 = int(_90);
    int _94 = _80 & 1;
    float _96 = trunc(_88);
    int _98 = int(_96);
    int _100 = 2 & _86;
    int _102 = (-3) & _94;
    int _104 = _100 | _102;
    int _106 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _108 = _106 + _92;
    int _110 = _108 * 4;
    int _112 = _110 + _104;
    int _114 = _112 << 2;
    int _116 = _114 + 9728;
    uint _119 = uint(int(uint(_116) >> uint(2)));
    uint _241 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_119)], 0u, memory_order_relaxed);
    uint _121 = _241;
    out.m_32.x = 0.0;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(2)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = gl_FragCoord.y;
    float _55 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _57 = _53 / _55;
    float _59 = gl_FragCoord.x;
    float _61 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _63 = _59 / _61;
    float _65 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _67 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _69 = 1.0 / _39;
    float _71 = trunc(_57);
    int _74 = int(_71);
    float _76 = _69 * _45;
    float _78 = trunc(_63);
    int _80 = int(_78);
    float _82 = _76 * _65;
    float _84 = _69 * _51;
    int _86 = _74 * 2;
    float _88 = _84 * _67;
    float _90 = trunc(_82);
    int _92 = int(_90);
    int _94 = _80 & 1;
    float _96 = trunc(_88);
    int _98 = int(_96);
    int _100 = 2 & _86;
    int _102 = (-3) & _94;
    int _104 = _100 | _102;
    int _106 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _108 = _106 + _92;
    int _110 = _108 * 4;
    int _112 = _110 + _104;
    int _114 = _112 << 2;
    int _116 = _114 + 9728;
    uint _119 = uint(int(uint(_116) >> uint(2)));
    uint _241 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_119)], 0u, memory_order_relaxed);
    uint _121 = _241;
    out.m_32.x = 0.0;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

