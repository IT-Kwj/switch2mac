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
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
};

struct main0_out
{
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    float4 m_30 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_26.x;
    float _55 = in.m_26.y;
    float _57 = in.m_26.z;
    float _59 = in.m_28.x;
    float _61 = in.m_28.y;
    float _63 = in.m_28.z;
    float _65 = in.m_30.x;
    float _67 = in.m_30.y;
    float _69 = _55 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _71 = _55 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _73 = _55 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[2].x, _69);
    float _77 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[0].x, _71);
    float _79 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _81 = _61 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].z, _75);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].z, _77);
    float _87 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].x, _81);
    float _89 = _83 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _91 = _85 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _93 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _95 = _89 + _93;
    float _97 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _99 = _91 + _97;
    float _101 = _95 * _95;
    float _103 = fma(_99, _99, _101);
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].z, _79);
    float _107 = sqrt(_103);
    float _109 = _105 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _111 = _109 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _113 = fma(_91, (*spvDescriptorSet0.vp_c4)._m0[2].x, _111);
    float _115 = _61 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _117 = fma(_89, (*spvDescriptorSet0.vp_c4)._m0[2].z, _113);
    float _119 = _61 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _121 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].x, _115);
    bool _125 = _107 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _127 = _117 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _129 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].x, _119);
    float _131 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].z, _121);
    float _133 = _117;
    float _135 = _119;
    float _137 = _121;
    float _139 = _59;
    if (!_125)
    {
        _133 = _127;
    }
    float _141 = _133;
    float _143 = _141;
    if (!_125)
    {
        _135 = _91;
    }
    float _145 = _135;
    float _147 = _145;
    if (!_125)
    {
        _137 = _109;
    }
    float _149 = _137;
    float _151 = _149;
    if (!_125)
    {
        _139 = _89;
    }
    float _153 = _139;
    bool _155 = !_125;
    float _157 = _153;
    if (!_155)
    {
        float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _161 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _163 = _107 + _161;
        float _165 = _109 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _167 = rsqrt(_103);
        float _169 = _163 * _159;
        float _171 = _169 * 0.15915493667125701904296875;
        float _173 = _171 * 6.283185482025146484375;
        float _175 = cos(_173);
        float _177 = _171 * 6.283185482025146484375;
        float _179 = sin(_177);
        float _181 = _175 + (-1.0);
        float _183 = fma(_179, _165, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = _167 * _183;
        float _189 = fma(_109, _175, _185);
        float _191 = fma(_99, _187, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _195 = fma(_95, _187, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _197 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _193);
        float _199 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].z, _197);
        float _201 = _199 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _151 = _189;
        _147 = _191;
        _157 = _195;
        _143 = _201;
    }
    float _203 = _151;
    float _205 = _147;
    float _207 = _157;
    float _209 = _143;
    float _211 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].z, _129);
    float _213 = _131 * _131;
    float _215 = _203 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _217 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].z, _87);
    float _219 = _203 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _221 = fma(_211, _211, _213);
    float _223 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[1].x, _215);
    out.m_33.z = _65;
    float _225 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[0].x, _219);
    float _227 = fma(_217, _217, _221);
    float _229 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[1].z, _223);
    out.m_33.w = _67;
    float _231 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[0].z, _225);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _235 = rsqrt(_227);
    float _237 = _231 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_35.x = _91;
    out.m_35.y = _109;
    out.m_35.z = _89;
    float _239 = _233 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _243 = _233 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _245 = _233 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[7].x, _239);
    float _249 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[8].x, _241);
    float _251 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[9].x, _243);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[10].x, _245);
    float _255 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[7].z, _247);
    float _257 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[8].z, _249);
    float _259 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[9].z, _251);
    float _261 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[10].z, _253);
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _265 = _211 * _235;
    float _267 = _131 * _235;
    float _269 = _217 * _235;
    float _271 = _257 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _273 = _259 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _275 = _261 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _265;
    out.m_37.y = _267;
    out.m_37.z = _269;
    out.m_39.w = _127;
    out.gl_Position.x = _263;
    out.gl_Position.y = _271;
    out.gl_Position.z = _273;
    out.gl_Position.w = _275;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_26.x;
    float _55 = in.m_26.y;
    float _57 = in.m_26.z;
    float _59 = in.m_28.x;
    float _61 = in.m_28.y;
    float _63 = in.m_28.z;
    float _65 = in.m_30.x;
    float _67 = in.m_30.y;
    float _69 = _55 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _71 = _55 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _73 = _55 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[2].x, _69);
    float _77 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[0].x, _71);
    float _79 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _81 = _61 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].z, _75);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].z, _77);
    float _87 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].x, _81);
    float _89 = _83 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _91 = _85 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _93 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _95 = _89 + _93;
    float _97 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _99 = _91 + _97;
    float _101 = _95 * _95;
    float _103 = fma(_99, _99, _101);
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].z, _79);
    float _107 = sqrt(_103);
    float _109 = _105 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _111 = _109 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _113 = fma(_91, (*spvDescriptorSet0.vp_c4)._m0[2].x, _111);
    float _115 = _61 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _117 = fma(_89, (*spvDescriptorSet0.vp_c4)._m0[2].z, _113);
    float _119 = _61 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _121 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].x, _115);
    bool _125 = _107 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _127 = _117 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _129 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].x, _119);
    float _131 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].z, _121);
    float _133 = _117;
    float _135 = _119;
    float _137 = _121;
    float _139 = _59;
    if (!_125)
    {
        _133 = _127;
    }
    float _141 = _133;
    float _143 = _141;
    if (!_125)
    {
        _135 = _91;
    }
    float _145 = _135;
    float _147 = _145;
    if (!_125)
    {
        _137 = _109;
    }
    float _149 = _137;
    float _151 = _149;
    if (!_125)
    {
        _139 = _89;
    }
    float _153 = _139;
    bool _155 = !_125;
    float _157 = _153;
    if (!_155)
    {
        float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _161 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _163 = _107 + _161;
        float _165 = _109 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _167 = rsqrt(_103);
        float _169 = _163 * _159;
        float _171 = _169 * 0.15915493667125701904296875;
        float _173 = _171 * 6.283185482025146484375;
        float _175 = cos(_173);
        float _177 = _171 * 6.283185482025146484375;
        float _179 = sin(_177);
        float _181 = _175 + (-1.0);
        float _183 = fma(_179, _165, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = _167 * _183;
        float _189 = fma(_109, _175, _185);
        float _191 = fma(_99, _187, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _195 = fma(_95, _187, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _197 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _193);
        float _199 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].z, _197);
        float _201 = _199 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _151 = _189;
        _147 = _191;
        _157 = _195;
        _143 = _201;
    }
    float _203 = _151;
    float _205 = _147;
    float _207 = _157;
    float _209 = _143;
    float _211 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].z, _129);
    float _213 = _131 * _131;
    float _215 = _203 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _217 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].z, _87);
    float _219 = _203 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _221 = fma(_211, _211, _213);
    float _223 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[1].x, _215);
    out.m_33.z = _65;
    float _225 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[0].x, _219);
    float _227 = fma(_217, _217, _221);
    float _229 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[1].z, _223);
    out.m_33.w = _67;
    float _231 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[0].z, _225);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _235 = rsqrt(_227);
    float _237 = _231 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_35.x = _91;
    out.m_35.y = _109;
    out.m_35.z = _89;
    float _239 = _233 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _243 = _233 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _245 = _233 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[7].x, _239);
    float _249 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[8].x, _241);
    float _251 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[9].x, _243);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[10].x, _245);
    float _255 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[7].z, _247);
    float _257 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[8].z, _249);
    float _259 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[9].z, _251);
    float _261 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[10].z, _253);
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _265 = _211 * _235;
    float _267 = _131 * _235;
    float _269 = _217 * _235;
    float _271 = _257 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _273 = _259 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _275 = _261 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _265;
    out.m_37.y = _267;
    out.m_37.z = _269;
    out.m_39.w = _127;
    out.gl_Position.x = _263;
    out.gl_Position.y = _271;
    out.gl_Position.z = _273;
    out.gl_Position.w = _275;
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
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _53 = in.m_26.x;
    float _55 = in.m_26.y;
    float _57 = in.m_26.z;
    float _59 = in.m_28.x;
    float _61 = in.m_28.y;
    float _63 = in.m_28.z;
    float _65 = in.m_30.x;
    float _67 = in.m_30.y;
    float _69 = _55 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _71 = _55 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _73 = _55 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _75 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[2].x, _69);
    float _77 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[0].x, _71);
    float _79 = fma(_53, (*spvDescriptorSet0.vp_c7)._m0[1].x, _73);
    float _81 = _61 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _83 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[2].z, _75);
    float _85 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[0].z, _77);
    float _87 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].x, _81);
    float _89 = _83 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _91 = _85 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _93 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _95 = _89 + _93;
    float _97 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _99 = _91 + _97;
    float _101 = _95 * _95;
    float _103 = fma(_99, _99, _101);
    float _105 = fma(_57, (*spvDescriptorSet0.vp_c7)._m0[1].z, _79);
    float _107 = sqrt(_103);
    float _109 = _105 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _111 = _109 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _113 = fma(_91, (*spvDescriptorSet0.vp_c4)._m0[2].x, _111);
    float _115 = _61 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _117 = fma(_89, (*spvDescriptorSet0.vp_c4)._m0[2].z, _113);
    float _119 = _61 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _121 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].x, _115);
    bool _125 = _107 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _127 = _117 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _129 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].x, _119);
    float _131 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].z, _121);
    float _133 = _117;
    float _135 = _119;
    float _137 = _121;
    float _139 = _59;
    if (!_125)
    {
        _133 = _127;
    }
    float _141 = _133;
    float _143 = _141;
    if (!_125)
    {
        _135 = _91;
    }
    float _145 = _135;
    float _147 = _145;
    if (!_125)
    {
        _137 = _109;
    }
    float _149 = _137;
    float _151 = _149;
    if (!_125)
    {
        _139 = _89;
    }
    float _153 = _139;
    bool _155 = !_125;
    float _157 = _153;
    if (!_155)
    {
        float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _161 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _163 = _107 + _161;
        float _165 = _109 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _167 = rsqrt(_103);
        float _169 = _163 * _159;
        float _171 = _169 * 0.15915493667125701904296875;
        float _173 = _171 * 6.283185482025146484375;
        float _175 = cos(_173);
        float _177 = _171 * 6.283185482025146484375;
        float _179 = sin(_177);
        float _181 = _175 + (-1.0);
        float _183 = fma(_179, _165, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = _167 * _183;
        float _189 = fma(_109, _175, _185);
        float _191 = fma(_99, _187, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _193 = _189 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _195 = fma(_95, _187, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _197 = fma(_191, (*spvDescriptorSet0.vp_c4)._m0[2].x, _193);
        float _199 = fma(_195, (*spvDescriptorSet0.vp_c4)._m0[2].z, _197);
        float _201 = _199 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _151 = _189;
        _147 = _191;
        _157 = _195;
        _143 = _201;
    }
    float _203 = _151;
    float _205 = _147;
    float _207 = _157;
    float _209 = _143;
    float _211 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].z, _129);
    float _213 = _131 * _131;
    float _215 = _203 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _217 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].z, _87);
    float _219 = _203 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _221 = fma(_211, _211, _213);
    float _223 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[1].x, _215);
    out.m_33.z = _65;
    float _225 = fma(_205, (*spvDescriptorSet0.vp_c4)._m0[0].x, _219);
    float _227 = fma(_217, _217, _221);
    float _229 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[1].z, _223);
    out.m_33.w = _67;
    float _231 = fma(_207, (*spvDescriptorSet0.vp_c4)._m0[0].z, _225);
    float _233 = _229 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _235 = rsqrt(_227);
    float _237 = _231 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_35.x = _91;
    out.m_35.y = _109;
    out.m_35.z = _89;
    float _239 = _233 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _241 = _233 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _243 = _233 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _245 = _233 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _247 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[7].x, _239);
    float _249 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[8].x, _241);
    float _251 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[9].x, _243);
    float _253 = fma(_237, (*spvDescriptorSet0.vp_c4)._m0[10].x, _245);
    float _255 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[7].z, _247);
    float _257 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[8].z, _249);
    float _259 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[9].z, _251);
    float _261 = fma(_209, (*spvDescriptorSet0.vp_c4)._m0[10].z, _253);
    float _263 = _255 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _265 = _211 * _235;
    float _267 = _131 * _235;
    float _269 = _217 * _235;
    float _271 = _257 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _273 = _259 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _275 = _261 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.x = _265;
    out.m_37.y = _267;
    out.m_37.z = _269;
    out.m_39.w = _127;
    out.gl_Position.x = _263;
    out.gl_Position.y = _271;
    out.gl_Position.z = _273;
    out.gl_Position.w = _275;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

