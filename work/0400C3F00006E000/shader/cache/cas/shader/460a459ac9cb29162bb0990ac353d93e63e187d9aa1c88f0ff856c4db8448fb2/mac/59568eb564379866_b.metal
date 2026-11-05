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
    texture2d<float, access::write> fp_i_tcb_48_ [[id(3)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(4)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment void main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _45 = gl_FragCoord.x;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = gl_FragCoord.y;
    float _53 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _55 = _51 / _53;
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _73 = as_type<float>(gl_SubgroupInvocationID);
    float _75 = trunc(_49);
    int _78 = int(_75);
    int _80 = as_type<int>(_73) & 3;
    bool _84 = _80 != 0;
    float _86 = trunc(_55);
    int _88 = int(_86);
    float _90 = 1.0 / _57;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_78, _88)));
    float _92 = _90 * _63;
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _92 * _71;
    float _98 = _90 * _69;
    int _100 = _88 * 2;
    int _102 = _78 & 1;
    float _104 = _98 * _94;
    float _106 = trunc(_96);
    int _108 = int(_106);
    int _110 = 2 & _100;
    int _112 = (-3) & _102;
    int _114 = _110 | _112;
    float _116 = trunc(_104);
    int _118 = int(_116);
    int _120 = _118 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _122 = _120 + _108;
    int _124 = _122 * 4;
    int _126 = _124 + _114;
    int _128 = _126 * 4;
    int _130 = _128 + 9728;
    if (!_84)
    {
        int _132 = _78 >> 31;
        int _134 = _88 >> 31;
        int _136 = _132 & 1;
        int _138 = _134 & 1;
        int _140 = _78 + _136;
        int _142 = _88 + _138;
        int _144 = _140 >> 1;
        int _146 = _142 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_144, _146)));
    }
    uint _149 = uint(int(uint(_128) >> uint(2)));
    uint _317 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_149)], 0u, memory_order_relaxed);
    uint _151 = _317;
    uint _153 = uint(int(uint(_130) >> uint(2)));
    uint _324 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_153)], 0u, memory_order_relaxed);
    uint _155 = _324;
}

