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
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(0)]];
    float4 m_30 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_34 [[attribute(8)]];
    float4 m_36 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_28.x;
    float _63 = in.m_28.y;
    float _65 = in.m_28.z;
    float _67 = in.m_30.x;
    float _69 = in.m_30.y;
    float _71 = in.m_30.z;
    float _73 = in.m_32.x;
    float _75 = in.m_32.y;
    float _77 = in.m_32.z;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _85 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _87 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _83);
    float _91 = _69 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _93 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _85);
    float _95 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _87);
    float _97 = _69 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _99 = _75 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _101 = _93 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _105 = _75 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _107 = _69 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _109 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _111 = _101 + _109;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _115 = _103 + _113;
    float _117 = _75 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _119 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[1].x, _91);
    float _121 = _111 * _111;
    float _123 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[0].x, _99);
    float _125 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[1].x, _105);
    float _127 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[2].x, _117);
    float _129 = fma(_115, _115, _121);
    float _131 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _89);
    float _133 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[2].x, _107);
    float _135 = sqrt(_129);
    float _137 = _131 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _139 = _137 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _141 = fma(_103, (*spvDescriptorSet0.vp_c4)._m0[2].x, _139);
    float _143 = fma(_101, (*spvDescriptorSet0.vp_c4)._m0[2].z, _141);
    float _145 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[0].x, _97);
    bool _149 = _135 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _151 = _143 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _153 = _73;
    float _155 = _107;
    float _157 = _67;
    float _159 = _97;
    if (!_149)
    {
        _153 = _151;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_149)
    {
        _155 = _103;
    }
    float _165 = _155;
    float _167 = _165;
    if (!_149)
    {
        _157 = _137;
    }
    float _169 = _157;
    float _171 = _169;
    if (!_149)
    {
        _159 = _101;
    }
    float _173 = _159;
    bool _175 = !_149;
    float _177 = _173;
    if (!_175)
    {
        float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _183 = _135 + _181;
        float _185 = _137 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = rsqrt(_129);
        float _189 = _183 * _179;
        float _191 = _189 * 0.15915493667125701904296875;
        float _193 = _191 * 6.283185482025146484375;
        float _195 = cos(_193);
        float _197 = _191 * 6.283185482025146484375;
        float _199 = sin(_197);
        float _201 = _195 + (-1.0);
        float _203 = fma(_199, _185, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _207 = _187 * _203;
        float _209 = fma(_137, _195, _205);
        float _211 = fma(_115, _207, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _213 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _215 = fma(_111, _207, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _217 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[2].x, _213);
        float _219 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[2].z, _217);
        float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _171 = _209;
        _167 = _211;
        _177 = _215;
        _163 = _221;
    }
    float _223 = _171;
    float _225 = _167;
    float _227 = _177;
    float _229 = _163;
    float _231 = _223 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _233 = _223 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _235 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[0].z, _123);
    float _237 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[1].z, _125);
    float _239 = fma(_225, (*spvDescriptorSet0.vp_c4)._m0[1].x, _231);
    float _241 = fma(_225, (*spvDescriptorSet0.vp_c4)._m0[0].x, _233);
    float _243 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[2].z, _127);
    float _245 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[1].z, _119);
    float _247 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[1].z, _239);
    float _249 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[0].z, _241);
    float _251 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[0].z, _145);
    float _253 = _245 * _245;
    float _255 = _247 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _257 = _249 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _259 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[2].z, _133);
    float _261 = fma(_251, _251, _253);
    float _263 = _255 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _265 = _237 * _237;
    float _267 = fma(_259, _259, _261);
    float _269 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[9].x, _263);
    float _271 = _255 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _273 = fma(_235, _235, _265);
    float _275 = in.m_34.x;
    float _277 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[9].z, _269);
    float _279 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[10].x, _271);
    float _281 = fma(_243, _243, _273);
    float _283 = rsqrt(_267);
    float _285 = _277 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _287 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[10].z, _279);
    float _289 = in.m_34.y;
    float _291 = _255 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _293 = _285 * 10000.0;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _287 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _299 = in.m_36.x;
    float _301 = rsqrt(_281);
    float _303 = _295 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _305 = _255 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _307 = in.m_32.w;
    float _309 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[7].x, _291);
    float _311 = fma(_303, (*spvDescriptorSet0.vp_c4)._m0[10].z, _297);
    float _313 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[8].x, _305);
    float _315 = fma(_303, (*spvDescriptorSet0.vp_c4)._m0[9].z, _285);
    float _317 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[7].z, _309);
    float _319 = _259 * _283;
    float _321 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[8].z, _313);
    float _323 = 1.0 / _311;
    float _325 = _251 * _283;
    float _327 = _245 * _283;
    out.m_39.x = _275;
    float _329 = _317 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _331 = _237 * _301;
    float _333 = _321 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    out.m_39.y = _289;
    float _335 = _243 * _301;
    out.m_41.x = _299;
    float _337 = _297 * _323;
    float _339 = _235 * _301;
    out.m_43.w = _307;
    float _341 = _315 * _337;
    out.m_45.x = _103;
    out.m_45.y = _137;
    out.m_45.z = _101;
    out.m_47.x = _325;
    out.m_47.y = _327;
    out.m_47.z = _319;
    out.m_43.x = _339;
    out.m_43.y = _331;
    out.m_43.z = _335;
    out.gl_Position.x = _329;
    out.gl_Position.y = _333;
    out.gl_Position.z = _341;
    out.gl_Position.w = _297;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_28.x;
    float _63 = in.m_28.y;
    float _65 = in.m_28.z;
    float _67 = in.m_30.x;
    float _69 = in.m_30.y;
    float _71 = in.m_30.z;
    float _73 = in.m_32.x;
    float _75 = in.m_32.y;
    float _77 = in.m_32.z;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _85 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _87 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _83);
    float _91 = _69 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _93 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _85);
    float _95 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _87);
    float _97 = _69 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _99 = _75 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _101 = _93 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _105 = _75 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _107 = _69 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _109 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _111 = _101 + _109;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _115 = _103 + _113;
    float _117 = _75 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _119 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[1].x, _91);
    float _121 = _111 * _111;
    float _123 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[0].x, _99);
    float _125 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[1].x, _105);
    float _127 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[2].x, _117);
    float _129 = fma(_115, _115, _121);
    float _131 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _89);
    float _133 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[2].x, _107);
    float _135 = sqrt(_129);
    float _137 = _131 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _139 = _137 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _141 = fma(_103, (*spvDescriptorSet0.vp_c4)._m0[2].x, _139);
    float _143 = fma(_101, (*spvDescriptorSet0.vp_c4)._m0[2].z, _141);
    float _145 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[0].x, _97);
    bool _149 = _135 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _151 = _143 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _153 = _73;
    float _155 = _107;
    float _157 = _67;
    float _159 = _97;
    if (!_149)
    {
        _153 = _151;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_149)
    {
        _155 = _103;
    }
    float _165 = _155;
    float _167 = _165;
    if (!_149)
    {
        _157 = _137;
    }
    float _169 = _157;
    float _171 = _169;
    if (!_149)
    {
        _159 = _101;
    }
    float _173 = _159;
    bool _175 = !_149;
    float _177 = _173;
    if (!_175)
    {
        float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _183 = _135 + _181;
        float _185 = _137 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = rsqrt(_129);
        float _189 = _183 * _179;
        float _191 = _189 * 0.15915493667125701904296875;
        float _193 = _191 * 6.283185482025146484375;
        float _195 = cos(_193);
        float _197 = _191 * 6.283185482025146484375;
        float _199 = sin(_197);
        float _201 = _195 + (-1.0);
        float _203 = fma(_199, _185, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _207 = _187 * _203;
        float _209 = fma(_137, _195, _205);
        float _211 = fma(_115, _207, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _213 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _215 = fma(_111, _207, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _217 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[2].x, _213);
        float _219 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[2].z, _217);
        float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _171 = _209;
        _167 = _211;
        _177 = _215;
        _163 = _221;
    }
    float _223 = _171;
    float _225 = _167;
    float _227 = _177;
    float _229 = _163;
    float _231 = _223 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _233 = _223 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _235 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[0].z, _123);
    float _237 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[1].z, _125);
    float _239 = fma(_225, (*spvDescriptorSet0.vp_c4)._m0[1].x, _231);
    float _241 = fma(_225, (*spvDescriptorSet0.vp_c4)._m0[0].x, _233);
    float _243 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[2].z, _127);
    float _245 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[1].z, _119);
    float _247 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[1].z, _239);
    float _249 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[0].z, _241);
    float _251 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[0].z, _145);
    float _253 = _245 * _245;
    float _255 = _247 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _257 = _249 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _259 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[2].z, _133);
    float _261 = fma(_251, _251, _253);
    float _263 = _255 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _265 = _237 * _237;
    float _267 = fma(_259, _259, _261);
    float _269 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[9].x, _263);
    float _271 = _255 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _273 = fma(_235, _235, _265);
    float _275 = in.m_34.x;
    float _277 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[9].z, _269);
    float _279 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[10].x, _271);
    float _281 = fma(_243, _243, _273);
    float _283 = rsqrt(_267);
    float _285 = _277 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _287 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[10].z, _279);
    float _289 = in.m_34.y;
    float _291 = _255 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _293 = _285 * 10000.0;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _287 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _299 = in.m_36.x;
    float _301 = rsqrt(_281);
    float _303 = _295 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _305 = _255 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _307 = in.m_32.w;
    float _309 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[7].x, _291);
    float _311 = fma(_303, (*spvDescriptorSet0.vp_c4)._m0[10].z, _297);
    float _313 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[8].x, _305);
    float _315 = fma(_303, (*spvDescriptorSet0.vp_c4)._m0[9].z, _285);
    float _317 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[7].z, _309);
    float _319 = _259 * _283;
    float _321 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[8].z, _313);
    float _323 = 1.0 / _311;
    float _325 = _251 * _283;
    float _327 = _245 * _283;
    out.m_39.x = _275;
    float _329 = _317 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _331 = _237 * _301;
    float _333 = _321 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    out.m_39.y = _289;
    float _335 = _243 * _301;
    out.m_41.x = _299;
    float _337 = _297 * _323;
    float _339 = _235 * _301;
    out.m_43.w = _307;
    float _341 = _315 * _337;
    out.m_45.x = _103;
    out.m_45.y = _137;
    out.m_45.z = _101;
    out.m_47.x = _325;
    out.m_47.y = _327;
    out.m_47.z = _319;
    out.m_43.x = _339;
    out.m_43.y = _331;
    out.m_43.z = _335;
    out.gl_Position.x = _329;
    out.gl_Position.y = _333;
    out.gl_Position.z = _341;
    out.gl_Position.w = _297;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _61 = in.m_28.x;
    float _63 = in.m_28.y;
    float _65 = in.m_28.z;
    float _67 = in.m_30.x;
    float _69 = in.m_30.y;
    float _71 = in.m_30.z;
    float _73 = in.m_32.x;
    float _75 = in.m_32.y;
    float _77 = in.m_32.z;
    float _79 = _63 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _81 = _63 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _83 = _63 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _85 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[2].x, _79);
    float _87 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[0].x, _81);
    float _89 = fma(_61, (*spvDescriptorSet0.vp_c7)._m0[1].x, _83);
    float _91 = _69 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _93 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[2].z, _85);
    float _95 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[0].z, _87);
    float _97 = _69 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _99 = _75 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _101 = _93 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _103 = _95 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _105 = _75 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _107 = _69 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _109 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _111 = _101 + _109;
    float _113 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _115 = _103 + _113;
    float _117 = _75 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _119 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[1].x, _91);
    float _121 = _111 * _111;
    float _123 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[0].x, _99);
    float _125 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[1].x, _105);
    float _127 = fma(_73, (*spvDescriptorSet0.vp_c7)._m0[2].x, _117);
    float _129 = fma(_115, _115, _121);
    float _131 = fma(_65, (*spvDescriptorSet0.vp_c7)._m0[1].z, _89);
    float _133 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[2].x, _107);
    float _135 = sqrt(_129);
    float _137 = _131 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _139 = _137 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _141 = fma(_103, (*spvDescriptorSet0.vp_c4)._m0[2].x, _139);
    float _143 = fma(_101, (*spvDescriptorSet0.vp_c4)._m0[2].z, _141);
    float _145 = fma(_67, (*spvDescriptorSet0.vp_c7)._m0[0].x, _97);
    bool _149 = _135 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _151 = _143 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _153 = _73;
    float _155 = _107;
    float _157 = _67;
    float _159 = _97;
    if (!_149)
    {
        _153 = _151;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_149)
    {
        _155 = _103;
    }
    float _165 = _155;
    float _167 = _165;
    if (!_149)
    {
        _157 = _137;
    }
    float _169 = _157;
    float _171 = _169;
    if (!_149)
    {
        _159 = _101;
    }
    float _173 = _159;
    bool _175 = !_149;
    float _177 = _173;
    if (!_175)
    {
        float _179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _181 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _183 = _135 + _181;
        float _185 = _137 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _187 = rsqrt(_129);
        float _189 = _183 * _179;
        float _191 = _189 * 0.15915493667125701904296875;
        float _193 = _191 * 6.283185482025146484375;
        float _195 = cos(_193);
        float _197 = _191 * 6.283185482025146484375;
        float _199 = sin(_197);
        float _201 = _195 + (-1.0);
        float _203 = fma(_199, _185, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _207 = _187 * _203;
        float _209 = fma(_137, _195, _205);
        float _211 = fma(_115, _207, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _213 = _209 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _215 = fma(_111, _207, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _217 = fma(_211, (*spvDescriptorSet0.vp_c4)._m0[2].x, _213);
        float _219 = fma(_215, (*spvDescriptorSet0.vp_c4)._m0[2].z, _217);
        float _221 = _219 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _171 = _209;
        _167 = _211;
        _177 = _215;
        _163 = _221;
    }
    float _223 = _171;
    float _225 = _167;
    float _227 = _177;
    float _229 = _163;
    float _231 = _223 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _233 = _223 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _235 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[0].z, _123);
    float _237 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[1].z, _125);
    float _239 = fma(_225, (*spvDescriptorSet0.vp_c4)._m0[1].x, _231);
    float _241 = fma(_225, (*spvDescriptorSet0.vp_c4)._m0[0].x, _233);
    float _243 = fma(_77, (*spvDescriptorSet0.vp_c7)._m0[2].z, _127);
    float _245 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[1].z, _119);
    float _247 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[1].z, _239);
    float _249 = fma(_227, (*spvDescriptorSet0.vp_c4)._m0[0].z, _241);
    float _251 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[0].z, _145);
    float _253 = _245 * _245;
    float _255 = _247 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _257 = _249 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _259 = fma(_71, (*spvDescriptorSet0.vp_c7)._m0[2].z, _133);
    float _261 = fma(_251, _251, _253);
    float _263 = _255 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _265 = _237 * _237;
    float _267 = fma(_259, _259, _261);
    float _269 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[9].x, _263);
    float _271 = _255 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _273 = fma(_235, _235, _265);
    float _275 = in.m_34.x;
    float _277 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[9].z, _269);
    float _279 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[10].x, _271);
    float _281 = fma(_243, _243, _273);
    float _283 = rsqrt(_267);
    float _285 = _277 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _287 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[10].z, _279);
    float _289 = in.m_34.y;
    float _291 = _255 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _293 = _285 * 10000.0;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _287 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _299 = in.m_36.x;
    float _301 = rsqrt(_281);
    float _303 = _295 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _305 = _255 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _307 = in.m_32.w;
    float _309 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[7].x, _291);
    float _311 = fma(_303, (*spvDescriptorSet0.vp_c4)._m0[10].z, _297);
    float _313 = fma(_257, (*spvDescriptorSet0.vp_c4)._m0[8].x, _305);
    float _315 = fma(_303, (*spvDescriptorSet0.vp_c4)._m0[9].z, _285);
    float _317 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[7].z, _309);
    float _319 = _259 * _283;
    float _321 = fma(_229, (*spvDescriptorSet0.vp_c4)._m0[8].z, _313);
    float _323 = 1.0 / _311;
    float _325 = _251 * _283;
    float _327 = _245 * _283;
    out.m_39.x = _275;
    float _329 = _317 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _331 = _237 * _301;
    float _333 = _321 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    out.m_39.y = _289;
    float _335 = _243 * _301;
    out.m_41.x = _299;
    float _337 = _297 * _323;
    float _339 = _235 * _301;
    out.m_43.w = _307;
    float _341 = _315 * _337;
    out.m_45.x = _103;
    out.m_45.y = _137;
    out.m_45.z = _101;
    out.m_47.x = _325;
    out.m_47.y = _327;
    out.m_47.z = _319;
    out.m_43.x = _339;
    out.m_43.y = _331;
    out.m_43.z = _335;
    out.gl_Position.x = _329;
    out.gl_Position.y = _333;
    out.gl_Position.z = _341;
    out.gl_Position.w = _297;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

