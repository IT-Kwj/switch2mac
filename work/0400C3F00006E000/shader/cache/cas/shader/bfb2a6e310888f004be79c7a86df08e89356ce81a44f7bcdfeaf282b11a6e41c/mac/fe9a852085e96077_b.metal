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
    device _23* cp_s2 [[id(3)]];
    device _23* cp_s3 [[id(4)]];
    device _23* cp_s4 [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _47 = as_type<float>(gl_WorkGroupID.x);
    float _49 = as_type<float>(gl_LocalInvocationID.x);
    int _52 = as_type<int>(_47) * 64;
    int _54 = _52 + as_type<int>(_49);
    bool _58 = uint(_54) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    bool _60 = false;
    if (_58)
    {
        _60 = true;
    }
    bool _62 = _60;
    bool _64 = _62;
    if (!_58)
    {
        float _66 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
        bool _68 = uint(_54) >= as_type<uint>(_66);
        _64 = _68;
    }
    bool _70 = _64;
    if (_70)
    {
        return;
    }
    int _72 = _54 * 48;
    int _74 = _72 + 32;
    uint _77 = uint(int(uint(_74) >> uint(2)));
    float _79 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_77)]);
    int _81 = _74 + 4;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    float _85 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_83)]);
    int _87 = as_type<int>(_79) * 20;
    int _89 = _87 + 16;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    float _93 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_91)]);
    int _95 = as_type<int>(_85) + as_type<int>(_93);
    bool _97 = uint(_95) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (_97)
    {
        return;
    }
    uint _99 = uint(int(uint(_72) >> uint(2)));
    float _101 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_99)]);
    int _103 = _72 + 4;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    float _107 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_105)]);
    int _109 = _72 + 8;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    float _113 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_111)]);
    int _115 = _72 + 12;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    float _119 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_117)]);
    int _121 = as_type<int>(_79) * 48;
    int _123 = _121 + 16;
    int _125 = _72 + 16;
    uint _127 = uint(int(uint(_123) >> uint(2)));
    float _129 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_127)]);
    int _131 = _123 + 4;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    float _135 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_133)]);
    int _137 = _123 + 8;
    uint _139 = uint(int(uint(_137) >> uint(2)));
    float _141 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_139)]);
    int _143 = _123 + 12;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    float _147 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_145)]);
    int _149 = _121 + 32;
    uint _151 = uint(int(uint(_125) >> uint(2)));
    float _153 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_151)]);
    int _155 = _125 + 4;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_157)]);
    int _161 = _125 + 8;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    float _165 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_163)]);
    int _167 = _125 + 12;
    uint _169 = uint(int(uint(_167) >> uint(2)));
    float _171 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_169)]);
    uint _173 = uint(int(uint(_149) >> uint(2)));
    float _175 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_173)]);
    int _177 = _95 << 6;
    int _179 = as_type<int>(_107) * 1664525;
    int _181 = _179 + 1013904223;
    int _183 = as_type<int>(_113) * 1664525;
    int _185 = _183 + 1013904223;
    int _187 = as_type<int>(_101) * 1664525;
    int _189 = _187 + 1013904223;
    int _191 = _181 * _185;
    int _193 = _191 + _189;
    int _195 = _185 * _193;
    int _197 = _195 + _181;
    uint _199 = uint(int(uint(_193) >> uint(16)));
    int _201 = _193 * _197;
    int _203 = _201 + _185;
    uint _205 = uint(int(uint(_197) >> uint(16)));
    int _207 = _193 ^ int(_199);
    uint _209 = uint(int(uint(_203) >> uint(16)));
    int _211 = _197 ^ int(_205);
    int _213 = _203 ^ int(_209);
    int _215 = _177 + 40;
    int _217 = _213 * _211;
    int _219 = _217 + _207;
    float _221 = -_135;
    float _223 = _221 + _147;
    float _225 = _129 + _141;
    float _227 = _135 + _147;
    int _229 = _177 + 32;
    uint _231 = uint(int(uint(_219) >> uint(9)));
    int _233 = int(_231) + 1065353216;
    float _235 = _227 * 0.5;
    int _237 = _177 + 48;
    int _239 = _177 + 52;
    float _241 = as_type<float>(_233) + (-1.0);
    float _243 = -_129;
    float _245 = _243 + _141;
    int _247 = _177 + 16;
    float _249 = _225 * 0.5;
    uint _251 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_251)] = as_type<uint>(_101);
    int _253 = _177 + 4;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_255)] = as_type<uint>(_107);
    int _257 = _177 + 8;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_259)] = as_type<uint>(_113);
    int _261 = _177 + 12;
    uint _263 = uint(int(uint(_261) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_263)] = as_type<uint>(_241);
    uint _265 = uint(int(uint(_247) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_265)] = as_type<uint>(_153);
    int _267 = _247 + 4;
    uint _269 = uint(int(uint(_267) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_269)] = as_type<uint>(_159);
    int _271 = _247 + 8;
    uint _273 = uint(int(uint(_271) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_273)] = as_type<uint>(_165);
    int _275 = _247 + 12;
    uint _277 = uint(int(uint(_275) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_277)] = as_type<uint>(_119);
    uint _279 = uint(int(uint(_229) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_279)] = as_type<uint>(_249);
    int _281 = _229 + 4;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_283)] = as_type<uint>(_235);
    uint _285 = uint(int(uint(_215) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_285)] = as_type<uint>(_245);
    int _287 = _215 + 4;
    uint _289 = uint(int(uint(_287) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_289)] = as_type<uint>(_223);
    uint _291 = uint(int(uint(_237) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_291)] = as_type<uint>(_175);
    uint _293 = uint(int(uint(_239) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_293)] = as_type<uint>(_171);
}

