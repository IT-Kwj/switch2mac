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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _849 = false;
    bool _493 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3066 = as_type<float>(_103);
        out.gl_Position.z = _3066;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3135 = as_type<float>(_141);
        out.gl_Position.z = _3135;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_52.x;
    float _147 = in.m_52.y;
    float _149 = in.m_52.z;
    int _151 = as_type<int>(_143) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_143) & 2;
    bool _157 = _155 != 0;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _173 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _171);
    bool _179 = !_153;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_157;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_159;
    float _205;
    if (!_187)
    {
        float _189 = in.m_54.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_87);
        float _211 = 1.0 / _209;
        float _213 = _121 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _215 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = 1.0 / _223;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _239;
    float _243 = 1.0 / _227;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _215 + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _235;
    float _253 = _247 * _237;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _215 + _255;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_215);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _241;
    float _285 = _219 * _243;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _289 = _215 + _287;
    bool _291 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_215);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _231;
    float _305 = _289 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_309, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = _215 + _317;
    float _321 = fma(_313, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = -_281;
    float _325 = _323 + 1.0;
    float _327 = _319 * _283;
    bool _329 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _331 = isnan(_215);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _257 * _303;
    bool _343 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_215);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_269;
    float _357 = _355 + 1.0;
    float _359 = _339 * _357;
    float _361 = -_353;
    float _363 = _361 + 1.0;
    float _365 = -_339;
    float _367 = _365 + 1.0;
    float _369 = _281 * _363;
    float _371 = _353 * _367;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _377 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_215);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _301 * _325;
    float _391 = -_301;
    float _393 = _391 + 1.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = fma(_375, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_387;
    float _403 = _401 + 1.0;
    float _405 = _387 * _393;
    float _407 = fma(_397, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _321 * _405;
    float _419 = _315 * _405;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _425 = fma(_411, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _429 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _435 = fma(_407, _389, _427);
    float _437 = fma(_415, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_399, _389, _429);
    float _441 = fma(_423, _305, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _443 = fma(_433, _305, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _445;
    float _449 = fma(_425, _369, _435);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _451;
    float _455 = fma(_437, _369, _439);
    float _457 = fma(_447, _327, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _459 = fma(_443, _371, _449);
    float _461 = fma(_453, _327, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _463 = fma(_441, _371, _455);
    float _465 = fma(_457, _359, _459);
    float _467 = fma(_461, _359, _463);
    float _469 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].x, _465);
    float _471 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].y, _467);
    bool _473 = !_249;
    float _491;
    if (!_473)
    {
        float _475 = in.m_54.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_87);
        float _497 = 1.0 / _495;
        float _499 = _121 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _519 = 1.0 / _505;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _521;
    float _525 = 1.0 / _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = _501 + _527;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _513;
    float _545 = _529 * _519;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _549 = _501 + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = _501 + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _557 = _501 + _555;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _561 = 1.0 / _517;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = _501 + _563;
    float _567 = _549 * _525;
    bool _569 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _571 = isnan(_501);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = 1.0 / _523;
    float _583 = _553 * _543;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _585;
    float _589 = -_579;
    float _591 = _589 + 1.0;
    float _593 = fma(_587, _545, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _595 = _557 * _561;
    bool _597 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _599 = isnan(_501);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_607;
    float _611 = _609 + 1.0;
    float _613 = _565 * _581;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _619;
    float _623 = _541 * _611;
    bool _625 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _627 = isnan(_501);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_617, _545, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _639 = fma(_621, _545, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _641 = _607 * _591;
    bool _643 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _645 = isnan(_501);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _659 = -_541;
    float _661 = _659 + 1.0;
    bool _663 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _665 = isnan(_501);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _683 = _653 * _661;
    float _685 = -_653;
    float _687 = _685 + 1.0;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_677, _567, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _695 = fma(_657, _567, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _697 = fma(_681, _567, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _699 = _673 * _687;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _709;
    float _713 = _635 * _691;
    float _715 = fma(_703, _583, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _717 = fma(_707, _583, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _719 = fma(_711, _583, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _721 = _637 * _713;
    float _723 = _593 * _713;
    float _725 = _639 * _713;
    float _727 = -_635;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].x, _721);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].y, _723);
    float _747 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].z, _725);
    float _749 = fma(_733, _595, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _751 = fma(_737, _595, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _753 = fma(_741, _595, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _755 = fma(_697, _699, _747);
    float _757 = fma(_693, _699, _743);
    float _759 = fma(_695, _699, _745);
    float _761 = fma(_715, _683, _757);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _763;
    float _767 = fma(_717, _683, _759);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _769;
    float _773 = fma(_719, _683, _755);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _775;
    float _779 = fma(_765, _613, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _781 = fma(_771, _613, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _783 = fma(_749, _623, _761);
    float _785 = fma(_777, _613, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _787 = fma(_751, _623, _767);
    float _789 = fma(_753, _623, _773);
    float _791 = fma(_779, _641, _783);
    float _793 = fma(_781, _641, _787);
    float _795 = fma(_785, _641, _789);
    float _797 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].x, _791);
    float _799 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].y, _793);
    float _801 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].z, _795);
    float _803 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = in.m_56.x;
    float _807 = in.m_56.y;
    float _809 = _799 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _811 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _815 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _815;
    out.m_58.y = _817;
    out.m_58.z = _819;
    out.m_58.w = _813;
    float _821 = _471 * _807;
    float _823 = _469 * _805;
    bool _825 = !_559;
    float _845;
    float _847;
    if (!_825)
    {
        float _827 = in.m_54.x;
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _831 = float(_87);
        float _833 = _827 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _837 = _835 * _829;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = _831;
        _849 = true;
    }
    else
    {
        float _851 = float(_87);
        float _853 = 1.0 / _851;
        float _855 = _121 * _853;
        _845 = _855;
        _847 = _851;
    }
    _849 = false;
    float _857 = _845;
    float _859 = _847;
    float _861 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _863 = int(_861);
    float _865 = in.m_54.x;
    float _867 = in.m_54.y;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _871 = _857 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _875 = _857 + _873;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _879 = _877 != 0;
    float _881 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _883 = int(_881);
    bool _885 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _887 = isnan(_857);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    bool _897 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _899 = isnan(_857);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = 1.0 / _859;
    float _911 = float(_863);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _913;
    bool _917 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _919 = isnan(_857);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = 1.0 / _911;
    float _931 = float(uint(_883));
    float _933 = _867 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _935 = ~_883;
    int _937 = _935 + 1;
    float _939 = _867 * 2.0;
    int _941 = ~_883;
    int _943 = _941 + 1;
    float _945 = -_927;
    float _947 = _945 + 1.0;
    int _949 = ~_883;
    int _951 = _949 + 1;
    float _953 = 1.0 / _931;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _957 = _929 * _121;
    float _959 = floor(_939);
    int _961 = as_type<int>(_953) + (-2);
    float _963 = trunc(_957);
    int _965 = int(_963);
    float _967 = float(uint(_965));
    float _969 = as_type<float>(_961) * _967;
    float _971 = trunc(_969);
    float _973 = precise::max(_971, 0.0);
    uint _976 = uint(_973);
    int _978 = _937 * int(_976);
    int _980 = _978 + _965;
    float _982 = float(uint(_980));
    float _984 = float(_965);
    float _986 = as_type<float>(_961) * _982;
    float _988 = float(_883);
    bool _990 = _984 >= _988;
    bool _992 = isnan(_984);
    bool _994 = _990 || _992;
    bool _996 = isnan(_988);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = trunc(_986);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_879;
    float _1010 = _1008 ? 7.345489978790283203125 : 1.0;
    float _1012 = _1010 * _865;
    int _1014 = int(_976) + int(_1006);
    int _1016 = _943 * _1014;
    int _1018 = _1016 + _965;
    float _1020 = trunc(_1000);
    int _1022 = int(_1020);
    bool _1024 = uint(_1018) >= uint(_883);
    bool _1026 = !_1024;
    int _1028 = _1026 ? 0 : (-1);
    float _1030 = floor(_1012);
    bool _1032 = _883 == 0;
    int _1034 = ~_1014;
    int _1036 = _1034 + _1028;
    int _1038 = _1036 + 1;
    int _1040 = _883 * _1038;
    int _1042 = _1040 + _965;
    int _1044 = ~_1022;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    bool _1050 = !_1032;
    int _1052 = _1050 ? _1042 : (-1);
    float _1054 = -_1030;
    float _1056 = _1012 + _1054;
    int _1058 = _883 + (-1);
    int _1060 = _1052 * _1048;
    float _1062 = _1056 * _988;
    float _1064 = _988 * _121;
    int _1066 = _1022 * _1058;
    int _1068 = _1066 + _1060;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1080 = _1078 != 0;
    float _1082 = trunc(_1062);
    int _1084 = int(_1082);
    float _1086 = _1064 * _909;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1090 = _1088 != 0;
    bool _1092 = !_1076;
    int _1094 = _1092 ? 0 : 1;
    bool _1096 = !_1072;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = trunc(_1086);
    int _1102 = int(_1100);
    int _1104 = abs(_1094);
    bool _1106 = !_1080;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1068 * _1104;
    int _1116 = abs(_1098);
    int _1118 = abs(_1108);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1122 = _1120 != 0;
    int _1124 = abs(_1112);
    bool _1126 = !_1122;
    int _1128 = _1126 ? 0 : 1;
    int _1130 = _1084 * _1124;
    int _1132 = _1130 + _965;
    int _1134 = _1102 * _1116;
    int _1136 = _1134 + _1114;
    int _1138 = abs(_1128);
    int _1140 = ~_883;
    int _1142 = _1140 + 1;
    int _1144 = _1132 * _1118;
    int _1146 = _1144 + _1136;
    float _1148 = float(uint(_1132));
    int _1150 = _1084 * _1138;
    int _1152 = _1150 + _1146;
    float _1154 = as_type<float>(_961) * _1148;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1160 = float(uint(_1152));
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1166;
    float _1170 = trunc(_1154);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = as_type<float>(_961) * _1160;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1186 = _1184 != 0;
    float _1188 = trunc(_1176);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1194;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1200 = _1198 != 0;
    int _1202 = _951 * int(_1174);
    int _1204 = _1202 + _1132;
    int _1206 = ~_883;
    int _1208 = _1206 + 1;
    float _1210 = 1.0 / _1158;
    float _1212 = float(uint(_1204));
    int _1214 = _1142 * int(_1192);
    int _1216 = _1214 + _1152;
    float _1218 = 1.0 / _1168;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = _865 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1224 = float(uint(_1216));
    float _1226 = as_type<float>(_961) * _1212;
    float _1228 = fma(_933, -2.0, _1220);
    float _1230 = -_1182;
    float _1232 = fma(_1222, 2.0, _1230);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1236 = _857 + _1234;
    float _1238 = as_type<float>(_961) * _1224;
    float _1240 = 1.0 / _1180;
    float _1242 = _1236 * _1210;
    float _1244 = trunc(_1238);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = trunc(_1226);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = _871 * _1240;
    int _1258 = int(_1192) + int(_1248);
    float _1260 = 1.0 / _1164;
    int _1262 = _1208 * _1258;
    int _1264 = _1262 + _1152;
    int _1266 = int(_1174) + int(_1254);
    bool _1268 = uint(_1264) >= uint(_883);
    float _1270 = in.m_42.x;
    float _1272 = in.m_42.y;
    float _1274 = in.m_42.z;
    bool _1276 = !_1268;
    int _1278 = _1276 ? 0 : (-1);
    int _1280 = ~_1258;
    int _1282 = _1280 + _1278;
    int _1284 = _1282 + 1;
    float _1286 = 1.0 / _1196;
    int _1288 = _883 * _1284;
    int _1290 = _1288 + _1152;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1294 = _857 + _1292;
    bool _1296 = !_1032;
    int _1298 = _1296 ? _1290 : (-1);
    float _1300 = _1294 * _1260;
    float _1302 = in.m_54.z;
    int _1304 = _1298 & 3;
    bool _1306 = _1304 != 0;
    float _1308 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1310 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1312 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1314 = _875 * _1286;
    float _1316 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1308);
    float _1318 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1310);
    float _1320 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1312);
    int _1322 = _1298 >> 31;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1326 = _857 + _1324;
    int _1328 = ~_883;
    int _1330 = _1328 + 1;
    float _1332 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1318);
    int _1334 = _1322 & 3;
    float _1336 = _1326 * _1218;
    int _1338 = _1298 & 3;
    bool _1340 = _1338 != 0;
    int _1342 = _1330 * _1266;
    int _1344 = _1342 + _1132;
    int _1346 = _1298 + _1334;
    float _1348 = _865 * 2.0;
    bool _1350 = uint(_1338) > 1u;
    float _1352 = _867 + _865;
    int _1354 = _1346 >> 2;
    float _1356 = floor(_1348);
    int _1358 = _1306 ? 0 : 1;
    float _1360 = _1352 + (-1.0);
    int _1362 = _1354 << 4;
    int _1364 = _1362 + 368;
    bool _1366 = uint(_1344) >= uint(_883);
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _1370 = uint(int(uint(_1364) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    int _1386 = ~_1358;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = _867 + _1302;
    bool _1394 = !_1366;
    int _1396 = _1394 ? 0 : (-1);
    bool _1398 = _1338 != 3;
    float _1400 = _1392 + (-1.0);
    int _1402 = _1390;
    if (!_1350)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1402 = _1406;
    }
    int _1408 = _1402;
    int _1410 = _1364 + 8;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    bool _1428 = uint(_1338) >= 2u;
    float _1430 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1432 = ~_1266;
    int _1434 = _1432 + _1396;
    int _1436 = _1434 + 1;
    int _1438 = _1428 ? 0 : 1;
    bool _1440 = _1356 >= 0.0;
    bool _1442 = isnan(_1356);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    int _1450 = _883 * _1436;
    int _1452 = _1450 + _1132;
    int _1454 = ~_1438;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    int _1460 = _1458;
    if (_1398)
    {
        int _1462 = ~_1438;
        int _1464 = _1462 + 1;
        _1460 = _1464;
    }
    int _1466 = _1460;
    bool _1468 = !_1186;
    int _1470 = _1468 ? 0 : 1;
    bool _1472 = _959 >= 0.0;
    bool _1474 = isnan(_959);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    int _1482 = _1448 ? 0 : 1;
    bool _1484 = _1356 > 0.0;
    float _1486 = _1302 * 2.0;
    bool _1488 = _959 > 0.0;
    int _1490 = abs(_1408);
    bool _1492 = !_1340;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = floor(_1486);
    int _1498 = _1480 ? 0 : 1;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1510 = _1508 != 0;
    int _1512 = abs(_1494);
    bool _1514 = !_1032;
    int _1516 = _1514 ? _1452 : (-1);
    int _1518 = ~_1490;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    bool _1524 = _1338 != 3;
    int _1526 = _1522 * as_type<int>(_1384);
    int _1528 = abs(_1466);
    int _1530 = ~_1512;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    float _1536 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1538 = int(_1536);
    bool _1540 = !_1524;
    int _1542 = _1540 ? 0 : (-1);
    int _1544 = ~_1482;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    int _1550 = _1534 * as_type<int>(_1376);
    int _1552 = _1550 + _1526;
    int _1554 = _1548;
    if (!_1484)
    {
        int _1556 = ~_1482;
        int _1558 = _1556 + 1;
        _1554 = _1558;
    }
    int _1560 = _1554;
    float _1562 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1316);
    int _1564 = ~_1528;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1320);
    int _1572 = ~_1498;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    bool _1578 = _1496 > 0.0;
    int _1580 = _1568 * as_type<int>(_1418);
    int _1582 = _1580 + _1552;
    bool _1584 = _1496 >= 0.0;
    bool _1586 = isnan(_1496);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.0);
    bool _1592 = _1588 || _1590;
    int _1594 = abs(_1542);
    int _1596 = _1576;
    if (!_1488)
    {
        int _1598 = ~_1498;
        int _1600 = _1598 + 1;
        _1596 = _1600;
    }
    int _1602 = _1596;
    float _1604 = float(uint(_1538));
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1606;
    int _1610 = abs(_1470);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1612;
    int _1616 = ~_1594;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1622;
    float _1626 = 1.0 / _1604;
    int _1628 = ~_1610;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    float _1634 = fma(_1608, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1636 = _1620 * as_type<int>(_1426);
    int _1638 = _1636 + _1582;
    float _1640 = fma(_1614, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1642 = fma(_1624, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1652 = _1638 * _1632;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1658 = fma(_1646, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1660 = fma(_1650, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1662 = _1516 * _1610;
    int _1664 = _1662 + _1652;
    float _1666 = fma(_1656, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1668;
    int _1672 = as_type<int>(_1626) + (-2);
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1674;
    int _1678 = abs(_1538);
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1680;
    float _1684 = fma(_1670, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1686 = fma(_1676, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1688 = float(uint(_1664));
    float _1690 = fma(_1682, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1692 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1694 = log2(_1692);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1700 = as_type<float>(_1672) * _1688;
    float _1702 = float(uint(_1678));
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1712 = trunc(_1700);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    float _1718 = fma(_1698, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1720 = fma(_1706, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1722;
    int _1726 = abs(_1664);
    float _1728 = fma(_1710, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1730;
    int _1734 = ~_1538;
    int _1736 = _1734 + 1;
    float _1738 = 1.0 / _1702;
    float _1740 = _1694 * _121;
    float _1742 = fma(_1724, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1744 = fma(_1732, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1746 = fma(_915, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _1748 = _1592 ? 0 : 1;
    float _1750 = float(uint(_1726));
    int _1752 = _1736 * int(_1716);
    int _1754 = _1752 + _1664;
    float _1756 = exp2(_1740);
    bool _1758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1766 = _1762 || _1764;
    bool _1768 = _1538 == 0;
    float _1770 = float(uint(_1754));
    int _1772 = as_type<int>(_1738) + (-2);
    bool _1774 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1776 = isnan(_857);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = as_type<float>(_1672) * _1770;
    bool _1788 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1790 = isnan(_857);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = as_type<float>(_1772) * _1750;
    bool _1802 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1804 = isnan(_857);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = -_1784;
    float _1816 = _1814 + 1.0;
    float _1818 = trunc(_1786);
    float _1820 = precise::max(_1818, 0.0);
    uint _1822 = uint(_1820);
    float _1824 = _1812 * _1816;
    float _1826 = -_1812;
    float _1828 = _1826 + 1.0;
    int _1830 = ~_1678;
    int _1832 = _1830 + 1;
    float _1834 = _927 * _1828;
    float _1836 = trunc(_1800);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1844 = 1.0 + _1842;
    float _1846 = -_1756;
    float _1848 = _1846 + 1.0;
    float _1850 = _907 * _947;
    float _1852 = -_907;
    float _1854 = _1852 + 1.0;
    float _1856 = _1766 ? _1848 : 0.0;
    float _1858 = 1.0 / _1844;
    bool _1860 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1862 = isnan(1.0);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1868 = _1864 || _1866;
    int _1870 = int(_1716) + int(_1822);
    int _1872 = _1832 * int(_1840);
    int _1874 = _1872 + _1726;
    float _1876 = float(uint(_1874));
    float _1878 = _895 * _1854;
    float _1880 = -_895;
    float _1882 = _1880 + 1.0;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1886 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[78].z, _955);
    float _1888 = as_type<float>(_1772) * _1876;
    float _1890 = _1798 * _1882;
    float _1892 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1884);
    float _1894 = -_121;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1232);
    float _1898 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1886);
    float _1900 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    float _1902 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1892);
    if (_1868)
    {
        float _1904 = _1856 * _1858;
        _125 = _1904;
    }
    float _1906 = _125;
    float _1908 = -_1798;
    float _1910 = _1908 + 1.0;
    float _1912 = _1634 * _1890;
    float _1914 = trunc(_1888);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1640 * _1890;
    float _1922 = _1642 * _1890;
    float _1924 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1912);
    int _1926 = ~_1748;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1920);
    float _1934 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1922);
    float _1936 = fma(_1658, _1878, _1924);
    int _1938 = _1930;
    if (!_1578)
    {
        int _1940 = ~_1748;
        int _1942 = _1940 + 1;
        _1938 = _1942;
    }
    int _1944 = _1938;
    float _1946 = fma(_1660, _1878, _1932);
    float _1948 = fma(_1666, _1878, _1934);
    bool _1950 = !_1502;
    int _1952 = _1950 ? 0 : 1;
    float _1954 = fma(_1684, _1850, _1936);
    int _1956 = ~_1678;
    int _1958 = _1956 + 1;
    float _1960 = fma(_1686, _1850, _1946);
    int _1962 = abs(_1952);
    float _1964 = fma(_1718, _1834, _1954);
    int _1966 = int(_1840) + int(_1918);
    float _1968 = fma(_1720, _1834, _1960);
    float _1970 = fma(_1742, _1824, _1964);
    int _1972 = ~_1538;
    int _1974 = _1972 + 1;
    int _1976 = _1958 * _1966;
    int _1978 = _1976 + _1726;
    float _1980 = float(_1560);
    float _1982 = fma(_1690, _1850, _1948);
    float _1984 = float(_1962);
    int _1986 = _1974 * _1870;
    int _1988 = _1986 + _1664;
    float _1990 = float(_1944);
    float _1992 = fma(_1728, _1834, _1982);
    bool _1994 = !_1506;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = fma(_1744, _1824, _1968);
    bool _2000 = uint(_1978) >= uint(_1678);
    float _2002 = _1984 * _1990;
    int _2004 = abs(_1996);
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2008 = uint(_1988) >= uint(_1538);
    float _2010 = fma(_1746, _1824, _1992);
    bool _2012 = !_2000;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = -_1898;
    float _2018 = _2016 + 1.0;
    float _2020 = float(_2004);
    float _2022 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1970);
    bool _2024 = !_2008;
    int _2026 = _2024 ? 0 : (-1);
    float _2028 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1998);
    int _2030 = ~_2014;
    int _2032 = _1966 + _2030;
    int _2034 = _2032 + 1;
    float _2036 = _1562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2038 = _1664 ^ _1538;
    float _2040 = _2020 * _1980;
    int _2042 = ~_1870;
    int _2044 = _2042 + _2026;
    int _2046 = _2044 + 1;
    float _2048 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2050 = _1570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    uint _2052 = uint(int(uint(_2038) >> uint(31)));
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2056 = _2036 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2060 = _2048 + _2058;
    float _2062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2064 = ~int(_2052);
    int _2066 = _2064 + 1;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2050 + _2068;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2074 = _1538 == 0;
    int _2076 = _1538 * _2046;
    int _2078 = _2076 + _1664;
    int _2080 = _2034 ^ _2066;
    float _2082 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2072);
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2086 = _2084 != 0;
    float _2088 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2090 = ~_2066;
    int _2092 = _2090 + _2080;
    int _2094 = _2092 + 1;
    float _2096 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2082);
    bool _2098 = !_2074;
    int _2100 = _2098 ? _2078 : (-1);
    float _2102 = _2060 * _2060;
    bool _2104 = !_1768;
    int _2106 = _2104 ? _2094 : (-1);
    bool _2108 = _865 > 0.5;
    float _2110 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2112 = _867 > 0.5;
    float _2114 = fma(_2056, _2056, _2102);
    bool _2116 = _2096 >= 0.0;
    float _2118 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2120 = -_181;
    int _2122 = _2108 ? as_type<int>(_2120) : as_type<int>(_181);
    float _2124 = -_185;
    int _2126 = _2112 ? as_type<int>(_2124) : as_type<int>(_185);
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2130 = float(_2106);
    float _2132 = float(_2100);
    bool _2134 = !_2086;
    float _2136 = _2134 ? _181 : as_type<float>(_2122);
    float _2138 = -_1900;
    float _2140 = fma(_2110, _2130, _2138);
    bool _2142 = !_1200;
    float _2144 = _2142 ? _185 : as_type<float>(_2126);
    float _2146 = fma(_2088, _2132, _1896);
    float _2148 = as_type<float>(_2046);
    if (_2116)
    {
        _2148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2150 = _2148;
    float _2152 = _2136 + 0.5;
    if (_2116)
    {
        out.m_45.x = 0.0;
    }
    float _2154 = _2144 + (-0.5);
    float _2156 = fma(_2088, _2152, _2146);
    float _2158 = -_2110;
    float _2160 = fma(_2158, _2154, _2140);
    float _2162 = -_1902;
    float _2164 = _2162 + 1.0;
    float _2166 = in.m_60.x;
    float _2168 = in.m_60.y;
    float _2170 = in.m_60.z;
    float _2172 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2010);
    float _2174 = -_2018;
    float _2176 = fma(_2136, _2174, _2156);
    float _2178 = fma(_2144, _2164, _2160);
    float _2180 = fma(_2070, _2070, _2114);
    float _2182 = _2002 * (-2.0);
    float _2184 = _2028 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2186 = _2172 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2188 = as_type<int>(_2172);
    if (_2116)
    {
        float _2190 = _2150 * 5.0;
        _2188 = as_type<int>(_2190);
    }
    int _2192 = _2188;
    float _2194 = rsqrt(_2180);
    float _2196 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2200 = fma(_1368, _2182, _1368);
    if (_2116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6292 = as_type<float>(_2192);
        out.gl_Position.z = _6292;
    }
    out.m_62.x = _2128;
    out.m_62.y = _2196;
    out.m_62.z = _2198;
    out.m_64.x = _2176;
    out.m_64.y = _2178;
    float _2202 = fma(_2182, _2166, _2166);
    float _2204 = _2040 * (-2.0);
    bool _2206 = !_1510;
    int _2208 = _2206 ? 0 : 1;
    float _2210 = _2060 * _2194;
    float _2212 = fma(_1430, _2204, _1430);
    float _2214 = _2056 * _2194;
    float _2216 = _2170;
    if (_2116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2218 = -_2210;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2222 = fma(_2204, _2168, _2168);
    float _2224 = _865 + (-0.5);
    float _2226 = -_2214;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2036);
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2232 = _2220 + _2230;
    float _2234 = _867 + (-0.5);
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2202);
    float _2238 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2240 = _2228 + _2238;
    float _2242 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2222);
    float _2246 = _2070 * _2194;
    int _2248 = abs(_2208);
    float _2250 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2242);
    float _2252 = -_2210;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2256 = -_2246;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2050);
    float _2260 = -_2214;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2264 = float(_1602);
    float _2266 = _2254 * _2254;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2270 = _2258 + _2268;
    float _2272 = float(_2248);
    float _2274 = -_2246;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2070);
    float _2278 = fma(_2262, _2262, _2266);
    float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2250);
    float _2282 = _1302 + _865;
    float _2284 = _2272 * _2264;
    float _2286 = fma(_2276, _2276, _2278);
    bool _2288 = _2280 >= 0.0;
    float _2290 = _2282 + (-1.0);
    float _2292 = _2284 * (-2.0);
    float _2294 = sqrt(_2286);
    float _2296 = _1302 + (-0.5);
    float _2298 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2300 = fma(_2292, _2170, _2170);
    float _2302 = fma(_2200, _1906, _2236);
    float _2304 = fma(_2212, _1906, _2244);
    float _2306 = fma(_2298, _2292, _2298);
    float _2308 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2300);
    float _2310 = _2302 * 0.15915493667125701904296875;
    float _2312 = _2304 * 0.15915493667125701904296875;
    if (_2288)
    {
        _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2314 = _2216;
    float _2316 = fma(_2306, _1906, _2308);
    float _2318 = _2310 * 6.283185482025146484375;
    float _2320 = sin(_2318);
    int _2322 = as_type<int>(_2314);
    if (_2288)
    {
        out.m_45.x = 0.0;
    }
    float _2324 = _2316 * 0.15915493667125701904296875;
    float _2326 = _2194 * _2294;
    if (_2288)
    {
        float _2328 = _2314 * 5.0;
        _2322 = as_type<int>(_2328);
    }
    int _2330 = _2322;
    float _2332 = _2310 * 6.283185482025146484375;
    float _2334 = cos(_2332);
    if (_2288)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6534 = as_type<float>(_2330);
        out.gl_Position.z = _6534;
    }
    float _2336 = _2312 * 6.283185482025146484375;
    float _2338 = sin(_2336);
    float _2340 = _2312 * 6.283185482025146484375;
    float _2342 = cos(_2340);
    float _2344 = _2324 * 6.283185482025146484375;
    float _2346 = sin(_2344);
    if (_2288)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2348 = _2324 * 6.283185482025146484375;
    float _2350 = cos(_2348);
    float _2352 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2356 = _823 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2358 = _2320 * _2338;
    float _2360 = _2326 * _2352;
    float _2362 = _2334 * _2342;
    float _2364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2366 = _2326 * _2356;
    float _2368 = _2354 * _2360;
    float _2370 = fma(_2346, _2362, _2358);
    float _2372 = _2334 * _2338;
    float _2374 = _2364 * _2366;
    float _2376 = fma(_2346, _2358, _2362);
    float _2378 = _2350 * _2368;
    float _2380 = _2338 * _2350;
    float _2382 = -_2368;
    float _2384 = _2346 * _2382;
    float _2386 = _2334 * _2378;
    float _2388 = _2342 * _2350;
    float _2390 = _2320 * _2342;
    float _2392 = _2320 * _2378;
    float _2394 = fma(_2370, _2374, _2386);
    float _2396 = _2326 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2398 = _2396 * 0.5;
    float _2400 = -_2390;
    float _2402 = fma(_2346, _2372, _2400);
    float _2404 = -_2372;
    float _2406 = fma(_2346, _2390, _2404);
    float _2408 = fma(_2388, _2374, _2384);
    float _2410 = fma(_2402, _2398, _2394);
    float _2412 = fma(_2406, _2374, _2392);
    float _2414 = fma(_2380, _2398, _2408);
    float _2416 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2418 = fma(_2376, _2398, _2412);
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2422 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2416);
    float _2424 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2420);
    float _2426 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2422);
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2424);
    float _2430 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2432 = _2428 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2434 = _2050 + _2430;
    float _2436 = _2036 + _2432;
    float _2438 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2442 = _2434 + _2440;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2446 = _2436 + _2444;
    float _2448 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2438);
    float _2450 = _2442 * _2442;
    float _2452 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2448);
    float _2454 = fma(_2446, _2446, _2450);
    float _2456 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2458 = sqrt(_2454);
    float _2460 = _2048 + _2456;
    bool _2462 = _2458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2464 = _2450;
    float _2466 = _2438;
    float _2468 = _2436;
    float _2470 = _2434;
    float _2472 = _2410;
    float _2474 = _2454;
    if (!_2462)
    {
        _2464 = _2436;
    }
    float _2476 = _2464;
    float _2478 = _2476;
    if (!_2462)
    {
        _2466 = _2434;
    }
    float _2480 = _2466;
    float _2482 = _2480;
    if (!_2462)
    {
        _2468 = _2460;
    }
    float _2484 = _2468;
    bool _2486 = !_2462;
    float _2488 = _2484;
    if (!_2486)
    {
        float _2490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2494 = _2458 + _2492;
        float _2496 = rsqrt(_2454);
        float _2498 = _2494 * _2490;
        float _2500 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2502 = _2498 * 0.15915493667125701904296875;
        float _2504 = _2502 * 6.283185482025146484375;
        float _2506 = cos(_2504);
        float _2508 = _2502 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = _2506 + (-1.0);
        float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2516 = fma(_2510, _2500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2518 = fma(_2460, _2506, _2514);
        float _2520 = _2496 * _2516;
        float _2522 = fma(_2446, _2520, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2524 = fma(_2442, _2520, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2488 = _2518;
        _2478 = _2522;
        _2482 = _2524;
    }
    float _2526 = _2488;
    float _2528 = _2478;
    float _2530 = _2482;
    float _2532 = -_2048;
    float _2534 = _2532 + _2526;
    float _2536 = -_2036;
    float _2538 = _2536 + _2528;
    float _2540 = -_2050;
    float _2542 = _2540 + _2530;
    float _2544 = _2534 * _2534;
    float _2546 = fma(_2538, _2538, _2544);
    float _2548 = fma(_2542, _2542, _2546);
    float _2550 = sqrt(_2548);
    bool _2552 = _2550 > 0.0;
    bool _2554 = !_2552;
    float _2556 = _2526;
    float _2558 = _2528;
    float _2560 = _2530;
    if (!_2554)
    {
        float _2562 = _177 * _177;
        float _2564 = fma(_175, _175, _2562);
        float _2566 = fma(_173, _173, _2564);
        float _2568 = rsqrt(_2548);
        float _2570 = sqrt(_2566);
        float _2572 = _2538 * _2568;
        float _2574 = _2534 * _2568;
        float _2576 = _2542 * _2568;
        bool _2578 = _2570 > 0.0;
        bool _2580 = !_2578;
        _2472 = _2570;
        _2474 = _2576;
        if (!_2580)
        {
            float _2582 = rsqrt(_2566);
            float _2584 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2586 = _177 * _2582;
            float _2588 = _175 * _2582;
            float _2590 = _173 * _2582;
            float _2592 = _2574 * _2586;
            float _2594 = fma(_2572, _2588, _2592);
            float _2596 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2598 = fma(_2576, _2590, _2594);
            float _2600 = _2598 * _2596;
            float _2602 = fma(_175, _2600, _2528);
            float _2604 = fma(_177, _2600, _2526);
            float _2606 = fma(_173, _2600, _2530);
            _2556 = _2604;
            _2558 = _2602;
            _2560 = _2606;
            _2470 = _2584;
            _2472 = _2586;
        }
    }
    float _2608 = _2556;
    float _2610 = _2558;
    float _2612 = _2560;
    float _2614 = _2470;
    float _2616 = _2472;
    float _2618 = _2474;
    float _2620 = -_2210;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2608);
    float _2624 = -_2214;
    float _2626 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2610);
    float _2628 = -_2246;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2612);
    float _2632 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2634 = _2622 + _2632;
    float _2636 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2638 = _2626 + _2636;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2642 = _2630 + _2640;
    float _2644 = _2634 * _2634;
    float _2646 = fma(_2638, _2638, _2644);
    float _2648 = fma(_2642, _2642, _2646);
    float _2650 = rsqrt(_2648);
    float _2652 = sqrt(_2648);
    float _2654 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2656 = _2638 * _2654;
    float _2658 = _2642 * _2654;
    float _2660 = _2656 * _2656;
    float _2662 = _2658 * _2658;
    float _2664 = _2660 + _2662;
    float _2666 = sqrt(_2664);
    bool _2668 = _2666 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2672 = _2666 + _2670;
    float _2674 = _2642;
    float _2676 = _2616;
    float _2678 = _2672;
    float _2680 = _2614;
    float _2682 = _2618;
    float _2684 = _2654;
    float _2686 = _2656;
    if (_2668)
    {
        float _2688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2674 = _2688;
    }
    float _2690 = _2674;
    if (_2668)
    {
        float _2692 = rsqrt(_2664);
        _2676 = _2692;
    }
    float _2694 = _2676;
    float _2696 = _2694;
    if (_2668)
    {
        float _2698 = _2672 * _2690;
        _2678 = _2698;
    }
    float _2700 = _2678;
    if (_2668)
    {
        float _2702 = _2700 * 0.15915493667125701904296875;
        _2680 = _2702;
    }
    float _2704 = _2680;
    float _2706 = _2644;
    if (_2668)
    {
        float _2708 = _2704 * 6.283185482025146484375;
        float _2710 = sin(_2708);
        _2706 = _2710;
    }
    float _2712 = _2706;
    float _2714 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2716 = precise::max(0.0, _2714);
    float _2718 = _2650;
    float _2720 = _2716;
    float _2722 = _2714;
    if (_2668)
    {
        float _2724 = _2704 * 6.283185482025146484375;
        float _2726 = cos(_2724);
        _2718 = _2726;
    }
    float _2728 = _2718;
    float _2730 = -_2654;
    float _2732 = -_2716;
    float _2734 = fma(_2634, _2730, _2732);
    if (!_2668)
    {
        _2720 = _2658;
    }
    float _2736 = _2720;
    float _2738 = _2736;
    if (_2668)
    {
        float _2740 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2722 = _2740;
    }
    float _2742 = _2722;
    float _2744 = _2712;
    float _2746 = _2742;
    if (_2668)
    {
        float _2748 = fma(_2712, _2742, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2744 = _2748;
    }
    float _2750 = _2744;
    float _2752 = _2750;
    if (_2668)
    {
        float _2754 = _2728 + (-1.0);
        _2746 = _2754;
    }
    float _2756 = _2746;
    float _2758 = _2756;
    if (_2668)
    {
        float _2760 = _2694 * _2750;
        _2682 = _2760;
    }
    float _2762 = _2682;
    if (!_2668)
    {
        _2696 = _2734;
    }
    float _2764 = _2696;
    float _2766 = _2764;
    if (_2668)
    {
        float _2768 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2684 = _2768;
    }
    float _2770 = _2684;
    if (_2668)
    {
        float _2772 = _2656 * _2762;
        _2686 = _2772;
    }
    float _2774 = _2686;
    if (!_2668)
    {
        _2752 = _2660;
    }
    float _2776 = _2752;
    float _2778 = _2776;
    if (_2668)
    {
        float _2780 = _2658 * _2762;
        _2738 = _2780;
    }
    float _2782 = _2738;
    if (_2668)
    {
        float _2784 = fma(_2734, _2728, _2770);
        _2766 = _2784;
    }
    float _2786 = _2766;
    if (_2668)
    {
        float _2788 = _2774 * _2774;
        _2778 = _2788;
    }
    float _2790 = _2778;
    if (!_2668)
    {
        _2758 = _2662;
    }
    float _2792 = _2758;
    float _2794 = _2792;
    if (_2668)
    {
        float _2796 = _2782 * _2782;
        _2794 = _2796;
    }
    float _2798 = _2794;
    float _2800 = fma(_2786, _2786, _2790);
    float _2802 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2804 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2806 = _2800 + _2798;
    float _2808 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2802);
    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2812 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2810);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2818 = rsqrt(_2806);
    float _2820 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2808);
    float _2822 = -_2814;
    float _2824 = _2822 + 1.0;
    float _2826 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2816);
    float _2828 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2804);
    float _2830 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2832 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2834 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2826);
    float _2836 = abs(_2824);
    float _2838 = log2(_2836);
    float _2840 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2842 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2844 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2828);
    float _2846 = _2834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2848 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2840);
    float _2850 = -_2842;
    float _2852 = fma(_2850, _2832, 1.0);
    float _2854 = _2844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2856 = _2818 * _2774;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2860 = _2818 * _2786;
    float _2862 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2848);
    float _2864 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2866 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2858);
    float _2868 = _2818 * _2782;
    float _2870 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2872 = -_2864;
    float _2874 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2872);
    float _2876 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2866);
    float _2878 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2880 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2882 = -_2868;
    float _2884 = fma(_2882, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2874);
    float _2886 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2876);
    float _2888 = log2(_2852);
    float _2890 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2892 = fma(_2884, -0.5, 0.5);
    float _2894 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2880);
    float _2896 = fma(_2884, 0.5, 0.5);
    float _2898 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2890);
    float _2900 = _2860 + 1.0;
    float _2902 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2894);
    float _2904 = exp2(_2878);
    float _2906 = fma(_2896, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2908 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2898);
    float _2910 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2902);
    float _2912 = fma(_2896, _2906, -0.212114393711090087890625);
    float _2914 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2908);
    float _2916 = 1.0 / _2886;
    float _2918 = fma(_2896, _2912, 1.570728778839111328125);
    float _2920 = _2888 * 0.693147182464599609375;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2924 = sqrt(_2892);
    float _2926 = -_2860;
    float _2928 = fma(_2904, _2900, _2926);
    float _2930 = fma(_2928, 0.5, 0.5);
    float _2932 = _2910 * _2916;
    float _2934 = _2914 * _2916;
    float _2936 = fma(_2932, 0.5, 0.5);
    float _2938 = fma(_2934, -0.5, 0.5);
    float _2940 = _2924 * 0.636619746685028076171875;
    float3 _7516 = float3(_2936, _2938, _2922);
    float _2942 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7516, float3(0.0), isnan(_7516)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7516, float3(0.0), isnan(_7516)), level(0.0)).x;
    float3 _7527 = float3(_2936, _2938, _2922);
    float4 _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7527, float3(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7527, float3(0.0), isnan(_7527)), level(0.0)).xyzw;
    float _2947 = _2945.x;
    float _2949 = _2945.y;
    float _2951 = _2945.z;
    float _2953 = _2945.w;
    float _2955 = -_2918;
    float _2957 = fma(_2940, _2955, 1.0);
    float2 _7549 = float2(_2957, _2930);
    float3 _2961 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7549, float2(0.0), isnan(_7549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7549, float2(0.0), isnan(_7549)), level(0.0)).xyz;
    float _2963 = _2961.x;
    float _2965 = _2961.y;
    float _2967 = _2961.z;
    float _2969 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2971 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2973 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2971);
    float _2975 = exp2(_2969);
    float _2977 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2973);
    float _2979 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2977);
    float _2981 = _2979 + _2886;
    float _2983 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2910;
    out.gl_Position.y = _2914;
    out.gl_Position.z = _2979;
    out.gl_Position.w = _2886;
    float _2985 = _2981 * 0.5;
    float _2987 = -_2975;
    float _2989 = _2987 + 1.0;
    out.m_45.x = _2983;
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2985;
    out.m_66.w = _2886;
    float _2993 = _2991 * _2942;
    float _2995 = -_2991;
    float _2997 = _2995 + 1.0;
    float _2999 = _2953 * _2993;
    float _3001 = _2967 * _2993;
    float _3003 = fma(_2963, _2999, _2947);
    float _3005 = fma(_2965, _2999, _2949);
    float _3007 = _2953 * _2997;
    float _3009 = fma(_2953, _3001, _2951);
    out.m_68.x = _3003;
    out.m_68.y = _3005;
    out.m_68.z = _3009;
    out.m_68.w = _3007;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _849 = false;
    bool _493 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3066 = as_type<float>(_103);
        out.gl_Position.z = _3066;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3135 = as_type<float>(_141);
        out.gl_Position.z = _3135;
    }
    if (_135)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_52.x;
    float _147 = in.m_52.y;
    float _149 = in.m_52.z;
    int _151 = as_type<int>(_143) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_143) & 2;
    bool _157 = _155 != 0;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _173 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _171);
    bool _179 = !_153;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_157;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_159;
    float _205;
    if (!_187)
    {
        float _189 = in.m_54.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_87);
        float _211 = 1.0 / _209;
        float _213 = _121 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _215 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = 1.0 / _223;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _239;
    float _243 = 1.0 / _227;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _215 + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _235;
    float _253 = _247 * _237;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _215 + _255;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_215);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _241;
    float _285 = _219 * _243;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _289 = _215 + _287;
    bool _291 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_215);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _231;
    float _305 = _289 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_309, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = _215 + _317;
    float _321 = fma(_313, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = -_281;
    float _325 = _323 + 1.0;
    float _327 = _319 * _283;
    bool _329 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _331 = isnan(_215);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _257 * _303;
    bool _343 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_215);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_269;
    float _357 = _355 + 1.0;
    float _359 = _339 * _357;
    float _361 = -_353;
    float _363 = _361 + 1.0;
    float _365 = -_339;
    float _367 = _365 + 1.0;
    float _369 = _281 * _363;
    float _371 = _353 * _367;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _377 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_215);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _301 * _325;
    float _391 = -_301;
    float _393 = _391 + 1.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = fma(_375, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_387;
    float _403 = _401 + 1.0;
    float _405 = _387 * _393;
    float _407 = fma(_397, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _321 * _405;
    float _419 = _315 * _405;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _425 = fma(_411, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _429 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _435 = fma(_407, _389, _427);
    float _437 = fma(_415, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_399, _389, _429);
    float _441 = fma(_423, _305, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _443 = fma(_433, _305, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _445;
    float _449 = fma(_425, _369, _435);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _451;
    float _455 = fma(_437, _369, _439);
    float _457 = fma(_447, _327, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _459 = fma(_443, _371, _449);
    float _461 = fma(_453, _327, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _463 = fma(_441, _371, _455);
    float _465 = fma(_457, _359, _459);
    float _467 = fma(_461, _359, _463);
    float _469 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].x, _465);
    float _471 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].y, _467);
    bool _473 = !_249;
    float _491;
    if (!_473)
    {
        float _475 = in.m_54.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_87);
        float _497 = 1.0 / _495;
        float _499 = _121 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _519 = 1.0 / _505;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _521;
    float _525 = 1.0 / _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = _501 + _527;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _513;
    float _545 = _529 * _519;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _549 = _501 + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = _501 + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _557 = _501 + _555;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _561 = 1.0 / _517;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = _501 + _563;
    float _567 = _549 * _525;
    bool _569 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _571 = isnan(_501);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = 1.0 / _523;
    float _583 = _553 * _543;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _585;
    float _589 = -_579;
    float _591 = _589 + 1.0;
    float _593 = fma(_587, _545, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _595 = _557 * _561;
    bool _597 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _599 = isnan(_501);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_607;
    float _611 = _609 + 1.0;
    float _613 = _565 * _581;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _619;
    float _623 = _541 * _611;
    bool _625 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _627 = isnan(_501);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_617, _545, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _639 = fma(_621, _545, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _641 = _607 * _591;
    bool _643 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _645 = isnan(_501);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _659 = -_541;
    float _661 = _659 + 1.0;
    bool _663 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _665 = isnan(_501);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _683 = _653 * _661;
    float _685 = -_653;
    float _687 = _685 + 1.0;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_677, _567, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _695 = fma(_657, _567, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _697 = fma(_681, _567, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _699 = _673 * _687;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _709;
    float _713 = _635 * _691;
    float _715 = fma(_703, _583, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _717 = fma(_707, _583, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _719 = fma(_711, _583, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _721 = _637 * _713;
    float _723 = _593 * _713;
    float _725 = _639 * _713;
    float _727 = -_635;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].x, _721);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].y, _723);
    float _747 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].z, _725);
    float _749 = fma(_733, _595, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _751 = fma(_737, _595, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _753 = fma(_741, _595, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _755 = fma(_697, _699, _747);
    float _757 = fma(_693, _699, _743);
    float _759 = fma(_695, _699, _745);
    float _761 = fma(_715, _683, _757);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _763;
    float _767 = fma(_717, _683, _759);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _769;
    float _773 = fma(_719, _683, _755);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _775;
    float _779 = fma(_765, _613, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _781 = fma(_771, _613, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _783 = fma(_749, _623, _761);
    float _785 = fma(_777, _613, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _787 = fma(_751, _623, _767);
    float _789 = fma(_753, _623, _773);
    float _791 = fma(_779, _641, _783);
    float _793 = fma(_781, _641, _787);
    float _795 = fma(_785, _641, _789);
    float _797 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].x, _791);
    float _799 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].y, _793);
    float _801 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].z, _795);
    float _803 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = in.m_56.x;
    float _807 = in.m_56.y;
    float _809 = _799 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _811 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _815 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _815;
    out.m_58.y = _817;
    out.m_58.z = _819;
    out.m_58.w = _813;
    float _821 = _471 * _807;
    float _823 = _469 * _805;
    bool _825 = !_559;
    float _845;
    float _847;
    if (!_825)
    {
        float _827 = in.m_54.x;
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _831 = float(_87);
        float _833 = _827 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _837 = _835 * _829;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = _831;
        _849 = true;
    }
    else
    {
        float _851 = float(_87);
        float _853 = 1.0 / _851;
        float _855 = _121 * _853;
        _845 = _855;
        _847 = _851;
    }
    _849 = false;
    float _857 = _845;
    float _859 = _847;
    float _861 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _863 = int(_861);
    float _865 = in.m_54.x;
    float _867 = in.m_54.y;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _871 = _857 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _875 = _857 + _873;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _879 = _877 != 0;
    float _881 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _883 = int(_881);
    bool _885 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _887 = isnan(_857);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    bool _897 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _899 = isnan(_857);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = 1.0 / _859;
    float _911 = float(_863);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _913;
    bool _917 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _919 = isnan(_857);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = 1.0 / _911;
    float _931 = float(uint(_883));
    float _933 = _867 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _935 = ~_883;
    int _937 = _935 + 1;
    float _939 = _867 * 2.0;
    int _941 = ~_883;
    int _943 = _941 + 1;
    float _945 = -_927;
    float _947 = _945 + 1.0;
    int _949 = ~_883;
    int _951 = _949 + 1;
    float _953 = 1.0 / _931;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _957 = _929 * _121;
    float _959 = floor(_939);
    int _961 = as_type<int>(_953) + (-2);
    float _963 = trunc(_957);
    int _965 = int(_963);
    float _967 = float(uint(_965));
    float _969 = as_type<float>(_961) * _967;
    float _971 = trunc(_969);
    float _973 = precise::max(_971, 0.0);
    uint _976 = uint(_973);
    int _978 = _937 * int(_976);
    int _980 = _978 + _965;
    float _982 = float(uint(_980));
    float _984 = float(_965);
    float _986 = as_type<float>(_961) * _982;
    float _988 = float(_883);
    bool _990 = _984 >= _988;
    bool _992 = isnan(_984);
    bool _994 = _990 || _992;
    bool _996 = isnan(_988);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = trunc(_986);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_879;
    float _1010 = _1008 ? 7.345489978790283203125 : 1.0;
    float _1012 = _1010 * _865;
    int _1014 = int(_976) + int(_1006);
    int _1016 = _943 * _1014;
    int _1018 = _1016 + _965;
    float _1020 = trunc(_1000);
    int _1022 = int(_1020);
    bool _1024 = uint(_1018) >= uint(_883);
    bool _1026 = !_1024;
    int _1028 = _1026 ? 0 : (-1);
    float _1030 = floor(_1012);
    bool _1032 = _883 == 0;
    int _1034 = ~_1014;
    int _1036 = _1034 + _1028;
    int _1038 = _1036 + 1;
    int _1040 = _883 * _1038;
    int _1042 = _1040 + _965;
    int _1044 = ~_1022;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    bool _1050 = !_1032;
    int _1052 = _1050 ? _1042 : (-1);
    float _1054 = -_1030;
    float _1056 = _1012 + _1054;
    int _1058 = _883 + (-1);
    int _1060 = _1052 * _1048;
    float _1062 = _1056 * _988;
    float _1064 = _988 * _121;
    int _1066 = _1022 * _1058;
    int _1068 = _1066 + _1060;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1080 = _1078 != 0;
    float _1082 = trunc(_1062);
    int _1084 = int(_1082);
    float _1086 = _1064 * _909;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1090 = _1088 != 0;
    bool _1092 = !_1076;
    int _1094 = _1092 ? 0 : 1;
    bool _1096 = !_1072;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = trunc(_1086);
    int _1102 = int(_1100);
    int _1104 = abs(_1094);
    bool _1106 = !_1080;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1068 * _1104;
    int _1116 = abs(_1098);
    int _1118 = abs(_1108);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1122 = _1120 != 0;
    int _1124 = abs(_1112);
    bool _1126 = !_1122;
    int _1128 = _1126 ? 0 : 1;
    int _1130 = _1084 * _1124;
    int _1132 = _1130 + _965;
    int _1134 = _1102 * _1116;
    int _1136 = _1134 + _1114;
    int _1138 = abs(_1128);
    int _1140 = ~_883;
    int _1142 = _1140 + 1;
    int _1144 = _1132 * _1118;
    int _1146 = _1144 + _1136;
    float _1148 = float(uint(_1132));
    int _1150 = _1084 * _1138;
    int _1152 = _1150 + _1146;
    float _1154 = as_type<float>(_961) * _1148;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1160 = float(uint(_1152));
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1166;
    float _1170 = trunc(_1154);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = as_type<float>(_961) * _1160;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1186 = _1184 != 0;
    float _1188 = trunc(_1176);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1194;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1200 = _1198 != 0;
    int _1202 = _951 * int(_1174);
    int _1204 = _1202 + _1132;
    int _1206 = ~_883;
    int _1208 = _1206 + 1;
    float _1210 = 1.0 / _1158;
    float _1212 = float(uint(_1204));
    int _1214 = _1142 * int(_1192);
    int _1216 = _1214 + _1152;
    float _1218 = 1.0 / _1168;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = _865 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1224 = float(uint(_1216));
    float _1226 = as_type<float>(_961) * _1212;
    float _1228 = fma(_933, -2.0, _1220);
    float _1230 = -_1182;
    float _1232 = fma(_1222, 2.0, _1230);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1236 = _857 + _1234;
    float _1238 = as_type<float>(_961) * _1224;
    float _1240 = 1.0 / _1180;
    float _1242 = _1236 * _1210;
    float _1244 = trunc(_1238);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = trunc(_1226);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = _871 * _1240;
    int _1258 = int(_1192) + int(_1248);
    float _1260 = 1.0 / _1164;
    int _1262 = _1208 * _1258;
    int _1264 = _1262 + _1152;
    int _1266 = int(_1174) + int(_1254);
    bool _1268 = uint(_1264) >= uint(_883);
    float _1270 = in.m_42.x;
    float _1272 = in.m_42.y;
    float _1274 = in.m_42.z;
    bool _1276 = !_1268;
    int _1278 = _1276 ? 0 : (-1);
    int _1280 = ~_1258;
    int _1282 = _1280 + _1278;
    int _1284 = _1282 + 1;
    float _1286 = 1.0 / _1196;
    int _1288 = _883 * _1284;
    int _1290 = _1288 + _1152;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1294 = _857 + _1292;
    bool _1296 = !_1032;
    int _1298 = _1296 ? _1290 : (-1);
    float _1300 = _1294 * _1260;
    float _1302 = in.m_54.z;
    int _1304 = _1298 & 3;
    bool _1306 = _1304 != 0;
    float _1308 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1310 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1312 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1314 = _875 * _1286;
    float _1316 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1308);
    float _1318 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1310);
    float _1320 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1312);
    int _1322 = _1298 >> 31;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1326 = _857 + _1324;
    int _1328 = ~_883;
    int _1330 = _1328 + 1;
    float _1332 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1318);
    int _1334 = _1322 & 3;
    float _1336 = _1326 * _1218;
    int _1338 = _1298 & 3;
    bool _1340 = _1338 != 0;
    int _1342 = _1330 * _1266;
    int _1344 = _1342 + _1132;
    int _1346 = _1298 + _1334;
    float _1348 = _865 * 2.0;
    bool _1350 = uint(_1338) > 1u;
    float _1352 = _867 + _865;
    int _1354 = _1346 >> 2;
    float _1356 = floor(_1348);
    int _1358 = _1306 ? 0 : 1;
    float _1360 = _1352 + (-1.0);
    int _1362 = _1354 << 4;
    int _1364 = _1362 + 368;
    bool _1366 = uint(_1344) >= uint(_883);
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _1370 = uint(int(uint(_1364) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    int _1386 = ~_1358;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = _867 + _1302;
    bool _1394 = !_1366;
    int _1396 = _1394 ? 0 : (-1);
    bool _1398 = _1338 != 3;
    float _1400 = _1392 + (-1.0);
    int _1402 = _1390;
    if (!_1350)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1402 = _1406;
    }
    int _1408 = _1402;
    int _1410 = _1364 + 8;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    bool _1428 = uint(_1338) >= 2u;
    float _1430 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1432 = ~_1266;
    int _1434 = _1432 + _1396;
    int _1436 = _1434 + 1;
    int _1438 = _1428 ? 0 : 1;
    bool _1440 = _1356 >= 0.0;
    bool _1442 = isnan(_1356);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    int _1450 = _883 * _1436;
    int _1452 = _1450 + _1132;
    int _1454 = ~_1438;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    int _1460 = _1458;
    if (_1398)
    {
        int _1462 = ~_1438;
        int _1464 = _1462 + 1;
        _1460 = _1464;
    }
    int _1466 = _1460;
    bool _1468 = !_1186;
    int _1470 = _1468 ? 0 : 1;
    bool _1472 = _959 >= 0.0;
    bool _1474 = isnan(_959);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    int _1482 = _1448 ? 0 : 1;
    bool _1484 = _1356 > 0.0;
    float _1486 = _1302 * 2.0;
    bool _1488 = _959 > 0.0;
    int _1490 = abs(_1408);
    bool _1492 = !_1340;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = floor(_1486);
    int _1498 = _1480 ? 0 : 1;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1510 = _1508 != 0;
    int _1512 = abs(_1494);
    bool _1514 = !_1032;
    int _1516 = _1514 ? _1452 : (-1);
    int _1518 = ~_1490;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    bool _1524 = _1338 != 3;
    int _1526 = _1522 * as_type<int>(_1384);
    int _1528 = abs(_1466);
    int _1530 = ~_1512;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    float _1536 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1538 = int(_1536);
    bool _1540 = !_1524;
    int _1542 = _1540 ? 0 : (-1);
    int _1544 = ~_1482;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    int _1550 = _1534 * as_type<int>(_1376);
    int _1552 = _1550 + _1526;
    int _1554 = _1548;
    if (!_1484)
    {
        int _1556 = ~_1482;
        int _1558 = _1556 + 1;
        _1554 = _1558;
    }
    int _1560 = _1554;
    float _1562 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1316);
    int _1564 = ~_1528;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1320);
    int _1572 = ~_1498;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    bool _1578 = _1496 > 0.0;
    int _1580 = _1568 * as_type<int>(_1418);
    int _1582 = _1580 + _1552;
    bool _1584 = _1496 >= 0.0;
    bool _1586 = isnan(_1496);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.0);
    bool _1592 = _1588 || _1590;
    int _1594 = abs(_1542);
    int _1596 = _1576;
    if (!_1488)
    {
        int _1598 = ~_1498;
        int _1600 = _1598 + 1;
        _1596 = _1600;
    }
    int _1602 = _1596;
    float _1604 = float(uint(_1538));
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1606;
    int _1610 = abs(_1470);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1612;
    int _1616 = ~_1594;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1622;
    float _1626 = 1.0 / _1604;
    int _1628 = ~_1610;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    float _1634 = fma(_1608, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1636 = _1620 * as_type<int>(_1426);
    int _1638 = _1636 + _1582;
    float _1640 = fma(_1614, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1642 = fma(_1624, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1652 = _1638 * _1632;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1658 = fma(_1646, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1660 = fma(_1650, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1662 = _1516 * _1610;
    int _1664 = _1662 + _1652;
    float _1666 = fma(_1656, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1668;
    int _1672 = as_type<int>(_1626) + (-2);
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1674;
    int _1678 = abs(_1538);
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1680;
    float _1684 = fma(_1670, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1686 = fma(_1676, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1688 = float(uint(_1664));
    float _1690 = fma(_1682, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1692 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1694 = log2(_1692);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1700 = as_type<float>(_1672) * _1688;
    float _1702 = float(uint(_1678));
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1712 = trunc(_1700);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    float _1718 = fma(_1698, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1720 = fma(_1706, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1722;
    int _1726 = abs(_1664);
    float _1728 = fma(_1710, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1730;
    int _1734 = ~_1538;
    int _1736 = _1734 + 1;
    float _1738 = 1.0 / _1702;
    float _1740 = _1694 * _121;
    float _1742 = fma(_1724, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1744 = fma(_1732, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1746 = fma(_915, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _1748 = _1592 ? 0 : 1;
    float _1750 = float(uint(_1726));
    int _1752 = _1736 * int(_1716);
    int _1754 = _1752 + _1664;
    float _1756 = exp2(_1740);
    bool _1758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1766 = _1762 || _1764;
    bool _1768 = _1538 == 0;
    float _1770 = float(uint(_1754));
    int _1772 = as_type<int>(_1738) + (-2);
    bool _1774 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1776 = isnan(_857);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = as_type<float>(_1672) * _1770;
    bool _1788 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1790 = isnan(_857);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = as_type<float>(_1772) * _1750;
    bool _1802 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1804 = isnan(_857);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = -_1784;
    float _1816 = _1814 + 1.0;
    float _1818 = trunc(_1786);
    float _1820 = precise::max(_1818, 0.0);
    uint _1822 = uint(_1820);
    float _1824 = _1812 * _1816;
    float _1826 = -_1812;
    float _1828 = _1826 + 1.0;
    int _1830 = ~_1678;
    int _1832 = _1830 + 1;
    float _1834 = _927 * _1828;
    float _1836 = trunc(_1800);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1844 = 1.0 + _1842;
    float _1846 = -_1756;
    float _1848 = _1846 + 1.0;
    float _1850 = _907 * _947;
    float _1852 = -_907;
    float _1854 = _1852 + 1.0;
    float _1856 = _1766 ? _1848 : 0.0;
    float _1858 = 1.0 / _1844;
    bool _1860 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1862 = isnan(1.0);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1868 = _1864 || _1866;
    int _1870 = int(_1716) + int(_1822);
    int _1872 = _1832 * int(_1840);
    int _1874 = _1872 + _1726;
    float _1876 = float(uint(_1874));
    float _1878 = _895 * _1854;
    float _1880 = -_895;
    float _1882 = _1880 + 1.0;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1886 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[78].z, _955);
    float _1888 = as_type<float>(_1772) * _1876;
    float _1890 = _1798 * _1882;
    float _1892 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1884);
    float _1894 = -_121;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1232);
    float _1898 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1886);
    float _1900 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    float _1902 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1892);
    if (_1868)
    {
        float _1904 = _1856 * _1858;
        _125 = _1904;
    }
    float _1906 = _125;
    float _1908 = -_1798;
    float _1910 = _1908 + 1.0;
    float _1912 = _1634 * _1890;
    float _1914 = trunc(_1888);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1640 * _1890;
    float _1922 = _1642 * _1890;
    float _1924 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1912);
    int _1926 = ~_1748;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1920);
    float _1934 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1922);
    float _1936 = fma(_1658, _1878, _1924);
    int _1938 = _1930;
    if (!_1578)
    {
        int _1940 = ~_1748;
        int _1942 = _1940 + 1;
        _1938 = _1942;
    }
    int _1944 = _1938;
    float _1946 = fma(_1660, _1878, _1932);
    float _1948 = fma(_1666, _1878, _1934);
    bool _1950 = !_1502;
    int _1952 = _1950 ? 0 : 1;
    float _1954 = fma(_1684, _1850, _1936);
    int _1956 = ~_1678;
    int _1958 = _1956 + 1;
    float _1960 = fma(_1686, _1850, _1946);
    int _1962 = abs(_1952);
    float _1964 = fma(_1718, _1834, _1954);
    int _1966 = int(_1840) + int(_1918);
    float _1968 = fma(_1720, _1834, _1960);
    float _1970 = fma(_1742, _1824, _1964);
    int _1972 = ~_1538;
    int _1974 = _1972 + 1;
    int _1976 = _1958 * _1966;
    int _1978 = _1976 + _1726;
    float _1980 = float(_1560);
    float _1982 = fma(_1690, _1850, _1948);
    float _1984 = float(_1962);
    int _1986 = _1974 * _1870;
    int _1988 = _1986 + _1664;
    float _1990 = float(_1944);
    float _1992 = fma(_1728, _1834, _1982);
    bool _1994 = !_1506;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = fma(_1744, _1824, _1968);
    bool _2000 = uint(_1978) >= uint(_1678);
    float _2002 = _1984 * _1990;
    int _2004 = abs(_1996);
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2008 = uint(_1988) >= uint(_1538);
    float _2010 = fma(_1746, _1824, _1992);
    bool _2012 = !_2000;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = -_1898;
    float _2018 = _2016 + 1.0;
    float _2020 = float(_2004);
    float _2022 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1970);
    bool _2024 = !_2008;
    int _2026 = _2024 ? 0 : (-1);
    float _2028 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1998);
    int _2030 = ~_2014;
    int _2032 = _1966 + _2030;
    int _2034 = _2032 + 1;
    float _2036 = _1562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2038 = _1664 ^ _1538;
    float _2040 = _2020 * _1980;
    int _2042 = ~_1870;
    int _2044 = _2042 + _2026;
    int _2046 = _2044 + 1;
    float _2048 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2050 = _1570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    uint _2052 = uint(int(uint(_2038) >> uint(31)));
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2056 = _2036 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2060 = _2048 + _2058;
    float _2062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2064 = ~int(_2052);
    int _2066 = _2064 + 1;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2050 + _2068;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2074 = _1538 == 0;
    int _2076 = _1538 * _2046;
    int _2078 = _2076 + _1664;
    int _2080 = _2034 ^ _2066;
    float _2082 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2072);
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2086 = _2084 != 0;
    float _2088 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2090 = ~_2066;
    int _2092 = _2090 + _2080;
    int _2094 = _2092 + 1;
    float _2096 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2082);
    bool _2098 = !_2074;
    int _2100 = _2098 ? _2078 : (-1);
    float _2102 = _2060 * _2060;
    bool _2104 = !_1768;
    int _2106 = _2104 ? _2094 : (-1);
    bool _2108 = _865 > 0.5;
    float _2110 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2112 = _867 > 0.5;
    float _2114 = fma(_2056, _2056, _2102);
    bool _2116 = _2096 >= 0.0;
    float _2118 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2120 = -_181;
    int _2122 = _2108 ? as_type<int>(_2120) : as_type<int>(_181);
    float _2124 = -_185;
    int _2126 = _2112 ? as_type<int>(_2124) : as_type<int>(_185);
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2130 = float(_2106);
    float _2132 = float(_2100);
    bool _2134 = !_2086;
    float _2136 = _2134 ? _181 : as_type<float>(_2122);
    float _2138 = -_1900;
    float _2140 = fma(_2110, _2130, _2138);
    bool _2142 = !_1200;
    float _2144 = _2142 ? _185 : as_type<float>(_2126);
    float _2146 = fma(_2088, _2132, _1896);
    float _2148 = as_type<float>(_2046);
    if (_2116)
    {
        _2148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2150 = _2148;
    float _2152 = _2136 + 0.5;
    if (_2116)
    {
        out.m_45.x = 0.0;
    }
    float _2154 = _2144 + (-0.5);
    float _2156 = fma(_2088, _2152, _2146);
    float _2158 = -_2110;
    float _2160 = fma(_2158, _2154, _2140);
    float _2162 = -_1902;
    float _2164 = _2162 + 1.0;
    float _2166 = in.m_60.x;
    float _2168 = in.m_60.y;
    float _2170 = in.m_60.z;
    float _2172 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2010);
    float _2174 = -_2018;
    float _2176 = fma(_2136, _2174, _2156);
    float _2178 = fma(_2144, _2164, _2160);
    float _2180 = fma(_2070, _2070, _2114);
    float _2182 = _2002 * (-2.0);
    float _2184 = _2028 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2186 = _2172 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2188 = as_type<int>(_2172);
    if (_2116)
    {
        float _2190 = _2150 * 5.0;
        _2188 = as_type<int>(_2190);
    }
    int _2192 = _2188;
    float _2194 = rsqrt(_2180);
    float _2196 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2200 = fma(_1368, _2182, _1368);
    if (_2116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6292 = as_type<float>(_2192);
        out.gl_Position.z = _6292;
    }
    out.m_62.x = _2128;
    out.m_62.y = _2196;
    out.m_62.z = _2198;
    out.m_64.x = _2176;
    out.m_64.y = _2178;
    float _2202 = fma(_2182, _2166, _2166);
    float _2204 = _2040 * (-2.0);
    bool _2206 = !_1510;
    int _2208 = _2206 ? 0 : 1;
    float _2210 = _2060 * _2194;
    float _2212 = fma(_1430, _2204, _1430);
    float _2214 = _2056 * _2194;
    float _2216 = _2170;
    if (_2116)
    {
        return out;
    }
    float _2218 = -_2210;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2222 = fma(_2204, _2168, _2168);
    float _2224 = _865 + (-0.5);
    float _2226 = -_2214;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2036);
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2232 = _2220 + _2230;
    float _2234 = _867 + (-0.5);
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2202);
    float _2238 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2240 = _2228 + _2238;
    float _2242 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2222);
    float _2246 = _2070 * _2194;
    int _2248 = abs(_2208);
    float _2250 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2242);
    float _2252 = -_2210;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2256 = -_2246;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2050);
    float _2260 = -_2214;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2264 = float(_1602);
    float _2266 = _2254 * _2254;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2270 = _2258 + _2268;
    float _2272 = float(_2248);
    float _2274 = -_2246;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2070);
    float _2278 = fma(_2262, _2262, _2266);
    float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2250);
    float _2282 = _1302 + _865;
    float _2284 = _2272 * _2264;
    float _2286 = fma(_2276, _2276, _2278);
    bool _2288 = _2280 >= 0.0;
    float _2290 = _2282 + (-1.0);
    float _2292 = _2284 * (-2.0);
    float _2294 = sqrt(_2286);
    float _2296 = _1302 + (-0.5);
    float _2298 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2300 = fma(_2292, _2170, _2170);
    float _2302 = fma(_2200, _1906, _2236);
    float _2304 = fma(_2212, _1906, _2244);
    float _2306 = fma(_2298, _2292, _2298);
    float _2308 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2300);
    float _2310 = _2302 * 0.15915493667125701904296875;
    float _2312 = _2304 * 0.15915493667125701904296875;
    if (_2288)
    {
        _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2314 = _2216;
    float _2316 = fma(_2306, _1906, _2308);
    float _2318 = _2310 * 6.283185482025146484375;
    float _2320 = sin(_2318);
    int _2322 = as_type<int>(_2314);
    if (_2288)
    {
        out.m_45.x = 0.0;
    }
    float _2324 = _2316 * 0.15915493667125701904296875;
    float _2326 = _2194 * _2294;
    if (_2288)
    {
        float _2328 = _2314 * 5.0;
        _2322 = as_type<int>(_2328);
    }
    int _2330 = _2322;
    float _2332 = _2310 * 6.283185482025146484375;
    float _2334 = cos(_2332);
    if (_2288)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6534 = as_type<float>(_2330);
        out.gl_Position.z = _6534;
    }
    float _2336 = _2312 * 6.283185482025146484375;
    float _2338 = sin(_2336);
    float _2340 = _2312 * 6.283185482025146484375;
    float _2342 = cos(_2340);
    float _2344 = _2324 * 6.283185482025146484375;
    float _2346 = sin(_2344);
    if (_2288)
    {
        return out;
    }
    float _2348 = _2324 * 6.283185482025146484375;
    float _2350 = cos(_2348);
    float _2352 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2356 = _823 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2358 = _2320 * _2338;
    float _2360 = _2326 * _2352;
    float _2362 = _2334 * _2342;
    float _2364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2366 = _2326 * _2356;
    float _2368 = _2354 * _2360;
    float _2370 = fma(_2346, _2362, _2358);
    float _2372 = _2334 * _2338;
    float _2374 = _2364 * _2366;
    float _2376 = fma(_2346, _2358, _2362);
    float _2378 = _2350 * _2368;
    float _2380 = _2338 * _2350;
    float _2382 = -_2368;
    float _2384 = _2346 * _2382;
    float _2386 = _2334 * _2378;
    float _2388 = _2342 * _2350;
    float _2390 = _2320 * _2342;
    float _2392 = _2320 * _2378;
    float _2394 = fma(_2370, _2374, _2386);
    float _2396 = _2326 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2398 = _2396 * 0.5;
    float _2400 = -_2390;
    float _2402 = fma(_2346, _2372, _2400);
    float _2404 = -_2372;
    float _2406 = fma(_2346, _2390, _2404);
    float _2408 = fma(_2388, _2374, _2384);
    float _2410 = fma(_2402, _2398, _2394);
    float _2412 = fma(_2406, _2374, _2392);
    float _2414 = fma(_2380, _2398, _2408);
    float _2416 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2418 = fma(_2376, _2398, _2412);
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2422 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2416);
    float _2424 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2420);
    float _2426 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2422);
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2424);
    float _2430 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2432 = _2428 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2434 = _2050 + _2430;
    float _2436 = _2036 + _2432;
    float _2438 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2442 = _2434 + _2440;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2446 = _2436 + _2444;
    float _2448 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2438);
    float _2450 = _2442 * _2442;
    float _2452 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2448);
    float _2454 = fma(_2446, _2446, _2450);
    float _2456 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2458 = sqrt(_2454);
    float _2460 = _2048 + _2456;
    bool _2462 = _2458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2464 = _2450;
    float _2466 = _2438;
    float _2468 = _2436;
    float _2470 = _2434;
    float _2472 = _2410;
    float _2474 = _2454;
    if (!_2462)
    {
        _2464 = _2436;
    }
    float _2476 = _2464;
    float _2478 = _2476;
    if (!_2462)
    {
        _2466 = _2434;
    }
    float _2480 = _2466;
    float _2482 = _2480;
    if (!_2462)
    {
        _2468 = _2460;
    }
    float _2484 = _2468;
    bool _2486 = !_2462;
    float _2488 = _2484;
    if (!_2486)
    {
        float _2490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2494 = _2458 + _2492;
        float _2496 = rsqrt(_2454);
        float _2498 = _2494 * _2490;
        float _2500 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2502 = _2498 * 0.15915493667125701904296875;
        float _2504 = _2502 * 6.283185482025146484375;
        float _2506 = cos(_2504);
        float _2508 = _2502 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = _2506 + (-1.0);
        float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2516 = fma(_2510, _2500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2518 = fma(_2460, _2506, _2514);
        float _2520 = _2496 * _2516;
        float _2522 = fma(_2446, _2520, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2524 = fma(_2442, _2520, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2488 = _2518;
        _2478 = _2522;
        _2482 = _2524;
    }
    float _2526 = _2488;
    float _2528 = _2478;
    float _2530 = _2482;
    float _2532 = -_2048;
    float _2534 = _2532 + _2526;
    float _2536 = -_2036;
    float _2538 = _2536 + _2528;
    float _2540 = -_2050;
    float _2542 = _2540 + _2530;
    float _2544 = _2534 * _2534;
    float _2546 = fma(_2538, _2538, _2544);
    float _2548 = fma(_2542, _2542, _2546);
    float _2550 = sqrt(_2548);
    bool _2552 = _2550 > 0.0;
    bool _2554 = !_2552;
    float _2556 = _2526;
    float _2558 = _2528;
    float _2560 = _2530;
    if (!_2554)
    {
        float _2562 = _177 * _177;
        float _2564 = fma(_175, _175, _2562);
        float _2566 = fma(_173, _173, _2564);
        float _2568 = rsqrt(_2548);
        float _2570 = sqrt(_2566);
        float _2572 = _2538 * _2568;
        float _2574 = _2534 * _2568;
        float _2576 = _2542 * _2568;
        bool _2578 = _2570 > 0.0;
        bool _2580 = !_2578;
        _2472 = _2570;
        _2474 = _2576;
        if (!_2580)
        {
            float _2582 = rsqrt(_2566);
            float _2584 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2586 = _177 * _2582;
            float _2588 = _175 * _2582;
            float _2590 = _173 * _2582;
            float _2592 = _2574 * _2586;
            float _2594 = fma(_2572, _2588, _2592);
            float _2596 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2598 = fma(_2576, _2590, _2594);
            float _2600 = _2598 * _2596;
            float _2602 = fma(_175, _2600, _2528);
            float _2604 = fma(_177, _2600, _2526);
            float _2606 = fma(_173, _2600, _2530);
            _2556 = _2604;
            _2558 = _2602;
            _2560 = _2606;
            _2470 = _2584;
            _2472 = _2586;
        }
    }
    float _2608 = _2556;
    float _2610 = _2558;
    float _2612 = _2560;
    float _2614 = _2470;
    float _2616 = _2472;
    float _2618 = _2474;
    float _2620 = -_2210;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2608);
    float _2624 = -_2214;
    float _2626 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2610);
    float _2628 = -_2246;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2612);
    float _2632 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2634 = _2622 + _2632;
    float _2636 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2638 = _2626 + _2636;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2642 = _2630 + _2640;
    float _2644 = _2634 * _2634;
    float _2646 = fma(_2638, _2638, _2644);
    float _2648 = fma(_2642, _2642, _2646);
    float _2650 = rsqrt(_2648);
    float _2652 = sqrt(_2648);
    float _2654 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2656 = _2638 * _2654;
    float _2658 = _2642 * _2654;
    float _2660 = _2656 * _2656;
    float _2662 = _2658 * _2658;
    float _2664 = _2660 + _2662;
    float _2666 = sqrt(_2664);
    bool _2668 = _2666 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2672 = _2666 + _2670;
    float _2674 = _2642;
    float _2676 = _2616;
    float _2678 = _2672;
    float _2680 = _2614;
    float _2682 = _2618;
    float _2684 = _2654;
    float _2686 = _2656;
    if (_2668)
    {
        float _2688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2674 = _2688;
    }
    float _2690 = _2674;
    if (_2668)
    {
        float _2692 = rsqrt(_2664);
        _2676 = _2692;
    }
    float _2694 = _2676;
    float _2696 = _2694;
    if (_2668)
    {
        float _2698 = _2672 * _2690;
        _2678 = _2698;
    }
    float _2700 = _2678;
    if (_2668)
    {
        float _2702 = _2700 * 0.15915493667125701904296875;
        _2680 = _2702;
    }
    float _2704 = _2680;
    float _2706 = _2644;
    if (_2668)
    {
        float _2708 = _2704 * 6.283185482025146484375;
        float _2710 = sin(_2708);
        _2706 = _2710;
    }
    float _2712 = _2706;
    float _2714 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2716 = precise::max(0.0, _2714);
    float _2718 = _2650;
    float _2720 = _2716;
    float _2722 = _2714;
    if (_2668)
    {
        float _2724 = _2704 * 6.283185482025146484375;
        float _2726 = cos(_2724);
        _2718 = _2726;
    }
    float _2728 = _2718;
    float _2730 = -_2654;
    float _2732 = -_2716;
    float _2734 = fma(_2634, _2730, _2732);
    if (!_2668)
    {
        _2720 = _2658;
    }
    float _2736 = _2720;
    float _2738 = _2736;
    if (_2668)
    {
        float _2740 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2722 = _2740;
    }
    float _2742 = _2722;
    float _2744 = _2712;
    float _2746 = _2742;
    if (_2668)
    {
        float _2748 = fma(_2712, _2742, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2744 = _2748;
    }
    float _2750 = _2744;
    float _2752 = _2750;
    if (_2668)
    {
        float _2754 = _2728 + (-1.0);
        _2746 = _2754;
    }
    float _2756 = _2746;
    float _2758 = _2756;
    if (_2668)
    {
        float _2760 = _2694 * _2750;
        _2682 = _2760;
    }
    float _2762 = _2682;
    if (!_2668)
    {
        _2696 = _2734;
    }
    float _2764 = _2696;
    float _2766 = _2764;
    if (_2668)
    {
        float _2768 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2684 = _2768;
    }
    float _2770 = _2684;
    if (_2668)
    {
        float _2772 = _2656 * _2762;
        _2686 = _2772;
    }
    float _2774 = _2686;
    if (!_2668)
    {
        _2752 = _2660;
    }
    float _2776 = _2752;
    float _2778 = _2776;
    if (_2668)
    {
        float _2780 = _2658 * _2762;
        _2738 = _2780;
    }
    float _2782 = _2738;
    if (_2668)
    {
        float _2784 = fma(_2734, _2728, _2770);
        _2766 = _2784;
    }
    float _2786 = _2766;
    if (_2668)
    {
        float _2788 = _2774 * _2774;
        _2778 = _2788;
    }
    float _2790 = _2778;
    if (!_2668)
    {
        _2758 = _2662;
    }
    float _2792 = _2758;
    float _2794 = _2792;
    if (_2668)
    {
        float _2796 = _2782 * _2782;
        _2794 = _2796;
    }
    float _2798 = _2794;
    float _2800 = fma(_2786, _2786, _2790);
    float _2802 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2804 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2806 = _2800 + _2798;
    float _2808 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2802);
    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2812 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2810);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2818 = rsqrt(_2806);
    float _2820 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2808);
    float _2822 = -_2814;
    float _2824 = _2822 + 1.0;
    float _2826 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2816);
    float _2828 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2804);
    float _2830 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2832 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2834 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2826);
    float _2836 = abs(_2824);
    float _2838 = log2(_2836);
    float _2840 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2842 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2844 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2828);
    float _2846 = _2834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2848 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2840);
    float _2850 = -_2842;
    float _2852 = fma(_2850, _2832, 1.0);
    float _2854 = _2844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2856 = _2818 * _2774;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2860 = _2818 * _2786;
    float _2862 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2848);
    float _2864 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2866 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2858);
    float _2868 = _2818 * _2782;
    float _2870 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2872 = -_2864;
    float _2874 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2872);
    float _2876 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2866);
    float _2878 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2880 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2882 = -_2868;
    float _2884 = fma(_2882, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2874);
    float _2886 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2876);
    float _2888 = log2(_2852);
    float _2890 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2892 = fma(_2884, -0.5, 0.5);
    float _2894 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2880);
    float _2896 = fma(_2884, 0.5, 0.5);
    float _2898 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2890);
    float _2900 = _2860 + 1.0;
    float _2902 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2894);
    float _2904 = exp2(_2878);
    float _2906 = fma(_2896, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2908 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2898);
    float _2910 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2902);
    float _2912 = fma(_2896, _2906, -0.212114393711090087890625);
    float _2914 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2908);
    float _2916 = 1.0 / _2886;
    float _2918 = fma(_2896, _2912, 1.570728778839111328125);
    float _2920 = _2888 * 0.693147182464599609375;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2924 = sqrt(_2892);
    float _2926 = -_2860;
    float _2928 = fma(_2904, _2900, _2926);
    float _2930 = fma(_2928, 0.5, 0.5);
    float _2932 = _2910 * _2916;
    float _2934 = _2914 * _2916;
    float _2936 = fma(_2932, 0.5, 0.5);
    float _2938 = fma(_2934, -0.5, 0.5);
    float _2940 = _2924 * 0.636619746685028076171875;
    float3 _7516 = float3(_2936, _2938, _2922);
    float _2942 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7516, float3(0.0), isnan(_7516)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7516, float3(0.0), isnan(_7516)), level(0.0)).x;
    float3 _7527 = float3(_2936, _2938, _2922);
    float4 _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7527, float3(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7527, float3(0.0), isnan(_7527)), level(0.0)).xyzw;
    float _2947 = _2945.x;
    float _2949 = _2945.y;
    float _2951 = _2945.z;
    float _2953 = _2945.w;
    float _2955 = -_2918;
    float _2957 = fma(_2940, _2955, 1.0);
    float2 _7549 = float2(_2957, _2930);
    float3 _2961 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7549, float2(0.0), isnan(_7549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7549, float2(0.0), isnan(_7549)), level(0.0)).xyz;
    float _2963 = _2961.x;
    float _2965 = _2961.y;
    float _2967 = _2961.z;
    float _2969 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2971 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2973 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2971);
    float _2975 = exp2(_2969);
    float _2977 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2973);
    float _2979 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2977);
    float _2981 = _2979 + _2886;
    float _2983 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2910;
    out.gl_Position.y = _2914;
    out.gl_Position.z = _2979;
    out.gl_Position.w = _2886;
    float _2985 = _2981 * 0.5;
    float _2987 = -_2975;
    float _2989 = _2987 + 1.0;
    out.m_45.x = _2983;
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2985;
    out.m_66.w = _2886;
    float _2993 = _2991 * _2942;
    float _2995 = -_2991;
    float _2997 = _2995 + 1.0;
    float _2999 = _2953 * _2993;
    float _3001 = _2967 * _2993;
    float _3003 = fma(_2963, _2999, _2947);
    float _3005 = fma(_2965, _2999, _2949);
    float _3007 = _2953 * _2997;
    float _3009 = fma(_2953, _3001, _2951);
    out.m_68.x = _3003;
    out.m_68.y = _3005;
    out.m_68.z = _3009;
    out.m_68.w = _3007;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _849 = false;
    bool _493 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_42.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_45.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3066 = as_type<float>(_103);
        out.gl_Position.z = _3066;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_47.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3135 = as_type<float>(_141);
        out.gl_Position.z = _3135;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_52.x;
    float _147 = in.m_52.y;
    float _149 = in.m_52.z;
    int _151 = as_type<int>(_143) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_143) & 2;
    bool _157 = _155 != 0;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _167 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    float _169 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    float _171 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _165);
    float _173 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _167);
    float _175 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _169);
    float _177 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _171);
    bool _179 = !_153;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_157;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_159;
    float _205;
    if (!_187)
    {
        float _189 = in.m_54.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_87);
        float _211 = 1.0 / _209;
        float _213 = _121 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _215 + _217;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _235 = _233 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = 1.0 / _223;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _239;
    float _243 = 1.0 / _227;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _215 + _245;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = 1.0 / _235;
    float _253 = _247 * _237;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _215 + _255;
    bool _259 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _261 = isnan(_215);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_215);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _241;
    float _285 = _219 * _243;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _289 = _215 + _287;
    bool _291 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _293 = isnan(_215);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _231;
    float _305 = _289 * _251;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = fma(_309, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _319 = _215 + _317;
    float _321 = fma(_313, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = -_281;
    float _325 = _323 + 1.0;
    float _327 = _319 * _283;
    bool _329 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _331 = isnan(_215);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _257 * _303;
    bool _343 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_215);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_269;
    float _357 = _355 + 1.0;
    float _359 = _339 * _357;
    float _361 = -_353;
    float _363 = _361 + 1.0;
    float _365 = -_339;
    float _367 = _365 + 1.0;
    float _369 = _281 * _363;
    float _371 = _353 * _367;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _377 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _379 = isnan(_215);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _301 * _325;
    float _391 = -_301;
    float _393 = _391 + 1.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _399 = fma(_375, _285, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_387;
    float _403 = _401 + 1.0;
    float _405 = _387 * _393;
    float _407 = fma(_397, _285, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _321 * _405;
    float _419 = _315 * _405;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _425 = fma(_411, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _427 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _417);
    float _429 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _435 = fma(_407, _389, _427);
    float _437 = fma(_415, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _439 = fma(_399, _389, _429);
    float _441 = fma(_423, _305, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _443 = fma(_433, _305, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _445;
    float _449 = fma(_425, _369, _435);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _451;
    float _455 = fma(_437, _369, _439);
    float _457 = fma(_447, _327, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _459 = fma(_443, _371, _449);
    float _461 = fma(_453, _327, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _463 = fma(_441, _371, _455);
    float _465 = fma(_457, _359, _459);
    float _467 = fma(_461, _359, _463);
    float _469 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].x, _465);
    float _471 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[148].y, _467);
    bool _473 = !_249;
    float _491;
    if (!_473)
    {
        float _475 = in.m_54.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_87);
        float _497 = 1.0 / _495;
        float _499 = _121 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _503;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _519 = 1.0 / _505;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _521;
    float _525 = 1.0 / _509;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = _501 + _527;
    bool _531 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _533 = isnan(_501);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = 1.0 / _513;
    float _545 = _529 * _519;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _549 = _501 + _547;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = _501 + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _557 = _501 + _555;
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _561 = 1.0 / _517;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = _501 + _563;
    float _567 = _549 * _525;
    bool _569 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _571 = isnan(_501);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    float _581 = 1.0 / _523;
    float _583 = _553 * _543;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _585;
    float _589 = -_579;
    float _591 = _589 + 1.0;
    float _593 = fma(_587, _545, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _595 = _557 * _561;
    bool _597 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _599 = isnan(_501);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_607;
    float _611 = _609 + 1.0;
    float _613 = _565 * _581;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _619;
    float _623 = _541 * _611;
    bool _625 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _627 = isnan(_501);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_617, _545, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _639 = fma(_621, _545, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _641 = _607 * _591;
    bool _643 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _645 = isnan(_501);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _659 = -_541;
    float _661 = _659 + 1.0;
    bool _663 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _665 = isnan(_501);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _681 = _679 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _683 = _653 * _661;
    float _685 = -_653;
    float _687 = _685 + 1.0;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_677, _567, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _695 = fma(_657, _567, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _697 = fma(_681, _567, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _699 = _673 * _687;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _709;
    float _713 = _635 * _691;
    float _715 = fma(_703, _583, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _717 = fma(_707, _583, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _719 = fma(_711, _583, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _721 = _637 * _713;
    float _723 = _593 * _713;
    float _725 = _639 * _713;
    float _727 = -_635;
    float _729 = _727 + 1.0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].x, _721);
    float _745 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].y, _723);
    float _747 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[107].z, _725);
    float _749 = fma(_733, _595, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _751 = fma(_737, _595, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _753 = fma(_741, _595, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _755 = fma(_697, _699, _747);
    float _757 = fma(_693, _699, _743);
    float _759 = fma(_695, _699, _745);
    float _761 = fma(_715, _683, _757);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _763;
    float _767 = fma(_717, _683, _759);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _769;
    float _773 = fma(_719, _683, _755);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _775;
    float _779 = fma(_765, _613, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _781 = fma(_771, _613, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _783 = fma(_749, _623, _761);
    float _785 = fma(_777, _613, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _787 = fma(_751, _623, _767);
    float _789 = fma(_753, _623, _773);
    float _791 = fma(_779, _641, _783);
    float _793 = fma(_781, _641, _787);
    float _795 = fma(_785, _641, _789);
    float _797 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].x, _791);
    float _799 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].y, _793);
    float _801 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[112].z, _795);
    float _803 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = in.m_56.x;
    float _807 = in.m_56.y;
    float _809 = _799 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _811 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _815 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = _811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _815;
    out.m_58.y = _817;
    out.m_58.z = _819;
    out.m_58.w = _813;
    float _821 = _471 * _807;
    float _823 = _469 * _805;
    bool _825 = !_559;
    float _845;
    float _847;
    if (!_825)
    {
        float _827 = in.m_54.x;
        float _829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _831 = float(_87);
        float _833 = _827 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _837 = _835 * _829;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = _831;
        _849 = true;
    }
    else
    {
        float _851 = float(_87);
        float _853 = 1.0 / _851;
        float _855 = _121 * _853;
        _845 = _855;
        _847 = _851;
    }
    _849 = false;
    float _857 = _845;
    float _859 = _847;
    float _861 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _863 = int(_861);
    float _865 = in.m_54.x;
    float _867 = in.m_54.y;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _871 = _857 + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _875 = _857 + _873;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _879 = _877 != 0;
    float _881 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _883 = int(_881);
    bool _885 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _887 = isnan(_857);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    bool _897 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _899 = isnan(_857);
    bool _901 = _897 || _899;
    bool _903 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _905 = _901 || _903;
    float _907 = float(_905);
    float _909 = 1.0 / _859;
    float _911 = float(_863);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _913;
    bool _917 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _919 = isnan(_857);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = 1.0 / _911;
    float _931 = float(uint(_883));
    float _933 = _867 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _935 = ~_883;
    int _937 = _935 + 1;
    float _939 = _867 * 2.0;
    int _941 = ~_883;
    int _943 = _941 + 1;
    float _945 = -_927;
    float _947 = _945 + 1.0;
    int _949 = ~_883;
    int _951 = _949 + 1;
    float _953 = 1.0 / _931;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _957 = _929 * _121;
    float _959 = floor(_939);
    int _961 = as_type<int>(_953) + (-2);
    float _963 = trunc(_957);
    int _965 = int(_963);
    float _967 = float(uint(_965));
    float _969 = as_type<float>(_961) * _967;
    float _971 = trunc(_969);
    float _973 = precise::max(_971, 0.0);
    uint _976 = uint(_973);
    int _978 = _937 * int(_976);
    int _980 = _978 + _965;
    float _982 = float(uint(_980));
    float _984 = float(_965);
    float _986 = as_type<float>(_961) * _982;
    float _988 = float(_883);
    bool _990 = _984 >= _988;
    bool _992 = isnan(_984);
    bool _994 = _990 || _992;
    bool _996 = isnan(_988);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = trunc(_986);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_879;
    float _1010 = _1008 ? 7.345489978790283203125 : 1.0;
    float _1012 = _1010 * _865;
    int _1014 = int(_976) + int(_1006);
    int _1016 = _943 * _1014;
    int _1018 = _1016 + _965;
    float _1020 = trunc(_1000);
    int _1022 = int(_1020);
    bool _1024 = uint(_1018) >= uint(_883);
    bool _1026 = !_1024;
    int _1028 = _1026 ? 0 : (-1);
    float _1030 = floor(_1012);
    bool _1032 = _883 == 0;
    int _1034 = ~_1014;
    int _1036 = _1034 + _1028;
    int _1038 = _1036 + 1;
    int _1040 = _883 * _1038;
    int _1042 = _1040 + _965;
    int _1044 = ~_1022;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    bool _1050 = !_1032;
    int _1052 = _1050 ? _1042 : (-1);
    float _1054 = -_1030;
    float _1056 = _1012 + _1054;
    int _1058 = _883 + (-1);
    int _1060 = _1052 * _1048;
    float _1062 = _1056 * _988;
    float _1064 = _988 * _121;
    int _1066 = _1022 * _1058;
    int _1068 = _1066 + _1060;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1080 = _1078 != 0;
    float _1082 = trunc(_1062);
    int _1084 = int(_1082);
    float _1086 = _1064 * _909;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1090 = _1088 != 0;
    bool _1092 = !_1076;
    int _1094 = _1092 ? 0 : 1;
    bool _1096 = !_1072;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = trunc(_1086);
    int _1102 = int(_1100);
    int _1104 = abs(_1094);
    bool _1106 = !_1080;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1068 * _1104;
    int _1116 = abs(_1098);
    int _1118 = abs(_1108);
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1122 = _1120 != 0;
    int _1124 = abs(_1112);
    bool _1126 = !_1122;
    int _1128 = _1126 ? 0 : 1;
    int _1130 = _1084 * _1124;
    int _1132 = _1130 + _965;
    int _1134 = _1102 * _1116;
    int _1136 = _1134 + _1114;
    int _1138 = abs(_1128);
    int _1140 = ~_883;
    int _1142 = _1140 + 1;
    int _1144 = _1132 * _1118;
    int _1146 = _1144 + _1136;
    float _1148 = float(uint(_1132));
    int _1150 = _1084 * _1138;
    int _1152 = _1150 + _1146;
    float _1154 = as_type<float>(_961) * _1148;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1160 = float(uint(_1152));
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1162;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1166;
    float _1170 = trunc(_1154);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = as_type<float>(_961) * _1160;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1186 = _1184 != 0;
    float _1188 = trunc(_1176);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1194;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1200 = _1198 != 0;
    int _1202 = _951 * int(_1174);
    int _1204 = _1202 + _1132;
    int _1206 = ~_883;
    int _1208 = _1206 + 1;
    float _1210 = 1.0 / _1158;
    float _1212 = float(uint(_1204));
    int _1214 = _1142 * int(_1192);
    int _1216 = _1214 + _1152;
    float _1218 = 1.0 / _1168;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = _865 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1224 = float(uint(_1216));
    float _1226 = as_type<float>(_961) * _1212;
    float _1228 = fma(_933, -2.0, _1220);
    float _1230 = -_1182;
    float _1232 = fma(_1222, 2.0, _1230);
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1236 = _857 + _1234;
    float _1238 = as_type<float>(_961) * _1224;
    float _1240 = 1.0 / _1180;
    float _1242 = _1236 * _1210;
    float _1244 = trunc(_1238);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    float _1250 = trunc(_1226);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = _871 * _1240;
    int _1258 = int(_1192) + int(_1248);
    float _1260 = 1.0 / _1164;
    int _1262 = _1208 * _1258;
    int _1264 = _1262 + _1152;
    int _1266 = int(_1174) + int(_1254);
    bool _1268 = uint(_1264) >= uint(_883);
    float _1270 = in.m_42.x;
    float _1272 = in.m_42.y;
    float _1274 = in.m_42.z;
    bool _1276 = !_1268;
    int _1278 = _1276 ? 0 : (-1);
    int _1280 = ~_1258;
    int _1282 = _1280 + _1278;
    int _1284 = _1282 + 1;
    float _1286 = 1.0 / _1196;
    int _1288 = _883 * _1284;
    int _1290 = _1288 + _1152;
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1294 = _857 + _1292;
    bool _1296 = !_1032;
    int _1298 = _1296 ? _1290 : (-1);
    float _1300 = _1294 * _1260;
    float _1302 = in.m_54.z;
    int _1304 = _1298 & 3;
    bool _1306 = _1304 != 0;
    float _1308 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1310 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1312 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1314 = _875 * _1286;
    float _1316 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1308);
    float _1318 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1310);
    float _1320 = fma(_1270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1312);
    int _1322 = _1298 >> 31;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1326 = _857 + _1324;
    int _1328 = ~_883;
    int _1330 = _1328 + 1;
    float _1332 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1318);
    int _1334 = _1322 & 3;
    float _1336 = _1326 * _1218;
    int _1338 = _1298 & 3;
    bool _1340 = _1338 != 0;
    int _1342 = _1330 * _1266;
    int _1344 = _1342 + _1132;
    int _1346 = _1298 + _1334;
    float _1348 = _865 * 2.0;
    bool _1350 = uint(_1338) > 1u;
    float _1352 = _867 + _865;
    int _1354 = _1346 >> 2;
    float _1356 = floor(_1348);
    int _1358 = _1306 ? 0 : 1;
    float _1360 = _1352 + (-1.0);
    int _1362 = _1354 << 4;
    int _1364 = _1362 + 368;
    bool _1366 = uint(_1344) >= uint(_883);
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    uint _1370 = uint(int(uint(_1364) >> uint(2)));
    uint _1372 = uint(int(uint(int(_1370)) >> uint(2)));
    int _1374 = int(_1370) & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[int(_1372)][_1374];
    int _1378 = int(_1370) + 1;
    uint _1380 = uint(int(uint(_1378) >> uint(2)));
    int _1382 = _1378 & 3;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[int(_1380)][_1382];
    int _1386 = ~_1358;
    int _1388 = _1386 + 1;
    int _1390 = _1388 + 1;
    float _1392 = _867 + _1302;
    bool _1394 = !_1366;
    int _1396 = _1394 ? 0 : (-1);
    bool _1398 = _1338 != 3;
    float _1400 = _1392 + (-1.0);
    int _1402 = _1390;
    if (!_1350)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1402 = _1406;
    }
    int _1408 = _1402;
    int _1410 = _1364 + 8;
    uint _1412 = uint(int(uint(_1410) >> uint(2)));
    uint _1414 = uint(int(uint(int(_1412)) >> uint(2)));
    int _1416 = int(_1412) & 3;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[int(_1414)][_1416];
    int _1420 = int(_1412) + 1;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    int _1424 = _1420 & 3;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[int(_1422)][_1424];
    bool _1428 = uint(_1338) >= 2u;
    float _1430 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1432 = ~_1266;
    int _1434 = _1432 + _1396;
    int _1436 = _1434 + 1;
    int _1438 = _1428 ? 0 : 1;
    bool _1440 = _1356 >= 0.0;
    bool _1442 = isnan(_1356);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    int _1450 = _883 * _1436;
    int _1452 = _1450 + _1132;
    int _1454 = ~_1438;
    int _1456 = _1454 + 1;
    int _1458 = _1456 + 1;
    int _1460 = _1458;
    if (_1398)
    {
        int _1462 = ~_1438;
        int _1464 = _1462 + 1;
        _1460 = _1464;
    }
    int _1466 = _1460;
    bool _1468 = !_1186;
    int _1470 = _1468 ? 0 : 1;
    bool _1472 = _959 >= 0.0;
    bool _1474 = isnan(_959);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    int _1482 = _1448 ? 0 : 1;
    bool _1484 = _1356 > 0.0;
    float _1486 = _1302 * 2.0;
    bool _1488 = _959 > 0.0;
    int _1490 = abs(_1408);
    bool _1492 = !_1340;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = floor(_1486);
    int _1498 = _1480 ? 0 : 1;
    int _1500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1502 = _1500 != 0;
    int _1504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1506 = _1504 != 0;
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1510 = _1508 != 0;
    int _1512 = abs(_1494);
    bool _1514 = !_1032;
    int _1516 = _1514 ? _1452 : (-1);
    int _1518 = ~_1490;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    bool _1524 = _1338 != 3;
    int _1526 = _1522 * as_type<int>(_1384);
    int _1528 = abs(_1466);
    int _1530 = ~_1512;
    int _1532 = _1530 + 1;
    int _1534 = _1532 + 1;
    float _1536 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1538 = int(_1536);
    bool _1540 = !_1524;
    int _1542 = _1540 ? 0 : (-1);
    int _1544 = ~_1482;
    int _1546 = _1544 + 1;
    int _1548 = _1546 + 1;
    int _1550 = _1534 * as_type<int>(_1376);
    int _1552 = _1550 + _1526;
    int _1554 = _1548;
    if (!_1484)
    {
        int _1556 = ~_1482;
        int _1558 = _1556 + 1;
        _1554 = _1558;
    }
    int _1560 = _1554;
    float _1562 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1316);
    int _1564 = ~_1528;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = fma(_1274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1320);
    int _1572 = ~_1498;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    bool _1578 = _1496 > 0.0;
    int _1580 = _1568 * as_type<int>(_1418);
    int _1582 = _1580 + _1552;
    bool _1584 = _1496 >= 0.0;
    bool _1586 = isnan(_1496);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan(0.0);
    bool _1592 = _1588 || _1590;
    int _1594 = abs(_1542);
    int _1596 = _1576;
    if (!_1488)
    {
        int _1598 = ~_1498;
        int _1600 = _1598 + 1;
        _1596 = _1600;
    }
    int _1602 = _1596;
    float _1604 = float(uint(_1538));
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1606;
    int _1610 = abs(_1470);
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1612;
    int _1616 = ~_1594;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1622;
    float _1626 = 1.0 / _1604;
    int _1628 = ~_1610;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    float _1634 = fma(_1608, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1636 = _1620 * as_type<int>(_1426);
    int _1638 = _1636 + _1582;
    float _1640 = fma(_1614, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1642 = fma(_1624, _1300, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    int _1652 = _1638 * _1632;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1658 = fma(_1646, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1660 = fma(_1650, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    int _1662 = _1516 * _1610;
    int _1664 = _1662 + _1652;
    float _1666 = fma(_1656, _1242, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1668;
    int _1672 = as_type<int>(_1626) + (-2);
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1676 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1674;
    int _1678 = abs(_1538);
    float _1680 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1680;
    float _1684 = fma(_1670, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1686 = fma(_1676, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1688 = float(uint(_1664));
    float _1690 = fma(_1682, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1692 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1694 = log2(_1692);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1700 = as_type<float>(_1672) * _1688;
    float _1702 = float(uint(_1678));
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1712 = trunc(_1700);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    float _1718 = fma(_1698, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1720 = fma(_1706, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1722;
    int _1726 = abs(_1664);
    float _1728 = fma(_1710, _1256, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1730;
    int _1734 = ~_1538;
    int _1736 = _1734 + 1;
    float _1738 = 1.0 / _1702;
    float _1740 = _1694 * _121;
    float _1742 = fma(_1724, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1744 = fma(_1732, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1746 = fma(_915, _1314, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    int _1748 = _1592 ? 0 : 1;
    float _1750 = float(uint(_1726));
    int _1752 = _1736 * int(_1716);
    int _1754 = _1752 + _1664;
    float _1756 = exp2(_1740);
    bool _1758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1766 = _1762 || _1764;
    bool _1768 = _1538 == 0;
    float _1770 = float(uint(_1754));
    int _1772 = as_type<int>(_1738) + (-2);
    bool _1774 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1776 = isnan(_857);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    float _1786 = as_type<float>(_1672) * _1770;
    bool _1788 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1790 = isnan(_857);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1796 = _1792 || _1794;
    float _1798 = float(_1796);
    float _1800 = as_type<float>(_1772) * _1750;
    bool _1802 = _857 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1804 = isnan(_857);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1810 = _1806 || _1808;
    float _1812 = float(_1810);
    float _1814 = -_1784;
    float _1816 = _1814 + 1.0;
    float _1818 = trunc(_1786);
    float _1820 = precise::max(_1818, 0.0);
    uint _1822 = uint(_1820);
    float _1824 = _1812 * _1816;
    float _1826 = -_1812;
    float _1828 = _1826 + 1.0;
    int _1830 = ~_1678;
    int _1832 = _1830 + 1;
    float _1834 = _927 * _1828;
    float _1836 = trunc(_1800);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    float _1842 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1844 = 1.0 + _1842;
    float _1846 = -_1756;
    float _1848 = _1846 + 1.0;
    float _1850 = _907 * _947;
    float _1852 = -_907;
    float _1854 = _1852 + 1.0;
    float _1856 = _1766 ? _1848 : 0.0;
    float _1858 = 1.0 / _1844;
    bool _1860 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1862 = isnan(1.0);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1868 = _1864 || _1866;
    int _1870 = int(_1716) + int(_1822);
    int _1872 = _1832 * int(_1840);
    int _1874 = _1872 + _1726;
    float _1876 = float(uint(_1874));
    float _1878 = _895 * _1854;
    float _1880 = -_895;
    float _1882 = _1880 + 1.0;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1886 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[78].z, _955);
    float _1888 = as_type<float>(_1772) * _1876;
    float _1890 = _1798 * _1882;
    float _1892 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1884);
    float _1894 = -_121;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1232);
    float _1898 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1886);
    float _1900 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    float _1902 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1892);
    if (_1868)
    {
        float _1904 = _1856 * _1858;
        _125 = _1904;
    }
    float _1906 = _125;
    float _1908 = -_1798;
    float _1910 = _1908 + 1.0;
    float _1912 = _1634 * _1890;
    float _1914 = trunc(_1888);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1640 * _1890;
    float _1922 = _1642 * _1890;
    float _1924 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1912);
    int _1926 = ~_1748;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1920);
    float _1934 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1922);
    float _1936 = fma(_1658, _1878, _1924);
    int _1938 = _1930;
    if (!_1578)
    {
        int _1940 = ~_1748;
        int _1942 = _1940 + 1;
        _1938 = _1942;
    }
    int _1944 = _1938;
    float _1946 = fma(_1660, _1878, _1932);
    float _1948 = fma(_1666, _1878, _1934);
    bool _1950 = !_1502;
    int _1952 = _1950 ? 0 : 1;
    float _1954 = fma(_1684, _1850, _1936);
    int _1956 = ~_1678;
    int _1958 = _1956 + 1;
    float _1960 = fma(_1686, _1850, _1946);
    int _1962 = abs(_1952);
    float _1964 = fma(_1718, _1834, _1954);
    int _1966 = int(_1840) + int(_1918);
    float _1968 = fma(_1720, _1834, _1960);
    float _1970 = fma(_1742, _1824, _1964);
    int _1972 = ~_1538;
    int _1974 = _1972 + 1;
    int _1976 = _1958 * _1966;
    int _1978 = _1976 + _1726;
    float _1980 = float(_1560);
    float _1982 = fma(_1690, _1850, _1948);
    float _1984 = float(_1962);
    int _1986 = _1974 * _1870;
    int _1988 = _1986 + _1664;
    float _1990 = float(_1944);
    float _1992 = fma(_1728, _1834, _1982);
    bool _1994 = !_1506;
    int _1996 = _1994 ? 0 : 1;
    float _1998 = fma(_1744, _1824, _1968);
    bool _2000 = uint(_1978) >= uint(_1678);
    float _2002 = _1984 * _1990;
    int _2004 = abs(_1996);
    float _2006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2008 = uint(_1988) >= uint(_1538);
    float _2010 = fma(_1746, _1824, _1992);
    bool _2012 = !_2000;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = -_1898;
    float _2018 = _2016 + 1.0;
    float _2020 = float(_2004);
    float _2022 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1970);
    bool _2024 = !_2008;
    int _2026 = _2024 ? 0 : (-1);
    float _2028 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1998);
    int _2030 = ~_2014;
    int _2032 = _1966 + _2030;
    int _2034 = _2032 + 1;
    float _2036 = _1562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2038 = _1664 ^ _1538;
    float _2040 = _2020 * _1980;
    int _2042 = ~_1870;
    int _2044 = _2042 + _2026;
    int _2046 = _2044 + 1;
    float _2048 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2050 = _1570 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    uint _2052 = uint(int(uint(_2038) >> uint(31)));
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2056 = _2036 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2060 = _2048 + _2058;
    float _2062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2064 = ~int(_2052);
    int _2066 = _2064 + 1;
    float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2070 = _2050 + _2068;
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2074 = _1538 == 0;
    int _2076 = _1538 * _2046;
    int _2078 = _2076 + _1664;
    int _2080 = _2034 ^ _2066;
    float _2082 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2072);
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2086 = _2084 != 0;
    float _2088 = _2006 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2090 = ~_2066;
    int _2092 = _2090 + _2080;
    int _2094 = _2092 + 1;
    float _2096 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2082);
    bool _2098 = !_2074;
    int _2100 = _2098 ? _2078 : (-1);
    float _2102 = _2060 * _2060;
    bool _2104 = !_1768;
    int _2106 = _2104 ? _2094 : (-1);
    bool _2108 = _865 > 0.5;
    float _2110 = _2062 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2112 = _867 > 0.5;
    float _2114 = fma(_2056, _2056, _2102);
    bool _2116 = _2096 >= 0.0;
    float _2118 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2120 = -_181;
    int _2122 = _2108 ? as_type<int>(_2120) : as_type<int>(_181);
    float _2124 = -_185;
    int _2126 = _2112 ? as_type<int>(_2124) : as_type<int>(_185);
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2130 = float(_2106);
    float _2132 = float(_2100);
    bool _2134 = !_2086;
    float _2136 = _2134 ? _181 : as_type<float>(_2122);
    float _2138 = -_1900;
    float _2140 = fma(_2110, _2130, _2138);
    bool _2142 = !_1200;
    float _2144 = _2142 ? _185 : as_type<float>(_2126);
    float _2146 = fma(_2088, _2132, _1896);
    float _2148 = as_type<float>(_2046);
    if (_2116)
    {
        _2148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2150 = _2148;
    float _2152 = _2136 + 0.5;
    if (_2116)
    {
        out.m_45.x = 0.0;
    }
    float _2154 = _2144 + (-0.5);
    float _2156 = fma(_2088, _2152, _2146);
    float _2158 = -_2110;
    float _2160 = fma(_2158, _2154, _2140);
    float _2162 = -_1902;
    float _2164 = _2162 + 1.0;
    float _2166 = in.m_60.x;
    float _2168 = in.m_60.y;
    float _2170 = in.m_60.z;
    float _2172 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2010);
    float _2174 = -_2018;
    float _2176 = fma(_2136, _2174, _2156);
    float _2178 = fma(_2144, _2164, _2160);
    float _2180 = fma(_2070, _2070, _2114);
    float _2182 = _2002 * (-2.0);
    float _2184 = _2028 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2186 = _2172 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2188 = as_type<int>(_2172);
    if (_2116)
    {
        float _2190 = _2150 * 5.0;
        _2188 = as_type<int>(_2190);
    }
    int _2192 = _2188;
    float _2194 = rsqrt(_2180);
    float _2196 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2198 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2200 = fma(_1368, _2182, _1368);
    if (_2116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6292 = as_type<float>(_2192);
        out.gl_Position.z = _6292;
    }
    out.m_62.x = _2128;
    out.m_62.y = _2196;
    out.m_62.z = _2198;
    out.m_64.x = _2176;
    out.m_64.y = _2178;
    float _2202 = fma(_2182, _2166, _2166);
    float _2204 = _2040 * (-2.0);
    bool _2206 = !_1510;
    int _2208 = _2206 ? 0 : 1;
    float _2210 = _2060 * _2194;
    float _2212 = fma(_1430, _2204, _1430);
    float _2214 = _2056 * _2194;
    float _2216 = _2170;
    if (_2116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2218 = -_2210;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2048);
    float _2222 = fma(_2204, _2168, _2168);
    float _2224 = _865 + (-0.5);
    float _2226 = -_2214;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2036);
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2232 = _2220 + _2230;
    float _2234 = _867 + (-0.5);
    float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2202);
    float _2238 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2240 = _2228 + _2238;
    float _2242 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2222);
    float _2246 = _2070 * _2194;
    int _2248 = abs(_2208);
    float _2250 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2242);
    float _2252 = -_2210;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2256 = -_2246;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2050);
    float _2260 = -_2214;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2056);
    float _2264 = float(_1602);
    float _2266 = _2254 * _2254;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2270 = _2258 + _2268;
    float _2272 = float(_2248);
    float _2274 = -_2246;
    float _2276 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2070);
    float _2278 = fma(_2262, _2262, _2266);
    float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2250);
    float _2282 = _1302 + _865;
    float _2284 = _2272 * _2264;
    float _2286 = fma(_2276, _2276, _2278);
    bool _2288 = _2280 >= 0.0;
    float _2290 = _2282 + (-1.0);
    float _2292 = _2284 * (-2.0);
    float _2294 = sqrt(_2286);
    float _2296 = _1302 + (-0.5);
    float _2298 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2300 = fma(_2292, _2170, _2170);
    float _2302 = fma(_2200, _1906, _2236);
    float _2304 = fma(_2212, _1906, _2244);
    float _2306 = fma(_2298, _2292, _2298);
    float _2308 = fma(_2296, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2300);
    float _2310 = _2302 * 0.15915493667125701904296875;
    float _2312 = _2304 * 0.15915493667125701904296875;
    if (_2288)
    {
        _2216 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2314 = _2216;
    float _2316 = fma(_2306, _1906, _2308);
    float _2318 = _2310 * 6.283185482025146484375;
    float _2320 = sin(_2318);
    int _2322 = as_type<int>(_2314);
    if (_2288)
    {
        out.m_45.x = 0.0;
    }
    float _2324 = _2316 * 0.15915493667125701904296875;
    float _2326 = _2194 * _2294;
    if (_2288)
    {
        float _2328 = _2314 * 5.0;
        _2322 = as_type<int>(_2328);
    }
    int _2330 = _2322;
    float _2332 = _2310 * 6.283185482025146484375;
    float _2334 = cos(_2332);
    if (_2288)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6534 = as_type<float>(_2330);
        out.gl_Position.z = _6534;
    }
    float _2336 = _2312 * 6.283185482025146484375;
    float _2338 = sin(_2336);
    float _2340 = _2312 * 6.283185482025146484375;
    float _2342 = cos(_2340);
    float _2344 = _2324 * 6.283185482025146484375;
    float _2346 = sin(_2344);
    if (_2288)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2348 = _2324 * 6.283185482025146484375;
    float _2350 = cos(_2348);
    float _2352 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2356 = _823 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2358 = _2320 * _2338;
    float _2360 = _2326 * _2352;
    float _2362 = _2334 * _2342;
    float _2364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2366 = _2326 * _2356;
    float _2368 = _2354 * _2360;
    float _2370 = fma(_2346, _2362, _2358);
    float _2372 = _2334 * _2338;
    float _2374 = _2364 * _2366;
    float _2376 = fma(_2346, _2358, _2362);
    float _2378 = _2350 * _2368;
    float _2380 = _2338 * _2350;
    float _2382 = -_2368;
    float _2384 = _2346 * _2382;
    float _2386 = _2334 * _2378;
    float _2388 = _2342 * _2350;
    float _2390 = _2320 * _2342;
    float _2392 = _2320 * _2378;
    float _2394 = fma(_2370, _2374, _2386);
    float _2396 = _2326 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2398 = _2396 * 0.5;
    float _2400 = -_2390;
    float _2402 = fma(_2346, _2372, _2400);
    float _2404 = -_2372;
    float _2406 = fma(_2346, _2390, _2404);
    float _2408 = fma(_2388, _2374, _2384);
    float _2410 = fma(_2402, _2398, _2394);
    float _2412 = fma(_2406, _2374, _2392);
    float _2414 = fma(_2380, _2398, _2408);
    float _2416 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2418 = fma(_2376, _2398, _2412);
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2422 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2416);
    float _2424 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2420);
    float _2426 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2422);
    float _2428 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2424);
    float _2430 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2432 = _2428 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2434 = _2050 + _2430;
    float _2436 = _2036 + _2432;
    float _2438 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2442 = _2434 + _2440;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2446 = _2436 + _2444;
    float _2448 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2438);
    float _2450 = _2442 * _2442;
    float _2452 = fma(_2418, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2448);
    float _2454 = fma(_2446, _2446, _2450);
    float _2456 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2458 = sqrt(_2454);
    float _2460 = _2048 + _2456;
    bool _2462 = _2458 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2464 = _2450;
    float _2466 = _2438;
    float _2468 = _2436;
    float _2470 = _2434;
    float _2472 = _2410;
    float _2474 = _2454;
    if (!_2462)
    {
        _2464 = _2436;
    }
    float _2476 = _2464;
    float _2478 = _2476;
    if (!_2462)
    {
        _2466 = _2434;
    }
    float _2480 = _2466;
    float _2482 = _2480;
    if (!_2462)
    {
        _2468 = _2460;
    }
    float _2484 = _2468;
    bool _2486 = !_2462;
    float _2488 = _2484;
    if (!_2486)
    {
        float _2490 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2494 = _2458 + _2492;
        float _2496 = rsqrt(_2454);
        float _2498 = _2494 * _2490;
        float _2500 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2502 = _2498 * 0.15915493667125701904296875;
        float _2504 = _2502 * 6.283185482025146484375;
        float _2506 = cos(_2504);
        float _2508 = _2502 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = _2506 + (-1.0);
        float _2514 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2516 = fma(_2510, _2500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2518 = fma(_2460, _2506, _2514);
        float _2520 = _2496 * _2516;
        float _2522 = fma(_2446, _2520, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2524 = fma(_2442, _2520, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2488 = _2518;
        _2478 = _2522;
        _2482 = _2524;
    }
    float _2526 = _2488;
    float _2528 = _2478;
    float _2530 = _2482;
    float _2532 = -_2048;
    float _2534 = _2532 + _2526;
    float _2536 = -_2036;
    float _2538 = _2536 + _2528;
    float _2540 = -_2050;
    float _2542 = _2540 + _2530;
    float _2544 = _2534 * _2534;
    float _2546 = fma(_2538, _2538, _2544);
    float _2548 = fma(_2542, _2542, _2546);
    float _2550 = sqrt(_2548);
    bool _2552 = _2550 > 0.0;
    bool _2554 = !_2552;
    float _2556 = _2526;
    float _2558 = _2528;
    float _2560 = _2530;
    if (!_2554)
    {
        float _2562 = _177 * _177;
        float _2564 = fma(_175, _175, _2562);
        float _2566 = fma(_173, _173, _2564);
        float _2568 = rsqrt(_2548);
        float _2570 = sqrt(_2566);
        float _2572 = _2538 * _2568;
        float _2574 = _2534 * _2568;
        float _2576 = _2542 * _2568;
        bool _2578 = _2570 > 0.0;
        bool _2580 = !_2578;
        _2472 = _2570;
        _2474 = _2576;
        if (!_2580)
        {
            float _2582 = rsqrt(_2566);
            float _2584 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2586 = _177 * _2582;
            float _2588 = _175 * _2582;
            float _2590 = _173 * _2582;
            float _2592 = _2574 * _2586;
            float _2594 = fma(_2572, _2588, _2592);
            float _2596 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2598 = fma(_2576, _2590, _2594);
            float _2600 = _2598 * _2596;
            float _2602 = fma(_175, _2600, _2528);
            float _2604 = fma(_177, _2600, _2526);
            float _2606 = fma(_173, _2600, _2530);
            _2556 = _2604;
            _2558 = _2602;
            _2560 = _2606;
            _2470 = _2584;
            _2472 = _2586;
        }
    }
    float _2608 = _2556;
    float _2610 = _2558;
    float _2612 = _2560;
    float _2614 = _2470;
    float _2616 = _2472;
    float _2618 = _2474;
    float _2620 = -_2210;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2608);
    float _2624 = -_2214;
    float _2626 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2610);
    float _2628 = -_2246;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2612);
    float _2632 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2634 = _2622 + _2632;
    float _2636 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2638 = _2626 + _2636;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2642 = _2630 + _2640;
    float _2644 = _2634 * _2634;
    float _2646 = fma(_2638, _2638, _2644);
    float _2648 = fma(_2642, _2642, _2646);
    float _2650 = rsqrt(_2648);
    float _2652 = sqrt(_2648);
    float _2654 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2656 = _2638 * _2654;
    float _2658 = _2642 * _2654;
    float _2660 = _2656 * _2656;
    float _2662 = _2658 * _2658;
    float _2664 = _2660 + _2662;
    float _2666 = sqrt(_2664);
    bool _2668 = _2666 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2672 = _2666 + _2670;
    float _2674 = _2642;
    float _2676 = _2616;
    float _2678 = _2672;
    float _2680 = _2614;
    float _2682 = _2618;
    float _2684 = _2654;
    float _2686 = _2656;
    if (_2668)
    {
        float _2688 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2674 = _2688;
    }
    float _2690 = _2674;
    if (_2668)
    {
        float _2692 = rsqrt(_2664);
        _2676 = _2692;
    }
    float _2694 = _2676;
    float _2696 = _2694;
    if (_2668)
    {
        float _2698 = _2672 * _2690;
        _2678 = _2698;
    }
    float _2700 = _2678;
    if (_2668)
    {
        float _2702 = _2700 * 0.15915493667125701904296875;
        _2680 = _2702;
    }
    float _2704 = _2680;
    float _2706 = _2644;
    if (_2668)
    {
        float _2708 = _2704 * 6.283185482025146484375;
        float _2710 = sin(_2708);
        _2706 = _2710;
    }
    float _2712 = _2706;
    float _2714 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2716 = precise::max(0.0, _2714);
    float _2718 = _2650;
    float _2720 = _2716;
    float _2722 = _2714;
    if (_2668)
    {
        float _2724 = _2704 * 6.283185482025146484375;
        float _2726 = cos(_2724);
        _2718 = _2726;
    }
    float _2728 = _2718;
    float _2730 = -_2654;
    float _2732 = -_2716;
    float _2734 = fma(_2634, _2730, _2732);
    if (!_2668)
    {
        _2720 = _2658;
    }
    float _2736 = _2720;
    float _2738 = _2736;
    if (_2668)
    {
        float _2740 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2722 = _2740;
    }
    float _2742 = _2722;
    float _2744 = _2712;
    float _2746 = _2742;
    if (_2668)
    {
        float _2748 = fma(_2712, _2742, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2744 = _2748;
    }
    float _2750 = _2744;
    float _2752 = _2750;
    if (_2668)
    {
        float _2754 = _2728 + (-1.0);
        _2746 = _2754;
    }
    float _2756 = _2746;
    float _2758 = _2756;
    if (_2668)
    {
        float _2760 = _2694 * _2750;
        _2682 = _2760;
    }
    float _2762 = _2682;
    if (!_2668)
    {
        _2696 = _2734;
    }
    float _2764 = _2696;
    float _2766 = _2764;
    if (_2668)
    {
        float _2768 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2684 = _2768;
    }
    float _2770 = _2684;
    if (_2668)
    {
        float _2772 = _2656 * _2762;
        _2686 = _2772;
    }
    float _2774 = _2686;
    if (!_2668)
    {
        _2752 = _2660;
    }
    float _2776 = _2752;
    float _2778 = _2776;
    if (_2668)
    {
        float _2780 = _2658 * _2762;
        _2738 = _2780;
    }
    float _2782 = _2738;
    if (_2668)
    {
        float _2784 = fma(_2734, _2728, _2770);
        _2766 = _2784;
    }
    float _2786 = _2766;
    if (_2668)
    {
        float _2788 = _2774 * _2774;
        _2778 = _2788;
    }
    float _2790 = _2778;
    if (!_2668)
    {
        _2758 = _2662;
    }
    float _2792 = _2758;
    float _2794 = _2792;
    if (_2668)
    {
        float _2796 = _2782 * _2782;
        _2794 = _2796;
    }
    float _2798 = _2794;
    float _2800 = fma(_2786, _2786, _2790);
    float _2802 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2804 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2806 = _2800 + _2798;
    float _2808 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2802);
    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2812 = fma(_2652, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2810);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2818 = rsqrt(_2806);
    float _2820 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2808);
    float _2822 = -_2814;
    float _2824 = _2822 + 1.0;
    float _2826 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2816);
    float _2828 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2804);
    float _2830 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2832 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2834 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2826);
    float _2836 = abs(_2824);
    float _2838 = log2(_2836);
    float _2840 = _2622 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2842 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2844 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2828);
    float _2846 = _2834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2848 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2840);
    float _2850 = -_2842;
    float _2852 = fma(_2850, _2832, 1.0);
    float _2854 = _2844 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2856 = _2818 * _2774;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2860 = _2818 * _2786;
    float _2862 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2848);
    float _2864 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2866 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2858);
    float _2868 = _2818 * _2782;
    float _2870 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2872 = -_2864;
    float _2874 = fma(_2860, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2872);
    float _2876 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2866);
    float _2878 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2880 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2882 = -_2868;
    float _2884 = fma(_2882, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2874);
    float _2886 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2876);
    float _2888 = log2(_2852);
    float _2890 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2892 = fma(_2884, -0.5, 0.5);
    float _2894 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2880);
    float _2896 = fma(_2884, 0.5, 0.5);
    float _2898 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2890);
    float _2900 = _2860 + 1.0;
    float _2902 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2894);
    float _2904 = exp2(_2878);
    float _2906 = fma(_2896, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2908 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2898);
    float _2910 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2902);
    float _2912 = fma(_2896, _2906, -0.212114393711090087890625);
    float _2914 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2908);
    float _2916 = 1.0 / _2886;
    float _2918 = fma(_2896, _2912, 1.570728778839111328125);
    float _2920 = _2888 * 0.693147182464599609375;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2924 = sqrt(_2892);
    float _2926 = -_2860;
    float _2928 = fma(_2904, _2900, _2926);
    float _2930 = fma(_2928, 0.5, 0.5);
    float _2932 = _2910 * _2916;
    float _2934 = _2914 * _2916;
    float _2936 = fma(_2932, 0.5, 0.5);
    float _2938 = fma(_2934, -0.5, 0.5);
    float _2940 = _2924 * 0.636619746685028076171875;
    float3 _7516 = float3(_2936, _2938, _2922);
    float _2942 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7516, float3(0.0), isnan(_7516)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7516, float3(0.0), isnan(_7516)), level(0.0)).x;
    float3 _7527 = float3(_2936, _2938, _2922);
    float4 _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7527, float3(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7527, float3(0.0), isnan(_7527)), level(0.0)).xyzw;
    float _2947 = _2945.x;
    float _2949 = _2945.y;
    float _2951 = _2945.z;
    float _2953 = _2945.w;
    float _2955 = -_2918;
    float _2957 = fma(_2940, _2955, 1.0);
    float2 _7549 = float2(_2957, _2930);
    float3 _2961 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7549, float2(0.0), isnan(_7549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7549, float2(0.0), isnan(_7549)), level(0.0)).xyz;
    float _2963 = _2961.x;
    float _2965 = _2961.y;
    float _2967 = _2961.z;
    float _2969 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2971 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2973 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2971);
    float _2975 = exp2(_2969);
    float _2977 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2973);
    float _2979 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2977);
    float _2981 = _2979 + _2886;
    float _2983 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2910;
    out.gl_Position.y = _2914;
    out.gl_Position.z = _2979;
    out.gl_Position.w = _2886;
    float _2985 = _2981 * 0.5;
    float _2987 = -_2975;
    float _2989 = _2987 + 1.0;
    out.m_45.x = _2983;
    float _2991 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2985;
    out.m_66.w = _2886;
    float _2993 = _2991 * _2942;
    float _2995 = -_2991;
    float _2997 = _2995 + 1.0;
    float _2999 = _2953 * _2993;
    float _3001 = _2967 * _2993;
    float _3003 = fma(_2963, _2999, _2947);
    float _3005 = fma(_2965, _2999, _2949);
    float _3007 = _2953 * _2997;
    float _3009 = fma(_2953, _3001, _2951);
    out.m_68.x = _3003;
    out.m_68.y = _3005;
    out.m_68.z = _3009;
    out.m_68.w = _3007;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

