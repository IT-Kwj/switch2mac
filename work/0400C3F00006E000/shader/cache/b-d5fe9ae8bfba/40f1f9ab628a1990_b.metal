#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_102 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_98 [[user(locn15)]];
    float4 m_96 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4119 = false;
    bool _685 = false;
    bool _541 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4429 = as_type<float>(_145);
        out.gl_Position.z = _4429;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4492 = as_type<float>(_177);
        out.gl_Position.z = _4492;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = _183 * _189;
    bool _217 = !_211;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _215);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    float _229 = fma(_185, _191, _223);
    float _231 = fma(_181, _199, _225);
    float _233 = fma(_185, _197, _227);
    float _235 = fma(_185, _203, _231);
    bool _237 = !_207;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = 1.0 / _271;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _275;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _263 + _295;
    float _299 = 1.0 / _279;
    float _301 = _297 * _285;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _283;
    float _317 = _267 * _293;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _263 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _263 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _329 = _263 + _327;
    float _331 = 1.0 / _289;
    float _333 = _321 * _299;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_263);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _325 * _315;
    float _361 = -_313;
    float _363 = _361 + 1.0;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _345 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = _329 * _331;
    bool _385 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_263);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _357 * _367;
    float _399 = fma(_377, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _403 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_263);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _395 * _371;
    float _417 = -_395;
    float _419 = _417 + 1.0;
    bool _421 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _423 = isnan(_263);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = _413 * _419;
    float _443 = -_413;
    float _445 = _443 + 1.0;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = fma(_435, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = fma(_439, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = _431 * _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _461;
    float _465 = _399 * _455;
    float _467 = _401 * _455;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _465);
    float _475 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _481 = fma(_459, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_463, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = fma(_451, _441, _473);
    float _487 = fma(_453, _441, _475);
    float _489 = fma(_479, _359, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_471, _359, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _497;
    float _501 = fma(_481, _415, _485);
    float _503 = fma(_483, _415, _487);
    float _505 = fma(_495, _383, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _507 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _509 = fma(_489, _397, _501);
    float _511 = fma(_491, _397, _503);
    float _513 = fma(_505, _373, _509);
    float _515 = fma(_507, _373, _511);
    float _517 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].x, _513);
    float _519 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].y, _515);
    bool _521 = !_291;
    float _539;
    if (!_521)
    {
        float _523 = in.m_66.x;
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        _539 = _171;
    }
    _541 = false;
    float _543 = _539;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _549 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_543);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_543);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _547;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _579;
    float _583 = -_559;
    float _585 = _583 + 1.0;
    bool _587 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _589 = isnan(_543);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _601 = 1.0 / _563;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = _581 * _577;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _543 + _609;
    float _613 = fma(_607, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _615 = _575 * _585;
    float _617 = -_575;
    float _619 = _617 + 1.0;
    float _621 = _605 * _601;
    float _623 = -_597;
    float _625 = _623 + 1.0;
    float _627 = _613 * _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _543 + _629;
    float _633 = _559 * _625;
    float _635 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _637 = fma(_621, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _641 = fma(_637, _633, _635);
    float _643 = in.m_68.x;
    float _645 = in.m_68.y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[117].x, _641);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _659 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _649;
    out.m_70.y = _655;
    out.m_70.z = _659;
    out.m_70.w = _657;
    float _661 = _519 * _645;
    float _663 = _517 * _643;
    bool _665 = !_599;
    float _683;
    if (!_665)
    {
        float _667 = in.m_66.x;
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _671 = _667 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _675 = _673 * _669;
        float _677 = floor(_675);
        float _679 = -_677;
        float _681 = _675 + _679;
        _683 = _681;
        _685 = true;
    }
    else
    {
        _683 = _171;
    }
    _685 = false;
    float _687 = _683;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _691 = _687 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _707 = isnan(_687);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _695;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _723 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _725 = isnan(_687);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _737 = 1.0 / _703;
    float _739 = _699 * _717;
    bool _741 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _743 = isnan(_687);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _721;
    float _755 = -_715;
    float _757 = _755 + 1.0;
    float _759 = fma(_739, _691, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _765 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _767 = isnan(_687);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = _751 * _757;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _787 = 1.0 / _763;
    float _789 = -_775;
    float _791 = _789 + 1.0;
    float _793 = _733 * _779;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _795;
    float _799 = _785 * _737;
    float _801 = _715 * _791;
    float _803 = _759 * _793;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = _687 + _805;
    float _809 = -_733;
    float _811 = _809 + 1.0;
    bool _813 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _815 = isnan(_687);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = _797 * _753;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _833 = _687 + _831;
    float _835 = fma(_799, _807, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _837 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[131].x, _803);
    float _839 = -_823;
    float _841 = _839 + 1.0;
    float _843 = _829 * _787;
    float _845 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _849 = _687 + _847;
    float _851 = fma(_835, _781, _837);
    float _853 = _775 * _841;
    float _855 = fma(_843, _849, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _857 = fma(_845, _801, _851);
    float _859 = fma(_855, _853, _857);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _867 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[135].x, _859);
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _869;
    out.m_72.y = _871;
    out.m_72.z = _873;
    out.m_72.w = _875;
    bool _877 = !_735;
    float _879 = _823;
    float _881 = _843;
    if (!_877)
    {
        float _883 = in.m_66.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _173 = _897;
    }
    float _899 = _173;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _903 = int(_901);
    float _905 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _907 = int(_905);
    float _909 = float(_903);
    float _911 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _913 = int(_911);
    float _915 = float(uint(_907));
    float _917 = 1.0 / _909;
    float _919 = 1.0 / _915;
    float _921 = float(_913);
    float _923 = _917 * _127;
    float _925 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _927 = int(_925);
    int _929 = as_type<int>(_919) + (-2);
    float _931 = trunc(_923);
    int _933 = int(_931);
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _937 = _935 != 0;
    float _939 = 1.0 / _921;
    float _941 = float(uint(_927));
    int _943 = ~_927;
    int _945 = _943 + 1;
    float _947 = float(uint(_933));
    float _949 = 1.0 / _941;
    int _951 = ~_907;
    int _953 = _951 + 1;
    float _955 = 0.0;
    float _957 = 0.0;
    if (_937)
    {
        float _959 = in.m_66.x;
        float _961 = in.m_66.y;
        _955 = _959;
        _957 = _961;
    }
    float _963 = _955;
    float _965 = _957;
    if (_937)
    {
        _879 = 1.0;
    }
    float _967 = _879;
    float _969 = as_type<float>(_929) * _947;
    float _971 = _939 * _127;
    float _973 = trunc(_969);
    float _975 = precise::max(_973, 0.0);
    uint _978 = uint(_975);
    float _980 = trunc(_971);
    int _982 = int(_980);
    int _984 = as_type<int>(_949) + (-2);
    int _986 = as_type<int>(_969);
    float _988 = _967;
    if (_937)
    {
        _986 = 0;
    }
    int _990 = _986;
    int _992 = _953 * int(_978);
    int _994 = _992 + _933;
    float _996 = _963;
    float _998 = _965;
    int _1000 = _990;
    if (_937)
    {
        _881 = _963;
    }
    float _1002 = _881;
    float _1004 = float(uint(_994));
    float _1006 = float(uint(_982));
    float _1008 = as_type<float>(_929) * _1004;
    float _1010 = _1004;
    float _1012 = _1006;
    float _1014 = _1002;
    if (_937)
    {
        _1010 = _965;
    }
    float _1016 = _1010;
    float _1018 = as_type<float>(_984) * _1006;
    float _1020 = trunc(_1008);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = _1016;
    if (_937)
    {
        _1012 = _1002;
    }
    float _1028 = _1012;
    float _1030 = trunc(_1018);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = _1028;
    if (!_937)
    {
        float _1038 = in.m_66.x;
        float _1040 = in.m_66.y;
        float _1042 = _1038 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _1040 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        _988 = 7.345489978790283203125;
        _996 = _1038;
        _1014 = _1040;
        _1026 = _1056;
        _998 = _1040;
        _1000 = 1;
        _1036 = _1052;
    }
    float _1058 = _988;
    float _1060 = _996;
    float _1062 = _1014;
    float _1064 = _1026;
    float _1066 = _998;
    int _1068 = _1000;
    float _1070 = _1036;
    int _1072 = _945 * int(_1034);
    int _1074 = _1072 + _982;
    float _1076 = _1058 * _1060;
    int _1078 = int(_978) + int(_1024);
    float _1080 = _1058 * _1062;
    float _1082 = float(_907);
    float _1084 = floor(_1076);
    float _1086 = float(uint(_1074));
    float _1088 = _167 * _127;
    int _1090 = ~_907;
    int _1092 = _1090 + 1;
    float _1094 = _1060 * 2.0;
    float _1096 = float(_933);
    float _1098 = as_type<float>(_984) * _1086;
    bool _1100 = _907 == 0;
    int _1102 = _1092 * _1078;
    int _1104 = _1102 + _933;
    bool _1106 = _1096 >= _1082;
    bool _1108 = isnan(_1096);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1082);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = floor(_1094);
    bool _1120 = uint(_1104) >= uint(_907);
    float _1122 = -_1084;
    float _1124 = _1076 + _1122;
    float _1126 = trunc(_1098);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    bool _1132 = !_1120;
    int _1134 = _1132 ? 0 : (-1);
    float _1136 = _1124 * _1082;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1140 = _1138 != 0;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1144 = ~_1078;
    int _1146 = _1144 + _1134;
    int _1148 = _1146 + 1;
    int _1150 = ~_927;
    int _1152 = _1150 + 1;
    float _1154 = trunc(_1116);
    int _1156 = int(_1154);
    bool _1158 = !_1140;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _907 * _1148;
    int _1164 = _1162 + _933;
    float _1166 = float(_927);
    int _1168 = abs(_1160);
    bool _1170 = !_1100;
    int _1172 = _1170 ? _1164 : (-1);
    float _1174 = trunc(_1136);
    int _1176 = int(_1174);
    int _1178 = int(_1034) + int(_1130);
    float _1180 = float(_982);
    int _1182 = _1152 * _1178;
    int _1184 = _1182 + _982;
    bool _1186 = _1180 >= _1166;
    bool _1188 = isnan(_1180);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(_1166);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1082 * _1088;
    bool _1200 = uint(_1184) >= uint(_927);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1204 = ~_1156;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = floor(_1080);
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1222 = _1220 != 0;
    int _1224 = _1176 * _1168;
    int _1226 = _1224 + _933;
    int _1228 = _907 + (-1);
    int _1230 = _1172 * _1208;
    bool _1232 = !_1218;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = trunc(_1198);
    int _1238 = int(_1236);
    int _1240 = _1156 * _1228;
    int _1242 = _1240 + _1230;
    bool _1244 = !_1214;
    int _1246 = _1244 ? 0 : 1;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1250 = abs(_1234);
    bool _1252 = !_1222;
    int _1254 = _1252 ? 0 : 1;
    int _1256 = abs(_1246);
    int _1258 = _1242 * _1250;
    int _1260 = abs(_1254);
    float _1262 = trunc(_1196);
    int _1264 = int(_1262);
    float _1266 = -_1210;
    float _1268 = _1080 + _1266;
    bool _1270 = !_1200;
    int _1272 = _1270 ? 0 : (-1);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1276 = _1274 != 0;
    int _1278 = _1238 * _1256;
    int _1280 = _1278 + _1258;
    float _1282 = _1166 * _1088;
    int _1284 = ~_1178;
    int _1286 = _1284 + _1272;
    int _1288 = _1286 + 1;
    float _1290 = _1268 * _1166;
    bool _1292 = !_1276;
    int _1294 = _1292 ? 0 : 1;
    int _1296 = _1226 * _1260;
    int _1298 = _1296 + _1280;
    bool _1300 = _927 == 0;
    float _1302 = trunc(_1282);
    int _1304 = int(_1302);
    int _1306 = abs(_1294);
    int _1308 = _927 * _1288;
    int _1310 = _1308 + _982;
    int _1312 = ~_1264;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1332 = _1330 != 0;
    int _1334 = _1176 * _1306;
    int _1336 = _1334 + _1298;
    bool _1338 = !_1300;
    int _1340 = _1338 ? _1310 : (-1);
    float _1342 = trunc(_1290);
    int _1344 = int(_1342);
    bool _1346 = _907 == 0;
    float _1348 = float(uint(_1336));
    int _1350 = _1340 * _1316;
    bool _1352 = !_1324;
    int _1354 = _1352 ? 0 : 1;
    int _1356 = _927 + (-1);
    float _1358 = as_type<float>(_929) * _1348;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1362 = _1360 != 0;
    int _1364 = abs(_1354);
    float _1366 = trunc(_1358);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    bool _1372 = !_1362;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = _1264 * _1356;
    int _1378 = _1376 + _1350;
    bool _1380 = !_1320;
    int _1382 = _1380 ? 0 : 1;
    int _1384 = abs(_1374);
    int _1386 = _1378 * _1364;
    int _1388 = abs(_1382);
    bool _1390 = !_1328;
    int _1392 = _1390 ? 0 : 1;
    int _1394 = _1304 * _1388;
    int _1396 = _1394 + _1386;
    int _1398 = ~_907;
    int _1400 = _1398 + 1;
    int _1402 = _1344 * _1384;
    int _1404 = _1402 + _982;
    bool _1406 = !_1332;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = abs(_1392);
    int _1412 = abs(_1408);
    int _1414 = _1400 * int(_1370);
    int _1416 = _1414 + _1336;
    int _1418 = ~_907;
    int _1420 = _1418 + 1;
    int _1422 = _1404 * _1410;
    int _1424 = _1422 + _1396;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1428 = _1426 != 0;
    float _1430 = float(uint(_1416));
    int _1432 = _1344 * _1412;
    int _1434 = _1432 + _1424;
    int _1436 = ~_927;
    int _1438 = _1436 + 1;
    float _1440 = as_type<float>(_929) * _1430;
    float _1442 = float(uint(_1434));
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1446 = trunc(_1440);
    float _1448 = precise::max(_1446, 0.0);
    uint _1450 = uint(_1448);
    float _1452 = as_type<float>(_984) * _1442;
    float _1454 = 0.0;
    float _1456 = as_type<float>(_1434);
    if (!_1428)
    {
        _1454 = _239;
    }
    float _1458 = _1454;
    float _1460 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1444);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1464 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1468 = trunc(_1452);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    float _1474 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1460);
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1478 = int(_1370) + int(_1450);
    float _1480 = in.m_66.w;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1490 = _1420 * _1478;
    int _1492 = _1490 + _1336;
    int _1494 = _1438 * int(_1472);
    int _1496 = _1494 + _1434;
    float _1498 = 1.0 / _1484;
    bool _1500 = uint(_1492) >= uint(_907);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1506 = float(uint(_1496));
    bool _1508 = !_1500;
    int _1510 = _1508 ? 0 : (-1);
    float _1512 = 1.0 / _1488;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1516 = _1514 != 0;
    float _1518 = as_type<float>(_984) * _1506;
    int _1520 = ~_1478;
    int _1522 = _1520 + _1510;
    int _1524 = _1522 + 1;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _907 * _1524;
    int _1538 = _1536 + _1336;
    int _1540 = ~_927;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1548;
    int _1552 = ~_907;
    int _1554 = _1552 + 1;
    float _1556 = as_type<float>(_1492);
    float _1558 = as_type<float>(_1542);
    float _1560 = _1458;
    float _1562 = _1464;
    if (_1516)
    {
        float _1564 = in.m_66.x;
        _1556 = _1564;
    }
    float _1566 = _1556;
    bool _1568 = !_1346;
    int _1570 = _1568 ? _1538 : (-1);
    float _1572 = 1.0 / _1504;
    float _1574 = 0.0;
    if (!_1516)
    {
        _1574 = _219;
    }
    float _1576 = _1574;
    int _1578 = _1570 & 3;
    bool _1580 = _1578 != 0;
    int _1582 = _1570 & 3;
    bool _1584 = _1582 != 0;
    bool _1586 = uint(_1578) > 1u;
    float _1588 = 1.0 / _1528;
    int _1590 = int(_1472) + int(_1534);
    int _1592 = _1584 ? 0 : 1;
    bool _1594 = _1480 > 0.5;
    float _1596 = _1480;
    float _1598 = _1576;
    if (_1428)
    {
        float _1600 = _1480 * 3.1415927410125732421875;
        _1596 = _1600;
    }
    float _1602 = _1596;
    int _1604 = _1542 * _1590;
    int _1606 = _1604 + _1434;
    int _1608 = ~_1592;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = 1.0 / _1546;
    int _1616 = _1612;
    if (_1428)
    {
        float _1618 = _1602 * 0.15915493667125701904296875;
        _1558 = _1618;
    }
    float _1620 = _1558;
    float _1622 = -_219;
    int _1624 = _1594 ? as_type<int>(_1622) : as_type<int>(_219);
    bool _1626 = uint(_1578) >= 2u;
    if (!_1586)
    {
        int _1628 = ~_1592;
        int _1630 = _1628 + 1;
        _1616 = _1630;
    }
    int _1632 = _1616;
    float _1634 = _1620;
    if (_1428)
    {
        float _1636 = _1620 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        _1634 = _1638;
    }
    float _1640 = _1634;
    int _1642 = _1626 ? 0 : 1;
    bool _1644 = uint(_1606) >= uint(_927);
    bool _1646 = _1578 != 3;
    bool _1648 = !_1644;
    int _1650 = _1648 ? 0 : (-1);
    int _1652 = ~_1642;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = ~_1590;
    int _1660 = _1658 + _1650;
    int _1662 = _1660 + 1;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1666 = _1664 != 0;
    int _1668 = _927 * _1662;
    int _1670 = _1668 + _1434;
    bool _1672 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1674 = isnan(_899);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    int _1684 = _1656;
    bool _1686 = _1646;
    if (_1646)
    {
        int _1688 = ~_1642;
        int _1690 = _1688 + 1;
        _1684 = _1690;
    }
    int _1692 = _1684;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1696 = _1640;
    if (_1428)
    {
        bool _1698 = _1640 > 0.5;
        _1686 = _1698;
    }
    bool _1700 = _1686;
    if (_1516)
    {
        float _1702 = _1566 * 3.1415927410125732421875;
        _1696 = _1702;
    }
    float _1704 = _1696;
    bool _1706 = !_1300;
    int _1708 = _1706 ? _1670 : (-1);
    float _1710 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1694);
    bool _1712 = !_1666;
    float _1714 = _1712 ? _219 : as_type<float>(_1624);
    if (_1516)
    {
        float _1716 = _1704 * 0.15915493667125701904296875;
        _1456 = _1716;
    }
    float _1718 = _1456;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1722 = _1720 != 0;
    float _1724 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1710);
    if (_1428)
    {
        float _1726 = -_239;
        float _1728 = _1700 ? _1726 : _239;
        _1560 = _1728;
    }
    float _1730 = _1560;
    int _1732 = _1708 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = _1718;
    if (_1516)
    {
        float _1738 = _1718 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    int _1744 = _1708 & 3;
    bool _1746 = _1744 != 0;
    bool _1748 = !_1722;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1754 = _1752 != 0;
    int _1756 = _1734 ? 0 : 1;
    bool _1758 = uint(_1744) > 1u;
    bool _1760 = !_1754;
    int _1762 = _1760 ? 0 : 1;
    bool _1764 = uint(_1744) >= 2u;
    int _1766 = ~_1756;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    int _1772 = _1764 ? 0 : 1;
    bool _1774 = _1744 != 3;
    int _1776 = ~_1772;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1770;
    bool _1784 = _1758;
    int _1786 = _1780;
    if (!_1758)
    {
        int _1788 = ~_1756;
        int _1790 = _1788 + 1;
        _1782 = _1790;
    }
    int _1792 = _1782;
    float _1794 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1516)
    {
        bool _1796 = _1742 > 0.5;
        _1784 = _1796;
    }
    bool _1798 = _1784;
    float _1800 = fma(_1794, -2.0, _1248);
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_1516)
    {
        float _1804 = -_219;
        float _1806 = _1798 ? _1804 : _219;
        _1598 = _1806;
    }
    float _1808 = _1598;
    bool _1810 = _1060 > 0.5;
    float _1812 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1800);
    if (_1774)
    {
        int _1814 = ~_1772;
        int _1816 = _1814 + 1;
        _1786 = _1816;
    }
    int _1818 = _1786;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1822 = _1820 != 0;
    float _1824 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1826 = log2(_1824);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1834 = -_239;
    int _1836 = _1810 ? as_type<int>(_1834) : as_type<int>(_239);
    bool _1838 = _1066 > 0.5;
    float _1840 = -_1142;
    float _1842 = fma(_1832, 2.0, _1840);
    float _1844 = -_219;
    int _1846 = _1838 ? as_type<int>(_1844) : as_type<int>(_219);
    float _1848 = -_127;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1842);
    bool _1852 = _1068 != 1;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1856 = in.m_66.z;
    float _1858 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1854);
    float _1860 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1866 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1858);
    float _1868 = -_1202;
    float _1870 = fma(_1860, 2.0, _1868);
    float _1872 = fma(_1464, -2.0, _1862);
    bool _1874 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1876 = isnan(_899);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1882 = _1878 || _1880;
    float _1884 = float(_1882);
    float _1886 = _1860;
    if (!_1852)
    {
        _1886 = _1066;
    }
    float _1888 = _1886;
    float _1890 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1872);
    float _1892 = _1888;
    if (_1852)
    {
        _1892 = _1060;
    }
    float _1894 = _1892;
    float _1896 = -_127;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1870);
    float _1900 = 0.0;
    if (!_1852)
    {
        _1900 = _1066;
    }
    float _1902 = _1900;
    float _1904 = _1902;
    if (_1852)
    {
        _1904 = _1060;
    }
    float _1906 = _1904;
    float _1908 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1910 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1912 = isnan(_899);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    float _1922 = -_1462;
    float _1924 = fma(_1908, 2.0, _1922);
    if (!_1852)
    {
        _1802 = _1856;
    }
    float _1926 = _1802;
    float _1928 = _1826 * _127;
    float _1930 = _1926;
    if (!_1852)
    {
        _1562 = _1856;
    }
    float _1932 = _1562;
    float _1934 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1864);
    float _1936 = _1932;
    if (_1852)
    {
        _1930 = _1066;
    }
    float _1938 = _1930;
    float _1940 = -_127;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1924);
    if (_1852)
    {
        _1936 = _1066;
    }
    float _1944 = _1936;
    float _1946 = exp2(_1928);
    bool _1948 = _1856 > 0.5;
    float _1950 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1952 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1466);
    float _1954 = -_239;
    int _1956 = _1948 ? as_type<int>(_1954) : as_type<int>(_239);
    float _1958 = fma(_1950, -2.0, _1476);
    bool _1960 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1962 = isnan(1.0);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1968 = _1964 || _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1972 = 1.0 + _1970;
    float _1974 = in.m_46.x;
    float _1976 = in.m_46.y;
    float _1978 = in.m_46.z;
    bool _1980 = !_1830;
    float _1982 = _1980 ? _239 : as_type<float>(_1956);
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1986 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1988 = isnan(0.0);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1994 = _1990 || _1992;
    float _1996 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1952);
    float _1998 = 1.0 / _1972;
    float _2000 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1984);
    float _2002 = -_1946;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1958);
    int _2008 = ~_927;
    int _2010 = _2008 + 1;
    float _2012 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2000);
    float _2014 = -_1996;
    float _2016 = _2014 + 1.0;
    float _2018 = _1994 ? _2004 : 0.0;
    float _2020 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1934);
    bool _2022 = _1118 >= 0.0;
    bool _2024 = isnan(_1118);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(0.0);
    bool _2030 = _2026 || _2028;
    float _2032 = -_2020;
    float _2034 = _2032 + 1.0;
    if (_1968)
    {
        float _2036 = _2018 * _1998;
        _137 = _2036;
    }
    float _2038 = _137;
    float _2040 = _1066 * 2.0;
    int _2042 = _2030 ? 0 : 1;
    float _2044 = _189 * _1976;
    bool _2046 = _1118 > 0.0;
    float _2048 = _195 * _1976;
    int _2050 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2052 = _2050 != 0;
    float _2054 = floor(_2040);
    float _2056 = _201 * _1976;
    float _2058 = fma(_193, _1974, _2048);
    float _2060 = fma(_187, _1974, _2044);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2066 = fma(_199, _1974, _2056);
    float _2068 = fma(_191, _1978, _2060);
    int _2070 = ~_2042;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    float _2076 = fma(_203, _1978, _2066);
    int _2078 = _2074;
    if (!_2046)
    {
        int _2080 = ~_2042;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    float _2086 = 1.0 / _2064;
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2088;
    float _2092 = fma(_197, _1978, _2058);
    bool _2094 = _2054 >= 0.0;
    bool _2096 = isnan(_2054);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = _1856 * 2.0;
    float _2106 = _2090 * _1498;
    int _2108 = _2102 ? 0 : 1;
    float _2110 = in.m_60.w;
    bool _2112 = _2054 > 0.0;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2120 = _2118 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2122 = _2116 * _1512;
    float _2124 = floor(_2104);
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2126;
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2142 = _2128 * _1572;
    int _2144 = ~_2108;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = _2136 * _1588;
    float _2152 = 1.0 / _2120;
    float _2154 = _2140 * _2086;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2158 = _899 + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2162 = _899 + _2160;
    int _2164 = _2148;
    if (!_2112)
    {
        int _2166 = ~_2108;
        int _2168 = _2166 + 1;
        _2164 = _2168;
    }
    int _2170 = _2164;
    float _2172 = _2132 * _1614;
    float _2174 = fma(_2106, _2158, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2176 = float(uint(_1226));
    float _2178 = fma(_2122, _2162, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2180 = _2124 >= 0.0;
    bool _2182 = isnan(_2124);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(0.0);
    bool _2188 = _2184 || _2186;
    float _2190 = _2068 + _2110;
    bool _2192 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2194 = isnan(_899);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2200 = _2196 || _2198;
    float _2202 = float(_2200);
    float _2204 = as_type<float>(_929) * _2176;
    int _2206 = _2188 ? 0 : 1;
    bool _2208 = _2124 > 0.0;
    float _2210 = _1550 * _2152;
    float _2212 = float(uint(_1404));
    float _2214 = trunc(_2204);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    bool _2220 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2222 = isnan(_899);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2228 = _2224 || _2226;
    float _2230 = float(_2228);
    float _2232 = -_2202;
    float _2234 = _2232 + 1.0;
    bool _2236 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2238 = isnan(_899);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2244 = _2240 || _2242;
    float _2246 = float(_2244);
    float _2248 = as_type<float>(_984) * _2212;
    bool _2250 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2252 = isnan(_899);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2258 = _2254 || _2256;
    float _2260 = float(_2258);
    float _2262 = _2230 * _2234;
    float _2264 = -_2230;
    float _2266 = _2264 + 1.0;
    float _2268 = -_2246;
    float _2270 = _2268 + 1.0;
    bool _2272 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2274 = isnan(_899);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    float _2284 = trunc(_2248);
    float _2286 = precise::max(_2284, 0.0);
    uint _2288 = uint(_2286);
    float _2290 = _2260 * _2266;
    float _2292 = _1682 * _2270;
    float _2294 = -_2260;
    float _2296 = _2294 + 1.0;
    float _2298 = -_1682;
    float _2300 = _2298 + 1.0;
    float _2302 = -_2282;
    float _2304 = _2302 + 1.0;
    int _2306 = _1554 * int(_2218);
    int _2308 = _2306 + _1226;
    float _2310 = _2282 * _2296;
    float _2312 = _1884 * _2300;
    float _2314 = _2246 * _2304;
    float _2316 = -_1884;
    float _2318 = _2316 + 1.0;
    float _2320 = float(uint(_2308));
    float _2322 = in.m_62.w;
    float _2324 = float(_2084);
    float _2326 = _1920 * _2318;
    int _2328 = _2010 * int(_2288);
    int _2330 = _2328 + _1404;
    float _2332 = as_type<float>(_929) * _2320;
    float _2334 = in.m_64.w;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2338 = _899 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2342 = _899 + _2340;
    float _2344 = float(uint(_2330));
    float _2346 = _2174 * _2326;
    float _2348 = fma(_2142, _2338, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2350 = fma(_2172, _2342, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2352 = trunc(_2332);
    float _2354 = precise::max(_2352, 0.0);
    uint _2356 = uint(_2354);
    float _2358 = as_type<float>(_984) * _2344;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2362 = _899 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2366 = _899 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2370 = _899 + _2368;
    float _2372 = -_1920;
    float _2374 = _2372 + 1.0;
    float _2376 = fma(_2154, _2362, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2378 = fma(_2150, _2366, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2380 = trunc(_2358);
    float _2382 = precise::max(_2380, 0.0);
    uint _2384 = uint(_2382);
    float _2386 = fma(_2210, _2370, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2388 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2346);
    int _2390 = ~_2206;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    float _2396 = _2092 + _2322;
    int _2398 = _2394;
    if (!_2208)
    {
        int _2400 = ~_2206;
        int _2402 = _2400 + 1;
        _2398 = _2402;
    }
    int _2404 = _2398;
    float _2406 = fma(_2178, _2312, _2388);
    int _2408 = ~_907;
    int _2410 = _2408 + 1;
    float _2412 = _1730 + 0.5;
    float _2414 = _2076 + _2334;
    float _2416 = fma(_2348, _2292, _2406);
    int _2418 = int(_2218) + int(_2356);
    float _2420 = _1808 + (-0.5);
    float _2422 = fma(_2350, _2314, _2416);
    int _2424 = ~_927;
    int _2426 = _2424 + 1;
    float _2428 = _1066 + _1060;
    int _2430 = int(_2288) + int(_2384);
    int _2432 = _2410 * _2418;
    int _2434 = _2432 + _1226;
    float _2436 = _2428 + (-1.0);
    int _2438 = _1570 >> 31;
    int _2440 = _2426 * _2430;
    int _2442 = _2440 + _1404;
    bool _2444 = !_2052;
    float _2446 = _2444 ? _239 : as_type<float>(_1836);
    float _2448 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2450 = uint(_2434) >= uint(_907);
    float _2452 = fma(_2378, _2310, _2422);
    bool _2454 = !_1822;
    float _2456 = _2454 ? _219 : as_type<float>(_1846);
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2460 = _2190 + _2458;
    bool _2462 = uint(_2442) >= uint(_927);
    float _2464 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1898);
    bool _2466 = !_2450;
    int _2468 = _2466 ? 0 : (-1);
    float _2470 = -_2420;
    float _2472 = -_1890;
    float _2474 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2472);
    int _2476 = _2438 & 3;
    float _2478 = _2456 + (-0.5);
    int _2480 = _1708 >> 31;
    float _2482 = fma(_2376, _2290, _2452);
    bool _2484 = _1578 != 3;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2488 = _2396 + _2486;
    int _2490 = _1570 + _2476;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2494 = _2480 & 3;
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2498 = _2490 >> 2;
    float _2500 = -_1866;
    float _2502 = _2500 + 1.0;
    int _2504 = _1708 + _2494;
    float _2506 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2496);
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2510 = _2414 + _2508;
    int _2512 = _2498 << 4;
    int _2514 = _2512 + 368;
    float _2516 = -_1474;
    float _2518 = _2516 + 1.0;
    int _2520 = _2504 >> 2;
    float _2522 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2506);
    bool _2524 = !_2462;
    int _2526 = _2524 ? 0 : (-1);
    uint _2528 = uint(int(uint(_2514) >> uint(2)));
    uint _2530 = uint(int(uint(int(_2528)) >> uint(2)));
    int _2532 = int(_2528) & 3;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[int(_2530)][_2532];
    int _2536 = int(_2528) + 1;
    uint _2538 = uint(int(uint(_2536) >> uint(2)));
    int _2540 = _2536 & 3;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[int(_2538)][_2540];
    bool _2544 = _1744 != 3;
    float _2546 = fma(_2518, _1808, _2474);
    int _2548 = _2520 << 4;
    int _2550 = _2548 + 800;
    float _2552 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2556 = _2554 != 0;
    int _2558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2560 = _2558 != 0;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2564 = _2562 != 0;
    float _2566 = _1982 + 0.5;
    bool _2568 = !_2544;
    int _2570 = _2568 ? 0 : (-1);
    uint _2572 = uint(int(uint(_2550) >> uint(2)));
    uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
    int _2576 = int(_2572) & 3;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[int(_2574)][_2576];
    int _2580 = int(_2572) + 1;
    uint _2582 = uint(int(uint(_2580) >> uint(2)));
    int _2584 = _2580 & 3;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[int(_2582)][_2584];
    bool _2588 = _2522 >= 0.0;
    float _2590 = _2446 + 0.5;
    float _2592 = fma(_2386, _2262, _2482);
    float _2594 = fma(_2552, _2566, _1942);
    bool _2596 = !_1580;
    int _2598 = _2596 ? 0 : 1;
    float _2600 = fma(_2590, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1850);
    float _2602 = -_2478;
    float _2604 = -_1812;
    float _2606 = fma(_2602, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2604);
    float _2608 = -_2502;
    float _2610 = fma(_2608, _1730, _2464);
    int _2612 = _2514 + 8;
    uint _2614 = uint(int(uint(_2612) >> uint(2)));
    uint _2616 = uint(int(uint(int(_2614)) >> uint(2)));
    int _2618 = int(_2614) & 3;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[int(_2616)][_2618];
    int _2622 = int(_2614) + 1;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    int _2626 = _2622 & 3;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[int(_2624)][_2626];
    int _2630 = abs(_1632);
    float _2632 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2592);
    int _2634 = abs(_1792);
    float _2636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2638 = _2452;
    if (_2588)
    {
        _2638 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2640 = _2638;
    float _2642 = _1714 + (-0.5);
    int _2644 = _2550 + 8;
    uint _2646 = uint(int(uint(_2644) >> uint(2)));
    uint _2648 = uint(int(uint(int(_2646)) >> uint(2)));
    int _2650 = int(_2646) & 3;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[int(_2648)][_2650];
    int _2654 = int(_2646) + 1;
    uint _2656 = uint(int(uint(_2654) >> uint(2)));
    int _2658 = _2654 & 3;
    float _2660 = (*spvDescriptorSet0.vp_c9)._m0[int(_2656)][_2658];
    int _2662 = abs(_2598);
    out.m_74.x = _2610;
    out.m_74.y = _2546;
    int _2664 = as_type<int>(_2640);
    if (_2588)
    {
        float _2666 = _2640 * 5.0;
        _2664 = as_type<int>(_2666);
    }
    int _2668 = _2664;
    bool _2670 = !_2484;
    int _2672 = _2670 ? 0 : (-1);
    out.m_76.x = _2632;
    bool _2674 = !_1746;
    int _2676 = _2674 ? 0 : 1;
    int _2678 = abs(_2672);
    if (_2588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8211 = as_type<float>(_2668);
        out.gl_Position.z = _8211;
    }
    int _2680 = ~_2430;
    int _2682 = _2680 + _2526;
    int _2684 = _2682 + 1;
    float _2686 = _2636 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2688 = ~_2418;
    int _2690 = _2688 + _2468;
    int _2692 = _2690 + 1;
    if (_2588)
    {
        out.m_53.x = 0.0;
    }
    bool _2694 = _907 == 0;
    int _2696 = _927 * _2684;
    int _2698 = _2696 + _1404;
    bool _2700 = !_2560;
    int _2702 = _2700 ? 0 : 1;
    int _2704 = _907 * _2692;
    int _2706 = _2704 + _1226;
    float _2708 = -_2686;
    float _2710 = -_2006;
    float _2712 = fma(_2708, _2642, _2710);
    float _2714 = float(_2404);
    int _2716 = ~_2630;
    int _2718 = _2716 + 1;
    int _2720 = _2718 + 1;
    int _2722 = ~_2662;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    int _2728 = _2720 * as_type<int>(_2542);
    int _2730 = ~_2634;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    int _2736 = abs(_2676);
    int _2738 = _2726 * as_type<int>(_2534);
    int _2740 = _2738 + _2728;
    int _2742 = abs(_1692);
    int _2744 = _2734 * as_type<int>(_2586);
    int _2746 = abs(_1818);
    int _2748 = ~_2742;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    int _2754 = ~_2736;
    int _2756 = _2754 + 1;
    int _2758 = _2756 + 1;
    int _2760 = _2752 * as_type<int>(_2620);
    int _2762 = _2760 + _2740;
    int _2764 = ~_2678;
    int _2766 = _2764 + 1;
    int _2768 = _2766 + 1;
    float _2770 = _2488 * _2488;
    int _2772 = abs(_2570);
    int _2774 = _2758 * as_type<int>(_2578);
    int _2776 = _2774 + _2744;
    int _2778 = ~_2746;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    int _2784 = _2768 * as_type<int>(_2628);
    int _2786 = _2784 + _2762;
    int _2788 = abs(_1750);
    float _2790 = fma(_2460, _2460, _2770);
    int _2792 = ~_2772;
    int _2794 = _2792 + 1;
    int _2796 = _2794 + 1;
    int _2798 = _2782 * as_type<int>(_2652);
    int _2800 = _2798 + _2776;
    int _2802 = abs(_2702);
    float _2804 = fma(_2510, _2510, _2790);
    int _2806 = abs(_1762);
    int _2808 = _2796 * as_type<int>(_2660);
    int _2810 = _2808 + _2800;
    int _2812 = ~_2788;
    int _2814 = _2812 + 1;
    int _2816 = _2814 + 1;
    float _2818 = float(_2802);
    float _2820 = rsqrt(_2804);
    bool _2822 = !_2694;
    int _2824 = _2822 ? _2706 : (-1);
    int _2826 = _2786 * _2816;
    int _2828 = ~_2806;
    int _2830 = _2828 + 1;
    int _2832 = _2830 + 1;
    float _2834 = -_1724;
    float _2836 = _2834 + 1.0;
    bool _2838 = _927 == 0;
    int _2840 = _2824 * _2788;
    int _2842 = _2840 + _2826;
    float _2844 = -_2012;
    float _2846 = _2844 + 1.0;
    int _2848 = _2810 * _2832;
    bool _2850 = !_2838;
    int _2852 = _2850 ? _2698 : (-1);
    float _2854 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2856 = -_2034;
    float _2858 = fma(_1982, _2856, _2594);
    float _2860 = fma(_2456, _2836, _2606);
    float _2862 = _2818 * _2324;
    int _2864 = _2852 * _2806;
    int _2866 = _2864 + _2848;
    float _2868 = -_2846;
    float _2870 = fma(_2446, _2868, _2600);
    bool _2872 = !_2556;
    int _2874 = _2872 ? 0 : 1;
    float _2876 = _2854 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2878 = abs(_2874);
    float _2880 = _2876 * _2820;
    float _2882 = in.m_78.x;
    float _2884 = in.m_78.y;
    float _2886 = in.m_78.z;
    float _2888 = fma(_1714, _2016, _2712);
    float _2890 = _2488 * _2880;
    float _2892 = _2460 * _2880;
    float _2894 = float(_2842);
    out.m_80.x = _2870;
    out.m_80.y = _2860;
    out.m_80.z = _2858;
    out.m_80.w = _2888;
    float _2896 = -_2890;
    float _2898 = _2488 + _2896;
    float _2900 = float(_2866);
    float _2902 = -_2892;
    float _2904 = _2460 + _2902;
    float _2906 = float(_2878);
    float _2908 = _2898 * _2898;
    out.m_82.x = _2894;
    float _2910 = _1060 + (-0.5);
    bool _2912 = !_2564;
    int _2914 = _2912 ? 0 : 1;
    float _2916 = _2906 * _2714;
    out.m_82.w = _2900;
    float _2918 = fma(_2904, _2904, _2908);
    if (_2588)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2920 = _2916 * (-2.0);
    float _2922 = -_2890;
    float _2924 = _2396 + _2922;
    float _2926 = _2510 * _2880;
    float _2928 = -_2892;
    float _2930 = _2190 + _2928;
    float _2932 = fma(_2920, _2882, _2882);
    float _2934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2936 = _2924 + _2934;
    float _2938 = fma(_2448, _2920, _2448);
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2942 = _2930 + _2940;
    float _2944 = fma(_2910, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2932);
    float _2946 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2948 = -_2926;
    float _2950 = _2414 + _2948;
    float _2952 = _1066 + _1856;
    float _2954 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2946);
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2958 = _2950 + _2956;
    float _2960 = _2952 + (-1.0);
    int _2962 = abs(_2914);
    float _2964 = _1066 + (-0.5);
    float _2966 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2954);
    float _2968 = _2862 * (-2.0);
    float _2970 = fma(_2960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2972 = float(_2170);
    float _2974 = -_2926;
    float _2976 = _2510 + _2974;
    float _2978 = fma(_2968, _2884, _2884);
    float _2980 = float(_2962);
    float _2982 = fma(_2970, _2968, _2970);
    bool _2984 = _2966 >= 0.0;
    float _2986 = fma(_2964, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2978);
    float _2988 = fma(_2938, _2038, _2944);
    float _2990 = _2980 * _2972;
    float _2992 = _1856 + _1060;
    float _2994 = fma(_2982, _2038, _2986);
    float _2996 = _2990 * (-2.0);
    float _2998 = fma(_2976, _2976, _2918);
    float _3000 = _2988 * 0.15915493667125701904296875;
    float _3002 = _2992 + (-1.0);
    float _3004 = _2994 * 0.15915493667125701904296875;
    float _3006 = fma(_2996, _2886, _2886);
    float _3008 = _1856 + (-0.5);
    float _3010 = _2990;
    float _3012 = _2926;
    if (_2984)
    {
        _3010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3014 = _3010;
    float _3016 = sqrt(_2998);
    float _3018 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3020 = fma(_3008, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3006);
    int _3022 = as_type<int>(_3014);
    if (_2984)
    {
        out.m_53.x = 0.0;
    }
    float _3024 = fma(_3018, _2996, _3018);
    if (_2984)
    {
        float _3026 = _3014 * 5.0;
        _3022 = as_type<int>(_3026);
    }
    int _3028 = _3022;
    float _3030 = _3000 * 6.283185482025146484375;
    float _3032 = sin(_3030);
    float _3034 = fma(_3024, _2038, _3020);
    if (_2984)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8732 = as_type<float>(_3028);
        out.gl_Position.z = _8732;
    }
    float _3036 = _3034 * 0.15915493667125701904296875;
    float _3038 = _3000 * 6.283185482025146484375;
    float _3040 = cos(_3038);
    float _3042 = _3004 * 6.283185482025146484375;
    float _3044 = sin(_3042);
    float _3046 = _3004 * 6.283185482025146484375;
    float _3048 = cos(_3046);
    if (_2984)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3050 = _3036 * 6.283185482025146484375;
    float _3052 = cos(_3050);
    float _3054 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3056 = _2820 * _3016;
    float _3058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _3060 = _3032 * _3044;
    float _3062 = _3040 * _3044;
    float _3064 = _3056 * _3054;
    float _3066 = _2854 * _3056;
    float _3068 = _3036 * 6.283185482025146484375;
    float _3070 = sin(_3068);
    float _3072 = _3032 * _3048;
    float _3074 = _3058 * _3064;
    float _3076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _3078 = _3040 * _3048;
    float _3080 = _3076 * _3066;
    float _3082 = _3040 * _3052;
    float _3084 = _3048 * _3052;
    float _3086 = _3032 * _3052;
    float _3088 = _3044 * _3052;
    float _3090 = _3082 * _3074;
    float _3092 = _3056 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3094 = _3092 * 0.5;
    float _3096 = fma(_3070, _3078, _3060);
    float _3098 = -_3072;
    float _3100 = fma(_3070, _3062, _3098);
    float _3102 = -_3074;
    float _3104 = _3070 * _3102;
    float _3106 = -_3062;
    float _3108 = fma(_3070, _3072, _3106);
    float _3110 = fma(_3096, _3080, _3090);
    float _3112 = _3086 * _3074;
    float _3114 = fma(_3084, _3080, _3104);
    float _3116 = fma(_3070, _3060, _3078);
    float _3118 = fma(_3100, _3094, _3110);
    float _3120 = fma(_3108, _3080, _3112);
    float _3122 = fma(_3088, _3094, _3114);
    float _3124 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3126 = fma(_3116, _3094, _3120);
    float _3128 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3130 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3124);
    float _3132 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3128);
    float _3134 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3130);
    float _3136 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3132);
    float _3138 = _3134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3140 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3142 = _2414 + _3138;
    float _3144 = _2190 + _3140;
    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3148 = _3142 + _3146;
    float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3152 = _3144 + _3150;
    float _3154 = _3148 * _3148;
    float _3156 = fma(_3152, _3152, _3154);
    float _3158 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3160 = sqrt(_3156);
    float _3162 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3158);
    float _3164 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3162);
    float _3166 = _3164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3168 = _2396 + _3166;
    bool _3170 = _3160 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3172 = _3158;
    float _3174 = _3126;
    float _3176 = _3142;
    if (!_3170)
    {
        _3172 = _3144;
    }
    float _3178 = _3172;
    float _3180 = _3178;
    if (!_3170)
    {
        _3174 = _3168;
    }
    float _3182 = _3174;
    bool _3184 = !_3170;
    float _3186 = _3182;
    if (!_3184)
    {
        float _3188 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3192 = _3160 + _3190;
        float _3194 = rsqrt(_3156);
        float _3196 = _3192 * _3188;
        float _3198 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3200 = _3196 * 0.15915493667125701904296875;
        float _3202 = _3200 * 6.283185482025146484375;
        float _3204 = cos(_3202);
        float _3206 = _3200 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        float _3210 = _3204 + (-1.0);
        float _3212 = fma(_3208, _3198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3214 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3216 = _3194 * _3212;
        float _3218 = fma(_3168, _3204, _3214);
        float _3220 = fma(_3152, _3216, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3222 = fma(_3148, _3216, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3186 = _3218;
        _3180 = _3220;
        _3176 = _3222;
    }
    float _3224 = _3186;
    float _3226 = _3180;
    float _3228 = _3176;
    float _3230 = -_2396;
    float _3232 = _3230 + _3224;
    float _3234 = -_2190;
    float _3236 = _3234 + _3226;
    float _3238 = -_2414;
    float _3240 = _3238 + _3228;
    float _3242 = _3232 * _3232;
    float _3244 = fma(_3236, _3236, _3242);
    float _3246 = fma(_3240, _3240, _3244);
    float _3248 = sqrt(_3246);
    bool _3250 = _3248 > 0.0;
    bool _3252 = !_3250;
    float _3254 = _3224;
    float _3256 = _3226;
    float _3258 = _3228;
    float _3260 = _3246;
    float _3262 = _3236;
    if (!_3252)
    {
        float _3264 = _233 * _233;
        float _3266 = fma(_229, _229, _3264);
        float _3268 = fma(_235, _235, _3266);
        float _3270 = rsqrt(_3246);
        float _3272 = sqrt(_3268);
        float _3274 = _3232 * _3270;
        float _3276 = _3240 * _3270;
        bool _3278 = _3272 > 0.0;
        float _3280 = _3236 * _3270;
        bool _3282 = !_3278;
        if (!_3282)
        {
            float _3284 = rsqrt(_3268);
            float _3286 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3288 = _233 * _3284;
            float _3290 = _229 * _3284;
            float _3292 = _3274 * _3288;
            float _3294 = _235 * _3284;
            float _3296 = fma(_3280, _3290, _3292);
            float _3298 = _3286 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3300 = fma(_3276, _3294, _3296);
            float _3302 = _3300 * _3298;
            float _3304 = fma(_229, _3302, _3226);
            float _3306 = fma(_233, _3302, _3224);
            float _3308 = fma(_235, _3302, _3228);
            _3254 = _3306;
            _3256 = _3304;
            _3258 = _3308;
            _3260 = _3286;
        }
    }
    float _3310 = _3254;
    float _3312 = _3256;
    float _3314 = _3258;
    float _3316 = _3260;
    float _3318 = -_2890;
    float _3320 = _3318 + _3310;
    float _3322 = -_2892;
    float _3324 = _3322 + _3312;
    float _3326 = -_2926;
    float _3328 = _3326 + _3314;
    float _3330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3332 = _3320 + _3330;
    float _3334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3336 = _3324 + _3334;
    float _3338 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3340 = _3328 + _3338;
    float _3342 = _3332 * _3332;
    float _3344 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3346 = fma(_3336, _3336, _3342);
    float _3348 = fma(_3340, _3340, _3346);
    float _3350 = rsqrt(_3348);
    float _3352 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3354 = _3336 * _3352;
    float _3356 = _3340 * _3352;
    float _3358 = _3354 * _3354;
    float _3360 = _3356 * _3356;
    float _3362 = _3358 + _3360;
    float _3364 = sqrt(_3362);
    bool _3366 = _3364 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3370 = _3364 + _3368;
    float _3372 = _3340;
    float _3374 = _3362;
    float _3376 = _3370;
    float _3378 = _3316;
    float _3380 = _3332;
    float _3382 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3366)
    {
        float _3384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3372 = _3384;
    }
    float _3386 = _3372;
    if (_3366)
    {
        float _3388 = rsqrt(_3362);
        _3374 = _3388;
    }
    float _3390 = _3374;
    float _3392 = _3390;
    if (_3366)
    {
        float _3394 = _3370 * _3386;
        _3376 = _3394;
    }
    float _3396 = _3376;
    if (_3366)
    {
        float _3398 = _3396 * 0.15915493667125701904296875;
        _3378 = _3398;
    }
    float _3400 = _3378;
    float _3402 = _3350;
    float _3404 = _3400;
    if (_3366)
    {
        float _3406 = _3400 * 6.283185482025146484375;
        float _3408 = sin(_3406);
        _3402 = _3408;
    }
    float _3410 = _3402;
    float _3412 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3414 = precise::max(0.0, _3412);
    float _3416 = _3386;
    if (_3366)
    {
        float _3418 = _3400 * 6.283185482025146484375;
        float _3420 = cos(_3418);
        _3416 = _3420;
    }
    float _3422 = _3416;
    float _3424 = -_3352;
    float _3426 = -_3414;
    float _3428 = fma(_3332, _3424, _3426);
    float _3430 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_3366)
    {
        float _3432 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3380 = _3432;
    }
    float _3434 = _3380;
    if (!_3366)
    {
        _3404 = _3354;
    }
    float _3436 = _3404;
    float _3438 = _3410;
    float _3440 = _3436;
    if (_3366)
    {
        float _3442 = fma(_3410, _3434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3382 = _3442;
    }
    float _3444 = _3382;
    float _3446 = floor(_3430);
    float _3448 = _3444;
    if (_3366)
    {
        float _3450 = _3422 + (-1.0);
        _3438 = _3450;
    }
    float _3452 = _3438;
    float _3454 = _3452;
    if (_3366)
    {
        float _3456 = _3390 * _3444;
        _3262 = _3456;
    }
    float _3458 = _3262;
    if (!_3366)
    {
        _3448 = _3428;
    }
    float _3460 = _3448;
    float _3462 = _3460;
    if (_3366)
    {
        float _3464 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3012 = _3464;
    }
    float _3466 = _3012;
    float _3468 = _3466;
    if (_3366)
    {
        float _3470 = _3354 * _3458;
        _3440 = _3470;
    }
    float _3472 = _3440;
    if (!_3366)
    {
        _3392 = _3356;
    }
    float _3474 = _3392;
    float _3476 = _3474;
    if (_3366)
    {
        float _3478 = _3356 * _3458;
        _3476 = _3478;
    }
    float _3480 = _3476;
    if (!_3366)
    {
        _3454 = _3358;
    }
    float _3482 = _3454;
    float _3484 = _3482;
    if (_3366)
    {
        float _3486 = fma(_3428, _3422, _3466);
        _3462 = _3486;
    }
    float _3488 = _3462;
    if (_3366)
    {
        float _3490 = _3472 * _3472;
        _3484 = _3490;
    }
    float _3492 = _3484;
    if (!_3366)
    {
        _3468 = _3360;
    }
    float _3494 = _3468;
    float _3496 = _3494;
    if (_3366)
    {
        float _3498 = _3480 * _3480;
        _3496 = _3498;
    }
    float _3500 = _3496;
    float _3502 = sqrt(_3348);
    float _3504 = fma(_3488, _3488, _3492);
    float _3506 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3508 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3510 = _3504 + _3500;
    float _3512 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3514 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3506);
    float _3516 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3508);
    float _3518 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3520 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3512);
    float _3522 = rsqrt(_3510);
    float _3524 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3514);
    float _3526 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3518);
    float _3528 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3520);
    float _3530 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3516);
    float _3532 = _3524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3534 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3526);
    float _3536 = _3528 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3540 = fma(_3502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3538);
    float _3542 = precise::clamp(_3540, 0.0, 1.0);
    float _3544 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3546 = _3534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3548 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3550 = -_3542;
    float _3552 = _3550 + 1.0;
    float _3554 = -_3544;
    float _3556 = fma(_3554, _3344, 1.0);
    float _3558 = _3530 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3560 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3548);
    float _3562 = _3522 * _3472;
    float _3564 = _3522 * _3480;
    float _3566 = abs(_3552);
    float _3568 = log2(_3566);
    float _3570 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3560);
    float _3572 = _3562 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3574 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3570);
    float _3576 = _3522 * _3488;
    float _3578 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3580 = log2(_3556);
    float _3582 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3584 = -_3572;
    float _3586 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3584);
    float _3588 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3578);
    float _3590 = -_3564;
    float _3592 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3586);
    float _3594 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3596 = -_3446;
    float _3598 = _3430 + _3596;
    float _3600 = fma(_3592, -0.5, 0.5);
    float _3602 = 1.0 / _3574;
    float _3604 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3606 = fma(_3592, 0.5, 0.5);
    float _3608 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3588);
    float _3610 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3604);
    float _3612 = fma(_3606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3614 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3608);
    float _3616 = exp2(_3594);
    float _3618 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3610);
    float _3620 = fma(_3606, _3612, -0.212114393711090087890625);
    float _3622 = _3580 * 0.693147182464599609375;
    float _3624 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3618);
    float _3626 = fma(_3606, _3620, 1.570728778839111328125);
    float _3628 = _3622 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3630 = sqrt(_3600);
    float _3632 = _3576 + 1.0;
    float _3634 = _3624 * _3602;
    float _3636 = _3614 * _3602;
    float _3638 = fma(_3634, 0.5, 0.5);
    float _3640 = fma(_3636, -0.5, 0.5);
    float _3642 = floor(_3582);
    float _3644 = -_3576;
    float _3646 = fma(_3616, _3632, _3644);
    float _3648 = fma(_3646, 0.5, 0.5);
    float _3650 = _3630 * 0.636619746685028076171875;
    float _3652 = -_3626;
    float _3654 = fma(_3650, _3652, 1.0);
    float _3656 = -_3642;
    float _3658 = _3582 + _3656;
    float2 _9742 = float2(_3598, _3658);
    float _3660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9742, float2(0.0), isnan(_9742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9742, float2(0.0), isnan(_9742)), level(0.0)).x;
    float3 _9753 = float3(_3638, _3640, _3628);
    float _3662 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9753, float3(0.0), isnan(_9753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9753, float3(0.0), isnan(_9753)), level(0.0)).x;
    float3 _9764 = float3(_3638, _3640, _3628);
    float4 _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9764, float3(0.0), isnan(_9764)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9764, float3(0.0), isnan(_9764)), level(0.0)).xyzw;
    float _3667 = _3665.x;
    float _3669 = _3665.y;
    float _3671 = _3665.z;
    float _3673 = _3665.w;
    float2 _9780 = float2(_3654, _3648);
    float3 _3677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9780, float2(0.0), isnan(_9780)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9780, float2(0.0), isnan(_9780)), level(0.0)).xyz;
    float _3679 = _3677.x;
    float _3681 = _3677.y;
    float _3683 = _3677.z;
    float _3685 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3687 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3689 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3691 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3693 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3685);
    float _3695 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3687);
    float _3697 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3699 = fma(_2950, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3693);
    float _3701 = fma(_2950, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3695);
    float _3703 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3705 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3707 = _3699 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3709 = _3701 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3711 = fma(_3703, _3703, 1.0);
    float _3713 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3715 = 1.0 / _3707;
    float _3717 = _3709 + _3707;
    float _3719 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3721 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3723 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3725 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3705);
    float _3727 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3719);
    float _3729 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3721);
    float _3731 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3713);
    float _3733 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3735 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3723);
    float _3737 = rsqrt(_3711);
    float _3739 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3741 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3733);
    bool _3743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3745 = isnan(0.5);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3751 = _3747 || _3749;
    float _3753 = _3717 * _3715;
    float _3755 = _3753 * 0.5;
    float _3757 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3759 = fma(_3755, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3757);
    float _3761 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3729);
    float _3763 = 1.0 / _3759;
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3767 = _3763 * _3765;
    float _3769 = -_3070;
    float _3771 = fma(_3769, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3689);
    float _3773 = abs(_3767);
    float _3775 = log2(_3773);
    float _3777 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3771);
    float _3779 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3725);
    float _3781 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3741);
    float _3783 = _3775 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3785 = -_3070;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3691);
    float _3789 = -_3070;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3697);
    float _3793 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3787);
    float _3795 = exp2(_3783);
    float _3797 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3791);
    float _3799 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3727);
    float _3801 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3735);
    float _3803 = _3703 * _3737;
    float _3805 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3731);
    float _3807 = _3703 * _3797;
    float _3809 = -_3799;
    float _3811 = _3803 * _3809;
    float _3813 = -_3761;
    float _3815 = _3803 * _3813;
    float _3817 = -_3801;
    float _3819 = _3803 * _3817;
    out.m_84.x = _3779;
    out.m_84.y = _3781;
    out.m_84.z = _3805;
    float _3821 = fma(_3737, _3777, _3811);
    float _3823 = fma(_3737, _3793, _3815);
    float _3825 = _3703 * _3777;
    float _3827 = _3703 * _3793;
    float _3829 = fma(_3795, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = fma(_3737, _3797, _3819);
    float _3835 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3837 = in.m_86.x;
    float _3839 = fma(_3831, -2.0, 3.0);
    float _3841 = _3831 * _3831;
    float _3843 = fma(_3739, _3779, _3825);
    float _3845 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3847 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3835);
    float _3849 = _3841 * _3839;
    bool _3851 = _3767 <= 8000.0;
    bool _3853 = isnan(_3767);
    bool _3855 = _3851 || _3853;
    bool _3857 = isnan(8000.0);
    bool _3859 = _3855 || _3857;
    float _3861 = float(_3859);
    float _3863 = fma(_3739, _3805, _3807);
    float _3865 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3847);
    float _3867 = -_3849;
    float _3869 = _3867 + 1.0;
    float _3871 = exp2(_3845);
    float _3873 = fma(_3739, _3781, _3827);
    float _3875 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3865);
    float _3877 = fma(_3869, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3849);
    float _3879 = _3624 + _3574;
    out.m_88.x = _3821;
    out.m_88.y = _3823;
    out.m_88.z = _3833;
    float _3881 = _3875 + _3574;
    float _3883 = _3861 * _3877;
    float _3885 = _3574 * 0.5;
    float _3887 = _3881 * 0.5;
    float _3889 = _3879 * 0.5;
    float _3891 = fma(_3614, -0.5, _3885);
    float _3893 = _3821;
    float _3895 = _3875;
    float _3897 = _3624;
    float _3899 = _3614;
    if (_3751)
    {
        _3893 = 1.0;
    }
    float _3901 = _3893;
    float _3903 = _3901;
    float _3905 = _3669;
    if (!_3751)
    {
        float _3907 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3909 = _3907 * 0.15915493667125701904296875;
        float _3911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3913;
        float _3917 = _3909 * 6.283185482025146484375;
        float _3919 = cos(_3917);
        float _3921 = _3911 * 0.15915493667125701904296875;
        float _3923 = _3909 * 6.283185482025146484375;
        float _3925 = sin(_3923);
        float _3927 = 1.0 / _3919;
        float _3929 = _3921 * 6.283185482025146484375;
        float _3931 = cos(_3929);
        float _3933 = _3925 * _3927;
        float _3935 = _3921 * 6.283185482025146484375;
        float _3937 = sin(_3935);
        float _3939 = _3931 * _3933;
        float _3941 = 1.0 / _3915;
        float _3943 = 1.0 / _3939;
        float _3945 = _3937 * _3943;
        float _3947 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3949 = fma(_3767, _3945, _3947);
        float _3951 = _3949 * _3941;
        float _3953 = precise::clamp(_3951, 0.0, 1.0);
        _3903 = _3953;
    }
    float _3955 = _3903;
    float _3957 = -_3871;
    float _3959 = _3957 + 1.0;
    out.m_90.x = _3889;
    out.m_90.y = _3891;
    out.m_90.z = _3887;
    out.m_90.w = _3574;
    float _3961 = _3799 + _3843;
    float _3963 = _3761 + _3873;
    float _3965 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3967 = _3801 + _3863;
    float _3969 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3971 = -_3660;
    float _3973 = _3971 + 1.0;
    float _3975 = _3965 * _3662;
    float _3977 = -_3965;
    float _3979 = _3977 + 1.0;
    out.m_92.x = _3961;
    out.m_92.y = _3963;
    out.m_92.z = _3967;
    float _3981 = _3683 * _3975;
    float _3983 = _3973 * _3969;
    float _3985 = precise::clamp(_3983, 0.0, 1.0);
    out.m_94.x = _3324;
    out.m_94.y = _3320;
    out.m_94.z = _3328;
    float _3987 = _3673 * _3975;
    float _3989 = _3673 * _3979;
    float _3991 = fma(_3673, _3981, _3671);
    bool _3993 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3995 = isnan(_3502);
    bool _3997 = _3993 || _3995;
    bool _3999 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4001 = _3997 || _3999;
    float _4003 = fma(_3679, _3987, _3667);
    float _4005 = fma(_3681, _3987, _3669);
    float _4007 = -_3985;
    float _4009 = fma(_4007, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3624;
    out.gl_Position.y = _3614;
    out.gl_Position.z = _3875;
    out.gl_Position.w = _3574;
    float _4011 = _4009 * _3837;
    out.m_96.x = _4003;
    out.m_96.y = _4005;
    out.m_96.z = _3991;
    out.m_96.w = _3989;
    float _4013 = _4011 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4015 = _4011;
    float _4017 = _4013;
    if (!_4001)
    {
        _4015 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4019 = _4015;
    float _4021 = _4019;
    float _4023 = _4019;
    if (!_4001)
    {
        _3905 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4025 = _3905;
    out.m_98.x = _4013;
    float _4027 = _3955 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4029 = _4025;
    float _4031 = _4025;
    if (!_4001)
    {
        _3895 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4033 = _3895;
    float _4035 = _4033;
    float _4037 = _4033;
    if (!_4001)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4039 = _3897;
    float _4041 = _4039;
    float _4043 = _4039;
    if (!_4001)
    {
        _3899 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4045 = _3899;
    float _4047 = _4045;
    float _4049 = _4045;
    if (!_4001)
    {
        _4017 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4051 = _4017;
    bool _4053 = !_4001;
    float _4055 = _4051;
    float _4057 = _4051;
    if (!_4053)
    {
        bool _4059 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4061 = isnan(_3502);
        bool _4063 = _4059 || _4061;
        bool _4065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4067 = _4063 || _4065;
        if (!_4067)
        {
            float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4071 = _3502 + _4069;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4075 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4073;
            float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4081 = 1.0 / _4075;
            float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4095 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4097 = _4095 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4099 = _4071 * _4081;
            float _4101 = precise::clamp(_4099, 0.0, 1.0);
            float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4107 = fma(_4101, _4079, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4109 = fma(_4101, _4105, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4111 = fma(_4101, _4085, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4113 = fma(_4101, _4089, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4115 = fma(_4101, _4093, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4117 = fma(_4101, _4097, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4043 = _4111;
            _4031 = _4115;
            _4037 = _4107;
            _4023 = _4113;
            _4049 = _4109;
            _4057 = _4117;
            _4119 = true;
        }
        else
        {
            bool _4121 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4123 = isnan(_3502);
            bool _4125 = _4121 || _4123;
            bool _4127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4129 = _4125 || _4127;
            if (!_4129)
            {
                _4035 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4131 = _4035;
            _4037 = _4131;
            if (!_4129)
            {
                _4041 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4133 = _4041;
            _4043 = _4133;
            if (!_4129)
            {
                _4047 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4135 = _4047;
            _4049 = _4135;
            if (!_4129)
            {
                _4021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4137 = _4021;
            _4023 = _4137;
            if (!_4129)
            {
                _4029 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4139 = _4029;
            _4031 = _4139;
            if (!_4129)
            {
                _4055 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4141 = _4055;
            bool _4143 = !_4129;
            _4057 = _4141;
            if (!_4143)
            {
                bool _4145 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4147 = isnan(_3502);
                bool _4149 = _4145 || _4147;
                bool _4151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4153 = _4149 || _4151;
                if (!_4153)
                {
                    float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4157 = _3502 + _4155;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4161 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4159;
                    float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4167 = 1.0 / _4161;
                    float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4175 = _4173 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4179 = _4177 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4183 = _4181 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4185 = _4157 * _4167;
                    float _4187 = precise::clamp(_4185, 0.0, 1.0);
                    float _4189 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4193 = fma(_4187, _4165, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4195 = fma(_4187, _4191, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4197 = fma(_4187, _4171, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4199 = fma(_4187, _4175, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4201 = fma(_4187, _4179, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4203 = fma(_4187, _4183, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4043 = _4197;
                    _4031 = _4201;
                    _4037 = _4193;
                    _4023 = _4199;
                    _4049 = _4195;
                    _4057 = _4203;
                    _4119 = true;
                }
                else
                {
                    _4043 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4031 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4037 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4049 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4057 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4119 = false;
    float _4205 = _4043;
    float _4207 = _4031;
    float _4209 = _4037;
    float _4211 = _4023;
    float _4213 = _4049;
    float _4215 = _4057;
    float _4217 = fma(_3963, -0.5, 0.5);
    float _4219 = precise::clamp(_4217, 0.0, 1.0);
    float _4221 = -_4205;
    float _4223 = _4221 + _4207;
    float _4225 = _4027 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4227 = -_4209;
    float _4229 = _4227 + _4211;
    out.m_100.x = 0.0;
    float _4231 = fma(_4219, _4223, _4205);
    float _4233 = -_4213;
    float _4235 = _4233 + _4215;
    out.m_53.x = _4225;
    float _4237 = fma(_4219, _4229, _4209);
    float _4239 = _4231 * 0.586610972881317138671875;
    bool _4241 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4243 = fma(_4219, _4235, _4213);
    float _4245 = fma(_4237, 0.298911988735198974609375, _4239);
    bool _4247 = _3955 > 0.0;
    bool _4249 = isnan(_3955);
    bool _4251 = _4247 || _4249;
    bool _4253 = isnan(0.0);
    bool _4255 = _4251 || _4253;
    float _4257 = fma(_4243, 0.114477999508380889892578125, _4245);
    float _4259 = -_4257;
    float _4261 = _4237 + _4259;
    float _4263 = -_4257;
    float _4265 = _4231 + _4263;
    float _4267 = -_4257;
    float _4269 = _4243 + _4267;
    float _4271 = fma(_4261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    float _4273 = fma(_4265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    float _4275 = fma(_4269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    bool _4277 = !_4241;
    if (!_4277)
    {
        float _4279 = -_3320;
        float _4281 = _4279 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4283 = -_3324;
        float _4285 = _4283 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4287 = -_3328;
        float _4289 = _4287 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4291 = _4281 * _4281;
        float _4293 = fma(_4285, _4285, _4291);
        float _4295 = fma(_4289, _4289, _4293);
        float _4297 = sqrt(_4295);
        float _4299 = rsqrt(_4295);
        float _4301 = -_4297;
        float _4303 = _4301 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4305 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4307 = precise::clamp(_4305, 0.0, 1.0);
        float _4309 = _4285 * _4299;
        float _4311 = _4281 * _4299;
        float _4313 = abs(_4307);
        float _4315 = log2(_4313);
        float _4317 = _4289 * _4299;
        float _4319 = _4309 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4321 = _3963 * _4311;
        float _4323 = -_4311;
        float _4325 = -_4319;
        float _4327 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4325);
        float _4329 = fma(_3961, _4309, _4321);
        float _4331 = -_4317;
        float _4333 = fma(_4331, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4327);
        float _4335 = fma(_3967, _4317, _4329);
        float _4337 = precise::clamp(_4335, 0.0, 1.0);
        float _4339 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4341 = _4333 + _4339;
        float _4343 = _4315 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4345 = _4341 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4347 = precise::clamp(_4345, 0.0, 1.0);
        float _4349 = exp2(_4343);
        float _4351 = _4349 * _4347;
        float _4353 = _4337 * _4351;
        float _4355 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4357 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4359 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4355;
        out.m_100.y = _4357;
        out.m_100.z = _4359;
    }
    out.m_102.x = _4271;
    out.m_102.y = _4273;
    out.m_102.z = _4275;
    if (_4255)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4361;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4119 = false;
    bool _685 = false;
    bool _541 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4429 = as_type<float>(_145);
        out.gl_Position.z = _4429;
    }
    if (!_131)
    {
        return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4492 = as_type<float>(_177);
        out.gl_Position.z = _4492;
    }
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = _183 * _189;
    bool _217 = !_211;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _215);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    float _229 = fma(_185, _191, _223);
    float _231 = fma(_181, _199, _225);
    float _233 = fma(_185, _197, _227);
    float _235 = fma(_185, _203, _231);
    bool _237 = !_207;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = 1.0 / _271;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _275;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _263 + _295;
    float _299 = 1.0 / _279;
    float _301 = _297 * _285;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _283;
    float _317 = _267 * _293;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _263 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _263 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _329 = _263 + _327;
    float _331 = 1.0 / _289;
    float _333 = _321 * _299;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_263);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _325 * _315;
    float _361 = -_313;
    float _363 = _361 + 1.0;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _345 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = _329 * _331;
    bool _385 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_263);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _357 * _367;
    float _399 = fma(_377, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _403 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_263);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _395 * _371;
    float _417 = -_395;
    float _419 = _417 + 1.0;
    bool _421 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _423 = isnan(_263);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = _413 * _419;
    float _443 = -_413;
    float _445 = _443 + 1.0;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = fma(_435, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = fma(_439, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = _431 * _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _461;
    float _465 = _399 * _455;
    float _467 = _401 * _455;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _465);
    float _475 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _481 = fma(_459, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_463, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = fma(_451, _441, _473);
    float _487 = fma(_453, _441, _475);
    float _489 = fma(_479, _359, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_471, _359, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _497;
    float _501 = fma(_481, _415, _485);
    float _503 = fma(_483, _415, _487);
    float _505 = fma(_495, _383, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _507 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _509 = fma(_489, _397, _501);
    float _511 = fma(_491, _397, _503);
    float _513 = fma(_505, _373, _509);
    float _515 = fma(_507, _373, _511);
    float _517 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].x, _513);
    float _519 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].y, _515);
    bool _521 = !_291;
    float _539;
    if (!_521)
    {
        float _523 = in.m_66.x;
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        _539 = _171;
    }
    _541 = false;
    float _543 = _539;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _549 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_543);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_543);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _547;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _579;
    float _583 = -_559;
    float _585 = _583 + 1.0;
    bool _587 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _589 = isnan(_543);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _601 = 1.0 / _563;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = _581 * _577;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _543 + _609;
    float _613 = fma(_607, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _615 = _575 * _585;
    float _617 = -_575;
    float _619 = _617 + 1.0;
    float _621 = _605 * _601;
    float _623 = -_597;
    float _625 = _623 + 1.0;
    float _627 = _613 * _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _543 + _629;
    float _633 = _559 * _625;
    float _635 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _637 = fma(_621, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _641 = fma(_637, _633, _635);
    float _643 = in.m_68.x;
    float _645 = in.m_68.y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[117].x, _641);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _659 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _649;
    out.m_70.y = _655;
    out.m_70.z = _659;
    out.m_70.w = _657;
    float _661 = _519 * _645;
    float _663 = _517 * _643;
    bool _665 = !_599;
    float _683;
    if (!_665)
    {
        float _667 = in.m_66.x;
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _671 = _667 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _675 = _673 * _669;
        float _677 = floor(_675);
        float _679 = -_677;
        float _681 = _675 + _679;
        _683 = _681;
        _685 = true;
    }
    else
    {
        _683 = _171;
    }
    _685 = false;
    float _687 = _683;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _691 = _687 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _707 = isnan(_687);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _695;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _723 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _725 = isnan(_687);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _737 = 1.0 / _703;
    float _739 = _699 * _717;
    bool _741 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _743 = isnan(_687);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _721;
    float _755 = -_715;
    float _757 = _755 + 1.0;
    float _759 = fma(_739, _691, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _765 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _767 = isnan(_687);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = _751 * _757;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _787 = 1.0 / _763;
    float _789 = -_775;
    float _791 = _789 + 1.0;
    float _793 = _733 * _779;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _795;
    float _799 = _785 * _737;
    float _801 = _715 * _791;
    float _803 = _759 * _793;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = _687 + _805;
    float _809 = -_733;
    float _811 = _809 + 1.0;
    bool _813 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _815 = isnan(_687);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = _797 * _753;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _833 = _687 + _831;
    float _835 = fma(_799, _807, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _837 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[131].x, _803);
    float _839 = -_823;
    float _841 = _839 + 1.0;
    float _843 = _829 * _787;
    float _845 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _849 = _687 + _847;
    float _851 = fma(_835, _781, _837);
    float _853 = _775 * _841;
    float _855 = fma(_843, _849, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _857 = fma(_845, _801, _851);
    float _859 = fma(_855, _853, _857);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _867 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[135].x, _859);
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _869;
    out.m_72.y = _871;
    out.m_72.z = _873;
    out.m_72.w = _875;
    bool _877 = !_735;
    float _879 = _823;
    float _881 = _843;
    if (!_877)
    {
        float _883 = in.m_66.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _173 = _897;
    }
    float _899 = _173;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _903 = int(_901);
    float _905 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _907 = int(_905);
    float _909 = float(_903);
    float _911 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _913 = int(_911);
    float _915 = float(uint(_907));
    float _917 = 1.0 / _909;
    float _919 = 1.0 / _915;
    float _921 = float(_913);
    float _923 = _917 * _127;
    float _925 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _927 = int(_925);
    int _929 = as_type<int>(_919) + (-2);
    float _931 = trunc(_923);
    int _933 = int(_931);
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _937 = _935 != 0;
    float _939 = 1.0 / _921;
    float _941 = float(uint(_927));
    int _943 = ~_927;
    int _945 = _943 + 1;
    float _947 = float(uint(_933));
    float _949 = 1.0 / _941;
    int _951 = ~_907;
    int _953 = _951 + 1;
    float _955 = 0.0;
    float _957 = 0.0;
    if (_937)
    {
        float _959 = in.m_66.x;
        float _961 = in.m_66.y;
        _955 = _959;
        _957 = _961;
    }
    float _963 = _955;
    float _965 = _957;
    if (_937)
    {
        _879 = 1.0;
    }
    float _967 = _879;
    float _969 = as_type<float>(_929) * _947;
    float _971 = _939 * _127;
    float _973 = trunc(_969);
    float _975 = precise::max(_973, 0.0);
    uint _978 = uint(_975);
    float _980 = trunc(_971);
    int _982 = int(_980);
    int _984 = as_type<int>(_949) + (-2);
    int _986 = as_type<int>(_969);
    float _988 = _967;
    if (_937)
    {
        _986 = 0;
    }
    int _990 = _986;
    int _992 = _953 * int(_978);
    int _994 = _992 + _933;
    float _996 = _963;
    float _998 = _965;
    int _1000 = _990;
    if (_937)
    {
        _881 = _963;
    }
    float _1002 = _881;
    float _1004 = float(uint(_994));
    float _1006 = float(uint(_982));
    float _1008 = as_type<float>(_929) * _1004;
    float _1010 = _1004;
    float _1012 = _1006;
    float _1014 = _1002;
    if (_937)
    {
        _1010 = _965;
    }
    float _1016 = _1010;
    float _1018 = as_type<float>(_984) * _1006;
    float _1020 = trunc(_1008);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = _1016;
    if (_937)
    {
        _1012 = _1002;
    }
    float _1028 = _1012;
    float _1030 = trunc(_1018);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = _1028;
    if (!_937)
    {
        float _1038 = in.m_66.x;
        float _1040 = in.m_66.y;
        float _1042 = _1038 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _1040 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        _988 = 7.345489978790283203125;
        _996 = _1038;
        _1014 = _1040;
        _1026 = _1056;
        _998 = _1040;
        _1000 = 1;
        _1036 = _1052;
    }
    float _1058 = _988;
    float _1060 = _996;
    float _1062 = _1014;
    float _1064 = _1026;
    float _1066 = _998;
    int _1068 = _1000;
    float _1070 = _1036;
    int _1072 = _945 * int(_1034);
    int _1074 = _1072 + _982;
    float _1076 = _1058 * _1060;
    int _1078 = int(_978) + int(_1024);
    float _1080 = _1058 * _1062;
    float _1082 = float(_907);
    float _1084 = floor(_1076);
    float _1086 = float(uint(_1074));
    float _1088 = _167 * _127;
    int _1090 = ~_907;
    int _1092 = _1090 + 1;
    float _1094 = _1060 * 2.0;
    float _1096 = float(_933);
    float _1098 = as_type<float>(_984) * _1086;
    bool _1100 = _907 == 0;
    int _1102 = _1092 * _1078;
    int _1104 = _1102 + _933;
    bool _1106 = _1096 >= _1082;
    bool _1108 = isnan(_1096);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1082);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = floor(_1094);
    bool _1120 = uint(_1104) >= uint(_907);
    float _1122 = -_1084;
    float _1124 = _1076 + _1122;
    float _1126 = trunc(_1098);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    bool _1132 = !_1120;
    int _1134 = _1132 ? 0 : (-1);
    float _1136 = _1124 * _1082;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1140 = _1138 != 0;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1144 = ~_1078;
    int _1146 = _1144 + _1134;
    int _1148 = _1146 + 1;
    int _1150 = ~_927;
    int _1152 = _1150 + 1;
    float _1154 = trunc(_1116);
    int _1156 = int(_1154);
    bool _1158 = !_1140;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _907 * _1148;
    int _1164 = _1162 + _933;
    float _1166 = float(_927);
    int _1168 = abs(_1160);
    bool _1170 = !_1100;
    int _1172 = _1170 ? _1164 : (-1);
    float _1174 = trunc(_1136);
    int _1176 = int(_1174);
    int _1178 = int(_1034) + int(_1130);
    float _1180 = float(_982);
    int _1182 = _1152 * _1178;
    int _1184 = _1182 + _982;
    bool _1186 = _1180 >= _1166;
    bool _1188 = isnan(_1180);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(_1166);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1082 * _1088;
    bool _1200 = uint(_1184) >= uint(_927);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1204 = ~_1156;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = floor(_1080);
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1222 = _1220 != 0;
    int _1224 = _1176 * _1168;
    int _1226 = _1224 + _933;
    int _1228 = _907 + (-1);
    int _1230 = _1172 * _1208;
    bool _1232 = !_1218;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = trunc(_1198);
    int _1238 = int(_1236);
    int _1240 = _1156 * _1228;
    int _1242 = _1240 + _1230;
    bool _1244 = !_1214;
    int _1246 = _1244 ? 0 : 1;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1250 = abs(_1234);
    bool _1252 = !_1222;
    int _1254 = _1252 ? 0 : 1;
    int _1256 = abs(_1246);
    int _1258 = _1242 * _1250;
    int _1260 = abs(_1254);
    float _1262 = trunc(_1196);
    int _1264 = int(_1262);
    float _1266 = -_1210;
    float _1268 = _1080 + _1266;
    bool _1270 = !_1200;
    int _1272 = _1270 ? 0 : (-1);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1276 = _1274 != 0;
    int _1278 = _1238 * _1256;
    int _1280 = _1278 + _1258;
    float _1282 = _1166 * _1088;
    int _1284 = ~_1178;
    int _1286 = _1284 + _1272;
    int _1288 = _1286 + 1;
    float _1290 = _1268 * _1166;
    bool _1292 = !_1276;
    int _1294 = _1292 ? 0 : 1;
    int _1296 = _1226 * _1260;
    int _1298 = _1296 + _1280;
    bool _1300 = _927 == 0;
    float _1302 = trunc(_1282);
    int _1304 = int(_1302);
    int _1306 = abs(_1294);
    int _1308 = _927 * _1288;
    int _1310 = _1308 + _982;
    int _1312 = ~_1264;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1332 = _1330 != 0;
    int _1334 = _1176 * _1306;
    int _1336 = _1334 + _1298;
    bool _1338 = !_1300;
    int _1340 = _1338 ? _1310 : (-1);
    float _1342 = trunc(_1290);
    int _1344 = int(_1342);
    bool _1346 = _907 == 0;
    float _1348 = float(uint(_1336));
    int _1350 = _1340 * _1316;
    bool _1352 = !_1324;
    int _1354 = _1352 ? 0 : 1;
    int _1356 = _927 + (-1);
    float _1358 = as_type<float>(_929) * _1348;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1362 = _1360 != 0;
    int _1364 = abs(_1354);
    float _1366 = trunc(_1358);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    bool _1372 = !_1362;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = _1264 * _1356;
    int _1378 = _1376 + _1350;
    bool _1380 = !_1320;
    int _1382 = _1380 ? 0 : 1;
    int _1384 = abs(_1374);
    int _1386 = _1378 * _1364;
    int _1388 = abs(_1382);
    bool _1390 = !_1328;
    int _1392 = _1390 ? 0 : 1;
    int _1394 = _1304 * _1388;
    int _1396 = _1394 + _1386;
    int _1398 = ~_907;
    int _1400 = _1398 + 1;
    int _1402 = _1344 * _1384;
    int _1404 = _1402 + _982;
    bool _1406 = !_1332;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = abs(_1392);
    int _1412 = abs(_1408);
    int _1414 = _1400 * int(_1370);
    int _1416 = _1414 + _1336;
    int _1418 = ~_907;
    int _1420 = _1418 + 1;
    int _1422 = _1404 * _1410;
    int _1424 = _1422 + _1396;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1428 = _1426 != 0;
    float _1430 = float(uint(_1416));
    int _1432 = _1344 * _1412;
    int _1434 = _1432 + _1424;
    int _1436 = ~_927;
    int _1438 = _1436 + 1;
    float _1440 = as_type<float>(_929) * _1430;
    float _1442 = float(uint(_1434));
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1446 = trunc(_1440);
    float _1448 = precise::max(_1446, 0.0);
    uint _1450 = uint(_1448);
    float _1452 = as_type<float>(_984) * _1442;
    float _1454 = 0.0;
    float _1456 = as_type<float>(_1434);
    if (!_1428)
    {
        _1454 = _239;
    }
    float _1458 = _1454;
    float _1460 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1444);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1464 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1468 = trunc(_1452);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    float _1474 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1460);
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1478 = int(_1370) + int(_1450);
    float _1480 = in.m_66.w;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1490 = _1420 * _1478;
    int _1492 = _1490 + _1336;
    int _1494 = _1438 * int(_1472);
    int _1496 = _1494 + _1434;
    float _1498 = 1.0 / _1484;
    bool _1500 = uint(_1492) >= uint(_907);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1506 = float(uint(_1496));
    bool _1508 = !_1500;
    int _1510 = _1508 ? 0 : (-1);
    float _1512 = 1.0 / _1488;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1516 = _1514 != 0;
    float _1518 = as_type<float>(_984) * _1506;
    int _1520 = ~_1478;
    int _1522 = _1520 + _1510;
    int _1524 = _1522 + 1;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _907 * _1524;
    int _1538 = _1536 + _1336;
    int _1540 = ~_927;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1548;
    int _1552 = ~_907;
    int _1554 = _1552 + 1;
    float _1556 = as_type<float>(_1492);
    float _1558 = as_type<float>(_1542);
    float _1560 = _1458;
    float _1562 = _1464;
    if (_1516)
    {
        float _1564 = in.m_66.x;
        _1556 = _1564;
    }
    float _1566 = _1556;
    bool _1568 = !_1346;
    int _1570 = _1568 ? _1538 : (-1);
    float _1572 = 1.0 / _1504;
    float _1574 = 0.0;
    if (!_1516)
    {
        _1574 = _219;
    }
    float _1576 = _1574;
    int _1578 = _1570 & 3;
    bool _1580 = _1578 != 0;
    int _1582 = _1570 & 3;
    bool _1584 = _1582 != 0;
    bool _1586 = uint(_1578) > 1u;
    float _1588 = 1.0 / _1528;
    int _1590 = int(_1472) + int(_1534);
    int _1592 = _1584 ? 0 : 1;
    bool _1594 = _1480 > 0.5;
    float _1596 = _1480;
    float _1598 = _1576;
    if (_1428)
    {
        float _1600 = _1480 * 3.1415927410125732421875;
        _1596 = _1600;
    }
    float _1602 = _1596;
    int _1604 = _1542 * _1590;
    int _1606 = _1604 + _1434;
    int _1608 = ~_1592;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = 1.0 / _1546;
    int _1616 = _1612;
    if (_1428)
    {
        float _1618 = _1602 * 0.15915493667125701904296875;
        _1558 = _1618;
    }
    float _1620 = _1558;
    float _1622 = -_219;
    int _1624 = _1594 ? as_type<int>(_1622) : as_type<int>(_219);
    bool _1626 = uint(_1578) >= 2u;
    if (!_1586)
    {
        int _1628 = ~_1592;
        int _1630 = _1628 + 1;
        _1616 = _1630;
    }
    int _1632 = _1616;
    float _1634 = _1620;
    if (_1428)
    {
        float _1636 = _1620 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        _1634 = _1638;
    }
    float _1640 = _1634;
    int _1642 = _1626 ? 0 : 1;
    bool _1644 = uint(_1606) >= uint(_927);
    bool _1646 = _1578 != 3;
    bool _1648 = !_1644;
    int _1650 = _1648 ? 0 : (-1);
    int _1652 = ~_1642;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = ~_1590;
    int _1660 = _1658 + _1650;
    int _1662 = _1660 + 1;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1666 = _1664 != 0;
    int _1668 = _927 * _1662;
    int _1670 = _1668 + _1434;
    bool _1672 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1674 = isnan(_899);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    int _1684 = _1656;
    bool _1686 = _1646;
    if (_1646)
    {
        int _1688 = ~_1642;
        int _1690 = _1688 + 1;
        _1684 = _1690;
    }
    int _1692 = _1684;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1696 = _1640;
    if (_1428)
    {
        bool _1698 = _1640 > 0.5;
        _1686 = _1698;
    }
    bool _1700 = _1686;
    if (_1516)
    {
        float _1702 = _1566 * 3.1415927410125732421875;
        _1696 = _1702;
    }
    float _1704 = _1696;
    bool _1706 = !_1300;
    int _1708 = _1706 ? _1670 : (-1);
    float _1710 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1694);
    bool _1712 = !_1666;
    float _1714 = _1712 ? _219 : as_type<float>(_1624);
    if (_1516)
    {
        float _1716 = _1704 * 0.15915493667125701904296875;
        _1456 = _1716;
    }
    float _1718 = _1456;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1722 = _1720 != 0;
    float _1724 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1710);
    if (_1428)
    {
        float _1726 = -_239;
        float _1728 = _1700 ? _1726 : _239;
        _1560 = _1728;
    }
    float _1730 = _1560;
    int _1732 = _1708 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = _1718;
    if (_1516)
    {
        float _1738 = _1718 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    int _1744 = _1708 & 3;
    bool _1746 = _1744 != 0;
    bool _1748 = !_1722;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1754 = _1752 != 0;
    int _1756 = _1734 ? 0 : 1;
    bool _1758 = uint(_1744) > 1u;
    bool _1760 = !_1754;
    int _1762 = _1760 ? 0 : 1;
    bool _1764 = uint(_1744) >= 2u;
    int _1766 = ~_1756;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    int _1772 = _1764 ? 0 : 1;
    bool _1774 = _1744 != 3;
    int _1776 = ~_1772;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1770;
    bool _1784 = _1758;
    int _1786 = _1780;
    if (!_1758)
    {
        int _1788 = ~_1756;
        int _1790 = _1788 + 1;
        _1782 = _1790;
    }
    int _1792 = _1782;
    float _1794 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1516)
    {
        bool _1796 = _1742 > 0.5;
        _1784 = _1796;
    }
    bool _1798 = _1784;
    float _1800 = fma(_1794, -2.0, _1248);
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_1516)
    {
        float _1804 = -_219;
        float _1806 = _1798 ? _1804 : _219;
        _1598 = _1806;
    }
    float _1808 = _1598;
    bool _1810 = _1060 > 0.5;
    float _1812 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1800);
    if (_1774)
    {
        int _1814 = ~_1772;
        int _1816 = _1814 + 1;
        _1786 = _1816;
    }
    int _1818 = _1786;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1822 = _1820 != 0;
    float _1824 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1826 = log2(_1824);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1834 = -_239;
    int _1836 = _1810 ? as_type<int>(_1834) : as_type<int>(_239);
    bool _1838 = _1066 > 0.5;
    float _1840 = -_1142;
    float _1842 = fma(_1832, 2.0, _1840);
    float _1844 = -_219;
    int _1846 = _1838 ? as_type<int>(_1844) : as_type<int>(_219);
    float _1848 = -_127;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1842);
    bool _1852 = _1068 != 1;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1856 = in.m_66.z;
    float _1858 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1854);
    float _1860 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1866 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1858);
    float _1868 = -_1202;
    float _1870 = fma(_1860, 2.0, _1868);
    float _1872 = fma(_1464, -2.0, _1862);
    bool _1874 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1876 = isnan(_899);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1882 = _1878 || _1880;
    float _1884 = float(_1882);
    float _1886 = _1860;
    if (!_1852)
    {
        _1886 = _1066;
    }
    float _1888 = _1886;
    float _1890 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1872);
    float _1892 = _1888;
    if (_1852)
    {
        _1892 = _1060;
    }
    float _1894 = _1892;
    float _1896 = -_127;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1870);
    float _1900 = 0.0;
    if (!_1852)
    {
        _1900 = _1066;
    }
    float _1902 = _1900;
    float _1904 = _1902;
    if (_1852)
    {
        _1904 = _1060;
    }
    float _1906 = _1904;
    float _1908 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1910 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1912 = isnan(_899);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    float _1922 = -_1462;
    float _1924 = fma(_1908, 2.0, _1922);
    if (!_1852)
    {
        _1802 = _1856;
    }
    float _1926 = _1802;
    float _1928 = _1826 * _127;
    float _1930 = _1926;
    if (!_1852)
    {
        _1562 = _1856;
    }
    float _1932 = _1562;
    float _1934 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1864);
    float _1936 = _1932;
    if (_1852)
    {
        _1930 = _1066;
    }
    float _1938 = _1930;
    float _1940 = -_127;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1924);
    if (_1852)
    {
        _1936 = _1066;
    }
    float _1944 = _1936;
    float _1946 = exp2(_1928);
    bool _1948 = _1856 > 0.5;
    float _1950 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1952 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1466);
    float _1954 = -_239;
    int _1956 = _1948 ? as_type<int>(_1954) : as_type<int>(_239);
    float _1958 = fma(_1950, -2.0, _1476);
    bool _1960 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1962 = isnan(1.0);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1968 = _1964 || _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1972 = 1.0 + _1970;
    float _1974 = in.m_46.x;
    float _1976 = in.m_46.y;
    float _1978 = in.m_46.z;
    bool _1980 = !_1830;
    float _1982 = _1980 ? _239 : as_type<float>(_1956);
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1986 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1988 = isnan(0.0);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1994 = _1990 || _1992;
    float _1996 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1952);
    float _1998 = 1.0 / _1972;
    float _2000 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1984);
    float _2002 = -_1946;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1958);
    int _2008 = ~_927;
    int _2010 = _2008 + 1;
    float _2012 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2000);
    float _2014 = -_1996;
    float _2016 = _2014 + 1.0;
    float _2018 = _1994 ? _2004 : 0.0;
    float _2020 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1934);
    bool _2022 = _1118 >= 0.0;
    bool _2024 = isnan(_1118);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(0.0);
    bool _2030 = _2026 || _2028;
    float _2032 = -_2020;
    float _2034 = _2032 + 1.0;
    if (_1968)
    {
        float _2036 = _2018 * _1998;
        _137 = _2036;
    }
    float _2038 = _137;
    float _2040 = _1066 * 2.0;
    int _2042 = _2030 ? 0 : 1;
    float _2044 = _189 * _1976;
    bool _2046 = _1118 > 0.0;
    float _2048 = _195 * _1976;
    int _2050 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2052 = _2050 != 0;
    float _2054 = floor(_2040);
    float _2056 = _201 * _1976;
    float _2058 = fma(_193, _1974, _2048);
    float _2060 = fma(_187, _1974, _2044);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2066 = fma(_199, _1974, _2056);
    float _2068 = fma(_191, _1978, _2060);
    int _2070 = ~_2042;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    float _2076 = fma(_203, _1978, _2066);
    int _2078 = _2074;
    if (!_2046)
    {
        int _2080 = ~_2042;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    float _2086 = 1.0 / _2064;
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2088;
    float _2092 = fma(_197, _1978, _2058);
    bool _2094 = _2054 >= 0.0;
    bool _2096 = isnan(_2054);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = _1856 * 2.0;
    float _2106 = _2090 * _1498;
    int _2108 = _2102 ? 0 : 1;
    float _2110 = in.m_60.w;
    bool _2112 = _2054 > 0.0;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2120 = _2118 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2122 = _2116 * _1512;
    float _2124 = floor(_2104);
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2126;
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2142 = _2128 * _1572;
    int _2144 = ~_2108;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = _2136 * _1588;
    float _2152 = 1.0 / _2120;
    float _2154 = _2140 * _2086;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2158 = _899 + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2162 = _899 + _2160;
    int _2164 = _2148;
    if (!_2112)
    {
        int _2166 = ~_2108;
        int _2168 = _2166 + 1;
        _2164 = _2168;
    }
    int _2170 = _2164;
    float _2172 = _2132 * _1614;
    float _2174 = fma(_2106, _2158, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2176 = float(uint(_1226));
    float _2178 = fma(_2122, _2162, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2180 = _2124 >= 0.0;
    bool _2182 = isnan(_2124);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(0.0);
    bool _2188 = _2184 || _2186;
    float _2190 = _2068 + _2110;
    bool _2192 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2194 = isnan(_899);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2200 = _2196 || _2198;
    float _2202 = float(_2200);
    float _2204 = as_type<float>(_929) * _2176;
    int _2206 = _2188 ? 0 : 1;
    bool _2208 = _2124 > 0.0;
    float _2210 = _1550 * _2152;
    float _2212 = float(uint(_1404));
    float _2214 = trunc(_2204);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    bool _2220 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2222 = isnan(_899);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2228 = _2224 || _2226;
    float _2230 = float(_2228);
    float _2232 = -_2202;
    float _2234 = _2232 + 1.0;
    bool _2236 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2238 = isnan(_899);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2244 = _2240 || _2242;
    float _2246 = float(_2244);
    float _2248 = as_type<float>(_984) * _2212;
    bool _2250 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2252 = isnan(_899);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2258 = _2254 || _2256;
    float _2260 = float(_2258);
    float _2262 = _2230 * _2234;
    float _2264 = -_2230;
    float _2266 = _2264 + 1.0;
    float _2268 = -_2246;
    float _2270 = _2268 + 1.0;
    bool _2272 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2274 = isnan(_899);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    float _2284 = trunc(_2248);
    float _2286 = precise::max(_2284, 0.0);
    uint _2288 = uint(_2286);
    float _2290 = _2260 * _2266;
    float _2292 = _1682 * _2270;
    float _2294 = -_2260;
    float _2296 = _2294 + 1.0;
    float _2298 = -_1682;
    float _2300 = _2298 + 1.0;
    float _2302 = -_2282;
    float _2304 = _2302 + 1.0;
    int _2306 = _1554 * int(_2218);
    int _2308 = _2306 + _1226;
    float _2310 = _2282 * _2296;
    float _2312 = _1884 * _2300;
    float _2314 = _2246 * _2304;
    float _2316 = -_1884;
    float _2318 = _2316 + 1.0;
    float _2320 = float(uint(_2308));
    float _2322 = in.m_62.w;
    float _2324 = float(_2084);
    float _2326 = _1920 * _2318;
    int _2328 = _2010 * int(_2288);
    int _2330 = _2328 + _1404;
    float _2332 = as_type<float>(_929) * _2320;
    float _2334 = in.m_64.w;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2338 = _899 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2342 = _899 + _2340;
    float _2344 = float(uint(_2330));
    float _2346 = _2174 * _2326;
    float _2348 = fma(_2142, _2338, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2350 = fma(_2172, _2342, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2352 = trunc(_2332);
    float _2354 = precise::max(_2352, 0.0);
    uint _2356 = uint(_2354);
    float _2358 = as_type<float>(_984) * _2344;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2362 = _899 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2366 = _899 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2370 = _899 + _2368;
    float _2372 = -_1920;
    float _2374 = _2372 + 1.0;
    float _2376 = fma(_2154, _2362, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2378 = fma(_2150, _2366, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2380 = trunc(_2358);
    float _2382 = precise::max(_2380, 0.0);
    uint _2384 = uint(_2382);
    float _2386 = fma(_2210, _2370, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2388 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2346);
    int _2390 = ~_2206;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    float _2396 = _2092 + _2322;
    int _2398 = _2394;
    if (!_2208)
    {
        int _2400 = ~_2206;
        int _2402 = _2400 + 1;
        _2398 = _2402;
    }
    int _2404 = _2398;
    float _2406 = fma(_2178, _2312, _2388);
    int _2408 = ~_907;
    int _2410 = _2408 + 1;
    float _2412 = _1730 + 0.5;
    float _2414 = _2076 + _2334;
    float _2416 = fma(_2348, _2292, _2406);
    int _2418 = int(_2218) + int(_2356);
    float _2420 = _1808 + (-0.5);
    float _2422 = fma(_2350, _2314, _2416);
    int _2424 = ~_927;
    int _2426 = _2424 + 1;
    float _2428 = _1066 + _1060;
    int _2430 = int(_2288) + int(_2384);
    int _2432 = _2410 * _2418;
    int _2434 = _2432 + _1226;
    float _2436 = _2428 + (-1.0);
    int _2438 = _1570 >> 31;
    int _2440 = _2426 * _2430;
    int _2442 = _2440 + _1404;
    bool _2444 = !_2052;
    float _2446 = _2444 ? _239 : as_type<float>(_1836);
    float _2448 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2450 = uint(_2434) >= uint(_907);
    float _2452 = fma(_2378, _2310, _2422);
    bool _2454 = !_1822;
    float _2456 = _2454 ? _219 : as_type<float>(_1846);
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2460 = _2190 + _2458;
    bool _2462 = uint(_2442) >= uint(_927);
    float _2464 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1898);
    bool _2466 = !_2450;
    int _2468 = _2466 ? 0 : (-1);
    float _2470 = -_2420;
    float _2472 = -_1890;
    float _2474 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2472);
    int _2476 = _2438 & 3;
    float _2478 = _2456 + (-0.5);
    int _2480 = _1708 >> 31;
    float _2482 = fma(_2376, _2290, _2452);
    bool _2484 = _1578 != 3;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2488 = _2396 + _2486;
    int _2490 = _1570 + _2476;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2494 = _2480 & 3;
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2498 = _2490 >> 2;
    float _2500 = -_1866;
    float _2502 = _2500 + 1.0;
    int _2504 = _1708 + _2494;
    float _2506 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2496);
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2510 = _2414 + _2508;
    int _2512 = _2498 << 4;
    int _2514 = _2512 + 368;
    float _2516 = -_1474;
    float _2518 = _2516 + 1.0;
    int _2520 = _2504 >> 2;
    float _2522 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2506);
    bool _2524 = !_2462;
    int _2526 = _2524 ? 0 : (-1);
    uint _2528 = uint(int(uint(_2514) >> uint(2)));
    uint _2530 = uint(int(uint(int(_2528)) >> uint(2)));
    int _2532 = int(_2528) & 3;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[int(_2530)][_2532];
    int _2536 = int(_2528) + 1;
    uint _2538 = uint(int(uint(_2536) >> uint(2)));
    int _2540 = _2536 & 3;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[int(_2538)][_2540];
    bool _2544 = _1744 != 3;
    float _2546 = fma(_2518, _1808, _2474);
    int _2548 = _2520 << 4;
    int _2550 = _2548 + 800;
    float _2552 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2556 = _2554 != 0;
    int _2558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2560 = _2558 != 0;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2564 = _2562 != 0;
    float _2566 = _1982 + 0.5;
    bool _2568 = !_2544;
    int _2570 = _2568 ? 0 : (-1);
    uint _2572 = uint(int(uint(_2550) >> uint(2)));
    uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
    int _2576 = int(_2572) & 3;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[int(_2574)][_2576];
    int _2580 = int(_2572) + 1;
    uint _2582 = uint(int(uint(_2580) >> uint(2)));
    int _2584 = _2580 & 3;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[int(_2582)][_2584];
    bool _2588 = _2522 >= 0.0;
    float _2590 = _2446 + 0.5;
    float _2592 = fma(_2386, _2262, _2482);
    float _2594 = fma(_2552, _2566, _1942);
    bool _2596 = !_1580;
    int _2598 = _2596 ? 0 : 1;
    float _2600 = fma(_2590, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1850);
    float _2602 = -_2478;
    float _2604 = -_1812;
    float _2606 = fma(_2602, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2604);
    float _2608 = -_2502;
    float _2610 = fma(_2608, _1730, _2464);
    int _2612 = _2514 + 8;
    uint _2614 = uint(int(uint(_2612) >> uint(2)));
    uint _2616 = uint(int(uint(int(_2614)) >> uint(2)));
    int _2618 = int(_2614) & 3;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[int(_2616)][_2618];
    int _2622 = int(_2614) + 1;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    int _2626 = _2622 & 3;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[int(_2624)][_2626];
    int _2630 = abs(_1632);
    float _2632 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2592);
    int _2634 = abs(_1792);
    float _2636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2638 = _2452;
    if (_2588)
    {
        _2638 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2640 = _2638;
    float _2642 = _1714 + (-0.5);
    int _2644 = _2550 + 8;
    uint _2646 = uint(int(uint(_2644) >> uint(2)));
    uint _2648 = uint(int(uint(int(_2646)) >> uint(2)));
    int _2650 = int(_2646) & 3;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[int(_2648)][_2650];
    int _2654 = int(_2646) + 1;
    uint _2656 = uint(int(uint(_2654) >> uint(2)));
    int _2658 = _2654 & 3;
    float _2660 = (*spvDescriptorSet0.vp_c9)._m0[int(_2656)][_2658];
    int _2662 = abs(_2598);
    out.m_74.x = _2610;
    out.m_74.y = _2546;
    int _2664 = as_type<int>(_2640);
    if (_2588)
    {
        float _2666 = _2640 * 5.0;
        _2664 = as_type<int>(_2666);
    }
    int _2668 = _2664;
    bool _2670 = !_2484;
    int _2672 = _2670 ? 0 : (-1);
    out.m_76.x = _2632;
    bool _2674 = !_1746;
    int _2676 = _2674 ? 0 : 1;
    int _2678 = abs(_2672);
    if (_2588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8211 = as_type<float>(_2668);
        out.gl_Position.z = _8211;
    }
    int _2680 = ~_2430;
    int _2682 = _2680 + _2526;
    int _2684 = _2682 + 1;
    float _2686 = _2636 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2688 = ~_2418;
    int _2690 = _2688 + _2468;
    int _2692 = _2690 + 1;
    if (_2588)
    {
        out.m_53.x = 0.0;
    }
    bool _2694 = _907 == 0;
    int _2696 = _927 * _2684;
    int _2698 = _2696 + _1404;
    bool _2700 = !_2560;
    int _2702 = _2700 ? 0 : 1;
    int _2704 = _907 * _2692;
    int _2706 = _2704 + _1226;
    float _2708 = -_2686;
    float _2710 = -_2006;
    float _2712 = fma(_2708, _2642, _2710);
    float _2714 = float(_2404);
    int _2716 = ~_2630;
    int _2718 = _2716 + 1;
    int _2720 = _2718 + 1;
    int _2722 = ~_2662;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    int _2728 = _2720 * as_type<int>(_2542);
    int _2730 = ~_2634;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    int _2736 = abs(_2676);
    int _2738 = _2726 * as_type<int>(_2534);
    int _2740 = _2738 + _2728;
    int _2742 = abs(_1692);
    int _2744 = _2734 * as_type<int>(_2586);
    int _2746 = abs(_1818);
    int _2748 = ~_2742;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    int _2754 = ~_2736;
    int _2756 = _2754 + 1;
    int _2758 = _2756 + 1;
    int _2760 = _2752 * as_type<int>(_2620);
    int _2762 = _2760 + _2740;
    int _2764 = ~_2678;
    int _2766 = _2764 + 1;
    int _2768 = _2766 + 1;
    float _2770 = _2488 * _2488;
    int _2772 = abs(_2570);
    int _2774 = _2758 * as_type<int>(_2578);
    int _2776 = _2774 + _2744;
    int _2778 = ~_2746;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    int _2784 = _2768 * as_type<int>(_2628);
    int _2786 = _2784 + _2762;
    int _2788 = abs(_1750);
    float _2790 = fma(_2460, _2460, _2770);
    int _2792 = ~_2772;
    int _2794 = _2792 + 1;
    int _2796 = _2794 + 1;
    int _2798 = _2782 * as_type<int>(_2652);
    int _2800 = _2798 + _2776;
    int _2802 = abs(_2702);
    float _2804 = fma(_2510, _2510, _2790);
    int _2806 = abs(_1762);
    int _2808 = _2796 * as_type<int>(_2660);
    int _2810 = _2808 + _2800;
    int _2812 = ~_2788;
    int _2814 = _2812 + 1;
    int _2816 = _2814 + 1;
    float _2818 = float(_2802);
    float _2820 = rsqrt(_2804);
    bool _2822 = !_2694;
    int _2824 = _2822 ? _2706 : (-1);
    int _2826 = _2786 * _2816;
    int _2828 = ~_2806;
    int _2830 = _2828 + 1;
    int _2832 = _2830 + 1;
    float _2834 = -_1724;
    float _2836 = _2834 + 1.0;
    bool _2838 = _927 == 0;
    int _2840 = _2824 * _2788;
    int _2842 = _2840 + _2826;
    float _2844 = -_2012;
    float _2846 = _2844 + 1.0;
    int _2848 = _2810 * _2832;
    bool _2850 = !_2838;
    int _2852 = _2850 ? _2698 : (-1);
    float _2854 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2856 = -_2034;
    float _2858 = fma(_1982, _2856, _2594);
    float _2860 = fma(_2456, _2836, _2606);
    float _2862 = _2818 * _2324;
    int _2864 = _2852 * _2806;
    int _2866 = _2864 + _2848;
    float _2868 = -_2846;
    float _2870 = fma(_2446, _2868, _2600);
    bool _2872 = !_2556;
    int _2874 = _2872 ? 0 : 1;
    float _2876 = _2854 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2878 = abs(_2874);
    float _2880 = _2876 * _2820;
    float _2882 = in.m_78.x;
    float _2884 = in.m_78.y;
    float _2886 = in.m_78.z;
    float _2888 = fma(_1714, _2016, _2712);
    float _2890 = _2488 * _2880;
    float _2892 = _2460 * _2880;
    float _2894 = float(_2842);
    out.m_80.x = _2870;
    out.m_80.y = _2860;
    out.m_80.z = _2858;
    out.m_80.w = _2888;
    float _2896 = -_2890;
    float _2898 = _2488 + _2896;
    float _2900 = float(_2866);
    float _2902 = -_2892;
    float _2904 = _2460 + _2902;
    float _2906 = float(_2878);
    float _2908 = _2898 * _2898;
    out.m_82.x = _2894;
    float _2910 = _1060 + (-0.5);
    bool _2912 = !_2564;
    int _2914 = _2912 ? 0 : 1;
    float _2916 = _2906 * _2714;
    out.m_82.w = _2900;
    float _2918 = fma(_2904, _2904, _2908);
    if (_2588)
    {
        return out;
    }
    float _2920 = _2916 * (-2.0);
    float _2922 = -_2890;
    float _2924 = _2396 + _2922;
    float _2926 = _2510 * _2880;
    float _2928 = -_2892;
    float _2930 = _2190 + _2928;
    float _2932 = fma(_2920, _2882, _2882);
    float _2934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2936 = _2924 + _2934;
    float _2938 = fma(_2448, _2920, _2448);
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2942 = _2930 + _2940;
    float _2944 = fma(_2910, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2932);
    float _2946 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2948 = -_2926;
    float _2950 = _2414 + _2948;
    float _2952 = _1066 + _1856;
    float _2954 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2946);
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2958 = _2950 + _2956;
    float _2960 = _2952 + (-1.0);
    int _2962 = abs(_2914);
    float _2964 = _1066 + (-0.5);
    float _2966 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2954);
    float _2968 = _2862 * (-2.0);
    float _2970 = fma(_2960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2972 = float(_2170);
    float _2974 = -_2926;
    float _2976 = _2510 + _2974;
    float _2978 = fma(_2968, _2884, _2884);
    float _2980 = float(_2962);
    float _2982 = fma(_2970, _2968, _2970);
    bool _2984 = _2966 >= 0.0;
    float _2986 = fma(_2964, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2978);
    float _2988 = fma(_2938, _2038, _2944);
    float _2990 = _2980 * _2972;
    float _2992 = _1856 + _1060;
    float _2994 = fma(_2982, _2038, _2986);
    float _2996 = _2990 * (-2.0);
    float _2998 = fma(_2976, _2976, _2918);
    float _3000 = _2988 * 0.15915493667125701904296875;
    float _3002 = _2992 + (-1.0);
    float _3004 = _2994 * 0.15915493667125701904296875;
    float _3006 = fma(_2996, _2886, _2886);
    float _3008 = _1856 + (-0.5);
    float _3010 = _2990;
    float _3012 = _2926;
    if (_2984)
    {
        _3010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3014 = _3010;
    float _3016 = sqrt(_2998);
    float _3018 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3020 = fma(_3008, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3006);
    int _3022 = as_type<int>(_3014);
    if (_2984)
    {
        out.m_53.x = 0.0;
    }
    float _3024 = fma(_3018, _2996, _3018);
    if (_2984)
    {
        float _3026 = _3014 * 5.0;
        _3022 = as_type<int>(_3026);
    }
    int _3028 = _3022;
    float _3030 = _3000 * 6.283185482025146484375;
    float _3032 = sin(_3030);
    float _3034 = fma(_3024, _2038, _3020);
    if (_2984)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8732 = as_type<float>(_3028);
        out.gl_Position.z = _8732;
    }
    float _3036 = _3034 * 0.15915493667125701904296875;
    float _3038 = _3000 * 6.283185482025146484375;
    float _3040 = cos(_3038);
    float _3042 = _3004 * 6.283185482025146484375;
    float _3044 = sin(_3042);
    float _3046 = _3004 * 6.283185482025146484375;
    float _3048 = cos(_3046);
    if (_2984)
    {
        return out;
    }
    float _3050 = _3036 * 6.283185482025146484375;
    float _3052 = cos(_3050);
    float _3054 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3056 = _2820 * _3016;
    float _3058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _3060 = _3032 * _3044;
    float _3062 = _3040 * _3044;
    float _3064 = _3056 * _3054;
    float _3066 = _2854 * _3056;
    float _3068 = _3036 * 6.283185482025146484375;
    float _3070 = sin(_3068);
    float _3072 = _3032 * _3048;
    float _3074 = _3058 * _3064;
    float _3076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _3078 = _3040 * _3048;
    float _3080 = _3076 * _3066;
    float _3082 = _3040 * _3052;
    float _3084 = _3048 * _3052;
    float _3086 = _3032 * _3052;
    float _3088 = _3044 * _3052;
    float _3090 = _3082 * _3074;
    float _3092 = _3056 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3094 = _3092 * 0.5;
    float _3096 = fma(_3070, _3078, _3060);
    float _3098 = -_3072;
    float _3100 = fma(_3070, _3062, _3098);
    float _3102 = -_3074;
    float _3104 = _3070 * _3102;
    float _3106 = -_3062;
    float _3108 = fma(_3070, _3072, _3106);
    float _3110 = fma(_3096, _3080, _3090);
    float _3112 = _3086 * _3074;
    float _3114 = fma(_3084, _3080, _3104);
    float _3116 = fma(_3070, _3060, _3078);
    float _3118 = fma(_3100, _3094, _3110);
    float _3120 = fma(_3108, _3080, _3112);
    float _3122 = fma(_3088, _3094, _3114);
    float _3124 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3126 = fma(_3116, _3094, _3120);
    float _3128 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3130 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3124);
    float _3132 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3128);
    float _3134 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3130);
    float _3136 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3132);
    float _3138 = _3134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3140 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3142 = _2414 + _3138;
    float _3144 = _2190 + _3140;
    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3148 = _3142 + _3146;
    float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3152 = _3144 + _3150;
    float _3154 = _3148 * _3148;
    float _3156 = fma(_3152, _3152, _3154);
    float _3158 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3160 = sqrt(_3156);
    float _3162 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3158);
    float _3164 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3162);
    float _3166 = _3164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3168 = _2396 + _3166;
    bool _3170 = _3160 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3172 = _3158;
    float _3174 = _3126;
    float _3176 = _3142;
    if (!_3170)
    {
        _3172 = _3144;
    }
    float _3178 = _3172;
    float _3180 = _3178;
    if (!_3170)
    {
        _3174 = _3168;
    }
    float _3182 = _3174;
    bool _3184 = !_3170;
    float _3186 = _3182;
    if (!_3184)
    {
        float _3188 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3192 = _3160 + _3190;
        float _3194 = rsqrt(_3156);
        float _3196 = _3192 * _3188;
        float _3198 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3200 = _3196 * 0.15915493667125701904296875;
        float _3202 = _3200 * 6.283185482025146484375;
        float _3204 = cos(_3202);
        float _3206 = _3200 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        float _3210 = _3204 + (-1.0);
        float _3212 = fma(_3208, _3198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3214 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3216 = _3194 * _3212;
        float _3218 = fma(_3168, _3204, _3214);
        float _3220 = fma(_3152, _3216, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3222 = fma(_3148, _3216, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3186 = _3218;
        _3180 = _3220;
        _3176 = _3222;
    }
    float _3224 = _3186;
    float _3226 = _3180;
    float _3228 = _3176;
    float _3230 = -_2396;
    float _3232 = _3230 + _3224;
    float _3234 = -_2190;
    float _3236 = _3234 + _3226;
    float _3238 = -_2414;
    float _3240 = _3238 + _3228;
    float _3242 = _3232 * _3232;
    float _3244 = fma(_3236, _3236, _3242);
    float _3246 = fma(_3240, _3240, _3244);
    float _3248 = sqrt(_3246);
    bool _3250 = _3248 > 0.0;
    bool _3252 = !_3250;
    float _3254 = _3224;
    float _3256 = _3226;
    float _3258 = _3228;
    float _3260 = _3246;
    float _3262 = _3236;
    if (!_3252)
    {
        float _3264 = _233 * _233;
        float _3266 = fma(_229, _229, _3264);
        float _3268 = fma(_235, _235, _3266);
        float _3270 = rsqrt(_3246);
        float _3272 = sqrt(_3268);
        float _3274 = _3232 * _3270;
        float _3276 = _3240 * _3270;
        bool _3278 = _3272 > 0.0;
        float _3280 = _3236 * _3270;
        bool _3282 = !_3278;
        if (!_3282)
        {
            float _3284 = rsqrt(_3268);
            float _3286 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3288 = _233 * _3284;
            float _3290 = _229 * _3284;
            float _3292 = _3274 * _3288;
            float _3294 = _235 * _3284;
            float _3296 = fma(_3280, _3290, _3292);
            float _3298 = _3286 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3300 = fma(_3276, _3294, _3296);
            float _3302 = _3300 * _3298;
            float _3304 = fma(_229, _3302, _3226);
            float _3306 = fma(_233, _3302, _3224);
            float _3308 = fma(_235, _3302, _3228);
            _3254 = _3306;
            _3256 = _3304;
            _3258 = _3308;
            _3260 = _3286;
        }
    }
    float _3310 = _3254;
    float _3312 = _3256;
    float _3314 = _3258;
    float _3316 = _3260;
    float _3318 = -_2890;
    float _3320 = _3318 + _3310;
    float _3322 = -_2892;
    float _3324 = _3322 + _3312;
    float _3326 = -_2926;
    float _3328 = _3326 + _3314;
    float _3330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3332 = _3320 + _3330;
    float _3334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3336 = _3324 + _3334;
    float _3338 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3340 = _3328 + _3338;
    float _3342 = _3332 * _3332;
    float _3344 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3346 = fma(_3336, _3336, _3342);
    float _3348 = fma(_3340, _3340, _3346);
    float _3350 = rsqrt(_3348);
    float _3352 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3354 = _3336 * _3352;
    float _3356 = _3340 * _3352;
    float _3358 = _3354 * _3354;
    float _3360 = _3356 * _3356;
    float _3362 = _3358 + _3360;
    float _3364 = sqrt(_3362);
    bool _3366 = _3364 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3370 = _3364 + _3368;
    float _3372 = _3340;
    float _3374 = _3362;
    float _3376 = _3370;
    float _3378 = _3316;
    float _3380 = _3332;
    float _3382 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3366)
    {
        float _3384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3372 = _3384;
    }
    float _3386 = _3372;
    if (_3366)
    {
        float _3388 = rsqrt(_3362);
        _3374 = _3388;
    }
    float _3390 = _3374;
    float _3392 = _3390;
    if (_3366)
    {
        float _3394 = _3370 * _3386;
        _3376 = _3394;
    }
    float _3396 = _3376;
    if (_3366)
    {
        float _3398 = _3396 * 0.15915493667125701904296875;
        _3378 = _3398;
    }
    float _3400 = _3378;
    float _3402 = _3350;
    float _3404 = _3400;
    if (_3366)
    {
        float _3406 = _3400 * 6.283185482025146484375;
        float _3408 = sin(_3406);
        _3402 = _3408;
    }
    float _3410 = _3402;
    float _3412 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3414 = precise::max(0.0, _3412);
    float _3416 = _3386;
    if (_3366)
    {
        float _3418 = _3400 * 6.283185482025146484375;
        float _3420 = cos(_3418);
        _3416 = _3420;
    }
    float _3422 = _3416;
    float _3424 = -_3352;
    float _3426 = -_3414;
    float _3428 = fma(_3332, _3424, _3426);
    float _3430 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_3366)
    {
        float _3432 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3380 = _3432;
    }
    float _3434 = _3380;
    if (!_3366)
    {
        _3404 = _3354;
    }
    float _3436 = _3404;
    float _3438 = _3410;
    float _3440 = _3436;
    if (_3366)
    {
        float _3442 = fma(_3410, _3434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3382 = _3442;
    }
    float _3444 = _3382;
    float _3446 = floor(_3430);
    float _3448 = _3444;
    if (_3366)
    {
        float _3450 = _3422 + (-1.0);
        _3438 = _3450;
    }
    float _3452 = _3438;
    float _3454 = _3452;
    if (_3366)
    {
        float _3456 = _3390 * _3444;
        _3262 = _3456;
    }
    float _3458 = _3262;
    if (!_3366)
    {
        _3448 = _3428;
    }
    float _3460 = _3448;
    float _3462 = _3460;
    if (_3366)
    {
        float _3464 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3012 = _3464;
    }
    float _3466 = _3012;
    float _3468 = _3466;
    if (_3366)
    {
        float _3470 = _3354 * _3458;
        _3440 = _3470;
    }
    float _3472 = _3440;
    if (!_3366)
    {
        _3392 = _3356;
    }
    float _3474 = _3392;
    float _3476 = _3474;
    if (_3366)
    {
        float _3478 = _3356 * _3458;
        _3476 = _3478;
    }
    float _3480 = _3476;
    if (!_3366)
    {
        _3454 = _3358;
    }
    float _3482 = _3454;
    float _3484 = _3482;
    if (_3366)
    {
        float _3486 = fma(_3428, _3422, _3466);
        _3462 = _3486;
    }
    float _3488 = _3462;
    if (_3366)
    {
        float _3490 = _3472 * _3472;
        _3484 = _3490;
    }
    float _3492 = _3484;
    if (!_3366)
    {
        _3468 = _3360;
    }
    float _3494 = _3468;
    float _3496 = _3494;
    if (_3366)
    {
        float _3498 = _3480 * _3480;
        _3496 = _3498;
    }
    float _3500 = _3496;
    float _3502 = sqrt(_3348);
    float _3504 = fma(_3488, _3488, _3492);
    float _3506 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3508 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3510 = _3504 + _3500;
    float _3512 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3514 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3506);
    float _3516 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3508);
    float _3518 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3520 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3512);
    float _3522 = rsqrt(_3510);
    float _3524 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3514);
    float _3526 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3518);
    float _3528 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3520);
    float _3530 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3516);
    float _3532 = _3524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3534 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3526);
    float _3536 = _3528 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3540 = fma(_3502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3538);
    float _3542 = precise::clamp(_3540, 0.0, 1.0);
    float _3544 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3546 = _3534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3548 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3550 = -_3542;
    float _3552 = _3550 + 1.0;
    float _3554 = -_3544;
    float _3556 = fma(_3554, _3344, 1.0);
    float _3558 = _3530 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3560 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3548);
    float _3562 = _3522 * _3472;
    float _3564 = _3522 * _3480;
    float _3566 = abs(_3552);
    float _3568 = log2(_3566);
    float _3570 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3560);
    float _3572 = _3562 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3574 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3570);
    float _3576 = _3522 * _3488;
    float _3578 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3580 = log2(_3556);
    float _3582 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3584 = -_3572;
    float _3586 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3584);
    float _3588 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3578);
    float _3590 = -_3564;
    float _3592 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3586);
    float _3594 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3596 = -_3446;
    float _3598 = _3430 + _3596;
    float _3600 = fma(_3592, -0.5, 0.5);
    float _3602 = 1.0 / _3574;
    float _3604 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3606 = fma(_3592, 0.5, 0.5);
    float _3608 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3588);
    float _3610 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3604);
    float _3612 = fma(_3606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3614 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3608);
    float _3616 = exp2(_3594);
    float _3618 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3610);
    float _3620 = fma(_3606, _3612, -0.212114393711090087890625);
    float _3622 = _3580 * 0.693147182464599609375;
    float _3624 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3618);
    float _3626 = fma(_3606, _3620, 1.570728778839111328125);
    float _3628 = _3622 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3630 = sqrt(_3600);
    float _3632 = _3576 + 1.0;
    float _3634 = _3624 * _3602;
    float _3636 = _3614 * _3602;
    float _3638 = fma(_3634, 0.5, 0.5);
    float _3640 = fma(_3636, -0.5, 0.5);
    float _3642 = floor(_3582);
    float _3644 = -_3576;
    float _3646 = fma(_3616, _3632, _3644);
    float _3648 = fma(_3646, 0.5, 0.5);
    float _3650 = _3630 * 0.636619746685028076171875;
    float _3652 = -_3626;
    float _3654 = fma(_3650, _3652, 1.0);
    float _3656 = -_3642;
    float _3658 = _3582 + _3656;
    float2 _9742 = float2(_3598, _3658);
    float _3660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9742, float2(0.0), isnan(_9742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9742, float2(0.0), isnan(_9742)), level(0.0)).x;
    float3 _9753 = float3(_3638, _3640, _3628);
    float _3662 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9753, float3(0.0), isnan(_9753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9753, float3(0.0), isnan(_9753)), level(0.0)).x;
    float3 _9764 = float3(_3638, _3640, _3628);
    float4 _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9764, float3(0.0), isnan(_9764)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9764, float3(0.0), isnan(_9764)), level(0.0)).xyzw;
    float _3667 = _3665.x;
    float _3669 = _3665.y;
    float _3671 = _3665.z;
    float _3673 = _3665.w;
    float2 _9780 = float2(_3654, _3648);
    float3 _3677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9780, float2(0.0), isnan(_9780)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9780, float2(0.0), isnan(_9780)), level(0.0)).xyz;
    float _3679 = _3677.x;
    float _3681 = _3677.y;
    float _3683 = _3677.z;
    float _3685 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3687 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3689 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3691 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3693 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3685);
    float _3695 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3687);
    float _3697 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3699 = fma(_2950, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3693);
    float _3701 = fma(_2950, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3695);
    float _3703 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3705 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3707 = _3699 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3709 = _3701 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3711 = fma(_3703, _3703, 1.0);
    float _3713 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3715 = 1.0 / _3707;
    float _3717 = _3709 + _3707;
    float _3719 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3721 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3723 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3725 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3705);
    float _3727 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3719);
    float _3729 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3721);
    float _3731 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3713);
    float _3733 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3735 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3723);
    float _3737 = rsqrt(_3711);
    float _3739 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3741 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3733);
    bool _3743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3745 = isnan(0.5);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3751 = _3747 || _3749;
    float _3753 = _3717 * _3715;
    float _3755 = _3753 * 0.5;
    float _3757 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3759 = fma(_3755, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3757);
    float _3761 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3729);
    float _3763 = 1.0 / _3759;
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3767 = _3763 * _3765;
    float _3769 = -_3070;
    float _3771 = fma(_3769, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3689);
    float _3773 = abs(_3767);
    float _3775 = log2(_3773);
    float _3777 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3771);
    float _3779 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3725);
    float _3781 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3741);
    float _3783 = _3775 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3785 = -_3070;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3691);
    float _3789 = -_3070;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3697);
    float _3793 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3787);
    float _3795 = exp2(_3783);
    float _3797 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3791);
    float _3799 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3727);
    float _3801 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3735);
    float _3803 = _3703 * _3737;
    float _3805 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3731);
    float _3807 = _3703 * _3797;
    float _3809 = -_3799;
    float _3811 = _3803 * _3809;
    float _3813 = -_3761;
    float _3815 = _3803 * _3813;
    float _3817 = -_3801;
    float _3819 = _3803 * _3817;
    out.m_84.x = _3779;
    out.m_84.y = _3781;
    out.m_84.z = _3805;
    float _3821 = fma(_3737, _3777, _3811);
    float _3823 = fma(_3737, _3793, _3815);
    float _3825 = _3703 * _3777;
    float _3827 = _3703 * _3793;
    float _3829 = fma(_3795, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = fma(_3737, _3797, _3819);
    float _3835 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3837 = in.m_86.x;
    float _3839 = fma(_3831, -2.0, 3.0);
    float _3841 = _3831 * _3831;
    float _3843 = fma(_3739, _3779, _3825);
    float _3845 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3847 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3835);
    float _3849 = _3841 * _3839;
    bool _3851 = _3767 <= 8000.0;
    bool _3853 = isnan(_3767);
    bool _3855 = _3851 || _3853;
    bool _3857 = isnan(8000.0);
    bool _3859 = _3855 || _3857;
    float _3861 = float(_3859);
    float _3863 = fma(_3739, _3805, _3807);
    float _3865 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3847);
    float _3867 = -_3849;
    float _3869 = _3867 + 1.0;
    float _3871 = exp2(_3845);
    float _3873 = fma(_3739, _3781, _3827);
    float _3875 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3865);
    float _3877 = fma(_3869, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3849);
    float _3879 = _3624 + _3574;
    out.m_88.x = _3821;
    out.m_88.y = _3823;
    out.m_88.z = _3833;
    float _3881 = _3875 + _3574;
    float _3883 = _3861 * _3877;
    float _3885 = _3574 * 0.5;
    float _3887 = _3881 * 0.5;
    float _3889 = _3879 * 0.5;
    float _3891 = fma(_3614, -0.5, _3885);
    float _3893 = _3821;
    float _3895 = _3875;
    float _3897 = _3624;
    float _3899 = _3614;
    if (_3751)
    {
        _3893 = 1.0;
    }
    float _3901 = _3893;
    float _3903 = _3901;
    float _3905 = _3669;
    if (!_3751)
    {
        float _3907 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3909 = _3907 * 0.15915493667125701904296875;
        float _3911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3913;
        float _3917 = _3909 * 6.283185482025146484375;
        float _3919 = cos(_3917);
        float _3921 = _3911 * 0.15915493667125701904296875;
        float _3923 = _3909 * 6.283185482025146484375;
        float _3925 = sin(_3923);
        float _3927 = 1.0 / _3919;
        float _3929 = _3921 * 6.283185482025146484375;
        float _3931 = cos(_3929);
        float _3933 = _3925 * _3927;
        float _3935 = _3921 * 6.283185482025146484375;
        float _3937 = sin(_3935);
        float _3939 = _3931 * _3933;
        float _3941 = 1.0 / _3915;
        float _3943 = 1.0 / _3939;
        float _3945 = _3937 * _3943;
        float _3947 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3949 = fma(_3767, _3945, _3947);
        float _3951 = _3949 * _3941;
        float _3953 = precise::clamp(_3951, 0.0, 1.0);
        _3903 = _3953;
    }
    float _3955 = _3903;
    float _3957 = -_3871;
    float _3959 = _3957 + 1.0;
    out.m_90.x = _3889;
    out.m_90.y = _3891;
    out.m_90.z = _3887;
    out.m_90.w = _3574;
    float _3961 = _3799 + _3843;
    float _3963 = _3761 + _3873;
    float _3965 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3967 = _3801 + _3863;
    float _3969 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3971 = -_3660;
    float _3973 = _3971 + 1.0;
    float _3975 = _3965 * _3662;
    float _3977 = -_3965;
    float _3979 = _3977 + 1.0;
    out.m_92.x = _3961;
    out.m_92.y = _3963;
    out.m_92.z = _3967;
    float _3981 = _3683 * _3975;
    float _3983 = _3973 * _3969;
    float _3985 = precise::clamp(_3983, 0.0, 1.0);
    out.m_94.x = _3324;
    out.m_94.y = _3320;
    out.m_94.z = _3328;
    float _3987 = _3673 * _3975;
    float _3989 = _3673 * _3979;
    float _3991 = fma(_3673, _3981, _3671);
    bool _3993 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3995 = isnan(_3502);
    bool _3997 = _3993 || _3995;
    bool _3999 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4001 = _3997 || _3999;
    float _4003 = fma(_3679, _3987, _3667);
    float _4005 = fma(_3681, _3987, _3669);
    float _4007 = -_3985;
    float _4009 = fma(_4007, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3624;
    out.gl_Position.y = _3614;
    out.gl_Position.z = _3875;
    out.gl_Position.w = _3574;
    float _4011 = _4009 * _3837;
    out.m_96.x = _4003;
    out.m_96.y = _4005;
    out.m_96.z = _3991;
    out.m_96.w = _3989;
    float _4013 = _4011 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4015 = _4011;
    float _4017 = _4013;
    if (!_4001)
    {
        _4015 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4019 = _4015;
    float _4021 = _4019;
    float _4023 = _4019;
    if (!_4001)
    {
        _3905 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4025 = _3905;
    out.m_98.x = _4013;
    float _4027 = _3955 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4029 = _4025;
    float _4031 = _4025;
    if (!_4001)
    {
        _3895 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4033 = _3895;
    float _4035 = _4033;
    float _4037 = _4033;
    if (!_4001)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4039 = _3897;
    float _4041 = _4039;
    float _4043 = _4039;
    if (!_4001)
    {
        _3899 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4045 = _3899;
    float _4047 = _4045;
    float _4049 = _4045;
    if (!_4001)
    {
        _4017 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4051 = _4017;
    bool _4053 = !_4001;
    float _4055 = _4051;
    float _4057 = _4051;
    if (!_4053)
    {
        bool _4059 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4061 = isnan(_3502);
        bool _4063 = _4059 || _4061;
        bool _4065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4067 = _4063 || _4065;
        if (!_4067)
        {
            float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4071 = _3502 + _4069;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4075 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4073;
            float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4081 = 1.0 / _4075;
            float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4095 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4097 = _4095 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4099 = _4071 * _4081;
            float _4101 = precise::clamp(_4099, 0.0, 1.0);
            float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4107 = fma(_4101, _4079, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4109 = fma(_4101, _4105, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4111 = fma(_4101, _4085, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4113 = fma(_4101, _4089, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4115 = fma(_4101, _4093, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4117 = fma(_4101, _4097, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4043 = _4111;
            _4031 = _4115;
            _4037 = _4107;
            _4023 = _4113;
            _4049 = _4109;
            _4057 = _4117;
            _4119 = true;
        }
        else
        {
            bool _4121 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4123 = isnan(_3502);
            bool _4125 = _4121 || _4123;
            bool _4127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4129 = _4125 || _4127;
            if (!_4129)
            {
                _4035 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4131 = _4035;
            _4037 = _4131;
            if (!_4129)
            {
                _4041 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4133 = _4041;
            _4043 = _4133;
            if (!_4129)
            {
                _4047 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4135 = _4047;
            _4049 = _4135;
            if (!_4129)
            {
                _4021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4137 = _4021;
            _4023 = _4137;
            if (!_4129)
            {
                _4029 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4139 = _4029;
            _4031 = _4139;
            if (!_4129)
            {
                _4055 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4141 = _4055;
            bool _4143 = !_4129;
            _4057 = _4141;
            if (!_4143)
            {
                bool _4145 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4147 = isnan(_3502);
                bool _4149 = _4145 || _4147;
                bool _4151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4153 = _4149 || _4151;
                if (!_4153)
                {
                    float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4157 = _3502 + _4155;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4161 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4159;
                    float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4167 = 1.0 / _4161;
                    float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4175 = _4173 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4179 = _4177 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4183 = _4181 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4185 = _4157 * _4167;
                    float _4187 = precise::clamp(_4185, 0.0, 1.0);
                    float _4189 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4193 = fma(_4187, _4165, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4195 = fma(_4187, _4191, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4197 = fma(_4187, _4171, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4199 = fma(_4187, _4175, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4201 = fma(_4187, _4179, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4203 = fma(_4187, _4183, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4043 = _4197;
                    _4031 = _4201;
                    _4037 = _4193;
                    _4023 = _4199;
                    _4049 = _4195;
                    _4057 = _4203;
                    _4119 = true;
                }
                else
                {
                    _4043 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4031 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4037 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4049 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4057 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4119 = false;
    float _4205 = _4043;
    float _4207 = _4031;
    float _4209 = _4037;
    float _4211 = _4023;
    float _4213 = _4049;
    float _4215 = _4057;
    float _4217 = fma(_3963, -0.5, 0.5);
    float _4219 = precise::clamp(_4217, 0.0, 1.0);
    float _4221 = -_4205;
    float _4223 = _4221 + _4207;
    float _4225 = _4027 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4227 = -_4209;
    float _4229 = _4227 + _4211;
    out.m_100.x = 0.0;
    float _4231 = fma(_4219, _4223, _4205);
    float _4233 = -_4213;
    float _4235 = _4233 + _4215;
    out.m_53.x = _4225;
    float _4237 = fma(_4219, _4229, _4209);
    float _4239 = _4231 * 0.586610972881317138671875;
    bool _4241 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4243 = fma(_4219, _4235, _4213);
    float _4245 = fma(_4237, 0.298911988735198974609375, _4239);
    bool _4247 = _3955 > 0.0;
    bool _4249 = isnan(_3955);
    bool _4251 = _4247 || _4249;
    bool _4253 = isnan(0.0);
    bool _4255 = _4251 || _4253;
    float _4257 = fma(_4243, 0.114477999508380889892578125, _4245);
    float _4259 = -_4257;
    float _4261 = _4237 + _4259;
    float _4263 = -_4257;
    float _4265 = _4231 + _4263;
    float _4267 = -_4257;
    float _4269 = _4243 + _4267;
    float _4271 = fma(_4261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    float _4273 = fma(_4265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    float _4275 = fma(_4269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    bool _4277 = !_4241;
    if (!_4277)
    {
        float _4279 = -_3320;
        float _4281 = _4279 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4283 = -_3324;
        float _4285 = _4283 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4287 = -_3328;
        float _4289 = _4287 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4291 = _4281 * _4281;
        float _4293 = fma(_4285, _4285, _4291);
        float _4295 = fma(_4289, _4289, _4293);
        float _4297 = sqrt(_4295);
        float _4299 = rsqrt(_4295);
        float _4301 = -_4297;
        float _4303 = _4301 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4305 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4307 = precise::clamp(_4305, 0.0, 1.0);
        float _4309 = _4285 * _4299;
        float _4311 = _4281 * _4299;
        float _4313 = abs(_4307);
        float _4315 = log2(_4313);
        float _4317 = _4289 * _4299;
        float _4319 = _4309 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4321 = _3963 * _4311;
        float _4323 = -_4311;
        float _4325 = -_4319;
        float _4327 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4325);
        float _4329 = fma(_3961, _4309, _4321);
        float _4331 = -_4317;
        float _4333 = fma(_4331, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4327);
        float _4335 = fma(_3967, _4317, _4329);
        float _4337 = precise::clamp(_4335, 0.0, 1.0);
        float _4339 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4341 = _4333 + _4339;
        float _4343 = _4315 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4345 = _4341 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4347 = precise::clamp(_4345, 0.0, 1.0);
        float _4349 = exp2(_4343);
        float _4351 = _4349 * _4347;
        float _4353 = _4337 * _4351;
        float _4355 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4357 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4359 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4355;
        out.m_100.y = _4357;
        out.m_100.z = _4359;
    }
    out.m_102.x = _4271;
    out.m_102.y = _4273;
    out.m_102.z = _4275;
    if (_4255)
    {
        return out;
    }
    float _4361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4361;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4119 = false;
    bool _685 = false;
    bool _541 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_46.w;
    float _118 = in.m_48.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = _118;
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_53.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4429 = as_type<float>(_145);
        out.gl_Position.z = _4429;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = float(_123);
    bool _161 = _127 >= _159;
    bool _163 = !_157;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _135;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _127 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _147 = as_type<int>(_175);
    }
    int _177 = _147;
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4492 = as_type<float>(_177);
        out.gl_Position.z = _4492;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_58.x;
    float _183 = in.m_58.y;
    float _185 = in.m_58.z;
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _215 = _183 * _189;
    bool _217 = !_211;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _183 * _195;
    float _223 = fma(_181, _187, _215);
    float _225 = _183 * _201;
    float _227 = fma(_181, _193, _221);
    float _229 = fma(_185, _191, _223);
    float _231 = fma(_181, _199, _225);
    float _233 = fma(_185, _197, _227);
    float _235 = fma(_185, _203, _231);
    bool _237 = !_207;
    float _239 = _237 ? (-0.5) : 0.5;
    bool _241 = !_213;
    float _259;
    if (!_241)
    {
        float _243 = in.m_66.x;
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _243 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        _259 = _171;
    }
    _261 = false;
    float _263 = _259;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _285 = 1.0 / _271;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _287;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _275;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _263 + _295;
    float _299 = 1.0 / _279;
    float _301 = _297 * _285;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _283;
    float _317 = _267 * _293;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _263 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _263 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _329 = _263 + _327;
    float _331 = 1.0 / _289;
    float _333 = _321 * _299;
    bool _335 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_263);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    bool _347 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _349 = isnan(_263);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _325 * _315;
    float _361 = -_313;
    float _363 = _361 + 1.0;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _345 * _363;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _379;
    float _383 = _329 * _331;
    bool _385 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _387 = isnan(_263);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = _357 * _367;
    float _399 = fma(_377, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _403 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _405 = isnan(_263);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _395 * _371;
    float _417 = -_395;
    float _419 = _417 + 1.0;
    bool _421 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _423 = isnan(_263);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _435 = _433 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = _413 * _419;
    float _443 = -_413;
    float _445 = _443 + 1.0;
    float _447 = -_431;
    float _449 = _447 + 1.0;
    float _451 = fma(_435, _317, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _453 = fma(_439, _317, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = _431 * _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _461;
    float _465 = _399 * _455;
    float _467 = _401 * _455;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _465);
    float _475 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _467);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _481 = fma(_459, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _483 = fma(_463, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _485 = fma(_451, _441, _473);
    float _487 = fma(_453, _441, _475);
    float _489 = fma(_479, _359, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_471, _359, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _497;
    float _501 = fma(_481, _415, _485);
    float _503 = fma(_483, _415, _487);
    float _505 = fma(_495, _383, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _507 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _509 = fma(_489, _397, _501);
    float _511 = fma(_491, _397, _503);
    float _513 = fma(_505, _373, _509);
    float _515 = fma(_507, _373, _511);
    float _517 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].x, _513);
    float _519 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[148].y, _515);
    bool _521 = !_291;
    float _539;
    if (!_521)
    {
        float _523 = in.m_66.x;
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        _539 = _171;
    }
    _541 = false;
    float _543 = _539;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _549 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_543);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_543);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _547;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _579;
    float _583 = -_559;
    float _585 = _583 + 1.0;
    bool _587 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _589 = isnan(_543);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _601 = 1.0 / _563;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = _581 * _577;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _611 = _543 + _609;
    float _613 = fma(_607, _611, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _615 = _575 * _585;
    float _617 = -_575;
    float _619 = _617 + 1.0;
    float _621 = _605 * _601;
    float _623 = -_597;
    float _625 = _623 + 1.0;
    float _627 = _613 * _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _543 + _629;
    float _633 = _559 * _625;
    float _635 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _637 = fma(_621, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _641 = fma(_637, _633, _635);
    float _643 = in.m_68.x;
    float _645 = in.m_68.y;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[117].x, _641);
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _659 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_70.x = _649;
    out.m_70.y = _655;
    out.m_70.z = _659;
    out.m_70.w = _657;
    float _661 = _519 * _645;
    float _663 = _517 * _643;
    bool _665 = !_599;
    float _683;
    if (!_665)
    {
        float _667 = in.m_66.x;
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _671 = _667 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _675 = _673 * _669;
        float _677 = floor(_675);
        float _679 = -_677;
        float _681 = _675 + _679;
        _683 = _681;
        _685 = true;
    }
    else
    {
        _683 = _171;
    }
    _685 = false;
    float _687 = _683;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _691 = _687 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _705 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _707 = isnan(_687);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _695;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _723 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _725 = isnan(_687);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _737 = 1.0 / _703;
    float _739 = _699 * _717;
    bool _741 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _743 = isnan(_687);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _721;
    float _755 = -_715;
    float _757 = _755 + 1.0;
    float _759 = fma(_739, _691, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _765 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _767 = isnan(_687);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_751;
    float _779 = _777 + 1.0;
    float _781 = _751 * _757;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _787 = 1.0 / _763;
    float _789 = -_775;
    float _791 = _789 + 1.0;
    float _793 = _733 * _779;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _795;
    float _799 = _785 * _737;
    float _801 = _715 * _791;
    float _803 = _759 * _793;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = _687 + _805;
    float _809 = -_733;
    float _811 = _809 + 1.0;
    bool _813 = _687 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _815 = isnan(_687);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = _797 * _753;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _833 = _687 + _831;
    float _835 = fma(_799, _807, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _837 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[131].x, _803);
    float _839 = -_823;
    float _841 = _839 + 1.0;
    float _843 = _829 * _787;
    float _845 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _849 = _687 + _847;
    float _851 = fma(_835, _781, _837);
    float _853 = _775 * _841;
    float _855 = fma(_843, _849, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _857 = fma(_845, _801, _851);
    float _859 = fma(_855, _853, _857);
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _867 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[135].x, _859);
    float _869 = _861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _869;
    out.m_72.y = _871;
    out.m_72.z = _873;
    out.m_72.w = _875;
    bool _877 = !_735;
    float _879 = _823;
    float _881 = _843;
    if (!_877)
    {
        float _883 = in.m_66.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[14].x, _127);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _173 = _897;
    }
    float _899 = _173;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _903 = int(_901);
    float _905 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _907 = int(_905);
    float _909 = float(_903);
    float _911 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _913 = int(_911);
    float _915 = float(uint(_907));
    float _917 = 1.0 / _909;
    float _919 = 1.0 / _915;
    float _921 = float(_913);
    float _923 = _917 * _127;
    float _925 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _927 = int(_925);
    int _929 = as_type<int>(_919) + (-2);
    float _931 = trunc(_923);
    int _933 = int(_931);
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _937 = _935 != 0;
    float _939 = 1.0 / _921;
    float _941 = float(uint(_927));
    int _943 = ~_927;
    int _945 = _943 + 1;
    float _947 = float(uint(_933));
    float _949 = 1.0 / _941;
    int _951 = ~_907;
    int _953 = _951 + 1;
    float _955 = 0.0;
    float _957 = 0.0;
    if (_937)
    {
        float _959 = in.m_66.x;
        float _961 = in.m_66.y;
        _955 = _959;
        _957 = _961;
    }
    float _963 = _955;
    float _965 = _957;
    if (_937)
    {
        _879 = 1.0;
    }
    float _967 = _879;
    float _969 = as_type<float>(_929) * _947;
    float _971 = _939 * _127;
    float _973 = trunc(_969);
    float _975 = precise::max(_973, 0.0);
    uint _978 = uint(_975);
    float _980 = trunc(_971);
    int _982 = int(_980);
    int _984 = as_type<int>(_949) + (-2);
    int _986 = as_type<int>(_969);
    float _988 = _967;
    if (_937)
    {
        _986 = 0;
    }
    int _990 = _986;
    int _992 = _953 * int(_978);
    int _994 = _992 + _933;
    float _996 = _963;
    float _998 = _965;
    int _1000 = _990;
    if (_937)
    {
        _881 = _963;
    }
    float _1002 = _881;
    float _1004 = float(uint(_994));
    float _1006 = float(uint(_982));
    float _1008 = as_type<float>(_929) * _1004;
    float _1010 = _1004;
    float _1012 = _1006;
    float _1014 = _1002;
    if (_937)
    {
        _1010 = _965;
    }
    float _1016 = _1010;
    float _1018 = as_type<float>(_984) * _1006;
    float _1020 = trunc(_1008);
    float _1022 = precise::max(_1020, 0.0);
    uint _1024 = uint(_1022);
    float _1026 = _1016;
    if (_937)
    {
        _1012 = _1002;
    }
    float _1028 = _1012;
    float _1030 = trunc(_1018);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = _1028;
    if (!_937)
    {
        float _1038 = in.m_66.x;
        float _1040 = in.m_66.y;
        float _1042 = _1038 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _1040 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        _988 = 7.345489978790283203125;
        _996 = _1038;
        _1014 = _1040;
        _1026 = _1056;
        _998 = _1040;
        _1000 = 1;
        _1036 = _1052;
    }
    float _1058 = _988;
    float _1060 = _996;
    float _1062 = _1014;
    float _1064 = _1026;
    float _1066 = _998;
    int _1068 = _1000;
    float _1070 = _1036;
    int _1072 = _945 * int(_1034);
    int _1074 = _1072 + _982;
    float _1076 = _1058 * _1060;
    int _1078 = int(_978) + int(_1024);
    float _1080 = _1058 * _1062;
    float _1082 = float(_907);
    float _1084 = floor(_1076);
    float _1086 = float(uint(_1074));
    float _1088 = _167 * _127;
    int _1090 = ~_907;
    int _1092 = _1090 + 1;
    float _1094 = _1060 * 2.0;
    float _1096 = float(_933);
    float _1098 = as_type<float>(_984) * _1086;
    bool _1100 = _907 == 0;
    int _1102 = _1092 * _1078;
    int _1104 = _1102 + _933;
    bool _1106 = _1096 >= _1082;
    bool _1108 = isnan(_1096);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1082);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = floor(_1094);
    bool _1120 = uint(_1104) >= uint(_907);
    float _1122 = -_1084;
    float _1124 = _1076 + _1122;
    float _1126 = trunc(_1098);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    bool _1132 = !_1120;
    int _1134 = _1132 ? 0 : (-1);
    float _1136 = _1124 * _1082;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1140 = _1138 != 0;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1144 = ~_1078;
    int _1146 = _1144 + _1134;
    int _1148 = _1146 + 1;
    int _1150 = ~_927;
    int _1152 = _1150 + 1;
    float _1154 = trunc(_1116);
    int _1156 = int(_1154);
    bool _1158 = !_1140;
    int _1160 = _1158 ? 0 : 1;
    int _1162 = _907 * _1148;
    int _1164 = _1162 + _933;
    float _1166 = float(_927);
    int _1168 = abs(_1160);
    bool _1170 = !_1100;
    int _1172 = _1170 ? _1164 : (-1);
    float _1174 = trunc(_1136);
    int _1176 = int(_1174);
    int _1178 = int(_1034) + int(_1130);
    float _1180 = float(_982);
    int _1182 = _1152 * _1178;
    int _1184 = _1182 + _982;
    bool _1186 = _1180 >= _1166;
    bool _1188 = isnan(_1180);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(_1166);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = _1082 * _1088;
    bool _1200 = uint(_1184) >= uint(_927);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _1204 = ~_1156;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = floor(_1080);
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1222 = _1220 != 0;
    int _1224 = _1176 * _1168;
    int _1226 = _1224 + _933;
    int _1228 = _907 + (-1);
    int _1230 = _1172 * _1208;
    bool _1232 = !_1218;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = trunc(_1198);
    int _1238 = int(_1236);
    int _1240 = _1156 * _1228;
    int _1242 = _1240 + _1230;
    bool _1244 = !_1214;
    int _1246 = _1244 ? 0 : 1;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1250 = abs(_1234);
    bool _1252 = !_1222;
    int _1254 = _1252 ? 0 : 1;
    int _1256 = abs(_1246);
    int _1258 = _1242 * _1250;
    int _1260 = abs(_1254);
    float _1262 = trunc(_1196);
    int _1264 = int(_1262);
    float _1266 = -_1210;
    float _1268 = _1080 + _1266;
    bool _1270 = !_1200;
    int _1272 = _1270 ? 0 : (-1);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1276 = _1274 != 0;
    int _1278 = _1238 * _1256;
    int _1280 = _1278 + _1258;
    float _1282 = _1166 * _1088;
    int _1284 = ~_1178;
    int _1286 = _1284 + _1272;
    int _1288 = _1286 + 1;
    float _1290 = _1268 * _1166;
    bool _1292 = !_1276;
    int _1294 = _1292 ? 0 : 1;
    int _1296 = _1226 * _1260;
    int _1298 = _1296 + _1280;
    bool _1300 = _927 == 0;
    float _1302 = trunc(_1282);
    int _1304 = int(_1302);
    int _1306 = abs(_1294);
    int _1308 = _927 * _1288;
    int _1310 = _1308 + _982;
    int _1312 = ~_1264;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1324 = _1322 != 0;
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1328 = _1326 != 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1332 = _1330 != 0;
    int _1334 = _1176 * _1306;
    int _1336 = _1334 + _1298;
    bool _1338 = !_1300;
    int _1340 = _1338 ? _1310 : (-1);
    float _1342 = trunc(_1290);
    int _1344 = int(_1342);
    bool _1346 = _907 == 0;
    float _1348 = float(uint(_1336));
    int _1350 = _1340 * _1316;
    bool _1352 = !_1324;
    int _1354 = _1352 ? 0 : 1;
    int _1356 = _927 + (-1);
    float _1358 = as_type<float>(_929) * _1348;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1362 = _1360 != 0;
    int _1364 = abs(_1354);
    float _1366 = trunc(_1358);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    bool _1372 = !_1362;
    int _1374 = _1372 ? 0 : 1;
    int _1376 = _1264 * _1356;
    int _1378 = _1376 + _1350;
    bool _1380 = !_1320;
    int _1382 = _1380 ? 0 : 1;
    int _1384 = abs(_1374);
    int _1386 = _1378 * _1364;
    int _1388 = abs(_1382);
    bool _1390 = !_1328;
    int _1392 = _1390 ? 0 : 1;
    int _1394 = _1304 * _1388;
    int _1396 = _1394 + _1386;
    int _1398 = ~_907;
    int _1400 = _1398 + 1;
    int _1402 = _1344 * _1384;
    int _1404 = _1402 + _982;
    bool _1406 = !_1332;
    int _1408 = _1406 ? 0 : 1;
    int _1410 = abs(_1392);
    int _1412 = abs(_1408);
    int _1414 = _1400 * int(_1370);
    int _1416 = _1414 + _1336;
    int _1418 = ~_907;
    int _1420 = _1418 + 1;
    int _1422 = _1404 * _1410;
    int _1424 = _1422 + _1396;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1428 = _1426 != 0;
    float _1430 = float(uint(_1416));
    int _1432 = _1344 * _1412;
    int _1434 = _1432 + _1424;
    int _1436 = ~_927;
    int _1438 = _1436 + 1;
    float _1440 = as_type<float>(_929) * _1430;
    float _1442 = float(uint(_1434));
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1446 = trunc(_1440);
    float _1448 = precise::max(_1446, 0.0);
    uint _1450 = uint(_1448);
    float _1452 = as_type<float>(_984) * _1442;
    float _1454 = 0.0;
    float _1456 = as_type<float>(_1434);
    if (!_1428)
    {
        _1454 = _239;
    }
    float _1458 = _1454;
    float _1460 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1444);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1464 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1468 = trunc(_1452);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    float _1474 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1460);
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1478 = int(_1370) + int(_1450);
    float _1480 = in.m_66.w;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1490 = _1420 * _1478;
    int _1492 = _1490 + _1336;
    int _1494 = _1438 * int(_1472);
    int _1496 = _1494 + _1434;
    float _1498 = 1.0 / _1484;
    bool _1500 = uint(_1492) >= uint(_907);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1506 = float(uint(_1496));
    bool _1508 = !_1500;
    int _1510 = _1508 ? 0 : (-1);
    float _1512 = 1.0 / _1488;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1516 = _1514 != 0;
    float _1518 = as_type<float>(_984) * _1506;
    int _1520 = ~_1478;
    int _1522 = _1520 + _1510;
    int _1524 = _1522 + 1;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1530 = trunc(_1518);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    int _1536 = _907 * _1524;
    int _1538 = _1536 + _1336;
    int _1540 = ~_927;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1546 = _1544 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1548;
    int _1552 = ~_907;
    int _1554 = _1552 + 1;
    float _1556 = as_type<float>(_1492);
    float _1558 = as_type<float>(_1542);
    float _1560 = _1458;
    float _1562 = _1464;
    if (_1516)
    {
        float _1564 = in.m_66.x;
        _1556 = _1564;
    }
    float _1566 = _1556;
    bool _1568 = !_1346;
    int _1570 = _1568 ? _1538 : (-1);
    float _1572 = 1.0 / _1504;
    float _1574 = 0.0;
    if (!_1516)
    {
        _1574 = _219;
    }
    float _1576 = _1574;
    int _1578 = _1570 & 3;
    bool _1580 = _1578 != 0;
    int _1582 = _1570 & 3;
    bool _1584 = _1582 != 0;
    bool _1586 = uint(_1578) > 1u;
    float _1588 = 1.0 / _1528;
    int _1590 = int(_1472) + int(_1534);
    int _1592 = _1584 ? 0 : 1;
    bool _1594 = _1480 > 0.5;
    float _1596 = _1480;
    float _1598 = _1576;
    if (_1428)
    {
        float _1600 = _1480 * 3.1415927410125732421875;
        _1596 = _1600;
    }
    float _1602 = _1596;
    int _1604 = _1542 * _1590;
    int _1606 = _1604 + _1434;
    int _1608 = ~_1592;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = 1.0 / _1546;
    int _1616 = _1612;
    if (_1428)
    {
        float _1618 = _1602 * 0.15915493667125701904296875;
        _1558 = _1618;
    }
    float _1620 = _1558;
    float _1622 = -_219;
    int _1624 = _1594 ? as_type<int>(_1622) : as_type<int>(_219);
    bool _1626 = uint(_1578) >= 2u;
    if (!_1586)
    {
        int _1628 = ~_1592;
        int _1630 = _1628 + 1;
        _1616 = _1630;
    }
    int _1632 = _1616;
    float _1634 = _1620;
    if (_1428)
    {
        float _1636 = _1620 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        _1634 = _1638;
    }
    float _1640 = _1634;
    int _1642 = _1626 ? 0 : 1;
    bool _1644 = uint(_1606) >= uint(_927);
    bool _1646 = _1578 != 3;
    bool _1648 = !_1644;
    int _1650 = _1648 ? 0 : (-1);
    int _1652 = ~_1642;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = ~_1590;
    int _1660 = _1658 + _1650;
    int _1662 = _1660 + 1;
    int _1664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1666 = _1664 != 0;
    int _1668 = _927 * _1662;
    int _1670 = _1668 + _1434;
    bool _1672 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1674 = isnan(_899);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1680 = _1676 || _1678;
    float _1682 = float(_1680);
    int _1684 = _1656;
    bool _1686 = _1646;
    if (_1646)
    {
        int _1688 = ~_1642;
        int _1690 = _1688 + 1;
        _1684 = _1690;
    }
    int _1692 = _1684;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1696 = _1640;
    if (_1428)
    {
        bool _1698 = _1640 > 0.5;
        _1686 = _1698;
    }
    bool _1700 = _1686;
    if (_1516)
    {
        float _1702 = _1566 * 3.1415927410125732421875;
        _1696 = _1702;
    }
    float _1704 = _1696;
    bool _1706 = !_1300;
    int _1708 = _1706 ? _1670 : (-1);
    float _1710 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1694);
    bool _1712 = !_1666;
    float _1714 = _1712 ? _219 : as_type<float>(_1624);
    if (_1516)
    {
        float _1716 = _1704 * 0.15915493667125701904296875;
        _1456 = _1716;
    }
    float _1718 = _1456;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1722 = _1720 != 0;
    float _1724 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1710);
    if (_1428)
    {
        float _1726 = -_239;
        float _1728 = _1700 ? _1726 : _239;
        _1560 = _1728;
    }
    float _1730 = _1560;
    int _1732 = _1708 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = _1718;
    if (_1516)
    {
        float _1738 = _1718 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    int _1744 = _1708 & 3;
    bool _1746 = _1744 != 0;
    bool _1748 = !_1722;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1754 = _1752 != 0;
    int _1756 = _1734 ? 0 : 1;
    bool _1758 = uint(_1744) > 1u;
    bool _1760 = !_1754;
    int _1762 = _1760 ? 0 : 1;
    bool _1764 = uint(_1744) >= 2u;
    int _1766 = ~_1756;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    int _1772 = _1764 ? 0 : 1;
    bool _1774 = _1744 != 3;
    int _1776 = ~_1772;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = _1770;
    bool _1784 = _1758;
    int _1786 = _1780;
    if (!_1758)
    {
        int _1788 = ~_1756;
        int _1790 = _1788 + 1;
        _1782 = _1790;
    }
    int _1792 = _1782;
    float _1794 = _1066 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1516)
    {
        bool _1796 = _1742 > 0.5;
        _1784 = _1796;
    }
    bool _1798 = _1784;
    float _1800 = fma(_1794, -2.0, _1248);
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_1516)
    {
        float _1804 = -_219;
        float _1806 = _1798 ? _1804 : _219;
        _1598 = _1806;
    }
    float _1808 = _1598;
    bool _1810 = _1060 > 0.5;
    float _1812 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1800);
    if (_1774)
    {
        int _1814 = ~_1772;
        int _1816 = _1814 + 1;
        _1786 = _1816;
    }
    int _1818 = _1786;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1822 = _1820 != 0;
    float _1824 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1826 = log2(_1824);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1834 = -_239;
    int _1836 = _1810 ? as_type<int>(_1834) : as_type<int>(_239);
    bool _1838 = _1066 > 0.5;
    float _1840 = -_1142;
    float _1842 = fma(_1832, 2.0, _1840);
    float _1844 = -_219;
    int _1846 = _1838 ? as_type<int>(_1844) : as_type<int>(_219);
    float _1848 = -_127;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1842);
    bool _1852 = _1068 != 1;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1856 = in.m_66.z;
    float _1858 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1854);
    float _1860 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1866 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1858);
    float _1868 = -_1202;
    float _1870 = fma(_1860, 2.0, _1868);
    float _1872 = fma(_1464, -2.0, _1862);
    bool _1874 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1876 = isnan(_899);
    bool _1878 = _1874 || _1876;
    bool _1880 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1882 = _1878 || _1880;
    float _1884 = float(_1882);
    float _1886 = _1860;
    if (!_1852)
    {
        _1886 = _1066;
    }
    float _1888 = _1886;
    float _1890 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1872);
    float _1892 = _1888;
    if (_1852)
    {
        _1892 = _1060;
    }
    float _1894 = _1892;
    float _1896 = -_127;
    float _1898 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1870);
    float _1900 = 0.0;
    if (!_1852)
    {
        _1900 = _1066;
    }
    float _1902 = _1900;
    float _1904 = _1902;
    if (_1852)
    {
        _1904 = _1060;
    }
    float _1906 = _1904;
    float _1908 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1910 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1912 = isnan(_899);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1918 = _1914 || _1916;
    float _1920 = float(_1918);
    float _1922 = -_1462;
    float _1924 = fma(_1908, 2.0, _1922);
    if (!_1852)
    {
        _1802 = _1856;
    }
    float _1926 = _1802;
    float _1928 = _1826 * _127;
    float _1930 = _1926;
    if (!_1852)
    {
        _1562 = _1856;
    }
    float _1932 = _1562;
    float _1934 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1864);
    float _1936 = _1932;
    if (_1852)
    {
        _1930 = _1066;
    }
    float _1938 = _1930;
    float _1940 = -_127;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1924);
    if (_1852)
    {
        _1936 = _1066;
    }
    float _1944 = _1936;
    float _1946 = exp2(_1928);
    bool _1948 = _1856 > 0.5;
    float _1950 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1952 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1466);
    float _1954 = -_239;
    int _1956 = _1948 ? as_type<int>(_1954) : as_type<int>(_239);
    float _1958 = fma(_1950, -2.0, _1476);
    bool _1960 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1962 = isnan(1.0);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1968 = _1964 || _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1972 = 1.0 + _1970;
    float _1974 = in.m_46.x;
    float _1976 = in.m_46.y;
    float _1978 = in.m_46.z;
    bool _1980 = !_1830;
    float _1982 = _1980 ? _239 : as_type<float>(_1956);
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1986 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1988 = isnan(0.0);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1994 = _1990 || _1992;
    float _1996 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1952);
    float _1998 = 1.0 / _1972;
    float _2000 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1984);
    float _2002 = -_1946;
    float _2004 = _2002 + 1.0;
    float _2006 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1958);
    int _2008 = ~_927;
    int _2010 = _2008 + 1;
    float _2012 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2000);
    float _2014 = -_1996;
    float _2016 = _2014 + 1.0;
    float _2018 = _1994 ? _2004 : 0.0;
    float _2020 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1934);
    bool _2022 = _1118 >= 0.0;
    bool _2024 = isnan(_1118);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan(0.0);
    bool _2030 = _2026 || _2028;
    float _2032 = -_2020;
    float _2034 = _2032 + 1.0;
    if (_1968)
    {
        float _2036 = _2018 * _1998;
        _137 = _2036;
    }
    float _2038 = _137;
    float _2040 = _1066 * 2.0;
    int _2042 = _2030 ? 0 : 1;
    float _2044 = _189 * _1976;
    bool _2046 = _1118 > 0.0;
    float _2048 = _195 * _1976;
    int _2050 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2052 = _2050 != 0;
    float _2054 = floor(_2040);
    float _2056 = _201 * _1976;
    float _2058 = fma(_193, _1974, _2048);
    float _2060 = fma(_187, _1974, _2044);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2066 = fma(_199, _1974, _2056);
    float _2068 = fma(_191, _1978, _2060);
    int _2070 = ~_2042;
    int _2072 = _2070 + 1;
    int _2074 = _2072 + 1;
    float _2076 = fma(_203, _1978, _2066);
    int _2078 = _2074;
    if (!_2046)
    {
        int _2080 = ~_2042;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    float _2086 = 1.0 / _2064;
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2088;
    float _2092 = fma(_197, _1978, _2058);
    bool _2094 = _2054 >= 0.0;
    bool _2096 = isnan(_2054);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan(0.0);
    bool _2102 = _2098 || _2100;
    float _2104 = _1856 * 2.0;
    float _2106 = _2090 * _1498;
    int _2108 = _2102 ? 0 : 1;
    float _2110 = in.m_60.w;
    bool _2112 = _2054 > 0.0;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2120 = _2118 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2122 = _2116 * _1512;
    float _2124 = floor(_2104);
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2126;
    float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2132 = _2130 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2136 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2142 = _2128 * _1572;
    int _2144 = ~_2108;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    float _2150 = _2136 * _1588;
    float _2152 = 1.0 / _2120;
    float _2154 = _2140 * _2086;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2158 = _899 + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2162 = _899 + _2160;
    int _2164 = _2148;
    if (!_2112)
    {
        int _2166 = ~_2108;
        int _2168 = _2166 + 1;
        _2164 = _2168;
    }
    int _2170 = _2164;
    float _2172 = _2132 * _1614;
    float _2174 = fma(_2106, _2158, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2176 = float(uint(_1226));
    float _2178 = fma(_2122, _2162, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2180 = _2124 >= 0.0;
    bool _2182 = isnan(_2124);
    bool _2184 = _2180 || _2182;
    bool _2186 = isnan(0.0);
    bool _2188 = _2184 || _2186;
    float _2190 = _2068 + _2110;
    bool _2192 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2194 = isnan(_899);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2200 = _2196 || _2198;
    float _2202 = float(_2200);
    float _2204 = as_type<float>(_929) * _2176;
    int _2206 = _2188 ? 0 : 1;
    bool _2208 = _2124 > 0.0;
    float _2210 = _1550 * _2152;
    float _2212 = float(uint(_1404));
    float _2214 = trunc(_2204);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    bool _2220 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2222 = isnan(_899);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2228 = _2224 || _2226;
    float _2230 = float(_2228);
    float _2232 = -_2202;
    float _2234 = _2232 + 1.0;
    bool _2236 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2238 = isnan(_899);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2244 = _2240 || _2242;
    float _2246 = float(_2244);
    float _2248 = as_type<float>(_984) * _2212;
    bool _2250 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2252 = isnan(_899);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2258 = _2254 || _2256;
    float _2260 = float(_2258);
    float _2262 = _2230 * _2234;
    float _2264 = -_2230;
    float _2266 = _2264 + 1.0;
    float _2268 = -_2246;
    float _2270 = _2268 + 1.0;
    bool _2272 = _899 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2274 = isnan(_899);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    float _2284 = trunc(_2248);
    float _2286 = precise::max(_2284, 0.0);
    uint _2288 = uint(_2286);
    float _2290 = _2260 * _2266;
    float _2292 = _1682 * _2270;
    float _2294 = -_2260;
    float _2296 = _2294 + 1.0;
    float _2298 = -_1682;
    float _2300 = _2298 + 1.0;
    float _2302 = -_2282;
    float _2304 = _2302 + 1.0;
    int _2306 = _1554 * int(_2218);
    int _2308 = _2306 + _1226;
    float _2310 = _2282 * _2296;
    float _2312 = _1884 * _2300;
    float _2314 = _2246 * _2304;
    float _2316 = -_1884;
    float _2318 = _2316 + 1.0;
    float _2320 = float(uint(_2308));
    float _2322 = in.m_62.w;
    float _2324 = float(_2084);
    float _2326 = _1920 * _2318;
    int _2328 = _2010 * int(_2288);
    int _2330 = _2328 + _1404;
    float _2332 = as_type<float>(_929) * _2320;
    float _2334 = in.m_64.w;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2338 = _899 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2342 = _899 + _2340;
    float _2344 = float(uint(_2330));
    float _2346 = _2174 * _2326;
    float _2348 = fma(_2142, _2338, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2350 = fma(_2172, _2342, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2352 = trunc(_2332);
    float _2354 = precise::max(_2352, 0.0);
    uint _2356 = uint(_2354);
    float _2358 = as_type<float>(_984) * _2344;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2362 = _899 + _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2366 = _899 + _2364;
    float _2368 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2370 = _899 + _2368;
    float _2372 = -_1920;
    float _2374 = _2372 + 1.0;
    float _2376 = fma(_2154, _2362, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2378 = fma(_2150, _2366, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2380 = trunc(_2358);
    float _2382 = precise::max(_2380, 0.0);
    uint _2384 = uint(_2382);
    float _2386 = fma(_2210, _2370, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2388 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2346);
    int _2390 = ~_2206;
    int _2392 = _2390 + 1;
    int _2394 = _2392 + 1;
    float _2396 = _2092 + _2322;
    int _2398 = _2394;
    if (!_2208)
    {
        int _2400 = ~_2206;
        int _2402 = _2400 + 1;
        _2398 = _2402;
    }
    int _2404 = _2398;
    float _2406 = fma(_2178, _2312, _2388);
    int _2408 = ~_907;
    int _2410 = _2408 + 1;
    float _2412 = _1730 + 0.5;
    float _2414 = _2076 + _2334;
    float _2416 = fma(_2348, _2292, _2406);
    int _2418 = int(_2218) + int(_2356);
    float _2420 = _1808 + (-0.5);
    float _2422 = fma(_2350, _2314, _2416);
    int _2424 = ~_927;
    int _2426 = _2424 + 1;
    float _2428 = _1066 + _1060;
    int _2430 = int(_2288) + int(_2384);
    int _2432 = _2410 * _2418;
    int _2434 = _2432 + _1226;
    float _2436 = _2428 + (-1.0);
    int _2438 = _1570 >> 31;
    int _2440 = _2426 * _2430;
    int _2442 = _2440 + _1404;
    bool _2444 = !_2052;
    float _2446 = _2444 ? _239 : as_type<float>(_1836);
    float _2448 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2450 = uint(_2434) >= uint(_907);
    float _2452 = fma(_2378, _2310, _2422);
    bool _2454 = !_1822;
    float _2456 = _2454 ? _219 : as_type<float>(_1846);
    float _2458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2460 = _2190 + _2458;
    bool _2462 = uint(_2442) >= uint(_927);
    float _2464 = fma(_2412, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1898);
    bool _2466 = !_2450;
    int _2468 = _2466 ? 0 : (-1);
    float _2470 = -_2420;
    float _2472 = -_1890;
    float _2474 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2472);
    int _2476 = _2438 & 3;
    float _2478 = _2456 + (-0.5);
    int _2480 = _1708 >> 31;
    float _2482 = fma(_2376, _2290, _2452);
    bool _2484 = _1578 != 3;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2488 = _2396 + _2486;
    int _2490 = _1570 + _2476;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2494 = _2480 & 3;
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2498 = _2490 >> 2;
    float _2500 = -_1866;
    float _2502 = _2500 + 1.0;
    int _2504 = _1708 + _2494;
    float _2506 = fma(_2460, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2496);
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2510 = _2414 + _2508;
    int _2512 = _2498 << 4;
    int _2514 = _2512 + 368;
    float _2516 = -_1474;
    float _2518 = _2516 + 1.0;
    int _2520 = _2504 >> 2;
    float _2522 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2506);
    bool _2524 = !_2462;
    int _2526 = _2524 ? 0 : (-1);
    uint _2528 = uint(int(uint(_2514) >> uint(2)));
    uint _2530 = uint(int(uint(int(_2528)) >> uint(2)));
    int _2532 = int(_2528) & 3;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[int(_2530)][_2532];
    int _2536 = int(_2528) + 1;
    uint _2538 = uint(int(uint(_2536) >> uint(2)));
    int _2540 = _2536 & 3;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[int(_2538)][_2540];
    bool _2544 = _1744 != 3;
    float _2546 = fma(_2518, _1808, _2474);
    int _2548 = _2520 << 4;
    int _2550 = _2548 + 800;
    float _2552 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2556 = _2554 != 0;
    int _2558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2560 = _2558 != 0;
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2564 = _2562 != 0;
    float _2566 = _1982 + 0.5;
    bool _2568 = !_2544;
    int _2570 = _2568 ? 0 : (-1);
    uint _2572 = uint(int(uint(_2550) >> uint(2)));
    uint _2574 = uint(int(uint(int(_2572)) >> uint(2)));
    int _2576 = int(_2572) & 3;
    float _2578 = (*spvDescriptorSet0.vp_c9)._m0[int(_2574)][_2576];
    int _2580 = int(_2572) + 1;
    uint _2582 = uint(int(uint(_2580) >> uint(2)));
    int _2584 = _2580 & 3;
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[int(_2582)][_2584];
    bool _2588 = _2522 >= 0.0;
    float _2590 = _2446 + 0.5;
    float _2592 = fma(_2386, _2262, _2482);
    float _2594 = fma(_2552, _2566, _1942);
    bool _2596 = !_1580;
    int _2598 = _2596 ? 0 : 1;
    float _2600 = fma(_2590, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1850);
    float _2602 = -_2478;
    float _2604 = -_1812;
    float _2606 = fma(_2602, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2604);
    float _2608 = -_2502;
    float _2610 = fma(_2608, _1730, _2464);
    int _2612 = _2514 + 8;
    uint _2614 = uint(int(uint(_2612) >> uint(2)));
    uint _2616 = uint(int(uint(int(_2614)) >> uint(2)));
    int _2618 = int(_2614) & 3;
    float _2620 = (*spvDescriptorSet0.vp_c9)._m0[int(_2616)][_2618];
    int _2622 = int(_2614) + 1;
    uint _2624 = uint(int(uint(_2622) >> uint(2)));
    int _2626 = _2622 & 3;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[int(_2624)][_2626];
    int _2630 = abs(_1632);
    float _2632 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2592);
    int _2634 = abs(_1792);
    float _2636 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2638 = _2452;
    if (_2588)
    {
        _2638 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2640 = _2638;
    float _2642 = _1714 + (-0.5);
    int _2644 = _2550 + 8;
    uint _2646 = uint(int(uint(_2644) >> uint(2)));
    uint _2648 = uint(int(uint(int(_2646)) >> uint(2)));
    int _2650 = int(_2646) & 3;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[int(_2648)][_2650];
    int _2654 = int(_2646) + 1;
    uint _2656 = uint(int(uint(_2654) >> uint(2)));
    int _2658 = _2654 & 3;
    float _2660 = (*spvDescriptorSet0.vp_c9)._m0[int(_2656)][_2658];
    int _2662 = abs(_2598);
    out.m_74.x = _2610;
    out.m_74.y = _2546;
    int _2664 = as_type<int>(_2640);
    if (_2588)
    {
        float _2666 = _2640 * 5.0;
        _2664 = as_type<int>(_2666);
    }
    int _2668 = _2664;
    bool _2670 = !_2484;
    int _2672 = _2670 ? 0 : (-1);
    out.m_76.x = _2632;
    bool _2674 = !_1746;
    int _2676 = _2674 ? 0 : 1;
    int _2678 = abs(_2672);
    if (_2588)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8211 = as_type<float>(_2668);
        out.gl_Position.z = _8211;
    }
    int _2680 = ~_2430;
    int _2682 = _2680 + _2526;
    int _2684 = _2682 + 1;
    float _2686 = _2636 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2688 = ~_2418;
    int _2690 = _2688 + _2468;
    int _2692 = _2690 + 1;
    if (_2588)
    {
        out.m_53.x = 0.0;
    }
    bool _2694 = _907 == 0;
    int _2696 = _927 * _2684;
    int _2698 = _2696 + _1404;
    bool _2700 = !_2560;
    int _2702 = _2700 ? 0 : 1;
    int _2704 = _907 * _2692;
    int _2706 = _2704 + _1226;
    float _2708 = -_2686;
    float _2710 = -_2006;
    float _2712 = fma(_2708, _2642, _2710);
    float _2714 = float(_2404);
    int _2716 = ~_2630;
    int _2718 = _2716 + 1;
    int _2720 = _2718 + 1;
    int _2722 = ~_2662;
    int _2724 = _2722 + 1;
    int _2726 = _2724 + 1;
    int _2728 = _2720 * as_type<int>(_2542);
    int _2730 = ~_2634;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    int _2736 = abs(_2676);
    int _2738 = _2726 * as_type<int>(_2534);
    int _2740 = _2738 + _2728;
    int _2742 = abs(_1692);
    int _2744 = _2734 * as_type<int>(_2586);
    int _2746 = abs(_1818);
    int _2748 = ~_2742;
    int _2750 = _2748 + 1;
    int _2752 = _2750 + 1;
    int _2754 = ~_2736;
    int _2756 = _2754 + 1;
    int _2758 = _2756 + 1;
    int _2760 = _2752 * as_type<int>(_2620);
    int _2762 = _2760 + _2740;
    int _2764 = ~_2678;
    int _2766 = _2764 + 1;
    int _2768 = _2766 + 1;
    float _2770 = _2488 * _2488;
    int _2772 = abs(_2570);
    int _2774 = _2758 * as_type<int>(_2578);
    int _2776 = _2774 + _2744;
    int _2778 = ~_2746;
    int _2780 = _2778 + 1;
    int _2782 = _2780 + 1;
    int _2784 = _2768 * as_type<int>(_2628);
    int _2786 = _2784 + _2762;
    int _2788 = abs(_1750);
    float _2790 = fma(_2460, _2460, _2770);
    int _2792 = ~_2772;
    int _2794 = _2792 + 1;
    int _2796 = _2794 + 1;
    int _2798 = _2782 * as_type<int>(_2652);
    int _2800 = _2798 + _2776;
    int _2802 = abs(_2702);
    float _2804 = fma(_2510, _2510, _2790);
    int _2806 = abs(_1762);
    int _2808 = _2796 * as_type<int>(_2660);
    int _2810 = _2808 + _2800;
    int _2812 = ~_2788;
    int _2814 = _2812 + 1;
    int _2816 = _2814 + 1;
    float _2818 = float(_2802);
    float _2820 = rsqrt(_2804);
    bool _2822 = !_2694;
    int _2824 = _2822 ? _2706 : (-1);
    int _2826 = _2786 * _2816;
    int _2828 = ~_2806;
    int _2830 = _2828 + 1;
    int _2832 = _2830 + 1;
    float _2834 = -_1724;
    float _2836 = _2834 + 1.0;
    bool _2838 = _927 == 0;
    int _2840 = _2824 * _2788;
    int _2842 = _2840 + _2826;
    float _2844 = -_2012;
    float _2846 = _2844 + 1.0;
    int _2848 = _2810 * _2832;
    bool _2850 = !_2838;
    int _2852 = _2850 ? _2698 : (-1);
    float _2854 = _663 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2856 = -_2034;
    float _2858 = fma(_1982, _2856, _2594);
    float _2860 = fma(_2456, _2836, _2606);
    float _2862 = _2818 * _2324;
    int _2864 = _2852 * _2806;
    int _2866 = _2864 + _2848;
    float _2868 = -_2846;
    float _2870 = fma(_2446, _2868, _2600);
    bool _2872 = !_2556;
    int _2874 = _2872 ? 0 : 1;
    float _2876 = _2854 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2878 = abs(_2874);
    float _2880 = _2876 * _2820;
    float _2882 = in.m_78.x;
    float _2884 = in.m_78.y;
    float _2886 = in.m_78.z;
    float _2888 = fma(_1714, _2016, _2712);
    float _2890 = _2488 * _2880;
    float _2892 = _2460 * _2880;
    float _2894 = float(_2842);
    out.m_80.x = _2870;
    out.m_80.y = _2860;
    out.m_80.z = _2858;
    out.m_80.w = _2888;
    float _2896 = -_2890;
    float _2898 = _2488 + _2896;
    float _2900 = float(_2866);
    float _2902 = -_2892;
    float _2904 = _2460 + _2902;
    float _2906 = float(_2878);
    float _2908 = _2898 * _2898;
    out.m_82.x = _2894;
    float _2910 = _1060 + (-0.5);
    bool _2912 = !_2564;
    int _2914 = _2912 ? 0 : 1;
    float _2916 = _2906 * _2714;
    out.m_82.w = _2900;
    float _2918 = fma(_2904, _2904, _2908);
    if (_2588)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2920 = _2916 * (-2.0);
    float _2922 = -_2890;
    float _2924 = _2396 + _2922;
    float _2926 = _2510 * _2880;
    float _2928 = -_2892;
    float _2930 = _2190 + _2928;
    float _2932 = fma(_2920, _2882, _2882);
    float _2934 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2936 = _2924 + _2934;
    float _2938 = fma(_2448, _2920, _2448);
    float _2940 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2942 = _2930 + _2940;
    float _2944 = fma(_2910, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2932);
    float _2946 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2948 = -_2926;
    float _2950 = _2414 + _2948;
    float _2952 = _1066 + _1856;
    float _2954 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2946);
    float _2956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2958 = _2950 + _2956;
    float _2960 = _2952 + (-1.0);
    int _2962 = abs(_2914);
    float _2964 = _1066 + (-0.5);
    float _2966 = fma(_2958, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2954);
    float _2968 = _2862 * (-2.0);
    float _2970 = fma(_2960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2972 = float(_2170);
    float _2974 = -_2926;
    float _2976 = _2510 + _2974;
    float _2978 = fma(_2968, _2884, _2884);
    float _2980 = float(_2962);
    float _2982 = fma(_2970, _2968, _2970);
    bool _2984 = _2966 >= 0.0;
    float _2986 = fma(_2964, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2978);
    float _2988 = fma(_2938, _2038, _2944);
    float _2990 = _2980 * _2972;
    float _2992 = _1856 + _1060;
    float _2994 = fma(_2982, _2038, _2986);
    float _2996 = _2990 * (-2.0);
    float _2998 = fma(_2976, _2976, _2918);
    float _3000 = _2988 * 0.15915493667125701904296875;
    float _3002 = _2992 + (-1.0);
    float _3004 = _2994 * 0.15915493667125701904296875;
    float _3006 = fma(_2996, _2886, _2886);
    float _3008 = _1856 + (-0.5);
    float _3010 = _2990;
    float _3012 = _2926;
    if (_2984)
    {
        _3010 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3014 = _3010;
    float _3016 = sqrt(_2998);
    float _3018 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3020 = fma(_3008, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3006);
    int _3022 = as_type<int>(_3014);
    if (_2984)
    {
        out.m_53.x = 0.0;
    }
    float _3024 = fma(_3018, _2996, _3018);
    if (_2984)
    {
        float _3026 = _3014 * 5.0;
        _3022 = as_type<int>(_3026);
    }
    int _3028 = _3022;
    float _3030 = _3000 * 6.283185482025146484375;
    float _3032 = sin(_3030);
    float _3034 = fma(_3024, _2038, _3020);
    if (_2984)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8732 = as_type<float>(_3028);
        out.gl_Position.z = _8732;
    }
    float _3036 = _3034 * 0.15915493667125701904296875;
    float _3038 = _3000 * 6.283185482025146484375;
    float _3040 = cos(_3038);
    float _3042 = _3004 * 6.283185482025146484375;
    float _3044 = sin(_3042);
    float _3046 = _3004 * 6.283185482025146484375;
    float _3048 = cos(_3046);
    if (_2984)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3050 = _3036 * 6.283185482025146484375;
    float _3052 = cos(_3050);
    float _3054 = _661 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3056 = _2820 * _3016;
    float _3058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _3060 = _3032 * _3044;
    float _3062 = _3040 * _3044;
    float _3064 = _3056 * _3054;
    float _3066 = _2854 * _3056;
    float _3068 = _3036 * 6.283185482025146484375;
    float _3070 = sin(_3068);
    float _3072 = _3032 * _3048;
    float _3074 = _3058 * _3064;
    float _3076 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _239);
    float _3078 = _3040 * _3048;
    float _3080 = _3076 * _3066;
    float _3082 = _3040 * _3052;
    float _3084 = _3048 * _3052;
    float _3086 = _3032 * _3052;
    float _3088 = _3044 * _3052;
    float _3090 = _3082 * _3074;
    float _3092 = _3056 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3094 = _3092 * 0.5;
    float _3096 = fma(_3070, _3078, _3060);
    float _3098 = -_3072;
    float _3100 = fma(_3070, _3062, _3098);
    float _3102 = -_3074;
    float _3104 = _3070 * _3102;
    float _3106 = -_3062;
    float _3108 = fma(_3070, _3072, _3106);
    float _3110 = fma(_3096, _3080, _3090);
    float _3112 = _3086 * _3074;
    float _3114 = fma(_3084, _3080, _3104);
    float _3116 = fma(_3070, _3060, _3078);
    float _3118 = fma(_3100, _3094, _3110);
    float _3120 = fma(_3108, _3080, _3112);
    float _3122 = fma(_3088, _3094, _3114);
    float _3124 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3126 = fma(_3116, _3094, _3120);
    float _3128 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3130 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3124);
    float _3132 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3128);
    float _3134 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3130);
    float _3136 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3132);
    float _3138 = _3134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3140 = _3136 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3142 = _2414 + _3138;
    float _3144 = _2190 + _3140;
    float _3146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3148 = _3142 + _3146;
    float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3152 = _3144 + _3150;
    float _3154 = _3148 * _3148;
    float _3156 = fma(_3152, _3152, _3154);
    float _3158 = _3118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3160 = sqrt(_3156);
    float _3162 = fma(_3122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3158);
    float _3164 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3162);
    float _3166 = _3164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3168 = _2396 + _3166;
    bool _3170 = _3160 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3172 = _3158;
    float _3174 = _3126;
    float _3176 = _3142;
    if (!_3170)
    {
        _3172 = _3144;
    }
    float _3178 = _3172;
    float _3180 = _3178;
    if (!_3170)
    {
        _3174 = _3168;
    }
    float _3182 = _3174;
    bool _3184 = !_3170;
    float _3186 = _3182;
    if (!_3184)
    {
        float _3188 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3192 = _3160 + _3190;
        float _3194 = rsqrt(_3156);
        float _3196 = _3192 * _3188;
        float _3198 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3200 = _3196 * 0.15915493667125701904296875;
        float _3202 = _3200 * 6.283185482025146484375;
        float _3204 = cos(_3202);
        float _3206 = _3200 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        float _3210 = _3204 + (-1.0);
        float _3212 = fma(_3208, _3198, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3214 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3216 = _3194 * _3212;
        float _3218 = fma(_3168, _3204, _3214);
        float _3220 = fma(_3152, _3216, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3222 = fma(_3148, _3216, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3186 = _3218;
        _3180 = _3220;
        _3176 = _3222;
    }
    float _3224 = _3186;
    float _3226 = _3180;
    float _3228 = _3176;
    float _3230 = -_2396;
    float _3232 = _3230 + _3224;
    float _3234 = -_2190;
    float _3236 = _3234 + _3226;
    float _3238 = -_2414;
    float _3240 = _3238 + _3228;
    float _3242 = _3232 * _3232;
    float _3244 = fma(_3236, _3236, _3242);
    float _3246 = fma(_3240, _3240, _3244);
    float _3248 = sqrt(_3246);
    bool _3250 = _3248 > 0.0;
    bool _3252 = !_3250;
    float _3254 = _3224;
    float _3256 = _3226;
    float _3258 = _3228;
    float _3260 = _3246;
    float _3262 = _3236;
    if (!_3252)
    {
        float _3264 = _233 * _233;
        float _3266 = fma(_229, _229, _3264);
        float _3268 = fma(_235, _235, _3266);
        float _3270 = rsqrt(_3246);
        float _3272 = sqrt(_3268);
        float _3274 = _3232 * _3270;
        float _3276 = _3240 * _3270;
        bool _3278 = _3272 > 0.0;
        float _3280 = _3236 * _3270;
        bool _3282 = !_3278;
        if (!_3282)
        {
            float _3284 = rsqrt(_3268);
            float _3286 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3288 = _233 * _3284;
            float _3290 = _229 * _3284;
            float _3292 = _3274 * _3288;
            float _3294 = _235 * _3284;
            float _3296 = fma(_3280, _3290, _3292);
            float _3298 = _3286 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3300 = fma(_3276, _3294, _3296);
            float _3302 = _3300 * _3298;
            float _3304 = fma(_229, _3302, _3226);
            float _3306 = fma(_233, _3302, _3224);
            float _3308 = fma(_235, _3302, _3228);
            _3254 = _3306;
            _3256 = _3304;
            _3258 = _3308;
            _3260 = _3286;
        }
    }
    float _3310 = _3254;
    float _3312 = _3256;
    float _3314 = _3258;
    float _3316 = _3260;
    float _3318 = -_2890;
    float _3320 = _3318 + _3310;
    float _3322 = -_2892;
    float _3324 = _3322 + _3312;
    float _3326 = -_2926;
    float _3328 = _3326 + _3314;
    float _3330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3332 = _3320 + _3330;
    float _3334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3336 = _3324 + _3334;
    float _3338 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3340 = _3328 + _3338;
    float _3342 = _3332 * _3332;
    float _3344 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3346 = fma(_3336, _3336, _3342);
    float _3348 = fma(_3340, _3340, _3346);
    float _3350 = rsqrt(_3348);
    float _3352 = _3350 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3354 = _3336 * _3352;
    float _3356 = _3340 * _3352;
    float _3358 = _3354 * _3354;
    float _3360 = _3356 * _3356;
    float _3362 = _3358 + _3360;
    float _3364 = sqrt(_3362);
    bool _3366 = _3364 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3370 = _3364 + _3368;
    float _3372 = _3340;
    float _3374 = _3362;
    float _3376 = _3370;
    float _3378 = _3316;
    float _3380 = _3332;
    float _3382 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3366)
    {
        float _3384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3372 = _3384;
    }
    float _3386 = _3372;
    if (_3366)
    {
        float _3388 = rsqrt(_3362);
        _3374 = _3388;
    }
    float _3390 = _3374;
    float _3392 = _3390;
    if (_3366)
    {
        float _3394 = _3370 * _3386;
        _3376 = _3394;
    }
    float _3396 = _3376;
    if (_3366)
    {
        float _3398 = _3396 * 0.15915493667125701904296875;
        _3378 = _3398;
    }
    float _3400 = _3378;
    float _3402 = _3350;
    float _3404 = _3400;
    if (_3366)
    {
        float _3406 = _3400 * 6.283185482025146484375;
        float _3408 = sin(_3406);
        _3402 = _3408;
    }
    float _3410 = _3402;
    float _3412 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3414 = precise::max(0.0, _3412);
    float _3416 = _3386;
    if (_3366)
    {
        float _3418 = _3400 * 6.283185482025146484375;
        float _3420 = cos(_3418);
        _3416 = _3420;
    }
    float _3422 = _3416;
    float _3424 = -_3352;
    float _3426 = -_3414;
    float _3428 = fma(_3332, _3424, _3426);
    float _3430 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_3366)
    {
        float _3432 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3380 = _3432;
    }
    float _3434 = _3380;
    if (!_3366)
    {
        _3404 = _3354;
    }
    float _3436 = _3404;
    float _3438 = _3410;
    float _3440 = _3436;
    if (_3366)
    {
        float _3442 = fma(_3410, _3434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3382 = _3442;
    }
    float _3444 = _3382;
    float _3446 = floor(_3430);
    float _3448 = _3444;
    if (_3366)
    {
        float _3450 = _3422 + (-1.0);
        _3438 = _3450;
    }
    float _3452 = _3438;
    float _3454 = _3452;
    if (_3366)
    {
        float _3456 = _3390 * _3444;
        _3262 = _3456;
    }
    float _3458 = _3262;
    if (!_3366)
    {
        _3448 = _3428;
    }
    float _3460 = _3448;
    float _3462 = _3460;
    if (_3366)
    {
        float _3464 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3012 = _3464;
    }
    float _3466 = _3012;
    float _3468 = _3466;
    if (_3366)
    {
        float _3470 = _3354 * _3458;
        _3440 = _3470;
    }
    float _3472 = _3440;
    if (!_3366)
    {
        _3392 = _3356;
    }
    float _3474 = _3392;
    float _3476 = _3474;
    if (_3366)
    {
        float _3478 = _3356 * _3458;
        _3476 = _3478;
    }
    float _3480 = _3476;
    if (!_3366)
    {
        _3454 = _3358;
    }
    float _3482 = _3454;
    float _3484 = _3482;
    if (_3366)
    {
        float _3486 = fma(_3428, _3422, _3466);
        _3462 = _3486;
    }
    float _3488 = _3462;
    if (_3366)
    {
        float _3490 = _3472 * _3472;
        _3484 = _3490;
    }
    float _3492 = _3484;
    if (!_3366)
    {
        _3468 = _3360;
    }
    float _3494 = _3468;
    float _3496 = _3494;
    if (_3366)
    {
        float _3498 = _3480 * _3480;
        _3496 = _3498;
    }
    float _3500 = _3496;
    float _3502 = sqrt(_3348);
    float _3504 = fma(_3488, _3488, _3492);
    float _3506 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3508 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3510 = _3504 + _3500;
    float _3512 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3514 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3506);
    float _3516 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3508);
    float _3518 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3520 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3512);
    float _3522 = rsqrt(_3510);
    float _3524 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3514);
    float _3526 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3518);
    float _3528 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3520);
    float _3530 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3516);
    float _3532 = _3524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3534 = fma(_3328, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3526);
    float _3536 = _3528 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3538 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3540 = fma(_3502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3538);
    float _3542 = precise::clamp(_3540, 0.0, 1.0);
    float _3544 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3546 = _3534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3548 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3550 = -_3542;
    float _3552 = _3550 + 1.0;
    float _3554 = -_3544;
    float _3556 = fma(_3554, _3344, 1.0);
    float _3558 = _3530 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3560 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3548);
    float _3562 = _3522 * _3472;
    float _3564 = _3522 * _3480;
    float _3566 = abs(_3552);
    float _3568 = log2(_3566);
    float _3570 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3560);
    float _3572 = _3562 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3574 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3570);
    float _3576 = _3522 * _3488;
    float _3578 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3580 = log2(_3556);
    float _3582 = fma(_2950, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3584 = -_3572;
    float _3586 = fma(_3576, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3584);
    float _3588 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3578);
    float _3590 = -_3564;
    float _3592 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3586);
    float _3594 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3596 = -_3446;
    float _3598 = _3430 + _3596;
    float _3600 = fma(_3592, -0.5, 0.5);
    float _3602 = 1.0 / _3574;
    float _3604 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3606 = fma(_3592, 0.5, 0.5);
    float _3608 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3588);
    float _3610 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3604);
    float _3612 = fma(_3606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3614 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3608);
    float _3616 = exp2(_3594);
    float _3618 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3610);
    float _3620 = fma(_3606, _3612, -0.212114393711090087890625);
    float _3622 = _3580 * 0.693147182464599609375;
    float _3624 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3618);
    float _3626 = fma(_3606, _3620, 1.570728778839111328125);
    float _3628 = _3622 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3630 = sqrt(_3600);
    float _3632 = _3576 + 1.0;
    float _3634 = _3624 * _3602;
    float _3636 = _3614 * _3602;
    float _3638 = fma(_3634, 0.5, 0.5);
    float _3640 = fma(_3636, -0.5, 0.5);
    float _3642 = floor(_3582);
    float _3644 = -_3576;
    float _3646 = fma(_3616, _3632, _3644);
    float _3648 = fma(_3646, 0.5, 0.5);
    float _3650 = _3630 * 0.636619746685028076171875;
    float _3652 = -_3626;
    float _3654 = fma(_3650, _3652, 1.0);
    float _3656 = -_3642;
    float _3658 = _3582 + _3656;
    float2 _9742 = float2(_3598, _3658);
    float _3660 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9742, float2(0.0), isnan(_9742)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9742, float2(0.0), isnan(_9742)), level(0.0)).x;
    float3 _9753 = float3(_3638, _3640, _3628);
    float _3662 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9753, float3(0.0), isnan(_9753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9753, float3(0.0), isnan(_9753)), level(0.0)).x;
    float3 _9764 = float3(_3638, _3640, _3628);
    float4 _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9764, float3(0.0), isnan(_9764)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9764, float3(0.0), isnan(_9764)), level(0.0)).xyzw;
    float _3667 = _3665.x;
    float _3669 = _3665.y;
    float _3671 = _3665.z;
    float _3673 = _3665.w;
    float2 _9780 = float2(_3654, _3648);
    float3 _3677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9780, float2(0.0), isnan(_9780)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9780, float2(0.0), isnan(_9780)), level(0.0)).xyz;
    float _3679 = _3677.x;
    float _3681 = _3677.y;
    float _3683 = _3677.z;
    float _3685 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3687 = _2924 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3689 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3691 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3693 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3685);
    float _3695 = fma(_2930, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3687);
    float _3697 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3699 = fma(_2950, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3693);
    float _3701 = fma(_2950, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3695);
    float _3703 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3705 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3707 = _3699 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3709 = _3701 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3711 = fma(_3703, _3703, 1.0);
    float _3713 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3715 = 1.0 / _3707;
    float _3717 = _3709 + _3707;
    float _3719 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3721 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3723 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3725 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3705);
    float _3727 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3719);
    float _3729 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3721);
    float _3731 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3713);
    float _3733 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3735 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3723);
    float _3737 = rsqrt(_3711);
    float _3739 = _239 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3741 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3733);
    bool _3743 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3745 = isnan(0.5);
    bool _3747 = _3743 || _3745;
    bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3751 = _3747 || _3749;
    float _3753 = _3717 * _3715;
    float _3755 = _3753 * 0.5;
    float _3757 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3759 = fma(_3755, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3757);
    float _3761 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3729);
    float _3763 = 1.0 / _3759;
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3767 = _3763 * _3765;
    float _3769 = -_3070;
    float _3771 = fma(_3769, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3689);
    float _3773 = abs(_3767);
    float _3775 = log2(_3773);
    float _3777 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3771);
    float _3779 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3725);
    float _3781 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3741);
    float _3783 = _3775 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3785 = -_3070;
    float _3787 = fma(_3785, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3691);
    float _3789 = -_3070;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3697);
    float _3793 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3787);
    float _3795 = exp2(_3783);
    float _3797 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3791);
    float _3799 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3727);
    float _3801 = fma(_3116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3735);
    float _3803 = _3703 * _3737;
    float _3805 = fma(_3108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3731);
    float _3807 = _3703 * _3797;
    float _3809 = -_3799;
    float _3811 = _3803 * _3809;
    float _3813 = -_3761;
    float _3815 = _3803 * _3813;
    float _3817 = -_3801;
    float _3819 = _3803 * _3817;
    out.m_84.x = _3779;
    out.m_84.y = _3781;
    out.m_84.z = _3805;
    float _3821 = fma(_3737, _3777, _3811);
    float _3823 = fma(_3737, _3793, _3815);
    float _3825 = _3703 * _3777;
    float _3827 = _3703 * _3793;
    float _3829 = fma(_3795, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3831 = precise::clamp(_3829, 0.0, 1.0);
    float _3833 = fma(_3737, _3797, _3819);
    float _3835 = _3536 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3837 = in.m_86.x;
    float _3839 = fma(_3831, -2.0, 3.0);
    float _3841 = _3831 * _3831;
    float _3843 = fma(_3739, _3779, _3825);
    float _3845 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3847 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3835);
    float _3849 = _3841 * _3839;
    bool _3851 = _3767 <= 8000.0;
    bool _3853 = isnan(_3767);
    bool _3855 = _3851 || _3853;
    bool _3857 = isnan(8000.0);
    bool _3859 = _3855 || _3857;
    float _3861 = float(_3859);
    float _3863 = fma(_3739, _3805, _3807);
    float _3865 = fma(_3532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3847);
    float _3867 = -_3849;
    float _3869 = _3867 + 1.0;
    float _3871 = exp2(_3845);
    float _3873 = fma(_3739, _3781, _3827);
    float _3875 = fma(_3558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3865);
    float _3877 = fma(_3869, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3849);
    float _3879 = _3624 + _3574;
    out.m_88.x = _3821;
    out.m_88.y = _3823;
    out.m_88.z = _3833;
    float _3881 = _3875 + _3574;
    float _3883 = _3861 * _3877;
    float _3885 = _3574 * 0.5;
    float _3887 = _3881 * 0.5;
    float _3889 = _3879 * 0.5;
    float _3891 = fma(_3614, -0.5, _3885);
    float _3893 = _3821;
    float _3895 = _3875;
    float _3897 = _3624;
    float _3899 = _3614;
    if (_3751)
    {
        _3893 = 1.0;
    }
    float _3901 = _3893;
    float _3903 = _3901;
    float _3905 = _3669;
    if (!_3751)
    {
        float _3907 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3909 = _3907 * 0.15915493667125701904296875;
        float _3911 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3915 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3913;
        float _3917 = _3909 * 6.283185482025146484375;
        float _3919 = cos(_3917);
        float _3921 = _3911 * 0.15915493667125701904296875;
        float _3923 = _3909 * 6.283185482025146484375;
        float _3925 = sin(_3923);
        float _3927 = 1.0 / _3919;
        float _3929 = _3921 * 6.283185482025146484375;
        float _3931 = cos(_3929);
        float _3933 = _3925 * _3927;
        float _3935 = _3921 * 6.283185482025146484375;
        float _3937 = sin(_3935);
        float _3939 = _3931 * _3933;
        float _3941 = 1.0 / _3915;
        float _3943 = 1.0 / _3939;
        float _3945 = _3937 * _3943;
        float _3947 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3949 = fma(_3767, _3945, _3947);
        float _3951 = _3949 * _3941;
        float _3953 = precise::clamp(_3951, 0.0, 1.0);
        _3903 = _3953;
    }
    float _3955 = _3903;
    float _3957 = -_3871;
    float _3959 = _3957 + 1.0;
    out.m_90.x = _3889;
    out.m_90.y = _3891;
    out.m_90.z = _3887;
    out.m_90.w = _3574;
    float _3961 = _3799 + _3843;
    float _3963 = _3761 + _3873;
    float _3965 = _3959 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3967 = _3801 + _3863;
    float _3969 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3971 = -_3660;
    float _3973 = _3971 + 1.0;
    float _3975 = _3965 * _3662;
    float _3977 = -_3965;
    float _3979 = _3977 + 1.0;
    out.m_92.x = _3961;
    out.m_92.y = _3963;
    out.m_92.z = _3967;
    float _3981 = _3683 * _3975;
    float _3983 = _3973 * _3969;
    float _3985 = precise::clamp(_3983, 0.0, 1.0);
    out.m_94.x = _3324;
    out.m_94.y = _3320;
    out.m_94.z = _3328;
    float _3987 = _3673 * _3975;
    float _3989 = _3673 * _3979;
    float _3991 = fma(_3673, _3981, _3671);
    bool _3993 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3995 = isnan(_3502);
    bool _3997 = _3993 || _3995;
    bool _3999 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4001 = _3997 || _3999;
    float _4003 = fma(_3679, _3987, _3667);
    float _4005 = fma(_3681, _3987, _3669);
    float _4007 = -_3985;
    float _4009 = fma(_4007, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3624;
    out.gl_Position.y = _3614;
    out.gl_Position.z = _3875;
    out.gl_Position.w = _3574;
    float _4011 = _4009 * _3837;
    out.m_96.x = _4003;
    out.m_96.y = _4005;
    out.m_96.z = _3991;
    out.m_96.w = _3989;
    float _4013 = _4011 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4015 = _4011;
    float _4017 = _4013;
    if (!_4001)
    {
        _4015 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4019 = _4015;
    float _4021 = _4019;
    float _4023 = _4019;
    if (!_4001)
    {
        _3905 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4025 = _3905;
    out.m_98.x = _4013;
    float _4027 = _3955 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4029 = _4025;
    float _4031 = _4025;
    if (!_4001)
    {
        _3895 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4033 = _3895;
    float _4035 = _4033;
    float _4037 = _4033;
    if (!_4001)
    {
        _3897 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4039 = _3897;
    float _4041 = _4039;
    float _4043 = _4039;
    if (!_4001)
    {
        _3899 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4045 = _3899;
    float _4047 = _4045;
    float _4049 = _4045;
    if (!_4001)
    {
        _4017 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4051 = _4017;
    bool _4053 = !_4001;
    float _4055 = _4051;
    float _4057 = _4051;
    if (!_4053)
    {
        bool _4059 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4061 = isnan(_3502);
        bool _4063 = _4059 || _4061;
        bool _4065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4067 = _4063 || _4065;
        if (!_4067)
        {
            float _4069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4071 = _3502 + _4069;
            float _4073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4075 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4073;
            float _4077 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4081 = 1.0 / _4075;
            float _4083 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4089 = _4087 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4091 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4093 = _4091 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4095 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4097 = _4095 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4099 = _4071 * _4081;
            float _4101 = precise::clamp(_4099, 0.0, 1.0);
            float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4107 = fma(_4101, _4079, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4109 = fma(_4101, _4105, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4111 = fma(_4101, _4085, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4113 = fma(_4101, _4089, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4115 = fma(_4101, _4093, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4117 = fma(_4101, _4097, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4043 = _4111;
            _4031 = _4115;
            _4037 = _4107;
            _4023 = _4113;
            _4049 = _4109;
            _4057 = _4117;
            _4119 = true;
        }
        else
        {
            bool _4121 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4123 = isnan(_3502);
            bool _4125 = _4121 || _4123;
            bool _4127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4129 = _4125 || _4127;
            if (!_4129)
            {
                _4035 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4131 = _4035;
            _4037 = _4131;
            if (!_4129)
            {
                _4041 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4133 = _4041;
            _4043 = _4133;
            if (!_4129)
            {
                _4047 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4135 = _4047;
            _4049 = _4135;
            if (!_4129)
            {
                _4021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4137 = _4021;
            _4023 = _4137;
            if (!_4129)
            {
                _4029 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4139 = _4029;
            _4031 = _4139;
            if (!_4129)
            {
                _4055 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4141 = _4055;
            bool _4143 = !_4129;
            _4057 = _4141;
            if (!_4143)
            {
                bool _4145 = _3502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4147 = isnan(_3502);
                bool _4149 = _4145 || _4147;
                bool _4151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4153 = _4149 || _4151;
                if (!_4153)
                {
                    float _4155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4157 = _3502 + _4155;
                    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4161 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4159;
                    float _4163 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4167 = 1.0 / _4161;
                    float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4175 = _4173 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4179 = _4177 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4183 = _4181 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4185 = _4157 * _4167;
                    float _4187 = precise::clamp(_4185, 0.0, 1.0);
                    float _4189 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4191 = _4189 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4193 = fma(_4187, _4165, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4195 = fma(_4187, _4191, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4197 = fma(_4187, _4171, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4199 = fma(_4187, _4175, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4201 = fma(_4187, _4179, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4203 = fma(_4187, _4183, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4043 = _4197;
                    _4031 = _4201;
                    _4037 = _4193;
                    _4023 = _4199;
                    _4049 = _4195;
                    _4057 = _4203;
                    _4119 = true;
                }
                else
                {
                    _4043 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4031 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4037 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4049 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4057 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4119 = false;
    float _4205 = _4043;
    float _4207 = _4031;
    float _4209 = _4037;
    float _4211 = _4023;
    float _4213 = _4049;
    float _4215 = _4057;
    float _4217 = fma(_3963, -0.5, 0.5);
    float _4219 = precise::clamp(_4217, 0.0, 1.0);
    float _4221 = -_4205;
    float _4223 = _4221 + _4207;
    float _4225 = _4027 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4227 = -_4209;
    float _4229 = _4227 + _4211;
    out.m_100.x = 0.0;
    float _4231 = fma(_4219, _4223, _4205);
    float _4233 = -_4213;
    float _4235 = _4233 + _4215;
    out.m_53.x = _4225;
    float _4237 = fma(_4219, _4229, _4209);
    float _4239 = _4231 * 0.586610972881317138671875;
    bool _4241 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4243 = fma(_4219, _4235, _4213);
    float _4245 = fma(_4237, 0.298911988735198974609375, _4239);
    bool _4247 = _3955 > 0.0;
    bool _4249 = isnan(_3955);
    bool _4251 = _4247 || _4249;
    bool _4253 = isnan(0.0);
    bool _4255 = _4251 || _4253;
    float _4257 = fma(_4243, 0.114477999508380889892578125, _4245);
    float _4259 = -_4257;
    float _4261 = _4237 + _4259;
    float _4263 = -_4257;
    float _4265 = _4231 + _4263;
    float _4267 = -_4257;
    float _4269 = _4243 + _4267;
    float _4271 = fma(_4261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    float _4273 = fma(_4265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    float _4275 = fma(_4269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4257);
    bool _4277 = !_4241;
    if (!_4277)
    {
        float _4279 = -_3320;
        float _4281 = _4279 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4283 = -_3324;
        float _4285 = _4283 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4287 = -_3328;
        float _4289 = _4287 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4291 = _4281 * _4281;
        float _4293 = fma(_4285, _4285, _4291);
        float _4295 = fma(_4289, _4289, _4293);
        float _4297 = sqrt(_4295);
        float _4299 = rsqrt(_4295);
        float _4301 = -_4297;
        float _4303 = _4301 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4305 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4307 = precise::clamp(_4305, 0.0, 1.0);
        float _4309 = _4285 * _4299;
        float _4311 = _4281 * _4299;
        float _4313 = abs(_4307);
        float _4315 = log2(_4313);
        float _4317 = _4289 * _4299;
        float _4319 = _4309 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4321 = _3963 * _4311;
        float _4323 = -_4311;
        float _4325 = -_4319;
        float _4327 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4325);
        float _4329 = fma(_3961, _4309, _4321);
        float _4331 = -_4317;
        float _4333 = fma(_4331, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4327);
        float _4335 = fma(_3967, _4317, _4329);
        float _4337 = precise::clamp(_4335, 0.0, 1.0);
        float _4339 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4341 = _4333 + _4339;
        float _4343 = _4315 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4345 = _4341 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4347 = precise::clamp(_4345, 0.0, 1.0);
        float _4349 = exp2(_4343);
        float _4351 = _4349 * _4347;
        float _4353 = _4337 * _4351;
        float _4355 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4357 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4359 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _4355;
        out.m_100.y = _4357;
        out.m_100.z = _4359;
    }
    out.m_102.x = _4271;
    out.m_102.y = _4273;
    out.m_102.z = _4275;
    if (_4255)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4361;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

