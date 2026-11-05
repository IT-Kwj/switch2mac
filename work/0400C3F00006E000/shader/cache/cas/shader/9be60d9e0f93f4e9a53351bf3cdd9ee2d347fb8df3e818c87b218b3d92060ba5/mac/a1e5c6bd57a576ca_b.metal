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
    float4 m_72 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_78 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_62 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_56 [[attribute(9)]];
    float4 m_54 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_44.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_47.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2300 = as_type<float>(_115);
        out.gl_Position.z = _2300;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_49.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2370 = as_type<float>(_153);
        out.gl_Position.z = _2370;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_54.w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_49.x;
    float _173 = in.m_49.y;
    float _175 = in.m_49.z;
    float _177 = in.m_44.x;
    float _179 = in.m_44.y;
    float _181 = in.m_44.z;
    float _183 = 0.0;
    float _185 = _157;
    if (!_169)
    {
        float _187 = _157 * _157;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_169)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_169;
    float _217 = _197;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_169;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _185 = _271;
    }
    float _273 = _185;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _171, _277);
    float _285 = fma(_273, _173, _279);
    float _287 = fma(_273, _175, _281);
    float _289 = fma(_283, _159, _177);
    float _291 = fma(_285, _159, _179);
    float _293 = fma(_287, _159, _181);
    bool _295 = !_275;
    float _315;
    float _317;
    if (!_295)
    {
        float _297 = in.m_56.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _305 = _303 * _299;
        float _307 = float(_99);
        float _309 = floor(_305);
        float _311 = -_309;
        float _313 = _305 + _311;
        _315 = _307;
        _317 = _313;
        _319 = true;
    }
    else
    {
        float _321 = float(_99);
        float _323 = 1.0 / _321;
        float _325 = _133 * _323;
        _315 = _321;
        _317 = _325;
    }
    _319 = false;
    float _327 = _315;
    float _329 = _317;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.x;
    float _337 = in.m_56.y;
    float _339 = in.m_56.z;
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _343 = int(_341);
    float _345 = 1.0 / _327;
    float _347 = float(_333);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _351 = 1.0 / _347;
    float _353 = float(uint(_343));
    float _355 = _337 * 2.0;
    int _357 = ~_343;
    int _359 = _357 + 1;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _363 = ~_343;
    int _365 = _363 + 1;
    bool _367 = _343 == 0;
    float _369 = 1.0 / _353;
    int _371 = ~_343;
    int _373 = _371 + 1;
    float _375 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].w, _361);
    float _377 = _351 * _133;
    float _379 = floor(_355);
    int _381 = as_type<int>(_369) + (-2);
    float _383 = trunc(_377);
    int _385 = int(_383);
    float _387 = float(_343);
    float _389 = float(uint(_385));
    float _391 = as_type<float>(_381) * _389;
    float _393 = trunc(_391);
    float _395 = precise::max(_393, 0.0);
    uint _398 = uint(_395);
    int _400 = _359 * int(_398);
    int _402 = _400 + _385;
    float _404 = float(uint(_402));
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _408 = _406 != 0;
    float _410 = as_type<float>(_381) * _404;
    float _412 = trunc(_410);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    int _418 = int(_398) + int(_416);
    float _420 = float(_385);
    int _422 = _365 * _418;
    int _424 = _422 + _385;
    bool _426 = _420 >= _387;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(_387);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    bool _438 = !_408;
    float _440 = _438 ? 7.345489978790283203125 : 1.0;
    bool _442 = uint(_424) >= uint(_343);
    float _444 = trunc(_436);
    int _446 = int(_444);
    float _448 = _440 * _335;
    bool _450 = !_442;
    int _452 = _450 ? 0 : (-1);
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _464 = _462 != 0;
    int _466 = ~_418;
    int _468 = _466 + _452;
    int _470 = _468 + 1;
    float _472 = floor(_448);
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _476 = _474 != 0;
    int _478 = _343 * _470;
    int _480 = _478 + _385;
    bool _482 = !_456;
    int _484 = _482 ? 0 : 1;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _488 = _486 != 0;
    int _490 = ~_446;
    int _492 = _490 + 1;
    int _494 = _492 + 1;
    bool _496 = !_367;
    int _498 = _496 ? _480 : (-1);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _502 = _500 != 0;
    bool _504 = _379 > 0.0;
    int _506 = _498 * _494;
    float _508 = -_472;
    float _510 = _448 + _508;
    bool _512 = !_460;
    int _514 = _512 ? 0 : 1;
    float _516 = _510 * _387;
    float _518 = _387 * _133;
    int _520 = _343 + (-1);
    int _522 = abs(_514);
    float _524 = _518 * _345;
    float _526 = trunc(_516);
    int _528 = int(_526);
    int _530 = _446 * _520;
    int _532 = _530 + _506;
    bool _534 = !_476;
    int _536 = _534 ? 0 : 1;
    bool _538 = !_464;
    int _540 = _538 ? 0 : 1;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _544 = _542 != 0;
    float _546 = trunc(_524);
    int _548 = int(_546);
    int _550 = abs(_536);
    int _552 = abs(_484);
    int _554 = abs(_540);
    int _556 = _532 * _522;
    bool _558 = !_544;
    int _560 = _558 ? 0 : 1;
    int _562 = _528 * _550;
    int _564 = _562 + _385;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _568 = _566 != 0;
    float _570 = _335 * 2.0;
    int _572 = abs(_560);
    float _574 = float(uint(_564));
    int _576 = _548 * _552;
    int _578 = _576 + _556;
    float _580 = as_type<float>(_381) * _574;
    int _582 = _564 * _554;
    int _584 = _582 + _578;
    float _586 = in.m_58.x;
    float _588 = in.m_58.y;
    float _590 = in.m_58.z;
    int _592 = _528 * _572;
    int _594 = _592 + _584;
    float _596 = in.m_60.x;
    float _598 = in.m_60.y;
    float _600 = in.m_60.z;
    float _602 = float(uint(_594));
    float _604 = as_type<float>(_381) * _602;
    float _606 = in.m_62.x;
    float _608 = in.m_62.y;
    float _610 = in.m_62.z;
    float _612 = trunc(_604);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    float _618 = floor(_570);
    float _620 = _291 * _588;
    float _622 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _624 = _291 * _598;
    float _626 = fma(_289, _586, _620);
    float _628 = fma(_622, -2.0, _349);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _632 = _329 + _630;
    int _634 = _373 * int(_616);
    int _636 = _634 + _594;
    float _638 = fma(_293, _590, _626);
    float _640 = float(uint(_636));
    float _642 = _291 * _608;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    bool _648 = _618 >= 0.0;
    bool _650 = isnan(_618);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = _638 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = as_type<float>(_381) * _640;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _664 = fma(_289, _606, _642);
    int _666 = ~_343;
    int _668 = _666 + 1;
    float _670 = fma(_289, _596, _624);
    float _672 = -_662;
    float _674 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[77].x, _672);
    float _676 = trunc(_660);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = _656 ? 0 : 1;
    float _684 = _339 * 2.0;
    bool _686 = _379 >= 0.0;
    bool _688 = isnan(_379);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _700 = fma(_293, _610, _664);
    bool _702 = _618 > 0.0;
    float _704 = floor(_684);
    int _706 = _694 ? 0 : 1;
    float _708 = fma(_293, _600, _670);
    float _710 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _712 = ~_706;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = _708 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _720 = _716;
    float _722 = _658;
    if (!_504)
    {
        int _724 = ~_706;
        int _726 = _724 + 1;
        _720 = _726;
    }
    int _728 = _720;
    float _730 = 1.0 / _646;
    int _732 = int(_616) + int(_680);
    int _734 = _668 * _732;
    int _736 = _734 + _594;
    float _738 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _740 = log2(_738);
    int _742 = ~_682;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    bool _748 = uint(_736) >= uint(_343);
    int _750 = _746;
    if (!_702)
    {
        int _752 = ~_682;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _337 + _339;
    bool _760 = !_748;
    int _762 = _760 ? 0 : (-1);
    float _764 = 1.0 / _698;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _776 = _774 != 0;
    float _778 = _632 * _730;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _782 = _329 + _780;
    float _784 = _758 + (-1.0);
    bool _786 = !_768;
    int _788 = _786 ? 0 : 1;
    bool _790 = _704 >= 0.0;
    bool _792 = isnan(_704);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = _337 + _335;
    float _802 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _804;
    int _808 = _798 ? 0 : 1;
    float _810 = _800 + (-1.0);
    bool _812 = _704 > 0.0;
    float _814 = _740 * _133;
    float _816 = _782 * _764;
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _820;
    float _824 = exp2(_814);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _834 = fma(_822, _778, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _836 = fma(_806, _778, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _838 = fma(_828, _816, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _840 = fma(_832, _816, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _842 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _844 = isnan(_329);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = _339 + _335;
    bool _856 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _858 = isnan(_329);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    bool _868 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _870 = isnan(_329);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _854 + (-1.0);
    int _882 = ~_808;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    float _888 = -_824;
    float _890 = _888 + 1.0;
    int _892 = _886;
    if (!_812)
    {
        int _894 = ~_808;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = -_878;
    float _902 = _900 + 1.0;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _906 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _914 = _910 || _912;
    float _916 = _866 * _902;
    float _918 = -_866;
    float _920 = _918 + 1.0;
    float _922 = -_133;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[76].x, _674);
    float _926 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _928 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _930 = trunc(_580);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    float _936 = _852 * _920;
    float _938 = -_852;
    float _940 = _938 + 1.0;
    int _942 = abs(_788);
    float _944 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].z, _904);
    float _946 = _834 * _936;
    float _948 = _836 * _936;
    int _950 = ~_732;
    int _952 = _950 + _762;
    int _954 = _952 + 1;
    float _956 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _944);
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[143].x, _946);
    int _960 = ~_343;
    int _962 = _960 + 1;
    float _964 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[143].y, _948);
    int _966 = _343 * _954;
    int _968 = _966 + _594;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _972 = 1.0 + _970;
    float _974 = fma(_838, _916, _958);
    float _976 = float(_898);
    float _978 = fma(_840, _916, _964);
    bool _980 = !_772;
    int _982 = _980 ? 0 : 1;
    float _984 = 1.0 / _972;
    int _986 = _962 * int(_934);
    int _988 = _986 + _564;
    bool _990 = !_367;
    int _992 = _990 ? _968 : (-1);
    float _994 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[145].x, _974);
    float _996 = _914 ? _890 : 0.0;
    float _998 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _375);
    bool _1000 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1002 = isnan(1.0);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1008 = _1004 || _1006;
    float _1010 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[145].y, _978);
    int _1012 = abs(_982);
    int _1014 = _992 >> 31;
    float _1016 = float(_942);
    float _1018 = float(uint(_988));
    bool _1020 = !_776;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = _1016 * _976;
    int _1026 = _1014 & 3;
    float _1028 = as_type<float>(_381) * _1018;
    float _1030 = in.m_64.x;
    float _1032 = in.m_64.y;
    float _1034 = in.m_64.z;
    float _1036 = float(_728);
    if (_1008)
    {
        float _1038 = _996 * _984;
        _135 = _1038;
    }
    float _1040 = _135;
    int _1042 = abs(_1022);
    float _1044 = trunc(_1028);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = _992 + _1026;
    float _1052 = _1024 * (-2.0);
    int _1054 = _1050 >> 2;
    float _1056 = float(_756);
    int _1058 = _992 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = float(_1012);
    int _1064 = _992 & 3;
    bool _1066 = _1064 != 0;
    int _1068 = _1054 << 4;
    int _1070 = _1068 + 368;
    float _1072 = _1062 * _1056;
    int _1074 = _1060 ? 0 : 1;
    bool _1076 = uint(_1064) > 1u;
    uint _1078 = uint(int(uint(_1070) >> uint(2)));
    uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
    int _1082 = int(_1078) & 3;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[int(_1080)][_1082];
    int _1086 = int(_1078) + 1;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    int _1090 = _1086 & 3;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[int(_1088)][_1090];
    float _1094 = float(_1042);
    int _1096 = int(_934) + int(_1048);
    int _1098 = ~_343;
    int _1100 = _1098 + 1;
    float _1102 = _1094 * _1036;
    float _1104 = fma(_818, _1052, _818);
    float _1106 = _1072 * (-2.0);
    int _1108 = ~_1074;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = _1102 * (-2.0);
    float _1116 = fma(_1052, _1030, _1030);
    int _1118 = _1112;
    if (!_1076)
    {
        int _1120 = ~_1074;
        int _1122 = _1120 + 1;
        _1118 = _1122;
    }
    int _1124 = _1118;
    float _1126 = fma(_802, _1106, _802);
    float _1128 = fma(_928, _1114, _928);
    bool _1130 = uint(_1064) >= 2u;
    int _1132 = _1070 + 8;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[int(_1144)][_1146];
    float _1150 = fma(_1106, _1032, _1032);
    float _1152 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1154 = int(_1152);
    int _1156 = _1130 ? 0 : 1;
    int _1158 = _1100 * _1096;
    int _1160 = _1158 + _564;
    bool _1162 = _335 > 0.5;
    float _1164 = _335 + (-0.5);
    float _1166 = fma(_1114, _1034, _1034);
    float _1168 = _337 + (-0.5);
    bool _1170 = uint(_1160) >= uint(_343);
    float _1172 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1116);
    int _1174 = abs(_1124);
    float _1176 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1150);
    float _1178 = _339 + (-0.5);
    float _1180 = fma(_1104, _1040, _1172);
    bool _1182 = !_1170;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1126, _1040, _1176);
    bool _1188 = _1064 != 3;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1166);
    int _1192 = abs(_1154);
    float _1194 = _1186 * 0.15915493667125701904296875;
    float _1196 = fma(_1128, _1040, _1190);
    int _1198 = ~_1096;
    int _1200 = _1198 + _1184;
    int _1202 = _1200 + 1;
    float _1204 = _1194 * 6.283185482025146484375;
    float _1206 = cos(_1204);
    float _1208 = _1180 * 0.15915493667125701904296875;
    bool _1210 = !_1066;
    int _1212 = _1210 ? 0 : 1;
    int _1214 = _343 * _1202;
    int _1216 = _1214 + _564;
    bool _1218 = _1064 != 3;
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    int _1222 = ~_1156;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1208 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    int _1232 = ~_1174;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    int _1238 = _1226;
    if (_1188)
    {
        int _1240 = ~_1156;
        int _1242 = _1240 + 1;
        _1238 = _1242;
    }
    int _1244 = _1238;
    bool _1246 = !_1218;
    int _1248 = _1246 ? 0 : (-1);
    int _1250 = _1236 * as_type<int>(_1092);
    int _1252 = abs(_1212);
    float _1254 = in.m_54.x;
    float _1256 = in.m_54.y;
    int _1258 = abs(_1244);
    float _1260 = _1208 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    int _1264 = abs(_1248);
    int _1266 = ~_1252;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    bool _1272 = !_488;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _1270 * as_type<int>(_1084);
    int _1278 = _1276 + _1250;
    int _1280 = abs(_1274);
    float _1282 = _1194 * 6.283185482025146484375;
    float _1284 = sin(_1282);
    int _1286 = ~_1258;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = float(uint(_1154));
    int _1294 = _1290 * as_type<int>(_1140);
    int _1296 = _1294 + _1278;
    int _1298 = ~_1264;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = _1196 * 0.15915493667125701904296875;
    float _1306 = 1.0 / _1292;
    float _1308 = float(uint(_1192));
    float _1310 = _994 * _1254;
    int _1312 = ~_1280;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = _1302 * as_type<int>(_1148);
    int _1320 = _1318 + _1296;
    bool _1322 = !_367;
    int _1324 = _1322 ? _1216 : (-1);
    float _1326 = _1010 * _1256;
    float _1328 = _1230 * _1206;
    int _1330 = _1320 * _1316;
    float _1332 = 1.0 / _1308;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1336 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1338 = _1324 * _1280;
    int _1340 = _1338 + _1330;
    float _1342 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1344 = ~_1192;
    int _1346 = _1344 + 1;
    float _1348 = _1336 * _1220;
    int _1350 = as_type<int>(_1306) + (-2);
    float _1352 = _1342 * _1334;
    int _1354 = abs(_1340);
    float _1356 = _1304 * 6.283185482025146484375;
    float _1358 = sin(_1356);
    float _1360 = float(uint(_1340));
    float _1362 = _1262 * _1284;
    bool _1364 = _337 > 0.5;
    float _1366 = as_type<float>(_1350) * _1360;
    int _1368 = as_type<int>(_1332) + (-2);
    float _1370 = _1304 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = float(uint(_1354));
    float _1376 = as_type<float>(_1368) * _1374;
    int _1378 = ~_1154;
    int _1380 = _1378 + 1;
    float _1382 = trunc(_1366);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    float _1388 = -_1362;
    float _1390 = fma(_1358, _1328, _1388);
    float _1392 = -_1328;
    float _1394 = fma(_1358, _1362, _1392);
    float _1396 = _1230 * _1284;
    float _1398 = trunc(_1376);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    float _1404 = _1284 * _1372;
    float _1406 = _1262 * _1206;
    float _1408 = _1206 * _1372;
    float _1410 = _1372 * _1348;
    float _1412 = -_1348;
    float _1414 = _1358 * _1412;
    float _1416 = fma(_1358, _1406, _1396);
    float _1418 = fma(_1358, _1396, _1406);
    int _1420 = _1380 * int(_1386);
    int _1422 = _1420 + _1340;
    float _1424 = _1262 * _1410;
    float _1426 = fma(_1408, _1352, _1414);
    float _1428 = float(uint(_1422));
    float _1430 = fma(_1416, _1352, _1424);
    float _1432 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1434 = _1346 * int(_1402);
    int _1436 = _1434 + _1354;
    float _1438 = as_type<float>(_1350) * _1428;
    float _1440 = _1230 * _1410;
    float _1442 = fma(_1394, _1432, _1430);
    float _1444 = float(uint(_1436));
    float _1446 = fma(_1390, _1352, _1440);
    float _1448 = fma(_1404, _1432, _1426);
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1452 = as_type<float>(_1368) * _1444;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1456 = trunc(_1438);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    float _1462 = fma(_1418, _1432, _1446);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1450);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1454);
    float _1468 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1464);
    float _1470 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1472 = trunc(_1452);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1482 = _710 + _1478;
    float _1484 = _718 + _1480;
    int _1486 = int(_1386) + int(_1460);
    int _1488 = ~_1154;
    int _1490 = _1488 + 1;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1494 = _1482 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1484 + _1496;
    int _1500 = ~_1192;
    int _1502 = _1500 + 1;
    float _1504 = -_209;
    int _1506 = _1162 ? as_type<int>(_1504) : as_type<int>(_209);
    int _1508 = _1490 * _1486;
    int _1510 = _1508 + _1340;
    int _1512 = int(_1402) + int(_1476);
    float _1514 = _1494 * _1494;
    float _1516 = _1498 * _1498;
    bool _1518 = !_502;
    float _1520 = _1518 ? _209 : as_type<float>(_1506);
    int _1522 = _1502 * _1512;
    int _1524 = _1522 + _1354;
    float _1526 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1528 = _1514 + _1516;
    bool _1530 = uint(_1510) >= uint(_1154);
    float _1532 = in.m_66.w;
    float _1534 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1526);
    float _1536 = sqrt(_1528);
    float _1538 = -_213;
    int _1540 = _1364 ? as_type<int>(_1538) : as_type<int>(_213);
    bool _1542 = !_1530;
    int _1544 = _1542 ? 0 : (-1);
    float _1546 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1534);
    bool _1548 = uint(_1524) >= uint(_1192);
    int _1550 = ~_1486;
    int _1552 = _1550 + _1544;
    int _1554 = _1552 + 1;
    float _1556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1558 = !_1548;
    int _1560 = _1558 ? 0 : (-1);
    float _1562 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1564 = _1340 ^ _1154;
    bool _1566 = !_568;
    float _1568 = _1566 ? _213 : as_type<float>(_1540);
    float _1570 = _658 + _1562;
    int _1572 = ~_1560;
    int _1574 = _1512 + _1572;
    int _1576 = _1574 + 1;
    uint _1578 = uint(int(uint(_1564) >> uint(31)));
    float _1580 = in.m_68.x;
    float _1582 = in.m_68.y;
    float _1584 = in.m_68.z;
    bool _1586 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1588 = _1154 == 0;
    bool _1590 = _1154 == 0;
    int _1592 = _1154 * _1554;
    int _1594 = _1592 + _1340;
    int _1596 = ~int(_1578);
    int _1598 = _1596 + 1;
    float _1600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1602 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1604 = !_1588;
    float _1606 = _1604 ? as_type<float>(_1594) : as_type<float>(0xffffffffu /* nan */);
    int _1608 = _1576 ^ _1598;
    float _1610 = as_type<float>(_1340);
    float _1612 = _1606;
    float _1614 = _1514;
    float _1616 = _1482;
    if (!_1586)
    {
        _722 = _1484;
    }
    float _1618 = _722;
    float _1620 = float(as_type<int>(_1606));
    int _1622 = ~_1598;
    int _1624 = _1622 + _1608;
    int _1626 = _1624 + 1;
    float _1628 = _1618;
    if (!_1586)
    {
        _1610 = _1516;
    }
    float _1630 = _1610;
    float _1632 = _1630;
    if (!_1586)
    {
        _1612 = _1570;
    }
    float _1634 = _1612;
    bool _1636 = !_1586;
    float _1638 = _1634;
    if (!_1636)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1644 = _1536 + _1642;
        float _1646 = rsqrt(_1528);
        float _1648 = _1644 * _1640;
        float _1650 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = _1648 * 0.15915493667125701904296875;
        float _1654 = _1652 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1652 * 6.283185482025146484375;
        float _1660 = cos(_1658);
        float _1662 = fma(_1656, _1650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1664 = _1646 * _1662;
        float _1666 = _1660 + (-1.0);
        float _1668 = fma(_1494, _1664, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1670 = fma(_1498, _1664, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1672 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1676 = _1668 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1680 = _1670 + _1678;
        float _1682 = fma(_1570, _1660, _1672);
        float _1684 = _1676 * _1676;
        float _1686 = _1680 * _1680;
        _1638 = _1682;
        _1614 = _1684;
        _1632 = _1686;
        _1616 = _1668;
        _1628 = _1670;
    }
    float _1688 = _1638;
    float _1690 = _1614;
    float _1692 = _1632;
    float _1694 = _1616;
    float _1696 = _1628;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1700 = _1688 + _1698;
    bool _1702 = !_1590;
    int _1704 = _1702 ? _1626 : (-1);
    float _1706 = fma(_1602, _1620, _924);
    float _1708 = _1520 + 0.5;
    float _1710 = fma(_1700, _1700, _1690);
    float _1712 = float(_1704);
    float _1714 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1716 = fma(_1602, _1708, _1706);
    float _1718 = _1710 + _1692;
    float _1720 = -_956;
    float _1722 = _1720 + 1.0;
    float _1724 = -_926;
    float _1726 = fma(_1714, _1712, _1724);
    float _1728 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1730 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1732 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1734 = _1568 + (-0.5);
    float _1736 = sqrt(_1718);
    float _1738 = -_1722;
    float _1740 = fma(_1520, _1738, _1716);
    float _1742 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1744 = -_1714;
    float _1746 = fma(_1744, _1734, _1726);
    float _1748 = _1728 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1750 = _1730 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1754 = -_998;
    float _1756 = _1754 + 1.0;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1760 = _1742 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1762 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1766 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1768 = fma(_1568, _1756, _1746);
    out.m_70.w = _1760;
    bool _1770 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1772 = isnan(_1736);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1778 = _1774 || _1776;
    out.m_72.x = _1762;
    out.m_72.y = _1764;
    out.m_72.z = _1766;
    out.m_72.w = _1758;
    out.m_74.x = _1740;
    out.m_74.y = _1768;
    float _1780 = _1748;
    float _1782 = _1758;
    if (!_1778)
    {
        _1780 = 1.0;
    }
    float _1784 = _1780;
    bool _1786 = !_1778;
    float _1788 = _1784;
    if (!_1786)
    {
        bool _1790 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1792 = isnan(_1736);
        bool _1794 = _1790 || _1792;
        bool _1796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1798 = _1794 || _1796;
        if (!_1798)
        {
            float _1800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1802 = _1736 + _1800;
            float _1804 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1806 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1804;
            float _1808 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1812 = 1.0 / _1806;
            float _1814 = _1802 * _1812;
            float _1816 = fma(_1814, _1810, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1788 = _1816;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1822 = isnan(_1736);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                float _1830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1832 = _1736 + _1830;
                float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1836 = _1834 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1840 = _1838 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1842 = 1.0 / _1836;
                float _1844 = _1832 * _1842;
                float _1846 = fma(_1844, _1840, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1788 = _1846;
                _1818 = true;
            }
            else
            {
                _1788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1818 = false;
    float _1848 = _1788;
    float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1852 = _1688 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1856 = _1694 + _1854;
    float _1858 = fma(_1852, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1860 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1862 = _1696 + _1860;
    float _1864 = fma(_1856, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1868 = _1858 + _1866;
    float _1870 = fma(_1862, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1874 = _1864 + _1872;
    float _1876 = _1868 * _1868;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1880 = _1870 + _1878;
    float _1882 = fma(_1874, _1874, _1876);
    float _1884 = fma(_1880, _1880, _1882);
    float _1886 = rsqrt(_1884);
    float _1888 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1874 * _1888;
    float _1892 = _1880 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1886;
    float _1910 = _1906;
    float _1912 = _1868;
    float _1914 = _1888;
    float _1916 = _1890;
    if (_1902)
    {
        float _1918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1918;
    }
    float _1920 = _1908;
    float _1922 = _1920;
    if (_1902)
    {
        float _1924 = _1906 * _1920;
        _1910 = _1924;
    }
    float _1926 = _1910;
    if (_1902)
    {
        float _1928 = rsqrt(_1898);
        _1922 = _1928;
    }
    float _1930 = _1922;
    float _1932 = _1930;
    if (_1902)
    {
        float _1934 = _1926 * 0.15915493667125701904296875;
        _1782 = _1934;
    }
    float _1936 = _1782;
    float _1938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1940 = _1880;
    if (_1902)
    {
        float _1942 = _1936 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = precise::max(0.0, _1938);
    float _1950 = _1766;
    float _1952 = _1948;
    if (_1902)
    {
        float _1954 = _1936 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = -_1888;
    float _1962 = -_1948;
    float _1964 = fma(_1868, _1960, _1962);
    if (_1902)
    {
        float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1966;
    }
    float _1968 = _1912;
    float _1970 = sqrt(_1884);
    float _1972 = _1946;
    float _1974 = _1968;
    if (_1902)
    {
        float _1976 = fma(_1946, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = _1978;
    if (_1902)
    {
        float _1982 = _1930 * _1978;
        _1914 = _1982;
    }
    float _1984 = _1914;
    if (!_1902)
    {
        _1932 = _1964;
    }
    float _1986 = _1932;
    float _1988 = _1986;
    if (_1902)
    {
        float _1990 = _1958 + (-1.0);
        _1952 = _1990;
    }
    float _1992 = _1952;
    float _1994 = _1992;
    if (_1902)
    {
        float _1996 = _1890 * _1984;
        _1916 = _1996;
    }
    float _1998 = _1916;
    if (!_1902)
    {
        _1980 = _1892;
    }
    float _2000 = _1980;
    float _2002 = _2000;
    if (_1902)
    {
        float _2004 = _1892 * _1984;
        _2002 = _2004;
    }
    float _2006 = _2002;
    if (_1902)
    {
        float _2008 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1974 = _2008;
    }
    float _2010 = _1974;
    float _2012 = _2010;
    if (!_1902)
    {
        _1994 = _1894;
    }
    float _2014 = _1994;
    float _2016 = _2014;
    if (_1902)
    {
        float _2018 = _1998 * _1998;
        _2016 = _2018;
    }
    float _2020 = _2016;
    if (_1902)
    {
        float _2022 = fma(_1964, _1958, _2010);
        _1988 = _2022;
    }
    float _2024 = _1988;
    if (!_1902)
    {
        _2012 = _1896;
    }
    float _2026 = _2012;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2006 * _2006;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2024, _2024, _2020);
    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2038 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2036);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = _2034 + _2032;
    float _2044 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = -_2040;
    float _2048 = _2046 + 1.0;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2052 = rsqrt(_2042);
    float _2054 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2056 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2058 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2054);
    float _2060 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2062 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2056);
    float _2064 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2066 = abs(_2048);
    float _2068 = log2(_2066);
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2060);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2062);
    float _2074 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2064);
    float _2076 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2078 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2084 = _2052 * _1998;
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2090 = _2052 * _2024;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2094 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2096 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2088);
    float _2098 = _2052 * _2006;
    float _2100 = -_2092;
    float _2102 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2100);
    float _2104 = -_2094;
    float _2106 = fma(_2104, _2050, 1.0);
    float _2108 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2110 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2112 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = -_2098;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2102);
    float _2118 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2120 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2122 = log2(_2106);
    float _2124 = fma(_2116, -0.5, 0.5);
    float _2126 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2118);
    float _2130 = fma(_2116, 0.5, 0.5);
    float _2132 = _2090 + 1.0;
    float _2134 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2136 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2138 = exp2(_2112);
    float _2140 = fma(_2130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2142 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2134);
    float _2144 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2136);
    float _2146 = fma(_2130, _2140, -0.212114393711090087890625);
    float _2148 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2150 = 1.0 / _2120;
    float _2152 = _2122 * 0.693147182464599609375;
    float _2154 = fma(_2130, _2146, 1.570728778839111328125);
    float _2156 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2158 = sqrt(_2124);
    float _2160 = -_2090;
    float _2162 = fma(_2138, _2132, _2160);
    float _2164 = fma(_2162, 0.5, 0.5);
    float _2166 = _2144 * _2150;
    float _2168 = _2148 * _2150;
    float _2170 = fma(_2166, 0.5, 0.5);
    float _2172 = fma(_2168, -0.5, 0.5);
    float _2174 = _2158 * 0.636619746685028076171875;
    float3 _5391 = float3(_2170, _2172, _2156);
    float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5391, float3(0.0), isnan(_5391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5391, float3(0.0), isnan(_5391)), level(0.0)).x;
    float3 _5402 = float3(_2170, _2172, _2156);
    float4 _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5402, float3(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5402, float3(0.0), isnan(_5402)), level(0.0)).xyzw;
    float _2181 = _2179.x;
    float _2183 = _2179.y;
    float _2185 = _2179.z;
    float _2187 = _2179.w;
    float _2189 = -_2154;
    float _2191 = fma(_2174, _2189, 1.0);
    float2 _5424 = float2(_2191, _2164);
    float3 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5424, float2(0.0), isnan(_5424)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5424, float2(0.0), isnan(_5424)), level(0.0)).xyz;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2205 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2207 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2205);
    float _2209 = exp2(_2203);
    float _2211 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2207);
    float _2213 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2211);
    float _2215 = _2213 + _2120;
    out.gl_Position.x = _2144;
    out.gl_Position.y = _2148;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _2120;
    float _2217 = _2215 * 0.5;
    float _2219 = -_2209;
    float _2221 = _2219 + 1.0;
    float _2223 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.z = _2217;
    out.m_76.w = _2120;
    out.m_78.w = _2223;
    float _2227 = _2225 * _2176;
    float _2229 = -_2225;
    float _2231 = _2229 + 1.0;
    float _2233 = _2187 * _2227;
    float _2235 = _2201 * _2227;
    float _2237 = fma(_2197, _2233, _2181);
    float _2239 = fma(_2199, _2233, _2183);
    float _2241 = _2187 * _2231;
    float _2243 = fma(_2187, _2235, _2185);
    out.m_80.x = _2237;
    out.m_80.y = _2239;
    out.m_80.z = _2243;
    out.m_80.w = _2241;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_44.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_47.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2300 = as_type<float>(_115);
        out.gl_Position.z = _2300;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_49.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2370 = as_type<float>(_153);
        out.gl_Position.z = _2370;
    }
    if (_145)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_54.w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_49.x;
    float _173 = in.m_49.y;
    float _175 = in.m_49.z;
    float _177 = in.m_44.x;
    float _179 = in.m_44.y;
    float _181 = in.m_44.z;
    float _183 = 0.0;
    float _185 = _157;
    if (!_169)
    {
        float _187 = _157 * _157;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_169)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_169;
    float _217 = _197;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_169;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _185 = _271;
    }
    float _273 = _185;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _171, _277);
    float _285 = fma(_273, _173, _279);
    float _287 = fma(_273, _175, _281);
    float _289 = fma(_283, _159, _177);
    float _291 = fma(_285, _159, _179);
    float _293 = fma(_287, _159, _181);
    bool _295 = !_275;
    float _315;
    float _317;
    if (!_295)
    {
        float _297 = in.m_56.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _305 = _303 * _299;
        float _307 = float(_99);
        float _309 = floor(_305);
        float _311 = -_309;
        float _313 = _305 + _311;
        _315 = _307;
        _317 = _313;
        _319 = true;
    }
    else
    {
        float _321 = float(_99);
        float _323 = 1.0 / _321;
        float _325 = _133 * _323;
        _315 = _321;
        _317 = _325;
    }
    _319 = false;
    float _327 = _315;
    float _329 = _317;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.x;
    float _337 = in.m_56.y;
    float _339 = in.m_56.z;
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _343 = int(_341);
    float _345 = 1.0 / _327;
    float _347 = float(_333);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _351 = 1.0 / _347;
    float _353 = float(uint(_343));
    float _355 = _337 * 2.0;
    int _357 = ~_343;
    int _359 = _357 + 1;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _363 = ~_343;
    int _365 = _363 + 1;
    bool _367 = _343 == 0;
    float _369 = 1.0 / _353;
    int _371 = ~_343;
    int _373 = _371 + 1;
    float _375 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].w, _361);
    float _377 = _351 * _133;
    float _379 = floor(_355);
    int _381 = as_type<int>(_369) + (-2);
    float _383 = trunc(_377);
    int _385 = int(_383);
    float _387 = float(_343);
    float _389 = float(uint(_385));
    float _391 = as_type<float>(_381) * _389;
    float _393 = trunc(_391);
    float _395 = precise::max(_393, 0.0);
    uint _398 = uint(_395);
    int _400 = _359 * int(_398);
    int _402 = _400 + _385;
    float _404 = float(uint(_402));
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _408 = _406 != 0;
    float _410 = as_type<float>(_381) * _404;
    float _412 = trunc(_410);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    int _418 = int(_398) + int(_416);
    float _420 = float(_385);
    int _422 = _365 * _418;
    int _424 = _422 + _385;
    bool _426 = _420 >= _387;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(_387);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    bool _438 = !_408;
    float _440 = _438 ? 7.345489978790283203125 : 1.0;
    bool _442 = uint(_424) >= uint(_343);
    float _444 = trunc(_436);
    int _446 = int(_444);
    float _448 = _440 * _335;
    bool _450 = !_442;
    int _452 = _450 ? 0 : (-1);
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _464 = _462 != 0;
    int _466 = ~_418;
    int _468 = _466 + _452;
    int _470 = _468 + 1;
    float _472 = floor(_448);
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _476 = _474 != 0;
    int _478 = _343 * _470;
    int _480 = _478 + _385;
    bool _482 = !_456;
    int _484 = _482 ? 0 : 1;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _488 = _486 != 0;
    int _490 = ~_446;
    int _492 = _490 + 1;
    int _494 = _492 + 1;
    bool _496 = !_367;
    int _498 = _496 ? _480 : (-1);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _502 = _500 != 0;
    bool _504 = _379 > 0.0;
    int _506 = _498 * _494;
    float _508 = -_472;
    float _510 = _448 + _508;
    bool _512 = !_460;
    int _514 = _512 ? 0 : 1;
    float _516 = _510 * _387;
    float _518 = _387 * _133;
    int _520 = _343 + (-1);
    int _522 = abs(_514);
    float _524 = _518 * _345;
    float _526 = trunc(_516);
    int _528 = int(_526);
    int _530 = _446 * _520;
    int _532 = _530 + _506;
    bool _534 = !_476;
    int _536 = _534 ? 0 : 1;
    bool _538 = !_464;
    int _540 = _538 ? 0 : 1;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _544 = _542 != 0;
    float _546 = trunc(_524);
    int _548 = int(_546);
    int _550 = abs(_536);
    int _552 = abs(_484);
    int _554 = abs(_540);
    int _556 = _532 * _522;
    bool _558 = !_544;
    int _560 = _558 ? 0 : 1;
    int _562 = _528 * _550;
    int _564 = _562 + _385;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _568 = _566 != 0;
    float _570 = _335 * 2.0;
    int _572 = abs(_560);
    float _574 = float(uint(_564));
    int _576 = _548 * _552;
    int _578 = _576 + _556;
    float _580 = as_type<float>(_381) * _574;
    int _582 = _564 * _554;
    int _584 = _582 + _578;
    float _586 = in.m_58.x;
    float _588 = in.m_58.y;
    float _590 = in.m_58.z;
    int _592 = _528 * _572;
    int _594 = _592 + _584;
    float _596 = in.m_60.x;
    float _598 = in.m_60.y;
    float _600 = in.m_60.z;
    float _602 = float(uint(_594));
    float _604 = as_type<float>(_381) * _602;
    float _606 = in.m_62.x;
    float _608 = in.m_62.y;
    float _610 = in.m_62.z;
    float _612 = trunc(_604);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    float _618 = floor(_570);
    float _620 = _291 * _588;
    float _622 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _624 = _291 * _598;
    float _626 = fma(_289, _586, _620);
    float _628 = fma(_622, -2.0, _349);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _632 = _329 + _630;
    int _634 = _373 * int(_616);
    int _636 = _634 + _594;
    float _638 = fma(_293, _590, _626);
    float _640 = float(uint(_636));
    float _642 = _291 * _608;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    bool _648 = _618 >= 0.0;
    bool _650 = isnan(_618);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = _638 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = as_type<float>(_381) * _640;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _664 = fma(_289, _606, _642);
    int _666 = ~_343;
    int _668 = _666 + 1;
    float _670 = fma(_289, _596, _624);
    float _672 = -_662;
    float _674 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[77].x, _672);
    float _676 = trunc(_660);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = _656 ? 0 : 1;
    float _684 = _339 * 2.0;
    bool _686 = _379 >= 0.0;
    bool _688 = isnan(_379);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _700 = fma(_293, _610, _664);
    bool _702 = _618 > 0.0;
    float _704 = floor(_684);
    int _706 = _694 ? 0 : 1;
    float _708 = fma(_293, _600, _670);
    float _710 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _712 = ~_706;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = _708 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _720 = _716;
    float _722 = _658;
    if (!_504)
    {
        int _724 = ~_706;
        int _726 = _724 + 1;
        _720 = _726;
    }
    int _728 = _720;
    float _730 = 1.0 / _646;
    int _732 = int(_616) + int(_680);
    int _734 = _668 * _732;
    int _736 = _734 + _594;
    float _738 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _740 = log2(_738);
    int _742 = ~_682;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    bool _748 = uint(_736) >= uint(_343);
    int _750 = _746;
    if (!_702)
    {
        int _752 = ~_682;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _337 + _339;
    bool _760 = !_748;
    int _762 = _760 ? 0 : (-1);
    float _764 = 1.0 / _698;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _776 = _774 != 0;
    float _778 = _632 * _730;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _782 = _329 + _780;
    float _784 = _758 + (-1.0);
    bool _786 = !_768;
    int _788 = _786 ? 0 : 1;
    bool _790 = _704 >= 0.0;
    bool _792 = isnan(_704);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = _337 + _335;
    float _802 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _804;
    int _808 = _798 ? 0 : 1;
    float _810 = _800 + (-1.0);
    bool _812 = _704 > 0.0;
    float _814 = _740 * _133;
    float _816 = _782 * _764;
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _820;
    float _824 = exp2(_814);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _834 = fma(_822, _778, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _836 = fma(_806, _778, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _838 = fma(_828, _816, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _840 = fma(_832, _816, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _842 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _844 = isnan(_329);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = _339 + _335;
    bool _856 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _858 = isnan(_329);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    bool _868 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _870 = isnan(_329);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _854 + (-1.0);
    int _882 = ~_808;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    float _888 = -_824;
    float _890 = _888 + 1.0;
    int _892 = _886;
    if (!_812)
    {
        int _894 = ~_808;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = -_878;
    float _902 = _900 + 1.0;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _906 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _914 = _910 || _912;
    float _916 = _866 * _902;
    float _918 = -_866;
    float _920 = _918 + 1.0;
    float _922 = -_133;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[76].x, _674);
    float _926 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _928 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _930 = trunc(_580);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    float _936 = _852 * _920;
    float _938 = -_852;
    float _940 = _938 + 1.0;
    int _942 = abs(_788);
    float _944 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].z, _904);
    float _946 = _834 * _936;
    float _948 = _836 * _936;
    int _950 = ~_732;
    int _952 = _950 + _762;
    int _954 = _952 + 1;
    float _956 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _944);
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[143].x, _946);
    int _960 = ~_343;
    int _962 = _960 + 1;
    float _964 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[143].y, _948);
    int _966 = _343 * _954;
    int _968 = _966 + _594;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _972 = 1.0 + _970;
    float _974 = fma(_838, _916, _958);
    float _976 = float(_898);
    float _978 = fma(_840, _916, _964);
    bool _980 = !_772;
    int _982 = _980 ? 0 : 1;
    float _984 = 1.0 / _972;
    int _986 = _962 * int(_934);
    int _988 = _986 + _564;
    bool _990 = !_367;
    int _992 = _990 ? _968 : (-1);
    float _994 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[145].x, _974);
    float _996 = _914 ? _890 : 0.0;
    float _998 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _375);
    bool _1000 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1002 = isnan(1.0);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1008 = _1004 || _1006;
    float _1010 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[145].y, _978);
    int _1012 = abs(_982);
    int _1014 = _992 >> 31;
    float _1016 = float(_942);
    float _1018 = float(uint(_988));
    bool _1020 = !_776;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = _1016 * _976;
    int _1026 = _1014 & 3;
    float _1028 = as_type<float>(_381) * _1018;
    float _1030 = in.m_64.x;
    float _1032 = in.m_64.y;
    float _1034 = in.m_64.z;
    float _1036 = float(_728);
    if (_1008)
    {
        float _1038 = _996 * _984;
        _135 = _1038;
    }
    float _1040 = _135;
    int _1042 = abs(_1022);
    float _1044 = trunc(_1028);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = _992 + _1026;
    float _1052 = _1024 * (-2.0);
    int _1054 = _1050 >> 2;
    float _1056 = float(_756);
    int _1058 = _992 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = float(_1012);
    int _1064 = _992 & 3;
    bool _1066 = _1064 != 0;
    int _1068 = _1054 << 4;
    int _1070 = _1068 + 368;
    float _1072 = _1062 * _1056;
    int _1074 = _1060 ? 0 : 1;
    bool _1076 = uint(_1064) > 1u;
    uint _1078 = uint(int(uint(_1070) >> uint(2)));
    uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
    int _1082 = int(_1078) & 3;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[int(_1080)][_1082];
    int _1086 = int(_1078) + 1;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    int _1090 = _1086 & 3;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[int(_1088)][_1090];
    float _1094 = float(_1042);
    int _1096 = int(_934) + int(_1048);
    int _1098 = ~_343;
    int _1100 = _1098 + 1;
    float _1102 = _1094 * _1036;
    float _1104 = fma(_818, _1052, _818);
    float _1106 = _1072 * (-2.0);
    int _1108 = ~_1074;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = _1102 * (-2.0);
    float _1116 = fma(_1052, _1030, _1030);
    int _1118 = _1112;
    if (!_1076)
    {
        int _1120 = ~_1074;
        int _1122 = _1120 + 1;
        _1118 = _1122;
    }
    int _1124 = _1118;
    float _1126 = fma(_802, _1106, _802);
    float _1128 = fma(_928, _1114, _928);
    bool _1130 = uint(_1064) >= 2u;
    int _1132 = _1070 + 8;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[int(_1144)][_1146];
    float _1150 = fma(_1106, _1032, _1032);
    float _1152 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1154 = int(_1152);
    int _1156 = _1130 ? 0 : 1;
    int _1158 = _1100 * _1096;
    int _1160 = _1158 + _564;
    bool _1162 = _335 > 0.5;
    float _1164 = _335 + (-0.5);
    float _1166 = fma(_1114, _1034, _1034);
    float _1168 = _337 + (-0.5);
    bool _1170 = uint(_1160) >= uint(_343);
    float _1172 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1116);
    int _1174 = abs(_1124);
    float _1176 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1150);
    float _1178 = _339 + (-0.5);
    float _1180 = fma(_1104, _1040, _1172);
    bool _1182 = !_1170;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1126, _1040, _1176);
    bool _1188 = _1064 != 3;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1166);
    int _1192 = abs(_1154);
    float _1194 = _1186 * 0.15915493667125701904296875;
    float _1196 = fma(_1128, _1040, _1190);
    int _1198 = ~_1096;
    int _1200 = _1198 + _1184;
    int _1202 = _1200 + 1;
    float _1204 = _1194 * 6.283185482025146484375;
    float _1206 = cos(_1204);
    float _1208 = _1180 * 0.15915493667125701904296875;
    bool _1210 = !_1066;
    int _1212 = _1210 ? 0 : 1;
    int _1214 = _343 * _1202;
    int _1216 = _1214 + _564;
    bool _1218 = _1064 != 3;
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    int _1222 = ~_1156;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1208 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    int _1232 = ~_1174;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    int _1238 = _1226;
    if (_1188)
    {
        int _1240 = ~_1156;
        int _1242 = _1240 + 1;
        _1238 = _1242;
    }
    int _1244 = _1238;
    bool _1246 = !_1218;
    int _1248 = _1246 ? 0 : (-1);
    int _1250 = _1236 * as_type<int>(_1092);
    int _1252 = abs(_1212);
    float _1254 = in.m_54.x;
    float _1256 = in.m_54.y;
    int _1258 = abs(_1244);
    float _1260 = _1208 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    int _1264 = abs(_1248);
    int _1266 = ~_1252;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    bool _1272 = !_488;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _1270 * as_type<int>(_1084);
    int _1278 = _1276 + _1250;
    int _1280 = abs(_1274);
    float _1282 = _1194 * 6.283185482025146484375;
    float _1284 = sin(_1282);
    int _1286 = ~_1258;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = float(uint(_1154));
    int _1294 = _1290 * as_type<int>(_1140);
    int _1296 = _1294 + _1278;
    int _1298 = ~_1264;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = _1196 * 0.15915493667125701904296875;
    float _1306 = 1.0 / _1292;
    float _1308 = float(uint(_1192));
    float _1310 = _994 * _1254;
    int _1312 = ~_1280;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = _1302 * as_type<int>(_1148);
    int _1320 = _1318 + _1296;
    bool _1322 = !_367;
    int _1324 = _1322 ? _1216 : (-1);
    float _1326 = _1010 * _1256;
    float _1328 = _1230 * _1206;
    int _1330 = _1320 * _1316;
    float _1332 = 1.0 / _1308;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1336 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1338 = _1324 * _1280;
    int _1340 = _1338 + _1330;
    float _1342 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1344 = ~_1192;
    int _1346 = _1344 + 1;
    float _1348 = _1336 * _1220;
    int _1350 = as_type<int>(_1306) + (-2);
    float _1352 = _1342 * _1334;
    int _1354 = abs(_1340);
    float _1356 = _1304 * 6.283185482025146484375;
    float _1358 = sin(_1356);
    float _1360 = float(uint(_1340));
    float _1362 = _1262 * _1284;
    bool _1364 = _337 > 0.5;
    float _1366 = as_type<float>(_1350) * _1360;
    int _1368 = as_type<int>(_1332) + (-2);
    float _1370 = _1304 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = float(uint(_1354));
    float _1376 = as_type<float>(_1368) * _1374;
    int _1378 = ~_1154;
    int _1380 = _1378 + 1;
    float _1382 = trunc(_1366);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    float _1388 = -_1362;
    float _1390 = fma(_1358, _1328, _1388);
    float _1392 = -_1328;
    float _1394 = fma(_1358, _1362, _1392);
    float _1396 = _1230 * _1284;
    float _1398 = trunc(_1376);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    float _1404 = _1284 * _1372;
    float _1406 = _1262 * _1206;
    float _1408 = _1206 * _1372;
    float _1410 = _1372 * _1348;
    float _1412 = -_1348;
    float _1414 = _1358 * _1412;
    float _1416 = fma(_1358, _1406, _1396);
    float _1418 = fma(_1358, _1396, _1406);
    int _1420 = _1380 * int(_1386);
    int _1422 = _1420 + _1340;
    float _1424 = _1262 * _1410;
    float _1426 = fma(_1408, _1352, _1414);
    float _1428 = float(uint(_1422));
    float _1430 = fma(_1416, _1352, _1424);
    float _1432 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1434 = _1346 * int(_1402);
    int _1436 = _1434 + _1354;
    float _1438 = as_type<float>(_1350) * _1428;
    float _1440 = _1230 * _1410;
    float _1442 = fma(_1394, _1432, _1430);
    float _1444 = float(uint(_1436));
    float _1446 = fma(_1390, _1352, _1440);
    float _1448 = fma(_1404, _1432, _1426);
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1452 = as_type<float>(_1368) * _1444;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1456 = trunc(_1438);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    float _1462 = fma(_1418, _1432, _1446);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1450);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1454);
    float _1468 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1464);
    float _1470 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1472 = trunc(_1452);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1482 = _710 + _1478;
    float _1484 = _718 + _1480;
    int _1486 = int(_1386) + int(_1460);
    int _1488 = ~_1154;
    int _1490 = _1488 + 1;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1494 = _1482 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1484 + _1496;
    int _1500 = ~_1192;
    int _1502 = _1500 + 1;
    float _1504 = -_209;
    int _1506 = _1162 ? as_type<int>(_1504) : as_type<int>(_209);
    int _1508 = _1490 * _1486;
    int _1510 = _1508 + _1340;
    int _1512 = int(_1402) + int(_1476);
    float _1514 = _1494 * _1494;
    float _1516 = _1498 * _1498;
    bool _1518 = !_502;
    float _1520 = _1518 ? _209 : as_type<float>(_1506);
    int _1522 = _1502 * _1512;
    int _1524 = _1522 + _1354;
    float _1526 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1528 = _1514 + _1516;
    bool _1530 = uint(_1510) >= uint(_1154);
    float _1532 = in.m_66.w;
    float _1534 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1526);
    float _1536 = sqrt(_1528);
    float _1538 = -_213;
    int _1540 = _1364 ? as_type<int>(_1538) : as_type<int>(_213);
    bool _1542 = !_1530;
    int _1544 = _1542 ? 0 : (-1);
    float _1546 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1534);
    bool _1548 = uint(_1524) >= uint(_1192);
    int _1550 = ~_1486;
    int _1552 = _1550 + _1544;
    int _1554 = _1552 + 1;
    float _1556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1558 = !_1548;
    int _1560 = _1558 ? 0 : (-1);
    float _1562 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1564 = _1340 ^ _1154;
    bool _1566 = !_568;
    float _1568 = _1566 ? _213 : as_type<float>(_1540);
    float _1570 = _658 + _1562;
    int _1572 = ~_1560;
    int _1574 = _1512 + _1572;
    int _1576 = _1574 + 1;
    uint _1578 = uint(int(uint(_1564) >> uint(31)));
    float _1580 = in.m_68.x;
    float _1582 = in.m_68.y;
    float _1584 = in.m_68.z;
    bool _1586 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1588 = _1154 == 0;
    bool _1590 = _1154 == 0;
    int _1592 = _1154 * _1554;
    int _1594 = _1592 + _1340;
    int _1596 = ~int(_1578);
    int _1598 = _1596 + 1;
    float _1600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1602 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1604 = !_1588;
    float _1606 = _1604 ? as_type<float>(_1594) : as_type<float>(0xffffffffu /* nan */);
    int _1608 = _1576 ^ _1598;
    float _1610 = as_type<float>(_1340);
    float _1612 = _1606;
    float _1614 = _1514;
    float _1616 = _1482;
    if (!_1586)
    {
        _722 = _1484;
    }
    float _1618 = _722;
    float _1620 = float(as_type<int>(_1606));
    int _1622 = ~_1598;
    int _1624 = _1622 + _1608;
    int _1626 = _1624 + 1;
    float _1628 = _1618;
    if (!_1586)
    {
        _1610 = _1516;
    }
    float _1630 = _1610;
    float _1632 = _1630;
    if (!_1586)
    {
        _1612 = _1570;
    }
    float _1634 = _1612;
    bool _1636 = !_1586;
    float _1638 = _1634;
    if (!_1636)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1644 = _1536 + _1642;
        float _1646 = rsqrt(_1528);
        float _1648 = _1644 * _1640;
        float _1650 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = _1648 * 0.15915493667125701904296875;
        float _1654 = _1652 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1652 * 6.283185482025146484375;
        float _1660 = cos(_1658);
        float _1662 = fma(_1656, _1650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1664 = _1646 * _1662;
        float _1666 = _1660 + (-1.0);
        float _1668 = fma(_1494, _1664, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1670 = fma(_1498, _1664, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1672 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1676 = _1668 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1680 = _1670 + _1678;
        float _1682 = fma(_1570, _1660, _1672);
        float _1684 = _1676 * _1676;
        float _1686 = _1680 * _1680;
        _1638 = _1682;
        _1614 = _1684;
        _1632 = _1686;
        _1616 = _1668;
        _1628 = _1670;
    }
    float _1688 = _1638;
    float _1690 = _1614;
    float _1692 = _1632;
    float _1694 = _1616;
    float _1696 = _1628;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1700 = _1688 + _1698;
    bool _1702 = !_1590;
    int _1704 = _1702 ? _1626 : (-1);
    float _1706 = fma(_1602, _1620, _924);
    float _1708 = _1520 + 0.5;
    float _1710 = fma(_1700, _1700, _1690);
    float _1712 = float(_1704);
    float _1714 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1716 = fma(_1602, _1708, _1706);
    float _1718 = _1710 + _1692;
    float _1720 = -_956;
    float _1722 = _1720 + 1.0;
    float _1724 = -_926;
    float _1726 = fma(_1714, _1712, _1724);
    float _1728 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1730 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1732 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1734 = _1568 + (-0.5);
    float _1736 = sqrt(_1718);
    float _1738 = -_1722;
    float _1740 = fma(_1520, _1738, _1716);
    float _1742 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1744 = -_1714;
    float _1746 = fma(_1744, _1734, _1726);
    float _1748 = _1728 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1750 = _1730 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1754 = -_998;
    float _1756 = _1754 + 1.0;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1760 = _1742 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1762 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1766 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1768 = fma(_1568, _1756, _1746);
    out.m_70.w = _1760;
    bool _1770 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1772 = isnan(_1736);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1778 = _1774 || _1776;
    out.m_72.x = _1762;
    out.m_72.y = _1764;
    out.m_72.z = _1766;
    out.m_72.w = _1758;
    out.m_74.x = _1740;
    out.m_74.y = _1768;
    float _1780 = _1748;
    float _1782 = _1758;
    if (!_1778)
    {
        _1780 = 1.0;
    }
    float _1784 = _1780;
    bool _1786 = !_1778;
    float _1788 = _1784;
    if (!_1786)
    {
        bool _1790 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1792 = isnan(_1736);
        bool _1794 = _1790 || _1792;
        bool _1796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1798 = _1794 || _1796;
        if (!_1798)
        {
            float _1800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1802 = _1736 + _1800;
            float _1804 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1806 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1804;
            float _1808 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1812 = 1.0 / _1806;
            float _1814 = _1802 * _1812;
            float _1816 = fma(_1814, _1810, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1788 = _1816;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1822 = isnan(_1736);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                float _1830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1832 = _1736 + _1830;
                float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1836 = _1834 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1840 = _1838 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1842 = 1.0 / _1836;
                float _1844 = _1832 * _1842;
                float _1846 = fma(_1844, _1840, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1788 = _1846;
                _1818 = true;
            }
            else
            {
                _1788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1818 = false;
    float _1848 = _1788;
    float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1852 = _1688 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1856 = _1694 + _1854;
    float _1858 = fma(_1852, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1860 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1862 = _1696 + _1860;
    float _1864 = fma(_1856, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1868 = _1858 + _1866;
    float _1870 = fma(_1862, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1874 = _1864 + _1872;
    float _1876 = _1868 * _1868;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1880 = _1870 + _1878;
    float _1882 = fma(_1874, _1874, _1876);
    float _1884 = fma(_1880, _1880, _1882);
    float _1886 = rsqrt(_1884);
    float _1888 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1874 * _1888;
    float _1892 = _1880 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1886;
    float _1910 = _1906;
    float _1912 = _1868;
    float _1914 = _1888;
    float _1916 = _1890;
    if (_1902)
    {
        float _1918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1918;
    }
    float _1920 = _1908;
    float _1922 = _1920;
    if (_1902)
    {
        float _1924 = _1906 * _1920;
        _1910 = _1924;
    }
    float _1926 = _1910;
    if (_1902)
    {
        float _1928 = rsqrt(_1898);
        _1922 = _1928;
    }
    float _1930 = _1922;
    float _1932 = _1930;
    if (_1902)
    {
        float _1934 = _1926 * 0.15915493667125701904296875;
        _1782 = _1934;
    }
    float _1936 = _1782;
    float _1938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1940 = _1880;
    if (_1902)
    {
        float _1942 = _1936 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = precise::max(0.0, _1938);
    float _1950 = _1766;
    float _1952 = _1948;
    if (_1902)
    {
        float _1954 = _1936 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = -_1888;
    float _1962 = -_1948;
    float _1964 = fma(_1868, _1960, _1962);
    if (_1902)
    {
        float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1966;
    }
    float _1968 = _1912;
    float _1970 = sqrt(_1884);
    float _1972 = _1946;
    float _1974 = _1968;
    if (_1902)
    {
        float _1976 = fma(_1946, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = _1978;
    if (_1902)
    {
        float _1982 = _1930 * _1978;
        _1914 = _1982;
    }
    float _1984 = _1914;
    if (!_1902)
    {
        _1932 = _1964;
    }
    float _1986 = _1932;
    float _1988 = _1986;
    if (_1902)
    {
        float _1990 = _1958 + (-1.0);
        _1952 = _1990;
    }
    float _1992 = _1952;
    float _1994 = _1992;
    if (_1902)
    {
        float _1996 = _1890 * _1984;
        _1916 = _1996;
    }
    float _1998 = _1916;
    if (!_1902)
    {
        _1980 = _1892;
    }
    float _2000 = _1980;
    float _2002 = _2000;
    if (_1902)
    {
        float _2004 = _1892 * _1984;
        _2002 = _2004;
    }
    float _2006 = _2002;
    if (_1902)
    {
        float _2008 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1974 = _2008;
    }
    float _2010 = _1974;
    float _2012 = _2010;
    if (!_1902)
    {
        _1994 = _1894;
    }
    float _2014 = _1994;
    float _2016 = _2014;
    if (_1902)
    {
        float _2018 = _1998 * _1998;
        _2016 = _2018;
    }
    float _2020 = _2016;
    if (_1902)
    {
        float _2022 = fma(_1964, _1958, _2010);
        _1988 = _2022;
    }
    float _2024 = _1988;
    if (!_1902)
    {
        _2012 = _1896;
    }
    float _2026 = _2012;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2006 * _2006;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2024, _2024, _2020);
    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2038 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2036);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = _2034 + _2032;
    float _2044 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = -_2040;
    float _2048 = _2046 + 1.0;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2052 = rsqrt(_2042);
    float _2054 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2056 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2058 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2054);
    float _2060 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2062 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2056);
    float _2064 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2066 = abs(_2048);
    float _2068 = log2(_2066);
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2060);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2062);
    float _2074 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2064);
    float _2076 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2078 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2084 = _2052 * _1998;
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2090 = _2052 * _2024;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2094 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2096 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2088);
    float _2098 = _2052 * _2006;
    float _2100 = -_2092;
    float _2102 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2100);
    float _2104 = -_2094;
    float _2106 = fma(_2104, _2050, 1.0);
    float _2108 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2110 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2112 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = -_2098;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2102);
    float _2118 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2120 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2122 = log2(_2106);
    float _2124 = fma(_2116, -0.5, 0.5);
    float _2126 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2118);
    float _2130 = fma(_2116, 0.5, 0.5);
    float _2132 = _2090 + 1.0;
    float _2134 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2136 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2138 = exp2(_2112);
    float _2140 = fma(_2130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2142 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2134);
    float _2144 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2136);
    float _2146 = fma(_2130, _2140, -0.212114393711090087890625);
    float _2148 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2150 = 1.0 / _2120;
    float _2152 = _2122 * 0.693147182464599609375;
    float _2154 = fma(_2130, _2146, 1.570728778839111328125);
    float _2156 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2158 = sqrt(_2124);
    float _2160 = -_2090;
    float _2162 = fma(_2138, _2132, _2160);
    float _2164 = fma(_2162, 0.5, 0.5);
    float _2166 = _2144 * _2150;
    float _2168 = _2148 * _2150;
    float _2170 = fma(_2166, 0.5, 0.5);
    float _2172 = fma(_2168, -0.5, 0.5);
    float _2174 = _2158 * 0.636619746685028076171875;
    float3 _5391 = float3(_2170, _2172, _2156);
    float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5391, float3(0.0), isnan(_5391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5391, float3(0.0), isnan(_5391)), level(0.0)).x;
    float3 _5402 = float3(_2170, _2172, _2156);
    float4 _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5402, float3(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5402, float3(0.0), isnan(_5402)), level(0.0)).xyzw;
    float _2181 = _2179.x;
    float _2183 = _2179.y;
    float _2185 = _2179.z;
    float _2187 = _2179.w;
    float _2189 = -_2154;
    float _2191 = fma(_2174, _2189, 1.0);
    float2 _5424 = float2(_2191, _2164);
    float3 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5424, float2(0.0), isnan(_5424)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5424, float2(0.0), isnan(_5424)), level(0.0)).xyz;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2205 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2207 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2205);
    float _2209 = exp2(_2203);
    float _2211 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2207);
    float _2213 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2211);
    float _2215 = _2213 + _2120;
    out.gl_Position.x = _2144;
    out.gl_Position.y = _2148;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _2120;
    float _2217 = _2215 * 0.5;
    float _2219 = -_2209;
    float _2221 = _2219 + 1.0;
    float _2223 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.z = _2217;
    out.m_76.w = _2120;
    out.m_78.w = _2223;
    float _2227 = _2225 * _2176;
    float _2229 = -_2225;
    float _2231 = _2229 + 1.0;
    float _2233 = _2187 * _2227;
    float _2235 = _2201 * _2227;
    float _2237 = fma(_2197, _2233, _2181);
    float _2239 = fma(_2199, _2233, _2183);
    float _2241 = _2187 * _2231;
    float _2243 = fma(_2187, _2235, _2185);
    out.m_80.x = _2237;
    out.m_80.y = _2239;
    out.m_80.z = _2243;
    out.m_80.w = _2241;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1818 = false;
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_44.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_47.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2300 = as_type<float>(_115);
        out.gl_Position.z = _2300;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_49.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2370 = as_type<float>(_153);
        out.gl_Position.z = _2370;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_54.w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = in.m_49.x;
    float _173 = in.m_49.y;
    float _175 = in.m_49.z;
    float _177 = in.m_44.x;
    float _179 = in.m_44.y;
    float _181 = in.m_44.z;
    float _183 = 0.0;
    float _185 = _157;
    if (!_169)
    {
        float _187 = _157 * _157;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    float _193 = _191;
    if (!_169)
    {
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _195;
    }
    float _197 = _193;
    int _199 = as_type<int>(_155) & 1;
    bool _201 = _199 != 0;
    int _203 = as_type<int>(_155) & 2;
    bool _205 = _203 != 0;
    bool _207 = !_201;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_205;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_169;
    float _217 = _197;
    if (!_215)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _247;
    }
    float _249 = _217;
    bool _251 = !_169;
    if (!_251)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _157 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _185 = _271;
    }
    float _273 = _185;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _279 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _281 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _283 = fma(_273, _171, _277);
    float _285 = fma(_273, _173, _279);
    float _287 = fma(_273, _175, _281);
    float _289 = fma(_283, _159, _177);
    float _291 = fma(_285, _159, _179);
    float _293 = fma(_287, _159, _181);
    bool _295 = !_275;
    float _315;
    float _317;
    if (!_295)
    {
        float _297 = in.m_56.x;
        float _299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _301 = _297 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _305 = _303 * _299;
        float _307 = float(_99);
        float _309 = floor(_305);
        float _311 = -_309;
        float _313 = _305 + _311;
        _315 = _307;
        _317 = _313;
        _319 = true;
    }
    else
    {
        float _321 = float(_99);
        float _323 = 1.0 / _321;
        float _325 = _133 * _323;
        _315 = _321;
        _317 = _325;
    }
    _319 = false;
    float _327 = _315;
    float _329 = _317;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.x;
    float _337 = in.m_56.y;
    float _339 = in.m_56.z;
    float _341 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _343 = int(_341);
    float _345 = 1.0 / _327;
    float _347 = float(_333);
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _351 = 1.0 / _347;
    float _353 = float(uint(_343));
    float _355 = _337 * 2.0;
    int _357 = ~_343;
    int _359 = _357 + 1;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _363 = ~_343;
    int _365 = _363 + 1;
    bool _367 = _343 == 0;
    float _369 = 1.0 / _353;
    int _371 = ~_343;
    int _373 = _371 + 1;
    float _375 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[78].w, _361);
    float _377 = _351 * _133;
    float _379 = floor(_355);
    int _381 = as_type<int>(_369) + (-2);
    float _383 = trunc(_377);
    int _385 = int(_383);
    float _387 = float(_343);
    float _389 = float(uint(_385));
    float _391 = as_type<float>(_381) * _389;
    float _393 = trunc(_391);
    float _395 = precise::max(_393, 0.0);
    uint _398 = uint(_395);
    int _400 = _359 * int(_398);
    int _402 = _400 + _385;
    float _404 = float(uint(_402));
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _408 = _406 != 0;
    float _410 = as_type<float>(_381) * _404;
    float _412 = trunc(_410);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    int _418 = int(_398) + int(_416);
    float _420 = float(_385);
    int _422 = _365 * _418;
    int _424 = _422 + _385;
    bool _426 = _420 >= _387;
    bool _428 = isnan(_420);
    bool _430 = _426 || _428;
    bool _432 = isnan(_387);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    bool _438 = !_408;
    float _440 = _438 ? 7.345489978790283203125 : 1.0;
    bool _442 = uint(_424) >= uint(_343);
    float _444 = trunc(_436);
    int _446 = int(_444);
    float _448 = _440 * _335;
    bool _450 = !_442;
    int _452 = _450 ? 0 : (-1);
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _464 = _462 != 0;
    int _466 = ~_418;
    int _468 = _466 + _452;
    int _470 = _468 + 1;
    float _472 = floor(_448);
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _476 = _474 != 0;
    int _478 = _343 * _470;
    int _480 = _478 + _385;
    bool _482 = !_456;
    int _484 = _482 ? 0 : 1;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _488 = _486 != 0;
    int _490 = ~_446;
    int _492 = _490 + 1;
    int _494 = _492 + 1;
    bool _496 = !_367;
    int _498 = _496 ? _480 : (-1);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _502 = _500 != 0;
    bool _504 = _379 > 0.0;
    int _506 = _498 * _494;
    float _508 = -_472;
    float _510 = _448 + _508;
    bool _512 = !_460;
    int _514 = _512 ? 0 : 1;
    float _516 = _510 * _387;
    float _518 = _387 * _133;
    int _520 = _343 + (-1);
    int _522 = abs(_514);
    float _524 = _518 * _345;
    float _526 = trunc(_516);
    int _528 = int(_526);
    int _530 = _446 * _520;
    int _532 = _530 + _506;
    bool _534 = !_476;
    int _536 = _534 ? 0 : 1;
    bool _538 = !_464;
    int _540 = _538 ? 0 : 1;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _544 = _542 != 0;
    float _546 = trunc(_524);
    int _548 = int(_546);
    int _550 = abs(_536);
    int _552 = abs(_484);
    int _554 = abs(_540);
    int _556 = _532 * _522;
    bool _558 = !_544;
    int _560 = _558 ? 0 : 1;
    int _562 = _528 * _550;
    int _564 = _562 + _385;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _568 = _566 != 0;
    float _570 = _335 * 2.0;
    int _572 = abs(_560);
    float _574 = float(uint(_564));
    int _576 = _548 * _552;
    int _578 = _576 + _556;
    float _580 = as_type<float>(_381) * _574;
    int _582 = _564 * _554;
    int _584 = _582 + _578;
    float _586 = in.m_58.x;
    float _588 = in.m_58.y;
    float _590 = in.m_58.z;
    int _592 = _528 * _572;
    int _594 = _592 + _584;
    float _596 = in.m_60.x;
    float _598 = in.m_60.y;
    float _600 = in.m_60.z;
    float _602 = float(uint(_594));
    float _604 = as_type<float>(_381) * _602;
    float _606 = in.m_62.x;
    float _608 = in.m_62.y;
    float _610 = in.m_62.z;
    float _612 = trunc(_604);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    float _618 = floor(_570);
    float _620 = _291 * _588;
    float _622 = _337 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _624 = _291 * _598;
    float _626 = fma(_289, _586, _620);
    float _628 = fma(_622, -2.0, _349);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _632 = _329 + _630;
    int _634 = _373 * int(_616);
    int _636 = _634 + _594;
    float _638 = fma(_293, _590, _626);
    float _640 = float(uint(_636));
    float _642 = _291 * _608;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _644;
    bool _648 = _618 >= 0.0;
    bool _650 = isnan(_618);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = _638 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = as_type<float>(_381) * _640;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _664 = fma(_289, _606, _642);
    int _666 = ~_343;
    int _668 = _666 + 1;
    float _670 = fma(_289, _596, _624);
    float _672 = -_662;
    float _674 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[77].x, _672);
    float _676 = trunc(_660);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = _656 ? 0 : 1;
    float _684 = _339 * 2.0;
    bool _686 = _379 >= 0.0;
    bool _688 = isnan(_379);
    bool _690 = _686 || _688;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _700 = fma(_293, _610, _664);
    bool _702 = _618 > 0.0;
    float _704 = floor(_684);
    int _706 = _694 ? 0 : 1;
    float _708 = fma(_293, _600, _670);
    float _710 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _712 = ~_706;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = _708 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _720 = _716;
    float _722 = _658;
    if (!_504)
    {
        int _724 = ~_706;
        int _726 = _724 + 1;
        _720 = _726;
    }
    int _728 = _720;
    float _730 = 1.0 / _646;
    int _732 = int(_616) + int(_680);
    int _734 = _668 * _732;
    int _736 = _734 + _594;
    float _738 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _740 = log2(_738);
    int _742 = ~_682;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    bool _748 = uint(_736) >= uint(_343);
    int _750 = _746;
    if (!_702)
    {
        int _752 = ~_682;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    float _758 = _337 + _339;
    bool _760 = !_748;
    int _762 = _760 ? 0 : (-1);
    float _764 = 1.0 / _698;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _776 = _774 != 0;
    float _778 = _632 * _730;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _782 = _329 + _780;
    float _784 = _758 + (-1.0);
    bool _786 = !_768;
    int _788 = _786 ? 0 : 1;
    bool _790 = _704 >= 0.0;
    bool _792 = isnan(_704);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    float _800 = _337 + _335;
    float _802 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _804;
    int _808 = _798 ? 0 : 1;
    float _810 = _800 + (-1.0);
    bool _812 = _704 > 0.0;
    float _814 = _740 * _133;
    float _816 = _782 * _764;
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _820;
    float _824 = exp2(_814);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _832 = _830 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _834 = fma(_822, _778, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _836 = fma(_806, _778, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _838 = fma(_828, _816, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _840 = fma(_832, _816, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _842 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _844 = isnan(_329);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = _339 + _335;
    bool _856 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _858 = isnan(_329);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    bool _868 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _870 = isnan(_329);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _854 + (-1.0);
    int _882 = ~_808;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    float _888 = -_824;
    float _890 = _888 + 1.0;
    int _892 = _886;
    if (!_812)
    {
        int _894 = ~_808;
        int _896 = _894 + 1;
        _892 = _896;
    }
    int _898 = _892;
    float _900 = -_878;
    float _902 = _900 + 1.0;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _906 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _914 = _910 || _912;
    float _916 = _866 * _902;
    float _918 = -_866;
    float _920 = _918 + 1.0;
    float _922 = -_133;
    float _924 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[76].x, _674);
    float _926 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _928 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _930 = trunc(_580);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    float _936 = _852 * _920;
    float _938 = -_852;
    float _940 = _938 + 1.0;
    int _942 = abs(_788);
    float _944 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].z, _904);
    float _946 = _834 * _936;
    float _948 = _836 * _936;
    int _950 = ~_732;
    int _952 = _950 + _762;
    int _954 = _952 + 1;
    float _956 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _944);
    float _958 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[143].x, _946);
    int _960 = ~_343;
    int _962 = _960 + 1;
    float _964 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[143].y, _948);
    int _966 = _343 * _954;
    int _968 = _966 + _594;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _972 = 1.0 + _970;
    float _974 = fma(_838, _916, _958);
    float _976 = float(_898);
    float _978 = fma(_840, _916, _964);
    bool _980 = !_772;
    int _982 = _980 ? 0 : 1;
    float _984 = 1.0 / _972;
    int _986 = _962 * int(_934);
    int _988 = _986 + _564;
    bool _990 = !_367;
    int _992 = _990 ? _968 : (-1);
    float _994 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[145].x, _974);
    float _996 = _914 ? _890 : 0.0;
    float _998 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _375);
    bool _1000 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1002 = isnan(1.0);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1008 = _1004 || _1006;
    float _1010 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[145].y, _978);
    int _1012 = abs(_982);
    int _1014 = _992 >> 31;
    float _1016 = float(_942);
    float _1018 = float(uint(_988));
    bool _1020 = !_776;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = _1016 * _976;
    int _1026 = _1014 & 3;
    float _1028 = as_type<float>(_381) * _1018;
    float _1030 = in.m_64.x;
    float _1032 = in.m_64.y;
    float _1034 = in.m_64.z;
    float _1036 = float(_728);
    if (_1008)
    {
        float _1038 = _996 * _984;
        _135 = _1038;
    }
    float _1040 = _135;
    int _1042 = abs(_1022);
    float _1044 = trunc(_1028);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    int _1050 = _992 + _1026;
    float _1052 = _1024 * (-2.0);
    int _1054 = _1050 >> 2;
    float _1056 = float(_756);
    int _1058 = _992 & 3;
    bool _1060 = _1058 != 0;
    float _1062 = float(_1012);
    int _1064 = _992 & 3;
    bool _1066 = _1064 != 0;
    int _1068 = _1054 << 4;
    int _1070 = _1068 + 368;
    float _1072 = _1062 * _1056;
    int _1074 = _1060 ? 0 : 1;
    bool _1076 = uint(_1064) > 1u;
    uint _1078 = uint(int(uint(_1070) >> uint(2)));
    uint _1080 = uint(int(uint(int(_1078)) >> uint(2)));
    int _1082 = int(_1078) & 3;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[int(_1080)][_1082];
    int _1086 = int(_1078) + 1;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    int _1090 = _1086 & 3;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[int(_1088)][_1090];
    float _1094 = float(_1042);
    int _1096 = int(_934) + int(_1048);
    int _1098 = ~_343;
    int _1100 = _1098 + 1;
    float _1102 = _1094 * _1036;
    float _1104 = fma(_818, _1052, _818);
    float _1106 = _1072 * (-2.0);
    int _1108 = ~_1074;
    int _1110 = _1108 + 1;
    int _1112 = _1110 + 1;
    float _1114 = _1102 * (-2.0);
    float _1116 = fma(_1052, _1030, _1030);
    int _1118 = _1112;
    if (!_1076)
    {
        int _1120 = ~_1074;
        int _1122 = _1120 + 1;
        _1118 = _1122;
    }
    int _1124 = _1118;
    float _1126 = fma(_802, _1106, _802);
    float _1128 = fma(_928, _1114, _928);
    bool _1130 = uint(_1064) >= 2u;
    int _1132 = _1070 + 8;
    uint _1134 = uint(int(uint(_1132) >> uint(2)));
    uint _1136 = uint(int(uint(int(_1134)) >> uint(2)));
    int _1138 = int(_1134) & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    int _1142 = int(_1134) + 1;
    uint _1144 = uint(int(uint(_1142) >> uint(2)));
    int _1146 = _1142 & 3;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[int(_1144)][_1146];
    float _1150 = fma(_1106, _1032, _1032);
    float _1152 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1154 = int(_1152);
    int _1156 = _1130 ? 0 : 1;
    int _1158 = _1100 * _1096;
    int _1160 = _1158 + _564;
    bool _1162 = _335 > 0.5;
    float _1164 = _335 + (-0.5);
    float _1166 = fma(_1114, _1034, _1034);
    float _1168 = _337 + (-0.5);
    bool _1170 = uint(_1160) >= uint(_343);
    float _1172 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1116);
    int _1174 = abs(_1124);
    float _1176 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1150);
    float _1178 = _339 + (-0.5);
    float _1180 = fma(_1104, _1040, _1172);
    bool _1182 = !_1170;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1126, _1040, _1176);
    bool _1188 = _1064 != 3;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1166);
    int _1192 = abs(_1154);
    float _1194 = _1186 * 0.15915493667125701904296875;
    float _1196 = fma(_1128, _1040, _1190);
    int _1198 = ~_1096;
    int _1200 = _1198 + _1184;
    int _1202 = _1200 + 1;
    float _1204 = _1194 * 6.283185482025146484375;
    float _1206 = cos(_1204);
    float _1208 = _1180 * 0.15915493667125701904296875;
    bool _1210 = !_1066;
    int _1212 = _1210 ? 0 : 1;
    int _1214 = _343 * _1202;
    int _1216 = _1214 + _564;
    bool _1218 = _1064 != 3;
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _213);
    int _1222 = ~_1156;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    float _1228 = _1208 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    int _1232 = ~_1174;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    int _1238 = _1226;
    if (_1188)
    {
        int _1240 = ~_1156;
        int _1242 = _1240 + 1;
        _1238 = _1242;
    }
    int _1244 = _1238;
    bool _1246 = !_1218;
    int _1248 = _1246 ? 0 : (-1);
    int _1250 = _1236 * as_type<int>(_1092);
    int _1252 = abs(_1212);
    float _1254 = in.m_54.x;
    float _1256 = in.m_54.y;
    int _1258 = abs(_1244);
    float _1260 = _1208 * 6.283185482025146484375;
    float _1262 = cos(_1260);
    int _1264 = abs(_1248);
    int _1266 = ~_1252;
    int _1268 = _1266 + 1;
    int _1270 = _1268 + 1;
    bool _1272 = !_488;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _1270 * as_type<int>(_1084);
    int _1278 = _1276 + _1250;
    int _1280 = abs(_1274);
    float _1282 = _1194 * 6.283185482025146484375;
    float _1284 = sin(_1282);
    int _1286 = ~_1258;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    float _1292 = float(uint(_1154));
    int _1294 = _1290 * as_type<int>(_1140);
    int _1296 = _1294 + _1278;
    int _1298 = ~_1264;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = _1196 * 0.15915493667125701904296875;
    float _1306 = 1.0 / _1292;
    float _1308 = float(uint(_1192));
    float _1310 = _994 * _1254;
    int _1312 = ~_1280;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = _1302 * as_type<int>(_1148);
    int _1320 = _1318 + _1296;
    bool _1322 = !_367;
    int _1324 = _1322 ? _1216 : (-1);
    float _1326 = _1010 * _1256;
    float _1328 = _1230 * _1206;
    int _1330 = _1320 * _1316;
    float _1332 = 1.0 / _1308;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1336 = _1326 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1338 = _1324 * _1280;
    int _1340 = _1338 + _1330;
    float _1342 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1344 = ~_1192;
    int _1346 = _1344 + 1;
    float _1348 = _1336 * _1220;
    int _1350 = as_type<int>(_1306) + (-2);
    float _1352 = _1342 * _1334;
    int _1354 = abs(_1340);
    float _1356 = _1304 * 6.283185482025146484375;
    float _1358 = sin(_1356);
    float _1360 = float(uint(_1340));
    float _1362 = _1262 * _1284;
    bool _1364 = _337 > 0.5;
    float _1366 = as_type<float>(_1350) * _1360;
    int _1368 = as_type<int>(_1332) + (-2);
    float _1370 = _1304 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = float(uint(_1354));
    float _1376 = as_type<float>(_1368) * _1374;
    int _1378 = ~_1154;
    int _1380 = _1378 + 1;
    float _1382 = trunc(_1366);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    float _1388 = -_1362;
    float _1390 = fma(_1358, _1328, _1388);
    float _1392 = -_1328;
    float _1394 = fma(_1358, _1362, _1392);
    float _1396 = _1230 * _1284;
    float _1398 = trunc(_1376);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    float _1404 = _1284 * _1372;
    float _1406 = _1262 * _1206;
    float _1408 = _1206 * _1372;
    float _1410 = _1372 * _1348;
    float _1412 = -_1348;
    float _1414 = _1358 * _1412;
    float _1416 = fma(_1358, _1406, _1396);
    float _1418 = fma(_1358, _1396, _1406);
    int _1420 = _1380 * int(_1386);
    int _1422 = _1420 + _1340;
    float _1424 = _1262 * _1410;
    float _1426 = fma(_1408, _1352, _1414);
    float _1428 = float(uint(_1422));
    float _1430 = fma(_1416, _1352, _1424);
    float _1432 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1434 = _1346 * int(_1402);
    int _1436 = _1434 + _1354;
    float _1438 = as_type<float>(_1350) * _1428;
    float _1440 = _1230 * _1410;
    float _1442 = fma(_1394, _1432, _1430);
    float _1444 = float(uint(_1436));
    float _1446 = fma(_1390, _1352, _1440);
    float _1448 = fma(_1404, _1432, _1426);
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1452 = as_type<float>(_1368) * _1444;
    float _1454 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1456 = trunc(_1438);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    float _1462 = fma(_1418, _1432, _1446);
    float _1464 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1450);
    float _1466 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1454);
    float _1468 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1464);
    float _1470 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1466);
    float _1472 = trunc(_1452);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    float _1478 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1480 = _1470 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1482 = _710 + _1478;
    float _1484 = _718 + _1480;
    int _1486 = int(_1386) + int(_1460);
    int _1488 = ~_1154;
    int _1490 = _1488 + 1;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1494 = _1482 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1484 + _1496;
    int _1500 = ~_1192;
    int _1502 = _1500 + 1;
    float _1504 = -_209;
    int _1506 = _1162 ? as_type<int>(_1504) : as_type<int>(_209);
    int _1508 = _1490 * _1486;
    int _1510 = _1508 + _1340;
    int _1512 = int(_1402) + int(_1476);
    float _1514 = _1494 * _1494;
    float _1516 = _1498 * _1498;
    bool _1518 = !_502;
    float _1520 = _1518 ? _209 : as_type<float>(_1506);
    int _1522 = _1502 * _1512;
    int _1524 = _1522 + _1354;
    float _1526 = _1442 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1528 = _1514 + _1516;
    bool _1530 = uint(_1510) >= uint(_1154);
    float _1532 = in.m_66.w;
    float _1534 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1526);
    float _1536 = sqrt(_1528);
    float _1538 = -_213;
    int _1540 = _1364 ? as_type<int>(_1538) : as_type<int>(_213);
    bool _1542 = !_1530;
    int _1544 = _1542 ? 0 : (-1);
    float _1546 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1534);
    bool _1548 = uint(_1524) >= uint(_1192);
    int _1550 = ~_1486;
    int _1552 = _1550 + _1544;
    int _1554 = _1552 + 1;
    float _1556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1558 = !_1548;
    int _1560 = _1558 ? 0 : (-1);
    float _1562 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1564 = _1340 ^ _1154;
    bool _1566 = !_568;
    float _1568 = _1566 ? _213 : as_type<float>(_1540);
    float _1570 = _658 + _1562;
    int _1572 = ~_1560;
    int _1574 = _1512 + _1572;
    int _1576 = _1574 + 1;
    uint _1578 = uint(int(uint(_1564) >> uint(31)));
    float _1580 = in.m_68.x;
    float _1582 = in.m_68.y;
    float _1584 = in.m_68.z;
    bool _1586 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1588 = _1154 == 0;
    bool _1590 = _1154 == 0;
    int _1592 = _1154 * _1554;
    int _1594 = _1592 + _1340;
    int _1596 = ~int(_1578);
    int _1598 = _1596 + 1;
    float _1600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1602 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1604 = !_1588;
    float _1606 = _1604 ? as_type<float>(_1594) : as_type<float>(0xffffffffu /* nan */);
    int _1608 = _1576 ^ _1598;
    float _1610 = as_type<float>(_1340);
    float _1612 = _1606;
    float _1614 = _1514;
    float _1616 = _1482;
    if (!_1586)
    {
        _722 = _1484;
    }
    float _1618 = _722;
    float _1620 = float(as_type<int>(_1606));
    int _1622 = ~_1598;
    int _1624 = _1622 + _1608;
    int _1626 = _1624 + 1;
    float _1628 = _1618;
    if (!_1586)
    {
        _1610 = _1516;
    }
    float _1630 = _1610;
    float _1632 = _1630;
    if (!_1586)
    {
        _1612 = _1570;
    }
    float _1634 = _1612;
    bool _1636 = !_1586;
    float _1638 = _1634;
    if (!_1636)
    {
        float _1640 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1644 = _1536 + _1642;
        float _1646 = rsqrt(_1528);
        float _1648 = _1644 * _1640;
        float _1650 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = _1648 * 0.15915493667125701904296875;
        float _1654 = _1652 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1652 * 6.283185482025146484375;
        float _1660 = cos(_1658);
        float _1662 = fma(_1656, _1650, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1664 = _1646 * _1662;
        float _1666 = _1660 + (-1.0);
        float _1668 = fma(_1494, _1664, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1670 = fma(_1498, _1664, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1672 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1674 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1676 = _1668 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1680 = _1670 + _1678;
        float _1682 = fma(_1570, _1660, _1672);
        float _1684 = _1676 * _1676;
        float _1686 = _1680 * _1680;
        _1638 = _1682;
        _1614 = _1684;
        _1632 = _1686;
        _1616 = _1668;
        _1628 = _1670;
    }
    float _1688 = _1638;
    float _1690 = _1614;
    float _1692 = _1632;
    float _1694 = _1616;
    float _1696 = _1628;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1700 = _1688 + _1698;
    bool _1702 = !_1590;
    int _1704 = _1702 ? _1626 : (-1);
    float _1706 = fma(_1602, _1620, _924);
    float _1708 = _1520 + 0.5;
    float _1710 = fma(_1700, _1700, _1690);
    float _1712 = float(_1704);
    float _1714 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1716 = fma(_1602, _1708, _1706);
    float _1718 = _1710 + _1692;
    float _1720 = -_956;
    float _1722 = _1720 + 1.0;
    float _1724 = -_926;
    float _1726 = fma(_1714, _1712, _1724);
    float _1728 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1730 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1732 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1734 = _1568 + (-0.5);
    float _1736 = sqrt(_1718);
    float _1738 = -_1722;
    float _1740 = fma(_1520, _1738, _1716);
    float _1742 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1744 = -_1714;
    float _1746 = fma(_1744, _1734, _1726);
    float _1748 = _1728 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1750 = _1730 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1752 = _1732 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1754 = -_998;
    float _1756 = _1754 + 1.0;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1760 = _1742 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1762 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1764 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1766 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1768 = fma(_1568, _1756, _1746);
    out.m_70.w = _1760;
    bool _1770 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1772 = isnan(_1736);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1778 = _1774 || _1776;
    out.m_72.x = _1762;
    out.m_72.y = _1764;
    out.m_72.z = _1766;
    out.m_72.w = _1758;
    out.m_74.x = _1740;
    out.m_74.y = _1768;
    float _1780 = _1748;
    float _1782 = _1758;
    if (!_1778)
    {
        _1780 = 1.0;
    }
    float _1784 = _1780;
    bool _1786 = !_1778;
    float _1788 = _1784;
    if (!_1786)
    {
        bool _1790 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1792 = isnan(_1736);
        bool _1794 = _1790 || _1792;
        bool _1796 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1798 = _1794 || _1796;
        if (!_1798)
        {
            float _1800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1802 = _1736 + _1800;
            float _1804 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1806 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1804;
            float _1808 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1810 = _1808 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1812 = 1.0 / _1806;
            float _1814 = _1802 * _1812;
            float _1816 = fma(_1814, _1810, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1788 = _1816;
            _1818 = true;
        }
        else
        {
            bool _1820 = _1736 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1822 = isnan(_1736);
            bool _1824 = _1820 || _1822;
            bool _1826 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1828 = _1824 || _1826;
            if (!_1828)
            {
                float _1830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1832 = _1736 + _1830;
                float _1834 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1836 = _1834 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1838 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1840 = _1838 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1842 = 1.0 / _1836;
                float _1844 = _1832 * _1842;
                float _1846 = fma(_1844, _1840, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1788 = _1846;
                _1818 = true;
            }
            else
            {
                _1788 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1818 = false;
    float _1848 = _1788;
    float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1852 = _1688 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1856 = _1694 + _1854;
    float _1858 = fma(_1852, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1860 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1862 = _1696 + _1860;
    float _1864 = fma(_1856, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1868 = _1858 + _1866;
    float _1870 = fma(_1862, _1848, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1874 = _1864 + _1872;
    float _1876 = _1868 * _1868;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1880 = _1870 + _1878;
    float _1882 = fma(_1874, _1874, _1876);
    float _1884 = fma(_1880, _1880, _1882);
    float _1886 = rsqrt(_1884);
    float _1888 = _1886 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1890 = _1874 * _1888;
    float _1892 = _1880 * _1888;
    float _1894 = _1890 * _1890;
    float _1896 = _1892 * _1892;
    float _1898 = _1894 + _1896;
    float _1900 = sqrt(_1898);
    bool _1902 = _1900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1906 = _1900 + _1904;
    float _1908 = _1886;
    float _1910 = _1906;
    float _1912 = _1868;
    float _1914 = _1888;
    float _1916 = _1890;
    if (_1902)
    {
        float _1918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1908 = _1918;
    }
    float _1920 = _1908;
    float _1922 = _1920;
    if (_1902)
    {
        float _1924 = _1906 * _1920;
        _1910 = _1924;
    }
    float _1926 = _1910;
    if (_1902)
    {
        float _1928 = rsqrt(_1898);
        _1922 = _1928;
    }
    float _1930 = _1922;
    float _1932 = _1930;
    if (_1902)
    {
        float _1934 = _1926 * 0.15915493667125701904296875;
        _1782 = _1934;
    }
    float _1936 = _1782;
    float _1938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1940 = _1880;
    if (_1902)
    {
        float _1942 = _1936 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        _1940 = _1944;
    }
    float _1946 = _1940;
    float _1948 = precise::max(0.0, _1938);
    float _1950 = _1766;
    float _1952 = _1948;
    if (_1902)
    {
        float _1954 = _1936 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        _1950 = _1956;
    }
    float _1958 = _1950;
    float _1960 = -_1888;
    float _1962 = -_1948;
    float _1964 = fma(_1868, _1960, _1962);
    if (_1902)
    {
        float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1912 = _1966;
    }
    float _1968 = _1912;
    float _1970 = sqrt(_1884);
    float _1972 = _1946;
    float _1974 = _1968;
    if (_1902)
    {
        float _1976 = fma(_1946, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1972 = _1976;
    }
    float _1978 = _1972;
    float _1980 = _1978;
    if (_1902)
    {
        float _1982 = _1930 * _1978;
        _1914 = _1982;
    }
    float _1984 = _1914;
    if (!_1902)
    {
        _1932 = _1964;
    }
    float _1986 = _1932;
    float _1988 = _1986;
    if (_1902)
    {
        float _1990 = _1958 + (-1.0);
        _1952 = _1990;
    }
    float _1992 = _1952;
    float _1994 = _1992;
    if (_1902)
    {
        float _1996 = _1890 * _1984;
        _1916 = _1996;
    }
    float _1998 = _1916;
    if (!_1902)
    {
        _1980 = _1892;
    }
    float _2000 = _1980;
    float _2002 = _2000;
    if (_1902)
    {
        float _2004 = _1892 * _1984;
        _2002 = _2004;
    }
    float _2006 = _2002;
    if (_1902)
    {
        float _2008 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1974 = _2008;
    }
    float _2010 = _1974;
    float _2012 = _2010;
    if (!_1902)
    {
        _1994 = _1894;
    }
    float _2014 = _1994;
    float _2016 = _2014;
    if (_1902)
    {
        float _2018 = _1998 * _1998;
        _2016 = _2018;
    }
    float _2020 = _2016;
    if (_1902)
    {
        float _2022 = fma(_1964, _1958, _2010);
        _1988 = _2022;
    }
    float _2024 = _1988;
    if (!_1902)
    {
        _2012 = _1896;
    }
    float _2026 = _2012;
    float _2028 = _2026;
    if (_1902)
    {
        float _2030 = _2006 * _2006;
        _2028 = _2030;
    }
    float _2032 = _2028;
    float _2034 = fma(_2024, _2024, _2020);
    float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2038 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2036);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = _2034 + _2032;
    float _2044 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2046 = -_2040;
    float _2048 = _2046 + 1.0;
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2052 = rsqrt(_2042);
    float _2054 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2044);
    float _2056 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2058 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2054);
    float _2060 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2062 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2056);
    float _2064 = _1858 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2066 = abs(_2048);
    float _2068 = log2(_2066);
    float _2070 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2060);
    float _2072 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2062);
    float _2074 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2064);
    float _2076 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2078 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2070);
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2082 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2084 = _2052 * _1998;
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2088 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2090 = _2052 * _2024;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2094 = _2076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2096 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2088);
    float _2098 = _2052 * _2006;
    float _2100 = -_2092;
    float _2102 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2100);
    float _2104 = -_2094;
    float _2106 = fma(_2104, _2050, 1.0);
    float _2108 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2110 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2112 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = -_2098;
    float _2116 = fma(_2114, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2102);
    float _2118 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2120 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2122 = log2(_2106);
    float _2124 = fma(_2116, -0.5, 0.5);
    float _2126 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2118);
    float _2130 = fma(_2116, 0.5, 0.5);
    float _2132 = _2090 + 1.0;
    float _2134 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2136 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2138 = exp2(_2112);
    float _2140 = fma(_2130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2142 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2134);
    float _2144 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2136);
    float _2146 = fma(_2130, _2140, -0.212114393711090087890625);
    float _2148 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2150 = 1.0 / _2120;
    float _2152 = _2122 * 0.693147182464599609375;
    float _2154 = fma(_2130, _2146, 1.570728778839111328125);
    float _2156 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2158 = sqrt(_2124);
    float _2160 = -_2090;
    float _2162 = fma(_2138, _2132, _2160);
    float _2164 = fma(_2162, 0.5, 0.5);
    float _2166 = _2144 * _2150;
    float _2168 = _2148 * _2150;
    float _2170 = fma(_2166, 0.5, 0.5);
    float _2172 = fma(_2168, -0.5, 0.5);
    float _2174 = _2158 * 0.636619746685028076171875;
    float3 _5391 = float3(_2170, _2172, _2156);
    float _2176 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5391, float3(0.0), isnan(_5391)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5391, float3(0.0), isnan(_5391)), level(0.0)).x;
    float3 _5402 = float3(_2170, _2172, _2156);
    float4 _2179 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5402, float3(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5402, float3(0.0), isnan(_5402)), level(0.0)).xyzw;
    float _2181 = _2179.x;
    float _2183 = _2179.y;
    float _2185 = _2179.z;
    float _2187 = _2179.w;
    float _2189 = -_2154;
    float _2191 = fma(_2174, _2189, 1.0);
    float2 _5424 = float2(_2191, _2164);
    float3 _2195 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5424, float2(0.0), isnan(_5424)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5424, float2(0.0), isnan(_5424)), level(0.0)).xyz;
    float _2197 = _2195.x;
    float _2199 = _2195.y;
    float _2201 = _2195.z;
    float _2203 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2205 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2207 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2205);
    float _2209 = exp2(_2203);
    float _2211 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2207);
    float _2213 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2211);
    float _2215 = _2213 + _2120;
    out.gl_Position.x = _2144;
    out.gl_Position.y = _2148;
    out.gl_Position.z = _2213;
    out.gl_Position.w = _2120;
    float _2217 = _2215 * 0.5;
    float _2219 = -_2209;
    float _2221 = _2219 + 1.0;
    float _2223 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.z = _2217;
    out.m_76.w = _2120;
    out.m_78.w = _2223;
    float _2227 = _2225 * _2176;
    float _2229 = -_2225;
    float _2231 = _2229 + 1.0;
    float _2233 = _2187 * _2227;
    float _2235 = _2201 * _2227;
    float _2237 = fma(_2197, _2233, _2181);
    float _2239 = fma(_2199, _2233, _2183);
    float _2241 = _2187 * _2231;
    float _2243 = fma(_2187, _2235, _2185);
    out.m_80.x = _2237;
    out.m_80.y = _2239;
    out.m_80.z = _2243;
    out.m_80.w = _2241;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

