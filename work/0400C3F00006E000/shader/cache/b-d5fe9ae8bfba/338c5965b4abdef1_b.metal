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
    texture2d<float> cp_i_tcb_48_ [[id(1)]];
    texture2d<float, access::write> cp_i_tcb_4A_ [[id(2)]];
};

static inline __attribute__((always_inline))
int _31(thread const int& _287, thread const int& _288, constant _10& support_buffer)
{
    int _291 = 1 + _288;
    float _293 = support_buffer._m5[_291].x;
    bool _297 = _293 == 1.0;
    if (_297)
    {
        return _287;
    }
    float _299 = float(_287);
    float _301 = _299 * _293;
    int _303 = int(_301);
    return _303;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _35 = as_type<float>(gl_WorkGroupID.y);
    float _37 = as_type<float>(gl_LocalInvocationID.y);
    float _39 = as_type<float>(gl_WorkGroupID.x);
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    int _43 = as_type<int>(_35) * 8;
    int _45 = _43 + as_type<int>(_37);
    int _47 = as_type<int>(_39) * 8;
    int _49 = _47 + as_type<int>(_41);
    int _51 = max(0, _45);
    int _53 = _49 + 1;
    int _55 = _49 + (-1);
    int _57 = min(_51, 255);
    int _59 = max(0, _53);
    int _61 = max(0, _55);
    int _63 = min(_61, 255);
    int _65 = min(_59, 255);
    int _67 = _63;
    int _69 = 0;
    int _71 = _31(_67, _69, (*spvDescriptorSet0.support_buffer));
    int _73 = _57;
    int _75 = 0;
    int _77 = _31(_73, _75, (*spvDescriptorSet0.support_buffer));
    float _79 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_71, _77))).x;
    int _81 = _65;
    int _83 = 0;
    int _85 = _31(_81, _83, (*spvDescriptorSet0.support_buffer));
    int _87 = _57;
    int _89 = 0;
    int _91 = _31(_87, _89, (*spvDescriptorSet0.support_buffer));
    float _93 = spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_85, _91))).x;
    int _95;
    int _97 = _95;
    int _99 = 0;
    int _101 = _31(_97, _99, (*spvDescriptorSet0.support_buffer));
    int _103;
    int _105 = _103;
    int _107 = 0;
    int _109 = _31(_105, _107, (*spvDescriptorSet0.support_buffer));
    float2 _113 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_101, _109))).xy);
    float _115 = _113.x;
    float _117 = _113.y;
    int _119 = _95;
    int _121 = 0;
    int _123 = _31(_119, _121, (*spvDescriptorSet0.support_buffer));
    int _125;
    int _127 = _125;
    int _129 = 0;
    int _131 = _31(_127, _129, (*spvDescriptorSet0.support_buffer));
    float2 _133 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_123, _131))).xy);
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = -_79;
    float _141 = _139 + _93;
    float _143 = -_117;
    float _145 = _143 + _137;
    float _147 = _141 + _145;
    float _149 = -_145;
    float _151 = _141 + _149;
    float _153 = _147 * 0.5;
    float _155 = _151 * 0.5;
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_153, _155, 0.0, 0.0), uint2(int2(_49, _45)));
}

