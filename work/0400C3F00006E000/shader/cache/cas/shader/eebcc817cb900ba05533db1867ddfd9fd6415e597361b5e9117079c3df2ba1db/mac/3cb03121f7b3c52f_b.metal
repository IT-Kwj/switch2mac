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
};

struct main0_out
{
    float4 m_35 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(0)]];
    uint4 m_27 [[attribute(6)]];
    float4 m_32 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_27.x);
    float _51 = in.m_30.x;
    float _53 = in.m_30.y;
    float _55 = in.m_30.z;
    int _58 = as_type<int>(_49) * 48;
    int _60 = _58 + 32;
    uint _63 = uint(int(uint(_60) >> uint(2)));
    uint _65 = uint(int(uint(int(_63)) >> uint(2)));
    int _67 = int(_63) & 3;
    float _69 = (*spvDescriptorSet0.vp_c5)._m0[int(_65)][_67];
    int _71 = int(_63) + 1;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    int _75 = _71 & 3;
    float _77 = (*spvDescriptorSet0.vp_c5)._m0[int(_73)][_75];
    uint _79 = uint(int(uint(_58) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.vp_c5)._m0[int(_89)][_91];
    int _95 = _58 + 40;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    uint _99 = uint(int(uint(int(_97)) >> uint(2)));
    int _101 = int(_97) & 3;
    float _103 = (*spvDescriptorSet0.vp_c5)._m0[int(_99)][_101];
    int _105 = int(_97) + 1;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    int _109 = _105 & 3;
    float _111 = (*spvDescriptorSet0.vp_c5)._m0[int(_107)][_109];
    int _113 = _58 + 8;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.vp_c5)._m0[int(_117)][_119];
    int _123 = int(_115) + 1;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    int _127 = _123 & 3;
    float _129 = (*spvDescriptorSet0.vp_c5)._m0[int(_125)][_127];
    int _131 = _58 + 16;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    uint _135 = uint(int(uint(int(_133)) >> uint(2)));
    int _137 = int(_133) & 3;
    float _139 = (*spvDescriptorSet0.vp_c5)._m0[int(_135)][_137];
    int _141 = int(_133) + 1;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    int _145 = _141 & 3;
    float _147 = (*spvDescriptorSet0.vp_c5)._m0[int(_143)][_145];
    int _149 = _58 + 24;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    uint _153 = uint(int(uint(int(_151)) >> uint(2)));
    int _155 = int(_151) & 3;
    float _157 = (*spvDescriptorSet0.vp_c5)._m0[int(_153)][_155];
    int _159 = int(_151) + 1;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    int _163 = _159 & 3;
    float _165 = (*spvDescriptorSet0.vp_c5)._m0[int(_161)][_163];
    float _167 = _53 * _77;
    float _169 = fma(_51, _69, _167);
    float _171 = _53 * _93;
    float _173 = fma(_51, _85, _171);
    float _175 = fma(_55, _103, _169);
    float _177 = _175 + _111;
    float _179 = fma(_55, _121, _173);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _183 = _177 + _181;
    float _185 = _179 + _129;
    float _187 = _183 * _183;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _191 = _185 + _189;
    float _193 = _53 * _147;
    float _195 = fma(_191, _191, _187);
    float _197 = fma(_51, _139, _193);
    float _199 = sqrt(_195);
    float _201 = fma(_55, _157, _197);
    float _203 = _201 + _165;
    float _205 = _203 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c4)._m0[2].x, _205);
    bool _211 = _199 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _215 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _217 = _201;
    float _219 = _51;
    float _221 = _203;
    float _223 = _215;
    if (!_211)
    {
        _217 = _185;
    }
    float _225 = _217;
    float _227 = _225;
    if (!_211)
    {
        _219 = _177;
    }
    float _229 = _219;
    bool _231 = !_211;
    float _233 = _229;
    if (!_231)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _239 = _199 + _237;
        float _241 = _203 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _243 = rsqrt(_195);
        float _245 = _239 * _235;
        float _247 = _245 * 0.15915493667125701904296875;
        float _249 = _247 * 6.283185482025146484375;
        float _251 = cos(_249);
        float _253 = _247 * 6.283185482025146484375;
        float _255 = sin(_253);
        float _257 = _251 + (-1.0);
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _261 = fma(_255, _241, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _263 = fma(_203, _251, _259);
        float _265 = _243 * _261;
        float _267 = _263 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _269 = fma(_191, _265, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _271 = fma(_183, _265, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _273 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[2].x, _267);
        float _275 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].z, _273);
        float _277 = _275 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _221 = _263;
        _227 = _269;
        _233 = _271;
        _223 = _277;
    }
    float _279 = _221;
    float _281 = _227;
    float _283 = _233;
    float _285 = _223;
    float _287 = _279 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _289 = _279 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _291 = in.m_32.x;
    float _293 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[1].x, _287);
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[0].x, _289);
    float _297 = in.m_32.y;
    float _299 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[1].z, _293);
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[0].z, _295);
    float _303 = _299 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _305 = _301 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _307 = _303 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _309 = _303 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _311 = _303 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _313 = _303 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _315 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[8].x, _307);
    float _317 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[7].x, _309);
    float _319 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[9].x, _311);
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[10].x, _313);
    float _323 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[8].z, _315);
    float _325 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[7].z, _317);
    float _327 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[9].z, _319);
    float _329 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[10].z, _321);
    float _331 = _325 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _333 = _323 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _335 = _327 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_35.x = _291;
    out.m_35.y = _297;
    out.gl_Position.x = _331;
    out.gl_Position.y = _333;
    out.gl_Position.z = _335;
    out.gl_Position.w = _337;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_27.x);
    float _51 = in.m_30.x;
    float _53 = in.m_30.y;
    float _55 = in.m_30.z;
    int _58 = as_type<int>(_49) * 48;
    int _60 = _58 + 32;
    uint _63 = uint(int(uint(_60) >> uint(2)));
    uint _65 = uint(int(uint(int(_63)) >> uint(2)));
    int _67 = int(_63) & 3;
    float _69 = (*spvDescriptorSet0.vp_c5)._m0[int(_65)][_67];
    int _71 = int(_63) + 1;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    int _75 = _71 & 3;
    float _77 = (*spvDescriptorSet0.vp_c5)._m0[int(_73)][_75];
    uint _79 = uint(int(uint(_58) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.vp_c5)._m0[int(_89)][_91];
    int _95 = _58 + 40;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    uint _99 = uint(int(uint(int(_97)) >> uint(2)));
    int _101 = int(_97) & 3;
    float _103 = (*spvDescriptorSet0.vp_c5)._m0[int(_99)][_101];
    int _105 = int(_97) + 1;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    int _109 = _105 & 3;
    float _111 = (*spvDescriptorSet0.vp_c5)._m0[int(_107)][_109];
    int _113 = _58 + 8;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.vp_c5)._m0[int(_117)][_119];
    int _123 = int(_115) + 1;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    int _127 = _123 & 3;
    float _129 = (*spvDescriptorSet0.vp_c5)._m0[int(_125)][_127];
    int _131 = _58 + 16;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    uint _135 = uint(int(uint(int(_133)) >> uint(2)));
    int _137 = int(_133) & 3;
    float _139 = (*spvDescriptorSet0.vp_c5)._m0[int(_135)][_137];
    int _141 = int(_133) + 1;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    int _145 = _141 & 3;
    float _147 = (*spvDescriptorSet0.vp_c5)._m0[int(_143)][_145];
    int _149 = _58 + 24;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    uint _153 = uint(int(uint(int(_151)) >> uint(2)));
    int _155 = int(_151) & 3;
    float _157 = (*spvDescriptorSet0.vp_c5)._m0[int(_153)][_155];
    int _159 = int(_151) + 1;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    int _163 = _159 & 3;
    float _165 = (*spvDescriptorSet0.vp_c5)._m0[int(_161)][_163];
    float _167 = _53 * _77;
    float _169 = fma(_51, _69, _167);
    float _171 = _53 * _93;
    float _173 = fma(_51, _85, _171);
    float _175 = fma(_55, _103, _169);
    float _177 = _175 + _111;
    float _179 = fma(_55, _121, _173);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _183 = _177 + _181;
    float _185 = _179 + _129;
    float _187 = _183 * _183;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _191 = _185 + _189;
    float _193 = _53 * _147;
    float _195 = fma(_191, _191, _187);
    float _197 = fma(_51, _139, _193);
    float _199 = sqrt(_195);
    float _201 = fma(_55, _157, _197);
    float _203 = _201 + _165;
    float _205 = _203 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c4)._m0[2].x, _205);
    bool _211 = _199 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _215 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _217 = _201;
    float _219 = _51;
    float _221 = _203;
    float _223 = _215;
    if (!_211)
    {
        _217 = _185;
    }
    float _225 = _217;
    float _227 = _225;
    if (!_211)
    {
        _219 = _177;
    }
    float _229 = _219;
    bool _231 = !_211;
    float _233 = _229;
    if (!_231)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _239 = _199 + _237;
        float _241 = _203 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _243 = rsqrt(_195);
        float _245 = _239 * _235;
        float _247 = _245 * 0.15915493667125701904296875;
        float _249 = _247 * 6.283185482025146484375;
        float _251 = cos(_249);
        float _253 = _247 * 6.283185482025146484375;
        float _255 = sin(_253);
        float _257 = _251 + (-1.0);
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _261 = fma(_255, _241, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _263 = fma(_203, _251, _259);
        float _265 = _243 * _261;
        float _267 = _263 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _269 = fma(_191, _265, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _271 = fma(_183, _265, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _273 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[2].x, _267);
        float _275 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].z, _273);
        float _277 = _275 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _221 = _263;
        _227 = _269;
        _233 = _271;
        _223 = _277;
    }
    float _279 = _221;
    float _281 = _227;
    float _283 = _233;
    float _285 = _223;
    float _287 = _279 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _289 = _279 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _291 = in.m_32.x;
    float _293 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[1].x, _287);
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[0].x, _289);
    float _297 = in.m_32.y;
    float _299 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[1].z, _293);
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[0].z, _295);
    float _303 = _299 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _305 = _301 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _307 = _303 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _309 = _303 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _311 = _303 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _313 = _303 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _315 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[8].x, _307);
    float _317 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[7].x, _309);
    float _319 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[9].x, _311);
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[10].x, _313);
    float _323 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[8].z, _315);
    float _325 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[7].z, _317);
    float _327 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[9].z, _319);
    float _329 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[10].z, _321);
    float _331 = _325 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _333 = _323 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _335 = _327 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_35.x = _291;
    out.m_35.y = _297;
    out.gl_Position.x = _331;
    out.gl_Position.y = _333;
    out.gl_Position.z = _335;
    out.gl_Position.w = _337;
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
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _49 = as_type<float>(in.m_27.x);
    float _51 = in.m_30.x;
    float _53 = in.m_30.y;
    float _55 = in.m_30.z;
    int _58 = as_type<int>(_49) * 48;
    int _60 = _58 + 32;
    uint _63 = uint(int(uint(_60) >> uint(2)));
    uint _65 = uint(int(uint(int(_63)) >> uint(2)));
    int _67 = int(_63) & 3;
    float _69 = (*spvDescriptorSet0.vp_c5)._m0[int(_65)][_67];
    int _71 = int(_63) + 1;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    int _75 = _71 & 3;
    float _77 = (*spvDescriptorSet0.vp_c5)._m0[int(_73)][_75];
    uint _79 = uint(int(uint(_58) >> uint(2)));
    uint _81 = uint(int(uint(int(_79)) >> uint(2)));
    int _83 = int(_79) & 3;
    float _85 = (*spvDescriptorSet0.vp_c5)._m0[int(_81)][_83];
    int _87 = int(_79) + 1;
    uint _89 = uint(int(uint(_87) >> uint(2)));
    int _91 = _87 & 3;
    float _93 = (*spvDescriptorSet0.vp_c5)._m0[int(_89)][_91];
    int _95 = _58 + 40;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    uint _99 = uint(int(uint(int(_97)) >> uint(2)));
    int _101 = int(_97) & 3;
    float _103 = (*spvDescriptorSet0.vp_c5)._m0[int(_99)][_101];
    int _105 = int(_97) + 1;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    int _109 = _105 & 3;
    float _111 = (*spvDescriptorSet0.vp_c5)._m0[int(_107)][_109];
    int _113 = _58 + 8;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.vp_c5)._m0[int(_117)][_119];
    int _123 = int(_115) + 1;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    int _127 = _123 & 3;
    float _129 = (*spvDescriptorSet0.vp_c5)._m0[int(_125)][_127];
    int _131 = _58 + 16;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    uint _135 = uint(int(uint(int(_133)) >> uint(2)));
    int _137 = int(_133) & 3;
    float _139 = (*spvDescriptorSet0.vp_c5)._m0[int(_135)][_137];
    int _141 = int(_133) + 1;
    uint _143 = uint(int(uint(_141) >> uint(2)));
    int _145 = _141 & 3;
    float _147 = (*spvDescriptorSet0.vp_c5)._m0[int(_143)][_145];
    int _149 = _58 + 24;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    uint _153 = uint(int(uint(int(_151)) >> uint(2)));
    int _155 = int(_151) & 3;
    float _157 = (*spvDescriptorSet0.vp_c5)._m0[int(_153)][_155];
    int _159 = int(_151) + 1;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    int _163 = _159 & 3;
    float _165 = (*spvDescriptorSet0.vp_c5)._m0[int(_161)][_163];
    float _167 = _53 * _77;
    float _169 = fma(_51, _69, _167);
    float _171 = _53 * _93;
    float _173 = fma(_51, _85, _171);
    float _175 = fma(_55, _103, _169);
    float _177 = _175 + _111;
    float _179 = fma(_55, _121, _173);
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _183 = _177 + _181;
    float _185 = _179 + _129;
    float _187 = _183 * _183;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _191 = _185 + _189;
    float _193 = _53 * _147;
    float _195 = fma(_191, _191, _187);
    float _197 = fma(_51, _139, _193);
    float _199 = sqrt(_195);
    float _201 = fma(_55, _157, _197);
    float _203 = _201 + _165;
    float _205 = _203 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c4)._m0[2].x, _205);
    bool _211 = _199 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c4)._m0[2].z, _207);
    float _215 = _213 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _217 = _201;
    float _219 = _51;
    float _221 = _203;
    float _223 = _215;
    if (!_211)
    {
        _217 = _185;
    }
    float _225 = _217;
    float _227 = _225;
    if (!_211)
    {
        _219 = _177;
    }
    float _229 = _219;
    bool _231 = !_211;
    float _233 = _229;
    if (!_231)
    {
        float _235 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _239 = _199 + _237;
        float _241 = _203 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _243 = rsqrt(_195);
        float _245 = _239 * _235;
        float _247 = _245 * 0.15915493667125701904296875;
        float _249 = _247 * 6.283185482025146484375;
        float _251 = cos(_249);
        float _253 = _247 * 6.283185482025146484375;
        float _255 = sin(_253);
        float _257 = _251 + (-1.0);
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _261 = fma(_255, _241, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _263 = fma(_203, _251, _259);
        float _265 = _243 * _261;
        float _267 = _263 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _269 = fma(_191, _265, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _271 = fma(_183, _265, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _273 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[2].x, _267);
        float _275 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[2].z, _273);
        float _277 = _275 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _221 = _263;
        _227 = _269;
        _233 = _271;
        _223 = _277;
    }
    float _279 = _221;
    float _281 = _227;
    float _283 = _233;
    float _285 = _223;
    float _287 = _279 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _289 = _279 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _291 = in.m_32.x;
    float _293 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[1].x, _287);
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c4)._m0[0].x, _289);
    float _297 = in.m_32.y;
    float _299 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[1].z, _293);
    float _301 = fma(_283, (*spvDescriptorSet0.vp_c4)._m0[0].z, _295);
    float _303 = _299 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _305 = _301 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _307 = _303 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _309 = _303 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _311 = _303 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _313 = _303 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _315 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[8].x, _307);
    float _317 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[7].x, _309);
    float _319 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[9].x, _311);
    float _321 = fma(_305, (*spvDescriptorSet0.vp_c4)._m0[10].x, _313);
    float _323 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[8].z, _315);
    float _325 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[7].z, _317);
    float _327 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[9].z, _319);
    float _329 = fma(_285, (*spvDescriptorSet0.vp_c4)._m0[10].z, _321);
    float _331 = _325 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _333 = _323 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _335 = _327 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _337 = _329 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_35.x = _291;
    out.m_35.y = _297;
    out.gl_Position.x = _331;
    out.gl_Position.y = _333;
    out.gl_Position.z = _335;
    out.gl_Position.w = _337;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

