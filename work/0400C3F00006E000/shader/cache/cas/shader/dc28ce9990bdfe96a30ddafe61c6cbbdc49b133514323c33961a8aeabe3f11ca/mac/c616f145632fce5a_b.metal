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

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c5 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    constant _16* vp_c11 [[id(3)]];
};

struct main0_out
{
    float4 m_37 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(0)]];
    uint4 m_29 [[attribute(6)]];
    float4 m_34 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = as_type<float>(in.m_29.x);
    float _53 = in.m_32.x;
    float _55 = in.m_32.y;
    float _57 = in.m_32.z;
    int _60 = as_type<int>(_51) * 48;
    int _62 = _60 + 32;
    uint _65 = uint(int(uint(_62) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c5)._m0[int(_67)][_69];
    int _73 = int(_65) + 1;
    uint _75 = uint(int(uint(_73) >> uint(2)));
    int _77 = _73 & 3;
    float _79 = (*spvDescriptorSet0.vp_c5)._m0[int(_75)][_77];
    uint _81 = uint(int(uint(_60) >> uint(2)));
    uint _83 = uint(int(uint(int(_81)) >> uint(2)));
    int _85 = int(_81) & 3;
    float _87 = (*spvDescriptorSet0.vp_c5)._m0[int(_83)][_85];
    int _89 = int(_81) + 1;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    int _93 = _89 & 3;
    float _95 = (*spvDescriptorSet0.vp_c5)._m0[int(_91)][_93];
    int _97 = _60 + 40;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c5)._m0[int(_101)][_103];
    int _107 = int(_99) + 1;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    int _111 = _107 & 3;
    float _113 = (*spvDescriptorSet0.vp_c5)._m0[int(_109)][_111];
    int _115 = _60 + 8;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = int(_117) + 1;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    int _129 = _125 & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    int _133 = _60 + 16;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = int(_135) + 1;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    int _147 = _143 & 3;
    float _149 = (*spvDescriptorSet0.vp_c5)._m0[int(_145)][_147];
    int _151 = _60 + 24;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    int _161 = int(_153) + 1;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    int _165 = _161 & 3;
    float _167 = (*spvDescriptorSet0.vp_c5)._m0[int(_163)][_165];
    float _169 = _55 * _79;
    float _171 = fma(_53, _71, _169);
    float _173 = _55 * _95;
    float _175 = fma(_53, _87, _173);
    float _177 = fma(_57, _105, _171);
    float _179 = _177 + _113;
    float _181 = fma(_57, _123, _175);
    float _183 = _181 + _131;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _187 = _179 + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _191 = _183 + _189;
    float _193 = _187 * _187;
    float _195 = _55 * _149;
    float _197 = fma(_191, _191, _193);
    float _199 = fma(_53, _141, _195);
    float _201 = sqrt(_197);
    float _203 = fma(_57, _159, _199);
    float _205 = in.m_34.x;
    float _207 = in.m_34.y;
    float _209 = _203 + _167;
    float _211 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _213 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[2].x, _211);
    bool _217 = _201 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[2].z, _213);
    float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _223 = _219;
    float _225 = as_type<float>(_60);
    float _227 = _183;
    float _229 = _221;
    if (!_217)
    {
        _223 = _179;
    }
    float _231 = _223;
    float _233 = _231;
    if (!_217)
    {
        _225 = _209;
    }
    float _235 = _225;
    bool _237 = !_217;
    float _239 = _235;
    if (!_237)
    {
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _245 = _201 + _243;
        float _247 = _209 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _249 = rsqrt(_197);
        float _251 = _245 * _241;
        float _253 = _251 * 0.15915493667125701904296875;
        float _255 = _253 * 6.283185482025146484375;
        float _257 = cos(_255);
        float _259 = _253 * 6.283185482025146484375;
        float _261 = sin(_259);
        float _263 = _257 + (-1.0);
        float _265 = fma(_261, _247, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _269 = _249 * _265;
        float _271 = fma(_209, _257, _267);
        float _273 = fma(_191, _269, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _275 = _271 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _277 = fma(_187, _269, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _279 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].x, _275);
        float _281 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[2].z, _279);
        float _283 = _281 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _239 = _271;
        _227 = _273;
        _233 = _277;
        _229 = _283;
    }
    float _285 = _239;
    float _287 = _227;
    float _289 = _233;
    float _291 = _229;
    float _293 = _285 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _295 = _285 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _297 = _207 * (*spvDescriptorSet0.vp_c11)._m0[0].z;
    float _299 = _207 * (*spvDescriptorSet0.vp_c11)._m0[0].w;
    float _301 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].x, _293);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].x, _295);
    float _305 = fma(_205, (*spvDescriptorSet0.vp_c11)._m0[0].x, _297);
    float _307 = fma(_205, (*spvDescriptorSet0.vp_c11)._m0[0].y, _299);
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[1].z, _301);
    float _311 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[0].z, _303);
    float _313 = _309 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _315 = _311 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _317 = _313 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _321 = _313 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _323 = _313 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[8].x, _317);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[7].x, _319);
    float _329 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[9].x, _321);
    float _331 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[10].x, _323);
    float _333 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[8].z, _325);
    float _335 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[7].z, _327);
    float _337 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[9].z, _329);
    float _339 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[10].z, _331);
    float _341 = _305 + (*spvDescriptorSet0.vp_c11)._m0[1].x;
    float _343 = _307 + (*spvDescriptorSet0.vp_c11)._m0[1].y;
    float _345 = _335 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _347 = _333 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _349 = _337 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _351 = _339 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _341;
    out.m_37.y = _343;
    out.gl_Position.x = _345;
    out.gl_Position.y = _347;
    out.gl_Position.z = _349;
    out.gl_Position.w = _351;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = as_type<float>(in.m_29.x);
    float _53 = in.m_32.x;
    float _55 = in.m_32.y;
    float _57 = in.m_32.z;
    int _60 = as_type<int>(_51) * 48;
    int _62 = _60 + 32;
    uint _65 = uint(int(uint(_62) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c5)._m0[int(_67)][_69];
    int _73 = int(_65) + 1;
    uint _75 = uint(int(uint(_73) >> uint(2)));
    int _77 = _73 & 3;
    float _79 = (*spvDescriptorSet0.vp_c5)._m0[int(_75)][_77];
    uint _81 = uint(int(uint(_60) >> uint(2)));
    uint _83 = uint(int(uint(int(_81)) >> uint(2)));
    int _85 = int(_81) & 3;
    float _87 = (*spvDescriptorSet0.vp_c5)._m0[int(_83)][_85];
    int _89 = int(_81) + 1;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    int _93 = _89 & 3;
    float _95 = (*spvDescriptorSet0.vp_c5)._m0[int(_91)][_93];
    int _97 = _60 + 40;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c5)._m0[int(_101)][_103];
    int _107 = int(_99) + 1;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    int _111 = _107 & 3;
    float _113 = (*spvDescriptorSet0.vp_c5)._m0[int(_109)][_111];
    int _115 = _60 + 8;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = int(_117) + 1;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    int _129 = _125 & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    int _133 = _60 + 16;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = int(_135) + 1;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    int _147 = _143 & 3;
    float _149 = (*spvDescriptorSet0.vp_c5)._m0[int(_145)][_147];
    int _151 = _60 + 24;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    int _161 = int(_153) + 1;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    int _165 = _161 & 3;
    float _167 = (*spvDescriptorSet0.vp_c5)._m0[int(_163)][_165];
    float _169 = _55 * _79;
    float _171 = fma(_53, _71, _169);
    float _173 = _55 * _95;
    float _175 = fma(_53, _87, _173);
    float _177 = fma(_57, _105, _171);
    float _179 = _177 + _113;
    float _181 = fma(_57, _123, _175);
    float _183 = _181 + _131;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _187 = _179 + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _191 = _183 + _189;
    float _193 = _187 * _187;
    float _195 = _55 * _149;
    float _197 = fma(_191, _191, _193);
    float _199 = fma(_53, _141, _195);
    float _201 = sqrt(_197);
    float _203 = fma(_57, _159, _199);
    float _205 = in.m_34.x;
    float _207 = in.m_34.y;
    float _209 = _203 + _167;
    float _211 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _213 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[2].x, _211);
    bool _217 = _201 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[2].z, _213);
    float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _223 = _219;
    float _225 = as_type<float>(_60);
    float _227 = _183;
    float _229 = _221;
    if (!_217)
    {
        _223 = _179;
    }
    float _231 = _223;
    float _233 = _231;
    if (!_217)
    {
        _225 = _209;
    }
    float _235 = _225;
    bool _237 = !_217;
    float _239 = _235;
    if (!_237)
    {
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _245 = _201 + _243;
        float _247 = _209 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _249 = rsqrt(_197);
        float _251 = _245 * _241;
        float _253 = _251 * 0.15915493667125701904296875;
        float _255 = _253 * 6.283185482025146484375;
        float _257 = cos(_255);
        float _259 = _253 * 6.283185482025146484375;
        float _261 = sin(_259);
        float _263 = _257 + (-1.0);
        float _265 = fma(_261, _247, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _269 = _249 * _265;
        float _271 = fma(_209, _257, _267);
        float _273 = fma(_191, _269, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _275 = _271 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _277 = fma(_187, _269, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _279 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].x, _275);
        float _281 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[2].z, _279);
        float _283 = _281 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _239 = _271;
        _227 = _273;
        _233 = _277;
        _229 = _283;
    }
    float _285 = _239;
    float _287 = _227;
    float _289 = _233;
    float _291 = _229;
    float _293 = _285 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _295 = _285 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _297 = _207 * (*spvDescriptorSet0.vp_c11)._m0[0].z;
    float _299 = _207 * (*spvDescriptorSet0.vp_c11)._m0[0].w;
    float _301 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].x, _293);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].x, _295);
    float _305 = fma(_205, (*spvDescriptorSet0.vp_c11)._m0[0].x, _297);
    float _307 = fma(_205, (*spvDescriptorSet0.vp_c11)._m0[0].y, _299);
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[1].z, _301);
    float _311 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[0].z, _303);
    float _313 = _309 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _315 = _311 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _317 = _313 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _321 = _313 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _323 = _313 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[8].x, _317);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[7].x, _319);
    float _329 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[9].x, _321);
    float _331 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[10].x, _323);
    float _333 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[8].z, _325);
    float _335 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[7].z, _327);
    float _337 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[9].z, _329);
    float _339 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[10].z, _331);
    float _341 = _305 + (*spvDescriptorSet0.vp_c11)._m0[1].x;
    float _343 = _307 + (*spvDescriptorSet0.vp_c11)._m0[1].y;
    float _345 = _335 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _347 = _333 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _349 = _337 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _351 = _339 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _341;
    out.m_37.y = _343;
    out.gl_Position.x = _345;
    out.gl_Position.y = _347;
    out.gl_Position.z = _349;
    out.gl_Position.w = _351;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _51 = as_type<float>(in.m_29.x);
    float _53 = in.m_32.x;
    float _55 = in.m_32.y;
    float _57 = in.m_32.z;
    int _60 = as_type<int>(_51) * 48;
    int _62 = _60 + 32;
    uint _65 = uint(int(uint(_62) >> uint(2)));
    uint _67 = uint(int(uint(int(_65)) >> uint(2)));
    int _69 = int(_65) & 3;
    float _71 = (*spvDescriptorSet0.vp_c5)._m0[int(_67)][_69];
    int _73 = int(_65) + 1;
    uint _75 = uint(int(uint(_73) >> uint(2)));
    int _77 = _73 & 3;
    float _79 = (*spvDescriptorSet0.vp_c5)._m0[int(_75)][_77];
    uint _81 = uint(int(uint(_60) >> uint(2)));
    uint _83 = uint(int(uint(int(_81)) >> uint(2)));
    int _85 = int(_81) & 3;
    float _87 = (*spvDescriptorSet0.vp_c5)._m0[int(_83)][_85];
    int _89 = int(_81) + 1;
    uint _91 = uint(int(uint(_89) >> uint(2)));
    int _93 = _89 & 3;
    float _95 = (*spvDescriptorSet0.vp_c5)._m0[int(_91)][_93];
    int _97 = _60 + 40;
    uint _99 = uint(int(uint(_97) >> uint(2)));
    uint _101 = uint(int(uint(int(_99)) >> uint(2)));
    int _103 = int(_99) & 3;
    float _105 = (*spvDescriptorSet0.vp_c5)._m0[int(_101)][_103];
    int _107 = int(_99) + 1;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    int _111 = _107 & 3;
    float _113 = (*spvDescriptorSet0.vp_c5)._m0[int(_109)][_111];
    int _115 = _60 + 8;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.vp_c5)._m0[int(_119)][_121];
    int _125 = int(_117) + 1;
    uint _127 = uint(int(uint(_125) >> uint(2)));
    int _129 = _125 & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    int _133 = _60 + 16;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    uint _137 = uint(int(uint(int(_135)) >> uint(2)));
    int _139 = int(_135) & 3;
    float _141 = (*spvDescriptorSet0.vp_c5)._m0[int(_137)][_139];
    int _143 = int(_135) + 1;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    int _147 = _143 & 3;
    float _149 = (*spvDescriptorSet0.vp_c5)._m0[int(_145)][_147];
    int _151 = _60 + 24;
    uint _153 = uint(int(uint(_151) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    int _161 = int(_153) + 1;
    uint _163 = uint(int(uint(_161) >> uint(2)));
    int _165 = _161 & 3;
    float _167 = (*spvDescriptorSet0.vp_c5)._m0[int(_163)][_165];
    float _169 = _55 * _79;
    float _171 = fma(_53, _71, _169);
    float _173 = _55 * _95;
    float _175 = fma(_53, _87, _173);
    float _177 = fma(_57, _105, _171);
    float _179 = _177 + _113;
    float _181 = fma(_57, _123, _175);
    float _183 = _181 + _131;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _187 = _179 + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _191 = _183 + _189;
    float _193 = _187 * _187;
    float _195 = _55 * _149;
    float _197 = fma(_191, _191, _193);
    float _199 = fma(_53, _141, _195);
    float _201 = sqrt(_197);
    float _203 = fma(_57, _159, _199);
    float _205 = in.m_34.x;
    float _207 = in.m_34.y;
    float _209 = _203 + _167;
    float _211 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _213 = fma(_183, (*spvDescriptorSet0.vp_c4)._m0[2].x, _211);
    bool _217 = _201 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _219 = fma(_179, (*spvDescriptorSet0.vp_c4)._m0[2].z, _213);
    float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _223 = _219;
    float _225 = as_type<float>(_60);
    float _227 = _183;
    float _229 = _221;
    if (!_217)
    {
        _223 = _179;
    }
    float _231 = _223;
    float _233 = _231;
    if (!_217)
    {
        _225 = _209;
    }
    float _235 = _225;
    bool _237 = !_217;
    float _239 = _235;
    if (!_237)
    {
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _245 = _201 + _243;
        float _247 = _209 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _249 = rsqrt(_197);
        float _251 = _245 * _241;
        float _253 = _251 * 0.15915493667125701904296875;
        float _255 = _253 * 6.283185482025146484375;
        float _257 = cos(_255);
        float _259 = _253 * 6.283185482025146484375;
        float _261 = sin(_259);
        float _263 = _257 + (-1.0);
        float _265 = fma(_261, _247, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _269 = _249 * _265;
        float _271 = fma(_209, _257, _267);
        float _273 = fma(_191, _269, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _275 = _271 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _277 = fma(_187, _269, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _279 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[2].x, _275);
        float _281 = fma(_277, (*spvDescriptorSet0.vp_c4)._m0[2].z, _279);
        float _283 = _281 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _239 = _271;
        _227 = _273;
        _233 = _277;
        _229 = _283;
    }
    float _285 = _239;
    float _287 = _227;
    float _289 = _233;
    float _291 = _229;
    float _293 = _285 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _295 = _285 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _297 = _207 * (*spvDescriptorSet0.vp_c11)._m0[0].z;
    float _299 = _207 * (*spvDescriptorSet0.vp_c11)._m0[0].w;
    float _301 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[1].x, _293);
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c4)._m0[0].x, _295);
    float _305 = fma(_205, (*spvDescriptorSet0.vp_c11)._m0[0].x, _297);
    float _307 = fma(_205, (*spvDescriptorSet0.vp_c11)._m0[0].y, _299);
    float _309 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[1].z, _301);
    float _311 = fma(_289, (*spvDescriptorSet0.vp_c4)._m0[0].z, _303);
    float _313 = _309 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _315 = _311 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _317 = _313 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _319 = _313 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _321 = _313 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _323 = _313 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _325 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[8].x, _317);
    float _327 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[7].x, _319);
    float _329 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[9].x, _321);
    float _331 = fma(_315, (*spvDescriptorSet0.vp_c4)._m0[10].x, _323);
    float _333 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[8].z, _325);
    float _335 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[7].z, _327);
    float _337 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[9].z, _329);
    float _339 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[10].z, _331);
    float _341 = _305 + (*spvDescriptorSet0.vp_c11)._m0[1].x;
    float _343 = _307 + (*spvDescriptorSet0.vp_c11)._m0[1].y;
    float _345 = _335 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _347 = _333 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _349 = _337 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _351 = _339 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _341;
    out.m_37.y = _343;
    out.gl_Position.x = _345;
    out.gl_Position.y = _347;
    out.gl_Position.z = _349;
    out.gl_Position.w = _351;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

