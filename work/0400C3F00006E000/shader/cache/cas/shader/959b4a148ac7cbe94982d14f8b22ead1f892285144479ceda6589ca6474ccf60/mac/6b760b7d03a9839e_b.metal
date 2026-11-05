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
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(2)]];
};

struct main0_out
{
    float4 m_28 [[color(2)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.x;
    float _37 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _39 = _35 / _37;
    float _41 = gl_FragCoord.y;
    float _43 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _45 = _41 / _43;
    float _47 = as_type<float>(gl_SubgroupInvocationID);
    int _50 = as_type<int>(_47) & 3;
    bool _54 = _50 != 0;
    float _56 = trunc(_39);
    int _58 = int(_56);
    float _60 = trunc(_45);
    int _62 = int(_60);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_58, _62)));
    if (!_54)
    {
        int _64 = _58 >> 31;
        int _66 = _62 >> 31;
        int _68 = _64 & 1;
        int _70 = _66 & 1;
        int _72 = _58 + _68;
        int _74 = _62 + _70;
        int _76 = _72 >> 1;
        int _78 = _74 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_76, _78)));
    }
    out.m_28.x = 0.0;
    return out;
}


struct main0_out_u
{
    uint4 m_28 [[color(2)]];
};

fragment main0_out_u main0_u(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.x;
    float _37 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _39 = _35 / _37;
    float _41 = gl_FragCoord.y;
    float _43 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _45 = _41 / _43;
    float _47 = as_type<float>(gl_SubgroupInvocationID);
    int _50 = as_type<int>(_47) & 3;
    bool _54 = _50 != 0;
    float _56 = trunc(_39);
    int _58 = int(_56);
    float _60 = trunc(_45);
    int _62 = int(_60);
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_58, _62)));
    if (!_54)
    {
        int _64 = _58 >> 31;
        int _66 = _62 >> 31;
        int _68 = _64 & 1;
        int _70 = _66 & 1;
        int _72 = _58 + _68;
        int _74 = _62 + _70;
        int _76 = _72 >> 1;
        int _78 = _74 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_76, _78)));
    }
    out.m_28.x = 0.0;
    return main0_out_u{as_type<uint4>(out.m_28)};
}

