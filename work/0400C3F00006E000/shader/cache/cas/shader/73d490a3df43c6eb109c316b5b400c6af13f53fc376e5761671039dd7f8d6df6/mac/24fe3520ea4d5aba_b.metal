#include <metal_stdlib>
#include <simd/simd.h>

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float, access::write> fp_i_tcb_48_ [[id(1)]];
};

struct main0_out
{
    float4 m_28 [[color(1)]];
};

struct main0_in
{
    float4 m_22 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_22.z;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_22.w;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = as_type<float>(gl_SubgroupInvocationID);
    int _52 = as_type<int>(_49) & 3;
    bool _56 = _52 != 0;
    float _58 = 1.0 / _35;
    float _60 = _58 * _41;
    float _62 = _58 * _47;
    float _64 = floor(_60);
    float _66 = floor(_62);
    float _68 = -_64;
    float _70 = _60 + _68;
    float _72 = -_66;
    float _74 = _62 + _72;
    float _76 = 0.0 + _70;
    float _78 = precise::clamp(_76, 0.0, 1.0);
    float _80 = 0.0 + _74;
    float _82 = precise::clamp(_80, 0.0, 1.0);
    float _84 = -_70;
    float _86 = _84 + _78;
    float _88 = -_74;
    float _90 = _88 + _82;
    if (!_56)
    {
        float _92 = gl_FragCoord.x;
        float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _96 = _92 / _94;
        float _98 = gl_FragCoord.y;
        float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _102 = _98 / _100;
        float _104 = trunc(_96);
        int _106 = int(_104);
        float _108 = trunc(_102);
        int _110 = int(_108);
        int _112 = _106 >> 31;
        int _114 = _112 & 1;
        int _116 = _110 >> 31;
        int _118 = _106 + _114;
        int _120 = _116 & 1;
        int _122 = _110 + _120;
        int _124 = _118 >> 1;
        int _126 = _122 >> 1;
        spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_124, _126)));
    }
    float _128 = fma(_86, 0.5, 0.5);
    float _130 = fma(_90, 0.5, 0.5);
    out.m_28.x = _128;
    out.m_28.y = _130;
    return out;
}

