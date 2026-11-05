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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(3)]];
};

static inline __attribute__((always_inline))
int _37(thread const int& _468, thread const int& _469, constant _10& support_buffer)
{
    int _472 = 1 + _469;
    float _474 = support_buffer._m5[_472].x;
    bool _478 = _474 == 1.0;
    if (_478)
    {
        return _468;
    }
    float _480 = float(_468);
    float _482 = _480 * _474;
    int _484 = int(_482);
    return _484;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _41 = as_type<float>(gl_WorkGroupID.x);
    float _43 = as_type<float>(gl_LocalInvocationID.x);
    float _45 = as_type<float>(gl_WorkGroupID.y);
    float _47 = as_type<float>(gl_LocalInvocationID.y);
    float _49 = as_type<float>(gl_WorkGroupID.z);
    int _51 = as_type<int>(_41) << 3;
    int _53 = _51 + as_type<int>(_43);
    int _55 = as_type<int>(_45) << 2;
    int _57 = _55 + as_type<int>(_47);
    int _59 = _53;
    int _61 = 0;
    int _63 = _37(_59, _61, (*spvDescriptorSet0.support_buffer));
    int _65 = _57;
    int _67 = 0;
    int _69 = _37(_65, _67, (*spvDescriptorSet0.support_buffer));
    int3 _264 = int3(_63, _69, as_type<int>(_49));
    float4 _72 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_264.xy), uint(_264.z)).xyzw);
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    int _82;
    int _84 = _82;
    int _86 = 0;
    int _88 = _37(_84, _86, (*spvDescriptorSet0.support_buffer));
    int _90 = _57;
    int _92 = 0;
    int _94 = _37(_90, _92, (*spvDescriptorSet0.support_buffer));
    int3 _285 = int3(_88, _94, as_type<int>(_49));
    float4 _96 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_285.xy), uint(_285.z)).xyzw);
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    int _106 = _53;
    int _108 = 0;
    int _110 = _37(_106, _108, (*spvDescriptorSet0.support_buffer));
    int _112;
    int _114 = _112;
    int _116 = 0;
    int _118 = _37(_114, _116, (*spvDescriptorSet0.support_buffer));
    int3 _306 = int3(_110, _118, as_type<int>(_49));
    float4 _120 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_306.xy), uint(_306.z)).xyzw);
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    int _130 = as_type<int>(_49) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    int _132 = _130 << 4;
    int _134 = _132 + 12;
    uint _137 = uint(int(uint(_134) >> uint(2)));
    uint _139 = uint(int(uint(int(_137)) >> uint(2)));
    int _141 = int(_137) & 3;
    float _143 = (*spvDescriptorSet0.cp_c3)._m0[int(_139)][_141];
    float _145 = _98 + _143;
    float _147 = _126 + _143;
    float _149 = -_74;
    float _151 = _149 + _122;
    float _153 = -_78;
    float _155 = _153 + _102;
    float _157 = -_74;
    float _159 = _157 + _145;
    float _161 = -_78;
    float _163 = _161 + _147;
    float _165 = _151 * _155;
    float _167 = -_76;
    float _169 = _167 + _100;
    float _171 = -_165;
    float _173 = fma(_163, _159, _171);
    float _175 = -_76;
    float _177 = _175 + _124;
    float _179 = _163 * _169;
    float _181 = precise::max(_173, 9.9999997473787516355514526367188e-05);
    float _183 = _177 * _159;
    float _185 = -_179;
    float _187 = fma(_177, _155, _185);
    float _189 = _181 * _181;
    float _191 = -_183;
    float _193 = fma(_151, _169, _191);
    float _195 = 1.0 / _143;
    float _197 = fma(_187, _187, _189);
    float _199 = fma(_193, _193, _197);
    float _201 = rsqrt(_199);
    float _203 = _155 * _195;
    float _205 = _151 * _195;
    float _207 = _159 * _195;
    float _209 = _163 * _195;
    float _211 = _203 * _205;
    float _213 = -_211;
    float _215 = fma(_207, _209, _213);
    float _217 = _187 * _201;
    float _219 = _193 * _201;
    int3 _462 = int3(_53, _57, as_type<int>(_49));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_217, _219, 0.0, _215), uint2(_462.xy), uint(_462.z));
}

