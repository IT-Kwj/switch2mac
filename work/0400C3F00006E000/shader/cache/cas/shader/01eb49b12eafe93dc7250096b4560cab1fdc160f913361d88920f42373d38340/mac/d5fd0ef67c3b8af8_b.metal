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
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _553 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2930 = as_type<float>(_99);
        out.gl_Position.z = _2930;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_135);
        out.gl_Position.z = _2998;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = floor(_157);
    float _167 = _157 * 6.283185482025146484375;
    int _169 = as_type<int>(_143) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_143) & 2;
    bool _175 = _173 != 0;
    float _177 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _167 * 0.15915493667125701904296875;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_165;
    float _199 = _157 + _197;
    float _201 = _165;
    float _203 = _177;
    if (!_153)
    {
        float _205 = _177 * _177;
        float _207 = _205 * 0.5;
        _201 = _207;
    }
    float _209 = _201;
    float _211 = _209;
    if (!_153)
    {
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_153;
    float _219 = _215;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _177 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _177);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_153;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _177 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _203 = _273;
    }
    float _275 = _203;
    float _277 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = in.m_54.w;
    float _281 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _285 = in.m_42.x;
    float _287 = in.m_42.y;
    float _289 = in.m_42.z;
    float _291 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _293 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].x, _283);
    float _297 = fma(_191, 0.5, 0.5);
    float _299 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].y, _291);
    float _301 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].z, _293);
    float _303 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _305 = -_297;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _309 = _199 < 0.5;
    float _311 = float(_309);
    float _313 = _291;
    if (!_153)
    {
        float _315 = _117 * _117;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].x, _295);
    float _323 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].y, _299);
    float _325 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].z, _301);
    float _327 = -_199;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_275, _159, _321);
    float _333 = fma(_275, _161, _323);
    float _335 = fma(_275, _163, _325);
    float _337 = -_311;
    float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _341 = _325;
    float _343 = _319;
    if (!_153)
    {
        _341 = _117;
    }
    float _345 = _341;
    float _347 = _345;
    if (!_153)
    {
        float _349 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _343 = _349;
    }
    float _351 = _343;
    bool _353 = !_153;
    float _355 = _351;
    if (!_353)
    {
        float _357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = log2(_357);
        float _361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _363 = _361 + 1.0;
        float _365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = _117 * _359;
        float _369 = 1.0 / _363;
        float _371 = _365 * 0.693147182464599609375;
        float _373 = exp2(_367);
        float _375 = 1.0 / _371;
        float _377 = _373 + (-1.0);
        float _379 = -_377;
        float _381 = fma(_379, _375, _117);
        float _383 = _381 * _369;
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _385;
    }
    float _387 = _355;
    bool _389 = !_153;
    if (!_389)
    {
        float _391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = log2(_391);
        float _395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _397 = _395 + 1.0;
        float _399 = 1.0 / _397;
        float _401 = _117 * _393;
        float _403 = exp2(_401);
        float _405 = -_403;
        float _407 = _405 + 1.0;
        float _409 = _407 * _399;
        _347 = _409;
    }
    float _411 = _347;
    float _413 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _415 = fma(_331, _279, _285);
    float _417 = fma(_333, _279, _287);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _425 = _423 != 0;
    float _427 = fma(_335, _279, _289);
    float _429 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _431 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _433 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _435 = !_421;
    int _437 = _435 ? 0 : 1;
    float _439 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _441 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].x, _431);
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].y, _433);
    int _447 = abs(_437);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _439);
    bool _451 = !_181;
    int _453 = _451 ? 0 : 1;
    float _455 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].x, _443);
    float _457 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].y, _445);
    float _459 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].z, _449);
    int _461 = abs(_453);
    float _463 = fma(_411, _161, _457);
    float _465 = float(_447);
    float _467 = fma(_411, _159, _455);
    float _469 = -_463;
    float _471 = _333 + _469;
    bool _473 = !_425;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_411, _163, _459);
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _481 = abs(_329);
    float _483 = _465 * _481;
    float _485 = float(_461);
    float _487 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _489 = abs(_475);
    float _491 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _493 = -_467;
    float _495 = _331 + _493;
    float _497 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _499 = -_477;
    float _501 = _335 + _499;
    float _503 = fma(_485, _307, _483);
    float _505 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
    float _507 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _509 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[6].x, _497);
    float _511 = float(_489);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
    float _515 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
    float _517 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
    float _519 = abs(_339);
    float _521 = fma(_511, _519, _503);
    bool _523 = !_479;
    float _525 = _515;
    float _527 = _513;
    float _529 = _517;
    float _531 = _463;
    float _549;
    float _551;
    if (!_523)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _535 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _539 = _537 * _533;
        float _541 = float(_83);
        float _543 = floor(_539);
        float _545 = -_543;
        float _547 = _539 + _545;
        _549 = _541;
        _551 = _547;
        _553 = true;
    }
    else
    {
        float _555 = float(_83);
        float _557 = 1.0 / _555;
        float _559 = _117 * _557;
        _549 = _555;
        _551 = _559;
    }
    _553 = false;
    float _561 = _549;
    float _563 = _551;
    float _565 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _567 = int(_565);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _573 = int(_571);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _577 = float(_567);
    float _579 = 1.0 / _561;
    float _581 = float(uint(_573));
    float _583 = 1.0 / _577;
    int _585 = ~_573;
    int _587 = _585 + 1;
    float _589 = float(_573);
    float _591 = 1.0 / _581;
    float _593 = _117 * _583;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _597 = int(_595);
    int _599 = as_type<int>(_591) + (-2);
    float _601 = trunc(_593);
    int _603 = int(_601);
    float _605 = float(uint(_603));
    float _607 = as_type<float>(_599) * _605;
    int _609 = ~_573;
    int _611 = _609 + 1;
    float _613 = trunc(_607);
    float _615 = precise::max(_613, 0.0);
    uint _618 = uint(_615);
    int _620 = _611 * int(_618);
    int _622 = _620 + _603;
    float _624 = float(uint(_622));
    float _626 = as_type<float>(_599) * _624;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _630 = _628 != 0;
    float _632 = trunc(_626);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    bool _638 = !_630;
    float _640 = _638 ? 7.345489978790283203125 : 1.0;
    float _642 = _640 * _137;
    float _644 = floor(_642);
    int _646 = int(_618) + int(_636);
    float _648 = float(_603);
    int _650 = _587 * _646;
    int _652 = _650 + _603;
    bool _654 = _648 >= _589;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan(_589);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = uint(_652) >= uint(_573);
    float _668 = -_644;
    float _670 = _642 + _668;
    float _672 = trunc(_664);
    int _674 = int(_672);
    bool _676 = !_666;
    int _678 = _676 ? 0 : (-1);
    float _680 = _670 * _589;
    bool _682 = _573 == 0;
    float _684 = _117 * _589;
    int _686 = ~_646;
    int _688 = _686 + _678;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _702 = _700 != 0;
    float _704 = _684 * _579;
    float _706 = trunc(_680);
    int _708 = int(_706);
    int _710 = _573 * _690;
    int _712 = _710 + _603;
    bool _714 = !_698;
    int _716 = _714 ? 0 : 1;
    bool _718 = !_694;
    int _720 = _718 ? 0 : 1;
    int _722 = ~_674;
    int _724 = _722 + 1;
    int _726 = _724 + 1;
    float _728 = trunc(_704);
    int _730 = int(_728);
    bool _732 = !_682;
    int _734 = _732 ? _712 : (-1);
    int _736 = abs(_720);
    int _738 = _734 * _726;
    int _740 = _573 + (-1);
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _748 = _746 != 0;
    int _750 = _674 * _740;
    int _752 = _750 + _738;
    bool _754 = !_744;
    int _756 = _754 ? 0 : 1;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _760 = _758 != 0;
    int _762 = abs(_716);
    bool _764 = !_702;
    int _766 = _764 ? 0 : 1;
    bool _768 = !_760;
    int _770 = _768 ? 0 : 1;
    int _772 = abs(_756);
    int _774 = abs(_766);
    int _776 = _752 * _762;
    int _778 = abs(_770);
    int _780 = _708 * _772;
    int _782 = _780 + _603;
    int _784 = _730 * _736;
    int _786 = _784 + _776;
    int _788 = ~_573;
    int _790 = _788 + 1;
    int _792 = ~_573;
    int _794 = _792 + 1;
    int _796 = _782 * _774;
    int _798 = _796 + _786;
    float _800 = float(uint(_782));
    int _802 = _708 * _778;
    int _804 = _802 + _798;
    int _806 = ~_573;
    int _808 = _806 + 1;
    float _810 = as_type<float>(_599) * _800;
    float _812 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _814 = float(uint(_804));
    float _816 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _812);
    float _818 = trunc(_810);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = as_type<float>(_599) * _814;
    float _826 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].z, _816);
    float _828 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _830 = trunc(_824);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    int _836 = _808 * int(_834);
    int _838 = _836 + _804;
    float _840 = float(uint(_838));
    float _842 = as_type<float>(_599) * _840;
    float _844 = trunc(_842);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    int _850 = _790 * int(_822);
    int _852 = _850 + _782;
    float _854 = float(uint(_852));
    int _856 = int(_834) + int(_848);
    int _858 = _790 * _856;
    int _860 = _858 + _804;
    float _862 = as_type<float>(_599) * _854;
    bool _864 = uint(_860) >= uint(_573);
    float _866 = trunc(_862);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    bool _872 = !_864;
    int _874 = _872 ? 0 : (-1);
    int _876 = ~_856;
    int _878 = _876 + _874;
    int _880 = _878 + 1;
    int _882 = _573 * _880;
    int _884 = _882 + _804;
    bool _886 = !_682;
    int _888 = _886 ? _884 : (-1);
    int _890 = int(_822) + int(_870);
    float _892 = in.m_49.y;
    int _894 = _888 & 3;
    bool _896 = _894 != 0;
    int _898 = _888 & 3;
    bool _900 = _898 != 0;
    int _902 = _794 * _890;
    int _904 = _902 + _782;
    bool _906 = uint(_894) > 1u;
    int _908 = _900 ? 0 : 1;
    int _910 = _888 >> 31;
    int _912 = ~_908;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _920 = _918 != 0;
    int _922 = _916;
    if (!_906)
    {
        int _924 = ~_908;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _932 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _934 = uint(_894) >= 2u;
    float _936 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _930);
    int _938 = _910 & 3;
    float _940 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _932);
    float _942 = _137 * 2.0;
    int _944 = _934 ? 0 : 1;
    float _946 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _948 = _888 + _938;
    float _950 = floor(_942);
    bool _952 = uint(_904) >= uint(_573);
    float _954 = fma(_946, -2.0, _575);
    int _956 = _948 >> 2;
    float _958 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].z, _936);
    bool _960 = !_952;
    int _962 = _960 ? 0 : (-1);
    float _964 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].z, _940);
    int _966 = _956 << 4;
    int _968 = _966 + 368;
    float _970 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _972 = ~_890;
    int _974 = _972 + _962;
    int _976 = _974 + 1;
    float _978 = in.m_49.z;
    uint _980 = uint(int(uint(_968) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[int(_990)][_992];
    float _996 = -_569;
    float _998 = fma(_970, 2.0, _996);
    int _1000 = _573 * _976;
    int _1002 = _1000 + _782;
    bool _1004 = _894 != 3;
    float _1006 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1008;
    int _1012 = _968 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[int(_1024)][_1026];
    int _1030 = ~_944;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = _964 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1038;
    bool _1042 = !_748;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = 1.0 / _1010;
    bool _1048 = _950 >= 0.0;
    bool _1050 = isnan(_950);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1062 = !_682;
    int _1064 = _1062 ? _1002 : (-1);
    float _1066 = _892 * 2.0;
    int _1068 = _1034;
    if (_1004)
    {
        int _1070 = ~_944;
        int _1072 = _1070 + 1;
        _1068 = _1072;
    }
    int _1074 = _1068;
    bool _1076 = _950 > 0.0;
    float _1078 = 1.0 / _1040;
    bool _1080 = _894 != 3;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1084 = _563 + _1082;
    bool _1086 = !_896;
    int _1088 = _1086 ? 0 : 1;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1092 = _563 + _1090;
    int _1094 = abs(_928);
    int _1096 = _1056 ? 0 : 1;
    float _1098 = floor(_1066);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1110 = _1108 != 0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1114 = _563 + _1112;
    int _1116 = abs(_1088);
    int _1118 = ~_1094;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _1114 * _1046;
    int _1126 = abs(_1074);
    float _1128 = 1.0 / _1060;
    int _1130 = ~_1116;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    float _1136 = _1084 * _1078;
    float _1138 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1140 = log2(_1138);
    bool _1142 = !_1080;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = _1122 * as_type<int>(_994);
    int _1148 = ~_1126;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = abs(_1144);
    int _1156 = _1134 * as_type<int>(_986);
    int _1158 = _1156 + _1146;
    int _1160 = ~_1096;
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    float _1166 = _1092 * _1128;
    bool _1168 = _1098 >= 0.0;
    bool _1170 = isnan(_1098);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    int _1178 = _1152 * as_type<int>(_1020);
    int _1180 = _1178 + _1158;
    int _1182 = _1164;
    if (!_1076)
    {
        int _1184 = ~_1096;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = abs(_1044);
    float _1192 = _117 * _1140;
    int _1194 = abs(_597);
    float _1196 = _978 * 2.0;
    int _1198 = ~_1154;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = float(uint(_597));
    float _1206 = exp2(_1192);
    int _1208 = _1176 ? 0 : 1;
    int _1210 = _1202 * as_type<int>(_1028);
    int _1212 = _1210 + _1180;
    bool _1214 = _1098 > 0.0;
    float _1216 = _137 + _892;
    int _1218 = ~_1190;
    int _1220 = _1218 + 1;
    int _1222 = _1220 + 1;
    float _1224 = float(uint(_1194));
    float _1226 = 1.0 / _1204;
    float _1228 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _1230 = _1212 * _1222;
    float _1232 = _1216 + (-1.0);
    float _1234 = _137 + _978;
    int _1236 = _1064 * _1190;
    int _1238 = _1236 + _1230;
    float _1240 = _1228 * _137;
    float _1242 = 1.0 / _1224;
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1246 = _1234 + (-1.0);
    float _1248 = float(uint(_1238));
    float _1250 = _892 + _978;
    int _1252 = abs(_1238);
    float _1254 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1256 = ~_1208;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    float _1262 = floor(_1196);
    int _1264 = as_type<int>(_1226) + (-2);
    float _1266 = -_1206;
    float _1268 = _1266 + 1.0;
    int _1270 = _1260;
    if (!_1214)
    {
        int _1272 = ~_1208;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    float _1278 = _1250 + (-1.0);
    float _1280 = float(uint(_1252));
    float _1282 = as_type<float>(_1264) * _1248;
    float _1284 = trunc(_1240);
    int _1286 = int(_1284);
    int _1288 = as_type<int>(_1242) + (-2);
    float _1290 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1292 = as_type<float>(_1288) * _1280;
    int _1294 = ~_597;
    int _1296 = _1294 + 1;
    float _1298 = trunc(_1282);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    bool _1304 = _1262 >= 0.0;
    bool _1306 = isnan(_1262);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1314;
    int _1318 = ~_1194;
    int _1320 = _1318 + 1;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1326 = _1312 ? 0 : 1;
    float _1328 = fma(_1316, _1136, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1330 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1338 = _1334 || _1336;
    float _1340 = trunc(_1292);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    int _1346 = _1286 << 4;
    int _1348 = _1346 + 1712;
    float _1350 = fma(_1324, _1166, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1352 = _1338 ? _1268 : 0.0;
    uint _1354 = uint(int(uint(_1348) >> uint(2)));
    uint _1356 = uint(int(uint(int(_1354)) >> uint(2)));
    int _1358 = int(_1354) & 3;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[int(_1356)][_1358];
    int _1362 = int(_1354) + 1;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    int _1366 = _1362 & 3;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[int(_1364)][_1366];
    bool _1370 = _1262 > 0.0;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1372;
    int _1376 = _1296 * int(_1302);
    int _1378 = _1376 + _1238;
    float _1380 = float(_1276);
    float _1382 = fma(_1374, _1136, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1388 = _1348 + 8;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[int(_1392)][_1394];
    float _1398 = float(uint(_1378));
    int _1400 = _1320 * int(_1344);
    int _1402 = _1400 + _1252;
    float _1404 = fma(_1386, _1166, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1406 = as_type<float>(_1264) * _1398;
    bool _1408 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1410 = isnan(_563);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = float(uint(_1402));
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1424 = 1.0 + _1422;
    bool _1426 = _597 == 0;
    float _1428 = trunc(_1406);
    float _1430 = precise::max(_1428, 0.0);
    uint _1432 = uint(_1430);
    float _1434 = -_1418;
    float _1436 = _1434 + 1.0;
    float _1438 = as_type<float>(_1288) * _1420;
    bool _1440 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1442 = isnan(_563);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    bool _1452 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1454 = isnan(_563);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    bool _1464 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1466 = isnan(_563);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1450 * _1436;
    float _1478 = 1.0 / _1424;
    float _1480 = -_1450;
    float _1482 = _1480 + 1.0;
    float _1484 = -_1462;
    float _1486 = _1484 + 1.0;
    float _1488 = _1462 * _1482;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1494;
    float _1498 = trunc(_1438);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = ~_597;
    int _1506 = _1504 + 1;
    float _1508 = _1474 * _1486;
    float _1510 = fma(_1492, _1124, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1512 = int(_1302) + int(_1432);
    float _1514 = fma(_1496, _1124, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1516 = _1328 * _1508;
    float _1518 = _1382 * _1508;
    float _1520 = -_1474;
    float _1522 = _1520 + 1.0;
    float _1524 = _1352 * _1478;
    int _1526 = ~_1326;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    int _1532 = _1506 * _1512;
    int _1534 = _1532 + _1238;
    float _1536 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1516);
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1518);
    int _1540 = _1530;
    if (!_1370)
    {
        int _1542 = ~_1326;
        int _1544 = _1542 + 1;
        _1540 = _1544;
    }
    int _1546 = _1540;
    float _1548 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1550 = !_1106;
    int _1552 = _1550 ? 0 : 1;
    float _1554 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1556 = !_1110;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = uint(_1534) >= uint(_597);
    int _1562 = int(_1344) + int(_1502);
    int _1564 = abs(_1552);
    float _1566 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1568 = ~_1194;
    int _1570 = _1568 + 1;
    int _1572 = abs(_1558);
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = float(_1188);
    float _1578 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = float(_1564);
    int _1584 = _1570 * _1562;
    int _1586 = _1584 + _1252;
    float _1588 = float(_1572);
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1592 = !_1560;
    int _1594 = _1592 ? 0 : (-1);
    float _1596 = _1582 * _1576;
    bool _1598 = uint(_1586) >= uint(_1194);
    float _1600 = _1588 * _1380;
    int _1602 = ~_1512;
    int _1604 = _1602 + _1594;
    int _1606 = _1604 + 1;
    out.m_56.x = _1578;
    out.m_56.y = _1580;
    out.m_56.z = _1574;
    out.m_56.w = _1590;
    float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1610 = _137 > 0.5;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1006 + _1612;
    int _1616 = _597 * _1606;
    int _1618 = _1616 + _1238;
    float _1620 = in.m_58.x;
    float _1622 = in.m_58.y;
    float _1624 = in.m_58.z;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1628 = _1626 != 0;
    float _1630 = -_187;
    int _1632 = _1610 ? as_type<int>(_1630) : as_type<int>(_187);
    bool _1634 = !_1426;
    int _1636 = _1634 ? _1618 : (-1);
    bool _1638 = !_1598;
    int _1640 = _1638 ? 0 : (-1);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _828 + _1642;
    int _1646 = _1238 ^ _597;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1650 = _597 == 0;
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _1654 = uint(int(uint(_1646) >> uint(31)));
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1658 = _1036 + _1656;
    int _1660 = ~_1640;
    int _1662 = _1562 + _1660;
    int _1664 = _1662 + 1;
    float _1666 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1652);
    int _1668 = ~int(_1654);
    int _1670 = _1668 + 1;
    float _1672 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1674 = float(_1636);
    float _1676 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1666);
    bool _1678 = !_1628;
    float _1680 = _1678 ? _187 : as_type<float>(_1632);
    float _1682 = -_117;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[76].x, _998);
    int _1686 = _1664 ^ _1670;
    float _1688 = _1596 * (-2.0);
    bool _1690 = _1676 >= 0.0;
    float _1692 = fma(_1672, _1674, _1684);
    float _1694 = _1680 + 0.5;
    float _1696 = _1644 * _1644;
    int _1698 = ~_1670;
    int _1700 = _1698 + _1686;
    int _1702 = _1700 + 1;
    float _1704 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1706 = fma(_1672, _1694, _1692);
    float _1708 = fma(_1614, _1614, _1696);
    bool _1710 = _892 > 0.5;
    float _1712 = fma(_1290, _1688, _1290);
    bool _1714 = !_1650;
    int _1716 = _1714 ? _1702 : (-1);
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1720 = fma(_1658, _1658, _1708);
    float _1722 = fma(_1688, _1622, _1622);
    float _1724 = -_195;
    int _1726 = _1710 ? as_type<int>(_1724) : as_type<int>(_195);
    float _1728 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _954);
    float _1730 = float(_1716);
    float _1732 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1718);
    float _1734 = rsqrt(_1720);
    bool _1736 = !_920;
    float _1738 = _1736 ? _195 : as_type<float>(_1726);
    float _1740 = -_1728;
    float _1742 = fma(_1704, _1730, _1740);
    float _1744 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1750 = isnan(1.0);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1756 = _1752 || _1754;
    float _1758 = _1738 + (-0.5);
    float _1760 = _1722;
    int _1762 = as_type<int>(_1644);
    if (_1690)
    {
        out.m_45.x = 0.0;
    }
    float _1764 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1746);
    float _1766 = -_1704;
    float _1768 = fma(_1766, _1758, _1742);
    float _1770 = _892 + (-0.5);
    float _1772 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1764);
    bool _1774 = !_1102;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = -_1744;
    float _1780 = _1778 + 1.0;
    float _1782 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1722);
    float _1784 = -_1772;
    float _1786 = _1784 + 1.0;
    int _1788 = abs(_1776);
    float _1790 = _1644 * _1734;
    if (_1690)
    {
        _1760 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1792 = _1760;
    float _1794 = fma(_1738, _1786, _1768);
    float _1796 = float(_1546);
    float _1798 = -_1790;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _1802 = -_1780;
    float _1804 = fma(_1680, _1802, _1706);
    if (_1690)
    {
        float _1806 = _1792 * 5.0;
        _1762 = as_type<int>(_1806);
    }
    int _1808 = _1762;
    float _1810 = float(_1788);
    float _1812 = _1614 * _1734;
    bool _1814 = !_1756;
    float _1816 = _1814 ? _117 : _1524;
    float _1818 = _1800 * _1800;
    float _1820 = -_1812;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1824 = _1810 * _1796;
    float _1826 = fma(_1816, _1712, _1782);
    if (_1690)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5484 = as_type<float>(_1808);
        out.gl_Position.z = _5484;
    }
    float _1828 = fma(_1822, _1822, _1818);
    float _1830 = _137 + (-0.5);
    float _1832 = _1824 * (-2.0);
    out.m_60.x = _1804;
    out.m_60.y = _1794;
    float _1834 = _1826 * 0.15915493667125701904296875;
    if (_1690)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1836 = -_1790;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _1840 = _1658 * _1734;
    float _1842 = -_1812;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1846 = fma(_1832, _1620, _1620);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1850 = _1838 + _1848;
    float _1852 = -_1840;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1858 = _1844 + _1856;
    float _1860 = -_1840;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1854 + _1866;
    float _1870 = fma(_1244, _1832, _1244);
    float _1872 = _1600 * (-2.0);
    float _1874 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1864);
    float _1876 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1846);
    float _1878 = fma(_1862, _1862, _1828);
    float _1880 = fma(_1872, _1624, _1624);
    float _1882 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1874);
    float _1884 = in.m_54.x;
    float _1886 = in.m_54.y;
    float _1888 = _978 + (-0.5);
    float _1890 = fma(_1254, _1872, _1254);
    float _1892 = fma(_1404, _1488, _1538);
    bool _1894 = _1882 >= 0.0;
    float _1896 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1880);
    float _1898 = fma(_1350, _1488, _1536);
    float _1900 = fma(_1816, _1870, _1876);
    float _1902 = fma(_1514, _1476, _1892);
    float _1904 = fma(_1816, _1890, _1896);
    float _1906 = fma(_1510, _1476, _1898);
    float _1908 = sqrt(_1878);
    float _1910 = _1900 * 0.15915493667125701904296875;
    float _1912 = _1904 * 0.15915493667125701904296875;
    float _1914 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1902);
    float _1916 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1906);
    float _1918 = _1896;
    float _1920 = _1850;
    if (_1894)
    {
        _1918 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1922 = _1918;
    int _1924 = as_type<int>(_1922);
    if (_1894)
    {
        out.m_45.x = 0.0;
    }
    float _1926 = _1834 * 6.283185482025146484375;
    float _1928 = sin(_1926);
    if (_1894)
    {
        float _1930 = _1922 * 5.0;
        _1924 = as_type<int>(_1930);
    }
    int _1932 = _1924;
    float _1934 = _1914 * _1886;
    float _1936 = _1834 * 6.283185482025146484375;
    float _1938 = cos(_1936);
    if (_1894)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5685 = as_type<float>(_1932);
        out.gl_Position.z = _5685;
    }
    float _1940 = _1734 * _1908;
    float _1942 = _521 * _1934;
    float _1944 = _1910 * 6.283185482025146484375;
    float _1946 = sin(_1944);
    float _1948 = _1910 * 6.283185482025146484375;
    float _1950 = cos(_1948);
    float _1952 = _1912 * 6.283185482025146484375;
    float _1954 = sin(_1952);
    float _1956 = _1946;
    if (_1894)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1958 = _1912 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    float _1962 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1964 = _1916 * _1884;
    float _1966 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1968 = _1950 * _1938;
    float _1970 = _1940 * _1962;
    float _1972 = _521 * _1964;
    float _1974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1976 = _1950 * _1928;
    float _1978 = _1966 * _1970;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1982 = _1946 * _1928;
    float _1984 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1986 = _1984 * 0.5;
    float _1988 = _1940 * _1980;
    float _1990 = fma(_1954, _1968, _1982);
    float _1992 = _1960 * _1978;
    float _1994 = _1928 * _1960;
    float _1996 = _1938 * _1960;
    float _1998 = _1974 * _1988;
    float _2000 = _1950 * _1992;
    float _2002 = _1946 * _1938;
    float _2004 = -_1978;
    float _2006 = _1954 * _2004;
    float _2008 = fma(_1954, _1982, _1968);
    float _2010 = fma(_1990, _1998, _2000);
    float _2012 = -_2002;
    float _2014 = fma(_1954, _1976, _2012);
    float _2016 = -_1976;
    float _2018 = fma(_1954, _2002, _2016);
    float _2020 = _1946 * _1992;
    float _2022 = fma(_1996, _1998, _2006);
    float _2024 = fma(_2014, _1986, _2010);
    float _2026 = fma(_2018, _1998, _2020);
    float _2028 = fma(_1994, _1986, _2022);
    float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2034 = fma(_2008, _1986, _2026);
    float _2036 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2040 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2032);
    float _2042 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2036);
    float _2044 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2040);
    float _2048 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2042);
    float _2050 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2052 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2054 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2056 = _1036 + _2050;
    float _2058 = _1006 + _2052;
    float _2060 = _828 + _2054;
    float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2064 = _2056 + _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2068 = _2058 + _2066;
    float _2070 = _2064 * _2064;
    float _2072 = fma(_2068, _2068, _2070);
    float _2074 = sqrt(_2072);
    bool _2076 = _2074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2070;
    float _2080 = _2054;
    float _2082 = _2058;
    float _2084 = _2068;
    float _2086 = _1992;
    if (!_2076)
    {
        _2078 = _2058;
    }
    float _2088 = _2078;
    float _2090 = _2088;
    if (!_2076)
    {
        _2080 = _2056;
    }
    float _2092 = _2080;
    float _2094 = _2092;
    if (!_2076)
    {
        _2082 = _2060;
    }
    float _2096 = _2082;
    bool _2098 = !_2076;
    float _2100 = _2096;
    if (!_2098)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2106 = _2074 + _2104;
        float _2108 = rsqrt(_2072);
        float _2110 = _2106 * _2102;
        float _2112 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = _2110 * 0.15915493667125701904296875;
        float _2116 = _2114 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = _2114 * 6.283185482025146484375;
        float _2122 = cos(_2120);
        float _2124 = fma(_2118, _2112, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2126 = _2108 * _2124;
        float _2128 = _2122 + (-1.0);
        float _2130 = fma(_2068, _2126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2132 = fma(_2064, _2126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2134 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2136 = fma(_2060, _2122, _2134);
        _2100 = _2136;
        _2090 = _2130;
        _2094 = _2132;
    }
    float _2138 = _2100;
    float _2140 = _2090;
    float _2142 = _2094;
    float _2144 = -_828;
    float _2146 = _2144 + _2138;
    float _2148 = -_1006;
    float _2150 = _2148 + _2140;
    float _2152 = -_1036;
    float _2154 = _2152 + _2142;
    float _2156 = _2146 * _2146;
    float _2158 = fma(_2150, _2150, _2156);
    float _2160 = fma(_2154, _2154, _2158);
    float _2162 = sqrt(_2160);
    bool _2164 = _2162 > 0.0;
    float _2166 = _2162;
    float _2168 = _2138;
    float _2170 = _2154;
    if (!_2164)
    {
        _2084 = _2140;
    }
    float _2172 = _2084;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2164)
    {
        _2166 = _2142;
    }
    float _2178 = _2166;
    bool _2180 = !_2164;
    float _2182 = _2178;
    float _2184 = _2178;
    float _2186 = _2178;
    if (!_2180)
    {
        bool _2188 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2190 = _2072;
        if (_2188)
        {
            float _2192 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2190 = _2192;
        }
        float _2194 = _2190;
        float _2196 = _2194;
        if (_2188)
        {
            float _2198 = _513 * _2194;
            _2086 = _2198;
        }
        float _2200 = _2086;
        float _2202 = _2200;
        if (_2188)
        {
            float _2204 = _515 * _2194;
            _1956 = _2204;
        }
        float _2206 = _1956;
        float _2208 = _2206;
        if (_2188)
        {
            float _2210 = _517 * _2194;
            _2196 = _2210;
        }
        float _2212 = _2196;
        float _2214 = _2212;
        if (!_2188)
        {
            float _2216 = _117 + 1.0;
            float _2218 = _2216;
            if (!_153)
            {
                float _2220 = _2216 * _2216;
                float _2222 = _2220 * 0.5;
                _2182 = _2222;
            }
            float _2224 = _2182;
            float _2226 = _2224;
            if (!_153)
            {
                float _2228 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2226 = _2228;
            }
            float _2230 = _2226;
            bool _2232 = !_153;
            float _2234 = _2230;
            if (!_2232)
            {
                float _2236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2238 = log2(_2236);
                float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2242 = 1.0 + _2240;
                float _2244 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2246 = _2238 * _2216;
                float _2248 = 1.0 / _2242;
                float _2250 = _2244 * 0.693147182464599609375;
                float _2252 = exp2(_2246);
                float _2254 = 1.0 / _2250;
                float _2256 = _2252 + (-1.0);
                float _2258 = -_2256;
                float _2260 = fma(_2258, _2254, _2216);
                float _2262 = _2260 * _2248;
                float _2264 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2234 = _2264;
            }
            float _2266 = _2234;
            float _2268 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2270 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2272 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2274 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2276 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2278 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2274);
            float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2276);
            float _2284 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2280);
            bool _2286 = !_153;
            _2184 = _2272;
            if (!_2286)
            {
                float _2288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2290 = log2(_2288);
                float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2294 = 1.0 + _2292;
                float _2296 = 1.0 / _2294;
                float _2298 = _2290 * _2216;
                float _2300 = exp2(_2298);
                float _2302 = -_2300;
                float _2304 = _2302 + 1.0;
                float _2306 = _2304 * _2296;
                _2218 = _2306;
            }
            float _2308 = _2218;
            float _2310 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2278);
            float _2312 = fma(_2308, _161, _2284);
            float _2314 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2282);
            float _2316 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2310);
            float _2318 = -_463;
            float _2320 = _2318 + _2312;
            float _2322 = fma(_2308, _159, _2314);
            float _2324 = fma(_2308, _163, _2316);
            float _2326 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2328 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2330 = -_467;
            float _2332 = _2330 + _2322;
            float _2334 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2336 = -_477;
            float _2338 = _2336 + _2324;
            float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2326);
            float _2342 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2328);
            float _2344 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2334);
            float _2346 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2340);
            float _2348 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2342);
            float _2350 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2344);
            _525 = _2348;
            _527 = _2346;
            _529 = _2350;
            _2202 = _2346;
            _2208 = _2348;
            _2214 = _2350;
            _2174 = _2314;
        }
        float _2352 = _525;
        float _2354 = _527;
        float _2356 = _529;
        float _2358 = _2202;
        float _2360 = _2208;
        float _2362 = _2214;
        float _2364 = _2174;
        float _2366 = _2184;
        float _2368 = _2352 * _2352;
        float _2370 = rsqrt(_2160);
        float _2372 = fma(_2354, _2354, _2368);
        float _2374 = fma(_2356, _2356, _2372);
        float _2376 = sqrt(_2374);
        float _2378 = _2146 * _2370;
        float _2380 = _2150 * _2370;
        float _2382 = _2154 * _2370;
        bool _2384 = _2376 > 0.0;
        float _2386 = _2364;
        float _2388 = _2366;
        _531 = _2380;
        if (!_2384)
        {
            _2386 = _2140;
        }
        float _2390 = _2386;
        _2176 = _2390;
        if (!_2384)
        {
            _2388 = _2142;
        }
        float _2392 = _2388;
        bool _2394 = !_2384;
        _2186 = _2392;
        if (!_2394)
        {
            float _2396 = rsqrt(_2374);
            float _2398 = _2396 * _2352;
            float _2400 = _2396 * _2354;
            float _2402 = _2396 * _2356;
            float _2404 = _2378 * _2398;
            float _2406 = fma(_2380, _2400, _2404);
            float _2408 = fma(_2382, _2402, _2406);
            float _2410 = _2408 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2412 = fma(_2358, _2410, _2140);
            float _2414 = fma(_2360, _2410, _2138);
            float _2416 = fma(_2362, _2410, _2142);
            _2176 = _2412;
            _2168 = _2414;
            _2186 = _2416;
        }
    }
    float _2418 = _2176;
    float _2420 = _2168;
    float _2422 = _2186;
    float _2424 = _531;
    bool _2426 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2428 = isnan(0.5);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2434 = _2430 || _2432;
    float _2436 = -_1812;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2418);
    float _2440 = -_1790;
    float _2442 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2420);
    float _2444 = -_1840;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2422);
    float _2448 = _2442;
    float _2450 = _2438;
    float _2452 = _2446;
    float _2454 = _2424;
    if (!_2434)
    {
        float _2456 = _1850 * _1850;
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2460 = -_1006;
        float _2462 = _2460 + _2418;
        float _2464 = -_828;
        float _2466 = _2464 + _2420;
        float _2468 = fma(_1858, _1858, _2456);
        float _2470 = -_1036;
        float _2472 = _2470 + _2422;
        float _2474 = fma(_1868, _1868, _2468);
        float _2476 = 1.0 / _1940;
        float _2478 = sqrt(_2474);
        float _2480 = precise::min(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2482 = _2480 * _2458;
        float _2484 = _2482 * _2476;
        float _2486 = fma(_2462, _2484, _1844);
        float _2488 = fma(_2466, _2484, _1838);
        float _2490 = fma(_2472, _2484, _1854);
        _2448 = _2488;
        _2450 = _2486;
        _2452 = _2490;
        _2170 = _2458;
    }
    float _2492 = _2448;
    float _2494 = _2450;
    float _2496 = _2452;
    float _2498 = _2170;
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2502 = _2492 + _2500;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2506 = _2494 + _2504;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2510 = _2496 + _2508;
    float _2512 = _2502 * _2502;
    float _2514 = fma(_2506, _2506, _2512);
    float _2516 = fma(_2510, _2510, _2514);
    float _2518 = rsqrt(_2516);
    float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2522 = _2506 * _2520;
    float _2524 = _2510 * _2520;
    float _2526 = _2522 * _2522;
    float _2528 = _2524 * _2524;
    float _2530 = _2526 + _2528;
    float _2532 = sqrt(_2530);
    bool _2534 = _2532 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2538 = _2532 + _2536;
    float _2540 = _2518;
    float _2542 = _2498;
    float _2544 = _2538;
    float _2546 = _2520;
    float _2548 = _2526;
    if (_2534)
    {
        float _2550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2550;
    }
    float _2552 = _2540;
    if (_2534)
    {
        float _2554 = rsqrt(_2530);
        _2542 = _2554;
    }
    float _2556 = _2542;
    float _2558 = _2556;
    if (_2534)
    {
        float _2560 = _2538 * _2552;
        _2544 = _2560;
    }
    float _2562 = _2544;
    if (_2534)
    {
        float _2564 = _2562 * 0.15915493667125701904296875;
        _1920 = _2564;
    }
    float _2566 = _1920;
    float _2568 = _2150;
    if (_2534)
    {
        float _2570 = _2566 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        _2568 = _2572;
    }
    float _2574 = _2568;
    float _2576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2578 = precise::max(0.0, _2576);
    float _2580 = _2510;
    float _2582 = _2578;
    float _2584 = _2576;
    if (_2534)
    {
        float _2586 = _2566 * 6.283185482025146484375;
        float _2588 = cos(_2586);
        _2580 = _2588;
    }
    float _2590 = _2580;
    float _2592 = -_2520;
    float _2594 = -_2578;
    float _2596 = fma(_2502, _2592, _2594);
    if (_2534)
    {
        float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2582 = _2598;
    }
    float _2600 = _2582;
    float _2602 = sqrt(_2516);
    float _2604 = _2574;
    float _2606 = _2600;
    if (_2534)
    {
        float _2608 = fma(_2574, _2600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2604 = _2608;
    }
    float _2610 = _2604;
    float _2612 = _2610;
    if (!_2534)
    {
        _2606 = _2524;
    }
    float _2614 = _2606;
    float _2616 = _2614;
    if (_2534)
    {
        float _2618 = _2590 + (-1.0);
        _2584 = _2618;
    }
    float _2620 = _2584;
    float _2622 = _2620;
    if (_2534)
    {
        float _2624 = _2556 * _2610;
        _2454 = _2624;
    }
    float _2626 = _2454;
    if (!_2534)
    {
        _2558 = _2522;
    }
    float _2628 = _2558;
    float _2630 = _2628;
    if (_2534)
    {
        float _2632 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2546 = _2632;
    }
    float _2634 = _2546;
    if (_2534)
    {
        float _2636 = _2522 * _2626;
        _2630 = _2636;
    }
    float _2638 = _2630;
    if (!_2534)
    {
        _2612 = _2596;
    }
    float _2640 = _2612;
    float _2642 = _2640;
    if (_2534)
    {
        float _2644 = _2524 * _2626;
        _2616 = _2644;
    }
    float _2646 = _2616;
    if (_2534)
    {
        float _2648 = fma(_2596, _2590, _2634);
        _2642 = _2648;
    }
    float _2650 = _2642;
    if (_2534)
    {
        float _2652 = _2638 * _2638;
        _2548 = _2652;
    }
    float _2654 = _2548;
    if (!_2534)
    {
        _2622 = _2528;
    }
    float _2656 = _2622;
    float _2658 = _2656;
    if (_2534)
    {
        float _2660 = _2646 * _2646;
        _2658 = _2660;
    }
    float _2662 = _2658;
    float _2664 = fma(_2650, _2650, _2654);
    float _2666 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2668 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2670 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2672 = _2664 + _2662;
    float _2674 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2666);
    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2678 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2676);
    float _2680 = precise::clamp(_2678, 0.0, 1.0);
    float _2682 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2684 = rsqrt(_2672);
    float _2686 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2688 = -_2680;
    float _2690 = _2688 + 1.0;
    float _2692 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2682);
    float _2694 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2670);
    float _2696 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2674);
    float _2698 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2686);
    float _2700 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2692);
    float _2702 = abs(_2690);
    float _2704 = log2(_2702);
    float _2706 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2694);
    float _2708 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2710 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2712 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2698);
    float _2714 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2716 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2720 = _2684 * _2638;
    float _2722 = _2684 * _2650;
    float _2724 = _2684 * _2646;
    float _2726 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2718);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = -_2716;
    float _2732 = fma(_2730, _2668, 1.0);
    float _2734 = _2712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2736 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2738 = -_2728;
    float _2740 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2738);
    float _2742 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2744 = log2(_2732);
    float _2746 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2748 = -_2724;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2740);
    float _2752 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2754 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2746);
    float _2756 = fma(_2750, -0.5, 0.5);
    float _2758 = fma(_2750, 0.5, 0.5);
    float _2760 = exp2(_2742);
    float _2762 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2736);
    float _2764 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2752);
    float _2766 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2754);
    float _2768 = _2722 + 1.0;
    float _2770 = fma(_2758, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2772 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2764);
    float _2774 = 1.0 / _2762;
    float _2776 = fma(_2758, _2770, -0.212114393711090087890625);
    float _2778 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2772);
    float _2780 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2782 = _2744 * 0.693147182464599609375;
    float _2784 = fma(_2758, _2776, 1.570728778839111328125);
    float _2786 = sqrt(_2756);
    float _2788 = -_2722;
    float _2790 = fma(_2760, _2768, _2788);
    float _2792 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2794 = fma(_2790, 0.5, 0.5);
    float _2796 = _2778 * _2774;
    float _2798 = _2780 * _2774;
    float _2800 = fma(_2796, 0.5, 0.5);
    float _2802 = fma(_2798, -0.5, 0.5);
    float _2804 = _2786 * 0.636619746685028076171875;
    float3 _7070 = float3(_2800, _2802, _2792);
    float _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7070, float3(0.0), isnan(_7070)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7070, float3(0.0), isnan(_7070)), level(0.0)).x;
    float3 _7081 = float3(_2800, _2802, _2792);
    float4 _2809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7081, float3(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7081, float3(0.0), isnan(_7081)), level(0.0)).xyzw;
    float _2811 = _2809.x;
    float _2813 = _2809.y;
    float _2815 = _2809.z;
    float _2817 = _2809.w;
    float _2819 = -_2784;
    float _2821 = fma(_2804, _2819, 1.0);
    float2 _7103 = float2(_2821, _2794);
    float3 _2825 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7103, float2(0.0), isnan(_7103)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7103, float2(0.0), isnan(_7103)), level(0.0)).xyz;
    float _2827 = _2825.x;
    float _2829 = _2825.y;
    float _2831 = _2825.z;
    float _2833 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2835 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2837 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2835);
    float _2839 = exp2(_2833);
    float _2841 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2837);
    float _2843 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2841);
    float _2845 = _2843 + _2762;
    float _2847 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2778;
    out.gl_Position.y = _2780;
    out.gl_Position.z = _2843;
    out.gl_Position.w = _2762;
    float _2849 = _2845 * 0.5;
    float _2851 = -_2839;
    float _2853 = _2851 + 1.0;
    out.m_45.x = _2847;
    float _2855 = _2853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2849;
    out.m_62.w = _2762;
    float _2857 = _2855 * _2806;
    float _2859 = -_2855;
    float _2861 = _2859 + 1.0;
    float _2863 = _2817 * _2857;
    float _2865 = _2817 * _2861;
    float _2867 = _2831 * _2857;
    float _2869 = fma(_2827, _2863, _2811);
    float _2871 = fma(_2829, _2863, _2813);
    float _2873 = fma(_2817, _2867, _2815);
    out.m_64.x = _2869;
    out.m_64.y = _2871;
    out.m_64.z = _2873;
    out.m_64.w = _2865;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _553 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2930 = as_type<float>(_99);
        out.gl_Position.z = _2930;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_135);
        out.gl_Position.z = _2998;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = floor(_157);
    float _167 = _157 * 6.283185482025146484375;
    int _169 = as_type<int>(_143) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_143) & 2;
    bool _175 = _173 != 0;
    float _177 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _167 * 0.15915493667125701904296875;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_165;
    float _199 = _157 + _197;
    float _201 = _165;
    float _203 = _177;
    if (!_153)
    {
        float _205 = _177 * _177;
        float _207 = _205 * 0.5;
        _201 = _207;
    }
    float _209 = _201;
    float _211 = _209;
    if (!_153)
    {
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_153;
    float _219 = _215;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _177 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _177);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_153;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _177 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _203 = _273;
    }
    float _275 = _203;
    float _277 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = in.m_54.w;
    float _281 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _285 = in.m_42.x;
    float _287 = in.m_42.y;
    float _289 = in.m_42.z;
    float _291 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _293 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].x, _283);
    float _297 = fma(_191, 0.5, 0.5);
    float _299 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].y, _291);
    float _301 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].z, _293);
    float _303 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _305 = -_297;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _309 = _199 < 0.5;
    float _311 = float(_309);
    float _313 = _291;
    if (!_153)
    {
        float _315 = _117 * _117;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].x, _295);
    float _323 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].y, _299);
    float _325 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].z, _301);
    float _327 = -_199;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_275, _159, _321);
    float _333 = fma(_275, _161, _323);
    float _335 = fma(_275, _163, _325);
    float _337 = -_311;
    float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _341 = _325;
    float _343 = _319;
    if (!_153)
    {
        _341 = _117;
    }
    float _345 = _341;
    float _347 = _345;
    if (!_153)
    {
        float _349 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _343 = _349;
    }
    float _351 = _343;
    bool _353 = !_153;
    float _355 = _351;
    if (!_353)
    {
        float _357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = log2(_357);
        float _361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _363 = _361 + 1.0;
        float _365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = _117 * _359;
        float _369 = 1.0 / _363;
        float _371 = _365 * 0.693147182464599609375;
        float _373 = exp2(_367);
        float _375 = 1.0 / _371;
        float _377 = _373 + (-1.0);
        float _379 = -_377;
        float _381 = fma(_379, _375, _117);
        float _383 = _381 * _369;
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _385;
    }
    float _387 = _355;
    bool _389 = !_153;
    if (!_389)
    {
        float _391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = log2(_391);
        float _395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _397 = _395 + 1.0;
        float _399 = 1.0 / _397;
        float _401 = _117 * _393;
        float _403 = exp2(_401);
        float _405 = -_403;
        float _407 = _405 + 1.0;
        float _409 = _407 * _399;
        _347 = _409;
    }
    float _411 = _347;
    float _413 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _415 = fma(_331, _279, _285);
    float _417 = fma(_333, _279, _287);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _425 = _423 != 0;
    float _427 = fma(_335, _279, _289);
    float _429 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _431 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _433 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _435 = !_421;
    int _437 = _435 ? 0 : 1;
    float _439 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _441 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].x, _431);
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].y, _433);
    int _447 = abs(_437);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _439);
    bool _451 = !_181;
    int _453 = _451 ? 0 : 1;
    float _455 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].x, _443);
    float _457 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].y, _445);
    float _459 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].z, _449);
    int _461 = abs(_453);
    float _463 = fma(_411, _161, _457);
    float _465 = float(_447);
    float _467 = fma(_411, _159, _455);
    float _469 = -_463;
    float _471 = _333 + _469;
    bool _473 = !_425;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_411, _163, _459);
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _481 = abs(_329);
    float _483 = _465 * _481;
    float _485 = float(_461);
    float _487 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _489 = abs(_475);
    float _491 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _493 = -_467;
    float _495 = _331 + _493;
    float _497 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _499 = -_477;
    float _501 = _335 + _499;
    float _503 = fma(_485, _307, _483);
    float _505 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
    float _507 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _509 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[6].x, _497);
    float _511 = float(_489);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
    float _515 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
    float _517 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
    float _519 = abs(_339);
    float _521 = fma(_511, _519, _503);
    bool _523 = !_479;
    float _525 = _515;
    float _527 = _513;
    float _529 = _517;
    float _531 = _463;
    float _549;
    float _551;
    if (!_523)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _535 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _539 = _537 * _533;
        float _541 = float(_83);
        float _543 = floor(_539);
        float _545 = -_543;
        float _547 = _539 + _545;
        _549 = _541;
        _551 = _547;
        _553 = true;
    }
    else
    {
        float _555 = float(_83);
        float _557 = 1.0 / _555;
        float _559 = _117 * _557;
        _549 = _555;
        _551 = _559;
    }
    _553 = false;
    float _561 = _549;
    float _563 = _551;
    float _565 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _567 = int(_565);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _573 = int(_571);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _577 = float(_567);
    float _579 = 1.0 / _561;
    float _581 = float(uint(_573));
    float _583 = 1.0 / _577;
    int _585 = ~_573;
    int _587 = _585 + 1;
    float _589 = float(_573);
    float _591 = 1.0 / _581;
    float _593 = _117 * _583;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _597 = int(_595);
    int _599 = as_type<int>(_591) + (-2);
    float _601 = trunc(_593);
    int _603 = int(_601);
    float _605 = float(uint(_603));
    float _607 = as_type<float>(_599) * _605;
    int _609 = ~_573;
    int _611 = _609 + 1;
    float _613 = trunc(_607);
    float _615 = precise::max(_613, 0.0);
    uint _618 = uint(_615);
    int _620 = _611 * int(_618);
    int _622 = _620 + _603;
    float _624 = float(uint(_622));
    float _626 = as_type<float>(_599) * _624;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _630 = _628 != 0;
    float _632 = trunc(_626);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    bool _638 = !_630;
    float _640 = _638 ? 7.345489978790283203125 : 1.0;
    float _642 = _640 * _137;
    float _644 = floor(_642);
    int _646 = int(_618) + int(_636);
    float _648 = float(_603);
    int _650 = _587 * _646;
    int _652 = _650 + _603;
    bool _654 = _648 >= _589;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan(_589);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = uint(_652) >= uint(_573);
    float _668 = -_644;
    float _670 = _642 + _668;
    float _672 = trunc(_664);
    int _674 = int(_672);
    bool _676 = !_666;
    int _678 = _676 ? 0 : (-1);
    float _680 = _670 * _589;
    bool _682 = _573 == 0;
    float _684 = _117 * _589;
    int _686 = ~_646;
    int _688 = _686 + _678;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _702 = _700 != 0;
    float _704 = _684 * _579;
    float _706 = trunc(_680);
    int _708 = int(_706);
    int _710 = _573 * _690;
    int _712 = _710 + _603;
    bool _714 = !_698;
    int _716 = _714 ? 0 : 1;
    bool _718 = !_694;
    int _720 = _718 ? 0 : 1;
    int _722 = ~_674;
    int _724 = _722 + 1;
    int _726 = _724 + 1;
    float _728 = trunc(_704);
    int _730 = int(_728);
    bool _732 = !_682;
    int _734 = _732 ? _712 : (-1);
    int _736 = abs(_720);
    int _738 = _734 * _726;
    int _740 = _573 + (-1);
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _748 = _746 != 0;
    int _750 = _674 * _740;
    int _752 = _750 + _738;
    bool _754 = !_744;
    int _756 = _754 ? 0 : 1;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _760 = _758 != 0;
    int _762 = abs(_716);
    bool _764 = !_702;
    int _766 = _764 ? 0 : 1;
    bool _768 = !_760;
    int _770 = _768 ? 0 : 1;
    int _772 = abs(_756);
    int _774 = abs(_766);
    int _776 = _752 * _762;
    int _778 = abs(_770);
    int _780 = _708 * _772;
    int _782 = _780 + _603;
    int _784 = _730 * _736;
    int _786 = _784 + _776;
    int _788 = ~_573;
    int _790 = _788 + 1;
    int _792 = ~_573;
    int _794 = _792 + 1;
    int _796 = _782 * _774;
    int _798 = _796 + _786;
    float _800 = float(uint(_782));
    int _802 = _708 * _778;
    int _804 = _802 + _798;
    int _806 = ~_573;
    int _808 = _806 + 1;
    float _810 = as_type<float>(_599) * _800;
    float _812 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _814 = float(uint(_804));
    float _816 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _812);
    float _818 = trunc(_810);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = as_type<float>(_599) * _814;
    float _826 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].z, _816);
    float _828 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _830 = trunc(_824);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    int _836 = _808 * int(_834);
    int _838 = _836 + _804;
    float _840 = float(uint(_838));
    float _842 = as_type<float>(_599) * _840;
    float _844 = trunc(_842);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    int _850 = _790 * int(_822);
    int _852 = _850 + _782;
    float _854 = float(uint(_852));
    int _856 = int(_834) + int(_848);
    int _858 = _790 * _856;
    int _860 = _858 + _804;
    float _862 = as_type<float>(_599) * _854;
    bool _864 = uint(_860) >= uint(_573);
    float _866 = trunc(_862);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    bool _872 = !_864;
    int _874 = _872 ? 0 : (-1);
    int _876 = ~_856;
    int _878 = _876 + _874;
    int _880 = _878 + 1;
    int _882 = _573 * _880;
    int _884 = _882 + _804;
    bool _886 = !_682;
    int _888 = _886 ? _884 : (-1);
    int _890 = int(_822) + int(_870);
    float _892 = in.m_49.y;
    int _894 = _888 & 3;
    bool _896 = _894 != 0;
    int _898 = _888 & 3;
    bool _900 = _898 != 0;
    int _902 = _794 * _890;
    int _904 = _902 + _782;
    bool _906 = uint(_894) > 1u;
    int _908 = _900 ? 0 : 1;
    int _910 = _888 >> 31;
    int _912 = ~_908;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _920 = _918 != 0;
    int _922 = _916;
    if (!_906)
    {
        int _924 = ~_908;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _932 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _934 = uint(_894) >= 2u;
    float _936 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _930);
    int _938 = _910 & 3;
    float _940 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _932);
    float _942 = _137 * 2.0;
    int _944 = _934 ? 0 : 1;
    float _946 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _948 = _888 + _938;
    float _950 = floor(_942);
    bool _952 = uint(_904) >= uint(_573);
    float _954 = fma(_946, -2.0, _575);
    int _956 = _948 >> 2;
    float _958 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].z, _936);
    bool _960 = !_952;
    int _962 = _960 ? 0 : (-1);
    float _964 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].z, _940);
    int _966 = _956 << 4;
    int _968 = _966 + 368;
    float _970 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _972 = ~_890;
    int _974 = _972 + _962;
    int _976 = _974 + 1;
    float _978 = in.m_49.z;
    uint _980 = uint(int(uint(_968) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[int(_990)][_992];
    float _996 = -_569;
    float _998 = fma(_970, 2.0, _996);
    int _1000 = _573 * _976;
    int _1002 = _1000 + _782;
    bool _1004 = _894 != 3;
    float _1006 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1008;
    int _1012 = _968 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[int(_1024)][_1026];
    int _1030 = ~_944;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = _964 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1038;
    bool _1042 = !_748;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = 1.0 / _1010;
    bool _1048 = _950 >= 0.0;
    bool _1050 = isnan(_950);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1062 = !_682;
    int _1064 = _1062 ? _1002 : (-1);
    float _1066 = _892 * 2.0;
    int _1068 = _1034;
    if (_1004)
    {
        int _1070 = ~_944;
        int _1072 = _1070 + 1;
        _1068 = _1072;
    }
    int _1074 = _1068;
    bool _1076 = _950 > 0.0;
    float _1078 = 1.0 / _1040;
    bool _1080 = _894 != 3;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1084 = _563 + _1082;
    bool _1086 = !_896;
    int _1088 = _1086 ? 0 : 1;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1092 = _563 + _1090;
    int _1094 = abs(_928);
    int _1096 = _1056 ? 0 : 1;
    float _1098 = floor(_1066);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1110 = _1108 != 0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1114 = _563 + _1112;
    int _1116 = abs(_1088);
    int _1118 = ~_1094;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _1114 * _1046;
    int _1126 = abs(_1074);
    float _1128 = 1.0 / _1060;
    int _1130 = ~_1116;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    float _1136 = _1084 * _1078;
    float _1138 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1140 = log2(_1138);
    bool _1142 = !_1080;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = _1122 * as_type<int>(_994);
    int _1148 = ~_1126;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = abs(_1144);
    int _1156 = _1134 * as_type<int>(_986);
    int _1158 = _1156 + _1146;
    int _1160 = ~_1096;
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    float _1166 = _1092 * _1128;
    bool _1168 = _1098 >= 0.0;
    bool _1170 = isnan(_1098);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    int _1178 = _1152 * as_type<int>(_1020);
    int _1180 = _1178 + _1158;
    int _1182 = _1164;
    if (!_1076)
    {
        int _1184 = ~_1096;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = abs(_1044);
    float _1192 = _117 * _1140;
    int _1194 = abs(_597);
    float _1196 = _978 * 2.0;
    int _1198 = ~_1154;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = float(uint(_597));
    float _1206 = exp2(_1192);
    int _1208 = _1176 ? 0 : 1;
    int _1210 = _1202 * as_type<int>(_1028);
    int _1212 = _1210 + _1180;
    bool _1214 = _1098 > 0.0;
    float _1216 = _137 + _892;
    int _1218 = ~_1190;
    int _1220 = _1218 + 1;
    int _1222 = _1220 + 1;
    float _1224 = float(uint(_1194));
    float _1226 = 1.0 / _1204;
    float _1228 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _1230 = _1212 * _1222;
    float _1232 = _1216 + (-1.0);
    float _1234 = _137 + _978;
    int _1236 = _1064 * _1190;
    int _1238 = _1236 + _1230;
    float _1240 = _1228 * _137;
    float _1242 = 1.0 / _1224;
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1246 = _1234 + (-1.0);
    float _1248 = float(uint(_1238));
    float _1250 = _892 + _978;
    int _1252 = abs(_1238);
    float _1254 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1256 = ~_1208;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    float _1262 = floor(_1196);
    int _1264 = as_type<int>(_1226) + (-2);
    float _1266 = -_1206;
    float _1268 = _1266 + 1.0;
    int _1270 = _1260;
    if (!_1214)
    {
        int _1272 = ~_1208;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    float _1278 = _1250 + (-1.0);
    float _1280 = float(uint(_1252));
    float _1282 = as_type<float>(_1264) * _1248;
    float _1284 = trunc(_1240);
    int _1286 = int(_1284);
    int _1288 = as_type<int>(_1242) + (-2);
    float _1290 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1292 = as_type<float>(_1288) * _1280;
    int _1294 = ~_597;
    int _1296 = _1294 + 1;
    float _1298 = trunc(_1282);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    bool _1304 = _1262 >= 0.0;
    bool _1306 = isnan(_1262);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1314;
    int _1318 = ~_1194;
    int _1320 = _1318 + 1;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1326 = _1312 ? 0 : 1;
    float _1328 = fma(_1316, _1136, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1330 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1338 = _1334 || _1336;
    float _1340 = trunc(_1292);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    int _1346 = _1286 << 4;
    int _1348 = _1346 + 1712;
    float _1350 = fma(_1324, _1166, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1352 = _1338 ? _1268 : 0.0;
    uint _1354 = uint(int(uint(_1348) >> uint(2)));
    uint _1356 = uint(int(uint(int(_1354)) >> uint(2)));
    int _1358 = int(_1354) & 3;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[int(_1356)][_1358];
    int _1362 = int(_1354) + 1;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    int _1366 = _1362 & 3;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[int(_1364)][_1366];
    bool _1370 = _1262 > 0.0;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1372;
    int _1376 = _1296 * int(_1302);
    int _1378 = _1376 + _1238;
    float _1380 = float(_1276);
    float _1382 = fma(_1374, _1136, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1388 = _1348 + 8;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[int(_1392)][_1394];
    float _1398 = float(uint(_1378));
    int _1400 = _1320 * int(_1344);
    int _1402 = _1400 + _1252;
    float _1404 = fma(_1386, _1166, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1406 = as_type<float>(_1264) * _1398;
    bool _1408 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1410 = isnan(_563);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = float(uint(_1402));
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1424 = 1.0 + _1422;
    bool _1426 = _597 == 0;
    float _1428 = trunc(_1406);
    float _1430 = precise::max(_1428, 0.0);
    uint _1432 = uint(_1430);
    float _1434 = -_1418;
    float _1436 = _1434 + 1.0;
    float _1438 = as_type<float>(_1288) * _1420;
    bool _1440 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1442 = isnan(_563);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    bool _1452 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1454 = isnan(_563);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    bool _1464 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1466 = isnan(_563);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1450 * _1436;
    float _1478 = 1.0 / _1424;
    float _1480 = -_1450;
    float _1482 = _1480 + 1.0;
    float _1484 = -_1462;
    float _1486 = _1484 + 1.0;
    float _1488 = _1462 * _1482;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1494;
    float _1498 = trunc(_1438);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = ~_597;
    int _1506 = _1504 + 1;
    float _1508 = _1474 * _1486;
    float _1510 = fma(_1492, _1124, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1512 = int(_1302) + int(_1432);
    float _1514 = fma(_1496, _1124, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1516 = _1328 * _1508;
    float _1518 = _1382 * _1508;
    float _1520 = -_1474;
    float _1522 = _1520 + 1.0;
    float _1524 = _1352 * _1478;
    int _1526 = ~_1326;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    int _1532 = _1506 * _1512;
    int _1534 = _1532 + _1238;
    float _1536 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1516);
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1518);
    int _1540 = _1530;
    if (!_1370)
    {
        int _1542 = ~_1326;
        int _1544 = _1542 + 1;
        _1540 = _1544;
    }
    int _1546 = _1540;
    float _1548 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1550 = !_1106;
    int _1552 = _1550 ? 0 : 1;
    float _1554 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1556 = !_1110;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = uint(_1534) >= uint(_597);
    int _1562 = int(_1344) + int(_1502);
    int _1564 = abs(_1552);
    float _1566 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1568 = ~_1194;
    int _1570 = _1568 + 1;
    int _1572 = abs(_1558);
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = float(_1188);
    float _1578 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = float(_1564);
    int _1584 = _1570 * _1562;
    int _1586 = _1584 + _1252;
    float _1588 = float(_1572);
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1592 = !_1560;
    int _1594 = _1592 ? 0 : (-1);
    float _1596 = _1582 * _1576;
    bool _1598 = uint(_1586) >= uint(_1194);
    float _1600 = _1588 * _1380;
    int _1602 = ~_1512;
    int _1604 = _1602 + _1594;
    int _1606 = _1604 + 1;
    out.m_56.x = _1578;
    out.m_56.y = _1580;
    out.m_56.z = _1574;
    out.m_56.w = _1590;
    float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1610 = _137 > 0.5;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1006 + _1612;
    int _1616 = _597 * _1606;
    int _1618 = _1616 + _1238;
    float _1620 = in.m_58.x;
    float _1622 = in.m_58.y;
    float _1624 = in.m_58.z;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1628 = _1626 != 0;
    float _1630 = -_187;
    int _1632 = _1610 ? as_type<int>(_1630) : as_type<int>(_187);
    bool _1634 = !_1426;
    int _1636 = _1634 ? _1618 : (-1);
    bool _1638 = !_1598;
    int _1640 = _1638 ? 0 : (-1);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _828 + _1642;
    int _1646 = _1238 ^ _597;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1650 = _597 == 0;
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _1654 = uint(int(uint(_1646) >> uint(31)));
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1658 = _1036 + _1656;
    int _1660 = ~_1640;
    int _1662 = _1562 + _1660;
    int _1664 = _1662 + 1;
    float _1666 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1652);
    int _1668 = ~int(_1654);
    int _1670 = _1668 + 1;
    float _1672 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1674 = float(_1636);
    float _1676 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1666);
    bool _1678 = !_1628;
    float _1680 = _1678 ? _187 : as_type<float>(_1632);
    float _1682 = -_117;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[76].x, _998);
    int _1686 = _1664 ^ _1670;
    float _1688 = _1596 * (-2.0);
    bool _1690 = _1676 >= 0.0;
    float _1692 = fma(_1672, _1674, _1684);
    float _1694 = _1680 + 0.5;
    float _1696 = _1644 * _1644;
    int _1698 = ~_1670;
    int _1700 = _1698 + _1686;
    int _1702 = _1700 + 1;
    float _1704 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1706 = fma(_1672, _1694, _1692);
    float _1708 = fma(_1614, _1614, _1696);
    bool _1710 = _892 > 0.5;
    float _1712 = fma(_1290, _1688, _1290);
    bool _1714 = !_1650;
    int _1716 = _1714 ? _1702 : (-1);
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1720 = fma(_1658, _1658, _1708);
    float _1722 = fma(_1688, _1622, _1622);
    float _1724 = -_195;
    int _1726 = _1710 ? as_type<int>(_1724) : as_type<int>(_195);
    float _1728 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _954);
    float _1730 = float(_1716);
    float _1732 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1718);
    float _1734 = rsqrt(_1720);
    bool _1736 = !_920;
    float _1738 = _1736 ? _195 : as_type<float>(_1726);
    float _1740 = -_1728;
    float _1742 = fma(_1704, _1730, _1740);
    float _1744 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1750 = isnan(1.0);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1756 = _1752 || _1754;
    float _1758 = _1738 + (-0.5);
    float _1760 = _1722;
    int _1762 = as_type<int>(_1644);
    if (_1690)
    {
        out.m_45.x = 0.0;
    }
    float _1764 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1746);
    float _1766 = -_1704;
    float _1768 = fma(_1766, _1758, _1742);
    float _1770 = _892 + (-0.5);
    float _1772 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1764);
    bool _1774 = !_1102;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = -_1744;
    float _1780 = _1778 + 1.0;
    float _1782 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1722);
    float _1784 = -_1772;
    float _1786 = _1784 + 1.0;
    int _1788 = abs(_1776);
    float _1790 = _1644 * _1734;
    if (_1690)
    {
        _1760 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1792 = _1760;
    float _1794 = fma(_1738, _1786, _1768);
    float _1796 = float(_1546);
    float _1798 = -_1790;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _1802 = -_1780;
    float _1804 = fma(_1680, _1802, _1706);
    if (_1690)
    {
        float _1806 = _1792 * 5.0;
        _1762 = as_type<int>(_1806);
    }
    int _1808 = _1762;
    float _1810 = float(_1788);
    float _1812 = _1614 * _1734;
    bool _1814 = !_1756;
    float _1816 = _1814 ? _117 : _1524;
    float _1818 = _1800 * _1800;
    float _1820 = -_1812;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1824 = _1810 * _1796;
    float _1826 = fma(_1816, _1712, _1782);
    if (_1690)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5484 = as_type<float>(_1808);
        out.gl_Position.z = _5484;
    }
    float _1828 = fma(_1822, _1822, _1818);
    float _1830 = _137 + (-0.5);
    float _1832 = _1824 * (-2.0);
    out.m_60.x = _1804;
    out.m_60.y = _1794;
    float _1834 = _1826 * 0.15915493667125701904296875;
    if (_1690)
    {
        return out;
    }
    float _1836 = -_1790;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _1840 = _1658 * _1734;
    float _1842 = -_1812;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1846 = fma(_1832, _1620, _1620);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1850 = _1838 + _1848;
    float _1852 = -_1840;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1858 = _1844 + _1856;
    float _1860 = -_1840;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1854 + _1866;
    float _1870 = fma(_1244, _1832, _1244);
    float _1872 = _1600 * (-2.0);
    float _1874 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1864);
    float _1876 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1846);
    float _1878 = fma(_1862, _1862, _1828);
    float _1880 = fma(_1872, _1624, _1624);
    float _1882 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1874);
    float _1884 = in.m_54.x;
    float _1886 = in.m_54.y;
    float _1888 = _978 + (-0.5);
    float _1890 = fma(_1254, _1872, _1254);
    float _1892 = fma(_1404, _1488, _1538);
    bool _1894 = _1882 >= 0.0;
    float _1896 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1880);
    float _1898 = fma(_1350, _1488, _1536);
    float _1900 = fma(_1816, _1870, _1876);
    float _1902 = fma(_1514, _1476, _1892);
    float _1904 = fma(_1816, _1890, _1896);
    float _1906 = fma(_1510, _1476, _1898);
    float _1908 = sqrt(_1878);
    float _1910 = _1900 * 0.15915493667125701904296875;
    float _1912 = _1904 * 0.15915493667125701904296875;
    float _1914 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1902);
    float _1916 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1906);
    float _1918 = _1896;
    float _1920 = _1850;
    if (_1894)
    {
        _1918 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1922 = _1918;
    int _1924 = as_type<int>(_1922);
    if (_1894)
    {
        out.m_45.x = 0.0;
    }
    float _1926 = _1834 * 6.283185482025146484375;
    float _1928 = sin(_1926);
    if (_1894)
    {
        float _1930 = _1922 * 5.0;
        _1924 = as_type<int>(_1930);
    }
    int _1932 = _1924;
    float _1934 = _1914 * _1886;
    float _1936 = _1834 * 6.283185482025146484375;
    float _1938 = cos(_1936);
    if (_1894)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5685 = as_type<float>(_1932);
        out.gl_Position.z = _5685;
    }
    float _1940 = _1734 * _1908;
    float _1942 = _521 * _1934;
    float _1944 = _1910 * 6.283185482025146484375;
    float _1946 = sin(_1944);
    float _1948 = _1910 * 6.283185482025146484375;
    float _1950 = cos(_1948);
    float _1952 = _1912 * 6.283185482025146484375;
    float _1954 = sin(_1952);
    float _1956 = _1946;
    if (_1894)
    {
        return out;
    }
    float _1958 = _1912 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    float _1962 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1964 = _1916 * _1884;
    float _1966 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1968 = _1950 * _1938;
    float _1970 = _1940 * _1962;
    float _1972 = _521 * _1964;
    float _1974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1976 = _1950 * _1928;
    float _1978 = _1966 * _1970;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1982 = _1946 * _1928;
    float _1984 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1986 = _1984 * 0.5;
    float _1988 = _1940 * _1980;
    float _1990 = fma(_1954, _1968, _1982);
    float _1992 = _1960 * _1978;
    float _1994 = _1928 * _1960;
    float _1996 = _1938 * _1960;
    float _1998 = _1974 * _1988;
    float _2000 = _1950 * _1992;
    float _2002 = _1946 * _1938;
    float _2004 = -_1978;
    float _2006 = _1954 * _2004;
    float _2008 = fma(_1954, _1982, _1968);
    float _2010 = fma(_1990, _1998, _2000);
    float _2012 = -_2002;
    float _2014 = fma(_1954, _1976, _2012);
    float _2016 = -_1976;
    float _2018 = fma(_1954, _2002, _2016);
    float _2020 = _1946 * _1992;
    float _2022 = fma(_1996, _1998, _2006);
    float _2024 = fma(_2014, _1986, _2010);
    float _2026 = fma(_2018, _1998, _2020);
    float _2028 = fma(_1994, _1986, _2022);
    float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2034 = fma(_2008, _1986, _2026);
    float _2036 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2040 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2032);
    float _2042 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2036);
    float _2044 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2040);
    float _2048 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2042);
    float _2050 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2052 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2054 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2056 = _1036 + _2050;
    float _2058 = _1006 + _2052;
    float _2060 = _828 + _2054;
    float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2064 = _2056 + _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2068 = _2058 + _2066;
    float _2070 = _2064 * _2064;
    float _2072 = fma(_2068, _2068, _2070);
    float _2074 = sqrt(_2072);
    bool _2076 = _2074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2070;
    float _2080 = _2054;
    float _2082 = _2058;
    float _2084 = _2068;
    float _2086 = _1992;
    if (!_2076)
    {
        _2078 = _2058;
    }
    float _2088 = _2078;
    float _2090 = _2088;
    if (!_2076)
    {
        _2080 = _2056;
    }
    float _2092 = _2080;
    float _2094 = _2092;
    if (!_2076)
    {
        _2082 = _2060;
    }
    float _2096 = _2082;
    bool _2098 = !_2076;
    float _2100 = _2096;
    if (!_2098)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2106 = _2074 + _2104;
        float _2108 = rsqrt(_2072);
        float _2110 = _2106 * _2102;
        float _2112 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = _2110 * 0.15915493667125701904296875;
        float _2116 = _2114 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = _2114 * 6.283185482025146484375;
        float _2122 = cos(_2120);
        float _2124 = fma(_2118, _2112, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2126 = _2108 * _2124;
        float _2128 = _2122 + (-1.0);
        float _2130 = fma(_2068, _2126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2132 = fma(_2064, _2126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2134 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2136 = fma(_2060, _2122, _2134);
        _2100 = _2136;
        _2090 = _2130;
        _2094 = _2132;
    }
    float _2138 = _2100;
    float _2140 = _2090;
    float _2142 = _2094;
    float _2144 = -_828;
    float _2146 = _2144 + _2138;
    float _2148 = -_1006;
    float _2150 = _2148 + _2140;
    float _2152 = -_1036;
    float _2154 = _2152 + _2142;
    float _2156 = _2146 * _2146;
    float _2158 = fma(_2150, _2150, _2156);
    float _2160 = fma(_2154, _2154, _2158);
    float _2162 = sqrt(_2160);
    bool _2164 = _2162 > 0.0;
    float _2166 = _2162;
    float _2168 = _2138;
    float _2170 = _2154;
    if (!_2164)
    {
        _2084 = _2140;
    }
    float _2172 = _2084;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2164)
    {
        _2166 = _2142;
    }
    float _2178 = _2166;
    bool _2180 = !_2164;
    float _2182 = _2178;
    float _2184 = _2178;
    float _2186 = _2178;
    if (!_2180)
    {
        bool _2188 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2190 = _2072;
        if (_2188)
        {
            float _2192 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2190 = _2192;
        }
        float _2194 = _2190;
        float _2196 = _2194;
        if (_2188)
        {
            float _2198 = _513 * _2194;
            _2086 = _2198;
        }
        float _2200 = _2086;
        float _2202 = _2200;
        if (_2188)
        {
            float _2204 = _515 * _2194;
            _1956 = _2204;
        }
        float _2206 = _1956;
        float _2208 = _2206;
        if (_2188)
        {
            float _2210 = _517 * _2194;
            _2196 = _2210;
        }
        float _2212 = _2196;
        float _2214 = _2212;
        if (!_2188)
        {
            float _2216 = _117 + 1.0;
            float _2218 = _2216;
            if (!_153)
            {
                float _2220 = _2216 * _2216;
                float _2222 = _2220 * 0.5;
                _2182 = _2222;
            }
            float _2224 = _2182;
            float _2226 = _2224;
            if (!_153)
            {
                float _2228 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2226 = _2228;
            }
            float _2230 = _2226;
            bool _2232 = !_153;
            float _2234 = _2230;
            if (!_2232)
            {
                float _2236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2238 = log2(_2236);
                float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2242 = 1.0 + _2240;
                float _2244 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2246 = _2238 * _2216;
                float _2248 = 1.0 / _2242;
                float _2250 = _2244 * 0.693147182464599609375;
                float _2252 = exp2(_2246);
                float _2254 = 1.0 / _2250;
                float _2256 = _2252 + (-1.0);
                float _2258 = -_2256;
                float _2260 = fma(_2258, _2254, _2216);
                float _2262 = _2260 * _2248;
                float _2264 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2234 = _2264;
            }
            float _2266 = _2234;
            float _2268 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2270 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2272 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2274 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2276 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2278 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2274);
            float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2276);
            float _2284 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2280);
            bool _2286 = !_153;
            _2184 = _2272;
            if (!_2286)
            {
                float _2288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2290 = log2(_2288);
                float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2294 = 1.0 + _2292;
                float _2296 = 1.0 / _2294;
                float _2298 = _2290 * _2216;
                float _2300 = exp2(_2298);
                float _2302 = -_2300;
                float _2304 = _2302 + 1.0;
                float _2306 = _2304 * _2296;
                _2218 = _2306;
            }
            float _2308 = _2218;
            float _2310 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2278);
            float _2312 = fma(_2308, _161, _2284);
            float _2314 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2282);
            float _2316 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2310);
            float _2318 = -_463;
            float _2320 = _2318 + _2312;
            float _2322 = fma(_2308, _159, _2314);
            float _2324 = fma(_2308, _163, _2316);
            float _2326 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2328 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2330 = -_467;
            float _2332 = _2330 + _2322;
            float _2334 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2336 = -_477;
            float _2338 = _2336 + _2324;
            float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2326);
            float _2342 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2328);
            float _2344 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2334);
            float _2346 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2340);
            float _2348 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2342);
            float _2350 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2344);
            _525 = _2348;
            _527 = _2346;
            _529 = _2350;
            _2202 = _2346;
            _2208 = _2348;
            _2214 = _2350;
            _2174 = _2314;
        }
        float _2352 = _525;
        float _2354 = _527;
        float _2356 = _529;
        float _2358 = _2202;
        float _2360 = _2208;
        float _2362 = _2214;
        float _2364 = _2174;
        float _2366 = _2184;
        float _2368 = _2352 * _2352;
        float _2370 = rsqrt(_2160);
        float _2372 = fma(_2354, _2354, _2368);
        float _2374 = fma(_2356, _2356, _2372);
        float _2376 = sqrt(_2374);
        float _2378 = _2146 * _2370;
        float _2380 = _2150 * _2370;
        float _2382 = _2154 * _2370;
        bool _2384 = _2376 > 0.0;
        float _2386 = _2364;
        float _2388 = _2366;
        _531 = _2380;
        if (!_2384)
        {
            _2386 = _2140;
        }
        float _2390 = _2386;
        _2176 = _2390;
        if (!_2384)
        {
            _2388 = _2142;
        }
        float _2392 = _2388;
        bool _2394 = !_2384;
        _2186 = _2392;
        if (!_2394)
        {
            float _2396 = rsqrt(_2374);
            float _2398 = _2396 * _2352;
            float _2400 = _2396 * _2354;
            float _2402 = _2396 * _2356;
            float _2404 = _2378 * _2398;
            float _2406 = fma(_2380, _2400, _2404);
            float _2408 = fma(_2382, _2402, _2406);
            float _2410 = _2408 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2412 = fma(_2358, _2410, _2140);
            float _2414 = fma(_2360, _2410, _2138);
            float _2416 = fma(_2362, _2410, _2142);
            _2176 = _2412;
            _2168 = _2414;
            _2186 = _2416;
        }
    }
    float _2418 = _2176;
    float _2420 = _2168;
    float _2422 = _2186;
    float _2424 = _531;
    bool _2426 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2428 = isnan(0.5);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2434 = _2430 || _2432;
    float _2436 = -_1812;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2418);
    float _2440 = -_1790;
    float _2442 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2420);
    float _2444 = -_1840;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2422);
    float _2448 = _2442;
    float _2450 = _2438;
    float _2452 = _2446;
    float _2454 = _2424;
    if (!_2434)
    {
        float _2456 = _1850 * _1850;
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2460 = -_1006;
        float _2462 = _2460 + _2418;
        float _2464 = -_828;
        float _2466 = _2464 + _2420;
        float _2468 = fma(_1858, _1858, _2456);
        float _2470 = -_1036;
        float _2472 = _2470 + _2422;
        float _2474 = fma(_1868, _1868, _2468);
        float _2476 = 1.0 / _1940;
        float _2478 = sqrt(_2474);
        float _2480 = precise::min(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2482 = _2480 * _2458;
        float _2484 = _2482 * _2476;
        float _2486 = fma(_2462, _2484, _1844);
        float _2488 = fma(_2466, _2484, _1838);
        float _2490 = fma(_2472, _2484, _1854);
        _2448 = _2488;
        _2450 = _2486;
        _2452 = _2490;
        _2170 = _2458;
    }
    float _2492 = _2448;
    float _2494 = _2450;
    float _2496 = _2452;
    float _2498 = _2170;
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2502 = _2492 + _2500;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2506 = _2494 + _2504;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2510 = _2496 + _2508;
    float _2512 = _2502 * _2502;
    float _2514 = fma(_2506, _2506, _2512);
    float _2516 = fma(_2510, _2510, _2514);
    float _2518 = rsqrt(_2516);
    float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2522 = _2506 * _2520;
    float _2524 = _2510 * _2520;
    float _2526 = _2522 * _2522;
    float _2528 = _2524 * _2524;
    float _2530 = _2526 + _2528;
    float _2532 = sqrt(_2530);
    bool _2534 = _2532 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2538 = _2532 + _2536;
    float _2540 = _2518;
    float _2542 = _2498;
    float _2544 = _2538;
    float _2546 = _2520;
    float _2548 = _2526;
    if (_2534)
    {
        float _2550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2550;
    }
    float _2552 = _2540;
    if (_2534)
    {
        float _2554 = rsqrt(_2530);
        _2542 = _2554;
    }
    float _2556 = _2542;
    float _2558 = _2556;
    if (_2534)
    {
        float _2560 = _2538 * _2552;
        _2544 = _2560;
    }
    float _2562 = _2544;
    if (_2534)
    {
        float _2564 = _2562 * 0.15915493667125701904296875;
        _1920 = _2564;
    }
    float _2566 = _1920;
    float _2568 = _2150;
    if (_2534)
    {
        float _2570 = _2566 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        _2568 = _2572;
    }
    float _2574 = _2568;
    float _2576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2578 = precise::max(0.0, _2576);
    float _2580 = _2510;
    float _2582 = _2578;
    float _2584 = _2576;
    if (_2534)
    {
        float _2586 = _2566 * 6.283185482025146484375;
        float _2588 = cos(_2586);
        _2580 = _2588;
    }
    float _2590 = _2580;
    float _2592 = -_2520;
    float _2594 = -_2578;
    float _2596 = fma(_2502, _2592, _2594);
    if (_2534)
    {
        float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2582 = _2598;
    }
    float _2600 = _2582;
    float _2602 = sqrt(_2516);
    float _2604 = _2574;
    float _2606 = _2600;
    if (_2534)
    {
        float _2608 = fma(_2574, _2600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2604 = _2608;
    }
    float _2610 = _2604;
    float _2612 = _2610;
    if (!_2534)
    {
        _2606 = _2524;
    }
    float _2614 = _2606;
    float _2616 = _2614;
    if (_2534)
    {
        float _2618 = _2590 + (-1.0);
        _2584 = _2618;
    }
    float _2620 = _2584;
    float _2622 = _2620;
    if (_2534)
    {
        float _2624 = _2556 * _2610;
        _2454 = _2624;
    }
    float _2626 = _2454;
    if (!_2534)
    {
        _2558 = _2522;
    }
    float _2628 = _2558;
    float _2630 = _2628;
    if (_2534)
    {
        float _2632 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2546 = _2632;
    }
    float _2634 = _2546;
    if (_2534)
    {
        float _2636 = _2522 * _2626;
        _2630 = _2636;
    }
    float _2638 = _2630;
    if (!_2534)
    {
        _2612 = _2596;
    }
    float _2640 = _2612;
    float _2642 = _2640;
    if (_2534)
    {
        float _2644 = _2524 * _2626;
        _2616 = _2644;
    }
    float _2646 = _2616;
    if (_2534)
    {
        float _2648 = fma(_2596, _2590, _2634);
        _2642 = _2648;
    }
    float _2650 = _2642;
    if (_2534)
    {
        float _2652 = _2638 * _2638;
        _2548 = _2652;
    }
    float _2654 = _2548;
    if (!_2534)
    {
        _2622 = _2528;
    }
    float _2656 = _2622;
    float _2658 = _2656;
    if (_2534)
    {
        float _2660 = _2646 * _2646;
        _2658 = _2660;
    }
    float _2662 = _2658;
    float _2664 = fma(_2650, _2650, _2654);
    float _2666 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2668 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2670 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2672 = _2664 + _2662;
    float _2674 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2666);
    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2678 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2676);
    float _2680 = precise::clamp(_2678, 0.0, 1.0);
    float _2682 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2684 = rsqrt(_2672);
    float _2686 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2688 = -_2680;
    float _2690 = _2688 + 1.0;
    float _2692 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2682);
    float _2694 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2670);
    float _2696 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2674);
    float _2698 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2686);
    float _2700 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2692);
    float _2702 = abs(_2690);
    float _2704 = log2(_2702);
    float _2706 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2694);
    float _2708 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2710 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2712 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2698);
    float _2714 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2716 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2720 = _2684 * _2638;
    float _2722 = _2684 * _2650;
    float _2724 = _2684 * _2646;
    float _2726 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2718);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = -_2716;
    float _2732 = fma(_2730, _2668, 1.0);
    float _2734 = _2712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2736 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2738 = -_2728;
    float _2740 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2738);
    float _2742 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2744 = log2(_2732);
    float _2746 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2748 = -_2724;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2740);
    float _2752 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2754 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2746);
    float _2756 = fma(_2750, -0.5, 0.5);
    float _2758 = fma(_2750, 0.5, 0.5);
    float _2760 = exp2(_2742);
    float _2762 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2736);
    float _2764 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2752);
    float _2766 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2754);
    float _2768 = _2722 + 1.0;
    float _2770 = fma(_2758, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2772 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2764);
    float _2774 = 1.0 / _2762;
    float _2776 = fma(_2758, _2770, -0.212114393711090087890625);
    float _2778 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2772);
    float _2780 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2782 = _2744 * 0.693147182464599609375;
    float _2784 = fma(_2758, _2776, 1.570728778839111328125);
    float _2786 = sqrt(_2756);
    float _2788 = -_2722;
    float _2790 = fma(_2760, _2768, _2788);
    float _2792 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2794 = fma(_2790, 0.5, 0.5);
    float _2796 = _2778 * _2774;
    float _2798 = _2780 * _2774;
    float _2800 = fma(_2796, 0.5, 0.5);
    float _2802 = fma(_2798, -0.5, 0.5);
    float _2804 = _2786 * 0.636619746685028076171875;
    float3 _7070 = float3(_2800, _2802, _2792);
    float _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7070, float3(0.0), isnan(_7070)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7070, float3(0.0), isnan(_7070)), level(0.0)).x;
    float3 _7081 = float3(_2800, _2802, _2792);
    float4 _2809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7081, float3(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7081, float3(0.0), isnan(_7081)), level(0.0)).xyzw;
    float _2811 = _2809.x;
    float _2813 = _2809.y;
    float _2815 = _2809.z;
    float _2817 = _2809.w;
    float _2819 = -_2784;
    float _2821 = fma(_2804, _2819, 1.0);
    float2 _7103 = float2(_2821, _2794);
    float3 _2825 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7103, float2(0.0), isnan(_7103)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7103, float2(0.0), isnan(_7103)), level(0.0)).xyz;
    float _2827 = _2825.x;
    float _2829 = _2825.y;
    float _2831 = _2825.z;
    float _2833 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2835 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2837 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2835);
    float _2839 = exp2(_2833);
    float _2841 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2837);
    float _2843 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2841);
    float _2845 = _2843 + _2762;
    float _2847 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2778;
    out.gl_Position.y = _2780;
    out.gl_Position.z = _2843;
    out.gl_Position.w = _2762;
    float _2849 = _2845 * 0.5;
    float _2851 = -_2839;
    float _2853 = _2851 + 1.0;
    out.m_45.x = _2847;
    float _2855 = _2853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2849;
    out.m_62.w = _2762;
    float _2857 = _2855 * _2806;
    float _2859 = -_2855;
    float _2861 = _2859 + 1.0;
    float _2863 = _2817 * _2857;
    float _2865 = _2817 * _2861;
    float _2867 = _2831 * _2857;
    float _2869 = fma(_2827, _2863, _2811);
    float _2871 = fma(_2829, _2863, _2813);
    float _2873 = fma(_2817, _2867, _2815);
    out.m_64.x = _2869;
    out.m_64.y = _2871;
    out.m_64.z = _2873;
    out.m_64.w = _2865;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _553 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2930 = as_type<float>(_99);
        out.gl_Position.z = _2930;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_135);
        out.gl_Position.z = _2998;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = _141 * _139;
    float _157 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _155);
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    float _165 = floor(_157);
    float _167 = _157 * 6.283185482025146484375;
    int _169 = as_type<int>(_143) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_143) & 2;
    bool _175 = _173 != 0;
    float _177 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _167 * 0.15915493667125701904296875;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_175;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_165;
    float _199 = _157 + _197;
    float _201 = _165;
    float _203 = _177;
    if (!_153)
    {
        float _205 = _177 * _177;
        float _207 = _205 * 0.5;
        _201 = _207;
    }
    float _209 = _201;
    float _211 = _209;
    if (!_153)
    {
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _213;
    }
    float _215 = _211;
    bool _217 = !_153;
    float _219 = _215;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _177 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _177);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_153;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _177 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _203 = _273;
    }
    float _275 = _203;
    float _277 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = in.m_54.w;
    float _281 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _285 = in.m_42.x;
    float _287 = in.m_42.y;
    float _289 = in.m_42.z;
    float _291 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _293 = _277 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _295 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].x, _283);
    float _297 = fma(_191, 0.5, 0.5);
    float _299 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].y, _291);
    float _301 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[8].z, _293);
    float _303 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _305 = -_297;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _309 = _199 < 0.5;
    float _311 = float(_309);
    float _313 = _291;
    if (!_153)
    {
        float _315 = _117 * _117;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].x, _295);
    float _323 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].y, _299);
    float _325 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[10].z, _301);
    float _327 = -_199;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_275, _159, _321);
    float _333 = fma(_275, _161, _323);
    float _335 = fma(_275, _163, _325);
    float _337 = -_311;
    float _339 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _341 = _325;
    float _343 = _319;
    if (!_153)
    {
        _341 = _117;
    }
    float _345 = _341;
    float _347 = _345;
    if (!_153)
    {
        float _349 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _343 = _349;
    }
    float _351 = _343;
    bool _353 = !_153;
    float _355 = _351;
    if (!_353)
    {
        float _357 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _359 = log2(_357);
        float _361 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _363 = _361 + 1.0;
        float _365 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = _117 * _359;
        float _369 = 1.0 / _363;
        float _371 = _365 * 0.693147182464599609375;
        float _373 = exp2(_367);
        float _375 = 1.0 / _371;
        float _377 = _373 + (-1.0);
        float _379 = -_377;
        float _381 = fma(_379, _375, _117);
        float _383 = _381 * _369;
        float _385 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _355 = _385;
    }
    float _387 = _355;
    bool _389 = !_153;
    if (!_389)
    {
        float _391 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = log2(_391);
        float _395 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _397 = _395 + 1.0;
        float _399 = 1.0 / _397;
        float _401 = _117 * _393;
        float _403 = exp2(_401);
        float _405 = -_403;
        float _407 = _405 + 1.0;
        float _409 = _407 * _399;
        _347 = _409;
    }
    float _411 = _347;
    float _413 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _415 = fma(_331, _279, _285);
    float _417 = fma(_333, _279, _287);
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _421 = _419 != 0;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _425 = _423 != 0;
    float _427 = fma(_335, _279, _289);
    float _429 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _431 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _433 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _435 = !_421;
    int _437 = _435 ? 0 : 1;
    float _439 = _413 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _441 = _387 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _443 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].x, _431);
    float _445 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].y, _433);
    int _447 = abs(_437);
    float _449 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[8].z, _439);
    bool _451 = !_181;
    int _453 = _451 ? 0 : 1;
    float _455 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].x, _443);
    float _457 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].y, _445);
    float _459 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[10].z, _449);
    int _461 = abs(_453);
    float _463 = fma(_411, _161, _457);
    float _465 = float(_447);
    float _467 = fma(_411, _159, _455);
    float _469 = -_463;
    float _471 = _333 + _469;
    bool _473 = !_425;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_411, _163, _459);
    bool _479 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _481 = abs(_329);
    float _483 = _465 * _481;
    float _485 = float(_461);
    float _487 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _489 = abs(_475);
    float _491 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _493 = -_467;
    float _495 = _331 + _493;
    float _497 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _499 = -_477;
    float _501 = _335 + _499;
    float _503 = fma(_485, _307, _483);
    float _505 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[4].x, _491);
    float _507 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
    float _509 = fma(_495, (*spvDescriptorSet0.vp_c10)._m0[6].x, _497);
    float _511 = float(_489);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
    float _515 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
    float _517 = fma(_501, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
    float _519 = abs(_339);
    float _521 = fma(_511, _519, _503);
    bool _523 = !_479;
    float _525 = _515;
    float _527 = _513;
    float _529 = _517;
    float _531 = _463;
    float _549;
    float _551;
    if (!_523)
    {
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _535 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _539 = _537 * _533;
        float _541 = float(_83);
        float _543 = floor(_539);
        float _545 = -_543;
        float _547 = _539 + _545;
        _549 = _541;
        _551 = _547;
        _553 = true;
    }
    else
    {
        float _555 = float(_83);
        float _557 = 1.0 / _555;
        float _559 = _117 * _557;
        _549 = _555;
        _551 = _559;
    }
    _553 = false;
    float _561 = _549;
    float _563 = _551;
    float _565 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _567 = int(_565);
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _573 = int(_571);
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _577 = float(_567);
    float _579 = 1.0 / _561;
    float _581 = float(uint(_573));
    float _583 = 1.0 / _577;
    int _585 = ~_573;
    int _587 = _585 + 1;
    float _589 = float(_573);
    float _591 = 1.0 / _581;
    float _593 = _117 * _583;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _597 = int(_595);
    int _599 = as_type<int>(_591) + (-2);
    float _601 = trunc(_593);
    int _603 = int(_601);
    float _605 = float(uint(_603));
    float _607 = as_type<float>(_599) * _605;
    int _609 = ~_573;
    int _611 = _609 + 1;
    float _613 = trunc(_607);
    float _615 = precise::max(_613, 0.0);
    uint _618 = uint(_615);
    int _620 = _611 * int(_618);
    int _622 = _620 + _603;
    float _624 = float(uint(_622));
    float _626 = as_type<float>(_599) * _624;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _630 = _628 != 0;
    float _632 = trunc(_626);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    bool _638 = !_630;
    float _640 = _638 ? 7.345489978790283203125 : 1.0;
    float _642 = _640 * _137;
    float _644 = floor(_642);
    int _646 = int(_618) + int(_636);
    float _648 = float(_603);
    int _650 = _587 * _646;
    int _652 = _650 + _603;
    bool _654 = _648 >= _589;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan(_589);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    bool _666 = uint(_652) >= uint(_573);
    float _668 = -_644;
    float _670 = _642 + _668;
    float _672 = trunc(_664);
    int _674 = int(_672);
    bool _676 = !_666;
    int _678 = _676 ? 0 : (-1);
    float _680 = _670 * _589;
    bool _682 = _573 == 0;
    float _684 = _117 * _589;
    int _686 = ~_646;
    int _688 = _686 + _678;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _702 = _700 != 0;
    float _704 = _684 * _579;
    float _706 = trunc(_680);
    int _708 = int(_706);
    int _710 = _573 * _690;
    int _712 = _710 + _603;
    bool _714 = !_698;
    int _716 = _714 ? 0 : 1;
    bool _718 = !_694;
    int _720 = _718 ? 0 : 1;
    int _722 = ~_674;
    int _724 = _722 + 1;
    int _726 = _724 + 1;
    float _728 = trunc(_704);
    int _730 = int(_728);
    bool _732 = !_682;
    int _734 = _732 ? _712 : (-1);
    int _736 = abs(_720);
    int _738 = _734 * _726;
    int _740 = _573 + (-1);
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _748 = _746 != 0;
    int _750 = _674 * _740;
    int _752 = _750 + _738;
    bool _754 = !_744;
    int _756 = _754 ? 0 : 1;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _760 = _758 != 0;
    int _762 = abs(_716);
    bool _764 = !_702;
    int _766 = _764 ? 0 : 1;
    bool _768 = !_760;
    int _770 = _768 ? 0 : 1;
    int _772 = abs(_756);
    int _774 = abs(_766);
    int _776 = _752 * _762;
    int _778 = abs(_770);
    int _780 = _708 * _772;
    int _782 = _780 + _603;
    int _784 = _730 * _736;
    int _786 = _784 + _776;
    int _788 = ~_573;
    int _790 = _788 + 1;
    int _792 = ~_573;
    int _794 = _792 + 1;
    int _796 = _782 * _774;
    int _798 = _796 + _786;
    float _800 = float(uint(_782));
    int _802 = _708 * _778;
    int _804 = _802 + _798;
    int _806 = ~_573;
    int _808 = _806 + 1;
    float _810 = as_type<float>(_599) * _800;
    float _812 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _814 = float(uint(_804));
    float _816 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].x, _812);
    float _818 = trunc(_810);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = as_type<float>(_599) * _814;
    float _826 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].z, _816);
    float _828 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _830 = trunc(_824);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    int _836 = _808 * int(_834);
    int _838 = _836 + _804;
    float _840 = float(uint(_838));
    float _842 = as_type<float>(_599) * _840;
    float _844 = trunc(_842);
    float _846 = precise::max(_844, 0.0);
    uint _848 = uint(_846);
    int _850 = _790 * int(_822);
    int _852 = _850 + _782;
    float _854 = float(uint(_852));
    int _856 = int(_834) + int(_848);
    int _858 = _790 * _856;
    int _860 = _858 + _804;
    float _862 = as_type<float>(_599) * _854;
    bool _864 = uint(_860) >= uint(_573);
    float _866 = trunc(_862);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    bool _872 = !_864;
    int _874 = _872 ? 0 : (-1);
    int _876 = ~_856;
    int _878 = _876 + _874;
    int _880 = _878 + 1;
    int _882 = _573 * _880;
    int _884 = _882 + _804;
    bool _886 = !_682;
    int _888 = _886 ? _884 : (-1);
    int _890 = int(_822) + int(_870);
    float _892 = in.m_49.y;
    int _894 = _888 & 3;
    bool _896 = _894 != 0;
    int _898 = _888 & 3;
    bool _900 = _898 != 0;
    int _902 = _794 * _890;
    int _904 = _902 + _782;
    bool _906 = uint(_894) > 1u;
    int _908 = _900 ? 0 : 1;
    int _910 = _888 >> 31;
    int _912 = ~_908;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _920 = _918 != 0;
    int _922 = _916;
    if (!_906)
    {
        int _924 = ~_908;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _932 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _934 = uint(_894) >= 2u;
    float _936 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].x, _930);
    int _938 = _910 & 3;
    float _940 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].x, _932);
    float _942 = _137 * 2.0;
    int _944 = _934 ? 0 : 1;
    float _946 = _892 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _948 = _888 + _938;
    float _950 = floor(_942);
    bool _952 = uint(_904) >= uint(_573);
    float _954 = fma(_946, -2.0, _575);
    int _956 = _948 >> 2;
    float _958 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].z, _936);
    bool _960 = !_952;
    int _962 = _960 ? 0 : (-1);
    float _964 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].z, _940);
    int _966 = _956 << 4;
    int _968 = _966 + 368;
    float _970 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _972 = ~_890;
    int _974 = _972 + _962;
    int _976 = _974 + 1;
    float _978 = in.m_49.z;
    uint _980 = uint(int(uint(_968) >> uint(2)));
    uint _982 = uint(int(uint(int(_980)) >> uint(2)));
    int _984 = int(_980) & 3;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[int(_982)][_984];
    int _988 = int(_980) + 1;
    uint _990 = uint(int(uint(_988) >> uint(2)));
    int _992 = _988 & 3;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[int(_990)][_992];
    float _996 = -_569;
    float _998 = fma(_970, 2.0, _996);
    int _1000 = _573 * _976;
    int _1002 = _1000 + _782;
    bool _1004 = _894 != 3;
    float _1006 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1008;
    int _1012 = _968 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    uint _1016 = uint(int(uint(int(_1014)) >> uint(2)));
    int _1018 = int(_1014) & 3;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[int(_1016)][_1018];
    int _1022 = int(_1014) + 1;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    int _1026 = _1022 & 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[int(_1024)][_1026];
    int _1030 = ~_944;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = _964 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1038;
    bool _1042 = !_748;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = 1.0 / _1010;
    bool _1048 = _950 >= 0.0;
    bool _1050 = isnan(_950);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1062 = !_682;
    int _1064 = _1062 ? _1002 : (-1);
    float _1066 = _892 * 2.0;
    int _1068 = _1034;
    if (_1004)
    {
        int _1070 = ~_944;
        int _1072 = _1070 + 1;
        _1068 = _1072;
    }
    int _1074 = _1068;
    bool _1076 = _950 > 0.0;
    float _1078 = 1.0 / _1040;
    bool _1080 = _894 != 3;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1084 = _563 + _1082;
    bool _1086 = !_896;
    int _1088 = _1086 ? 0 : 1;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1092 = _563 + _1090;
    int _1094 = abs(_928);
    int _1096 = _1056 ? 0 : 1;
    float _1098 = floor(_1066);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1110 = _1108 != 0;
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1114 = _563 + _1112;
    int _1116 = abs(_1088);
    int _1118 = ~_1094;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = _1114 * _1046;
    int _1126 = abs(_1074);
    float _1128 = 1.0 / _1060;
    int _1130 = ~_1116;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    float _1136 = _1084 * _1078;
    float _1138 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1140 = log2(_1138);
    bool _1142 = !_1080;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = _1122 * as_type<int>(_994);
    int _1148 = ~_1126;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = abs(_1144);
    int _1156 = _1134 * as_type<int>(_986);
    int _1158 = _1156 + _1146;
    int _1160 = ~_1096;
    int _1162 = _1160 + 1;
    int _1164 = _1162 + 1;
    float _1166 = _1092 * _1128;
    bool _1168 = _1098 >= 0.0;
    bool _1170 = isnan(_1098);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    int _1178 = _1152 * as_type<int>(_1020);
    int _1180 = _1178 + _1158;
    int _1182 = _1164;
    if (!_1076)
    {
        int _1184 = ~_1096;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    int _1190 = abs(_1044);
    float _1192 = _117 * _1140;
    int _1194 = abs(_597);
    float _1196 = _978 * 2.0;
    int _1198 = ~_1154;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = float(uint(_597));
    float _1206 = exp2(_1192);
    int _1208 = _1176 ? 0 : 1;
    int _1210 = _1202 * as_type<int>(_1028);
    int _1212 = _1210 + _1180;
    bool _1214 = _1098 > 0.0;
    float _1216 = _137 + _892;
    int _1218 = ~_1190;
    int _1220 = _1218 + 1;
    int _1222 = _1220 + 1;
    float _1224 = float(uint(_1194));
    float _1226 = 1.0 / _1204;
    float _1228 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    int _1230 = _1212 * _1222;
    float _1232 = _1216 + (-1.0);
    float _1234 = _137 + _978;
    int _1236 = _1064 * _1190;
    int _1238 = _1236 + _1230;
    float _1240 = _1228 * _137;
    float _1242 = 1.0 / _1224;
    float _1244 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1246 = _1234 + (-1.0);
    float _1248 = float(uint(_1238));
    float _1250 = _892 + _978;
    int _1252 = abs(_1238);
    float _1254 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1256 = ~_1208;
    int _1258 = _1256 + 1;
    int _1260 = _1258 + 1;
    float _1262 = floor(_1196);
    int _1264 = as_type<int>(_1226) + (-2);
    float _1266 = -_1206;
    float _1268 = _1266 + 1.0;
    int _1270 = _1260;
    if (!_1214)
    {
        int _1272 = ~_1208;
        int _1274 = _1272 + 1;
        _1270 = _1274;
    }
    int _1276 = _1270;
    float _1278 = _1250 + (-1.0);
    float _1280 = float(uint(_1252));
    float _1282 = as_type<float>(_1264) * _1248;
    float _1284 = trunc(_1240);
    int _1286 = int(_1284);
    int _1288 = as_type<int>(_1242) + (-2);
    float _1290 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1292 = as_type<float>(_1288) * _1280;
    int _1294 = ~_597;
    int _1296 = _1294 + 1;
    float _1298 = trunc(_1282);
    float _1300 = precise::max(_1298, 0.0);
    uint _1302 = uint(_1300);
    bool _1304 = _1262 >= 0.0;
    bool _1306 = isnan(_1262);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1314;
    int _1318 = ~_1194;
    int _1320 = _1318 + 1;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1326 = _1312 ? 0 : 1;
    float _1328 = fma(_1316, _1136, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1330 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1338 = _1334 || _1336;
    float _1340 = trunc(_1292);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    int _1346 = _1286 << 4;
    int _1348 = _1346 + 1712;
    float _1350 = fma(_1324, _1166, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1352 = _1338 ? _1268 : 0.0;
    uint _1354 = uint(int(uint(_1348) >> uint(2)));
    uint _1356 = uint(int(uint(int(_1354)) >> uint(2)));
    int _1358 = int(_1354) & 3;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[int(_1356)][_1358];
    int _1362 = int(_1354) + 1;
    uint _1364 = uint(int(uint(_1362) >> uint(2)));
    int _1366 = _1362 & 3;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[int(_1364)][_1366];
    bool _1370 = _1262 > 0.0;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1372;
    int _1376 = _1296 * int(_1302);
    int _1378 = _1376 + _1238;
    float _1380 = float(_1276);
    float _1382 = fma(_1374, _1136, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _1388 = _1348 + 8;
    uint _1390 = uint(int(uint(_1388) >> uint(2)));
    uint _1392 = uint(int(uint(int(_1390)) >> uint(2)));
    int _1394 = int(_1390) & 3;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[int(_1392)][_1394];
    float _1398 = float(uint(_1378));
    int _1400 = _1320 * int(_1344);
    int _1402 = _1400 + _1252;
    float _1404 = fma(_1386, _1166, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1406 = as_type<float>(_1264) * _1398;
    bool _1408 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1410 = isnan(_563);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = float(uint(_1402));
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1424 = 1.0 + _1422;
    bool _1426 = _597 == 0;
    float _1428 = trunc(_1406);
    float _1430 = precise::max(_1428, 0.0);
    uint _1432 = uint(_1430);
    float _1434 = -_1418;
    float _1436 = _1434 + 1.0;
    float _1438 = as_type<float>(_1288) * _1420;
    bool _1440 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1442 = isnan(_563);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    bool _1452 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1454 = isnan(_563);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    bool _1464 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1466 = isnan(_563);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1450 * _1436;
    float _1478 = 1.0 / _1424;
    float _1480 = -_1450;
    float _1482 = _1480 + 1.0;
    float _1484 = -_1462;
    float _1486 = _1484 + 1.0;
    float _1488 = _1462 * _1482;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1494;
    float _1498 = trunc(_1438);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = ~_597;
    int _1506 = _1504 + 1;
    float _1508 = _1474 * _1486;
    float _1510 = fma(_1492, _1124, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1512 = int(_1302) + int(_1432);
    float _1514 = fma(_1496, _1124, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1516 = _1328 * _1508;
    float _1518 = _1382 * _1508;
    float _1520 = -_1474;
    float _1522 = _1520 + 1.0;
    float _1524 = _1352 * _1478;
    int _1526 = ~_1326;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    int _1532 = _1506 * _1512;
    int _1534 = _1532 + _1238;
    float _1536 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1516);
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1518);
    int _1540 = _1530;
    if (!_1370)
    {
        int _1542 = ~_1326;
        int _1544 = _1542 + 1;
        _1540 = _1544;
    }
    int _1546 = _1540;
    float _1548 = _1360 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1550 = !_1106;
    int _1552 = _1550 ? 0 : 1;
    float _1554 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1556 = !_1110;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = uint(_1534) >= uint(_597);
    int _1562 = int(_1344) + int(_1502);
    int _1564 = abs(_1552);
    float _1566 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1568 = ~_1194;
    int _1570 = _1568 + 1;
    int _1572 = abs(_1558);
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = float(_1188);
    float _1578 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1580 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1582 = float(_1564);
    int _1584 = _1570 * _1562;
    int _1586 = _1584 + _1252;
    float _1588 = float(_1572);
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1592 = !_1560;
    int _1594 = _1592 ? 0 : (-1);
    float _1596 = _1582 * _1576;
    bool _1598 = uint(_1586) >= uint(_1194);
    float _1600 = _1588 * _1380;
    int _1602 = ~_1512;
    int _1604 = _1602 + _1594;
    int _1606 = _1604 + 1;
    out.m_56.x = _1578;
    out.m_56.y = _1580;
    out.m_56.z = _1574;
    out.m_56.w = _1590;
    float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1610 = _137 > 0.5;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1614 = _1006 + _1612;
    int _1616 = _597 * _1606;
    int _1618 = _1616 + _1238;
    float _1620 = in.m_58.x;
    float _1622 = in.m_58.y;
    float _1624 = in.m_58.z;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1628 = _1626 != 0;
    float _1630 = -_187;
    int _1632 = _1610 ? as_type<int>(_1630) : as_type<int>(_187);
    bool _1634 = !_1426;
    int _1636 = _1634 ? _1618 : (-1);
    bool _1638 = !_1598;
    int _1640 = _1638 ? 0 : (-1);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _828 + _1642;
    int _1646 = _1238 ^ _597;
    float _1648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1650 = _597 == 0;
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _1654 = uint(int(uint(_1646) >> uint(31)));
    float _1656 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1658 = _1036 + _1656;
    int _1660 = ~_1640;
    int _1662 = _1562 + _1660;
    int _1664 = _1662 + 1;
    float _1666 = fma(_1614, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1652);
    int _1668 = ~int(_1654);
    int _1670 = _1668 + 1;
    float _1672 = _1608 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1674 = float(_1636);
    float _1676 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1666);
    bool _1678 = !_1628;
    float _1680 = _1678 ? _187 : as_type<float>(_1632);
    float _1682 = -_117;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[76].x, _998);
    int _1686 = _1664 ^ _1670;
    float _1688 = _1596 * (-2.0);
    bool _1690 = _1676 >= 0.0;
    float _1692 = fma(_1672, _1674, _1684);
    float _1694 = _1680 + 0.5;
    float _1696 = _1644 * _1644;
    int _1698 = ~_1670;
    int _1700 = _1698 + _1686;
    int _1702 = _1700 + 1;
    float _1704 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1706 = fma(_1672, _1694, _1692);
    float _1708 = fma(_1614, _1614, _1696);
    bool _1710 = _892 > 0.5;
    float _1712 = fma(_1290, _1688, _1290);
    bool _1714 = !_1650;
    int _1716 = _1714 ? _1702 : (-1);
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1720 = fma(_1658, _1658, _1708);
    float _1722 = fma(_1688, _1622, _1622);
    float _1724 = -_195;
    int _1726 = _1710 ? as_type<int>(_1724) : as_type<int>(_195);
    float _1728 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _954);
    float _1730 = float(_1716);
    float _1732 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1718);
    float _1734 = rsqrt(_1720);
    bool _1736 = !_920;
    float _1738 = _1736 ? _195 : as_type<float>(_1726);
    float _1740 = -_1728;
    float _1742 = fma(_1704, _1730, _1740);
    float _1744 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1748 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1750 = isnan(1.0);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1756 = _1752 || _1754;
    float _1758 = _1738 + (-0.5);
    float _1760 = _1722;
    int _1762 = as_type<int>(_1644);
    if (_1690)
    {
        out.m_45.x = 0.0;
    }
    float _1764 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1746);
    float _1766 = -_1704;
    float _1768 = fma(_1766, _1758, _1742);
    float _1770 = _892 + (-0.5);
    float _1772 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1764);
    bool _1774 = !_1102;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = -_1744;
    float _1780 = _1778 + 1.0;
    float _1782 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1722);
    float _1784 = -_1772;
    float _1786 = _1784 + 1.0;
    int _1788 = abs(_1776);
    float _1790 = _1644 * _1734;
    if (_1690)
    {
        _1760 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1792 = _1760;
    float _1794 = fma(_1738, _1786, _1768);
    float _1796 = float(_1546);
    float _1798 = -_1790;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _1802 = -_1780;
    float _1804 = fma(_1680, _1802, _1706);
    if (_1690)
    {
        float _1806 = _1792 * 5.0;
        _1762 = as_type<int>(_1806);
    }
    int _1808 = _1762;
    float _1810 = float(_1788);
    float _1812 = _1614 * _1734;
    bool _1814 = !_1756;
    float _1816 = _1814 ? _117 : _1524;
    float _1818 = _1800 * _1800;
    float _1820 = -_1812;
    float _1822 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1614);
    float _1824 = _1810 * _1796;
    float _1826 = fma(_1816, _1712, _1782);
    if (_1690)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5484 = as_type<float>(_1808);
        out.gl_Position.z = _5484;
    }
    float _1828 = fma(_1822, _1822, _1818);
    float _1830 = _137 + (-0.5);
    float _1832 = _1824 * (-2.0);
    out.m_60.x = _1804;
    out.m_60.y = _1794;
    float _1834 = _1826 * 0.15915493667125701904296875;
    if (_1690)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1836 = -_1790;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _1840 = _1658 * _1734;
    float _1842 = -_1812;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1846 = fma(_1832, _1620, _1620);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1850 = _1838 + _1848;
    float _1852 = -_1840;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1858 = _1844 + _1856;
    float _1860 = -_1840;
    float _1862 = fma(_1860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1658);
    float _1864 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1868 = _1854 + _1866;
    float _1870 = fma(_1244, _1832, _1244);
    float _1872 = _1600 * (-2.0);
    float _1874 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1864);
    float _1876 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1846);
    float _1878 = fma(_1862, _1862, _1828);
    float _1880 = fma(_1872, _1624, _1624);
    float _1882 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1874);
    float _1884 = in.m_54.x;
    float _1886 = in.m_54.y;
    float _1888 = _978 + (-0.5);
    float _1890 = fma(_1254, _1872, _1254);
    float _1892 = fma(_1404, _1488, _1538);
    bool _1894 = _1882 >= 0.0;
    float _1896 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1880);
    float _1898 = fma(_1350, _1488, _1536);
    float _1900 = fma(_1816, _1870, _1876);
    float _1902 = fma(_1514, _1476, _1892);
    float _1904 = fma(_1816, _1890, _1896);
    float _1906 = fma(_1510, _1476, _1898);
    float _1908 = sqrt(_1878);
    float _1910 = _1900 * 0.15915493667125701904296875;
    float _1912 = _1904 * 0.15915493667125701904296875;
    float _1914 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1902);
    float _1916 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1906);
    float _1918 = _1896;
    float _1920 = _1850;
    if (_1894)
    {
        _1918 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1922 = _1918;
    int _1924 = as_type<int>(_1922);
    if (_1894)
    {
        out.m_45.x = 0.0;
    }
    float _1926 = _1834 * 6.283185482025146484375;
    float _1928 = sin(_1926);
    if (_1894)
    {
        float _1930 = _1922 * 5.0;
        _1924 = as_type<int>(_1930);
    }
    int _1932 = _1924;
    float _1934 = _1914 * _1886;
    float _1936 = _1834 * 6.283185482025146484375;
    float _1938 = cos(_1936);
    if (_1894)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5685 = as_type<float>(_1932);
        out.gl_Position.z = _5685;
    }
    float _1940 = _1734 * _1908;
    float _1942 = _521 * _1934;
    float _1944 = _1910 * 6.283185482025146484375;
    float _1946 = sin(_1944);
    float _1948 = _1910 * 6.283185482025146484375;
    float _1950 = cos(_1948);
    float _1952 = _1912 * 6.283185482025146484375;
    float _1954 = sin(_1952);
    float _1956 = _1946;
    if (_1894)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1958 = _1912 * 6.283185482025146484375;
    float _1960 = cos(_1958);
    float _1962 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1964 = _1916 * _1884;
    float _1966 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1968 = _1950 * _1938;
    float _1970 = _1940 * _1962;
    float _1972 = _521 * _1964;
    float _1974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _1976 = _1950 * _1928;
    float _1978 = _1966 * _1970;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1982 = _1946 * _1928;
    float _1984 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1986 = _1984 * 0.5;
    float _1988 = _1940 * _1980;
    float _1990 = fma(_1954, _1968, _1982);
    float _1992 = _1960 * _1978;
    float _1994 = _1928 * _1960;
    float _1996 = _1938 * _1960;
    float _1998 = _1974 * _1988;
    float _2000 = _1950 * _1992;
    float _2002 = _1946 * _1938;
    float _2004 = -_1978;
    float _2006 = _1954 * _2004;
    float _2008 = fma(_1954, _1982, _1968);
    float _2010 = fma(_1990, _1998, _2000);
    float _2012 = -_2002;
    float _2014 = fma(_1954, _1976, _2012);
    float _2016 = -_1976;
    float _2018 = fma(_1954, _2002, _2016);
    float _2020 = _1946 * _1992;
    float _2022 = fma(_1996, _1998, _2006);
    float _2024 = fma(_2014, _1986, _2010);
    float _2026 = fma(_2018, _1998, _2020);
    float _2028 = fma(_1994, _1986, _2022);
    float _2030 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2032 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2034 = fma(_2008, _1986, _2026);
    float _2036 = _2024 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2040 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2032);
    float _2042 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2036);
    float _2044 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2038);
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2040);
    float _2048 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2042);
    float _2050 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2052 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2054 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2056 = _1036 + _2050;
    float _2058 = _1006 + _2052;
    float _2060 = _828 + _2054;
    float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2064 = _2056 + _2062;
    float _2066 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2068 = _2058 + _2066;
    float _2070 = _2064 * _2064;
    float _2072 = fma(_2068, _2068, _2070);
    float _2074 = sqrt(_2072);
    bool _2076 = _2074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2078 = _2070;
    float _2080 = _2054;
    float _2082 = _2058;
    float _2084 = _2068;
    float _2086 = _1992;
    if (!_2076)
    {
        _2078 = _2058;
    }
    float _2088 = _2078;
    float _2090 = _2088;
    if (!_2076)
    {
        _2080 = _2056;
    }
    float _2092 = _2080;
    float _2094 = _2092;
    if (!_2076)
    {
        _2082 = _2060;
    }
    float _2096 = _2082;
    bool _2098 = !_2076;
    float _2100 = _2096;
    if (!_2098)
    {
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2104 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2106 = _2074 + _2104;
        float _2108 = rsqrt(_2072);
        float _2110 = _2106 * _2102;
        float _2112 = _2060 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = _2110 * 0.15915493667125701904296875;
        float _2116 = _2114 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = _2114 * 6.283185482025146484375;
        float _2122 = cos(_2120);
        float _2124 = fma(_2118, _2112, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2126 = _2108 * _2124;
        float _2128 = _2122 + (-1.0);
        float _2130 = fma(_2068, _2126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2132 = fma(_2064, _2126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2134 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2136 = fma(_2060, _2122, _2134);
        _2100 = _2136;
        _2090 = _2130;
        _2094 = _2132;
    }
    float _2138 = _2100;
    float _2140 = _2090;
    float _2142 = _2094;
    float _2144 = -_828;
    float _2146 = _2144 + _2138;
    float _2148 = -_1006;
    float _2150 = _2148 + _2140;
    float _2152 = -_1036;
    float _2154 = _2152 + _2142;
    float _2156 = _2146 * _2146;
    float _2158 = fma(_2150, _2150, _2156);
    float _2160 = fma(_2154, _2154, _2158);
    float _2162 = sqrt(_2160);
    bool _2164 = _2162 > 0.0;
    float _2166 = _2162;
    float _2168 = _2138;
    float _2170 = _2154;
    if (!_2164)
    {
        _2084 = _2140;
    }
    float _2172 = _2084;
    float _2174 = _2172;
    float _2176 = _2172;
    if (!_2164)
    {
        _2166 = _2142;
    }
    float _2178 = _2166;
    bool _2180 = !_2164;
    float _2182 = _2178;
    float _2184 = _2178;
    float _2186 = _2178;
    if (!_2180)
    {
        bool _2188 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2190 = _2072;
        if (_2188)
        {
            float _2192 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2190 = _2192;
        }
        float _2194 = _2190;
        float _2196 = _2194;
        if (_2188)
        {
            float _2198 = _513 * _2194;
            _2086 = _2198;
        }
        float _2200 = _2086;
        float _2202 = _2200;
        if (_2188)
        {
            float _2204 = _515 * _2194;
            _1956 = _2204;
        }
        float _2206 = _1956;
        float _2208 = _2206;
        if (_2188)
        {
            float _2210 = _517 * _2194;
            _2196 = _2210;
        }
        float _2212 = _2196;
        float _2214 = _2212;
        if (!_2188)
        {
            float _2216 = _117 + 1.0;
            float _2218 = _2216;
            if (!_153)
            {
                float _2220 = _2216 * _2216;
                float _2222 = _2220 * 0.5;
                _2182 = _2222;
            }
            float _2224 = _2182;
            float _2226 = _2224;
            if (!_153)
            {
                float _2228 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2226 = _2228;
            }
            float _2230 = _2226;
            bool _2232 = !_153;
            float _2234 = _2230;
            if (!_2232)
            {
                float _2236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2238 = log2(_2236);
                float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2242 = 1.0 + _2240;
                float _2244 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2246 = _2238 * _2216;
                float _2248 = 1.0 / _2242;
                float _2250 = _2244 * 0.693147182464599609375;
                float _2252 = exp2(_2246);
                float _2254 = 1.0 / _2250;
                float _2256 = _2252 + (-1.0);
                float _2258 = -_2256;
                float _2260 = fma(_2258, _2254, _2216);
                float _2262 = _2260 * _2248;
                float _2264 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2234 = _2264;
            }
            float _2266 = _2234;
            float _2268 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2270 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2272 = _2266 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2274 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2276 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2278 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2280 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2274);
            float _2282 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2276);
            float _2284 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2280);
            bool _2286 = !_153;
            _2184 = _2272;
            if (!_2286)
            {
                float _2288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2290 = log2(_2288);
                float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2294 = 1.0 + _2292;
                float _2296 = 1.0 / _2294;
                float _2298 = _2290 * _2216;
                float _2300 = exp2(_2298);
                float _2302 = -_2300;
                float _2304 = _2302 + 1.0;
                float _2306 = _2304 * _2296;
                _2218 = _2306;
            }
            float _2308 = _2218;
            float _2310 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2278);
            float _2312 = fma(_2308, _161, _2284);
            float _2314 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2282);
            float _2316 = fma(_2272, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2310);
            float _2318 = -_463;
            float _2320 = _2318 + _2312;
            float _2322 = fma(_2308, _159, _2314);
            float _2324 = fma(_2308, _163, _2316);
            float _2326 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2328 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2330 = -_467;
            float _2332 = _2330 + _2322;
            float _2334 = _2320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2336 = -_477;
            float _2338 = _2336 + _2324;
            float _2340 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2326);
            float _2342 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2328);
            float _2344 = fma(_2332, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2334);
            float _2346 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2340);
            float _2348 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2342);
            float _2350 = fma(_2338, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2344);
            _525 = _2348;
            _527 = _2346;
            _529 = _2350;
            _2202 = _2346;
            _2208 = _2348;
            _2214 = _2350;
            _2174 = _2314;
        }
        float _2352 = _525;
        float _2354 = _527;
        float _2356 = _529;
        float _2358 = _2202;
        float _2360 = _2208;
        float _2362 = _2214;
        float _2364 = _2174;
        float _2366 = _2184;
        float _2368 = _2352 * _2352;
        float _2370 = rsqrt(_2160);
        float _2372 = fma(_2354, _2354, _2368);
        float _2374 = fma(_2356, _2356, _2372);
        float _2376 = sqrt(_2374);
        float _2378 = _2146 * _2370;
        float _2380 = _2150 * _2370;
        float _2382 = _2154 * _2370;
        bool _2384 = _2376 > 0.0;
        float _2386 = _2364;
        float _2388 = _2366;
        _531 = _2380;
        if (!_2384)
        {
            _2386 = _2140;
        }
        float _2390 = _2386;
        _2176 = _2390;
        if (!_2384)
        {
            _2388 = _2142;
        }
        float _2392 = _2388;
        bool _2394 = !_2384;
        _2186 = _2392;
        if (!_2394)
        {
            float _2396 = rsqrt(_2374);
            float _2398 = _2396 * _2352;
            float _2400 = _2396 * _2354;
            float _2402 = _2396 * _2356;
            float _2404 = _2378 * _2398;
            float _2406 = fma(_2380, _2400, _2404);
            float _2408 = fma(_2382, _2402, _2406);
            float _2410 = _2408 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2412 = fma(_2358, _2410, _2140);
            float _2414 = fma(_2360, _2410, _2138);
            float _2416 = fma(_2362, _2410, _2142);
            _2176 = _2412;
            _2168 = _2414;
            _2186 = _2416;
        }
    }
    float _2418 = _2176;
    float _2420 = _2168;
    float _2422 = _2186;
    float _2424 = _531;
    bool _2426 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2428 = isnan(0.5);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2434 = _2430 || _2432;
    float _2436 = -_1812;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2418);
    float _2440 = -_1790;
    float _2442 = fma(_2440, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2420);
    float _2444 = -_1840;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2422);
    float _2448 = _2442;
    float _2450 = _2438;
    float _2452 = _2446;
    float _2454 = _2424;
    if (!_2434)
    {
        float _2456 = _1850 * _1850;
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2460 = -_1006;
        float _2462 = _2460 + _2418;
        float _2464 = -_828;
        float _2466 = _2464 + _2420;
        float _2468 = fma(_1858, _1858, _2456);
        float _2470 = -_1036;
        float _2472 = _2470 + _2422;
        float _2474 = fma(_1868, _1868, _2468);
        float _2476 = 1.0 / _1940;
        float _2478 = sqrt(_2474);
        float _2480 = precise::min(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2482 = _2480 * _2458;
        float _2484 = _2482 * _2476;
        float _2486 = fma(_2462, _2484, _1844);
        float _2488 = fma(_2466, _2484, _1838);
        float _2490 = fma(_2472, _2484, _1854);
        _2448 = _2488;
        _2450 = _2486;
        _2452 = _2490;
        _2170 = _2458;
    }
    float _2492 = _2448;
    float _2494 = _2450;
    float _2496 = _2452;
    float _2498 = _2170;
    float _2500 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2502 = _2492 + _2500;
    float _2504 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2506 = _2494 + _2504;
    float _2508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2510 = _2496 + _2508;
    float _2512 = _2502 * _2502;
    float _2514 = fma(_2506, _2506, _2512);
    float _2516 = fma(_2510, _2510, _2514);
    float _2518 = rsqrt(_2516);
    float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2522 = _2506 * _2520;
    float _2524 = _2510 * _2520;
    float _2526 = _2522 * _2522;
    float _2528 = _2524 * _2524;
    float _2530 = _2526 + _2528;
    float _2532 = sqrt(_2530);
    bool _2534 = _2532 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2538 = _2532 + _2536;
    float _2540 = _2518;
    float _2542 = _2498;
    float _2544 = _2538;
    float _2546 = _2520;
    float _2548 = _2526;
    if (_2534)
    {
        float _2550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2540 = _2550;
    }
    float _2552 = _2540;
    if (_2534)
    {
        float _2554 = rsqrt(_2530);
        _2542 = _2554;
    }
    float _2556 = _2542;
    float _2558 = _2556;
    if (_2534)
    {
        float _2560 = _2538 * _2552;
        _2544 = _2560;
    }
    float _2562 = _2544;
    if (_2534)
    {
        float _2564 = _2562 * 0.15915493667125701904296875;
        _1920 = _2564;
    }
    float _2566 = _1920;
    float _2568 = _2150;
    if (_2534)
    {
        float _2570 = _2566 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        _2568 = _2572;
    }
    float _2574 = _2568;
    float _2576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2578 = precise::max(0.0, _2576);
    float _2580 = _2510;
    float _2582 = _2578;
    float _2584 = _2576;
    if (_2534)
    {
        float _2586 = _2566 * 6.283185482025146484375;
        float _2588 = cos(_2586);
        _2580 = _2588;
    }
    float _2590 = _2580;
    float _2592 = -_2520;
    float _2594 = -_2578;
    float _2596 = fma(_2502, _2592, _2594);
    if (_2534)
    {
        float _2598 = _2596 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2582 = _2598;
    }
    float _2600 = _2582;
    float _2602 = sqrt(_2516);
    float _2604 = _2574;
    float _2606 = _2600;
    if (_2534)
    {
        float _2608 = fma(_2574, _2600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2604 = _2608;
    }
    float _2610 = _2604;
    float _2612 = _2610;
    if (!_2534)
    {
        _2606 = _2524;
    }
    float _2614 = _2606;
    float _2616 = _2614;
    if (_2534)
    {
        float _2618 = _2590 + (-1.0);
        _2584 = _2618;
    }
    float _2620 = _2584;
    float _2622 = _2620;
    if (_2534)
    {
        float _2624 = _2556 * _2610;
        _2454 = _2624;
    }
    float _2626 = _2454;
    if (!_2534)
    {
        _2558 = _2522;
    }
    float _2628 = _2558;
    float _2630 = _2628;
    if (_2534)
    {
        float _2632 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2546 = _2632;
    }
    float _2634 = _2546;
    if (_2534)
    {
        float _2636 = _2522 * _2626;
        _2630 = _2636;
    }
    float _2638 = _2630;
    if (!_2534)
    {
        _2612 = _2596;
    }
    float _2640 = _2612;
    float _2642 = _2640;
    if (_2534)
    {
        float _2644 = _2524 * _2626;
        _2616 = _2644;
    }
    float _2646 = _2616;
    if (_2534)
    {
        float _2648 = fma(_2596, _2590, _2634);
        _2642 = _2648;
    }
    float _2650 = _2642;
    if (_2534)
    {
        float _2652 = _2638 * _2638;
        _2548 = _2652;
    }
    float _2654 = _2548;
    if (!_2534)
    {
        _2622 = _2528;
    }
    float _2656 = _2622;
    float _2658 = _2656;
    if (_2534)
    {
        float _2660 = _2646 * _2646;
        _2658 = _2660;
    }
    float _2662 = _2658;
    float _2664 = fma(_2650, _2650, _2654);
    float _2666 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2668 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2670 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2672 = _2664 + _2662;
    float _2674 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2666);
    float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2678 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2676);
    float _2680 = precise::clamp(_2678, 0.0, 1.0);
    float _2682 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2684 = rsqrt(_2672);
    float _2686 = _2492 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2688 = -_2680;
    float _2690 = _2688 + 1.0;
    float _2692 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2682);
    float _2694 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2670);
    float _2696 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2674);
    float _2698 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2686);
    float _2700 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2692);
    float _2702 = abs(_2690);
    float _2704 = log2(_2702);
    float _2706 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2694);
    float _2708 = _2696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2710 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2712 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2698);
    float _2714 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2716 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2720 = _2684 * _2638;
    float _2722 = _2684 * _2650;
    float _2724 = _2684 * _2646;
    float _2726 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2718);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = -_2716;
    float _2732 = fma(_2730, _2668, 1.0);
    float _2734 = _2712 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2736 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2738 = -_2728;
    float _2740 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2738);
    float _2742 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2744 = log2(_2732);
    float _2746 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2748 = -_2724;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2740);
    float _2752 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2754 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2746);
    float _2756 = fma(_2750, -0.5, 0.5);
    float _2758 = fma(_2750, 0.5, 0.5);
    float _2760 = exp2(_2742);
    float _2762 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2736);
    float _2764 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2752);
    float _2766 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2754);
    float _2768 = _2722 + 1.0;
    float _2770 = fma(_2758, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2772 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2764);
    float _2774 = 1.0 / _2762;
    float _2776 = fma(_2758, _2770, -0.212114393711090087890625);
    float _2778 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2772);
    float _2780 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2782 = _2744 * 0.693147182464599609375;
    float _2784 = fma(_2758, _2776, 1.570728778839111328125);
    float _2786 = sqrt(_2756);
    float _2788 = -_2722;
    float _2790 = fma(_2760, _2768, _2788);
    float _2792 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2794 = fma(_2790, 0.5, 0.5);
    float _2796 = _2778 * _2774;
    float _2798 = _2780 * _2774;
    float _2800 = fma(_2796, 0.5, 0.5);
    float _2802 = fma(_2798, -0.5, 0.5);
    float _2804 = _2786 * 0.636619746685028076171875;
    float3 _7070 = float3(_2800, _2802, _2792);
    float _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7070, float3(0.0), isnan(_7070)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7070, float3(0.0), isnan(_7070)), level(0.0)).x;
    float3 _7081 = float3(_2800, _2802, _2792);
    float4 _2809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7081, float3(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7081, float3(0.0), isnan(_7081)), level(0.0)).xyzw;
    float _2811 = _2809.x;
    float _2813 = _2809.y;
    float _2815 = _2809.z;
    float _2817 = _2809.w;
    float _2819 = -_2784;
    float _2821 = fma(_2804, _2819, 1.0);
    float2 _7103 = float2(_2821, _2794);
    float3 _2825 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7103, float2(0.0), isnan(_7103)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7103, float2(0.0), isnan(_7103)), level(0.0)).xyz;
    float _2827 = _2825.x;
    float _2829 = _2825.y;
    float _2831 = _2825.z;
    float _2833 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2835 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2837 = fma(_2714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2835);
    float _2839 = exp2(_2833);
    float _2841 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2837);
    float _2843 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2841);
    float _2845 = _2843 + _2762;
    float _2847 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2778;
    out.gl_Position.y = _2780;
    out.gl_Position.z = _2843;
    out.gl_Position.w = _2762;
    float _2849 = _2845 * 0.5;
    float _2851 = -_2839;
    float _2853 = _2851 + 1.0;
    out.m_45.x = _2847;
    float _2855 = _2853 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2849;
    out.m_62.w = _2762;
    float _2857 = _2855 * _2806;
    float _2859 = -_2855;
    float _2861 = _2859 + 1.0;
    float _2863 = _2817 * _2857;
    float _2865 = _2817 * _2861;
    float _2867 = _2831 * _2857;
    float _2869 = fma(_2827, _2863, _2811);
    float _2871 = fma(_2829, _2863, _2813);
    float _2873 = fma(_2817, _2867, _2815);
    out.m_64.x = _2869;
    out.m_64.y = _2871;
    out.m_64.z = _2873;
    out.m_64.w = _2865;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

