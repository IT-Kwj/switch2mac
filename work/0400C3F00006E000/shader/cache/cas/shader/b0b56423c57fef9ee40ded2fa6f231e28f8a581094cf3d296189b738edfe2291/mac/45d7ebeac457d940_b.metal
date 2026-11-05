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
    texture2d<float, access::write> cp_i_tcb_4C_ [[id(2)]];
    texture2d<float> cp_i_tcb_4A_ [[id(3)]];
    texture2d<float> cp_i_tcb_48_ [[id(4)]];
};

static inline __attribute__((always_inline))
int _39(thread const int& _684, thread const int& _685, constant _10& support_buffer)
{
    int _688 = 1 + _685;
    float _690 = support_buffer._m5[_688].x;
    bool _692 = _690 == 1.0;
    if (_692)
    {
        return _684;
    }
    float _694 = float(_684);
    float _696 = _694 * _690;
    int _698 = int(_696);
    return _698;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    int _51 = as_type<int>(_43) << 3;
    int _53 = -as_type<int>(_45);
    bool _57 = _53 != _51;
    int _59 = _53;
    if (_57)
    {
        int _61 = as_type<int>(_47) * 8;
        _59 = _61;
    }
    int _63 = _59;
    int _65 = 0;
    int _67 = _63;
    if (_57)
    {
        int _69 = ~as_type<int>(_49);
        int _71 = _69 + 1;
        _65 = _71;
    }
    int _73 = _65;
    bool _75 = _63 == _73;
    bool _77 = !_57;
    bool _79 = _75 || _77;
    if (!_79)
    {
        int _81 = as_type<int>(_45) + _51;
        _67 = _81;
    }
    int _83 = _67;
    bool _85 = _83 == 255;
    bool _87 = _85 || _79;
    int _89 = _83;
    if (!_87)
    {
        int _91 = as_type<int>(_47) * 8;
        int _93 = _91 + as_type<int>(_49);
        _89 = _93;
    }
    int _95 = _89;
    bool _97 = _95 == 255;
    bool _99 = _97 || _87;
    float _101 = 0.0;
    if (_99)
    {
        int _103 = as_type<int>(_45) + _51;
        _101 = as_type<float>(_103);
    }
    float _105 = _101;
    float _107 = 0.0;
    if (_99)
    {
        int _109 = as_type<int>(_47) << 3;
        int _111 = _109 + as_type<int>(_49);
        _107 = as_type<float>(_111);
    }
    float _113 = _107;
    if (_99)
    {
        spvDescriptorSet0.cp_i_tcb_4C_.write(float4(0.0), uint2(int2(as_type<int>(_105), as_type<int>(_113))));
    }
    if (_99)
    {
        return;
    }
    int _115 = as_type<int>(_47) * 8;
    int _117 = _115 + as_type<int>(_49);
    int _119 = as_type<int>(_45) + _51;
    int _121 = max(0, _117);
    int _123 = _119 + 1;
    int _125 = _119 + (-1);
    int _127 = max(0, _119);
    int _129 = max(0, _123);
    int _131 = min(_121, 255);
    int _133 = _117 + 1;
    int _135 = max(0, _125);
    int _137 = _117 + (-1);
    int _139 = min(_127, 255);
    int _141 = min(_129, 255);
    int _143 = max(0, _133);
    int _145 = min(_135, 255);
    int _147 = _139;
    int _149 = 1;
    int _151 = _39(_147, _149, (*spvDescriptorSet0.support_buffer));
    int _153 = _131;
    int _155 = 1;
    int _157 = _39(_153, _155, (*spvDescriptorSet0.support_buffer));
    float2 _161 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_151, _157))).xy);
    float _163 = _161.x;
    float _165 = _161.y;
    int _167 = _141;
    int _169 = 1;
    int _171 = _39(_167, _169, (*spvDescriptorSet0.support_buffer));
    int _173 = _131;
    int _175 = 1;
    int _177 = _39(_173, _175, (*spvDescriptorSet0.support_buffer));
    float2 _179 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_171, _177))).xy);
    float _181 = _179.x;
    float _183 = _179.y;
    int _185 = max(0, _137);
    int _187 = min(_143, 255);
    int _189 = min(_185, 255);
    int _191 = _145;
    int _193 = 1;
    int _195 = _39(_191, _193, (*spvDescriptorSet0.support_buffer));
    int _197 = _131;
    int _199 = 1;
    int _201 = _39(_197, _199, (*spvDescriptorSet0.support_buffer));
    float2 _203 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_195, _201))).xy);
    float _205 = _203.x;
    float _207 = _203.y;
    int _209 = _139;
    int _211 = 2;
    int _213 = _39(_209, _211, (*spvDescriptorSet0.support_buffer));
    int _215 = _131;
    int _217 = 2;
    int _219 = _39(_215, _217, (*spvDescriptorSet0.support_buffer));
    float2 _221 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(int2(_213, _219))).xy);
    float _223 = _221.x;
    float _225 = _221.y;
    int _227 = _139;
    int _229 = 1;
    int _231 = _39(_227, _229, (*spvDescriptorSet0.support_buffer));
    int _233 = _187;
    int _235 = 1;
    int _237 = _39(_233, _235, (*spvDescriptorSet0.support_buffer));
    float2 _239 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_231, _237))).xy);
    float _241 = _239.x;
    float _243 = _239.y;
    int _245 = _139;
    int _247 = 1;
    int _249 = _39(_245, _247, (*spvDescriptorSet0.support_buffer));
    int _251 = _189;
    int _253 = 1;
    int _255 = _39(_251, _253, (*spvDescriptorSet0.support_buffer));
    float2 _257 = (spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_249, _255))).xy);
    float _259 = _257.x;
    float _261 = _257.y;
    float _263 = -_183;
    float _265 = _207 + _263;
    float _267 = _265 * _265;
    float _269 = -_261;
    float _271 = _269 + _243;
    float _273 = fma(_271, _271, _267);
    float _275 = _225 * _225;
    float _277 = sqrt(_273);
    float _279 = fma(_223, _223, _275);
    float _281 = sqrt(_279);
    float _283 = _277 + 9.9999997473787516355514526367188e-06;
    float _285 = _165 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _287 = 1.0 / _283;
    float _289 = _285 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _291 = -_281;
    float _293 = fma(_291, (*spvDescriptorSet0.cp_c3)._m0[1].z, 1.0);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = -_181;
    float _299 = _205 + _297;
    float _301 = -_241;
    float _303 = _259 + _301;
    float _305 = _289 * _295;
    float _307 = _299 * (*spvDescriptorSet0.cp_c3)._m0[4].w;
    float _309 = _303 * (*spvDescriptorSet0.cp_c3)._m0[4].w;
    float _311 = _305 * _287;
    float _313 = fma(_271, _311, _307);
    float _315 = fma(_265, _311, _309);
    float _317 = fma(_313, (*spvDescriptorSet0.cp_c3)._m0[0].w, _223);
    float _319 = fma(_315, (*spvDescriptorSet0.cp_c3)._m0[0].w, _225);
    spvDescriptorSet0.cp_i_tcb_4C_.write(float4(_317, _319, 0.0, 0.0), uint2(int2(_119, _117)));
}

