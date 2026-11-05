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
    constant _16* cp_c3 [[id(1)]];
    const device _21* cp_s0 [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(3)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _551, thread const int& _552, constant _10& support_buffer)
{
    int _555 = 1 + _552;
    float _557 = support_buffer._m5[_555].x;
    bool _559 = _557 == 1.0;
    if (_559)
    {
        return _551;
    }
    float _561 = float(_551);
    float _563 = _561 * _557;
    int _565 = int(_563);
    return _565;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _46 = as_type<float>(gl_WorkGroupID.y);
    float _48 = as_type<float>(gl_WorkGroupID.z);
    float _50 = as_type<float>(gl_WorkGroupID.x);
    int _52 = as_type<int>(_48) << 5;
    int _54 = _52 + as_type<int>(_46);
    int _56 = _54 << 4;
    int _58 = _56 + as_type<int>(_50);
    int _60 = _58 << 2;
    uint _63 = uint(int(uint(_60) >> uint(2)));
    float _65 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_63)]);
    float _67 = as_type<float>(gl_LocalInvocationID.x);
    float _69 = as_type<float>(gl_LocalInvocationID.y);
    int _71 = as_type<int>(_50) << 3;
    int _73 = _71 + as_type<int>(_67);
    int _75 = as_type<int>(_46) << 2;
    int _77 = _75 + as_type<int>(_69);
    bool _81 = as_type<int>(_65) != 0;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = 1.0;
    }
    float _85 = _83;
    if (!_81)
    {
        int3 _328 = int3(_73, _77, as_type<int>(_48));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0, 0.0, 0.0, _85), uint2(_328.xy), uint(_328.z));
    }
    if (!_81)
    {
        return;
    }
    int _87 = _73 + 1;
    int _89 = min(_87, 127);
    int _91 = _89;
    int _93 = 1;
    int _95 = _42(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = _77;
    int _99 = 1;
    int _101 = _42(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _351 = int3(_95, _101, as_type<int>(_48));
    float4 _104 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_351.xy), uint(_351.z)).xyzw);
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    int _114 = _73;
    int _116 = 1;
    int _118 = _42(_114, _116, (*spvDescriptorSet0.support_buffer));
    int _120 = _77;
    int _122 = 1;
    int _124 = _42(_120, _122, (*spvDescriptorSet0.support_buffer));
    int3 _372 = int3(_118, _124, as_type<int>(_48));
    float4 _126 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_372.xy), uint(_372.z)).xyzw);
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    int _136 = _73;
    int _138 = 1;
    int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142;
    int _144 = _142;
    int _146 = 1;
    int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
    int3 _393 = int3(_140, _148, as_type<int>(_48));
    float4 _150 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_393.xy), uint(_393.z)).xyzw);
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    int _160 = as_type<int>(_48) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    int _162 = _160 << 4;
    int _164 = _162 + 12;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    uint _168 = uint(int(uint(int(_166)) >> uint(2)));
    int _170 = int(_166) & 3;
    float _172 = (*spvDescriptorSet0.cp_c3)._m0[int(_168)][_170];
    float _174 = _106 + _172;
    float _176 = -_132;
    float _178 = _176 + _110;
    float _180 = _156 + _172;
    float _182 = -_128;
    float _184 = _182 + _152;
    float _186 = -_128;
    float _188 = _186 + _174;
    float _190 = -_132;
    float _192 = _190 + _180;
    float _194 = _184 * _178;
    float _196 = -_130;
    float _198 = _196 + _108;
    float _200 = -_194;
    float _202 = fma(_192, _188, _200);
    float _204 = -_130;
    float _206 = _204 + _154;
    float _208 = _192 * _198;
    float _210 = precise::max(_202, 9.9999997473787516355514526367188e-05);
    float _212 = _206 * _188;
    float _214 = -_208;
    float _216 = fma(_206, _178, _214);
    float _218 = _210 * _210;
    float _220 = -_212;
    float _222 = fma(_184, _198, _220);
    float _224 = 1.0 / _172;
    float _226 = fma(_216, _216, _218);
    float _228 = fma(_222, _222, _226);
    float _230 = rsqrt(_228);
    float _232 = _178 * _224;
    float _234 = _184 * _224;
    float _236 = _188 * _224;
    float _238 = _192 * _224;
    float _240 = _232 * _234;
    float _242 = -_240;
    float _244 = fma(_236, _238, _242);
    float _246 = _216 * _230;
    float _248 = _222 * _230;
    int3 _546 = int3(_73, _77, as_type<int>(_48));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_246, _248, 0.0, _244), uint2(_546.xy), uint(_546.z));
}

