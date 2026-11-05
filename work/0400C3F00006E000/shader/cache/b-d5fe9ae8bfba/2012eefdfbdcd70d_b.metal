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
    int _153 = _151 + 9728;
    int _155 = _151 + 9732;
    int _157 = _151 + 9736;
    int _159 = _151 + 9740;
    uint _161 = uint(int(uint(_153) >> uint(2)));
    float _163 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_161)]);
    uint _165 = uint(int(uint(_155) >> uint(2)));
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_165)]);
    uint _169 = uint(int(uint(_157) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_169)]);
    uint _173 = uint(int(uint(_159) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_173)]);
    int _177 = _54 << 3;
    int _179 = _177 + 448;
    bool _181 = _133 >= 0.0;
    bool _183 = isnan(_133);
    bool _185 = _181 || _183;
    bool _187 = isnan(0.0);
    bool _189 = _185 || _187;
    bool _191 = _139 < 0.0;
    bool _193 = !_189;
    bool _195 = _191 && _193;
    bool _197 = _145 < 0.0;
    bool _199 = _197 && _195;
    bool _201 = _149 < 0.0;
    bool _203 = _201 && _199;
    int _205 = 0;
    bool _207 = false;
    if (_203)
    {
        bool _209 = _133 != (-1.0);
        bool _211 = isnan(_133);
        bool _213 = _209 || _211;
        bool _215 = isnan(-1.0);
        bool _217 = _213 || _215;
        _205 = _217 ? (-1) : 0;
    }
    int _219 = _205;
    int _221 = _219;
    if (_203)
    {
        bool _223 = _139 == (-1.0);
        int _225 = ~_219;
        int _227 = (_223 ? (-1) : 0) | _225;
        _221 = _227;
    }
    int _229 = _221;
    uint _231 = max(as_type<uint>(_163), as_type<uint>(_167));
    int _233 = _229;
    if (_203)
    {
        bool _235 = _145 == (-1.0);
        int _237 = (_235 ? (-1) : 0) | _229;
        _233 = _237;
    }
    int _239 = _233;
    uint _241 = max(as_type<uint>(_171), as_type<uint>(_175));
    bool _243 = _239 != 0;
    int _245 = int(_241);
    if (_203)
    {
        bool _247 = _149 == (-1.0);
        int _249 = (_247 ? (-1) : 0) | _239;
        _243 = _249 != 0;
    }
    bool _251 = _243;
    uint _253 = max(_231, _241);
    if (_203)
    {
        _207 = _251;
    }
    bool _255 = _207;
    float _257 = float(_253);
    float _259 = _257 * 5.9604651880817982601001858711243e-08;
    int _261 = as_type<int>(_259);
    if (!_203)
    {
        _245 = as_type<int>(_259);
    }
    int _263 = _245;
    int _265 = _263;
    if (_255)
    {
        float _267 = _257 * (-5.9604651880817982601001858711243e-08);
        _261 = as_type<int>(_267);
    }
    int _269 = _261;
    if (_203)
    {
        _265 = _269;
    }
    int _271 = _265;
    uint _273 = uint(int(uint(_179) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_273)] = 0u;
    int _275 = _179 + 4;
    uint _277 = uint(int(uint(_275) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_277)] = uint(_271);
}

