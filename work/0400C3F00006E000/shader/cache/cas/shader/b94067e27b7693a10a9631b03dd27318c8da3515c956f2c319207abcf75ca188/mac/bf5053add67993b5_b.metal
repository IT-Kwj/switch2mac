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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(3)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _39(thread const int& _572, thread const int& _573, constant _10& support_buffer)
{
    int _576 = 1 + _573;
    float _578 = support_buffer._m5[_576].x;
    bool _580 = _578 == 1.0;
    if (_580)
    {
        return _572;
    }
    float _582 = float(_572);
    float _584 = _582 * _578;
    int _586 = int(_584);
    return _586;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _137 = false;
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    float _51 = as_type<float>(gl_WorkGroupID.z);
    int _53 = as_type<int>(_43) << 3;
    int _55 = _53 + as_type<int>(_45);
    int _57 = as_type<int>(_47) << 3;
    int _59 = _57 + as_type<int>(_49);
    int _61 = _55 + (-32);
    int _63 = _59 + (-32);
    int _65 = _61 | _63;
    bool _69 = _65 != 0;
    if (!_69)
    {
        int3 _301 = int3(_55, _59, as_type<int>(_51));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(0.0), uint2(_301.xy), uint(_301.z));
    }
    if (!_69)
    {
        return;
    }
    float _71 = float(_63);
    float _73 = float(_61);
    int _75 = as_type<int>(_51) * as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    int _77 = _75 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    int _79 = _77 & 31;
    bool _81 = uint(_79) < 32u;
    int _83 = 1 << _79;
    int _85 = _81 ? _83 : 0;
    float _87 = float(_85);
    float _89 = 1.0 / _87;
    float _91 = _89 * 12.56637096405029296875;
    float _93 = _91 * _71;
    float _95 = _91 * _73;
    float _97 = _93 * _93;
    float _99 = fma(_95, _95, _97);
    float _101 = sqrt(_99);
    float _103 = _101 * (*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _105 = abs(_103);
    bool _107 = _105 >= 0.60000002384185791015625;
    bool _109 = !_107;
    float _135;
    if (!_109)
    {
        float _111 = abs(_103);
        float _113 = _111 * 2.8853900432586669921875;
        float _115 = abs(_103);
        bool _117 = _115 >= 9.010913848876953125;
        float _119 = exp2(_113);
        float _121 = _119 + 1.0;
        float _123 = 1.0 / _121;
        float _125 = fma(_123, -2.0, 1.0);
        bool _127 = !_117;
        int _129 = _127 ? as_type<int>(_125) : 1065353216;
        int _131 = int(0x80000000) & as_type<int>(_103);
        int _133 = _129 | _131;
        _135 = as_type<float>(_133);
        _137 = true;
    }
    else
    {
        float _139 = _103 * _103;
        float _141 = fma(_139, 0.0157396830618381500244140625, -0.052303962409496307373046875);
        float _143 = fma(_139, _141, 0.13315297663211822509765625);
        float _145 = fma(_139, _143, -0.3333276808261871337890625);
        float _147 = fma(_139, _145, 0.0);
        float _149 = fma(_103, _147, _103);
        _135 = _149;
    }
    _137 = false;
    float _151 = _135;
    int _153 = _55;
    int _155 = 1;
    int _157 = _39(_153, _155, (*spvDescriptorSet0.support_buffer));
    int _159 = _59;
    int _161 = 1;
    int _163 = _39(_159, _161, (*spvDescriptorSet0.support_buffer));
    int3 _446 = int3(_157, _163, as_type<int>(_51));
    float4 _166 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_446.xy), uint(_446.z)).xyzw);
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = _101 * 9.81000041961669921875;
    float _178 = _176 * _151;
    float _180 = sqrt(_178);
    float _182 = _180 * 10000.0;
    float _184 = floor(_182);
    float _186 = _184 * 9.9999997473787516355514526367188e-05;
    float _188 = _186 * (*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _190 = fma(_188, 6.283185482025146484375, (*spvDescriptorSet0.cp_c4)._m0[0].z);
    float _192 = _190 * 0.15915493667125701904296875;
    float _194 = _192 * 6.283185482025146484375;
    float _196 = sin(_194);
    float _198 = _192 * 6.283185482025146484375;
    float _200 = cos(_198);
    float _202 = _196 * _170;
    float _204 = -_174;
    float _206 = _196 * _204;
    float _208 = _200 * _170;
    float _210 = _200 * _174;
    float _212 = -_202;
    float _214 = fma(_200, _168, _212);
    float _216 = -_206;
    float _218 = fma(_200, _172, _216);
    float _220 = fma(_196, _168, _208);
    float _222 = -_196;
    float _224 = fma(_222, _172, _210);
    float _226 = _214 + _218;
    float _228 = _220 + _224;
    float _230 = _93 * _226;
    float _232 = -_228;
    float _234 = _93 * _232;
    float _236 = -_228;
    float _238 = _236 + (-0.0);
    float _240 = -_228;
    float _242 = -_230;
    float _244 = fma(_95, _240, _242);
    float _246 = fma(_95, _226, _234);
    int3 _566 = int3(_55, _59, as_type<int>(_51));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_244, _246, _238, _226), uint2(_566.xy), uint(_566.z));
}

