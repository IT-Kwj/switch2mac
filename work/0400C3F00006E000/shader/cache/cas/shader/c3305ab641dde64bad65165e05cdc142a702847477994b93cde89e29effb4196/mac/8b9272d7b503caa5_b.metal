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
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
    float4 m_28 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_30 [[attribute(8)]];
    float4 m_34 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _59 = in.m_26.x;
    float _61 = in.m_26.y;
    float _63 = in.m_26.z;
    float _65 = in.m_28.x;
    float _67 = in.m_28.y;
    float _69 = in.m_28.z;
    float _71 = in.m_30.x;
    float _73 = in.m_30.y;
    float _75 = in.m_32.x;
    float _77 = in.m_32.y;
    float _79 = in.m_32.z;
    float _81 = in.m_32.w;
    float _83 = _61 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _85 = _61 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _87 = _61 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _89 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].x, _83);
    float _91 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].x, _85);
    float _93 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].x, _87);
    float _95 = _67 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _97 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].z, _89);
    float _99 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].z, _91);
    float _101 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].z, _93);
    float _103 = in.m_34.x;
    float _105 = _97 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _111 = _67 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _115 = _105 + _113;
    float _117 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _119 = _107 + _117;
    out.m_37.x = _71;
    float _121 = _109 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _123 = _115 * _115;
    float _125 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].x, _111);
    out.m_37.y = _73;
    float _127 = fma(_107, (*spvDescriptorSet0.vp_c4)._m0[2].x, _121);
    float _129 = fma(_119, _119, _123);
    float _131 = _67 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _133 = _77 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _135 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].x, _95);
    float _137 = sqrt(_129);
    float _139 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].x, _131);
    float _141 = _77 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _143 = _77 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _145 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[0].x, _133);
    float _147 = fma(_105, (*spvDescriptorSet0.vp_c4)._m0[2].z, _127);
    float _149 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[1].x, _141);
    float _151 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[2].x, _143);
    float _153 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[1].z, _125);
    float _155 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[0].z, _135);
    float _157 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[2].z, _139);
    float _159 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[0].z, _145);
    float _161 = _153 * _153;
    float _163 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[1].z, _149);
    float _165 = _147 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _167 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[2].z, _151);
    bool _171 = _137 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _173 = fma(_155, _155, _161);
    float _175 = _63;
    float _177 = _125;
    float _179 = _161;
    float _181 = _165;
    if (!_171)
    {
        _175 = _107;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_171)
    {
        _177 = _109;
    }
    float _187 = _177;
    float _189 = _187;
    if (!_171)
    {
        _179 = _105;
    }
    float _191 = _179;
    bool _193 = !_171;
    float _195 = _191;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _201 = _137 + _199;
        float _203 = _109 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _205 = rsqrt(_129);
        float _207 = _201 * _197;
        float _209 = _207 * 0.15915493667125701904296875;
        float _211 = _209 * 6.283185482025146484375;
        float _213 = cos(_211);
        float _215 = _209 * 6.283185482025146484375;
        float _217 = sin(_215);
        float _219 = _213 + (-1.0);
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _223 = fma(_217, _203, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _225 = _205 * _223;
        float _227 = fma(_109, _213, _221);
        float _229 = fma(_119, _225, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _231 = _227 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _233 = fma(_115, _225, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _235 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].x, _231);
        float _237 = fma(_233, (*spvDescriptorSet0.vp_c4)._m0[2].z, _235);
        float _239 = _237 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _189 = _227;
        _185 = _229;
        _195 = _233;
        _181 = _239;
    }
    float _241 = _189;
    float _243 = _185;
    float _245 = _195;
    float _247 = _181;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _251 = _163 * _163;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _255 = fma(_157, _157, _173);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[1].x, _249);
    float _259 = fma(_159, _159, _251);
    float _261 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[0].x, _253);
    out.m_39.x = _103;
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[1].z, _257);
    float _265 = fma(_167, _167, _259);
    float _267 = rsqrt(_255);
    float _269 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[0].z, _261);
    float _271 = _263 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    out.m_41.w = _81;
    float _273 = _269 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _275 = _271 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _277 = _271 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _279 = rsqrt(_265);
    float _281 = _271 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _283 = _271 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _285 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[7].x, _275);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[8].x, _277);
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[9].x, _281);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[10].x, _283);
    float _293 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[7].z, _285);
    float _295 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[8].z, _287);
    float _297 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[9].z, _289);
    float _299 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[10].z, _291);
    float _301 = _155 * _267;
    float _303 = _153 * _267;
    float _305 = _157 * _267;
    float _307 = _297 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _309 = _159 * _279;
    float _311 = _163 * _279;
    float _313 = _167 * _279;
    float _315 = _293 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _317 = _295 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _319 = _299 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _107;
    out.m_43.y = _109;
    out.m_43.z = _105;
    out.m_45.x = _301;
    out.m_45.y = _303;
    out.m_45.z = _305;
    out.m_41.x = _309;
    out.m_41.y = _311;
    out.m_41.z = _313;
    out.gl_Position.x = _315;
    out.gl_Position.y = _317;
    out.gl_Position.z = _307;
    out.gl_Position.w = _319;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _59 = in.m_26.x;
    float _61 = in.m_26.y;
    float _63 = in.m_26.z;
    float _65 = in.m_28.x;
    float _67 = in.m_28.y;
    float _69 = in.m_28.z;
    float _71 = in.m_30.x;
    float _73 = in.m_30.y;
    float _75 = in.m_32.x;
    float _77 = in.m_32.y;
    float _79 = in.m_32.z;
    float _81 = in.m_32.w;
    float _83 = _61 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _85 = _61 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _87 = _61 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _89 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].x, _83);
    float _91 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].x, _85);
    float _93 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].x, _87);
    float _95 = _67 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _97 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].z, _89);
    float _99 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].z, _91);
    float _101 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].z, _93);
    float _103 = in.m_34.x;
    float _105 = _97 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _111 = _67 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _115 = _105 + _113;
    float _117 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _119 = _107 + _117;
    out.m_37.x = _71;
    float _121 = _109 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _123 = _115 * _115;
    float _125 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].x, _111);
    out.m_37.y = _73;
    float _127 = fma(_107, (*spvDescriptorSet0.vp_c4)._m0[2].x, _121);
    float _129 = fma(_119, _119, _123);
    float _131 = _67 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _133 = _77 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _135 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].x, _95);
    float _137 = sqrt(_129);
    float _139 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].x, _131);
    float _141 = _77 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _143 = _77 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _145 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[0].x, _133);
    float _147 = fma(_105, (*spvDescriptorSet0.vp_c4)._m0[2].z, _127);
    float _149 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[1].x, _141);
    float _151 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[2].x, _143);
    float _153 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[1].z, _125);
    float _155 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[0].z, _135);
    float _157 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[2].z, _139);
    float _159 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[0].z, _145);
    float _161 = _153 * _153;
    float _163 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[1].z, _149);
    float _165 = _147 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _167 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[2].z, _151);
    bool _171 = _137 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _173 = fma(_155, _155, _161);
    float _175 = _63;
    float _177 = _125;
    float _179 = _161;
    float _181 = _165;
    if (!_171)
    {
        _175 = _107;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_171)
    {
        _177 = _109;
    }
    float _187 = _177;
    float _189 = _187;
    if (!_171)
    {
        _179 = _105;
    }
    float _191 = _179;
    bool _193 = !_171;
    float _195 = _191;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _201 = _137 + _199;
        float _203 = _109 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _205 = rsqrt(_129);
        float _207 = _201 * _197;
        float _209 = _207 * 0.15915493667125701904296875;
        float _211 = _209 * 6.283185482025146484375;
        float _213 = cos(_211);
        float _215 = _209 * 6.283185482025146484375;
        float _217 = sin(_215);
        float _219 = _213 + (-1.0);
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _223 = fma(_217, _203, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _225 = _205 * _223;
        float _227 = fma(_109, _213, _221);
        float _229 = fma(_119, _225, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _231 = _227 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _233 = fma(_115, _225, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _235 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].x, _231);
        float _237 = fma(_233, (*spvDescriptorSet0.vp_c4)._m0[2].z, _235);
        float _239 = _237 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _189 = _227;
        _185 = _229;
        _195 = _233;
        _181 = _239;
    }
    float _241 = _189;
    float _243 = _185;
    float _245 = _195;
    float _247 = _181;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _251 = _163 * _163;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _255 = fma(_157, _157, _173);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[1].x, _249);
    float _259 = fma(_159, _159, _251);
    float _261 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[0].x, _253);
    out.m_39.x = _103;
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[1].z, _257);
    float _265 = fma(_167, _167, _259);
    float _267 = rsqrt(_255);
    float _269 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[0].z, _261);
    float _271 = _263 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    out.m_41.w = _81;
    float _273 = _269 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _275 = _271 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _277 = _271 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _279 = rsqrt(_265);
    float _281 = _271 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _283 = _271 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _285 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[7].x, _275);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[8].x, _277);
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[9].x, _281);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[10].x, _283);
    float _293 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[7].z, _285);
    float _295 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[8].z, _287);
    float _297 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[9].z, _289);
    float _299 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[10].z, _291);
    float _301 = _155 * _267;
    float _303 = _153 * _267;
    float _305 = _157 * _267;
    float _307 = _297 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _309 = _159 * _279;
    float _311 = _163 * _279;
    float _313 = _167 * _279;
    float _315 = _293 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _317 = _295 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _319 = _299 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _107;
    out.m_43.y = _109;
    out.m_43.z = _105;
    out.m_45.x = _301;
    out.m_45.y = _303;
    out.m_45.z = _305;
    out.m_41.x = _309;
    out.m_41.y = _311;
    out.m_41.z = _313;
    out.gl_Position.x = _315;
    out.gl_Position.y = _317;
    out.gl_Position.z = _307;
    out.gl_Position.w = _319;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _59 = in.m_26.x;
    float _61 = in.m_26.y;
    float _63 = in.m_26.z;
    float _65 = in.m_28.x;
    float _67 = in.m_28.y;
    float _69 = in.m_28.z;
    float _71 = in.m_30.x;
    float _73 = in.m_30.y;
    float _75 = in.m_32.x;
    float _77 = in.m_32.y;
    float _79 = in.m_32.z;
    float _81 = in.m_32.w;
    float _83 = _61 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _85 = _61 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _87 = _61 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _89 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[2].x, _83);
    float _91 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[0].x, _85);
    float _93 = fma(_59, (*spvDescriptorSet0.vp_c7)._m0[1].x, _87);
    float _95 = _67 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _97 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[2].z, _89);
    float _99 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[0].z, _91);
    float _101 = fma(_63, (*spvDescriptorSet0.vp_c7)._m0[1].z, _93);
    float _103 = in.m_34.x;
    float _105 = _97 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _107 = _99 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _109 = _101 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _111 = _67 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _115 = _105 + _113;
    float _117 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _119 = _107 + _117;
    out.m_37.x = _71;
    float _121 = _109 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _123 = _115 * _115;
    float _125 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].x, _111);
    out.m_37.y = _73;
    float _127 = fma(_107, (*spvDescriptorSet0.vp_c4)._m0[2].x, _121);
    float _129 = fma(_119, _119, _123);
    float _131 = _67 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _133 = _77 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _135 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].x, _95);
    float _137 = sqrt(_129);
    float _139 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].x, _131);
    float _141 = _77 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _143 = _77 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _145 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[0].x, _133);
    float _147 = fma(_105, (*spvDescriptorSet0.vp_c4)._m0[2].z, _127);
    float _149 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[1].x, _141);
    float _151 = fma(_75, (*spvDescriptorSet0.vp_c7)._m0[2].x, _143);
    float _153 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[1].z, _125);
    float _155 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[0].z, _135);
    float _157 = fma(_69, (*spvDescriptorSet0.vp_c7)._m0[2].z, _139);
    float _159 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[0].z, _145);
    float _161 = _153 * _153;
    float _163 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[1].z, _149);
    float _165 = _147 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _167 = fma(_79, (*spvDescriptorSet0.vp_c7)._m0[2].z, _151);
    bool _171 = _137 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _173 = fma(_155, _155, _161);
    float _175 = _63;
    float _177 = _125;
    float _179 = _161;
    float _181 = _165;
    if (!_171)
    {
        _175 = _107;
    }
    float _183 = _175;
    float _185 = _183;
    if (!_171)
    {
        _177 = _109;
    }
    float _187 = _177;
    float _189 = _187;
    if (!_171)
    {
        _179 = _105;
    }
    float _191 = _179;
    bool _193 = !_171;
    float _195 = _191;
    if (!_193)
    {
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _201 = _137 + _199;
        float _203 = _109 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _205 = rsqrt(_129);
        float _207 = _201 * _197;
        float _209 = _207 * 0.15915493667125701904296875;
        float _211 = _209 * 6.283185482025146484375;
        float _213 = cos(_211);
        float _215 = _209 * 6.283185482025146484375;
        float _217 = sin(_215);
        float _219 = _213 + (-1.0);
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _223 = fma(_217, _203, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _225 = _205 * _223;
        float _227 = fma(_109, _213, _221);
        float _229 = fma(_119, _225, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _231 = _227 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _233 = fma(_115, _225, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _235 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[2].x, _231);
        float _237 = fma(_233, (*spvDescriptorSet0.vp_c4)._m0[2].z, _235);
        float _239 = _237 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _189 = _227;
        _185 = _229;
        _195 = _233;
        _181 = _239;
    }
    float _241 = _189;
    float _243 = _185;
    float _245 = _195;
    float _247 = _181;
    float _249 = _241 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _251 = _163 * _163;
    float _253 = _241 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _255 = fma(_157, _157, _173);
    float _257 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[1].x, _249);
    float _259 = fma(_159, _159, _251);
    float _261 = fma(_243, (*spvDescriptorSet0.vp_c4)._m0[0].x, _253);
    out.m_39.x = _103;
    float _263 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[1].z, _257);
    float _265 = fma(_167, _167, _259);
    float _267 = rsqrt(_255);
    float _269 = fma(_245, (*spvDescriptorSet0.vp_c4)._m0[0].z, _261);
    float _271 = _263 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    out.m_41.w = _81;
    float _273 = _269 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _275 = _271 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _277 = _271 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _279 = rsqrt(_265);
    float _281 = _271 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _283 = _271 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _285 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[7].x, _275);
    float _287 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[8].x, _277);
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[9].x, _281);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c4)._m0[10].x, _283);
    float _293 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[7].z, _285);
    float _295 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[8].z, _287);
    float _297 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[9].z, _289);
    float _299 = fma(_247, (*spvDescriptorSet0.vp_c4)._m0[10].z, _291);
    float _301 = _155 * _267;
    float _303 = _153 * _267;
    float _305 = _157 * _267;
    float _307 = _297 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _309 = _159 * _279;
    float _311 = _163 * _279;
    float _313 = _167 * _279;
    float _315 = _293 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _317 = _295 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _319 = _299 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.x = _107;
    out.m_43.y = _109;
    out.m_43.z = _105;
    out.m_45.x = _301;
    out.m_45.y = _303;
    out.m_45.z = _305;
    out.m_41.x = _309;
    out.m_41.y = _311;
    out.m_41.z = _313;
    out.gl_Position.x = _315;
    out.gl_Position.y = _317;
    out.gl_Position.z = _307;
    out.gl_Position.w = _319;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

