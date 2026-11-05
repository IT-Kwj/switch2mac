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
    float _45 = gl_FragCoord.w;
    float _47 = gl_FragCoord.y;
    float _49 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _51 = _47 / _49;
    float _53 = gl_FragCoord.x;
    float _55 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _57 = _53 / _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _73 = as_type<float>(gl_SubgroupInvocationID);
    int _76 = as_type<int>(_73) & 3;
    bool _80 = _76 != 0;
    float _82 = 1.0 / _45;
    float _84 = trunc(_51);
    int _86 = int(_84);
    float _88 = trunc(_57);
    int _90 = int(_88);
    float _92 = _82 * _63;
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _96 = _92 * _71;
    float _98 = _82 * _69;
    int _100 = _86 * 2;
    float _102 = _98 * _94;
    float _104 = trunc(_96);
    int _106 = int(_104);
    int _108 = _90 & 1;
    float _110 = trunc(_102);
    int _112 = int(_110);
    int _114 = 2 & _100;
    int _116 = (-3) & _108;
    int _118 = _114 | _116;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_90, _86)));
    int _120 = _112 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _122 = _120 + _106;
    int _124 = _122 * 4;
    int _126 = _124 + _118;
    int _128 = _126 << 2;
    if (!_80)
    {
        int _130 = _90 >> 31;
        int _132 = _86 >> 31;
        int _134 = _130 & 1;
        int _136 = _132 & 1;
        int _138 = _90 + _134;
        int _140 = _86 + _136;
        int _142 = _138 >> 1;
        int _144 = _140 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_142, _144)));
    }
    uint _147 = uint(int(uint(_128) >> uint(2)));
    uint _308 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_147)], 0u, memory_order_relaxed);
    uint _149 = _308;
}

