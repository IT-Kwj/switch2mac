#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _41 = as_type<float>(gl_WorkGroupID.x);
    float _43 = float(as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x));
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    int _48 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x) + 1;
    float _50 = 1.0 / _43;
    int _52 = as_type<int>(_41) * 32;
    int _54 = _52 + as_type<int>(_45);
    int _56 = as_type<int>(_50) + (-2);
    float _58 = float(uint(_54));
    float _60 = as_type<float>(_56) * _58;
    float _62 = trunc(_60);
    float _64 = precise::max(_62, 0.0);
    uint _67 = uint(_64);
    int _69 = -int(_67);
    int _71 = _69 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _73 = _71 + _54;
    float _75 = float(uint(_73));
    float _77 = as_type<float>(_56) * _75;
    float _79 = trunc(_77);
    float _81 = precise::max(_79, 0.0);
    uint _83 = uint(_81);
    int _85 = int(_67) + int(_83);
    int _87 = -_85;
    int _89 = _87 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _91 = _89 + _54;
    bool _95 = uint(_91) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    bool _97 = !_95;
    int _99 = _97 ? 0 : (-1);
    bool _101 = 0 == as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _103 = -_99;
    int _105 = _85 + _103;
    bool _107 = !_101;
    int _109 = _107 ? _105 : (-1);
    int _111 = -_109;
    int _113 = _111 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x);
    int _115 = _113 + _54;
    int _117 = _109 * _48;
    int _119 = _117 + _115;
    int _121 = _119 * 4;
    int _123 = _119 + _48;
    int _125 = _121 + 19456;
    int _127 = _123 * 4;
    int _129 = _121 + 19460;
    uint _131 = uint(int(uint(_125) >> uint(2)));
    float _133 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_131)]);
    int _135 = _127 + 19456;
    uint _137 = uint(int(uint(_129) >> uint(2)));
    float _139 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_137)]);
    int _141 = _127 + 19460;
    uint _143 = uint(int(uint(_135) >> uint(2)));
    float _145 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_143)]);
    uint _147 = uint(int(uint(_141) >> uint(2)));
    float _149 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_147)]);
    int _151 = _54 * 16;
    int _153 = _151 + 8;
    uint _155 = uint(int(uint(_151) >> uint(2)));
    float _157 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_155)]);
    int _159 = _151 + 12;
    int _161 = _151 + 9728;
    int _163 = _151 + 9732;
    uint _165 = uint(int(uint(_153) >> uint(2)));
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_165)]);
    int _169 = _151 + 9736;
    int _171 = _151 + 9740;
    uint _173 = uint(int(uint(_159) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_173)]);
    int _177 = _151 + 4;
    uint _179 = uint(int(uint(_161) >> uint(2)));
    float _181 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_179)]);
    uint _183 = uint(int(uint(_177) >> uint(2)));
    float _185 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_183)]);
    uint _187 = uint(int(uint(_163) >> uint(2)));
    float _189 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_187)]);
    uint _191 = uint(int(uint(_169) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_191)]);
    uint _195 = uint(int(uint(_171) >> uint(2)));
    float _197 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_195)]);
    int _199 = _54 << 3;
    int _201 = _199 + 448;
    bool _203 = _133 >= 0.0;
    bool _205 = isnan(_133);
    bool _207 = _203 || _205;
    bool _209 = isnan(0.0);
    bool _211 = _207 || _209;
    bool _213 = _139 < 0.0;
    bool _215 = !_211;
    bool _217 = _213 && _215;
    bool _219 = _145 < 0.0;
    bool _221 = _219 && _217;
    bool _223 = _149 < 0.0;
    bool _225 = _223 && _221;
    int _227 = 0;
    bool _229 = false;
    int _231 = _151;
    if (_225)
    {
        bool _233 = _133 != (-1.0);
        bool _235 = isnan(_133);
        bool _237 = _233 || _235;
        bool _239 = isnan(-1.0);
        bool _241 = _237 || _239;
        _227 = _241 ? (-1) : 0;
    }
    int _243 = _227;
    int _245 = _243;
    if (_225)
    {
        bool _247 = _139 == (-1.0);
        int _249 = ~_243;
        int _251 = (_247 ? (-1) : 0) | _249;
        _245 = _251;
    }
    int _253 = _245;
    int _255 = _253;
    if (_225)
    {
        bool _257 = _145 == (-1.0);
        int _259 = (_257 ? (-1) : 0) | _253;
        _255 = _259;
    }
    int _261 = _255;
    uint _263 = min(as_type<uint>(_167), as_type<uint>(_175));
    uint _265 = min(as_type<uint>(_157), as_type<uint>(_185));
    bool _267 = _261 != 0;
    if (_225)
    {
        bool _269 = _149 == (-1.0);
        int _271 = (_269 ? (-1) : 0) | _261;
        _267 = _271 != 0;
    }
    bool _273 = _267;
    uint _275 = max(as_type<uint>(_181), as_type<uint>(_189));
    uint _277 = min(_265, _263);
    uint _279 = max(as_type<uint>(_193), as_type<uint>(_197));
    int _281 = int(_277);
    if (_225)
    {
        _229 = _273;
    }
    bool _283 = _229;
    uint _285 = max(_275, _279);
    float _287 = float(_277);
    float _289 = float(_285);
    float _291 = _287 * 5.9604651880817982601001858711243e-08;
    float _293 = _289 * 5.9604651880817982601001858711243e-08;
    int _295 = as_type<int>(_291);
    int _297 = as_type<int>(_293);
    if (!_225)
    {
        _231 = as_type<int>(_291);
    }
    int _299 = _231;
    int _301 = _299;
    if (_283)
    {
        float _303 = _287 * (-5.9604651880817982601001858711243e-08);
        _295 = as_type<int>(_303);
    }
    int _305 = _295;
    if (!_225)
    {
        _281 = as_type<int>(_293);
    }
    int _307 = _281;
    int _309 = _307;
    if (_283)
    {
        float _311 = _289 * (-5.9604651880817982601001858711243e-08);
        _297 = as_type<int>(_311);
    }
    int _313 = _297;
    if (_225)
    {
        _301 = _305;
    }
    int _315 = _301;
    if (_225)
    {
        _309 = _313;
    }
    int _317 = _309;
    uint _319 = uint(int(uint(_201) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_319)] = uint(_315);
    int _321 = _201 + 4;
    uint _323 = uint(int(uint(_321) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_323)] = uint(_317);
}

