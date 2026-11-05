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
    constant _16* vp_c11 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_30 [[attribute(1)]];
    float4 m_32 [[attribute(8)]];
    float4 m_34 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = in.m_28.x;
    float _57 = in.m_28.y;
    float _59 = in.m_28.z;
    float _61 = in.m_30.x;
    float _63 = in.m_30.y;
    float _65 = in.m_30.z;
    float _67 = _57 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _69 = _57 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _71 = _57 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _73 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].x, _67);
    float _75 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _77 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].x, _69);
    float _83 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].z, _73);
    float _85 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _77);
    float _87 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].x, _71);
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _75);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _93 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].z, _81);
    float _95 = _83 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _99 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].z, _87);
    float _101 = _93 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _105 = _95 + _103;
    float _107 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _89);
    float _109 = _97 * _97;
    float _111 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _91);
    float _113 = _99 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _115 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _117 = _101 + _115;
    float _119 = _105 * _105;
    float _121 = fma(_107, _107, _109);
    float _123 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _125 = _113 + _123;
    float _127 = fma(_117, _117, _119);
    float _129 = fma(_111, _111, _121);
    float _131 = fma(_125, _125, _127);
    float _133 = rsqrt(_129);
    float _135 = rsqrt(_131);
    float _137 = _97 * _133;
    float _139 = _107 * _133;
    float _141 = _111 * _133;
    float _143 = sqrt(_131);
    float _145 = _105 * _135;
    float _147 = _117 * _135;
    float _149 = _137 * _145;
    float _151 = _125 * _135;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c11)._m0[23].z;
    float _155 = fma(_139, _147, _149);
    float _157 = _125 * _125;
    float _159 = -(*spvDescriptorSet0.vp_c11)._m0[23].y;
    float _161 = _143 + _159;
    float _163 = fma(_141, _151, _155);
    float _165 = fma(_117, _117, _157);
    float _167 = sqrt(_165);
    float _169 = _161 * _153;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = abs(_163);
    float _175 = log2(_173);
    float _177 = in.m_32.x;
    bool _181 = _167 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c11)._m0[23].w;
    float _185 = exp2(_183);
    float _187 = _185 * (*spvDescriptorSet0.vp_c11)._m0[23].x;
    float _189 = _185;
    float _191 = _187;
    if (!_181)
    {
        _189 = _113;
    }
    float _193 = _189;
    float _195 = fma(_187, _171, _95);
    float _197 = _195 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = _193;
    if (!_181)
    {
        _191 = _195;
    }
    float _201 = _191;
    float _203 = fma(_101, (*spvDescriptorSet0.vp_c4)._m0[2].x, _197);
    float _205 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].z, _203);
    float _207 = _205 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _209 = _205;
    float _211 = _201;
    float _213 = _207;
    if (!_181)
    {
        _209 = _101;
    }
    float _215 = _209;
    bool _217 = !_181;
    float _219 = _215;
    if (!_217)
    {
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _225 = _167 + _223;
        float _227 = _195 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _229 = rsqrt(_165);
        float _231 = _225 * _221;
        float _233 = _231 * 0.15915493667125701904296875;
        float _235 = _233 * 6.283185482025146484375;
        float _237 = cos(_235);
        float _239 = _233 * 6.283185482025146484375;
        float _241 = sin(_239);
        float _243 = _237 + (-1.0);
        float _245 = fma(_241, _227, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _249 = _229 * _245;
        float _251 = fma(_195, _237, _247);
        float _253 = fma(_117, _249, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _255 = _251 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _257 = fma(_125, _249, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _259 = fma(_253, (*spvDescriptorSet0.vp_c4)._m0[2].x, _255);
        float _261 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[2].z, _259);
        float _263 = _261 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _211 = _251;
        _219 = _253;
        _199 = _257;
        _213 = _263;
    }
    float _265 = _211;
    float _267 = _219;
    float _269 = _199;
    float _271 = _213;
    float _273 = _265 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _277 = in.m_32.y;
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c4)._m0[1].x, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c4)._m0[0].x, _275);
    float _283 = in.m_34.x;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[1].z, _279);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[0].z, _281);
    out.m_37.x = _177;
    float _289 = _285 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _291 = _287 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_39.x = _101;
    out.m_39.y = _195;
    out.m_39.z = _113;
    float _293 = _289 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _295 = _289 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _297 = _289 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _299 = _289 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[9].x, _293);
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[7].x, _295);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[8].x, _297);
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[10].x, _299);
    float _309 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[9].z, _301);
    float _311 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[7].z, _303);
    float _313 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[8].z, _305);
    float _315 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[10].z, _307);
    float _317 = _309 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _319 = _311 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _321 = _313 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _323 = _315 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.y = _277;
    out.m_41.x = _283;
    out.gl_Position.x = _319;
    out.gl_Position.y = _321;
    out.gl_Position.z = _317;
    out.gl_Position.w = _323;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = in.m_28.x;
    float _57 = in.m_28.y;
    float _59 = in.m_28.z;
    float _61 = in.m_30.x;
    float _63 = in.m_30.y;
    float _65 = in.m_30.z;
    float _67 = _57 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _69 = _57 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _71 = _57 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _73 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].x, _67);
    float _75 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _77 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].x, _69);
    float _83 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].z, _73);
    float _85 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _77);
    float _87 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].x, _71);
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _75);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _93 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].z, _81);
    float _95 = _83 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _99 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].z, _87);
    float _101 = _93 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _105 = _95 + _103;
    float _107 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _89);
    float _109 = _97 * _97;
    float _111 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _91);
    float _113 = _99 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _115 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _117 = _101 + _115;
    float _119 = _105 * _105;
    float _121 = fma(_107, _107, _109);
    float _123 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _125 = _113 + _123;
    float _127 = fma(_117, _117, _119);
    float _129 = fma(_111, _111, _121);
    float _131 = fma(_125, _125, _127);
    float _133 = rsqrt(_129);
    float _135 = rsqrt(_131);
    float _137 = _97 * _133;
    float _139 = _107 * _133;
    float _141 = _111 * _133;
    float _143 = sqrt(_131);
    float _145 = _105 * _135;
    float _147 = _117 * _135;
    float _149 = _137 * _145;
    float _151 = _125 * _135;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c11)._m0[23].z;
    float _155 = fma(_139, _147, _149);
    float _157 = _125 * _125;
    float _159 = -(*spvDescriptorSet0.vp_c11)._m0[23].y;
    float _161 = _143 + _159;
    float _163 = fma(_141, _151, _155);
    float _165 = fma(_117, _117, _157);
    float _167 = sqrt(_165);
    float _169 = _161 * _153;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = abs(_163);
    float _175 = log2(_173);
    float _177 = in.m_32.x;
    bool _181 = _167 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c11)._m0[23].w;
    float _185 = exp2(_183);
    float _187 = _185 * (*spvDescriptorSet0.vp_c11)._m0[23].x;
    float _189 = _185;
    float _191 = _187;
    if (!_181)
    {
        _189 = _113;
    }
    float _193 = _189;
    float _195 = fma(_187, _171, _95);
    float _197 = _195 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = _193;
    if (!_181)
    {
        _191 = _195;
    }
    float _201 = _191;
    float _203 = fma(_101, (*spvDescriptorSet0.vp_c4)._m0[2].x, _197);
    float _205 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].z, _203);
    float _207 = _205 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _209 = _205;
    float _211 = _201;
    float _213 = _207;
    if (!_181)
    {
        _209 = _101;
    }
    float _215 = _209;
    bool _217 = !_181;
    float _219 = _215;
    if (!_217)
    {
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _225 = _167 + _223;
        float _227 = _195 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _229 = rsqrt(_165);
        float _231 = _225 * _221;
        float _233 = _231 * 0.15915493667125701904296875;
        float _235 = _233 * 6.283185482025146484375;
        float _237 = cos(_235);
        float _239 = _233 * 6.283185482025146484375;
        float _241 = sin(_239);
        float _243 = _237 + (-1.0);
        float _245 = fma(_241, _227, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _249 = _229 * _245;
        float _251 = fma(_195, _237, _247);
        float _253 = fma(_117, _249, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _255 = _251 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _257 = fma(_125, _249, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _259 = fma(_253, (*spvDescriptorSet0.vp_c4)._m0[2].x, _255);
        float _261 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[2].z, _259);
        float _263 = _261 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _211 = _251;
        _219 = _253;
        _199 = _257;
        _213 = _263;
    }
    float _265 = _211;
    float _267 = _219;
    float _269 = _199;
    float _271 = _213;
    float _273 = _265 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _277 = in.m_32.y;
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c4)._m0[1].x, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c4)._m0[0].x, _275);
    float _283 = in.m_34.x;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[1].z, _279);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[0].z, _281);
    out.m_37.x = _177;
    float _289 = _285 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _291 = _287 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_39.x = _101;
    out.m_39.y = _195;
    out.m_39.z = _113;
    float _293 = _289 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _295 = _289 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _297 = _289 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _299 = _289 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[9].x, _293);
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[7].x, _295);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[8].x, _297);
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[10].x, _299);
    float _309 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[9].z, _301);
    float _311 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[7].z, _303);
    float _313 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[8].z, _305);
    float _315 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[10].z, _307);
    float _317 = _309 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _319 = _311 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _321 = _313 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _323 = _315 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.y = _277;
    out.m_41.x = _283;
    out.gl_Position.x = _319;
    out.gl_Position.y = _321;
    out.gl_Position.z = _317;
    out.gl_Position.w = _323;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _55 = in.m_28.x;
    float _57 = in.m_28.y;
    float _59 = in.m_28.z;
    float _61 = in.m_30.x;
    float _63 = in.m_30.y;
    float _65 = in.m_30.z;
    float _67 = _57 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _69 = _57 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _71 = _57 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _73 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[1].x, _67);
    float _75 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _77 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[0].x, _69);
    float _83 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].z, _73);
    float _85 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _77);
    float _87 = fma(_55, (*spvDescriptorSet0.vp_c7)._m0[2].x, _71);
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _75);
    float _91 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _93 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].z, _81);
    float _95 = _83 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _97 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _85);
    float _99 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].z, _87);
    float _101 = _93 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _103 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _105 = _95 + _103;
    float _107 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _89);
    float _109 = _97 * _97;
    float _111 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _91);
    float _113 = _99 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _115 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _117 = _101 + _115;
    float _119 = _105 * _105;
    float _121 = fma(_107, _107, _109);
    float _123 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _125 = _113 + _123;
    float _127 = fma(_117, _117, _119);
    float _129 = fma(_111, _111, _121);
    float _131 = fma(_125, _125, _127);
    float _133 = rsqrt(_129);
    float _135 = rsqrt(_131);
    float _137 = _97 * _133;
    float _139 = _107 * _133;
    float _141 = _111 * _133;
    float _143 = sqrt(_131);
    float _145 = _105 * _135;
    float _147 = _117 * _135;
    float _149 = _137 * _145;
    float _151 = _125 * _135;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c11)._m0[23].z;
    float _155 = fma(_139, _147, _149);
    float _157 = _125 * _125;
    float _159 = -(*spvDescriptorSet0.vp_c11)._m0[23].y;
    float _161 = _143 + _159;
    float _163 = fma(_141, _151, _155);
    float _165 = fma(_117, _117, _157);
    float _167 = sqrt(_165);
    float _169 = _161 * _153;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = abs(_163);
    float _175 = log2(_173);
    float _177 = in.m_32.x;
    bool _181 = _167 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _183 = _175 * (*spvDescriptorSet0.vp_c11)._m0[23].w;
    float _185 = exp2(_183);
    float _187 = _185 * (*spvDescriptorSet0.vp_c11)._m0[23].x;
    float _189 = _185;
    float _191 = _187;
    if (!_181)
    {
        _189 = _113;
    }
    float _193 = _189;
    float _195 = fma(_187, _171, _95);
    float _197 = _195 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _199 = _193;
    if (!_181)
    {
        _191 = _195;
    }
    float _201 = _191;
    float _203 = fma(_101, (*spvDescriptorSet0.vp_c4)._m0[2].x, _197);
    float _205 = fma(_113, (*spvDescriptorSet0.vp_c4)._m0[2].z, _203);
    float _207 = _205 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _209 = _205;
    float _211 = _201;
    float _213 = _207;
    if (!_181)
    {
        _209 = _101;
    }
    float _215 = _209;
    bool _217 = !_181;
    float _219 = _215;
    if (!_217)
    {
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _225 = _167 + _223;
        float _227 = _195 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _229 = rsqrt(_165);
        float _231 = _225 * _221;
        float _233 = _231 * 0.15915493667125701904296875;
        float _235 = _233 * 6.283185482025146484375;
        float _237 = cos(_235);
        float _239 = _233 * 6.283185482025146484375;
        float _241 = sin(_239);
        float _243 = _237 + (-1.0);
        float _245 = fma(_241, _227, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _249 = _229 * _245;
        float _251 = fma(_195, _237, _247);
        float _253 = fma(_117, _249, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _255 = _251 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _257 = fma(_125, _249, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _259 = fma(_253, (*spvDescriptorSet0.vp_c4)._m0[2].x, _255);
        float _261 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[2].z, _259);
        float _263 = _261 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _211 = _251;
        _219 = _253;
        _199 = _257;
        _213 = _263;
    }
    float _265 = _211;
    float _267 = _219;
    float _269 = _199;
    float _271 = _213;
    float _273 = _265 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _275 = _265 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _277 = in.m_32.y;
    float _279 = fma(_267, (*spvDescriptorSet0.vp_c4)._m0[1].x, _273);
    float _281 = fma(_267, (*spvDescriptorSet0.vp_c4)._m0[0].x, _275);
    float _283 = in.m_34.x;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[1].z, _279);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c4)._m0[0].z, _281);
    out.m_37.x = _177;
    float _289 = _285 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _291 = _287 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    out.m_39.x = _101;
    out.m_39.y = _195;
    out.m_39.z = _113;
    float _293 = _289 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _295 = _289 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _297 = _289 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _299 = _289 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[9].x, _293);
    float _303 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[7].x, _295);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[8].x, _297);
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c4)._m0[10].x, _299);
    float _309 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[9].z, _301);
    float _311 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[7].z, _303);
    float _313 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[8].z, _305);
    float _315 = fma(_271, (*spvDescriptorSet0.vp_c4)._m0[10].z, _307);
    float _317 = _309 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _319 = _311 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _321 = _313 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _323 = _315 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_37.y = _277;
    out.m_41.x = _283;
    out.gl_Position.x = _319;
    out.gl_Position.y = _321;
    out.gl_Position.z = _317;
    out.gl_Position.w = _323;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

