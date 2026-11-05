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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_47 [[user(locn5)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2368 = false;
    bool _373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2844 = as_type<float>(_103);
        out.gl_Position.z = _2844;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2913 = as_type<float>(_139);
        out.gl_Position.z = _2913;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _145 * _143;
    float _163 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = _163 * 6.283185482025146484375;
    float _173 = floor(_163);
    float _175 = _171 * 0.15915493667125701904296875;
    float _177 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = 1.4012984643248170709237295832899e-45;
    float _181 = _177;
    if (!_155)
    {
        float _183 = _177 * _177;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = _187;
    if (!_155)
    {
        float _195 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = -_173;
    float _201 = _163 + _199;
    bool _203 = !_155;
    float _205 = _197;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _177 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _177);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_155;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _177 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _181 = _259;
    }
    float _261 = _181;
    float _263 = in.m_53.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = in.m_44.x;
    float _275 = in.m_44.y;
    float _277 = in.m_44.z;
    float _279 = fma(_191, 0.5, 0.5);
    bool _281 = _201 < 0.5;
    float _283 = float(_281);
    bool _285 = !_267;
    int _287 = _285 ? 0 : 1;
    float _289 = -_201;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _293 = !_159;
    int _295 = _293 ? 0 : 1;
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_279;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_287);
    float _307 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _309 = abs(_295);
    float _311 = fma(_261, _165, _307);
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _315 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _317 = !_271;
    int _319 = _317 ? 0 : 1;
    float _321 = float(_305);
    float _323 = fma(_261, _167, _315);
    int _325 = abs(_319);
    float _327 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = float(_309);
    float _331 = abs(_291);
    float _333 = _321 * _331;
    float _335 = float(_325);
    float _337 = fma(_261, _169, _327);
    float _339 = fma(_323, _263, _275);
    float _341 = fma(_329, _303, _333);
    float _343 = fma(_311, _263, _273);
    float _345 = fma(_337, _263, _277);
    float _347 = abs(_299);
    float _349 = fma(_335, _347, _341);
    bool _351 = !_313;
    float _369;
    float _371;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = float(_87);
        float _359 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _361 = _359 * _353;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = _357;
        _373 = true;
    }
    else
    {
        float _375 = float(_87);
        float _377 = 1.0 / _375;
        float _379 = _121 * _377;
        _369 = _379;
        _371 = _375;
    }
    _373 = false;
    float _381 = _369;
    float _383 = _371;
    float _385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _387 = int(_385);
    float _389 = in.m_51.z;
    float _391 = in.m_51.w;
    float _393 = _141 * 2.0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _397 = _395 != 0;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _405 = _403 != 0;
    float _407 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _409 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    bool _415 = !_405;
    int _417 = _415 ? 0 : 1;
    float _419 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _381 + _423;
    float _427 = 1.0 / _383;
    float _429 = float(_387);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = _381 + _431;
    float _435 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _439 = _381 + _437;
    float _441 = _435 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _443 = 1.0 / _429;
    float _445 = float(uint(_413));
    float _447 = _389 * 2.0;
    int _449 = ~_413;
    int _451 = _449 + 1;
    bool _453 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _455 = isnan(_381);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    bool _465 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_381);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _445;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _487 = _121 * _443;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _489;
    float _493 = floor(_447);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _499 = as_type<int>(_477) + (-2);
    float _501 = trunc(_487);
    int _503 = int(_501);
    float _505 = _447 + (-1.0);
    float _507 = floor(_393);
    bool _509 = _493 > 0.0;
    float _511 = float(uint(_503));
    float _513 = _393 + (-1.0);
    float _515 = as_type<float>(_499) * _511;
    bool _517 = _507 > 0.0;
    float _519 = trunc(_515);
    float _521 = precise::max(_519, 0.0);
    uint _524 = uint(_521);
    bool _526 = _507 >= 0.0;
    bool _528 = isnan(_507);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    bool _536 = !_401;
    int _538 = _536 ? 0 : 1;
    bool _540 = _493 >= 0.0;
    bool _542 = isnan(_493);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    int _550 = ~_413;
    int _552 = _550 + 1;
    bool _554 = !_397;
    int _556 = _554 ? 0 : 1;
    int _558 = _548 ? 0 : 1;
    int _560 = abs(_538);
    int _562 = ~_558;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    int _568 = _451 * int(_524);
    int _570 = _568 + _503;
    int _572 = _566;
    if (!_509)
    {
        int _574 = ~_558;
        int _576 = _574 + 1;
        _572 = _576;
    }
    int _578 = _572;
    float _580 = float(uint(_570));
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _586 = abs(_556);
    float _588 = as_type<float>(_499) * _580;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = 1.0 / _584;
    int _596 = _534 ? 0 : 1;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _608 = _606 != 0;
    int _610 = ~_596;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    int _616 = _614;
    if (!_517)
    {
        int _618 = ~_596;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = trunc(_588);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    bool _630 = !_592;
    float _632 = _630 ? 7.345489978790283203125 : 1.0;
    bool _634 = !_600;
    int _636 = _634 ? 0 : 1;
    float _638 = float(_413);
    float _640 = _632 * _141;
    int _642 = abs(_636);
    float _644 = _439 * _594;
    float _646 = as_type<float>(int(gl_VertexIndex));
    float _648 = floor(_640);
    float _650 = float(_622);
    float _652 = fma(_485, _644, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _654 = fma(_497, _644, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _656 = int(_524) + int(_628);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _666 = _552 * _656;
    int _668 = _666 + _503;
    float _670 = 1.0 / _660;
    bool _672 = uint(_668) >= uint(_413);
    float _674 = in.m_51.y;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _682 = _680 != 0;
    float _684 = 1.0 / _664;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _692 = _690 != 0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _694;
    bool _698 = !_678;
    int _700 = _698 ? 0 : 1;
    bool _702 = !_672;
    int _704 = _702 ? 0 : (-1);
    float _706 = 1.0 / _696;
    int _708 = as_type<int>(_646) & 1;
    bool _710 = _708 != 0;
    int _712 = as_type<int>(_646) & 2;
    bool _714 = _712 != 0;
    float _716 = _425 * _670;
    bool _718 = !_604;
    int _720 = _718 ? 0 : 1;
    float _722 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _724 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _726 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _407);
    float _728 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _730 = _674 * 2.0;
    float _732 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _734 = log2(_732);
    float _736 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _724);
    float _738 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _722);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _742 = _381 + _740;
    float _744 = _433 * _706;
    float _746 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _738);
    float _748 = _742 * _684;
    float _750 = floor(_730);
    float _752 = _121 * _638;
    float _754 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _756 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _758 = _141 + _674;
    float _760 = _752 * _427;
    float _762 = _674 + _389;
    float _764 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _736);
    float _766 = _121 * _734;
    float _768 = _762 + (-1.0);
    float _770 = _758 + (-1.0);
    float _772 = fma(_481, _744, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _774 = exp2(_766);
    float _776 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _778 = _750 >= 0.0;
    bool _780 = isnan(_750);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _790 = _121 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _792 = _786 ? 0 : 1;
    float _794 = _391 * 6.283185482025146484375;
    bool _796 = _750 > 0.0;
    float _798 = _141 + _389;
    int _800 = ~_792;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _814 = _798 + (-1.0);
    float _816 = fma(_790, 0.100000001490116119384765625, _794);
    float _818 = fma(_808, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _820 = -_774;
    float _822 = _820 + 1.0;
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _826 = fma(_812, _748, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _828 = fma(_790, 0.00999999977648258209228515625, _794);
    int _830 = _804;
    if (!_796)
    {
        int _832 = ~_792;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = _790 * _391;
    float _840 = _838 * 0.125;
    bool _842 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _844 = isnan(0.0);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _850 = _846 || _848;
    float _852 = fma(_391, 2.0, -1.0);
    float _854 = fma(_491, _744, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _856 = _730 + (-1.0);
    float _858 = _850 ? _822 : 0.0;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _868 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(1.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _880 = 1.0 + _878;
    float _882 = fma(_862, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _884 = fma(_866, _748, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _886 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _888 = isnan(_381);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _505 * _505;
    bool _900 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _902 = isnan(_381);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _880;
    bool _914 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _916 = isnan(_381);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_896;
    float _928 = _926 + 1.0;
    float _930 = fma(_856, _856, _898);
    float _932 = -_910;
    float _934 = _932 + 1.0;
    bool _936 = !_608;
    int _938 = _936 ? 0 : 1;
    float _940 = _910 * _928;
    float _942 = fma(_852, _852, _930);
    float _944 = _463 * _934;
    float _946 = -_463;
    float _948 = _946 + 1.0;
    float _950 = sqrt(_746);
    float _952 = float(_836);
    float _954 = _816 * 0.15915493667125701904296875;
    float _956 = _475 * _948;
    float _958 = -_475;
    float _960 = _958 + 1.0;
    float _962 = _754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = _858 * _912;
    float _966 = float(_503);
    float _968 = _924 * _960;
    float _970 = _954 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = _756 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _976 = _966 >= _638;
    bool _978 = isnan(_966);
    bool _980 = _976 || _978;
    bool _982 = isnan(_638);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _818 * _968;
    float _990 = _882 * _968;
    float _992 = -_648;
    float _994 = _640 + _992;
    bool _996 = !_876;
    float _998 = _996 ? _121 : _964;
    float _1000 = _349 * _950;
    float _1002 = -_924;
    float _1004 = _1002 + 1.0;
    int _1006 = abs(_720);
    float _1008 = _994 * _638;
    float _1010 = rsqrt(_942);
    float _1012 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[143].x, _988);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[143].y, _990);
    float _1016 = _828 * 0.15915493667125701904296875;
    bool _1018 = _413 == 0;
    float _1020 = fma(_826, _956, _1012);
    float _1022 = fma(_884, _956, _1014);
    float _1024 = in.m_58.x;
    float _1026 = in.m_58.y;
    float _1028 = in.m_58.z;
    int _1030 = abs(_938);
    float _1032 = trunc(_986);
    int _1034 = int(_1032);
    float _1036 = float(_1006);
    float _1038 = fma(_772, _944, _1020);
    float _1040 = fma(_854, _944, _1022);
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1044 = _1042 != 0;
    float _1046 = _1036 * _650;
    float _1048 = float(_642);
    float _1050 = trunc(_1008);
    int _1052 = int(_1050);
    float _1054 = float(_578);
    float _1056 = _1046 * (-2.0);
    float _1058 = float(_1030);
    float _1060 = _1010 * _972;
    int _1062 = abs(_700);
    float _1064 = _1048 * _1054;
    float _1066 = fma(_652, _940, _1038);
    float _1068 = _1058 * _952;
    float _1070 = _1016 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    int _1074 = ~_656;
    int _1076 = _1074 + _704;
    int _1078 = _1076 + 1;
    float _1080 = fma(_776, _1056, _776);
    int _1082 = ~_1034;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = fma(_1056, _1026, _1026);
    float _1090 = -_441;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1094 = _1052 * _1062;
    int _1096 = _1094 + _503;
    float _1098 = -_962;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1102 = _413 * _1078;
    int _1104 = _1102 + _503;
    float _1106 = _1092 * _1092;
    float _1108 = trunc(_760);
    int _1110 = int(_1108);
    float _1112 = -_974;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1116 = float(uint(_1096));
    float _1118 = fma(_1100, _1100, _1106);
    bool _1120 = !_1018;
    int _1122 = _1120 ? _1104 : (-1);
    float _1124 = _674 + (-0.5);
    float _1126 = _856 + _1072;
    float _1128 = fma(_1114, _1114, _1118);
    float _1130 = _1016 * 6.283185482025146484375;
    float _1132 = cos(_1130);
    int _1134 = _1122 * _1086;
    int _1136 = _413 + (-1);
    float _1138 = _1126 * _1126;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1088);
    int _1142 = abs(_417);
    float _1144 = as_type<float>(_499) * _1116;
    int _1146 = _1034 * _1136;
    int _1148 = _1146 + _1134;
    float _1150 = fma(_513, _513, _1138);
    float _1152 = _1064 * (-2.0);
    float _1154 = fma(_998, _1080, _1140);
    bool _1156 = !_1044;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = rsqrt(_1128);
    int _1162 = _1148 * _560;
    float _1164 = fma(_1152, _1024, _1024);
    float _1166 = _1154 * 0.15915493667125701904296875;
    float _1168 = _141 + (-0.5);
    int _1170 = abs(_1158);
    int _1172 = _1110 * _586;
    int _1174 = _1172 + _1162;
    float _1176 = _505 + _1132;
    float _1178 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1164);
    int _1180 = _1096 * _1142;
    int _1182 = _1180 + _1174;
    float _1184 = fma(_1176, _1176, _1150);
    float _1186 = fma(_788, _1152, _788);
    float _1188 = _1166 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    int _1192 = _1052 * _1170;
    int _1194 = _1192 + _1182;
    float _1196 = _1114 * _1160;
    float _1198 = _1092 * _1160;
    float _1200 = fma(_998, _1186, _1178);
    float _1202 = in.m_53.x;
    float _1204 = in.m_53.y;
    float _1206 = float(uint(_1194));
    float _1208 = fma(_654, _940, _1040);
    float _1210 = rsqrt(_1184);
    float _1212 = _1100 * _1160;
    int _1214 = ~_413;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_499) * _1206;
    float _1220 = _389 + (-0.5);
    float _1222 = _1200 * 0.15915493667125701904296875;
    float _1224 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1066);
    float _1226 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1208);
    float _1228 = _1166 * 6.283185482025146484375;
    float _1230 = cos(_1228);
    float _1232 = _840 * (-0.15915493667125701904296875);
    float _1234 = _1060 * 0.300000011920928955078125;
    float _1236 = trunc(_1218);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = _1068 * (-2.0);
    float _1244 = _1126 * _1210;
    float _1246 = _513 * _1210;
    float _1248 = _1176 * _1210;
    float _1250 = fma(_1242, _1028, _1028);
    float _1252 = _1244 * _1244;
    float _1254 = fma(_824, _1242, _824);
    float _1256 = trunc(_1144);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1250);
    float _1264 = fma(_1246, _1246, _1252);
    float _1266 = _1224 * _1202;
    float _1268 = fma(_998, _1254, _1262);
    float _1270 = _1226 * _1204;
    float _1272 = fma(_1248, _1248, _1264);
    float _1274 = rsqrt(_746);
    int _1276 = _1216 * int(_1240);
    int _1278 = _1276 + _1194;
    float _1280 = _1268 * 0.15915493667125701904296875;
    float _1282 = float(uint(_1278));
    float _1284 = rsqrt(_764);
    int _1286 = _1216 * int(_1260);
    int _1288 = _1286 + _1096;
    float _1290 = as_type<float>(_499) * _1282;
    bool _1292 = !_714;
    float _1294 = _1292 ? (-0.5) : 0.5;
    float _1296 = float(uint(_1288));
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1300 = _1212 * _1298;
    float _1302 = rsqrt(_1272);
    float _1304 = _1266 * _1274;
    float _1306 = as_type<float>(_499) * _1296;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1310 = -_1300;
    float _1312 = fma(_1196, _1308, _1310);
    float _1314 = _1304 * _1000;
    float _1316 = trunc(_1290);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    float _1322 = _1270 * _1284;
    bool _1324 = !_710;
    float _1326 = _1324 ? (-0.5) : 0.5;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1332 = _1198 * _1330;
    float _1334 = _1322 * _1000;
    float _1336 = _1312 * _1312;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1326);
    float _1340 = _1222 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1294);
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1348 = _1328 * _1338;
    float _1350 = _1246 * _1302;
    int _1352 = ~_413;
    int _1354 = _1352 + 1;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1332;
    float _1360 = fma(_1212, _1356, _1358);
    int _1362 = ~_413;
    int _1364 = _1362 + 1;
    float _1366 = _1222 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    int _1370 = int(_1240) + int(_1320);
    float _1372 = trunc(_1306);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    float _1378 = _1342 * _1230;
    int _1380 = _1354 * _1370;
    int _1382 = _1380 + _1194;
    bool _1384 = uint(_1382) >= uint(_413);
    float _1386 = _1280 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1392 = _1196 * _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1396 = -_1392;
    float _1398 = fma(_1198, _1394, _1396);
    float _1400 = _1346 * _1344;
    float _1402 = _1248 * _1302;
    float _1404 = _1280 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = fma(_1398, _1398, _1336);
    float _1410 = _1244 * _1302;
    float _1412 = _1368 * _1190;
    int _1414 = int(_1260) + int(_1376);
    float _1416 = fma(_1360, _1360, _1408);
    float _1418 = _1342 * _1190;
    float _1420 = _1368 * _1230;
    float _1422 = _1232 * 6.283185482025146484375;
    float _1424 = cos(_1422);
    float _1426 = -_1412;
    float _1428 = fma(_1388, _1378, _1426);
    float _1430 = -_1378;
    float _1432 = fma(_1388, _1412, _1430);
    float _1434 = fma(_1388, _1420, _1418);
    float _1436 = fma(_1388, _1418, _1420);
    float _1438 = -_1400;
    float _1440 = _1388 * _1438;
    int _1442 = _1364 * _1414;
    int _1444 = _1442 + _1096;
    float _1446 = rsqrt(_1416);
    float _1448 = _1230 * _1406;
    bool _1450 = !_1384;
    int _1452 = _1450 ? 0 : (-1);
    float _1454 = _1406 * _1400;
    float _1456 = _1190 * _1406;
    float _1458 = fma(_1448, _1348, _1440);
    int _1460 = ~_1370;
    int _1462 = _1460 + _1452;
    int _1464 = _1462 + 1;
    float _1466 = _1368 * _1454;
    float _1468 = _1232 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    float _1472 = _1342 * _1454;
    float _1474 = _1402 * _1402;
    int _1476 = _413 * _1464;
    int _1478 = _1476 + _1194;
    float _1480 = -_1424;
    float _1482 = _1480 + 1.0;
    bool _1484 = uint(_1444) >= uint(_413);
    float _1486 = _1312 * _1446;
    float _1488 = _1350 * _1482;
    float _1490 = _1410 * _1482;
    float _1492 = _1398 * _1446;
    float _1494 = _1360 * _1446;
    float _1496 = fma(_1482, _1474, _1424);
    float _1498 = _1402 * _1470;
    float _1500 = _1350 * _1470;
    float _1502 = _1410 * _1470;
    float _1504 = fma(_1410, _1490, _1424);
    float _1506 = fma(_1410, _1488, _1498);
    float _1508 = -_1498;
    float _1510 = fma(_1410, _1488, _1508);
    float _1512 = fma(_1402, _1490, _1500);
    float _1514 = -_1500;
    float _1516 = fma(_1402, _1490, _1514);
    bool _1518 = !_1018;
    int _1520 = _1518 ? _1478 : (-1);
    float _1522 = fma(_1434, _1348, _1466);
    float _1524 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1526 = fma(_1350, _1488, _1424);
    int _1528 = _1520 >> 31;
    float _1530 = -_1502;
    float _1532 = fma(_1402, _1488, _1530);
    float _1534 = fma(_1432, _1524, _1522);
    float _1536 = fma(_1402, _1488, _1502);
    int _1538 = _1528 & 3;
    float _1540 = fma(_1428, _1348, _1472);
    float _1542 = _1212 * _1494;
    float _1544 = fma(_1456, _1524, _1458);
    int _1546 = _1520 + _1538;
    float _1548 = _1196 * _1486;
    float _1550 = -_1542;
    float _1552 = fma(_1196, _1492, _1550);
    bool _1554 = !_1484;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = fma(_1436, _1524, _1540);
    int _1560 = _1546 >> 2;
    float _1562 = _1552 * _1534;
    int _1564 = ~_1414;
    int _1566 = _1564 + _1556;
    int _1568 = _1566 + 1;
    float _1570 = -_1548;
    float _1572 = fma(_1198, _1494, _1570);
    int _1574 = _1560 << 4;
    int _1576 = _1574 + 368;
    float _1578 = _1198 * _1492;
    float _1580 = fma(_1486, _1544, _1562);
    float _1582 = _1572 * _1534;
    uint _1584 = uint(int(uint(_1576) >> uint(2)));
    uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
    int _1588 = int(_1584) & 3;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[int(_1586)][_1588];
    int _1592 = int(_1584) + 1;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    int _1596 = _1592 & 3;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[int(_1594)][_1596];
    float _1600 = -_1578;
    float _1602 = fma(_1212, _1486, _1600);
    float _1604 = fma(_1198, _1558, _1580);
    float _1606 = fma(_1492, _1544, _1582);
    int _1608 = _1520 & 3;
    bool _1610 = _1608 != 0;
    float _1612 = _1602 * _1534;
    int _1614 = _1520 & 3;
    bool _1616 = _1614 != 0;
    float _1618 = fma(_1212, _1558, _1606);
    bool _1620 = uint(_1608) > 1u;
    float _1622 = fma(_1494, _1544, _1612);
    int _1624 = _1576 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    float _1642 = _441 + _1604;
    float _1644 = _962 + _1618;
    float _1646 = fma(_1196, _1558, _1622);
    int _1648 = _413 * _1568;
    int _1650 = _1648 + _1096;
    float _1652 = fma(_505, _1234, _1642);
    float _1654 = fma(_856, _1234, _1644);
    float _1656 = _974 + _1646;
    float _1658 = -_441;
    float _1660 = _1658 + _1652;
    float _1662 = -_962;
    float _1664 = _1662 + _1654;
    float _1666 = fma(_852, _1234, _1656);
    int _1668 = _1616 ? 0 : 1;
    float _1670 = _1504 * _1660;
    float _1672 = _1512 * _1660;
    float _1674 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1676 = int(_1674);
    int _1678 = ~_1668;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1506, _1664, _1670);
    int _1686 = _1682;
    if (!_1620)
    {
        int _1688 = ~_1668;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    float _1694 = fma(_1532, _1664, _1672);
    bool _1696 = _1608 != 3;
    float _1698 = -_974;
    float _1700 = _1698 + _1666;
    bool _1702 = !_1610;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = _1510 * _1660;
    bool _1708 = uint(_1608) >= 2u;
    float _1710 = fma(_1516, _1700, _1684);
    int _1712 = abs(_1692);
    float _1714 = fma(_1526, _1664, _1706);
    int _1716 = _1708 ? 0 : 1;
    float _1718 = fma(_1496, _1700, _1694);
    int _1720 = abs(_1704);
    float _1722 = fma(_1536, _1700, _1714);
    int _1724 = ~_1712;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = _840 * 0.15915493667125701904296875;
    int _1732 = ~_1716;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = _974 + _1718;
    bool _1740 = _1608 != 3;
    int _1742 = _1736;
    if (_1696)
    {
        int _1744 = ~_1716;
        int _1746 = _1744 + 1;
        _1742 = _1746;
    }
    int _1748 = _1742;
    int _1750 = _1728 * as_type<int>(_1598);
    int _1752 = ~_1720;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    bool _1758 = !_1740;
    int _1760 = _1758 ? 0 : (-1);
    int _1762 = abs(_1748);
    int _1764 = _1756 * as_type<int>(_1590);
    int _1766 = _1764 + _1750;
    float _1768 = float(uint(_1676));
    float _1770 = _1730 * 6.283185482025146484375;
    float _1772 = sin(_1770);
    int _1774 = abs(_1760);
    bool _1776 = !_682;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = abs(_1676);
    float _1782 = 1.0 / _1768;
    int _1784 = abs(_1778);
    int _1786 = ~_1774;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    float _1792 = float(uint(_1780));
    int _1794 = ~_1762;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = ~_1784;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    float _1806 = 1.0 / _1792;
    bool _1808 = !_1018;
    int _1810 = _1808 ? _1650 : (-1);
    int _1812 = _1798 * as_type<int>(_1632);
    int _1814 = _1812 + _1766;
    float _1816 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1818 = ~_1780;
    int _1820 = _1818 + 1;
    int _1822 = _1790 * as_type<int>(_1640);
    int _1824 = _1822 + _1814;
    float _1826 = _962 + _1722;
    float _1828 = _1730 * 6.283185482025146484375;
    float _1830 = cos(_1828);
    float _1832 = _441 + _1710;
    int _1834 = _1824 * _1804;
    float _1836 = _1402 * _1772;
    float _1838 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1840 = _1832 + _1838;
    int _1842 = _1810 * _1784;
    int _1844 = _1842 + _1834;
    int _1846 = as_type<int>(_1782) + (-2);
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1850 = as_type<int>(_1806) + (-2);
    float _1852 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1854 = _1826 + _1852;
    int _1856 = abs(_1844);
    float _1858 = -_1848;
    float _1860 = fma(_1816, 2.0, _1858);
    float _1862 = float(uint(_1844));
    float _1864 = -_1830;
    float _1866 = _1864 + 1.0;
    float _1868 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1870 = as_type<float>(_1846) * _1862;
    float _1872 = float(uint(_1856));
    float _1874 = _1350 * _1866;
    int _1876 = ~_1676;
    int _1878 = _1876 + 1;
    float _1880 = _1868 * _141;
    bool _1882 = _141 > 0.5;
    float _1884 = -_1836;
    float _1886 = fma(_1410, _1874, _1884);
    float _1888 = as_type<float>(_1850) * _1872;
    float _1890 = trunc(_1870);
    float _1892 = precise::max(_1890, 0.0);
    uint _1894 = uint(_1892);
    float _1896 = fma(_1350, _1874, _1830);
    float _1898 = _1886 * _1840;
    float _1900 = _1350 * _1772;
    float _1902 = _1410 * _1772;
    int _1904 = ~_1780;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1896, _1854, _1898);
    float _1910 = fma(_1474, _1866, _1830);
    float _1912 = trunc(_1888);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    float _1918 = _1410 * _1866;
    float _1920 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1922 = _1738 + _1920;
    float _1924 = -_1902;
    float _1926 = fma(_1402, _1874, _1924);
    float _1928 = fma(_1402, _1874, _1902);
    float _1930 = fma(_1402, _1918, _1900);
    bool _1932 = _674 > 0.5;
    float _1934 = trunc(_1880);
    int _1936 = int(_1934);
    float _1938 = _1930 * _1840;
    int _1940 = _1878 * int(_1894);
    int _1942 = _1940 + _1844;
    float _1944 = fma(_1928, _1922, _1908);
    float _1946 = fma(_1926, _1854, _1938);
    float _1948 = float(uint(_1942));
    int _1950 = _1820 * int(_1916);
    int _1952 = _1950 + _1856;
    float _1954 = fma(_1910, _1922, _1946);
    float _1956 = _1944 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1960 = float(uint(_1952));
    float _1962 = as_type<float>(_1846) * _1948;
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _1966 = _1936 << 4;
    int _1968 = _1966 + 1968;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1972 = as_type<float>(_1850) * _1960;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1968 + 8;
    uint _1982 = uint(int(uint(_1980) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1992 = _1956 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1996 = _1964 + _1994;
    float _1998 = _674 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2000 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1970);
    float _2002 = _1992 * _1992;
    float _2004 = _1996 * _1996;
    float _2006 = trunc(_1972);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    uint _2012 = uint(int(uint(_1968) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    float _2028 = fma(_1998, -2.0, _1958);
    float _2030 = _2002 + _2004;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2034 = ~_1676;
    int _2036 = _2034 + 1;
    float _2038 = sqrt(_2030);
    int _2040 = int(_1894) + int(_1978);
    float _2042 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2032);
    float _2044 = fma(_1410, _1918, _1830);
    float _2046 = fma(_1410, _1874, _1836);
    float _2048 = -_1900;
    float _2050 = fma(_1402, _1918, _2048);
    float _2052 = _2044 * _1840;
    int _2054 = int(_1916) + int(_2010);
    int _2056 = _2036 * _2040;
    int _2058 = _2056 + _1844;
    float _2060 = -_1326;
    int _2062 = _1882 ? as_type<int>(_2060) : as_type<int>(_1326);
    float _2064 = fma(_2046, _1854, _2052);
    int _2066 = _1906 * _2054;
    int _2068 = _2066 + _1856;
    bool _2070 = uint(_2058) >= uint(_1676);
    float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2074 = _2038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2076 = fma(_2050, _1922, _2064);
    bool _2078 = uint(_2068) >= uint(_1780);
    bool _2080 = !_2070;
    int _2082 = _2080 ? 0 : (-1);
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2086 = !_688;
    float _2088 = _2086 ? _1326 : as_type<float>(_2062);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2092 = ~_2040;
    int _2094 = _2092 + _2082;
    int _2096 = _2094 + 1;
    int _2098 = _1844 ^ _1676;
    bool _2100 = !_2078;
    int _2102 = _2100 ? 0 : (-1);
    uint _2104 = uint(int(uint(_2098) >> uint(31)));
    int _2106 = ~_2102;
    int _2108 = _2054 + _2106;
    int _2110 = _2108 + 1;
    int _2112 = ~int(_2104);
    int _2114 = _2112 + 1;
    float _2116 = as_type<float>(_2098);
    float _2118 = _2044;
    float _2120 = as_type<float>(_2104);
    float _2122 = _2002;
    float _2124 = _2004;
    if (!_2074)
    {
        _2116 = _1956;
    }
    float _2126 = _2116;
    float _2128 = _2126;
    if (!_2074)
    {
        _2118 = _1964;
    }
    float _2130 = _2118;
    float _2132 = _2130;
    if (!_2074)
    {
        _2120 = _2084;
    }
    float _2134 = _2120;
    bool _2136 = !_2074;
    float _2138 = _2134;
    if (!_2136)
    {
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2144 = _2038 + _2142;
        float _2146 = rsqrt(_2030);
        float _2148 = _2144 * _2140;
        float _2150 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2152 = _2148 * 0.15915493667125701904296875;
        float _2154 = _2152 * 6.283185482025146484375;
        float _2156 = sin(_2154);
        float _2158 = _2152 * 6.283185482025146484375;
        float _2160 = cos(_2158);
        float _2162 = fma(_2156, _2150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2164 = _2146 * _2162;
        float _2166 = _2160 + (-1.0);
        float _2168 = fma(_1992, _2164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2170 = fma(_1996, _2164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2172 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2176 = _2168 + _2174;
        float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2180 = _2170 + _2178;
        float _2182 = fma(_2084, _2160, _2172);
        float _2184 = _2176 * _2176;
        float _2186 = _2180 * _2180;
        _2138 = _2182;
        _2122 = _2184;
        _2124 = _2186;
        _2128 = _2168;
        _2132 = _2170;
    }
    float _2188 = _2138;
    float _2190 = _2122;
    float _2192 = _2124;
    float _2194 = _2128;
    float _2196 = _2132;
    int _2198 = _2110 ^ _2114;
    int _2200 = _1676 * _2096;
    int _2202 = _2200 + _1844;
    bool _2204 = _1676 == 0;
    float _2206 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2208 = _1676 == 0;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2212 = _2188 + _2210;
    int _2214 = ~_2114;
    int _2216 = _2214 + _2198;
    int _2218 = _2216 + 1;
    float _2220 = -_121;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1860);
    bool _2224 = !_2204;
    int _2226 = _2224 ? _2202 : (-1);
    float _2228 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2230 = !_2208;
    int _2232 = _2230 ? _2218 : (-1);
    float _2234 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2028);
    float _2236 = -_1294;
    int _2238 = _1932 ? as_type<int>(_2236) : as_type<int>(_1294);
    float _2240 = fma(_2212, _2212, _2190);
    float _2242 = float(_2226);
    float _2244 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2000);
    float _2246 = float(_2232);
    float _2248 = _2240 + _2192;
    bool _2250 = !_692;
    float _2252 = _2250 ? _1294 : as_type<float>(_2238);
    float _2254 = fma(_2206, _2242, _2222);
    float _2256 = _2088 + 0.5;
    float _2258 = -_2234;
    float _2260 = fma(_2228, _2246, _2258);
    float _2262 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2042);
    float _2264 = _2252 + (-0.5);
    float _2266 = fma(_2206, _2256, _2254);
    float _2268 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2270 = -_2228;
    float _2272 = fma(_2270, _2264, _2260);
    float _2274 = _2026 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2276 = -_2244;
    float _2278 = _2276 + 1.0;
    float _2280 = sqrt(_2248);
    float _2282 = -_2278;
    float _2284 = fma(_2088, _2282, _2266);
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2292 = _1988 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2294 = -_2262;
    float _2296 = _2294 + 1.0;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2300 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2308 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2310 = _2292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = fma(_2252, _2296, _2272);
    out.m_60.x = _2300;
    out.m_60.y = _2302;
    out.m_60.z = _2304;
    out.m_60.w = _2298;
    bool _2314 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2316 = isnan(_2280);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2322 = _2318 || _2320;
    out.m_62.x = _2306;
    out.m_62.y = _2308;
    out.m_62.z = _2310;
    out.m_64.x = _2284;
    out.m_64.y = _2312;
    float _2324 = _2268;
    float _2326 = _2274;
    float _2328 = _2278;
    float _2330 = _2266;
    float _2332 = _2196;
    if (!_2322)
    {
        _2324 = 1.0;
    }
    float _2334 = _2324;
    bool _2336 = !_2322;
    float _2338 = _2334;
    if (!_2336)
    {
        bool _2340 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2342 = isnan(_2280);
        bool _2344 = _2340 || _2342;
        bool _2346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2348 = _2344 || _2346;
        if (!_2348)
        {
            float _2350 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2352 = _2280 + _2350;
            float _2354 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2356 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2354;
            float _2358 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2362 = 1.0 / _2356;
            float _2364 = _2352 * _2362;
            float _2366 = fma(_2364, _2360, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2338 = _2366;
            _2368 = true;
        }
        else
        {
            bool _2370 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2372 = isnan(_2280);
            bool _2374 = _2370 || _2372;
            bool _2376 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2378 = _2374 || _2376;
            if (!_2378)
            {
                float _2380 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2382 = _2280 + _2380;
                float _2384 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2386 = _2384 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2388 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2390 = _2388 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2392 = 1.0 / _2386;
                float _2394 = _2382 * _2392;
                float _2396 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2338 = _2396;
                _2368 = true;
            }
            else
            {
                _2338 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2368 = false;
    float _2398 = _2338;
    float _2400 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2402 = _2188 + _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2406 = _2194 + _2404;
    float _2408 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2410 = _2196 + _2408;
    float _2412 = fma(_2402, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2414 = fma(_2406, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2416 = fma(_2410, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2420 = _2412 + _2418;
    float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2424 = _2414 + _2422;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2428 = _2416 + _2426;
    float _2430 = _2420 * _2420;
    float _2432 = fma(_2424, _2424, _2430);
    float _2434 = fma(_2428, _2428, _2432);
    float _2436 = rsqrt(_2434);
    float _2438 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2440 = _2424 * _2438;
    float _2442 = _2428 * _2438;
    float _2444 = _2440 * _2440;
    float _2446 = _2442 * _2442;
    float _2448 = _2444 + _2446;
    float _2450 = sqrt(_2448);
    bool _2452 = _2450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2456 = _2450 + _2454;
    float _2458 = _2428;
    float _2460 = _2456;
    float _2462 = _2440;
    if (_2452)
    {
        float _2464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2458 = _2464;
    }
    float _2466 = _2458;
    if (_2452)
    {
        float _2468 = rsqrt(_2448);
        _2326 = _2468;
    }
    float _2470 = _2326;
    float _2472 = _2470;
    if (_2452)
    {
        float _2474 = _2456 * _2466;
        _2460 = _2474;
    }
    float _2476 = _2460;
    if (_2452)
    {
        float _2478 = _2476 * 0.15915493667125701904296875;
        _2328 = _2478;
    }
    float _2480 = _2328;
    float _2482 = _2430;
    if (_2452)
    {
        float _2484 = _2480 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        _2482 = _2486;
    }
    float _2488 = _2482;
    float _2490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2492 = precise::max(0.0, _2490);
    float _2494 = _2436;
    float _2496 = _2492;
    float _2498 = _2490;
    if (_2452)
    {
        float _2500 = _2480 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        _2494 = _2502;
    }
    float _2504 = _2494;
    float _2506 = -_2438;
    float _2508 = -_2492;
    float _2510 = fma(_2420, _2506, _2508);
    if (!_2452)
    {
        _2496 = _2442;
    }
    float _2512 = _2496;
    float _2514 = _2512;
    if (_2452)
    {
        float _2516 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2498 = _2516;
    }
    float _2518 = _2498;
    float _2520 = sqrt(_2434);
    float _2522 = _2488;
    float _2524 = _2518;
    if (_2452)
    {
        float _2526 = fma(_2488, _2518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2522 = _2526;
    }
    float _2528 = _2522;
    float _2530 = _2528;
    if (_2452)
    {
        float _2532 = _2504 + (-1.0);
        _2524 = _2532;
    }
    float _2534 = _2524;
    float _2536 = _2534;
    if (_2452)
    {
        float _2538 = _2470 * _2528;
        _2330 = _2538;
    }
    float _2540 = _2330;
    if (!_2452)
    {
        _2472 = _2510;
    }
    float _2542 = _2472;
    float _2544 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2546 = _2542;
    if (_2452)
    {
        float _2548 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2332 = _2548;
    }
    float _2550 = _2332;
    if (_2452)
    {
        float _2552 = _2440 * _2540;
        _2462 = _2552;
    }
    float _2554 = _2462;
    if (!_2452)
    {
        _2530 = _2444;
    }
    float _2556 = _2530;
    float _2558 = _2556;
    if (_2452)
    {
        float _2560 = _2442 * _2540;
        _2514 = _2560;
    }
    float _2562 = _2514;
    if (_2452)
    {
        float _2564 = fma(_2510, _2504, _2550);
        _2546 = _2564;
    }
    float _2566 = _2546;
    if (_2452)
    {
        float _2568 = _2554 * _2554;
        _2558 = _2568;
    }
    float _2570 = _2558;
    if (!_2452)
    {
        _2536 = _2446;
    }
    float _2572 = _2536;
    float _2574 = _2572;
    if (_2452)
    {
        float _2576 = _2562 * _2562;
        _2574 = _2576;
    }
    float _2578 = _2574;
    float _2580 = fma(_2566, _2566, _2570);
    float _2582 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2544);
    float _2584 = _2580 + _2578;
    float _2586 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2590 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2588);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2596 = rsqrt(_2584);
    float _2598 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2586);
    float _2600 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2602 = -_2592;
    float _2604 = _2602 + 1.0;
    float _2606 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2608 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2598);
    float _2610 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2600);
    float _2612 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2606);
    float _2614 = _2608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2616 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2610);
    float _2618 = abs(_2604);
    float _2620 = log2(_2618);
    float _2622 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2612);
    float _2624 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2582);
    float _2626 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2628 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2630 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2632 = _2596 * _2554;
    float _2634 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2636 = _2596 * _2566;
    float _2638 = _2596 * _2562;
    float _2640 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2642 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2634);
    float _2644 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2646 = -_2628;
    float _2648 = fma(_2646, _2594, 1.0);
    float _2650 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2642);
    float _2652 = -_2644;
    float _2654 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2652);
    float _2656 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2658 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2660 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2650);
    float _2662 = -_2638;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2654);
    float _2666 = exp2(_2656);
    float _2668 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2670 = fma(_2664, -0.5, 0.5);
    float _2672 = fma(_2664, 0.5, 0.5);
    float _2674 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2668);
    float _2676 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2658);
    float _2678 = _2636 + 1.0;
    float _2680 = log2(_2648);
    float _2682 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2674);
    float _2684 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2676);
    float _2686 = fma(_2672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2688 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2684);
    float _2690 = fma(_2672, _2686, -0.212114393711090087890625);
    float _2692 = 1.0 / _2660;
    float _2694 = -_2636;
    float _2696 = fma(_2666, _2678, _2694);
    float _2698 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2682);
    float _2700 = fma(_2672, _2690, 1.570728778839111328125);
    float _2702 = fma(_2696, 0.5, 0.5);
    float _2704 = sqrt(_2670);
    float _2706 = _2680 * 0.693147182464599609375;
    float _2708 = _2698 * _2692;
    float _2710 = _2688 * _2692;
    float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2714 = fma(_2708, 0.5, 0.5);
    float _2716 = fma(_2710, -0.5, 0.5);
    float _2718 = _2704 * 0.636619746685028076171875;
    float3 _6807 = float3(_2714, _2716, _2712);
    float _2720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6807, float3(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6807, float3(0.0), isnan(_6807)), level(0.0)).x;
    float3 _6818 = float3(_2714, _2716, _2712);
    float4 _2723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6818, float3(0.0), isnan(_6818)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6818, float3(0.0), isnan(_6818)), level(0.0)).xyzw;
    float _2725 = _2723.x;
    float _2727 = _2723.y;
    float _2729 = _2723.z;
    float _2731 = _2723.w;
    float _2733 = -_2700;
    float _2735 = fma(_2718, _2733, 1.0);
    float2 _6840 = float2(_2735, _2702);
    float3 _2739 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6840, float2(0.0), isnan(_6840)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6840, float2(0.0), isnan(_6840)), level(0.0)).xyz;
    float _2741 = _2739.x;
    float _2743 = _2739.y;
    float _2745 = _2739.z;
    float _2747 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2749 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2751 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2749);
    float _2753 = exp2(_2747);
    float _2755 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2751);
    float _2757 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2755);
    float _2759 = _2757 + _2660;
    float _2761 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2698;
    out.gl_Position.y = _2688;
    out.gl_Position.z = _2757;
    out.gl_Position.w = _2660;
    float _2763 = _2759 * 0.5;
    float _2765 = -_2753;
    float _2767 = _2765 + 1.0;
    out.m_47.x = _2761;
    float _2769 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2763;
    out.m_66.w = _2660;
    float _2771 = -_2769;
    float _2773 = _2771 + 1.0;
    float _2775 = _2769 * _2720;
    float _2777 = _2731 * _2775;
    float _2779 = _2731 * _2773;
    float _2781 = _2745 * _2775;
    float _2783 = fma(_2741, _2777, _2725);
    float _2785 = fma(_2743, _2777, _2727);
    float _2787 = fma(_2731, _2781, _2729);
    out.m_68.x = _2783;
    out.m_68.y = _2785;
    out.m_68.z = _2787;
    out.m_68.w = _2779;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2368 = false;
    bool _373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2844 = as_type<float>(_103);
        out.gl_Position.z = _2844;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2913 = as_type<float>(_139);
        out.gl_Position.z = _2913;
    }
    if (_131)
    {
        return out;
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _145 * _143;
    float _163 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = _163 * 6.283185482025146484375;
    float _173 = floor(_163);
    float _175 = _171 * 0.15915493667125701904296875;
    float _177 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = 1.4012984643248170709237295832899e-45;
    float _181 = _177;
    if (!_155)
    {
        float _183 = _177 * _177;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = _187;
    if (!_155)
    {
        float _195 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = -_173;
    float _201 = _163 + _199;
    bool _203 = !_155;
    float _205 = _197;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _177 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _177);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_155;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _177 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _181 = _259;
    }
    float _261 = _181;
    float _263 = in.m_53.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = in.m_44.x;
    float _275 = in.m_44.y;
    float _277 = in.m_44.z;
    float _279 = fma(_191, 0.5, 0.5);
    bool _281 = _201 < 0.5;
    float _283 = float(_281);
    bool _285 = !_267;
    int _287 = _285 ? 0 : 1;
    float _289 = -_201;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _293 = !_159;
    int _295 = _293 ? 0 : 1;
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_279;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_287);
    float _307 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _309 = abs(_295);
    float _311 = fma(_261, _165, _307);
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _315 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _317 = !_271;
    int _319 = _317 ? 0 : 1;
    float _321 = float(_305);
    float _323 = fma(_261, _167, _315);
    int _325 = abs(_319);
    float _327 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = float(_309);
    float _331 = abs(_291);
    float _333 = _321 * _331;
    float _335 = float(_325);
    float _337 = fma(_261, _169, _327);
    float _339 = fma(_323, _263, _275);
    float _341 = fma(_329, _303, _333);
    float _343 = fma(_311, _263, _273);
    float _345 = fma(_337, _263, _277);
    float _347 = abs(_299);
    float _349 = fma(_335, _347, _341);
    bool _351 = !_313;
    float _369;
    float _371;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = float(_87);
        float _359 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _361 = _359 * _353;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = _357;
        _373 = true;
    }
    else
    {
        float _375 = float(_87);
        float _377 = 1.0 / _375;
        float _379 = _121 * _377;
        _369 = _379;
        _371 = _375;
    }
    _373 = false;
    float _381 = _369;
    float _383 = _371;
    float _385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _387 = int(_385);
    float _389 = in.m_51.z;
    float _391 = in.m_51.w;
    float _393 = _141 * 2.0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _397 = _395 != 0;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _405 = _403 != 0;
    float _407 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _409 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    bool _415 = !_405;
    int _417 = _415 ? 0 : 1;
    float _419 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _381 + _423;
    float _427 = 1.0 / _383;
    float _429 = float(_387);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = _381 + _431;
    float _435 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _439 = _381 + _437;
    float _441 = _435 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _443 = 1.0 / _429;
    float _445 = float(uint(_413));
    float _447 = _389 * 2.0;
    int _449 = ~_413;
    int _451 = _449 + 1;
    bool _453 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _455 = isnan(_381);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    bool _465 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_381);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _445;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _487 = _121 * _443;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _489;
    float _493 = floor(_447);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _499 = as_type<int>(_477) + (-2);
    float _501 = trunc(_487);
    int _503 = int(_501);
    float _505 = _447 + (-1.0);
    float _507 = floor(_393);
    bool _509 = _493 > 0.0;
    float _511 = float(uint(_503));
    float _513 = _393 + (-1.0);
    float _515 = as_type<float>(_499) * _511;
    bool _517 = _507 > 0.0;
    float _519 = trunc(_515);
    float _521 = precise::max(_519, 0.0);
    uint _524 = uint(_521);
    bool _526 = _507 >= 0.0;
    bool _528 = isnan(_507);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    bool _536 = !_401;
    int _538 = _536 ? 0 : 1;
    bool _540 = _493 >= 0.0;
    bool _542 = isnan(_493);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    int _550 = ~_413;
    int _552 = _550 + 1;
    bool _554 = !_397;
    int _556 = _554 ? 0 : 1;
    int _558 = _548 ? 0 : 1;
    int _560 = abs(_538);
    int _562 = ~_558;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    int _568 = _451 * int(_524);
    int _570 = _568 + _503;
    int _572 = _566;
    if (!_509)
    {
        int _574 = ~_558;
        int _576 = _574 + 1;
        _572 = _576;
    }
    int _578 = _572;
    float _580 = float(uint(_570));
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _586 = abs(_556);
    float _588 = as_type<float>(_499) * _580;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = 1.0 / _584;
    int _596 = _534 ? 0 : 1;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _608 = _606 != 0;
    int _610 = ~_596;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    int _616 = _614;
    if (!_517)
    {
        int _618 = ~_596;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = trunc(_588);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    bool _630 = !_592;
    float _632 = _630 ? 7.345489978790283203125 : 1.0;
    bool _634 = !_600;
    int _636 = _634 ? 0 : 1;
    float _638 = float(_413);
    float _640 = _632 * _141;
    int _642 = abs(_636);
    float _644 = _439 * _594;
    float _646 = as_type<float>(int(gl_VertexIndex));
    float _648 = floor(_640);
    float _650 = float(_622);
    float _652 = fma(_485, _644, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _654 = fma(_497, _644, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _656 = int(_524) + int(_628);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _666 = _552 * _656;
    int _668 = _666 + _503;
    float _670 = 1.0 / _660;
    bool _672 = uint(_668) >= uint(_413);
    float _674 = in.m_51.y;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _682 = _680 != 0;
    float _684 = 1.0 / _664;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _692 = _690 != 0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _694;
    bool _698 = !_678;
    int _700 = _698 ? 0 : 1;
    bool _702 = !_672;
    int _704 = _702 ? 0 : (-1);
    float _706 = 1.0 / _696;
    int _708 = as_type<int>(_646) & 1;
    bool _710 = _708 != 0;
    int _712 = as_type<int>(_646) & 2;
    bool _714 = _712 != 0;
    float _716 = _425 * _670;
    bool _718 = !_604;
    int _720 = _718 ? 0 : 1;
    float _722 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _724 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _726 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _407);
    float _728 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _730 = _674 * 2.0;
    float _732 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _734 = log2(_732);
    float _736 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _724);
    float _738 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _722);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _742 = _381 + _740;
    float _744 = _433 * _706;
    float _746 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _738);
    float _748 = _742 * _684;
    float _750 = floor(_730);
    float _752 = _121 * _638;
    float _754 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _756 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _758 = _141 + _674;
    float _760 = _752 * _427;
    float _762 = _674 + _389;
    float _764 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _736);
    float _766 = _121 * _734;
    float _768 = _762 + (-1.0);
    float _770 = _758 + (-1.0);
    float _772 = fma(_481, _744, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _774 = exp2(_766);
    float _776 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _778 = _750 >= 0.0;
    bool _780 = isnan(_750);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _790 = _121 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _792 = _786 ? 0 : 1;
    float _794 = _391 * 6.283185482025146484375;
    bool _796 = _750 > 0.0;
    float _798 = _141 + _389;
    int _800 = ~_792;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _814 = _798 + (-1.0);
    float _816 = fma(_790, 0.100000001490116119384765625, _794);
    float _818 = fma(_808, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _820 = -_774;
    float _822 = _820 + 1.0;
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _826 = fma(_812, _748, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _828 = fma(_790, 0.00999999977648258209228515625, _794);
    int _830 = _804;
    if (!_796)
    {
        int _832 = ~_792;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = _790 * _391;
    float _840 = _838 * 0.125;
    bool _842 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _844 = isnan(0.0);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _850 = _846 || _848;
    float _852 = fma(_391, 2.0, -1.0);
    float _854 = fma(_491, _744, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _856 = _730 + (-1.0);
    float _858 = _850 ? _822 : 0.0;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _868 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(1.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _880 = 1.0 + _878;
    float _882 = fma(_862, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _884 = fma(_866, _748, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _886 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _888 = isnan(_381);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _505 * _505;
    bool _900 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _902 = isnan(_381);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _880;
    bool _914 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _916 = isnan(_381);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_896;
    float _928 = _926 + 1.0;
    float _930 = fma(_856, _856, _898);
    float _932 = -_910;
    float _934 = _932 + 1.0;
    bool _936 = !_608;
    int _938 = _936 ? 0 : 1;
    float _940 = _910 * _928;
    float _942 = fma(_852, _852, _930);
    float _944 = _463 * _934;
    float _946 = -_463;
    float _948 = _946 + 1.0;
    float _950 = sqrt(_746);
    float _952 = float(_836);
    float _954 = _816 * 0.15915493667125701904296875;
    float _956 = _475 * _948;
    float _958 = -_475;
    float _960 = _958 + 1.0;
    float _962 = _754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = _858 * _912;
    float _966 = float(_503);
    float _968 = _924 * _960;
    float _970 = _954 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = _756 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _976 = _966 >= _638;
    bool _978 = isnan(_966);
    bool _980 = _976 || _978;
    bool _982 = isnan(_638);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _818 * _968;
    float _990 = _882 * _968;
    float _992 = -_648;
    float _994 = _640 + _992;
    bool _996 = !_876;
    float _998 = _996 ? _121 : _964;
    float _1000 = _349 * _950;
    float _1002 = -_924;
    float _1004 = _1002 + 1.0;
    int _1006 = abs(_720);
    float _1008 = _994 * _638;
    float _1010 = rsqrt(_942);
    float _1012 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[143].x, _988);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[143].y, _990);
    float _1016 = _828 * 0.15915493667125701904296875;
    bool _1018 = _413 == 0;
    float _1020 = fma(_826, _956, _1012);
    float _1022 = fma(_884, _956, _1014);
    float _1024 = in.m_58.x;
    float _1026 = in.m_58.y;
    float _1028 = in.m_58.z;
    int _1030 = abs(_938);
    float _1032 = trunc(_986);
    int _1034 = int(_1032);
    float _1036 = float(_1006);
    float _1038 = fma(_772, _944, _1020);
    float _1040 = fma(_854, _944, _1022);
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1044 = _1042 != 0;
    float _1046 = _1036 * _650;
    float _1048 = float(_642);
    float _1050 = trunc(_1008);
    int _1052 = int(_1050);
    float _1054 = float(_578);
    float _1056 = _1046 * (-2.0);
    float _1058 = float(_1030);
    float _1060 = _1010 * _972;
    int _1062 = abs(_700);
    float _1064 = _1048 * _1054;
    float _1066 = fma(_652, _940, _1038);
    float _1068 = _1058 * _952;
    float _1070 = _1016 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    int _1074 = ~_656;
    int _1076 = _1074 + _704;
    int _1078 = _1076 + 1;
    float _1080 = fma(_776, _1056, _776);
    int _1082 = ~_1034;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = fma(_1056, _1026, _1026);
    float _1090 = -_441;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1094 = _1052 * _1062;
    int _1096 = _1094 + _503;
    float _1098 = -_962;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1102 = _413 * _1078;
    int _1104 = _1102 + _503;
    float _1106 = _1092 * _1092;
    float _1108 = trunc(_760);
    int _1110 = int(_1108);
    float _1112 = -_974;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1116 = float(uint(_1096));
    float _1118 = fma(_1100, _1100, _1106);
    bool _1120 = !_1018;
    int _1122 = _1120 ? _1104 : (-1);
    float _1124 = _674 + (-0.5);
    float _1126 = _856 + _1072;
    float _1128 = fma(_1114, _1114, _1118);
    float _1130 = _1016 * 6.283185482025146484375;
    float _1132 = cos(_1130);
    int _1134 = _1122 * _1086;
    int _1136 = _413 + (-1);
    float _1138 = _1126 * _1126;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1088);
    int _1142 = abs(_417);
    float _1144 = as_type<float>(_499) * _1116;
    int _1146 = _1034 * _1136;
    int _1148 = _1146 + _1134;
    float _1150 = fma(_513, _513, _1138);
    float _1152 = _1064 * (-2.0);
    float _1154 = fma(_998, _1080, _1140);
    bool _1156 = !_1044;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = rsqrt(_1128);
    int _1162 = _1148 * _560;
    float _1164 = fma(_1152, _1024, _1024);
    float _1166 = _1154 * 0.15915493667125701904296875;
    float _1168 = _141 + (-0.5);
    int _1170 = abs(_1158);
    int _1172 = _1110 * _586;
    int _1174 = _1172 + _1162;
    float _1176 = _505 + _1132;
    float _1178 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1164);
    int _1180 = _1096 * _1142;
    int _1182 = _1180 + _1174;
    float _1184 = fma(_1176, _1176, _1150);
    float _1186 = fma(_788, _1152, _788);
    float _1188 = _1166 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    int _1192 = _1052 * _1170;
    int _1194 = _1192 + _1182;
    float _1196 = _1114 * _1160;
    float _1198 = _1092 * _1160;
    float _1200 = fma(_998, _1186, _1178);
    float _1202 = in.m_53.x;
    float _1204 = in.m_53.y;
    float _1206 = float(uint(_1194));
    float _1208 = fma(_654, _940, _1040);
    float _1210 = rsqrt(_1184);
    float _1212 = _1100 * _1160;
    int _1214 = ~_413;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_499) * _1206;
    float _1220 = _389 + (-0.5);
    float _1222 = _1200 * 0.15915493667125701904296875;
    float _1224 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1066);
    float _1226 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1208);
    float _1228 = _1166 * 6.283185482025146484375;
    float _1230 = cos(_1228);
    float _1232 = _840 * (-0.15915493667125701904296875);
    float _1234 = _1060 * 0.300000011920928955078125;
    float _1236 = trunc(_1218);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = _1068 * (-2.0);
    float _1244 = _1126 * _1210;
    float _1246 = _513 * _1210;
    float _1248 = _1176 * _1210;
    float _1250 = fma(_1242, _1028, _1028);
    float _1252 = _1244 * _1244;
    float _1254 = fma(_824, _1242, _824);
    float _1256 = trunc(_1144);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1250);
    float _1264 = fma(_1246, _1246, _1252);
    float _1266 = _1224 * _1202;
    float _1268 = fma(_998, _1254, _1262);
    float _1270 = _1226 * _1204;
    float _1272 = fma(_1248, _1248, _1264);
    float _1274 = rsqrt(_746);
    int _1276 = _1216 * int(_1240);
    int _1278 = _1276 + _1194;
    float _1280 = _1268 * 0.15915493667125701904296875;
    float _1282 = float(uint(_1278));
    float _1284 = rsqrt(_764);
    int _1286 = _1216 * int(_1260);
    int _1288 = _1286 + _1096;
    float _1290 = as_type<float>(_499) * _1282;
    bool _1292 = !_714;
    float _1294 = _1292 ? (-0.5) : 0.5;
    float _1296 = float(uint(_1288));
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1300 = _1212 * _1298;
    float _1302 = rsqrt(_1272);
    float _1304 = _1266 * _1274;
    float _1306 = as_type<float>(_499) * _1296;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1310 = -_1300;
    float _1312 = fma(_1196, _1308, _1310);
    float _1314 = _1304 * _1000;
    float _1316 = trunc(_1290);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    float _1322 = _1270 * _1284;
    bool _1324 = !_710;
    float _1326 = _1324 ? (-0.5) : 0.5;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1332 = _1198 * _1330;
    float _1334 = _1322 * _1000;
    float _1336 = _1312 * _1312;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1326);
    float _1340 = _1222 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1294);
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1348 = _1328 * _1338;
    float _1350 = _1246 * _1302;
    int _1352 = ~_413;
    int _1354 = _1352 + 1;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1332;
    float _1360 = fma(_1212, _1356, _1358);
    int _1362 = ~_413;
    int _1364 = _1362 + 1;
    float _1366 = _1222 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    int _1370 = int(_1240) + int(_1320);
    float _1372 = trunc(_1306);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    float _1378 = _1342 * _1230;
    int _1380 = _1354 * _1370;
    int _1382 = _1380 + _1194;
    bool _1384 = uint(_1382) >= uint(_413);
    float _1386 = _1280 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1392 = _1196 * _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1396 = -_1392;
    float _1398 = fma(_1198, _1394, _1396);
    float _1400 = _1346 * _1344;
    float _1402 = _1248 * _1302;
    float _1404 = _1280 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = fma(_1398, _1398, _1336);
    float _1410 = _1244 * _1302;
    float _1412 = _1368 * _1190;
    int _1414 = int(_1260) + int(_1376);
    float _1416 = fma(_1360, _1360, _1408);
    float _1418 = _1342 * _1190;
    float _1420 = _1368 * _1230;
    float _1422 = _1232 * 6.283185482025146484375;
    float _1424 = cos(_1422);
    float _1426 = -_1412;
    float _1428 = fma(_1388, _1378, _1426);
    float _1430 = -_1378;
    float _1432 = fma(_1388, _1412, _1430);
    float _1434 = fma(_1388, _1420, _1418);
    float _1436 = fma(_1388, _1418, _1420);
    float _1438 = -_1400;
    float _1440 = _1388 * _1438;
    int _1442 = _1364 * _1414;
    int _1444 = _1442 + _1096;
    float _1446 = rsqrt(_1416);
    float _1448 = _1230 * _1406;
    bool _1450 = !_1384;
    int _1452 = _1450 ? 0 : (-1);
    float _1454 = _1406 * _1400;
    float _1456 = _1190 * _1406;
    float _1458 = fma(_1448, _1348, _1440);
    int _1460 = ~_1370;
    int _1462 = _1460 + _1452;
    int _1464 = _1462 + 1;
    float _1466 = _1368 * _1454;
    float _1468 = _1232 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    float _1472 = _1342 * _1454;
    float _1474 = _1402 * _1402;
    int _1476 = _413 * _1464;
    int _1478 = _1476 + _1194;
    float _1480 = -_1424;
    float _1482 = _1480 + 1.0;
    bool _1484 = uint(_1444) >= uint(_413);
    float _1486 = _1312 * _1446;
    float _1488 = _1350 * _1482;
    float _1490 = _1410 * _1482;
    float _1492 = _1398 * _1446;
    float _1494 = _1360 * _1446;
    float _1496 = fma(_1482, _1474, _1424);
    float _1498 = _1402 * _1470;
    float _1500 = _1350 * _1470;
    float _1502 = _1410 * _1470;
    float _1504 = fma(_1410, _1490, _1424);
    float _1506 = fma(_1410, _1488, _1498);
    float _1508 = -_1498;
    float _1510 = fma(_1410, _1488, _1508);
    float _1512 = fma(_1402, _1490, _1500);
    float _1514 = -_1500;
    float _1516 = fma(_1402, _1490, _1514);
    bool _1518 = !_1018;
    int _1520 = _1518 ? _1478 : (-1);
    float _1522 = fma(_1434, _1348, _1466);
    float _1524 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1526 = fma(_1350, _1488, _1424);
    int _1528 = _1520 >> 31;
    float _1530 = -_1502;
    float _1532 = fma(_1402, _1488, _1530);
    float _1534 = fma(_1432, _1524, _1522);
    float _1536 = fma(_1402, _1488, _1502);
    int _1538 = _1528 & 3;
    float _1540 = fma(_1428, _1348, _1472);
    float _1542 = _1212 * _1494;
    float _1544 = fma(_1456, _1524, _1458);
    int _1546 = _1520 + _1538;
    float _1548 = _1196 * _1486;
    float _1550 = -_1542;
    float _1552 = fma(_1196, _1492, _1550);
    bool _1554 = !_1484;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = fma(_1436, _1524, _1540);
    int _1560 = _1546 >> 2;
    float _1562 = _1552 * _1534;
    int _1564 = ~_1414;
    int _1566 = _1564 + _1556;
    int _1568 = _1566 + 1;
    float _1570 = -_1548;
    float _1572 = fma(_1198, _1494, _1570);
    int _1574 = _1560 << 4;
    int _1576 = _1574 + 368;
    float _1578 = _1198 * _1492;
    float _1580 = fma(_1486, _1544, _1562);
    float _1582 = _1572 * _1534;
    uint _1584 = uint(int(uint(_1576) >> uint(2)));
    uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
    int _1588 = int(_1584) & 3;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[int(_1586)][_1588];
    int _1592 = int(_1584) + 1;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    int _1596 = _1592 & 3;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[int(_1594)][_1596];
    float _1600 = -_1578;
    float _1602 = fma(_1212, _1486, _1600);
    float _1604 = fma(_1198, _1558, _1580);
    float _1606 = fma(_1492, _1544, _1582);
    int _1608 = _1520 & 3;
    bool _1610 = _1608 != 0;
    float _1612 = _1602 * _1534;
    int _1614 = _1520 & 3;
    bool _1616 = _1614 != 0;
    float _1618 = fma(_1212, _1558, _1606);
    bool _1620 = uint(_1608) > 1u;
    float _1622 = fma(_1494, _1544, _1612);
    int _1624 = _1576 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    float _1642 = _441 + _1604;
    float _1644 = _962 + _1618;
    float _1646 = fma(_1196, _1558, _1622);
    int _1648 = _413 * _1568;
    int _1650 = _1648 + _1096;
    float _1652 = fma(_505, _1234, _1642);
    float _1654 = fma(_856, _1234, _1644);
    float _1656 = _974 + _1646;
    float _1658 = -_441;
    float _1660 = _1658 + _1652;
    float _1662 = -_962;
    float _1664 = _1662 + _1654;
    float _1666 = fma(_852, _1234, _1656);
    int _1668 = _1616 ? 0 : 1;
    float _1670 = _1504 * _1660;
    float _1672 = _1512 * _1660;
    float _1674 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1676 = int(_1674);
    int _1678 = ~_1668;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1506, _1664, _1670);
    int _1686 = _1682;
    if (!_1620)
    {
        int _1688 = ~_1668;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    float _1694 = fma(_1532, _1664, _1672);
    bool _1696 = _1608 != 3;
    float _1698 = -_974;
    float _1700 = _1698 + _1666;
    bool _1702 = !_1610;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = _1510 * _1660;
    bool _1708 = uint(_1608) >= 2u;
    float _1710 = fma(_1516, _1700, _1684);
    int _1712 = abs(_1692);
    float _1714 = fma(_1526, _1664, _1706);
    int _1716 = _1708 ? 0 : 1;
    float _1718 = fma(_1496, _1700, _1694);
    int _1720 = abs(_1704);
    float _1722 = fma(_1536, _1700, _1714);
    int _1724 = ~_1712;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = _840 * 0.15915493667125701904296875;
    int _1732 = ~_1716;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = _974 + _1718;
    bool _1740 = _1608 != 3;
    int _1742 = _1736;
    if (_1696)
    {
        int _1744 = ~_1716;
        int _1746 = _1744 + 1;
        _1742 = _1746;
    }
    int _1748 = _1742;
    int _1750 = _1728 * as_type<int>(_1598);
    int _1752 = ~_1720;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    bool _1758 = !_1740;
    int _1760 = _1758 ? 0 : (-1);
    int _1762 = abs(_1748);
    int _1764 = _1756 * as_type<int>(_1590);
    int _1766 = _1764 + _1750;
    float _1768 = float(uint(_1676));
    float _1770 = _1730 * 6.283185482025146484375;
    float _1772 = sin(_1770);
    int _1774 = abs(_1760);
    bool _1776 = !_682;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = abs(_1676);
    float _1782 = 1.0 / _1768;
    int _1784 = abs(_1778);
    int _1786 = ~_1774;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    float _1792 = float(uint(_1780));
    int _1794 = ~_1762;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = ~_1784;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    float _1806 = 1.0 / _1792;
    bool _1808 = !_1018;
    int _1810 = _1808 ? _1650 : (-1);
    int _1812 = _1798 * as_type<int>(_1632);
    int _1814 = _1812 + _1766;
    float _1816 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1818 = ~_1780;
    int _1820 = _1818 + 1;
    int _1822 = _1790 * as_type<int>(_1640);
    int _1824 = _1822 + _1814;
    float _1826 = _962 + _1722;
    float _1828 = _1730 * 6.283185482025146484375;
    float _1830 = cos(_1828);
    float _1832 = _441 + _1710;
    int _1834 = _1824 * _1804;
    float _1836 = _1402 * _1772;
    float _1838 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1840 = _1832 + _1838;
    int _1842 = _1810 * _1784;
    int _1844 = _1842 + _1834;
    int _1846 = as_type<int>(_1782) + (-2);
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1850 = as_type<int>(_1806) + (-2);
    float _1852 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1854 = _1826 + _1852;
    int _1856 = abs(_1844);
    float _1858 = -_1848;
    float _1860 = fma(_1816, 2.0, _1858);
    float _1862 = float(uint(_1844));
    float _1864 = -_1830;
    float _1866 = _1864 + 1.0;
    float _1868 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1870 = as_type<float>(_1846) * _1862;
    float _1872 = float(uint(_1856));
    float _1874 = _1350 * _1866;
    int _1876 = ~_1676;
    int _1878 = _1876 + 1;
    float _1880 = _1868 * _141;
    bool _1882 = _141 > 0.5;
    float _1884 = -_1836;
    float _1886 = fma(_1410, _1874, _1884);
    float _1888 = as_type<float>(_1850) * _1872;
    float _1890 = trunc(_1870);
    float _1892 = precise::max(_1890, 0.0);
    uint _1894 = uint(_1892);
    float _1896 = fma(_1350, _1874, _1830);
    float _1898 = _1886 * _1840;
    float _1900 = _1350 * _1772;
    float _1902 = _1410 * _1772;
    int _1904 = ~_1780;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1896, _1854, _1898);
    float _1910 = fma(_1474, _1866, _1830);
    float _1912 = trunc(_1888);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    float _1918 = _1410 * _1866;
    float _1920 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1922 = _1738 + _1920;
    float _1924 = -_1902;
    float _1926 = fma(_1402, _1874, _1924);
    float _1928 = fma(_1402, _1874, _1902);
    float _1930 = fma(_1402, _1918, _1900);
    bool _1932 = _674 > 0.5;
    float _1934 = trunc(_1880);
    int _1936 = int(_1934);
    float _1938 = _1930 * _1840;
    int _1940 = _1878 * int(_1894);
    int _1942 = _1940 + _1844;
    float _1944 = fma(_1928, _1922, _1908);
    float _1946 = fma(_1926, _1854, _1938);
    float _1948 = float(uint(_1942));
    int _1950 = _1820 * int(_1916);
    int _1952 = _1950 + _1856;
    float _1954 = fma(_1910, _1922, _1946);
    float _1956 = _1944 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1960 = float(uint(_1952));
    float _1962 = as_type<float>(_1846) * _1948;
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _1966 = _1936 << 4;
    int _1968 = _1966 + 1968;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1972 = as_type<float>(_1850) * _1960;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1968 + 8;
    uint _1982 = uint(int(uint(_1980) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1992 = _1956 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1996 = _1964 + _1994;
    float _1998 = _674 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2000 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1970);
    float _2002 = _1992 * _1992;
    float _2004 = _1996 * _1996;
    float _2006 = trunc(_1972);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    uint _2012 = uint(int(uint(_1968) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    float _2028 = fma(_1998, -2.0, _1958);
    float _2030 = _2002 + _2004;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2034 = ~_1676;
    int _2036 = _2034 + 1;
    float _2038 = sqrt(_2030);
    int _2040 = int(_1894) + int(_1978);
    float _2042 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2032);
    float _2044 = fma(_1410, _1918, _1830);
    float _2046 = fma(_1410, _1874, _1836);
    float _2048 = -_1900;
    float _2050 = fma(_1402, _1918, _2048);
    float _2052 = _2044 * _1840;
    int _2054 = int(_1916) + int(_2010);
    int _2056 = _2036 * _2040;
    int _2058 = _2056 + _1844;
    float _2060 = -_1326;
    int _2062 = _1882 ? as_type<int>(_2060) : as_type<int>(_1326);
    float _2064 = fma(_2046, _1854, _2052);
    int _2066 = _1906 * _2054;
    int _2068 = _2066 + _1856;
    bool _2070 = uint(_2058) >= uint(_1676);
    float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2074 = _2038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2076 = fma(_2050, _1922, _2064);
    bool _2078 = uint(_2068) >= uint(_1780);
    bool _2080 = !_2070;
    int _2082 = _2080 ? 0 : (-1);
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2086 = !_688;
    float _2088 = _2086 ? _1326 : as_type<float>(_2062);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2092 = ~_2040;
    int _2094 = _2092 + _2082;
    int _2096 = _2094 + 1;
    int _2098 = _1844 ^ _1676;
    bool _2100 = !_2078;
    int _2102 = _2100 ? 0 : (-1);
    uint _2104 = uint(int(uint(_2098) >> uint(31)));
    int _2106 = ~_2102;
    int _2108 = _2054 + _2106;
    int _2110 = _2108 + 1;
    int _2112 = ~int(_2104);
    int _2114 = _2112 + 1;
    float _2116 = as_type<float>(_2098);
    float _2118 = _2044;
    float _2120 = as_type<float>(_2104);
    float _2122 = _2002;
    float _2124 = _2004;
    if (!_2074)
    {
        _2116 = _1956;
    }
    float _2126 = _2116;
    float _2128 = _2126;
    if (!_2074)
    {
        _2118 = _1964;
    }
    float _2130 = _2118;
    float _2132 = _2130;
    if (!_2074)
    {
        _2120 = _2084;
    }
    float _2134 = _2120;
    bool _2136 = !_2074;
    float _2138 = _2134;
    if (!_2136)
    {
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2144 = _2038 + _2142;
        float _2146 = rsqrt(_2030);
        float _2148 = _2144 * _2140;
        float _2150 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2152 = _2148 * 0.15915493667125701904296875;
        float _2154 = _2152 * 6.283185482025146484375;
        float _2156 = sin(_2154);
        float _2158 = _2152 * 6.283185482025146484375;
        float _2160 = cos(_2158);
        float _2162 = fma(_2156, _2150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2164 = _2146 * _2162;
        float _2166 = _2160 + (-1.0);
        float _2168 = fma(_1992, _2164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2170 = fma(_1996, _2164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2172 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2176 = _2168 + _2174;
        float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2180 = _2170 + _2178;
        float _2182 = fma(_2084, _2160, _2172);
        float _2184 = _2176 * _2176;
        float _2186 = _2180 * _2180;
        _2138 = _2182;
        _2122 = _2184;
        _2124 = _2186;
        _2128 = _2168;
        _2132 = _2170;
    }
    float _2188 = _2138;
    float _2190 = _2122;
    float _2192 = _2124;
    float _2194 = _2128;
    float _2196 = _2132;
    int _2198 = _2110 ^ _2114;
    int _2200 = _1676 * _2096;
    int _2202 = _2200 + _1844;
    bool _2204 = _1676 == 0;
    float _2206 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2208 = _1676 == 0;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2212 = _2188 + _2210;
    int _2214 = ~_2114;
    int _2216 = _2214 + _2198;
    int _2218 = _2216 + 1;
    float _2220 = -_121;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1860);
    bool _2224 = !_2204;
    int _2226 = _2224 ? _2202 : (-1);
    float _2228 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2230 = !_2208;
    int _2232 = _2230 ? _2218 : (-1);
    float _2234 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2028);
    float _2236 = -_1294;
    int _2238 = _1932 ? as_type<int>(_2236) : as_type<int>(_1294);
    float _2240 = fma(_2212, _2212, _2190);
    float _2242 = float(_2226);
    float _2244 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2000);
    float _2246 = float(_2232);
    float _2248 = _2240 + _2192;
    bool _2250 = !_692;
    float _2252 = _2250 ? _1294 : as_type<float>(_2238);
    float _2254 = fma(_2206, _2242, _2222);
    float _2256 = _2088 + 0.5;
    float _2258 = -_2234;
    float _2260 = fma(_2228, _2246, _2258);
    float _2262 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2042);
    float _2264 = _2252 + (-0.5);
    float _2266 = fma(_2206, _2256, _2254);
    float _2268 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2270 = -_2228;
    float _2272 = fma(_2270, _2264, _2260);
    float _2274 = _2026 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2276 = -_2244;
    float _2278 = _2276 + 1.0;
    float _2280 = sqrt(_2248);
    float _2282 = -_2278;
    float _2284 = fma(_2088, _2282, _2266);
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2292 = _1988 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2294 = -_2262;
    float _2296 = _2294 + 1.0;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2300 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2308 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2310 = _2292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = fma(_2252, _2296, _2272);
    out.m_60.x = _2300;
    out.m_60.y = _2302;
    out.m_60.z = _2304;
    out.m_60.w = _2298;
    bool _2314 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2316 = isnan(_2280);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2322 = _2318 || _2320;
    out.m_62.x = _2306;
    out.m_62.y = _2308;
    out.m_62.z = _2310;
    out.m_64.x = _2284;
    out.m_64.y = _2312;
    float _2324 = _2268;
    float _2326 = _2274;
    float _2328 = _2278;
    float _2330 = _2266;
    float _2332 = _2196;
    if (!_2322)
    {
        _2324 = 1.0;
    }
    float _2334 = _2324;
    bool _2336 = !_2322;
    float _2338 = _2334;
    if (!_2336)
    {
        bool _2340 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2342 = isnan(_2280);
        bool _2344 = _2340 || _2342;
        bool _2346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2348 = _2344 || _2346;
        if (!_2348)
        {
            float _2350 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2352 = _2280 + _2350;
            float _2354 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2356 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2354;
            float _2358 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2362 = 1.0 / _2356;
            float _2364 = _2352 * _2362;
            float _2366 = fma(_2364, _2360, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2338 = _2366;
            _2368 = true;
        }
        else
        {
            bool _2370 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2372 = isnan(_2280);
            bool _2374 = _2370 || _2372;
            bool _2376 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2378 = _2374 || _2376;
            if (!_2378)
            {
                float _2380 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2382 = _2280 + _2380;
                float _2384 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2386 = _2384 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2388 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2390 = _2388 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2392 = 1.0 / _2386;
                float _2394 = _2382 * _2392;
                float _2396 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2338 = _2396;
                _2368 = true;
            }
            else
            {
                _2338 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2368 = false;
    float _2398 = _2338;
    float _2400 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2402 = _2188 + _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2406 = _2194 + _2404;
    float _2408 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2410 = _2196 + _2408;
    float _2412 = fma(_2402, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2414 = fma(_2406, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2416 = fma(_2410, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2420 = _2412 + _2418;
    float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2424 = _2414 + _2422;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2428 = _2416 + _2426;
    float _2430 = _2420 * _2420;
    float _2432 = fma(_2424, _2424, _2430);
    float _2434 = fma(_2428, _2428, _2432);
    float _2436 = rsqrt(_2434);
    float _2438 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2440 = _2424 * _2438;
    float _2442 = _2428 * _2438;
    float _2444 = _2440 * _2440;
    float _2446 = _2442 * _2442;
    float _2448 = _2444 + _2446;
    float _2450 = sqrt(_2448);
    bool _2452 = _2450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2456 = _2450 + _2454;
    float _2458 = _2428;
    float _2460 = _2456;
    float _2462 = _2440;
    if (_2452)
    {
        float _2464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2458 = _2464;
    }
    float _2466 = _2458;
    if (_2452)
    {
        float _2468 = rsqrt(_2448);
        _2326 = _2468;
    }
    float _2470 = _2326;
    float _2472 = _2470;
    if (_2452)
    {
        float _2474 = _2456 * _2466;
        _2460 = _2474;
    }
    float _2476 = _2460;
    if (_2452)
    {
        float _2478 = _2476 * 0.15915493667125701904296875;
        _2328 = _2478;
    }
    float _2480 = _2328;
    float _2482 = _2430;
    if (_2452)
    {
        float _2484 = _2480 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        _2482 = _2486;
    }
    float _2488 = _2482;
    float _2490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2492 = precise::max(0.0, _2490);
    float _2494 = _2436;
    float _2496 = _2492;
    float _2498 = _2490;
    if (_2452)
    {
        float _2500 = _2480 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        _2494 = _2502;
    }
    float _2504 = _2494;
    float _2506 = -_2438;
    float _2508 = -_2492;
    float _2510 = fma(_2420, _2506, _2508);
    if (!_2452)
    {
        _2496 = _2442;
    }
    float _2512 = _2496;
    float _2514 = _2512;
    if (_2452)
    {
        float _2516 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2498 = _2516;
    }
    float _2518 = _2498;
    float _2520 = sqrt(_2434);
    float _2522 = _2488;
    float _2524 = _2518;
    if (_2452)
    {
        float _2526 = fma(_2488, _2518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2522 = _2526;
    }
    float _2528 = _2522;
    float _2530 = _2528;
    if (_2452)
    {
        float _2532 = _2504 + (-1.0);
        _2524 = _2532;
    }
    float _2534 = _2524;
    float _2536 = _2534;
    if (_2452)
    {
        float _2538 = _2470 * _2528;
        _2330 = _2538;
    }
    float _2540 = _2330;
    if (!_2452)
    {
        _2472 = _2510;
    }
    float _2542 = _2472;
    float _2544 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2546 = _2542;
    if (_2452)
    {
        float _2548 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2332 = _2548;
    }
    float _2550 = _2332;
    if (_2452)
    {
        float _2552 = _2440 * _2540;
        _2462 = _2552;
    }
    float _2554 = _2462;
    if (!_2452)
    {
        _2530 = _2444;
    }
    float _2556 = _2530;
    float _2558 = _2556;
    if (_2452)
    {
        float _2560 = _2442 * _2540;
        _2514 = _2560;
    }
    float _2562 = _2514;
    if (_2452)
    {
        float _2564 = fma(_2510, _2504, _2550);
        _2546 = _2564;
    }
    float _2566 = _2546;
    if (_2452)
    {
        float _2568 = _2554 * _2554;
        _2558 = _2568;
    }
    float _2570 = _2558;
    if (!_2452)
    {
        _2536 = _2446;
    }
    float _2572 = _2536;
    float _2574 = _2572;
    if (_2452)
    {
        float _2576 = _2562 * _2562;
        _2574 = _2576;
    }
    float _2578 = _2574;
    float _2580 = fma(_2566, _2566, _2570);
    float _2582 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2544);
    float _2584 = _2580 + _2578;
    float _2586 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2590 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2588);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2596 = rsqrt(_2584);
    float _2598 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2586);
    float _2600 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2602 = -_2592;
    float _2604 = _2602 + 1.0;
    float _2606 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2608 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2598);
    float _2610 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2600);
    float _2612 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2606);
    float _2614 = _2608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2616 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2610);
    float _2618 = abs(_2604);
    float _2620 = log2(_2618);
    float _2622 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2612);
    float _2624 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2582);
    float _2626 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2628 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2630 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2632 = _2596 * _2554;
    float _2634 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2636 = _2596 * _2566;
    float _2638 = _2596 * _2562;
    float _2640 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2642 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2634);
    float _2644 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2646 = -_2628;
    float _2648 = fma(_2646, _2594, 1.0);
    float _2650 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2642);
    float _2652 = -_2644;
    float _2654 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2652);
    float _2656 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2658 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2660 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2650);
    float _2662 = -_2638;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2654);
    float _2666 = exp2(_2656);
    float _2668 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2670 = fma(_2664, -0.5, 0.5);
    float _2672 = fma(_2664, 0.5, 0.5);
    float _2674 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2668);
    float _2676 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2658);
    float _2678 = _2636 + 1.0;
    float _2680 = log2(_2648);
    float _2682 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2674);
    float _2684 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2676);
    float _2686 = fma(_2672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2688 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2684);
    float _2690 = fma(_2672, _2686, -0.212114393711090087890625);
    float _2692 = 1.0 / _2660;
    float _2694 = -_2636;
    float _2696 = fma(_2666, _2678, _2694);
    float _2698 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2682);
    float _2700 = fma(_2672, _2690, 1.570728778839111328125);
    float _2702 = fma(_2696, 0.5, 0.5);
    float _2704 = sqrt(_2670);
    float _2706 = _2680 * 0.693147182464599609375;
    float _2708 = _2698 * _2692;
    float _2710 = _2688 * _2692;
    float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2714 = fma(_2708, 0.5, 0.5);
    float _2716 = fma(_2710, -0.5, 0.5);
    float _2718 = _2704 * 0.636619746685028076171875;
    float3 _6807 = float3(_2714, _2716, _2712);
    float _2720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6807, float3(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6807, float3(0.0), isnan(_6807)), level(0.0)).x;
    float3 _6818 = float3(_2714, _2716, _2712);
    float4 _2723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6818, float3(0.0), isnan(_6818)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6818, float3(0.0), isnan(_6818)), level(0.0)).xyzw;
    float _2725 = _2723.x;
    float _2727 = _2723.y;
    float _2729 = _2723.z;
    float _2731 = _2723.w;
    float _2733 = -_2700;
    float _2735 = fma(_2718, _2733, 1.0);
    float2 _6840 = float2(_2735, _2702);
    float3 _2739 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6840, float2(0.0), isnan(_6840)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6840, float2(0.0), isnan(_6840)), level(0.0)).xyz;
    float _2741 = _2739.x;
    float _2743 = _2739.y;
    float _2745 = _2739.z;
    float _2747 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2749 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2751 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2749);
    float _2753 = exp2(_2747);
    float _2755 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2751);
    float _2757 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2755);
    float _2759 = _2757 + _2660;
    float _2761 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2698;
    out.gl_Position.y = _2688;
    out.gl_Position.z = _2757;
    out.gl_Position.w = _2660;
    float _2763 = _2759 * 0.5;
    float _2765 = -_2753;
    float _2767 = _2765 + 1.0;
    out.m_47.x = _2761;
    float _2769 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2763;
    out.m_66.w = _2660;
    float _2771 = -_2769;
    float _2773 = _2771 + 1.0;
    float _2775 = _2769 * _2720;
    float _2777 = _2731 * _2775;
    float _2779 = _2731 * _2773;
    float _2781 = _2745 * _2775;
    float _2783 = fma(_2741, _2777, _2725);
    float _2785 = fma(_2743, _2777, _2727);
    float _2787 = fma(_2731, _2781, _2729);
    out.m_68.x = _2783;
    out.m_68.y = _2785;
    out.m_68.z = _2787;
    out.m_68.w = _2779;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2368 = false;
    bool _373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2844 = as_type<float>(_103);
        out.gl_Position.z = _2844;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_117)
    {
        float _123 = float(_87);
        _97 = _123;
    }
    float _125 = _97;
    bool _127 = _121 >= _125;
    bool _129 = !_117;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _105 = as_type<int>(_137);
    }
    int _139 = _105;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2913 = as_type<float>(_139);
        out.gl_Position.z = _2913;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_51.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _121 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _145 * _143;
    float _163 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = _163 * 6.283185482025146484375;
    float _173 = floor(_163);
    float _175 = _171 * 0.15915493667125701904296875;
    float _177 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _179 = 1.4012984643248170709237295832899e-45;
    float _181 = _177;
    if (!_155)
    {
        float _183 = _177 * _177;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    float _193 = _187;
    if (!_155)
    {
        float _195 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    float _199 = -_173;
    float _201 = _163 + _199;
    bool _203 = !_155;
    float _205 = _197;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _177 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _177);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_155;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _177 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _181 = _259;
    }
    float _261 = _181;
    float _263 = in.m_53.w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _267 = _265 != 0;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _271 = _269 != 0;
    float _273 = in.m_44.x;
    float _275 = in.m_44.y;
    float _277 = in.m_44.z;
    float _279 = fma(_191, 0.5, 0.5);
    bool _281 = _201 < 0.5;
    float _283 = float(_281);
    bool _285 = !_267;
    int _287 = _285 ? 0 : 1;
    float _289 = -_201;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _293 = !_159;
    int _295 = _293 ? 0 : 1;
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_279;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_287);
    float _307 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _309 = abs(_295);
    float _311 = fma(_261, _165, _307);
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _315 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _317 = !_271;
    int _319 = _317 ? 0 : 1;
    float _321 = float(_305);
    float _323 = fma(_261, _167, _315);
    int _325 = abs(_319);
    float _327 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _329 = float(_309);
    float _331 = abs(_291);
    float _333 = _321 * _331;
    float _335 = float(_325);
    float _337 = fma(_261, _169, _327);
    float _339 = fma(_323, _263, _275);
    float _341 = fma(_329, _303, _333);
    float _343 = fma(_311, _263, _273);
    float _345 = fma(_337, _263, _277);
    float _347 = abs(_299);
    float _349 = fma(_335, _347, _341);
    bool _351 = !_313;
    float _369;
    float _371;
    if (!_351)
    {
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _355 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _357 = float(_87);
        float _359 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _361 = _359 * _353;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = _357;
        _373 = true;
    }
    else
    {
        float _375 = float(_87);
        float _377 = 1.0 / _375;
        float _379 = _121 * _377;
        _369 = _379;
        _371 = _375;
    }
    _373 = false;
    float _381 = _369;
    float _383 = _371;
    float _385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _387 = int(_385);
    float _389 = in.m_51.z;
    float _391 = in.m_51.w;
    float _393 = _141 * 2.0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _397 = _395 != 0;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _405 = _403 != 0;
    float _407 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _409 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    bool _415 = !_405;
    int _417 = _415 ? 0 : 1;
    float _419 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _421 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _409);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _425 = _381 + _423;
    float _427 = 1.0 / _383;
    float _429 = float(_387);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = _381 + _431;
    float _435 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[5].z, _421);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _439 = _381 + _437;
    float _441 = _435 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _443 = 1.0 / _429;
    float _445 = float(uint(_413));
    float _447 = _389 * 2.0;
    int _449 = ~_413;
    int _451 = _449 + 1;
    bool _453 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _455 = isnan(_381);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    bool _465 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _467 = isnan(_381);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = 1.0 / _445;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _487 = _121 * _443;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _489;
    float _493 = floor(_447);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _499 = as_type<int>(_477) + (-2);
    float _501 = trunc(_487);
    int _503 = int(_501);
    float _505 = _447 + (-1.0);
    float _507 = floor(_393);
    bool _509 = _493 > 0.0;
    float _511 = float(uint(_503));
    float _513 = _393 + (-1.0);
    float _515 = as_type<float>(_499) * _511;
    bool _517 = _507 > 0.0;
    float _519 = trunc(_515);
    float _521 = precise::max(_519, 0.0);
    uint _524 = uint(_521);
    bool _526 = _507 >= 0.0;
    bool _528 = isnan(_507);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    bool _536 = !_401;
    int _538 = _536 ? 0 : 1;
    bool _540 = _493 >= 0.0;
    bool _542 = isnan(_493);
    bool _544 = _540 || _542;
    bool _546 = isnan(0.0);
    bool _548 = _544 || _546;
    int _550 = ~_413;
    int _552 = _550 + 1;
    bool _554 = !_397;
    int _556 = _554 ? 0 : 1;
    int _558 = _548 ? 0 : 1;
    int _560 = abs(_538);
    int _562 = ~_558;
    int _564 = _562 + 1;
    int _566 = _564 + 1;
    int _568 = _451 * int(_524);
    int _570 = _568 + _503;
    int _572 = _566;
    if (!_509)
    {
        int _574 = ~_558;
        int _576 = _574 + 1;
        _572 = _576;
    }
    int _578 = _572;
    float _580 = float(uint(_570));
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _586 = abs(_556);
    float _588 = as_type<float>(_499) * _580;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _592 = _590 != 0;
    float _594 = 1.0 / _584;
    int _596 = _534 ? 0 : 1;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _608 = _606 != 0;
    int _610 = ~_596;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    int _616 = _614;
    if (!_517)
    {
        int _618 = ~_596;
        int _620 = _618 + 1;
        _616 = _620;
    }
    int _622 = _616;
    float _624 = trunc(_588);
    float _626 = precise::max(_624, 0.0);
    uint _628 = uint(_626);
    bool _630 = !_592;
    float _632 = _630 ? 7.345489978790283203125 : 1.0;
    bool _634 = !_600;
    int _636 = _634 ? 0 : 1;
    float _638 = float(_413);
    float _640 = _632 * _141;
    int _642 = abs(_636);
    float _644 = _439 * _594;
    float _646 = as_type<float>(int(gl_VertexIndex));
    float _648 = floor(_640);
    float _650 = float(_622);
    float _652 = fma(_485, _644, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _654 = fma(_497, _644, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _656 = int(_524) + int(_628);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _666 = _552 * _656;
    int _668 = _666 + _503;
    float _670 = 1.0 / _660;
    bool _672 = uint(_668) >= uint(_413);
    float _674 = in.m_51.y;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _682 = _680 != 0;
    float _684 = 1.0 / _664;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _688 = _686 != 0;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _692 = _690 != 0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _694;
    bool _698 = !_678;
    int _700 = _698 ? 0 : 1;
    bool _702 = !_672;
    int _704 = _702 ? 0 : (-1);
    float _706 = 1.0 / _696;
    int _708 = as_type<int>(_646) & 1;
    bool _710 = _708 != 0;
    int _712 = as_type<int>(_646) & 2;
    bool _714 = _712 != 0;
    float _716 = _425 * _670;
    bool _718 = !_604;
    int _720 = _718 ? 0 : 1;
    float _722 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _724 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _726 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _407);
    float _728 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _419);
    float _730 = _674 * 2.0;
    float _732 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _734 = log2(_732);
    float _736 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _724);
    float _738 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _722);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _742 = _381 + _740;
    float _744 = _433 * _706;
    float _746 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _738);
    float _748 = _742 * _684;
    float _750 = floor(_730);
    float _752 = _121 * _638;
    float _754 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[4].z, _726);
    float _756 = fma(_345, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _758 = _141 + _674;
    float _760 = _752 * _427;
    float _762 = _674 + _389;
    float _764 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _736);
    float _766 = _121 * _734;
    float _768 = _762 + (-1.0);
    float _770 = _758 + (-1.0);
    float _772 = fma(_481, _744, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _774 = exp2(_766);
    float _776 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _778 = _750 >= 0.0;
    bool _780 = isnan(_750);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _790 = _121 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _792 = _786 ? 0 : 1;
    float _794 = _391 * 6.283185482025146484375;
    bool _796 = _750 > 0.0;
    float _798 = _141 + _389;
    int _800 = ~_792;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _814 = _798 + (-1.0);
    float _816 = fma(_790, 0.100000001490116119384765625, _794);
    float _818 = fma(_808, _716, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _820 = -_774;
    float _822 = _820 + 1.0;
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _826 = fma(_812, _748, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _828 = fma(_790, 0.00999999977648258209228515625, _794);
    int _830 = _804;
    if (!_796)
    {
        int _832 = ~_792;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = _790 * _391;
    float _840 = _838 * 0.125;
    bool _842 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _844 = isnan(0.0);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _850 = _846 || _848;
    float _852 = fma(_391, 2.0, -1.0);
    float _854 = fma(_491, _744, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _856 = _730 + (-1.0);
    float _858 = _850 ? _822 : 0.0;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _868 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _870 = isnan(1.0);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _876 = _872 || _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _880 = 1.0 + _878;
    float _882 = fma(_862, _716, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _884 = fma(_866, _748, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _886 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _888 = isnan(_381);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _505 * _505;
    bool _900 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _902 = isnan(_381);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _880;
    bool _914 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _916 = isnan(_381);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_896;
    float _928 = _926 + 1.0;
    float _930 = fma(_856, _856, _898);
    float _932 = -_910;
    float _934 = _932 + 1.0;
    bool _936 = !_608;
    int _938 = _936 ? 0 : 1;
    float _940 = _910 * _928;
    float _942 = fma(_852, _852, _930);
    float _944 = _463 * _934;
    float _946 = -_463;
    float _948 = _946 + 1.0;
    float _950 = sqrt(_746);
    float _952 = float(_836);
    float _954 = _816 * 0.15915493667125701904296875;
    float _956 = _475 * _948;
    float _958 = -_475;
    float _960 = _958 + 1.0;
    float _962 = _754 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = _858 * _912;
    float _966 = float(_503);
    float _968 = _924 * _960;
    float _970 = _954 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = _756 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _976 = _966 >= _638;
    bool _978 = isnan(_966);
    bool _980 = _976 || _978;
    bool _982 = isnan(_638);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _818 * _968;
    float _990 = _882 * _968;
    float _992 = -_648;
    float _994 = _640 + _992;
    bool _996 = !_876;
    float _998 = _996 ? _121 : _964;
    float _1000 = _349 * _950;
    float _1002 = -_924;
    float _1004 = _1002 + 1.0;
    int _1006 = abs(_720);
    float _1008 = _994 * _638;
    float _1010 = rsqrt(_942);
    float _1012 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[143].x, _988);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[143].y, _990);
    float _1016 = _828 * 0.15915493667125701904296875;
    bool _1018 = _413 == 0;
    float _1020 = fma(_826, _956, _1012);
    float _1022 = fma(_884, _956, _1014);
    float _1024 = in.m_58.x;
    float _1026 = in.m_58.y;
    float _1028 = in.m_58.z;
    int _1030 = abs(_938);
    float _1032 = trunc(_986);
    int _1034 = int(_1032);
    float _1036 = float(_1006);
    float _1038 = fma(_772, _944, _1020);
    float _1040 = fma(_854, _944, _1022);
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1044 = _1042 != 0;
    float _1046 = _1036 * _650;
    float _1048 = float(_642);
    float _1050 = trunc(_1008);
    int _1052 = int(_1050);
    float _1054 = float(_578);
    float _1056 = _1046 * (-2.0);
    float _1058 = float(_1030);
    float _1060 = _1010 * _972;
    int _1062 = abs(_700);
    float _1064 = _1048 * _1054;
    float _1066 = fma(_652, _940, _1038);
    float _1068 = _1058 * _952;
    float _1070 = _1016 * 6.283185482025146484375;
    float _1072 = sin(_1070);
    int _1074 = ~_656;
    int _1076 = _1074 + _704;
    int _1078 = _1076 + 1;
    float _1080 = fma(_776, _1056, _776);
    int _1082 = ~_1034;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = fma(_1056, _1026, _1026);
    float _1090 = -_441;
    float _1092 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1094 = _1052 * _1062;
    int _1096 = _1094 + _503;
    float _1098 = -_962;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1102 = _413 * _1078;
    int _1104 = _1102 + _503;
    float _1106 = _1092 * _1092;
    float _1108 = trunc(_760);
    int _1110 = int(_1108);
    float _1112 = -_974;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1116 = float(uint(_1096));
    float _1118 = fma(_1100, _1100, _1106);
    bool _1120 = !_1018;
    int _1122 = _1120 ? _1104 : (-1);
    float _1124 = _674 + (-0.5);
    float _1126 = _856 + _1072;
    float _1128 = fma(_1114, _1114, _1118);
    float _1130 = _1016 * 6.283185482025146484375;
    float _1132 = cos(_1130);
    int _1134 = _1122 * _1086;
    int _1136 = _413 + (-1);
    float _1138 = _1126 * _1126;
    float _1140 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1088);
    int _1142 = abs(_417);
    float _1144 = as_type<float>(_499) * _1116;
    int _1146 = _1034 * _1136;
    int _1148 = _1146 + _1134;
    float _1150 = fma(_513, _513, _1138);
    float _1152 = _1064 * (-2.0);
    float _1154 = fma(_998, _1080, _1140);
    bool _1156 = !_1044;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = rsqrt(_1128);
    int _1162 = _1148 * _560;
    float _1164 = fma(_1152, _1024, _1024);
    float _1166 = _1154 * 0.15915493667125701904296875;
    float _1168 = _141 + (-0.5);
    int _1170 = abs(_1158);
    int _1172 = _1110 * _586;
    int _1174 = _1172 + _1162;
    float _1176 = _505 + _1132;
    float _1178 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1164);
    int _1180 = _1096 * _1142;
    int _1182 = _1180 + _1174;
    float _1184 = fma(_1176, _1176, _1150);
    float _1186 = fma(_788, _1152, _788);
    float _1188 = _1166 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    int _1192 = _1052 * _1170;
    int _1194 = _1192 + _1182;
    float _1196 = _1114 * _1160;
    float _1198 = _1092 * _1160;
    float _1200 = fma(_998, _1186, _1178);
    float _1202 = in.m_53.x;
    float _1204 = in.m_53.y;
    float _1206 = float(uint(_1194));
    float _1208 = fma(_654, _940, _1040);
    float _1210 = rsqrt(_1184);
    float _1212 = _1100 * _1160;
    int _1214 = ~_413;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_499) * _1206;
    float _1220 = _389 + (-0.5);
    float _1222 = _1200 * 0.15915493667125701904296875;
    float _1224 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1066);
    float _1226 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1208);
    float _1228 = _1166 * 6.283185482025146484375;
    float _1230 = cos(_1228);
    float _1232 = _840 * (-0.15915493667125701904296875);
    float _1234 = _1060 * 0.300000011920928955078125;
    float _1236 = trunc(_1218);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = _1068 * (-2.0);
    float _1244 = _1126 * _1210;
    float _1246 = _513 * _1210;
    float _1248 = _1176 * _1210;
    float _1250 = fma(_1242, _1028, _1028);
    float _1252 = _1244 * _1244;
    float _1254 = fma(_824, _1242, _824);
    float _1256 = trunc(_1144);
    float _1258 = precise::max(_1256, 0.0);
    uint _1260 = uint(_1258);
    float _1262 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1250);
    float _1264 = fma(_1246, _1246, _1252);
    float _1266 = _1224 * _1202;
    float _1268 = fma(_998, _1254, _1262);
    float _1270 = _1226 * _1204;
    float _1272 = fma(_1248, _1248, _1264);
    float _1274 = rsqrt(_746);
    int _1276 = _1216 * int(_1240);
    int _1278 = _1276 + _1194;
    float _1280 = _1268 * 0.15915493667125701904296875;
    float _1282 = float(uint(_1278));
    float _1284 = rsqrt(_764);
    int _1286 = _1216 * int(_1260);
    int _1288 = _1286 + _1096;
    float _1290 = as_type<float>(_499) * _1282;
    bool _1292 = !_714;
    float _1294 = _1292 ? (-0.5) : 0.5;
    float _1296 = float(uint(_1288));
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1300 = _1212 * _1298;
    float _1302 = rsqrt(_1272);
    float _1304 = _1266 * _1274;
    float _1306 = as_type<float>(_499) * _1296;
    float _1308 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1310 = -_1300;
    float _1312 = fma(_1196, _1308, _1310);
    float _1314 = _1304 * _1000;
    float _1316 = trunc(_1290);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    float _1322 = _1270 * _1284;
    bool _1324 = !_710;
    float _1326 = _1324 ? (-0.5) : 0.5;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1332 = _1198 * _1330;
    float _1334 = _1322 * _1000;
    float _1336 = _1312 * _1312;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1326);
    float _1340 = _1222 * 6.283185482025146484375;
    float _1342 = sin(_1340);
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1294);
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1348 = _1328 * _1338;
    float _1350 = _1246 * _1302;
    int _1352 = ~_413;
    int _1354 = _1352 + 1;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1332;
    float _1360 = fma(_1212, _1356, _1358);
    int _1362 = ~_413;
    int _1364 = _1362 + 1;
    float _1366 = _1222 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    int _1370 = int(_1240) + int(_1320);
    float _1372 = trunc(_1306);
    float _1374 = precise::max(_1372, 0.0);
    uint _1376 = uint(_1374);
    float _1378 = _1342 * _1230;
    int _1380 = _1354 * _1370;
    int _1382 = _1380 + _1194;
    bool _1384 = uint(_1382) >= uint(_413);
    float _1386 = _1280 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1392 = _1196 * _1390;
    float _1394 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1396 = -_1392;
    float _1398 = fma(_1198, _1394, _1396);
    float _1400 = _1346 * _1344;
    float _1402 = _1248 * _1302;
    float _1404 = _1280 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = fma(_1398, _1398, _1336);
    float _1410 = _1244 * _1302;
    float _1412 = _1368 * _1190;
    int _1414 = int(_1260) + int(_1376);
    float _1416 = fma(_1360, _1360, _1408);
    float _1418 = _1342 * _1190;
    float _1420 = _1368 * _1230;
    float _1422 = _1232 * 6.283185482025146484375;
    float _1424 = cos(_1422);
    float _1426 = -_1412;
    float _1428 = fma(_1388, _1378, _1426);
    float _1430 = -_1378;
    float _1432 = fma(_1388, _1412, _1430);
    float _1434 = fma(_1388, _1420, _1418);
    float _1436 = fma(_1388, _1418, _1420);
    float _1438 = -_1400;
    float _1440 = _1388 * _1438;
    int _1442 = _1364 * _1414;
    int _1444 = _1442 + _1096;
    float _1446 = rsqrt(_1416);
    float _1448 = _1230 * _1406;
    bool _1450 = !_1384;
    int _1452 = _1450 ? 0 : (-1);
    float _1454 = _1406 * _1400;
    float _1456 = _1190 * _1406;
    float _1458 = fma(_1448, _1348, _1440);
    int _1460 = ~_1370;
    int _1462 = _1460 + _1452;
    int _1464 = _1462 + 1;
    float _1466 = _1368 * _1454;
    float _1468 = _1232 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    float _1472 = _1342 * _1454;
    float _1474 = _1402 * _1402;
    int _1476 = _413 * _1464;
    int _1478 = _1476 + _1194;
    float _1480 = -_1424;
    float _1482 = _1480 + 1.0;
    bool _1484 = uint(_1444) >= uint(_413);
    float _1486 = _1312 * _1446;
    float _1488 = _1350 * _1482;
    float _1490 = _1410 * _1482;
    float _1492 = _1398 * _1446;
    float _1494 = _1360 * _1446;
    float _1496 = fma(_1482, _1474, _1424);
    float _1498 = _1402 * _1470;
    float _1500 = _1350 * _1470;
    float _1502 = _1410 * _1470;
    float _1504 = fma(_1410, _1490, _1424);
    float _1506 = fma(_1410, _1488, _1498);
    float _1508 = -_1498;
    float _1510 = fma(_1410, _1488, _1508);
    float _1512 = fma(_1402, _1490, _1500);
    float _1514 = -_1500;
    float _1516 = fma(_1402, _1490, _1514);
    bool _1518 = !_1018;
    int _1520 = _1518 ? _1478 : (-1);
    float _1522 = fma(_1434, _1348, _1466);
    float _1524 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1526 = fma(_1350, _1488, _1424);
    int _1528 = _1520 >> 31;
    float _1530 = -_1502;
    float _1532 = fma(_1402, _1488, _1530);
    float _1534 = fma(_1432, _1524, _1522);
    float _1536 = fma(_1402, _1488, _1502);
    int _1538 = _1528 & 3;
    float _1540 = fma(_1428, _1348, _1472);
    float _1542 = _1212 * _1494;
    float _1544 = fma(_1456, _1524, _1458);
    int _1546 = _1520 + _1538;
    float _1548 = _1196 * _1486;
    float _1550 = -_1542;
    float _1552 = fma(_1196, _1492, _1550);
    bool _1554 = !_1484;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = fma(_1436, _1524, _1540);
    int _1560 = _1546 >> 2;
    float _1562 = _1552 * _1534;
    int _1564 = ~_1414;
    int _1566 = _1564 + _1556;
    int _1568 = _1566 + 1;
    float _1570 = -_1548;
    float _1572 = fma(_1198, _1494, _1570);
    int _1574 = _1560 << 4;
    int _1576 = _1574 + 368;
    float _1578 = _1198 * _1492;
    float _1580 = fma(_1486, _1544, _1562);
    float _1582 = _1572 * _1534;
    uint _1584 = uint(int(uint(_1576) >> uint(2)));
    uint _1586 = uint(int(uint(int(_1584)) >> uint(2)));
    int _1588 = int(_1584) & 3;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[int(_1586)][_1588];
    int _1592 = int(_1584) + 1;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    int _1596 = _1592 & 3;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[int(_1594)][_1596];
    float _1600 = -_1578;
    float _1602 = fma(_1212, _1486, _1600);
    float _1604 = fma(_1198, _1558, _1580);
    float _1606 = fma(_1492, _1544, _1582);
    int _1608 = _1520 & 3;
    bool _1610 = _1608 != 0;
    float _1612 = _1602 * _1534;
    int _1614 = _1520 & 3;
    bool _1616 = _1614 != 0;
    float _1618 = fma(_1212, _1558, _1606);
    bool _1620 = uint(_1608) > 1u;
    float _1622 = fma(_1494, _1544, _1612);
    int _1624 = _1576 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    int _1634 = int(_1626) + 1;
    uint _1636 = uint(int(uint(_1634) >> uint(2)));
    int _1638 = _1634 & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    float _1642 = _441 + _1604;
    float _1644 = _962 + _1618;
    float _1646 = fma(_1196, _1558, _1622);
    int _1648 = _413 * _1568;
    int _1650 = _1648 + _1096;
    float _1652 = fma(_505, _1234, _1642);
    float _1654 = fma(_856, _1234, _1644);
    float _1656 = _974 + _1646;
    float _1658 = -_441;
    float _1660 = _1658 + _1652;
    float _1662 = -_962;
    float _1664 = _1662 + _1654;
    float _1666 = fma(_852, _1234, _1656);
    int _1668 = _1616 ? 0 : 1;
    float _1670 = _1504 * _1660;
    float _1672 = _1512 * _1660;
    float _1674 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1676 = int(_1674);
    int _1678 = ~_1668;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1506, _1664, _1670);
    int _1686 = _1682;
    if (!_1620)
    {
        int _1688 = ~_1668;
        int _1690 = _1688 + 1;
        _1686 = _1690;
    }
    int _1692 = _1686;
    float _1694 = fma(_1532, _1664, _1672);
    bool _1696 = _1608 != 3;
    float _1698 = -_974;
    float _1700 = _1698 + _1666;
    bool _1702 = !_1610;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = _1510 * _1660;
    bool _1708 = uint(_1608) >= 2u;
    float _1710 = fma(_1516, _1700, _1684);
    int _1712 = abs(_1692);
    float _1714 = fma(_1526, _1664, _1706);
    int _1716 = _1708 ? 0 : 1;
    float _1718 = fma(_1496, _1700, _1694);
    int _1720 = abs(_1704);
    float _1722 = fma(_1536, _1700, _1714);
    int _1724 = ~_1712;
    int _1726 = _1724 + 1;
    int _1728 = _1726 + 1;
    float _1730 = _840 * 0.15915493667125701904296875;
    int _1732 = ~_1716;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = _974 + _1718;
    bool _1740 = _1608 != 3;
    int _1742 = _1736;
    if (_1696)
    {
        int _1744 = ~_1716;
        int _1746 = _1744 + 1;
        _1742 = _1746;
    }
    int _1748 = _1742;
    int _1750 = _1728 * as_type<int>(_1598);
    int _1752 = ~_1720;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    bool _1758 = !_1740;
    int _1760 = _1758 ? 0 : (-1);
    int _1762 = abs(_1748);
    int _1764 = _1756 * as_type<int>(_1590);
    int _1766 = _1764 + _1750;
    float _1768 = float(uint(_1676));
    float _1770 = _1730 * 6.283185482025146484375;
    float _1772 = sin(_1770);
    int _1774 = abs(_1760);
    bool _1776 = !_682;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = abs(_1676);
    float _1782 = 1.0 / _1768;
    int _1784 = abs(_1778);
    int _1786 = ~_1774;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    float _1792 = float(uint(_1780));
    int _1794 = ~_1762;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = ~_1784;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    float _1806 = 1.0 / _1792;
    bool _1808 = !_1018;
    int _1810 = _1808 ? _1650 : (-1);
    int _1812 = _1798 * as_type<int>(_1632);
    int _1814 = _1812 + _1766;
    float _1816 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1818 = ~_1780;
    int _1820 = _1818 + 1;
    int _1822 = _1790 * as_type<int>(_1640);
    int _1824 = _1822 + _1814;
    float _1826 = _962 + _1722;
    float _1828 = _1730 * 6.283185482025146484375;
    float _1830 = cos(_1828);
    float _1832 = _441 + _1710;
    int _1834 = _1824 * _1804;
    float _1836 = _1402 * _1772;
    float _1838 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1840 = _1832 + _1838;
    int _1842 = _1810 * _1784;
    int _1844 = _1842 + _1834;
    int _1846 = as_type<int>(_1782) + (-2);
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1850 = as_type<int>(_1806) + (-2);
    float _1852 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1854 = _1826 + _1852;
    int _1856 = abs(_1844);
    float _1858 = -_1848;
    float _1860 = fma(_1816, 2.0, _1858);
    float _1862 = float(uint(_1844));
    float _1864 = -_1830;
    float _1866 = _1864 + 1.0;
    float _1868 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1870 = as_type<float>(_1846) * _1862;
    float _1872 = float(uint(_1856));
    float _1874 = _1350 * _1866;
    int _1876 = ~_1676;
    int _1878 = _1876 + 1;
    float _1880 = _1868 * _141;
    bool _1882 = _141 > 0.5;
    float _1884 = -_1836;
    float _1886 = fma(_1410, _1874, _1884);
    float _1888 = as_type<float>(_1850) * _1872;
    float _1890 = trunc(_1870);
    float _1892 = precise::max(_1890, 0.0);
    uint _1894 = uint(_1892);
    float _1896 = fma(_1350, _1874, _1830);
    float _1898 = _1886 * _1840;
    float _1900 = _1350 * _1772;
    float _1902 = _1410 * _1772;
    int _1904 = ~_1780;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1896, _1854, _1898);
    float _1910 = fma(_1474, _1866, _1830);
    float _1912 = trunc(_1888);
    float _1914 = precise::max(_1912, 0.0);
    uint _1916 = uint(_1914);
    float _1918 = _1410 * _1866;
    float _1920 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1922 = _1738 + _1920;
    float _1924 = -_1902;
    float _1926 = fma(_1402, _1874, _1924);
    float _1928 = fma(_1402, _1874, _1902);
    float _1930 = fma(_1402, _1918, _1900);
    bool _1932 = _674 > 0.5;
    float _1934 = trunc(_1880);
    int _1936 = int(_1934);
    float _1938 = _1930 * _1840;
    int _1940 = _1878 * int(_1894);
    int _1942 = _1940 + _1844;
    float _1944 = fma(_1928, _1922, _1908);
    float _1946 = fma(_1926, _1854, _1938);
    float _1948 = float(uint(_1942));
    int _1950 = _1820 * int(_1916);
    int _1952 = _1950 + _1856;
    float _1954 = fma(_1910, _1922, _1946);
    float _1956 = _1944 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1958 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1960 = float(uint(_1952));
    float _1962 = as_type<float>(_1846) * _1948;
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    int _1966 = _1936 << 4;
    int _1968 = _1966 + 1968;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1972 = as_type<float>(_1850) * _1960;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = _1968 + 8;
    uint _1982 = uint(int(uint(_1980) >> uint(2)));
    uint _1984 = uint(int(uint(int(_1982)) >> uint(2)));
    int _1986 = int(_1982) & 3;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[int(_1984)][_1986];
    float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1992 = _1956 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1996 = _1964 + _1994;
    float _1998 = _674 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2000 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1970);
    float _2002 = _1992 * _1992;
    float _2004 = _1996 * _1996;
    float _2006 = trunc(_1972);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    uint _2012 = uint(int(uint(_1968) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    float _2028 = fma(_1998, -2.0, _1958);
    float _2030 = _2002 + _2004;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2034 = ~_1676;
    int _2036 = _2034 + 1;
    float _2038 = sqrt(_2030);
    int _2040 = int(_1894) + int(_1978);
    float _2042 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2032);
    float _2044 = fma(_1410, _1918, _1830);
    float _2046 = fma(_1410, _1874, _1836);
    float _2048 = -_1900;
    float _2050 = fma(_1402, _1918, _2048);
    float _2052 = _2044 * _1840;
    int _2054 = int(_1916) + int(_2010);
    int _2056 = _2036 * _2040;
    int _2058 = _2056 + _1844;
    float _2060 = -_1326;
    int _2062 = _1882 ? as_type<int>(_2060) : as_type<int>(_1326);
    float _2064 = fma(_2046, _1854, _2052);
    int _2066 = _1906 * _2054;
    int _2068 = _2066 + _1856;
    bool _2070 = uint(_2058) >= uint(_1676);
    float _2072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2074 = _2038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2076 = fma(_2050, _1922, _2064);
    bool _2078 = uint(_2068) >= uint(_1780);
    bool _2080 = !_2070;
    int _2082 = _2080 ? 0 : (-1);
    float _2084 = _2076 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2086 = !_688;
    float _2088 = _2086 ? _1326 : as_type<float>(_2062);
    float _2090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2092 = ~_2040;
    int _2094 = _2092 + _2082;
    int _2096 = _2094 + 1;
    int _2098 = _1844 ^ _1676;
    bool _2100 = !_2078;
    int _2102 = _2100 ? 0 : (-1);
    uint _2104 = uint(int(uint(_2098) >> uint(31)));
    int _2106 = ~_2102;
    int _2108 = _2054 + _2106;
    int _2110 = _2108 + 1;
    int _2112 = ~int(_2104);
    int _2114 = _2112 + 1;
    float _2116 = as_type<float>(_2098);
    float _2118 = _2044;
    float _2120 = as_type<float>(_2104);
    float _2122 = _2002;
    float _2124 = _2004;
    if (!_2074)
    {
        _2116 = _1956;
    }
    float _2126 = _2116;
    float _2128 = _2126;
    if (!_2074)
    {
        _2118 = _1964;
    }
    float _2130 = _2118;
    float _2132 = _2130;
    if (!_2074)
    {
        _2120 = _2084;
    }
    float _2134 = _2120;
    bool _2136 = !_2074;
    float _2138 = _2134;
    if (!_2136)
    {
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2144 = _2038 + _2142;
        float _2146 = rsqrt(_2030);
        float _2148 = _2144 * _2140;
        float _2150 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2152 = _2148 * 0.15915493667125701904296875;
        float _2154 = _2152 * 6.283185482025146484375;
        float _2156 = sin(_2154);
        float _2158 = _2152 * 6.283185482025146484375;
        float _2160 = cos(_2158);
        float _2162 = fma(_2156, _2150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2164 = _2146 * _2162;
        float _2166 = _2160 + (-1.0);
        float _2168 = fma(_1992, _2164, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2170 = fma(_1996, _2164, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2172 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2176 = _2168 + _2174;
        float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2180 = _2170 + _2178;
        float _2182 = fma(_2084, _2160, _2172);
        float _2184 = _2176 * _2176;
        float _2186 = _2180 * _2180;
        _2138 = _2182;
        _2122 = _2184;
        _2124 = _2186;
        _2128 = _2168;
        _2132 = _2170;
    }
    float _2188 = _2138;
    float _2190 = _2122;
    float _2192 = _2124;
    float _2194 = _2128;
    float _2196 = _2132;
    int _2198 = _2110 ^ _2114;
    int _2200 = _1676 * _2096;
    int _2202 = _2200 + _1844;
    bool _2204 = _1676 == 0;
    float _2206 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2208 = _1676 == 0;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2212 = _2188 + _2210;
    int _2214 = ~_2114;
    int _2216 = _2214 + _2198;
    int _2218 = _2216 + 1;
    float _2220 = -_121;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1860);
    bool _2224 = !_2204;
    int _2226 = _2224 ? _2202 : (-1);
    float _2228 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2230 = !_2208;
    int _2232 = _2230 ? _2218 : (-1);
    float _2234 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2028);
    float _2236 = -_1294;
    int _2238 = _1932 ? as_type<int>(_2236) : as_type<int>(_1294);
    float _2240 = fma(_2212, _2212, _2190);
    float _2242 = float(_2226);
    float _2244 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2000);
    float _2246 = float(_2232);
    float _2248 = _2240 + _2192;
    bool _2250 = !_692;
    float _2252 = _2250 ? _1294 : as_type<float>(_2238);
    float _2254 = fma(_2206, _2242, _2222);
    float _2256 = _2088 + 0.5;
    float _2258 = -_2234;
    float _2260 = fma(_2228, _2246, _2258);
    float _2262 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2042);
    float _2264 = _2252 + (-0.5);
    float _2266 = fma(_2206, _2256, _2254);
    float _2268 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2270 = -_2228;
    float _2272 = fma(_2270, _2264, _2260);
    float _2274 = _2026 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2276 = -_2244;
    float _2278 = _2276 + 1.0;
    float _2280 = sqrt(_2248);
    float _2282 = -_2278;
    float _2284 = fma(_2088, _2282, _2266);
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2288 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2292 = _1988 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2294 = -_2262;
    float _2296 = _2294 + 1.0;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2300 = _2286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2304 = _2290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2308 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2310 = _2292 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2312 = fma(_2252, _2296, _2272);
    out.m_60.x = _2300;
    out.m_60.y = _2302;
    out.m_60.z = _2304;
    out.m_60.w = _2298;
    bool _2314 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2316 = isnan(_2280);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2322 = _2318 || _2320;
    out.m_62.x = _2306;
    out.m_62.y = _2308;
    out.m_62.z = _2310;
    out.m_64.x = _2284;
    out.m_64.y = _2312;
    float _2324 = _2268;
    float _2326 = _2274;
    float _2328 = _2278;
    float _2330 = _2266;
    float _2332 = _2196;
    if (!_2322)
    {
        _2324 = 1.0;
    }
    float _2334 = _2324;
    bool _2336 = !_2322;
    float _2338 = _2334;
    if (!_2336)
    {
        bool _2340 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2342 = isnan(_2280);
        bool _2344 = _2340 || _2342;
        bool _2346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2348 = _2344 || _2346;
        if (!_2348)
        {
            float _2350 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2352 = _2280 + _2350;
            float _2354 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2356 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2354;
            float _2358 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2362 = 1.0 / _2356;
            float _2364 = _2352 * _2362;
            float _2366 = fma(_2364, _2360, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2338 = _2366;
            _2368 = true;
        }
        else
        {
            bool _2370 = _2280 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2372 = isnan(_2280);
            bool _2374 = _2370 || _2372;
            bool _2376 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2378 = _2374 || _2376;
            if (!_2378)
            {
                float _2380 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2382 = _2280 + _2380;
                float _2384 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2386 = _2384 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2388 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2390 = _2388 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2392 = 1.0 / _2386;
                float _2394 = _2382 * _2392;
                float _2396 = fma(_2394, _2390, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2338 = _2396;
                _2368 = true;
            }
            else
            {
                _2338 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2368 = false;
    float _2398 = _2338;
    float _2400 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2402 = _2188 + _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2406 = _2194 + _2404;
    float _2408 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2410 = _2196 + _2408;
    float _2412 = fma(_2402, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2414 = fma(_2406, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2416 = fma(_2410, _2398, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2420 = _2412 + _2418;
    float _2422 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2424 = _2414 + _2422;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2428 = _2416 + _2426;
    float _2430 = _2420 * _2420;
    float _2432 = fma(_2424, _2424, _2430);
    float _2434 = fma(_2428, _2428, _2432);
    float _2436 = rsqrt(_2434);
    float _2438 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2440 = _2424 * _2438;
    float _2442 = _2428 * _2438;
    float _2444 = _2440 * _2440;
    float _2446 = _2442 * _2442;
    float _2448 = _2444 + _2446;
    float _2450 = sqrt(_2448);
    bool _2452 = _2450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2456 = _2450 + _2454;
    float _2458 = _2428;
    float _2460 = _2456;
    float _2462 = _2440;
    if (_2452)
    {
        float _2464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2458 = _2464;
    }
    float _2466 = _2458;
    if (_2452)
    {
        float _2468 = rsqrt(_2448);
        _2326 = _2468;
    }
    float _2470 = _2326;
    float _2472 = _2470;
    if (_2452)
    {
        float _2474 = _2456 * _2466;
        _2460 = _2474;
    }
    float _2476 = _2460;
    if (_2452)
    {
        float _2478 = _2476 * 0.15915493667125701904296875;
        _2328 = _2478;
    }
    float _2480 = _2328;
    float _2482 = _2430;
    if (_2452)
    {
        float _2484 = _2480 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        _2482 = _2486;
    }
    float _2488 = _2482;
    float _2490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2492 = precise::max(0.0, _2490);
    float _2494 = _2436;
    float _2496 = _2492;
    float _2498 = _2490;
    if (_2452)
    {
        float _2500 = _2480 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        _2494 = _2502;
    }
    float _2504 = _2494;
    float _2506 = -_2438;
    float _2508 = -_2492;
    float _2510 = fma(_2420, _2506, _2508);
    if (!_2452)
    {
        _2496 = _2442;
    }
    float _2512 = _2496;
    float _2514 = _2512;
    if (_2452)
    {
        float _2516 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2498 = _2516;
    }
    float _2518 = _2498;
    float _2520 = sqrt(_2434);
    float _2522 = _2488;
    float _2524 = _2518;
    if (_2452)
    {
        float _2526 = fma(_2488, _2518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2522 = _2526;
    }
    float _2528 = _2522;
    float _2530 = _2528;
    if (_2452)
    {
        float _2532 = _2504 + (-1.0);
        _2524 = _2532;
    }
    float _2534 = _2524;
    float _2536 = _2534;
    if (_2452)
    {
        float _2538 = _2470 * _2528;
        _2330 = _2538;
    }
    float _2540 = _2330;
    if (!_2452)
    {
        _2472 = _2510;
    }
    float _2542 = _2472;
    float _2544 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2546 = _2542;
    if (_2452)
    {
        float _2548 = _2534 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2332 = _2548;
    }
    float _2550 = _2332;
    if (_2452)
    {
        float _2552 = _2440 * _2540;
        _2462 = _2552;
    }
    float _2554 = _2462;
    if (!_2452)
    {
        _2530 = _2444;
    }
    float _2556 = _2530;
    float _2558 = _2556;
    if (_2452)
    {
        float _2560 = _2442 * _2540;
        _2514 = _2560;
    }
    float _2562 = _2514;
    if (_2452)
    {
        float _2564 = fma(_2510, _2504, _2550);
        _2546 = _2564;
    }
    float _2566 = _2546;
    if (_2452)
    {
        float _2568 = _2554 * _2554;
        _2558 = _2568;
    }
    float _2570 = _2558;
    if (!_2452)
    {
        _2536 = _2446;
    }
    float _2572 = _2536;
    float _2574 = _2572;
    if (_2452)
    {
        float _2576 = _2562 * _2562;
        _2574 = _2576;
    }
    float _2578 = _2574;
    float _2580 = fma(_2566, _2566, _2570);
    float _2582 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2544);
    float _2584 = _2580 + _2578;
    float _2586 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2590 = fma(_2520, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2588);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    float _2594 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2596 = rsqrt(_2584);
    float _2598 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2586);
    float _2600 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2602 = -_2592;
    float _2604 = _2602 + 1.0;
    float _2606 = _2412 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2608 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2598);
    float _2610 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2600);
    float _2612 = fma(_2414, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2606);
    float _2614 = _2608 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2616 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2610);
    float _2618 = abs(_2604);
    float _2620 = log2(_2618);
    float _2622 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2612);
    float _2624 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2582);
    float _2626 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2628 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2630 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2632 = _2596 * _2554;
    float _2634 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2636 = _2596 * _2566;
    float _2638 = _2596 * _2562;
    float _2640 = _2624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2642 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2634);
    float _2644 = _2632 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2646 = -_2628;
    float _2648 = fma(_2646, _2594, 1.0);
    float _2650 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2642);
    float _2652 = -_2644;
    float _2654 = fma(_2636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2652);
    float _2656 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2658 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2660 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2650);
    float _2662 = -_2638;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2654);
    float _2666 = exp2(_2656);
    float _2668 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2670 = fma(_2664, -0.5, 0.5);
    float _2672 = fma(_2664, 0.5, 0.5);
    float _2674 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2668);
    float _2676 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2658);
    float _2678 = _2636 + 1.0;
    float _2680 = log2(_2648);
    float _2682 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2674);
    float _2684 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2676);
    float _2686 = fma(_2672, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2688 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2684);
    float _2690 = fma(_2672, _2686, -0.212114393711090087890625);
    float _2692 = 1.0 / _2660;
    float _2694 = -_2636;
    float _2696 = fma(_2666, _2678, _2694);
    float _2698 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2682);
    float _2700 = fma(_2672, _2690, 1.570728778839111328125);
    float _2702 = fma(_2696, 0.5, 0.5);
    float _2704 = sqrt(_2670);
    float _2706 = _2680 * 0.693147182464599609375;
    float _2708 = _2698 * _2692;
    float _2710 = _2688 * _2692;
    float _2712 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2714 = fma(_2708, 0.5, 0.5);
    float _2716 = fma(_2710, -0.5, 0.5);
    float _2718 = _2704 * 0.636619746685028076171875;
    float3 _6807 = float3(_2714, _2716, _2712);
    float _2720 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6807, float3(0.0), isnan(_6807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6807, float3(0.0), isnan(_6807)), level(0.0)).x;
    float3 _6818 = float3(_2714, _2716, _2712);
    float4 _2723 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6818, float3(0.0), isnan(_6818)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6818, float3(0.0), isnan(_6818)), level(0.0)).xyzw;
    float _2725 = _2723.x;
    float _2727 = _2723.y;
    float _2729 = _2723.z;
    float _2731 = _2723.w;
    float _2733 = -_2700;
    float _2735 = fma(_2718, _2733, 1.0);
    float2 _6840 = float2(_2735, _2702);
    float3 _2739 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6840, float2(0.0), isnan(_6840)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6840, float2(0.0), isnan(_6840)), level(0.0)).xyz;
    float _2741 = _2739.x;
    float _2743 = _2739.y;
    float _2745 = _2739.z;
    float _2747 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2749 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2751 = fma(_2630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2749);
    float _2753 = exp2(_2747);
    float _2755 = fma(_2614, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2751);
    float _2757 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2755);
    float _2759 = _2757 + _2660;
    float _2761 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2698;
    out.gl_Position.y = _2688;
    out.gl_Position.z = _2757;
    out.gl_Position.w = _2660;
    float _2763 = _2759 * 0.5;
    float _2765 = -_2753;
    float _2767 = _2765 + 1.0;
    out.m_47.x = _2761;
    float _2769 = _2767 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2763;
    out.m_66.w = _2660;
    float _2771 = -_2769;
    float _2773 = _2771 + 1.0;
    float _2775 = _2769 * _2720;
    float _2777 = _2731 * _2775;
    float _2779 = _2731 * _2773;
    float _2781 = _2745 * _2775;
    float _2783 = fma(_2741, _2777, _2725);
    float _2785 = fma(_2743, _2777, _2727);
    float _2787 = fma(_2731, _2781, _2729);
    out.m_68.x = _2783;
    out.m_68.y = _2785;
    out.m_68.z = _2787;
    out.m_68.w = _2779;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

