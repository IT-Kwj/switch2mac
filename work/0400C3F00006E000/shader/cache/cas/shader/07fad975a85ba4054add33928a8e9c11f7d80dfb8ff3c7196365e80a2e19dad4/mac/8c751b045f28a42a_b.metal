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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_28Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    bool _955 = false;
    bool _531 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_48.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    if (!_103)
    {
        out.m_51.x = 0.0;
    }
    int _109 = 0;
    if (!_103)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_113);
        out.gl_Position.z = _2116;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_53.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    if (_127)
    {
        float _135 = float(_99);
        _133 = _135;
    }
    float _137 = _133;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_51.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_151);
        out.gl_Position.z = _2185;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_55.x;
    float _155 = in.m_55.y;
    float _157 = in.m_55.z;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _167 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _171);
    bool _179 = !_159;
    float _181 = _175;
    float _199;
    if (!_179)
    {
        float _183 = in.m_57.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_99);
        float _205 = 1.0 / _203;
        float _207 = _131 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _209 + _243;
    float _247 = 1.0 / _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _237;
    float _255 = _213 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -_229;
    float _271 = _269 + 1.0;
    float _273 = _267 * _271;
    float _275 = _217 * _251;
    bool _277 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_209);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_267;
    float _291 = _289 + 1.0;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _245 * _253;
    bool _299 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_209);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = _287 * _291;
    float _317 = -_287;
    float _319 = _317 + 1.0;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = fma(_313, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _309 * _319;
    float _333 = fma(_323, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = fma(_295, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _337 = fma(_327, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_309;
    float _341 = _339 + 1.0;
    float _343 = _329 * _331;
    float _345 = _333 * _331;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _275, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _275, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_335, _315, _355);
    float _365 = fma(_337, _315, _357);
    float _367 = fma(_359, _273, _363);
    float _369 = fma(_361, _273, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_57.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_99);
        float _399 = 1.0 / _397;
        float _401 = _131 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = _403 + _405;
    bool _409 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _411 = isnan(_403);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _421;
    bool _425 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_403);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -_419;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _441;
    float _445 = 1.0 / _423;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _449 = _435 * _439;
    float _451 = -_435;
    float _453 = _451 + 1.0;
    float _455 = _407 * _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _457;
    float _461 = fma(_443, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _469 = fma(_465, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _471 = _461 * _449;
    float _473 = _467 * _449;
    float _475 = _469 * _449;
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].x, _471);
    float _479 = in.m_59.x;
    float _481 = in.m_59.y;
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].y, _475);
    float _485 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].z, _473);
    float _487 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].x, _477);
    float _489 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].y, _483);
    float _491 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].z, _485);
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _497 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _501;
    out.m_61.y = _503;
    out.m_61.z = _505;
    out.m_61.w = _499;
    float _507 = _373 * _481;
    float _509 = _371 * _479;
    bool _511 = !_447;
    float _529;
    if (!_511)
    {
        float _513 = in.m_57.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_99);
        float _535 = 1.0 / _533;
        float _537 = _131 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = as_type<float>(int(gl_VertexIndex));
    float _543 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _545 = in.m_57.x;
    float _547 = in.m_57.y;
    float _549 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _551 = in.m_48.x;
    float _553 = in.m_48.y;
    float _555 = in.m_48.z;
    int _557 = as_type<int>(_541) & 1;
    bool _559 = _557 != 0;
    int _561 = as_type<int>(_541) & 2;
    bool _563 = _561 != 0;
    bool _565 = _545 > 0.5;
    bool _567 = !_563;
    float _569 = _567 ? (-0.5) : 0.5;
    float _571 = in.m_66.y;
    bool _573 = _547 > 0.5;
    float _575 = _553 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _577 = _553 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _569);
    bool _581 = !_559;
    float _583 = _581 ? (-0.5) : 0.5;
    float _585 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _587 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _589 = _543 * _579;
    float _591 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _583);
    float _595 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[4].z, _585);
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[6].z, _587);
    float _599 = _589 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _601 = _591 * _593;
    float _603 = _589 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].x, _599);
    float _609 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = _597 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _613;
    float _617 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _619 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _623 = _621 != 0;
    float _625 = 1.0 / _615;
    float _627 = _617 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _629 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _633 = _631 != 0;
    float _635 = _589 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _637 = _605 + _627;
    float _639 = _611 + _629;
    float _641 = _553 + _571;
    bool _643 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _645 = isnan(_539);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _657 = _637 + _655;
    float _659 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _661 = _639 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _665 = _539 + _663;
    float _667 = _657 * _657;
    float _669 = _661 * _661;
    float _671 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].x, _635);
    float _673 = _665 * _625;
    bool _675 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _677 = isnan(_539);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _667 + _669;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _689;
    float _693 = sqrt(_687);
    float _695 = -_685;
    float _697 = _695 + 1.0;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _699;
    float _703 = fma(_691, _673, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _705;
    float _709 = _653 * _697;
    float _711 = fma(_701, _673, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _713 = -_569;
    int _715 = _573 ? as_type<int>(_713) : as_type<int>(_569);
    float _717 = fma(_707, _673, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _719 = _703 * _709;
    float _721 = _711 * _709;
    float _723 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[25].z, _671);
    float _725 = -_583;
    int _727 = _565 ? as_type<int>(_725) : as_type<int>(_583);
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _731 = !_633;
    float _733 = _731 ? _569 : as_type<float>(_715);
    float _735 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _737 = _693 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _739 = _723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _741 = !_623;
    float _743 = _741 ? _583 : as_type<float>(_727);
    float _745 = _717 * _709;
    float _747 = _583 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _749 = _735 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _735 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _755 = _641 + _739;
    float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _749);
    float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _753);
    float _763 = _751;
    float _765 = _739;
    float _767 = _753;
    float _769 = _639;
    float _771 = _637;
    if (!_737)
    {
        _763 = _639;
    }
    float _773 = _763;
    float _775 = _773;
    if (!_737)
    {
        _765 = _669;
    }
    float _777 = _765;
    float _779 = _777;
    if (!_737)
    {
        _767 = _667;
    }
    float _781 = _767;
    float _783 = _781;
    if (!_737)
    {
        _769 = _755;
    }
    float _785 = _769;
    bool _787 = !_737;
    float _789 = _785;
    if (!_787)
    {
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _795 = _693 + _793;
        float _797 = rsqrt(_687);
        float _799 = _795 * _791;
        float _801 = _755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _803 = _799 * 0.15915493667125701904296875;
        float _805 = _803 * 6.283185482025146484375;
        float _807 = sin(_805);
        float _809 = _803 * 6.283185482025146484375;
        float _811 = cos(_809);
        float _813 = fma(_807, _801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _815 = _797 * _813;
        float _817 = _811 + (-1.0);
        float _819 = fma(_657, _815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _821 = fma(_661, _815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _823 = _817 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _827 = _819 + _825;
        float _829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _831 = _821 + _829;
        float _833 = fma(_755, _811, _823);
        float _835 = _827 * _827;
        float _837 = _831 * _831;
        _789 = _833;
        _783 = _835;
        _779 = _837;
        _771 = _819;
        _775 = _821;
    }
    float _839 = _789;
    float _841 = _783;
    float _843 = _779;
    float _845 = _771;
    float _847 = _775;
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _851 = _839 + _849;
    float _853 = -_653;
    float _855 = _853 + 1.0;
    float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _859 = _743 + 0.5;
    float _861 = fma(_851, _851, _841);
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].y, _721);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].x, _719);
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].z, _745);
    float _869 = _861 + _843;
    float _871 = _859 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _873 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].y, _863);
    float _875 = -_733;
    float _877 = _875 + 0.5;
    float _879 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].x, _865);
    float _881 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].z, _867);
    float _883 = sqrt(_869);
    float _885 = _871 * _729;
    float _887 = _873 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _889 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _895 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _889 * _857;
    float _901 = _757 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _903 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _761 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_68.x = _885;
    out.m_68.y = _899;
    bool _909 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _911 = isnan(_883);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _917 = _913 || _915;
    out.m_70.x = _903;
    out.m_70.y = _897;
    out.m_70.z = _905;
    out.m_72.x = _901;
    out.m_72.y = _895;
    out.m_72.z = _907;
    float _919 = _859;
    if (!_917)
    {
        _919 = 1.0;
    }
    float _921 = _919;
    bool _923 = !_917;
    float _925 = _921;
    if (!_923)
    {
        bool _927 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _929 = isnan(_883);
        bool _931 = _927 || _929;
        bool _933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _935 = _931 || _933;
        if (!_935)
        {
            float _937 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _939 = _883 + _937;
            float _941 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _943 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _941;
            float _945 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _947 = _945 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _949 = 1.0 / _943;
            float _951 = _939 * _949;
            float _953 = fma(_951, _947, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _925 = _953;
            _955 = true;
        }
        else
        {
            bool _957 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _959 = isnan(_883);
            bool _961 = _957 || _959;
            bool _963 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _965 = _961 || _963;
            if (!_965)
            {
                float _967 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _969 = _883 + _967;
                float _971 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _973 = _971 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _975 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _977 = _975 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _979 = 1.0 / _973;
                float _981 = _969 * _979;
                float _983 = fma(_981, _977, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _925 = _983;
                _955 = true;
            }
            else
            {
                _925 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _955 = false;
    float _985 = _925;
    float _987 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _989 = _845 + _987;
    float _991 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _993 = _847 + _991;
    float _995 = fma(_989, _985, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _997 = fma(_993, _985, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1001 = _995 + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1005 = _997 + _1003;
    float _1007 = fma(_1001, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1009 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3647 = float2(_1007, _1009);
    float _1011 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3647, float2(0.0), isnan(_3647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3647, float2(0.0), isnan(_3647)), level(0.0)).x;
    float _1013 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1015 = _839 + _1013;
    float _1017 = -_605;
    float _1019 = _1017 + _995;
    float _1021 = -_611;
    float _1023 = _1021 + _997;
    float _1025 = fma(_1015, _985, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1027 = -_641;
    float _1029 = _1027 + _1025;
    float _1031 = _1029 * _1029;
    float _1033 = fma(_1019, _1019, _1031);
    float _1035 = fma(_1023, _1023, _1033);
    float _1037 = sqrt(_1035);
    bool _1039 = _1037 > 0.0;
    bool _1041 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_1011, 100.0, _641);
    float _1053 = fma(_1011, 100.0, _1025);
    float _1055 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1059 = _997;
    float _1061 = _1011;
    float _1063 = _995;
    if (!_1039)
    {
        _1057 = _1053;
    }
    float _1065 = _1057;
    float _1067 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1055);
    float _1069 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1071 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1067);
    float _1073 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1069);
    float _1075 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1077 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    bool _1079 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.5);
    bool _1087 = _1083 || _1085;
    float _1089 = 1.0 / _1075;
    float _1091 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1095 = _1065;
    float _1097 = _1065;
    float _1099 = _1075;
    if (!_1039)
    {
        _1093 = _995;
    }
    float _1101 = _1093;
    float _1103 = _1091 + _1075;
    bool _1105 = !_1039;
    float _1107 = _1101;
    if (!_1105)
    {
        float _1109 = _173 * _173;
        float _1111 = rsqrt(_1035);
        float _1113 = fma(_175, _175, _1109);
        float _1115 = fma(_177, _177, _1113);
        float _1117 = sqrt(_1115);
        float _1119 = _1019 * _1111;
        float _1121 = _1029 * _1111;
        float _1123 = _1023 * _1111;
        bool _1125 = _1117 > 0.0;
        float _1127 = _1111;
        _1061 = _1117;
        if (!_1125)
        {
            _1127 = _995;
        }
        float _1129 = _1127;
        _1107 = _1129;
        if (!_1125)
        {
            _1095 = _1053;
        }
        float _1131 = _1095;
        bool _1133 = !_1125;
        _1097 = _1131;
        if (!_1133)
        {
            float _1135 = rsqrt(_1115);
            float _1137 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1139 = _173 * _1135;
            float _1141 = _175 * _1135;
            float _1143 = _1121 * _1139;
            float _1145 = _177 * _1135;
            float _1147 = fma(_1119, _1141, _1143);
            float _1149 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1151 = fma(_1123, _1145, _1147);
            float _1153 = _1151 * _1149;
            float _1155 = fma(_175, _1153, _995);
            float _1157 = fma(_173, _1153, _1053);
            float _1159 = fma(_177, _1153, _997);
            _1097 = _1157;
            _1059 = _1159;
            _1107 = _1155;
            _1061 = _1153;
        }
    }
    float _1161 = _1097;
    float _1163 = _1059;
    float _1165 = _1107;
    float _1167 = _1061;
    float _1169 = _1103 * _1089;
    float _1171 = _1169 * 0.5;
    float _1173 = _1167;
    float _1175 = _1165;
    float _1177 = _1161;
    float _1179 = _1163;
    if (_1049)
    {
        _181 = 1.0;
    }
    float _1181 = _181;
    float _1183 = _1181;
    if (_1087)
    {
        _1063 = _1161;
    }
    float _1185 = _1063;
    float _1187 = _1185;
    if (_1087)
    {
        _1173 = _1163;
    }
    float _1189 = _1173;
    float _1191 = _1189;
    if (!_1087)
    {
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1195 = _1051 + _1193;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1199 = _605 + _1197;
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1203 = -_605;
        float _1205 = _1203 + _1165;
        float _1207 = _1195 * _1195;
        float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1211 = _611 + _1209;
        float _1213 = -_1051;
        float _1215 = _1213 + _1161;
        float _1217 = -_611;
        float _1219 = _1217 + _1163;
        float _1221 = fma(_1199, _1199, _1207);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1225 = fma(_1211, _1211, _1221);
        float _1227 = sqrt(_1225);
        float _1229 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = precise::min(_1227, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1233 = _1231 * _1223;
        float _1235 = _1229 * _1233;
        float _1237 = fma(_1205, _1235, _605);
        float _1239 = fma(_1215, _1235, _1051);
        float _1241 = fma(_1219, _1235, _611);
        _1187 = _1239;
        _1175 = _1237;
        _1191 = _1241;
        _1099 = _1201;
        _1177 = _1215;
        _1179 = _1219;
    }
    float _1243 = _1187;
    float _1245 = _1175;
    float _1247 = _1191;
    float _1249 = _1099;
    float _1251 = _1177;
    float _1253 = _1179;
    float _1255 = _1251;
    float _1257 = _1249;
    float _1259 = _1253;
    if (!_1049)
    {
        float _1261 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1265 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1263);
        float _1267 = _1261 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1275 = _1273 * 0.15915493667125701904296875;
        float _1277 = _1267 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1271;
        float _1283 = _1275 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1265;
        float _1291 = _1285 * _1287;
        float _1293 = _1275 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1299 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1297;
        float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1303 = _1289 * _1301;
        float _1305 = 1.0 / _1291;
        float _1307 = 1.0 / _1299;
        float _1309 = _1295 * _1305;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1313 = fma(_1309, _1303, _1311);
        float _1315 = _1313 * _1307;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        _1255 = _1275;
        _1183 = _1317;
    }
    float _1319 = _1255;
    float _1321 = _1183;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1243 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1245 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1247 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1341 = fma(_1333, _1333, _1337);
    float _1343 = rsqrt(_1341);
    float _1345 = sqrt(_1341);
    float _1347 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1349 = _1329 * _1347;
    float _1351 = _1333 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 * _1351;
    float _1357 = _1353 + _1355;
    float _1359 = sqrt(_1357);
    bool _1361 = _1359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1365 = _1359 + _1363;
    float _1367 = _1343;
    float _1369 = _1319;
    float _1371 = _1365;
    float _1373 = _1325;
    float _1375 = _1349;
    if (_1361)
    {
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1367 = _1377;
    }
    float _1379 = _1367;
    if (_1361)
    {
        float _1381 = rsqrt(_1357);
        _1369 = _1381;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1361)
    {
        float _1387 = _1365 * _1379;
        _1371 = _1387;
    }
    float _1389 = _1371;
    if (_1361)
    {
        float _1391 = _1389 * 0.15915493667125701904296875;
        _1257 = _1391;
    }
    float _1393 = _1257;
    float _1395 = _1379;
    if (_1361)
    {
        float _1397 = _1393 * 6.283185482025146484375;
        float _1399 = sin(_1397);
        _1395 = _1399;
    }
    float _1401 = _1395;
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1405 = precise::max(0.0, _1403);
    float _1407 = _1333;
    float _1409 = _1405;
    if (_1361)
    {
        float _1411 = _1393 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        _1407 = _1413;
    }
    float _1415 = _1407;
    float _1417 = -_1347;
    float _1419 = -_1405;
    float _1421 = fma(_1325, _1417, _1419);
    if (!_1361)
    {
        _1373 = _1351;
    }
    float _1423 = _1373;
    float _1425 = _1423;
    if (_1361)
    {
        float _1427 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1427;
    }
    float _1429 = _1409;
    float _1431 = _1401;
    float _1433 = _1429;
    if (_1361)
    {
        float _1435 = fma(_1401, _1429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1259 = _1435;
    }
    float _1437 = _1259;
    float _1439 = _1437;
    if (!_1361)
    {
        _1431 = _1421;
    }
    float _1441 = _1431;
    float _1443 = _1441;
    float _1445 = _1415;
    if (_1361)
    {
        float _1447 = _1415 + (-1.0);
        _1433 = _1447;
    }
    float _1449 = _1433;
    float _1451 = _1449;
    if (_1361)
    {
        float _1453 = _1383 * _1437;
        _1439 = _1453;
    }
    float _1455 = _1439;
    if (_1361)
    {
        float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1457;
    }
    float _1459 = _1385;
    if (_1361)
    {
        float _1461 = _1349 * _1455;
        _1375 = _1461;
    }
    float _1463 = _1375;
    if (!_1361)
    {
        _1451 = _1353;
    }
    float _1465 = _1451;
    float _1467 = _1465;
    if (_1361)
    {
        float _1469 = _1351 * _1455;
        _1425 = _1469;
    }
    float _1471 = _1425;
    if (_1361)
    {
        float _1473 = fma(_1421, _1415, _1459);
        _1443 = _1473;
    }
    float _1475 = _1443;
    if (_1361)
    {
        float _1477 = _1463 * _1463;
        _1467 = _1477;
    }
    float _1479 = _1467;
    if (!_1361)
    {
        _1445 = _1355;
    }
    float _1481 = _1445;
    float _1483 = _1481;
    if (_1361)
    {
        float _1485 = _1471 * _1471;
        _1483 = _1485;
    }
    float _1487 = _1483;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1491 = fma(_1345, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = fma(_1475, _1475, _1479);
    float _1497 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1499 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = -_1493;
    float _1503 = _1501 + 1.0;
    float _1505 = _1495 + _1487;
    float _1507 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1497);
    float _1509 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1511 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = rsqrt(_1505);
    float _1515 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1517 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1509);
    float _1519 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1521 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1523 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1525 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1519);
    float _1527 = abs(_1503);
    float _1529 = log2(_1527);
    float _1531 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1517);
    float _1533 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1535 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1521);
    float _1537 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1539 = -_1533;
    float _1541 = fma(_1539, _1339, 1.0);
    float _1543 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1545 = _1513 * _1463;
    float _1547 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = _1513 * _1475;
    float _1551 = _1513 * _1471;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1557 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1559 = log2(_1541);
    float _1561 = -_1553;
    float _1563 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1561);
    float _1565 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1555);
    float _1567 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1569 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1571 = -_1551;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1563);
    float _1575 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1577 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1579 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1569);
    float _1581 = fma(_1573, -0.5, 0.5);
    float _1583 = exp2(_1567);
    float _1585 = fma(_1573, 0.5, 0.5);
    float _1587 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1577);
    float _1589 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1591 = _1549 + 1.0;
    float _1593 = fma(_1585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1595 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1587);
    float _1597 = _1559 * 0.693147182464599609375;
    float _1599 = 1.0 / _1575;
    float _1601 = fma(_1585, _1593, -0.212114393711090087890625);
    float _1603 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1595);
    float _1605 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1607 = fma(_1585, _1601, 1.570728778839111328125);
    float _1609 = sqrt(_1581);
    float _1611 = -_1549;
    float _1613 = fma(_1583, _1591, _1611);
    float _1615 = fma(_1613, 0.5, 0.5);
    float _1617 = _1603 * _1599;
    float _1619 = _1605 * _1599;
    float _1621 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1623 = fma(_1617, 0.5, 0.5);
    float _1625 = fma(_1619, -0.5, 0.5);
    float _1627 = _1609 * 0.636619746685028076171875;
    float3 _4626 = float3(_1623, _1625, _1621);
    float _1629 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4626, float3(0.0), isnan(_4626)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4626, float3(0.0), isnan(_4626)), level(0.0)).x;
    float3 _4637 = float3(_1623, _1625, _1621);
    float4 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4637, float3(0.0), isnan(_4637)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4637, float3(0.0), isnan(_4637)), level(0.0)).xyzw;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1632.w;
    float _1642 = -_1607;
    float _1644 = fma(_1627, _1642, 1.0);
    float2 _4658 = float2(_1644, _1615);
    float3 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4658, float2(0.0), isnan(_4658)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4658, float2(0.0), isnan(_4658)), level(0.0)).xyz;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1658 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1660 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1662 = isnan(_1345);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1668 = _1664 || _1666;
    float _1670 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    float _1672 = exp2(_1656);
    float _1674 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1670);
    float _1676 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    float _1678 = _1676 + _1575;
    out.gl_Position.x = _1603;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _1676;
    out.gl_Position.w = _1575;
    float _1680 = _1678 * 0.5;
    float _1682 = -_1672;
    float _1684 = _1682 + 1.0;
    float _1686 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.z = _1680;
    out.m_74.w = _1575;
    float _1688 = _1575;
    float _1690 = _1676;
    float _1692 = _1605;
    float _1694 = _1680;
    float _1696 = _1603;
    if (!_1668)
    {
        _1688 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1698 = _1688;
    float _1700 = _1698;
    float _1702 = _1698;
    if (!_1668)
    {
        _1690 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1704 = _1690;
    float _1706 = _1704;
    float _1708 = _1704;
    if (!_1668)
    {
        _1692 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1710 = _1692;
    float _1712 = _1710;
    float _1714 = _1710;
    if (!_1668)
    {
        _1694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1716 = _1694;
    float _1718 = _1716;
    float _1720 = _1716;
    if (!_1668)
    {
        _1696 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1722 = _1696;
    float _1724 = _1686 * _1629;
    float _1726 = -_1686;
    float _1728 = _1726 + 1.0;
    float _1730 = _1640 * _1724;
    float _1732 = _1640 * _1728;
    float _1734 = _1654 * _1724;
    float _1736 = fma(_1650, _1730, _1634);
    float _1738 = fma(_1652, _1730, _1636);
    float _1740 = _1730;
    float _1742 = _1722;
    float _1744 = _1722;
    if (!_1668)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1746 = _1740;
    float _1748 = fma(_1640, _1734, _1638);
    float _1750 = _1321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_76.x = _1736;
    out.m_76.y = _1738;
    out.m_76.z = _1748;
    out.m_76.w = _1732;
    bool _1752 = !_1668;
    float _1754 = _1746;
    float _1756 = _1746;
    if (!_1752)
    {
        bool _1758 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1760 = isnan(_1345);
        bool _1762 = _1758 || _1760;
        bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1766 = _1762 || _1764;
        if (!_1766)
        {
            float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1770 = _1345 + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1774 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1772;
            float _1776 = 1.0 / _1774;
            float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1780 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1784 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1788 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1792 = _1790 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1798 = _1770 * _1776;
            float _1800 = precise::clamp(_1798, 0.0, 1.0);
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1806 = fma(_1800, _1780, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1808 = fma(_1800, _1804, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1810 = fma(_1800, _1784, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1812 = fma(_1800, _1788, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1814 = fma(_1800, _1792, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1816 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1720 = _1808;
            _1714 = _1814;
            _1756 = _1806;
            _1708 = _1812;
            _1702 = _1810;
            _1744 = _1816;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1822 = isnan(_1345);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                _1754 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1830 = _1754;
            _1756 = _1830;
            if (!_1828)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1832 = _1718;
            _1720 = _1832;
            if (!_1828)
            {
                _1700 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1834 = _1700;
            _1702 = _1834;
            if (!_1828)
            {
                _1706 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1836 = _1706;
            _1708 = _1836;
            if (!_1828)
            {
                _1712 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1838 = _1712;
            _1714 = _1838;
            if (!_1828)
            {
                _1742 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1840 = _1742;
            bool _1842 = !_1828;
            _1744 = _1840;
            if (!_1842)
            {
                bool _1844 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1846 = isnan(_1345);
                bool _1848 = _1844 || _1846;
                bool _1850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1852 = _1848 || _1850;
                if (!_1852)
                {
                    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1856 = _1345 + _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1860 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1858;
                    float _1862 = 1.0 / _1860;
                    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1882 = _1880 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1884 = _1856 * _1862;
                    float _1886 = precise::clamp(_1884, 0.0, 1.0);
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1892 = fma(_1886, _1866, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1894 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1896 = fma(_1886, _1870, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1898 = fma(_1886, _1874, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1900 = fma(_1886, _1878, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1902 = fma(_1886, _1882, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1720 = _1894;
                    _1714 = _1900;
                    _1756 = _1892;
                    _1708 = _1898;
                    _1702 = _1896;
                    _1744 = _1902;
                    _1818 = true;
                }
                else
                {
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1714 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1756 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1708 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1702 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1744 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1818 = false;
    float _1904 = _1720;
    float _1906 = _1714;
    float _1908 = _1756;
    float _1910 = _1708;
    float _1912 = _1702;
    float _1914 = _1744;
    float _1916 = fma(_895, -0.5, 0.5);
    float _1918 = precise::clamp(_1916, 0.0, 1.0);
    float _1920 = -_1904;
    float _1922 = _1920 + _1906;
    float _1924 = -_1908;
    float _1926 = _1924 + _1910;
    out.m_78.x = 0.0;
    float _1928 = -_1912;
    float _1930 = _1928 + _1914;
    float _1932 = fma(_1918, _1922, _1904);
    float _1934 = fma(_1918, _1926, _1908);
    bool _1936 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1938 = _1932 * 0.586610972881317138671875;
    float _1940 = fma(_1918, _1930, _1912);
    float _1942 = _1750 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1944 = fma(_1934, 0.298911988735198974609375, _1938);
    bool _1946 = _1321 > 0.0;
    bool _1948 = isnan(_1321);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    float _1956 = fma(_1940, 0.114477999508380889892578125, _1944);
    out.m_51.x = _1942;
    float _1958 = -_1956;
    float _1960 = _1934 + _1958;
    float _1962 = -_1956;
    float _1964 = _1932 + _1962;
    float _1966 = -_1956;
    float _1968 = _1940 + _1966;
    float _1970 = fma(_1960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    float _1972 = fma(_1964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    float _1974 = fma(_1968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    bool _1976 = !_1936;
    if (!_1976)
    {
        float _1978 = -_1243;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1982 = -_1245;
        float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1986 = -_1247;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1990 = _1980 * _1980;
        float _1992 = fma(_1984, _1984, _1990);
        float _1994 = fma(_1988, _1988, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = rsqrt(_1994);
        float _2000 = -_1996;
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2006 = precise::clamp(_2004, 0.0, 1.0);
        float _2008 = _1984 * _1998;
        float _2010 = _1980 * _1998;
        float _2012 = abs(_2006);
        float _2014 = log2(_2012);
        float _2016 = _1988 * _1998;
        float _2018 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2020 = _895 * _2010;
        float _2022 = -_2010;
        float _2024 = -_2018;
        float _2026 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2024);
        float _2028 = fma(_901, _2008, _2020);
        float _2030 = -_2016;
        float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2026);
        float _2034 = fma(_907, _2016, _2028);
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2040 = _2032 + _2038;
        float _2042 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2046 = precise::clamp(_2044, 0.0, 1.0);
        float _2048 = exp2(_2042);
        float _2050 = _2048 * _2046;
        float _2052 = _2036 * _2050;
        float _2054 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2054;
        out.m_78.y = _2056;
        out.m_78.z = _2058;
    }
    out.m_80.x = _1970;
    out.m_80.y = _1972;
    out.m_80.z = _1974;
    if (_1954)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2060;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    bool _955 = false;
    bool _531 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_48.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    if (!_103)
    {
        out.m_51.x = 0.0;
    }
    int _109 = 0;
    if (!_103)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_113);
        out.gl_Position.z = _2116;
    }
    if (!_103)
    {
        return out;
    }
    float _117 = in.m_53.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    if (_127)
    {
        float _135 = float(_99);
        _133 = _135;
    }
    float _137 = _133;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_51.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_151);
        out.gl_Position.z = _2185;
    }
    if (_143)
    {
        return out;
    }
    float _153 = in.m_55.x;
    float _155 = in.m_55.y;
    float _157 = in.m_55.z;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _167 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _171);
    bool _179 = !_159;
    float _181 = _175;
    float _199;
    if (!_179)
    {
        float _183 = in.m_57.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_99);
        float _205 = 1.0 / _203;
        float _207 = _131 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _209 + _243;
    float _247 = 1.0 / _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _237;
    float _255 = _213 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -_229;
    float _271 = _269 + 1.0;
    float _273 = _267 * _271;
    float _275 = _217 * _251;
    bool _277 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_209);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_267;
    float _291 = _289 + 1.0;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _245 * _253;
    bool _299 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_209);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = _287 * _291;
    float _317 = -_287;
    float _319 = _317 + 1.0;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = fma(_313, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _309 * _319;
    float _333 = fma(_323, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = fma(_295, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _337 = fma(_327, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_309;
    float _341 = _339 + 1.0;
    float _343 = _329 * _331;
    float _345 = _333 * _331;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _275, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _275, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_335, _315, _355);
    float _365 = fma(_337, _315, _357);
    float _367 = fma(_359, _273, _363);
    float _369 = fma(_361, _273, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_57.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_99);
        float _399 = 1.0 / _397;
        float _401 = _131 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = _403 + _405;
    bool _409 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _411 = isnan(_403);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _421;
    bool _425 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_403);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -_419;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _441;
    float _445 = 1.0 / _423;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _449 = _435 * _439;
    float _451 = -_435;
    float _453 = _451 + 1.0;
    float _455 = _407 * _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _457;
    float _461 = fma(_443, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _469 = fma(_465, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _471 = _461 * _449;
    float _473 = _467 * _449;
    float _475 = _469 * _449;
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].x, _471);
    float _479 = in.m_59.x;
    float _481 = in.m_59.y;
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].y, _475);
    float _485 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].z, _473);
    float _487 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].x, _477);
    float _489 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].y, _483);
    float _491 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].z, _485);
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _497 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _501;
    out.m_61.y = _503;
    out.m_61.z = _505;
    out.m_61.w = _499;
    float _507 = _373 * _481;
    float _509 = _371 * _479;
    bool _511 = !_447;
    float _529;
    if (!_511)
    {
        float _513 = in.m_57.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_99);
        float _535 = 1.0 / _533;
        float _537 = _131 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = as_type<float>(int(gl_VertexIndex));
    float _543 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _545 = in.m_57.x;
    float _547 = in.m_57.y;
    float _549 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _551 = in.m_48.x;
    float _553 = in.m_48.y;
    float _555 = in.m_48.z;
    int _557 = as_type<int>(_541) & 1;
    bool _559 = _557 != 0;
    int _561 = as_type<int>(_541) & 2;
    bool _563 = _561 != 0;
    bool _565 = _545 > 0.5;
    bool _567 = !_563;
    float _569 = _567 ? (-0.5) : 0.5;
    float _571 = in.m_66.y;
    bool _573 = _547 > 0.5;
    float _575 = _553 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _577 = _553 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _569);
    bool _581 = !_559;
    float _583 = _581 ? (-0.5) : 0.5;
    float _585 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _587 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _589 = _543 * _579;
    float _591 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _583);
    float _595 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[4].z, _585);
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[6].z, _587);
    float _599 = _589 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _601 = _591 * _593;
    float _603 = _589 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].x, _599);
    float _609 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = _597 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _613;
    float _617 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _619 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _623 = _621 != 0;
    float _625 = 1.0 / _615;
    float _627 = _617 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _629 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _633 = _631 != 0;
    float _635 = _589 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _637 = _605 + _627;
    float _639 = _611 + _629;
    float _641 = _553 + _571;
    bool _643 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _645 = isnan(_539);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _657 = _637 + _655;
    float _659 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _661 = _639 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _665 = _539 + _663;
    float _667 = _657 * _657;
    float _669 = _661 * _661;
    float _671 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].x, _635);
    float _673 = _665 * _625;
    bool _675 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _677 = isnan(_539);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _667 + _669;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _689;
    float _693 = sqrt(_687);
    float _695 = -_685;
    float _697 = _695 + 1.0;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _699;
    float _703 = fma(_691, _673, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _705;
    float _709 = _653 * _697;
    float _711 = fma(_701, _673, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _713 = -_569;
    int _715 = _573 ? as_type<int>(_713) : as_type<int>(_569);
    float _717 = fma(_707, _673, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _719 = _703 * _709;
    float _721 = _711 * _709;
    float _723 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[25].z, _671);
    float _725 = -_583;
    int _727 = _565 ? as_type<int>(_725) : as_type<int>(_583);
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _731 = !_633;
    float _733 = _731 ? _569 : as_type<float>(_715);
    float _735 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _737 = _693 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _739 = _723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _741 = !_623;
    float _743 = _741 ? _583 : as_type<float>(_727);
    float _745 = _717 * _709;
    float _747 = _583 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _749 = _735 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _735 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _755 = _641 + _739;
    float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _749);
    float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _753);
    float _763 = _751;
    float _765 = _739;
    float _767 = _753;
    float _769 = _639;
    float _771 = _637;
    if (!_737)
    {
        _763 = _639;
    }
    float _773 = _763;
    float _775 = _773;
    if (!_737)
    {
        _765 = _669;
    }
    float _777 = _765;
    float _779 = _777;
    if (!_737)
    {
        _767 = _667;
    }
    float _781 = _767;
    float _783 = _781;
    if (!_737)
    {
        _769 = _755;
    }
    float _785 = _769;
    bool _787 = !_737;
    float _789 = _785;
    if (!_787)
    {
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _795 = _693 + _793;
        float _797 = rsqrt(_687);
        float _799 = _795 * _791;
        float _801 = _755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _803 = _799 * 0.15915493667125701904296875;
        float _805 = _803 * 6.283185482025146484375;
        float _807 = sin(_805);
        float _809 = _803 * 6.283185482025146484375;
        float _811 = cos(_809);
        float _813 = fma(_807, _801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _815 = _797 * _813;
        float _817 = _811 + (-1.0);
        float _819 = fma(_657, _815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _821 = fma(_661, _815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _823 = _817 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _827 = _819 + _825;
        float _829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _831 = _821 + _829;
        float _833 = fma(_755, _811, _823);
        float _835 = _827 * _827;
        float _837 = _831 * _831;
        _789 = _833;
        _783 = _835;
        _779 = _837;
        _771 = _819;
        _775 = _821;
    }
    float _839 = _789;
    float _841 = _783;
    float _843 = _779;
    float _845 = _771;
    float _847 = _775;
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _851 = _839 + _849;
    float _853 = -_653;
    float _855 = _853 + 1.0;
    float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _859 = _743 + 0.5;
    float _861 = fma(_851, _851, _841);
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].y, _721);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].x, _719);
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].z, _745);
    float _869 = _861 + _843;
    float _871 = _859 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _873 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].y, _863);
    float _875 = -_733;
    float _877 = _875 + 0.5;
    float _879 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].x, _865);
    float _881 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].z, _867);
    float _883 = sqrt(_869);
    float _885 = _871 * _729;
    float _887 = _873 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _889 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _895 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _889 * _857;
    float _901 = _757 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _903 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _761 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_68.x = _885;
    out.m_68.y = _899;
    bool _909 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _911 = isnan(_883);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _917 = _913 || _915;
    out.m_70.x = _903;
    out.m_70.y = _897;
    out.m_70.z = _905;
    out.m_72.x = _901;
    out.m_72.y = _895;
    out.m_72.z = _907;
    float _919 = _859;
    if (!_917)
    {
        _919 = 1.0;
    }
    float _921 = _919;
    bool _923 = !_917;
    float _925 = _921;
    if (!_923)
    {
        bool _927 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _929 = isnan(_883);
        bool _931 = _927 || _929;
        bool _933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _935 = _931 || _933;
        if (!_935)
        {
            float _937 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _939 = _883 + _937;
            float _941 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _943 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _941;
            float _945 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _947 = _945 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _949 = 1.0 / _943;
            float _951 = _939 * _949;
            float _953 = fma(_951, _947, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _925 = _953;
            _955 = true;
        }
        else
        {
            bool _957 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _959 = isnan(_883);
            bool _961 = _957 || _959;
            bool _963 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _965 = _961 || _963;
            if (!_965)
            {
                float _967 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _969 = _883 + _967;
                float _971 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _973 = _971 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _975 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _977 = _975 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _979 = 1.0 / _973;
                float _981 = _969 * _979;
                float _983 = fma(_981, _977, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _925 = _983;
                _955 = true;
            }
            else
            {
                _925 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _955 = false;
    float _985 = _925;
    float _987 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _989 = _845 + _987;
    float _991 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _993 = _847 + _991;
    float _995 = fma(_989, _985, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _997 = fma(_993, _985, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1001 = _995 + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1005 = _997 + _1003;
    float _1007 = fma(_1001, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1009 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3647 = float2(_1007, _1009);
    float _1011 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3647, float2(0.0), isnan(_3647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3647, float2(0.0), isnan(_3647)), level(0.0)).x;
    float _1013 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1015 = _839 + _1013;
    float _1017 = -_605;
    float _1019 = _1017 + _995;
    float _1021 = -_611;
    float _1023 = _1021 + _997;
    float _1025 = fma(_1015, _985, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1027 = -_641;
    float _1029 = _1027 + _1025;
    float _1031 = _1029 * _1029;
    float _1033 = fma(_1019, _1019, _1031);
    float _1035 = fma(_1023, _1023, _1033);
    float _1037 = sqrt(_1035);
    bool _1039 = _1037 > 0.0;
    bool _1041 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_1011, 100.0, _641);
    float _1053 = fma(_1011, 100.0, _1025);
    float _1055 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1059 = _997;
    float _1061 = _1011;
    float _1063 = _995;
    if (!_1039)
    {
        _1057 = _1053;
    }
    float _1065 = _1057;
    float _1067 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1055);
    float _1069 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1071 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1067);
    float _1073 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1069);
    float _1075 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1077 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    bool _1079 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.5);
    bool _1087 = _1083 || _1085;
    float _1089 = 1.0 / _1075;
    float _1091 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1095 = _1065;
    float _1097 = _1065;
    float _1099 = _1075;
    if (!_1039)
    {
        _1093 = _995;
    }
    float _1101 = _1093;
    float _1103 = _1091 + _1075;
    bool _1105 = !_1039;
    float _1107 = _1101;
    if (!_1105)
    {
        float _1109 = _173 * _173;
        float _1111 = rsqrt(_1035);
        float _1113 = fma(_175, _175, _1109);
        float _1115 = fma(_177, _177, _1113);
        float _1117 = sqrt(_1115);
        float _1119 = _1019 * _1111;
        float _1121 = _1029 * _1111;
        float _1123 = _1023 * _1111;
        bool _1125 = _1117 > 0.0;
        float _1127 = _1111;
        _1061 = _1117;
        if (!_1125)
        {
            _1127 = _995;
        }
        float _1129 = _1127;
        _1107 = _1129;
        if (!_1125)
        {
            _1095 = _1053;
        }
        float _1131 = _1095;
        bool _1133 = !_1125;
        _1097 = _1131;
        if (!_1133)
        {
            float _1135 = rsqrt(_1115);
            float _1137 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1139 = _173 * _1135;
            float _1141 = _175 * _1135;
            float _1143 = _1121 * _1139;
            float _1145 = _177 * _1135;
            float _1147 = fma(_1119, _1141, _1143);
            float _1149 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1151 = fma(_1123, _1145, _1147);
            float _1153 = _1151 * _1149;
            float _1155 = fma(_175, _1153, _995);
            float _1157 = fma(_173, _1153, _1053);
            float _1159 = fma(_177, _1153, _997);
            _1097 = _1157;
            _1059 = _1159;
            _1107 = _1155;
            _1061 = _1153;
        }
    }
    float _1161 = _1097;
    float _1163 = _1059;
    float _1165 = _1107;
    float _1167 = _1061;
    float _1169 = _1103 * _1089;
    float _1171 = _1169 * 0.5;
    float _1173 = _1167;
    float _1175 = _1165;
    float _1177 = _1161;
    float _1179 = _1163;
    if (_1049)
    {
        _181 = 1.0;
    }
    float _1181 = _181;
    float _1183 = _1181;
    if (_1087)
    {
        _1063 = _1161;
    }
    float _1185 = _1063;
    float _1187 = _1185;
    if (_1087)
    {
        _1173 = _1163;
    }
    float _1189 = _1173;
    float _1191 = _1189;
    if (!_1087)
    {
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1195 = _1051 + _1193;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1199 = _605 + _1197;
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1203 = -_605;
        float _1205 = _1203 + _1165;
        float _1207 = _1195 * _1195;
        float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1211 = _611 + _1209;
        float _1213 = -_1051;
        float _1215 = _1213 + _1161;
        float _1217 = -_611;
        float _1219 = _1217 + _1163;
        float _1221 = fma(_1199, _1199, _1207);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1225 = fma(_1211, _1211, _1221);
        float _1227 = sqrt(_1225);
        float _1229 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = precise::min(_1227, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1233 = _1231 * _1223;
        float _1235 = _1229 * _1233;
        float _1237 = fma(_1205, _1235, _605);
        float _1239 = fma(_1215, _1235, _1051);
        float _1241 = fma(_1219, _1235, _611);
        _1187 = _1239;
        _1175 = _1237;
        _1191 = _1241;
        _1099 = _1201;
        _1177 = _1215;
        _1179 = _1219;
    }
    float _1243 = _1187;
    float _1245 = _1175;
    float _1247 = _1191;
    float _1249 = _1099;
    float _1251 = _1177;
    float _1253 = _1179;
    float _1255 = _1251;
    float _1257 = _1249;
    float _1259 = _1253;
    if (!_1049)
    {
        float _1261 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1265 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1263);
        float _1267 = _1261 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1275 = _1273 * 0.15915493667125701904296875;
        float _1277 = _1267 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1271;
        float _1283 = _1275 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1265;
        float _1291 = _1285 * _1287;
        float _1293 = _1275 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1299 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1297;
        float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1303 = _1289 * _1301;
        float _1305 = 1.0 / _1291;
        float _1307 = 1.0 / _1299;
        float _1309 = _1295 * _1305;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1313 = fma(_1309, _1303, _1311);
        float _1315 = _1313 * _1307;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        _1255 = _1275;
        _1183 = _1317;
    }
    float _1319 = _1255;
    float _1321 = _1183;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1243 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1245 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1247 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1341 = fma(_1333, _1333, _1337);
    float _1343 = rsqrt(_1341);
    float _1345 = sqrt(_1341);
    float _1347 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1349 = _1329 * _1347;
    float _1351 = _1333 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 * _1351;
    float _1357 = _1353 + _1355;
    float _1359 = sqrt(_1357);
    bool _1361 = _1359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1365 = _1359 + _1363;
    float _1367 = _1343;
    float _1369 = _1319;
    float _1371 = _1365;
    float _1373 = _1325;
    float _1375 = _1349;
    if (_1361)
    {
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1367 = _1377;
    }
    float _1379 = _1367;
    if (_1361)
    {
        float _1381 = rsqrt(_1357);
        _1369 = _1381;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1361)
    {
        float _1387 = _1365 * _1379;
        _1371 = _1387;
    }
    float _1389 = _1371;
    if (_1361)
    {
        float _1391 = _1389 * 0.15915493667125701904296875;
        _1257 = _1391;
    }
    float _1393 = _1257;
    float _1395 = _1379;
    if (_1361)
    {
        float _1397 = _1393 * 6.283185482025146484375;
        float _1399 = sin(_1397);
        _1395 = _1399;
    }
    float _1401 = _1395;
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1405 = precise::max(0.0, _1403);
    float _1407 = _1333;
    float _1409 = _1405;
    if (_1361)
    {
        float _1411 = _1393 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        _1407 = _1413;
    }
    float _1415 = _1407;
    float _1417 = -_1347;
    float _1419 = -_1405;
    float _1421 = fma(_1325, _1417, _1419);
    if (!_1361)
    {
        _1373 = _1351;
    }
    float _1423 = _1373;
    float _1425 = _1423;
    if (_1361)
    {
        float _1427 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1427;
    }
    float _1429 = _1409;
    float _1431 = _1401;
    float _1433 = _1429;
    if (_1361)
    {
        float _1435 = fma(_1401, _1429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1259 = _1435;
    }
    float _1437 = _1259;
    float _1439 = _1437;
    if (!_1361)
    {
        _1431 = _1421;
    }
    float _1441 = _1431;
    float _1443 = _1441;
    float _1445 = _1415;
    if (_1361)
    {
        float _1447 = _1415 + (-1.0);
        _1433 = _1447;
    }
    float _1449 = _1433;
    float _1451 = _1449;
    if (_1361)
    {
        float _1453 = _1383 * _1437;
        _1439 = _1453;
    }
    float _1455 = _1439;
    if (_1361)
    {
        float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1457;
    }
    float _1459 = _1385;
    if (_1361)
    {
        float _1461 = _1349 * _1455;
        _1375 = _1461;
    }
    float _1463 = _1375;
    if (!_1361)
    {
        _1451 = _1353;
    }
    float _1465 = _1451;
    float _1467 = _1465;
    if (_1361)
    {
        float _1469 = _1351 * _1455;
        _1425 = _1469;
    }
    float _1471 = _1425;
    if (_1361)
    {
        float _1473 = fma(_1421, _1415, _1459);
        _1443 = _1473;
    }
    float _1475 = _1443;
    if (_1361)
    {
        float _1477 = _1463 * _1463;
        _1467 = _1477;
    }
    float _1479 = _1467;
    if (!_1361)
    {
        _1445 = _1355;
    }
    float _1481 = _1445;
    float _1483 = _1481;
    if (_1361)
    {
        float _1485 = _1471 * _1471;
        _1483 = _1485;
    }
    float _1487 = _1483;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1491 = fma(_1345, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = fma(_1475, _1475, _1479);
    float _1497 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1499 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = -_1493;
    float _1503 = _1501 + 1.0;
    float _1505 = _1495 + _1487;
    float _1507 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1497);
    float _1509 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1511 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = rsqrt(_1505);
    float _1515 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1517 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1509);
    float _1519 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1521 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1523 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1525 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1519);
    float _1527 = abs(_1503);
    float _1529 = log2(_1527);
    float _1531 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1517);
    float _1533 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1535 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1521);
    float _1537 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1539 = -_1533;
    float _1541 = fma(_1539, _1339, 1.0);
    float _1543 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1545 = _1513 * _1463;
    float _1547 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = _1513 * _1475;
    float _1551 = _1513 * _1471;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1557 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1559 = log2(_1541);
    float _1561 = -_1553;
    float _1563 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1561);
    float _1565 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1555);
    float _1567 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1569 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1571 = -_1551;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1563);
    float _1575 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1577 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1579 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1569);
    float _1581 = fma(_1573, -0.5, 0.5);
    float _1583 = exp2(_1567);
    float _1585 = fma(_1573, 0.5, 0.5);
    float _1587 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1577);
    float _1589 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1591 = _1549 + 1.0;
    float _1593 = fma(_1585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1595 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1587);
    float _1597 = _1559 * 0.693147182464599609375;
    float _1599 = 1.0 / _1575;
    float _1601 = fma(_1585, _1593, -0.212114393711090087890625);
    float _1603 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1595);
    float _1605 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1607 = fma(_1585, _1601, 1.570728778839111328125);
    float _1609 = sqrt(_1581);
    float _1611 = -_1549;
    float _1613 = fma(_1583, _1591, _1611);
    float _1615 = fma(_1613, 0.5, 0.5);
    float _1617 = _1603 * _1599;
    float _1619 = _1605 * _1599;
    float _1621 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1623 = fma(_1617, 0.5, 0.5);
    float _1625 = fma(_1619, -0.5, 0.5);
    float _1627 = _1609 * 0.636619746685028076171875;
    float3 _4626 = float3(_1623, _1625, _1621);
    float _1629 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4626, float3(0.0), isnan(_4626)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4626, float3(0.0), isnan(_4626)), level(0.0)).x;
    float3 _4637 = float3(_1623, _1625, _1621);
    float4 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4637, float3(0.0), isnan(_4637)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4637, float3(0.0), isnan(_4637)), level(0.0)).xyzw;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1632.w;
    float _1642 = -_1607;
    float _1644 = fma(_1627, _1642, 1.0);
    float2 _4658 = float2(_1644, _1615);
    float3 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4658, float2(0.0), isnan(_4658)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4658, float2(0.0), isnan(_4658)), level(0.0)).xyz;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1658 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1660 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1662 = isnan(_1345);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1668 = _1664 || _1666;
    float _1670 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    float _1672 = exp2(_1656);
    float _1674 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1670);
    float _1676 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    float _1678 = _1676 + _1575;
    out.gl_Position.x = _1603;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _1676;
    out.gl_Position.w = _1575;
    float _1680 = _1678 * 0.5;
    float _1682 = -_1672;
    float _1684 = _1682 + 1.0;
    float _1686 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.z = _1680;
    out.m_74.w = _1575;
    float _1688 = _1575;
    float _1690 = _1676;
    float _1692 = _1605;
    float _1694 = _1680;
    float _1696 = _1603;
    if (!_1668)
    {
        _1688 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1698 = _1688;
    float _1700 = _1698;
    float _1702 = _1698;
    if (!_1668)
    {
        _1690 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1704 = _1690;
    float _1706 = _1704;
    float _1708 = _1704;
    if (!_1668)
    {
        _1692 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1710 = _1692;
    float _1712 = _1710;
    float _1714 = _1710;
    if (!_1668)
    {
        _1694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1716 = _1694;
    float _1718 = _1716;
    float _1720 = _1716;
    if (!_1668)
    {
        _1696 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1722 = _1696;
    float _1724 = _1686 * _1629;
    float _1726 = -_1686;
    float _1728 = _1726 + 1.0;
    float _1730 = _1640 * _1724;
    float _1732 = _1640 * _1728;
    float _1734 = _1654 * _1724;
    float _1736 = fma(_1650, _1730, _1634);
    float _1738 = fma(_1652, _1730, _1636);
    float _1740 = _1730;
    float _1742 = _1722;
    float _1744 = _1722;
    if (!_1668)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1746 = _1740;
    float _1748 = fma(_1640, _1734, _1638);
    float _1750 = _1321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_76.x = _1736;
    out.m_76.y = _1738;
    out.m_76.z = _1748;
    out.m_76.w = _1732;
    bool _1752 = !_1668;
    float _1754 = _1746;
    float _1756 = _1746;
    if (!_1752)
    {
        bool _1758 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1760 = isnan(_1345);
        bool _1762 = _1758 || _1760;
        bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1766 = _1762 || _1764;
        if (!_1766)
        {
            float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1770 = _1345 + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1774 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1772;
            float _1776 = 1.0 / _1774;
            float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1780 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1784 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1788 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1792 = _1790 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1798 = _1770 * _1776;
            float _1800 = precise::clamp(_1798, 0.0, 1.0);
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1806 = fma(_1800, _1780, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1808 = fma(_1800, _1804, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1810 = fma(_1800, _1784, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1812 = fma(_1800, _1788, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1814 = fma(_1800, _1792, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1816 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1720 = _1808;
            _1714 = _1814;
            _1756 = _1806;
            _1708 = _1812;
            _1702 = _1810;
            _1744 = _1816;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1822 = isnan(_1345);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                _1754 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1830 = _1754;
            _1756 = _1830;
            if (!_1828)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1832 = _1718;
            _1720 = _1832;
            if (!_1828)
            {
                _1700 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1834 = _1700;
            _1702 = _1834;
            if (!_1828)
            {
                _1706 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1836 = _1706;
            _1708 = _1836;
            if (!_1828)
            {
                _1712 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1838 = _1712;
            _1714 = _1838;
            if (!_1828)
            {
                _1742 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1840 = _1742;
            bool _1842 = !_1828;
            _1744 = _1840;
            if (!_1842)
            {
                bool _1844 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1846 = isnan(_1345);
                bool _1848 = _1844 || _1846;
                bool _1850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1852 = _1848 || _1850;
                if (!_1852)
                {
                    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1856 = _1345 + _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1860 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1858;
                    float _1862 = 1.0 / _1860;
                    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1882 = _1880 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1884 = _1856 * _1862;
                    float _1886 = precise::clamp(_1884, 0.0, 1.0);
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1892 = fma(_1886, _1866, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1894 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1896 = fma(_1886, _1870, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1898 = fma(_1886, _1874, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1900 = fma(_1886, _1878, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1902 = fma(_1886, _1882, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1720 = _1894;
                    _1714 = _1900;
                    _1756 = _1892;
                    _1708 = _1898;
                    _1702 = _1896;
                    _1744 = _1902;
                    _1818 = true;
                }
                else
                {
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1714 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1756 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1708 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1702 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1744 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1818 = false;
    float _1904 = _1720;
    float _1906 = _1714;
    float _1908 = _1756;
    float _1910 = _1708;
    float _1912 = _1702;
    float _1914 = _1744;
    float _1916 = fma(_895, -0.5, 0.5);
    float _1918 = precise::clamp(_1916, 0.0, 1.0);
    float _1920 = -_1904;
    float _1922 = _1920 + _1906;
    float _1924 = -_1908;
    float _1926 = _1924 + _1910;
    out.m_78.x = 0.0;
    float _1928 = -_1912;
    float _1930 = _1928 + _1914;
    float _1932 = fma(_1918, _1922, _1904);
    float _1934 = fma(_1918, _1926, _1908);
    bool _1936 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1938 = _1932 * 0.586610972881317138671875;
    float _1940 = fma(_1918, _1930, _1912);
    float _1942 = _1750 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1944 = fma(_1934, 0.298911988735198974609375, _1938);
    bool _1946 = _1321 > 0.0;
    bool _1948 = isnan(_1321);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    float _1956 = fma(_1940, 0.114477999508380889892578125, _1944);
    out.m_51.x = _1942;
    float _1958 = -_1956;
    float _1960 = _1934 + _1958;
    float _1962 = -_1956;
    float _1964 = _1932 + _1962;
    float _1966 = -_1956;
    float _1968 = _1940 + _1966;
    float _1970 = fma(_1960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    float _1972 = fma(_1964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    float _1974 = fma(_1968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    bool _1976 = !_1936;
    if (!_1976)
    {
        float _1978 = -_1243;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1982 = -_1245;
        float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1986 = -_1247;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1990 = _1980 * _1980;
        float _1992 = fma(_1984, _1984, _1990);
        float _1994 = fma(_1988, _1988, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = rsqrt(_1994);
        float _2000 = -_1996;
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2006 = precise::clamp(_2004, 0.0, 1.0);
        float _2008 = _1984 * _1998;
        float _2010 = _1980 * _1998;
        float _2012 = abs(_2006);
        float _2014 = log2(_2012);
        float _2016 = _1988 * _1998;
        float _2018 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2020 = _895 * _2010;
        float _2022 = -_2010;
        float _2024 = -_2018;
        float _2026 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2024);
        float _2028 = fma(_901, _2008, _2020);
        float _2030 = -_2016;
        float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2026);
        float _2034 = fma(_907, _2016, _2028);
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2040 = _2032 + _2038;
        float _2042 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2046 = precise::clamp(_2044, 0.0, 1.0);
        float _2048 = exp2(_2042);
        float _2050 = _2048 * _2046;
        float _2052 = _2036 * _2050;
        float _2054 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2054;
        out.m_78.y = _2056;
        out.m_78.z = _2058;
    }
    out.m_80.x = _1970;
    out.m_80.y = _1972;
    out.m_80.z = _1974;
    if (_1954)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2060;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    bool _955 = false;
    bool _531 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_48.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    if (!_103)
    {
        out.m_51.x = 0.0;
    }
    int _109 = 0;
    if (!_103)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2116 = as_type<float>(_113);
        out.gl_Position.z = _2116;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_53.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    if (_127)
    {
        float _135 = float(_99);
        _133 = _135;
    }
    float _137 = _133;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_51.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2185 = as_type<float>(_151);
        out.gl_Position.z = _2185;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_55.x;
    float _155 = in.m_55.y;
    float _157 = in.m_55.z;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _167 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _171);
    bool _179 = !_159;
    float _181 = _175;
    float _199;
    if (!_179)
    {
        float _183 = in.m_57.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_99);
        float _205 = 1.0 / _203;
        float _207 = _131 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _209 + _243;
    float _247 = 1.0 / _233;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _241;
    float _253 = 1.0 / _237;
    float _255 = _213 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = -_229;
    float _271 = _269 + 1.0;
    float _273 = _267 * _271;
    float _275 = _217 * _251;
    bool _277 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _279 = isnan(_209);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_267;
    float _291 = _289 + 1.0;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _245 * _253;
    bool _299 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_209);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = _287 * _291;
    float _317 = -_287;
    float _319 = _317 + 1.0;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _329 = fma(_313, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = _309 * _319;
    float _333 = fma(_323, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = fma(_295, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _337 = fma(_327, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_309;
    float _341 = _339 + 1.0;
    float _343 = _329 * _331;
    float _345 = _333 * _331;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _275, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _275, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_335, _315, _355);
    float _365 = fma(_337, _315, _357);
    float _367 = fma(_359, _273, _363);
    float _369 = fma(_361, _273, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_57.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_99);
        float _399 = 1.0 / _397;
        float _401 = _131 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = _403 + _405;
    bool _409 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _411 = isnan(_403);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _421;
    bool _425 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _427 = isnan(_403);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -_419;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _441;
    float _445 = 1.0 / _423;
    bool _447 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _449 = _435 * _439;
    float _451 = -_435;
    float _453 = _451 + 1.0;
    float _455 = _407 * _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _457;
    float _461 = fma(_443, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _463;
    float _467 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _469 = fma(_465, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _471 = _461 * _449;
    float _473 = _467 * _449;
    float _475 = _469 * _449;
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].x, _471);
    float _479 = in.m_59.x;
    float _481 = in.m_59.y;
    float _483 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].y, _475);
    float _485 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[107].z, _473);
    float _487 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].x, _477);
    float _489 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].y, _483);
    float _491 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[108].z, _485);
    float _493 = _487 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _497 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _503 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _505 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _501;
    out.m_61.y = _503;
    out.m_61.z = _505;
    out.m_61.w = _499;
    float _507 = _373 * _481;
    float _509 = _371 * _479;
    bool _511 = !_447;
    float _529;
    if (!_511)
    {
        float _513 = in.m_57.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_99);
        float _535 = 1.0 / _533;
        float _537 = _131 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = as_type<float>(int(gl_VertexIndex));
    float _543 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _545 = in.m_57.x;
    float _547 = in.m_57.y;
    float _549 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _551 = in.m_48.x;
    float _553 = in.m_48.y;
    float _555 = in.m_48.z;
    int _557 = as_type<int>(_541) & 1;
    bool _559 = _557 != 0;
    int _561 = as_type<int>(_541) & 2;
    bool _563 = _561 != 0;
    bool _565 = _545 > 0.5;
    bool _567 = !_563;
    float _569 = _567 ? (-0.5) : 0.5;
    float _571 = in.m_66.y;
    bool _573 = _547 > 0.5;
    float _575 = _553 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _577 = _553 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _569);
    bool _581 = !_559;
    float _583 = _581 ? (-0.5) : 0.5;
    float _585 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _587 = fma(_551, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _589 = _543 * _579;
    float _591 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _583);
    float _595 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[4].z, _585);
    float _597 = fma(_555, (*spvDescriptorSet0.vp_c10)._m0[6].z, _587);
    float _599 = _589 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _601 = _591 * _593;
    float _603 = _589 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].x, _599);
    float _609 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = _597 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _613;
    float _617 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[24].z, _607);
    float _619 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _623 = _621 != 0;
    float _625 = 1.0 / _615;
    float _627 = _617 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _629 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _633 = _631 != 0;
    float _635 = _589 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _637 = _605 + _627;
    float _639 = _611 + _629;
    float _641 = _553 + _571;
    bool _643 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _645 = isnan(_539);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _657 = _637 + _655;
    float _659 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _661 = _639 + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _665 = _539 + _663;
    float _667 = _657 * _657;
    float _669 = _661 * _661;
    float _671 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].x, _635);
    float _673 = _665 * _625;
    bool _675 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _677 = isnan(_539);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _667 + _669;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _689;
    float _693 = sqrt(_687);
    float _695 = -_685;
    float _697 = _695 + 1.0;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _699;
    float _703 = fma(_691, _673, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _705;
    float _709 = _653 * _697;
    float _711 = fma(_701, _673, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _713 = -_569;
    int _715 = _573 ? as_type<int>(_713) : as_type<int>(_569);
    float _717 = fma(_707, _673, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _719 = _703 * _709;
    float _721 = _711 * _709;
    float _723 = fma(_549, (*spvDescriptorSet0.vp_c8)._m0[25].z, _671);
    float _725 = -_583;
    int _727 = _565 ? as_type<int>(_725) : as_type<int>(_583);
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _731 = !_633;
    float _733 = _731 ? _569 : as_type<float>(_715);
    float _735 = _569 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _737 = _693 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _739 = _723 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _741 = !_623;
    float _743 = _741 ? _583 : as_type<float>(_727);
    float _745 = _717 * _709;
    float _747 = _583 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _749 = _735 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _751 = _735 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _735 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _755 = _641 + _739;
    float _757 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].x, _749);
    float _759 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _761 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].x, _753);
    float _763 = _751;
    float _765 = _739;
    float _767 = _753;
    float _769 = _639;
    float _771 = _637;
    if (!_737)
    {
        _763 = _639;
    }
    float _773 = _763;
    float _775 = _773;
    if (!_737)
    {
        _765 = _669;
    }
    float _777 = _765;
    float _779 = _777;
    if (!_737)
    {
        _767 = _667;
    }
    float _781 = _767;
    float _783 = _781;
    if (!_737)
    {
        _769 = _755;
    }
    float _785 = _769;
    bool _787 = !_737;
    float _789 = _785;
    if (!_787)
    {
        float _791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _795 = _693 + _793;
        float _797 = rsqrt(_687);
        float _799 = _795 * _791;
        float _801 = _755 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _803 = _799 * 0.15915493667125701904296875;
        float _805 = _803 * 6.283185482025146484375;
        float _807 = sin(_805);
        float _809 = _803 * 6.283185482025146484375;
        float _811 = cos(_809);
        float _813 = fma(_807, _801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _815 = _797 * _813;
        float _817 = _811 + (-1.0);
        float _819 = fma(_657, _815, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _821 = fma(_661, _815, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _823 = _817 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _827 = _819 + _825;
        float _829 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _831 = _821 + _829;
        float _833 = fma(_755, _811, _823);
        float _835 = _827 * _827;
        float _837 = _831 * _831;
        _789 = _833;
        _783 = _835;
        _779 = _837;
        _771 = _819;
        _775 = _821;
    }
    float _839 = _789;
    float _841 = _783;
    float _843 = _779;
    float _845 = _771;
    float _847 = _775;
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _851 = _839 + _849;
    float _853 = -_653;
    float _855 = _853 + 1.0;
    float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _859 = _743 + 0.5;
    float _861 = fma(_851, _851, _841);
    float _863 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].y, _721);
    float _865 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].x, _719);
    float _867 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[123].z, _745);
    float _869 = _861 + _843;
    float _871 = _859 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _873 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].y, _863);
    float _875 = -_733;
    float _877 = _875 + 0.5;
    float _879 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].x, _865);
    float _881 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[124].z, _867);
    float _883 = sqrt(_869);
    float _885 = _871 * _729;
    float _887 = _873 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _889 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _891 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _893 = _881 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _895 = _759 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _897 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _889 * _857;
    float _901 = _757 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _903 = _891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _905 = _893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _761 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    out.m_68.x = _885;
    out.m_68.y = _899;
    bool _909 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _911 = isnan(_883);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _917 = _913 || _915;
    out.m_70.x = _903;
    out.m_70.y = _897;
    out.m_70.z = _905;
    out.m_72.x = _901;
    out.m_72.y = _895;
    out.m_72.z = _907;
    float _919 = _859;
    if (!_917)
    {
        _919 = 1.0;
    }
    float _921 = _919;
    bool _923 = !_917;
    float _925 = _921;
    if (!_923)
    {
        bool _927 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _929 = isnan(_883);
        bool _931 = _927 || _929;
        bool _933 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _935 = _931 || _933;
        if (!_935)
        {
            float _937 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _939 = _883 + _937;
            float _941 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _943 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _941;
            float _945 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _947 = _945 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _949 = 1.0 / _943;
            float _951 = _939 * _949;
            float _953 = fma(_951, _947, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _925 = _953;
            _955 = true;
        }
        else
        {
            bool _957 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _959 = isnan(_883);
            bool _961 = _957 || _959;
            bool _963 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _965 = _961 || _963;
            if (!_965)
            {
                float _967 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _969 = _883 + _967;
                float _971 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _973 = _971 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _975 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _977 = _975 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _979 = 1.0 / _973;
                float _981 = _969 * _979;
                float _983 = fma(_981, _977, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _925 = _983;
                _955 = true;
            }
            else
            {
                _925 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _955 = false;
    float _985 = _925;
    float _987 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _989 = _845 + _987;
    float _991 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _993 = _847 + _991;
    float _995 = fma(_989, _985, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _997 = fma(_993, _985, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1001 = _995 + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1005 = _997 + _1003;
    float _1007 = fma(_1001, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1009 = fma(_1005, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3647 = float2(_1007, _1009);
    float _1011 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3647, float2(0.0), isnan(_3647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3647, float2(0.0), isnan(_3647)), level(0.0)).x;
    float _1013 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1015 = _839 + _1013;
    float _1017 = -_605;
    float _1019 = _1017 + _995;
    float _1021 = -_611;
    float _1023 = _1021 + _997;
    float _1025 = fma(_1015, _985, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1027 = -_641;
    float _1029 = _1027 + _1025;
    float _1031 = _1029 * _1029;
    float _1033 = fma(_1019, _1019, _1031);
    float _1035 = fma(_1023, _1023, _1033);
    float _1037 = sqrt(_1035);
    bool _1039 = _1037 > 0.0;
    bool _1041 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.5);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_1011, 100.0, _641);
    float _1053 = fma(_1011, 100.0, _1025);
    float _1055 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1057 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1059 = _997;
    float _1061 = _1011;
    float _1063 = _995;
    if (!_1039)
    {
        _1057 = _1053;
    }
    float _1065 = _1057;
    float _1067 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1055);
    float _1069 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1071 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1067);
    float _1073 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1069);
    float _1075 = _1071 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1077 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    bool _1079 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1081 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.5);
    bool _1087 = _1083 || _1085;
    float _1089 = 1.0 / _1075;
    float _1091 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1093 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1095 = _1065;
    float _1097 = _1065;
    float _1099 = _1075;
    if (!_1039)
    {
        _1093 = _995;
    }
    float _1101 = _1093;
    float _1103 = _1091 + _1075;
    bool _1105 = !_1039;
    float _1107 = _1101;
    if (!_1105)
    {
        float _1109 = _173 * _173;
        float _1111 = rsqrt(_1035);
        float _1113 = fma(_175, _175, _1109);
        float _1115 = fma(_177, _177, _1113);
        float _1117 = sqrt(_1115);
        float _1119 = _1019 * _1111;
        float _1121 = _1029 * _1111;
        float _1123 = _1023 * _1111;
        bool _1125 = _1117 > 0.0;
        float _1127 = _1111;
        _1061 = _1117;
        if (!_1125)
        {
            _1127 = _995;
        }
        float _1129 = _1127;
        _1107 = _1129;
        if (!_1125)
        {
            _1095 = _1053;
        }
        float _1131 = _1095;
        bool _1133 = !_1125;
        _1097 = _1131;
        if (!_1133)
        {
            float _1135 = rsqrt(_1115);
            float _1137 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1139 = _173 * _1135;
            float _1141 = _175 * _1135;
            float _1143 = _1121 * _1139;
            float _1145 = _177 * _1135;
            float _1147 = fma(_1119, _1141, _1143);
            float _1149 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1151 = fma(_1123, _1145, _1147);
            float _1153 = _1151 * _1149;
            float _1155 = fma(_175, _1153, _995);
            float _1157 = fma(_173, _1153, _1053);
            float _1159 = fma(_177, _1153, _997);
            _1097 = _1157;
            _1059 = _1159;
            _1107 = _1155;
            _1061 = _1153;
        }
    }
    float _1161 = _1097;
    float _1163 = _1059;
    float _1165 = _1107;
    float _1167 = _1061;
    float _1169 = _1103 * _1089;
    float _1171 = _1169 * 0.5;
    float _1173 = _1167;
    float _1175 = _1165;
    float _1177 = _1161;
    float _1179 = _1163;
    if (_1049)
    {
        _181 = 1.0;
    }
    float _1181 = _181;
    float _1183 = _1181;
    if (_1087)
    {
        _1063 = _1161;
    }
    float _1185 = _1063;
    float _1187 = _1185;
    if (_1087)
    {
        _1173 = _1163;
    }
    float _1189 = _1173;
    float _1191 = _1189;
    if (!_1087)
    {
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1195 = _1051 + _1193;
        float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1199 = _605 + _1197;
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1203 = -_605;
        float _1205 = _1203 + _1165;
        float _1207 = _1195 * _1195;
        float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1211 = _611 + _1209;
        float _1213 = -_1051;
        float _1215 = _1213 + _1161;
        float _1217 = -_611;
        float _1219 = _1217 + _1163;
        float _1221 = fma(_1199, _1199, _1207);
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1225 = fma(_1211, _1211, _1221);
        float _1227 = sqrt(_1225);
        float _1229 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1231 = precise::min(_1227, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1233 = _1231 * _1223;
        float _1235 = _1229 * _1233;
        float _1237 = fma(_1205, _1235, _605);
        float _1239 = fma(_1215, _1235, _1051);
        float _1241 = fma(_1219, _1235, _611);
        _1187 = _1239;
        _1175 = _1237;
        _1191 = _1241;
        _1099 = _1201;
        _1177 = _1215;
        _1179 = _1219;
    }
    float _1243 = _1187;
    float _1245 = _1175;
    float _1247 = _1191;
    float _1249 = _1099;
    float _1251 = _1177;
    float _1253 = _1179;
    float _1255 = _1251;
    float _1257 = _1249;
    float _1259 = _1253;
    if (!_1049)
    {
        float _1261 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1265 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1263);
        float _1267 = _1261 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1275 = _1273 * 0.15915493667125701904296875;
        float _1277 = _1267 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1271;
        float _1283 = _1275 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = 1.0 / _1265;
        float _1291 = _1285 * _1287;
        float _1293 = _1275 * 6.283185482025146484375;
        float _1295 = sin(_1293);
        float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1299 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1297;
        float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1303 = _1289 * _1301;
        float _1305 = 1.0 / _1291;
        float _1307 = 1.0 / _1299;
        float _1309 = _1295 * _1305;
        float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1313 = fma(_1309, _1303, _1311);
        float _1315 = _1313 * _1307;
        float _1317 = precise::clamp(_1315, 0.0, 1.0);
        _1255 = _1275;
        _1183 = _1317;
    }
    float _1319 = _1255;
    float _1321 = _1183;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1325 = _1243 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1329 = _1245 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1333 = _1247 + _1331;
    float _1335 = _1325 * _1325;
    float _1337 = fma(_1329, _1329, _1335);
    float _1339 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1341 = fma(_1333, _1333, _1337);
    float _1343 = rsqrt(_1341);
    float _1345 = sqrt(_1341);
    float _1347 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1349 = _1329 * _1347;
    float _1351 = _1333 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 * _1351;
    float _1357 = _1353 + _1355;
    float _1359 = sqrt(_1357);
    bool _1361 = _1359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1365 = _1359 + _1363;
    float _1367 = _1343;
    float _1369 = _1319;
    float _1371 = _1365;
    float _1373 = _1325;
    float _1375 = _1349;
    if (_1361)
    {
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1367 = _1377;
    }
    float _1379 = _1367;
    if (_1361)
    {
        float _1381 = rsqrt(_1357);
        _1369 = _1381;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1361)
    {
        float _1387 = _1365 * _1379;
        _1371 = _1387;
    }
    float _1389 = _1371;
    if (_1361)
    {
        float _1391 = _1389 * 0.15915493667125701904296875;
        _1257 = _1391;
    }
    float _1393 = _1257;
    float _1395 = _1379;
    if (_1361)
    {
        float _1397 = _1393 * 6.283185482025146484375;
        float _1399 = sin(_1397);
        _1395 = _1399;
    }
    float _1401 = _1395;
    float _1403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1405 = precise::max(0.0, _1403);
    float _1407 = _1333;
    float _1409 = _1405;
    if (_1361)
    {
        float _1411 = _1393 * 6.283185482025146484375;
        float _1413 = cos(_1411);
        _1407 = _1413;
    }
    float _1415 = _1407;
    float _1417 = -_1347;
    float _1419 = -_1405;
    float _1421 = fma(_1325, _1417, _1419);
    if (!_1361)
    {
        _1373 = _1351;
    }
    float _1423 = _1373;
    float _1425 = _1423;
    if (_1361)
    {
        float _1427 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1427;
    }
    float _1429 = _1409;
    float _1431 = _1401;
    float _1433 = _1429;
    if (_1361)
    {
        float _1435 = fma(_1401, _1429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1259 = _1435;
    }
    float _1437 = _1259;
    float _1439 = _1437;
    if (!_1361)
    {
        _1431 = _1421;
    }
    float _1441 = _1431;
    float _1443 = _1441;
    float _1445 = _1415;
    if (_1361)
    {
        float _1447 = _1415 + (-1.0);
        _1433 = _1447;
    }
    float _1449 = _1433;
    float _1451 = _1449;
    if (_1361)
    {
        float _1453 = _1383 * _1437;
        _1439 = _1453;
    }
    float _1455 = _1439;
    if (_1361)
    {
        float _1457 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1385 = _1457;
    }
    float _1459 = _1385;
    if (_1361)
    {
        float _1461 = _1349 * _1455;
        _1375 = _1461;
    }
    float _1463 = _1375;
    if (!_1361)
    {
        _1451 = _1353;
    }
    float _1465 = _1451;
    float _1467 = _1465;
    if (_1361)
    {
        float _1469 = _1351 * _1455;
        _1425 = _1469;
    }
    float _1471 = _1425;
    if (_1361)
    {
        float _1473 = fma(_1421, _1415, _1459);
        _1443 = _1473;
    }
    float _1475 = _1443;
    if (_1361)
    {
        float _1477 = _1463 * _1463;
        _1467 = _1477;
    }
    float _1479 = _1467;
    if (!_1361)
    {
        _1445 = _1355;
    }
    float _1481 = _1445;
    float _1483 = _1481;
    if (_1361)
    {
        float _1485 = _1471 * _1471;
        _1483 = _1485;
    }
    float _1487 = _1483;
    float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1491 = fma(_1345, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = fma(_1475, _1475, _1479);
    float _1497 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1499 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = -_1493;
    float _1503 = _1501 + 1.0;
    float _1505 = _1495 + _1487;
    float _1507 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1497);
    float _1509 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1511 = _1243 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1513 = rsqrt(_1505);
    float _1515 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1507);
    float _1517 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1509);
    float _1519 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1511);
    float _1521 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1523 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1525 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1519);
    float _1527 = abs(_1503);
    float _1529 = log2(_1527);
    float _1531 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1517);
    float _1533 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1535 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1521);
    float _1537 = _1531 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1539 = -_1533;
    float _1541 = fma(_1539, _1339, 1.0);
    float _1543 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1545 = _1513 * _1463;
    float _1547 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1549 = _1513 * _1475;
    float _1551 = _1513 * _1471;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1547);
    float _1557 = _1535 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1559 = log2(_1541);
    float _1561 = -_1553;
    float _1563 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1561);
    float _1565 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1555);
    float _1567 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1569 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1571 = -_1551;
    float _1573 = fma(_1571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1563);
    float _1575 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1565);
    float _1577 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1579 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1569);
    float _1581 = fma(_1573, -0.5, 0.5);
    float _1583 = exp2(_1567);
    float _1585 = fma(_1573, 0.5, 0.5);
    float _1587 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1577);
    float _1589 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1579);
    float _1591 = _1549 + 1.0;
    float _1593 = fma(_1585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1595 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1587);
    float _1597 = _1559 * 0.693147182464599609375;
    float _1599 = 1.0 / _1575;
    float _1601 = fma(_1585, _1593, -0.212114393711090087890625);
    float _1603 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1595);
    float _1605 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1589);
    float _1607 = fma(_1585, _1601, 1.570728778839111328125);
    float _1609 = sqrt(_1581);
    float _1611 = -_1549;
    float _1613 = fma(_1583, _1591, _1611);
    float _1615 = fma(_1613, 0.5, 0.5);
    float _1617 = _1603 * _1599;
    float _1619 = _1605 * _1599;
    float _1621 = _1597 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1623 = fma(_1617, 0.5, 0.5);
    float _1625 = fma(_1619, -0.5, 0.5);
    float _1627 = _1609 * 0.636619746685028076171875;
    float3 _4626 = float3(_1623, _1625, _1621);
    float _1629 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4626, float3(0.0), isnan(_4626)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4626, float3(0.0), isnan(_4626)), level(0.0)).x;
    float3 _4637 = float3(_1623, _1625, _1621);
    float4 _1632 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4637, float3(0.0), isnan(_4637)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4637, float3(0.0), isnan(_4637)), level(0.0)).xyzw;
    float _1634 = _1632.x;
    float _1636 = _1632.y;
    float _1638 = _1632.z;
    float _1640 = _1632.w;
    float _1642 = -_1607;
    float _1644 = fma(_1627, _1642, 1.0);
    float2 _4658 = float2(_1644, _1615);
    float3 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4658, float2(0.0), isnan(_4658)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4658, float2(0.0), isnan(_4658)), level(0.0)).xyz;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = _1529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1658 = _1537 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1660 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1662 = isnan(_1345);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1668 = _1664 || _1666;
    float _1670 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1658);
    float _1672 = exp2(_1656);
    float _1674 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1670);
    float _1676 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1674);
    float _1678 = _1676 + _1575;
    out.gl_Position.x = _1603;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _1676;
    out.gl_Position.w = _1575;
    float _1680 = _1678 * 0.5;
    float _1682 = -_1672;
    float _1684 = _1682 + 1.0;
    float _1686 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.z = _1680;
    out.m_74.w = _1575;
    float _1688 = _1575;
    float _1690 = _1676;
    float _1692 = _1605;
    float _1694 = _1680;
    float _1696 = _1603;
    if (!_1668)
    {
        _1688 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1698 = _1688;
    float _1700 = _1698;
    float _1702 = _1698;
    if (!_1668)
    {
        _1690 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1704 = _1690;
    float _1706 = _1704;
    float _1708 = _1704;
    if (!_1668)
    {
        _1692 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1710 = _1692;
    float _1712 = _1710;
    float _1714 = _1710;
    if (!_1668)
    {
        _1694 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1716 = _1694;
    float _1718 = _1716;
    float _1720 = _1716;
    if (!_1668)
    {
        _1696 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1722 = _1696;
    float _1724 = _1686 * _1629;
    float _1726 = -_1686;
    float _1728 = _1726 + 1.0;
    float _1730 = _1640 * _1724;
    float _1732 = _1640 * _1728;
    float _1734 = _1654 * _1724;
    float _1736 = fma(_1650, _1730, _1634);
    float _1738 = fma(_1652, _1730, _1636);
    float _1740 = _1730;
    float _1742 = _1722;
    float _1744 = _1722;
    if (!_1668)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1746 = _1740;
    float _1748 = fma(_1640, _1734, _1638);
    float _1750 = _1321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_76.x = _1736;
    out.m_76.y = _1738;
    out.m_76.z = _1748;
    out.m_76.w = _1732;
    bool _1752 = !_1668;
    float _1754 = _1746;
    float _1756 = _1746;
    if (!_1752)
    {
        bool _1758 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1760 = isnan(_1345);
        bool _1762 = _1758 || _1760;
        bool _1764 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1766 = _1762 || _1764;
        if (!_1766)
        {
            float _1768 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1770 = _1345 + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1774 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1772;
            float _1776 = 1.0 / _1774;
            float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1780 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1784 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1788 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1792 = _1790 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1796 = _1794 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1798 = _1770 * _1776;
            float _1800 = precise::clamp(_1798, 0.0, 1.0);
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1806 = fma(_1800, _1780, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1808 = fma(_1800, _1804, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1810 = fma(_1800, _1784, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1812 = fma(_1800, _1788, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1814 = fma(_1800, _1792, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1816 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1720 = _1808;
            _1714 = _1814;
            _1756 = _1806;
            _1708 = _1812;
            _1702 = _1810;
            _1744 = _1816;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1822 = isnan(_1345);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                _1754 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1830 = _1754;
            _1756 = _1830;
            if (!_1828)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1832 = _1718;
            _1720 = _1832;
            if (!_1828)
            {
                _1700 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1834 = _1700;
            _1702 = _1834;
            if (!_1828)
            {
                _1706 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1836 = _1706;
            _1708 = _1836;
            if (!_1828)
            {
                _1712 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1838 = _1712;
            _1714 = _1838;
            if (!_1828)
            {
                _1742 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1840 = _1742;
            bool _1842 = !_1828;
            _1744 = _1840;
            if (!_1842)
            {
                bool _1844 = _1345 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1846 = isnan(_1345);
                bool _1848 = _1844 || _1846;
                bool _1850 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1852 = _1848 || _1850;
                if (!_1852)
                {
                    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1856 = _1345 + _1854;
                    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1860 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1858;
                    float _1862 = 1.0 / _1860;
                    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1878 = _1876 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1882 = _1880 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1884 = _1856 * _1862;
                    float _1886 = precise::clamp(_1884, 0.0, 1.0);
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1892 = fma(_1886, _1866, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1894 = fma(_1886, _1890, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1896 = fma(_1886, _1870, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1898 = fma(_1886, _1874, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1900 = fma(_1886, _1878, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1902 = fma(_1886, _1882, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1720 = _1894;
                    _1714 = _1900;
                    _1756 = _1892;
                    _1708 = _1898;
                    _1702 = _1896;
                    _1744 = _1902;
                    _1818 = true;
                }
                else
                {
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1714 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1756 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1708 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1702 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1744 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1818 = false;
    float _1904 = _1720;
    float _1906 = _1714;
    float _1908 = _1756;
    float _1910 = _1708;
    float _1912 = _1702;
    float _1914 = _1744;
    float _1916 = fma(_895, -0.5, 0.5);
    float _1918 = precise::clamp(_1916, 0.0, 1.0);
    float _1920 = -_1904;
    float _1922 = _1920 + _1906;
    float _1924 = -_1908;
    float _1926 = _1924 + _1910;
    out.m_78.x = 0.0;
    float _1928 = -_1912;
    float _1930 = _1928 + _1914;
    float _1932 = fma(_1918, _1922, _1904);
    float _1934 = fma(_1918, _1926, _1908);
    bool _1936 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1938 = _1932 * 0.586610972881317138671875;
    float _1940 = fma(_1918, _1930, _1912);
    float _1942 = _1750 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1944 = fma(_1934, 0.298911988735198974609375, _1938);
    bool _1946 = _1321 > 0.0;
    bool _1948 = isnan(_1321);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    float _1956 = fma(_1940, 0.114477999508380889892578125, _1944);
    out.m_51.x = _1942;
    float _1958 = -_1956;
    float _1960 = _1934 + _1958;
    float _1962 = -_1956;
    float _1964 = _1932 + _1962;
    float _1966 = -_1956;
    float _1968 = _1940 + _1966;
    float _1970 = fma(_1960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    float _1972 = fma(_1964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    float _1974 = fma(_1968, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1956);
    bool _1976 = !_1936;
    if (!_1976)
    {
        float _1978 = -_1243;
        float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1982 = -_1245;
        float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1986 = -_1247;
        float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1990 = _1980 * _1980;
        float _1992 = fma(_1984, _1984, _1990);
        float _1994 = fma(_1988, _1988, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = rsqrt(_1994);
        float _2000 = -_1996;
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2006 = precise::clamp(_2004, 0.0, 1.0);
        float _2008 = _1984 * _1998;
        float _2010 = _1980 * _1998;
        float _2012 = abs(_2006);
        float _2014 = log2(_2012);
        float _2016 = _1988 * _1998;
        float _2018 = _2008 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2020 = _895 * _2010;
        float _2022 = -_2010;
        float _2024 = -_2018;
        float _2026 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2024);
        float _2028 = fma(_901, _2008, _2020);
        float _2030 = -_2016;
        float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2026);
        float _2034 = fma(_907, _2016, _2028);
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2040 = _2032 + _2038;
        float _2042 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2044 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2046 = precise::clamp(_2044, 0.0, 1.0);
        float _2048 = exp2(_2042);
        float _2050 = _2048 * _2046;
        float _2052 = _2036 * _2050;
        float _2054 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2056 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _2054;
        out.m_78.y = _2056;
        out.m_78.z = _2058;
    }
    out.m_80.x = _1970;
    out.m_80.y = _1972;
    out.m_80.z = _1974;
    if (_1954)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2060 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2060;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

