#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    texture2d_array<float> cp_i_tcb_4C_ [[id(1)]];
    texture2d_array<float> cp_i_tcb_4A_ [[id(2)]];
    texture2d_array<float> cp_i_tcb_4E_ [[id(3)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _35(thread const int& _262, thread const int& _263, constant _10& support_buffer)
{
    int _266 = 1 + _263;
    float _268 = support_buffer._m5[_266].x;
    bool _272 = _268 == 1.0;
    if (_272)
    {
        return _262;
    }
    float _274 = float(_262);
    float _276 = _274 * _268;
    int _278 = int(_276);
    return _278;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _39 = as_type<float>(gl_WorkGroupID.x);
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    float _43 = as_type<float>(gl_WorkGroupID.y);
    float _45 = as_type<float>(gl_LocalInvocationID.y);
    float _47 = as_type<float>(gl_WorkGroupID.z);
    int _49 = as_type<int>(_39) << 3;
    int _51 = _49 + as_type<int>(_41);
    int _53 = as_type<int>(_43) << 2;
    int _55 = _53 + as_type<int>(_45);
    int _57 = _51;
    int _59 = 0;
    int _61 = _35(_57, _59, (*spvDescriptorSet0.support_buffer));
    int _63 = _55;
    int _65 = 0;
    int _67 = _35(_63, _65, (*spvDescriptorSet0.support_buffer));
    int3 _179 = int3(_61, _67, as_type<int>(_47));
    float4 _70 = (spvDescriptorSet0.cp_i_tcb_4C_.read(uint2(_179.xy), uint(_179.z)).xyzw);
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    int _80 = _51;
    int _82 = 1;
    int _84 = _35(_80, _82, (*spvDescriptorSet0.support_buffer));
    int _86 = _55;
    int _88 = 1;
    int _90 = _35(_86, _88, (*spvDescriptorSet0.support_buffer));
    int3 _200 = int3(_84, _90, as_type<int>(_47));
    float4 _92 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(_200.xy), uint(_200.z)).xyzw);
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    int _102 = _51;
    int _104 = 2;
    int _106 = _35(_102, _104, (*spvDescriptorSet0.support_buffer));
    int _108 = _55;
    int _110 = 2;
    int _112 = _35(_108, _110, (*spvDescriptorSet0.support_buffer));
    int3 _221 = int3(_106, _112, as_type<int>(_47));
    float4 _114 = (spvDescriptorSet0.cp_i_tcb_4E_.read(uint2(_221.xy), uint(_221.z)).xyzw);
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = _94 + _72;
    float _126 = _96 + _74;
    float _128 = _98 + _76;
    float _130 = _116 + _124;
    float _132 = _118 + _126;
    float _134 = _120 + _128;
    int3 _256 = int3(_51, _55, as_type<int>(_47));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_130, _132, _134, 1.0), uint2(_256.xy), uint(_256.z));
}

