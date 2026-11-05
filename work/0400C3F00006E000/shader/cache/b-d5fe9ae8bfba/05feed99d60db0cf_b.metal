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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1548 = false;
    bool _371 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2112 = as_type<float>(_101);
        out.gl_Position.z = _2112;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_137);
        out.gl_Position.z = _2181;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _143 * _141;
    float _161 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    float _173 = _169 * 0.15915493667125701904296875;
    float _175 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = 0.0;
    float _179 = _175;
    if (!_153)
    {
        float _181 = _175 * _175;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185;
    if (!_153)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = -_171;
    float _199 = _161 + _197;
    bool _201 = !_153;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _175 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _175);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _175 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = in.m_44.x;
    float _273 = in.m_44.y;
    float _275 = in.m_44.z;
    float _277 = fma(_189, 0.5, 0.5);
    bool _279 = _199 < 0.5;
    float _281 = float(_279);
    bool _283 = !_265;
    int _285 = _283 ? 0 : 1;
    float _287 = -_199;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _291 = !_157;
    int _293 = _291 ? 0 : 1;
    float _295 = -_281;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = -_277;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_285);
    float _307 = fma(_259, _163, _299);
    int _309 = abs(_293);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = fma(_259, _165, _311);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = float(_305);
    float _327 = fma(_317, _261, _273);
    float _329 = float(_309);
    float _331 = fma(_259, _167, _323);
    float _333 = abs(_289);
    float _335 = _325 * _333;
    float _337 = fma(_307, _261, _271);
    float _339 = fma(_331, _261, _275);
    float _341 = float(_321);
    float _343 = fma(_329, _303, _335);
    float _345 = abs(_297);
    float _347 = fma(_341, _345, _343);
    bool _349 = !_319;
    float _367;
    float _369;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = float(_85);
        float _357 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _359 = _357 * _351;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _355;
        _369 = _365;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _119 * _375;
        _367 = _373;
        _369 = _377;
    }
    _371 = false;
    float _379 = _367;
    float _381 = _369;
    float _383 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _385 = int(_383);
    float _387 = as_type<float>(int(gl_VertexIndex));
    float _389 = _327 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _393 = int(_391);
    float _395 = float(_385);
    float _397 = 1.0 / _395;
    float _399 = float(uint(_393));
    int _401 = ~_393;
    int _403 = _401 + 1;
    float _405 = 1.0 / _399;
    int _407 = ~_393;
    int _409 = _407 + 1;
    int _411 = ~_393;
    int _413 = _411 + 1;
    float _415 = _119 * _397;
    float _417 = trunc(_415);
    int _419 = int(_417);
    int _421 = as_type<int>(_405) + (-2);
    float _423 = float(uint(_419));
    float _425 = as_type<float>(_421) * _423;
    float _427 = trunc(_425);
    float _429 = precise::max(_427, 0.0);
    uint _432 = uint(_429);
    float _434 = float(_419);
    int _436 = _403 * int(_432);
    int _438 = _436 + _419;
    float _440 = float(_393);
    float _442 = float(uint(_438));
    bool _444 = _434 >= _440;
    bool _446 = isnan(_434);
    bool _448 = _444 || _446;
    bool _450 = isnan(_440);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = as_type<float>(_421) * _442;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _460 = _458 != 0;
    bool _462 = !_460;
    float _464 = _462 ? 7.345489978790283203125 : 1.0;
    float _466 = trunc(_456);
    float _468 = precise::max(_466, 0.0);
    uint _470 = uint(_468);
    float _472 = _464 * _139;
    float _474 = floor(_472);
    int _476 = int(_432) + int(_470);
    float _478 = trunc(_454);
    int _480 = int(_478);
    int _482 = _409 * _476;
    int _484 = _482 + _419;
    float _486 = -_474;
    float _488 = _472 + _486;
    bool _490 = uint(_484) >= uint(_393);
    float _492 = _488 * _440;
    float _494 = 1.0 / _379;
    float _496 = _119 * _440;
    bool _498 = !_490;
    int _500 = _498 ? 0 : (-1);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = ~_476;
    int _516 = _514 + _500;
    int _518 = _516 + 1;
    bool _520 = _393 == 0;
    float _522 = trunc(_492);
    int _524 = int(_522);
    int _526 = ~_480;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    int _532 = _393 * _518;
    int _534 = _532 + _419;
    int _536 = _393 + (-1);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _540 = _538 != 0;
    float _542 = _496 * _494;
    bool _544 = !_520;
    int _546 = _544 ? _534 : (-1);
    bool _548 = !_540;
    int _550 = _548 ? 0 : 1;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _554 = _552 != 0;
    int _556 = _546 * _530;
    float _558 = trunc(_542);
    int _560 = int(_558);
    bool _562 = !_508;
    int _564 = _562 ? 0 : 1;
    int _566 = _480 * _536;
    int _568 = _566 + _556;
    bool _570 = !_504;
    int _572 = _570 ? 0 : 1;
    int _574 = abs(_564);
    bool _576 = !_512;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_550);
    int _582 = abs(_572);
    bool _584 = !_554;
    int _586 = _584 ? 0 : 1;
    int _588 = _524 * _580;
    int _590 = _588 + _419;
    int _592 = abs(_578);
    int _594 = _568 * _574;
    int _596 = abs(_586);
    int _598 = _560 * _582;
    int _600 = _598 + _594;
    int _602 = ~_393;
    int _604 = _602 + 1;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _608 = _606 != 0;
    int _610 = _590 * _592;
    int _612 = _610 + _600;
    int _614 = ~_393;
    int _616 = _614 + 1;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _620 = _618 != 0;
    int _622 = _524 * _596;
    int _624 = _622 + _612;
    float _626 = float(uint(_624));
    float _628 = as_type<float>(_421) * _626;
    float _630 = trunc(_628);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    int _636 = _616 * int(_634);
    int _638 = _636 + _624;
    float _640 = float(uint(_638));
    int _642 = ~_393;
    int _644 = _642 + 1;
    float _646 = as_type<float>(_421) * _640;
    float _648 = trunc(_646);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    int _654 = int(_634) + int(_652);
    int _656 = _604 * _654;
    int _658 = _656 + _624;
    bool _660 = uint(_658) >= uint(_393);
    float _662 = float(uint(_590));
    bool _664 = !_660;
    int _666 = _664 ? 0 : (-1);
    float _668 = as_type<float>(_421) * _662;
    int _670 = ~_654;
    int _672 = _670 + _666;
    int _674 = _672 + 1;
    float _676 = trunc(_668);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = _393 * _674;
    int _684 = _682 + _624;
    bool _686 = !_520;
    int _688 = _686 ? _684 : (-1);
    int _690 = _688 >> 31;
    int _692 = _688 & 3;
    bool _694 = _692 != 0;
    int _696 = _690 & 3;
    int _698 = _644 * int(_680);
    int _700 = _698 + _590;
    bool _702 = uint(_692) > 1u;
    int _704 = _688 + _696;
    float _706 = float(uint(_700));
    int _708 = _704 >> 2;
    int _710 = _688 & 3;
    bool _712 = _710 != 0;
    float _714 = as_type<float>(_421) * _706;
    int _716 = _708 << 4;
    int _718 = _716 + 368;
    float _720 = _327 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _722 = _712 ? 0 : 1;
    float _724 = trunc(_714);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = uint(int(uint(_718) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[int(_740)][_742];
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _748 = _746 != 0;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _750;
    int _754 = ~_722;
    int _756 = _754 + 1;
    int _758 = _756 + 1;
    int _760 = _758;
    if (!_702)
    {
        int _762 = ~_722;
        int _764 = _762 + 1;
        _760 = _764;
    }
    int _766 = _760;
    float _768 = _327 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _770 = uint(_692) >= 2u;
    int _772 = _718 + 8;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[int(_784)][_786];
    bool _790 = _692 != 3;
    float _792 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _768);
    bool _794 = !_694;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _720);
    int _800 = _770 ? 0 : 1;
    float _802 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _389);
    int _804 = as_type<int>(_387) & 1;
    bool _806 = _804 != 0;
    int _808 = as_type<int>(_387) & 2;
    bool _810 = _808 != 0;
    bool _812 = !_790;
    int _814 = _812 ? 0 : (-1);
    bool _816 = _692 != 3;
    float _818 = 1.0 / _752;
    int _820 = int(_680) + int(_728);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _826 = abs(_766);
    int _828 = ~_800;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    int _834 = _413 * _820;
    int _836 = _834 + _590;
    int _838 = abs(_796);
    float _840 = 1.0 / _824;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _844 = _381 + _842;
    int _846 = _832;
    if (_816)
    {
        int _848 = ~_800;
        int _850 = _848 + 1;
        _846 = _850;
    }
    int _852 = _846;
    bool _854 = uint(_836) >= uint(_393);
    int _856 = ~_826;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _844 * _818;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _866 = _381 + _864;
    bool _868 = !_854;
    int _870 = _868 ? 0 : (-1);
    int _872 = ~_838;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = ~_820;
    int _880 = _878 + _870;
    int _882 = _880 + 1;
    float _884 = _866 * _840;
    int _886 = abs(_814);
    float _888 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _890 = int(_888);
    int _892 = _860 * as_type<int>(_744);
    int _894 = abs(_852);
    int _896 = _393 * _882;
    int _898 = _896 + _590;
    int _900 = ~_886;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = _876 * as_type<int>(_736);
    int _908 = _906 + _892;
    int _910 = ~_894;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _916;
    bool _920 = !_608;
    int _922 = _920 ? 0 : 1;
    int _924 = _914 * as_type<int>(_780);
    int _926 = _924 + _908;
    float _928 = fma(_918, _862, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _930;
    bool _934 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _936 = isnan(_381);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    int _946 = _904 * as_type<int>(_788);
    int _948 = _946 + _926;
    bool _950 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _952 = isnan(_381);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = fma(_932, _862, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _964 = abs(_890);
    float _966 = -_944;
    float _968 = _966 + 1.0;
    int _970 = abs(_922);
    float _972 = -_960;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _980 = float(uint(_890));
    float _982 = _944 * _974;
    float _984 = 1.0 / _980;
    bool _986 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _988 = isnan(_381);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1002 = float(uint(_964));
    float _1004 = fma(_978, _884, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1006 = ~_970;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_1000, _884, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1014 = _996 * _968;
    bool _1016 = !_520;
    int _1018 = _1016 ? _898 : (-1);
    float _1020 = 1.0 / _1002;
    int _1022 = _948 * _1010;
    float _1024 = _928 * _1014;
    float _1026 = _962 * _1014;
    float _1028 = -_996;
    float _1030 = _1028 + 1.0;
    int _1032 = _1018 * _970;
    int _1034 = _1032 + _1022;
    float _1036 = in.m_53.x;
    float _1038 = in.m_53.y;
    float _1040 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1024);
    float _1042 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1026);
    int _1044 = as_type<int>(_984) + (-2);
    float _1046 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1048 = float(uint(_1034));
    float _1050 = fma(_1004, _982, _1042);
    int _1052 = abs(_1034);
    float _1054 = fma(_1012, _982, _1040);
    int _1056 = as_type<int>(_1020) + (-2);
    float _1058 = as_type<float>(_1044) * _1048;
    float _1060 = float(uint(_1052));
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1064 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1054);
    float _1066 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1050);
    float _1068 = as_type<float>(_1056) * _1060;
    float _1070 = trunc(_1058);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1078 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1062);
    bool _1080 = _139 > 0.5;
    float _1082 = in.m_51.y;
    float _1084 = -_1076;
    float _1086 = fma(_1046, 2.0, _1084);
    float _1088 = _1064 * _1036;
    float _1090 = trunc(_1068);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = ~_890;
    int _1098 = _1096 + 1;
    float _1100 = _1066 * _1038;
    bool _1102 = !_810;
    float _1104 = _1102 ? (-0.5) : 0.5;
    float _1106 = _347 * _1088;
    int _1108 = ~_964;
    int _1110 = _1108 + 1;
    float _1112 = _347 * _1100;
    bool _1114 = !_806;
    float _1116 = _1114 ? (-0.5) : 0.5;
    int _1118 = _1098 * int(_1074);
    int _1120 = _1118 + _1034;
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1126 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1116);
    float _1130 = float(uint(_1120));
    float _1132 = _1124 * _1122;
    int _1134 = _1110 * int(_1094);
    int _1136 = _1134 + _1052;
    float _1138 = _1126 * _1128;
    float _1140 = as_type<float>(_1044) * _1130;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1144 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1146 = float(uint(_1136));
    float _1148 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1150 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].z, _792);
    float _1152 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    float _1154 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].z, _802);
    float _1156 = as_type<float>(_1056) * _1146;
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1142);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1152);
    float _1162 = _1150 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1164 = trunc(_1156);
    float _1166 = precise::max(_1164, 0.0);
    uint _1168 = uint(_1166);
    float _1170 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1158);
    float _1172 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1174 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1182 = _1172 + _1174;
    float _1184 = trunc(_1140);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = _1162 + _1178;
    float _1192 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1194 = _1082 > 0.5;
    float _1196 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1176);
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1200 = _1190 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1204 = _1182 + _1202;
    float _1206 = fma(_1192, -2.0, _1180);
    int _1208 = ~_964;
    int _1210 = _1208 + 1;
    float _1212 = _1200 * _1200;
    float _1214 = _1204 * _1204;
    int _1216 = int(_1094) + int(_1168);
    float _1218 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    int _1220 = ~_890;
    int _1222 = _1220 + 1;
    float _1224 = _1212 + _1214;
    float _1226 = -_1104;
    int _1228 = _1194 ? as_type<int>(_1226) : as_type<int>(_1104);
    int _1230 = _1210 * _1216;
    int _1232 = _1230 + _1052;
    int _1234 = int(_1074) + int(_1188);
    float _1236 = -_119;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1086);
    float _1240 = sqrt(_1224);
    float _1242 = -_1116;
    int _1244 = _1080 ? as_type<int>(_1242) : as_type<int>(_1116);
    int _1246 = _1222 * _1234;
    int _1248 = _1246 + _1034;
    bool _1250 = uint(_1232) >= uint(_964);
    float _1252 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1254 = _1034 ^ _890;
    bool _1256 = uint(_1248) >= uint(_890);
    float _1258 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1252);
    bool _1260 = !_1250;
    int _1262 = _1260 ? 0 : (-1);
    uint _1264 = uint(int(uint(_1254) >> uint(31)));
    float _1266 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1258);
    bool _1268 = !_620;
    float _1270 = _1268 ? _1116 : as_type<float>(_1244);
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1274 = !_1256;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1280 = ~_1262;
    int _1282 = _1216 + _1280;
    int _1284 = _1282 + 1;
    int _1286 = ~int(_1264);
    int _1288 = _1286 + 1;
    bool _1290 = !_748;
    float _1292 = _1290 ? _1104 : as_type<float>(_1228);
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1296 = ~_1234;
    int _1298 = _1296 + _1276;
    int _1300 = _1298 + 1;
    bool _1302 = _1240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1304 = _1284 ^ _1288;
    int _1306 = _890 * _1300;
    int _1308 = _1306 + _1034;
    bool _1310 = _890 == 0;
    int _1312 = ~_1288;
    int _1314 = _1312 + _1304;
    int _1316 = _1314 + 1;
    float _1318 = _1218 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1320 = !_1310;
    float _1322 = _1320 ? as_type<float>(_1308) : as_type<float>(0xffffffffu /* nan */);
    bool _1324 = _890 == 0;
    float _1326 = _1318 + _1278;
    float _1328 = float(as_type<int>(_1322));
    float _1330 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1332 = _1218;
    float _1334 = as_type<float>(_890);
    float _1336 = _1190;
    float _1338 = _1322;
    float _1340 = _1212;
    float _1342 = _1172;
    if (!_1302)
    {
        _1332 = _1190;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (!_1302)
    {
        _1334 = _1214;
    }
    float _1348 = _1334;
    float _1350 = _1348;
    if (!_1302)
    {
        _1336 = _1182;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (!_1302)
    {
        _1338 = _1326;
    }
    float _1356 = _1338;
    bool _1358 = !_1302;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1240 + _1364;
        float _1368 = rsqrt(_1224);
        float _1370 = _1366 * _1362;
        float _1372 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = _1370 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = fma(_1378, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1386 = _1368 * _1384;
        float _1388 = _1382 + (-1.0);
        float _1390 = fma(_1200, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1392 = fma(_1204, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1394 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _1390 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1402 = _1392 + _1400;
        float _1404 = fma(_1326, _1382, _1394);
        float _1406 = _1398 * _1398;
        float _1408 = _1402 * _1402;
        _1360 = _1404;
        _1340 = _1406;
        _1350 = _1408;
        _1346 = _1390;
        _1354 = _1392;
    }
    float _1410 = _1360;
    float _1412 = _1340;
    float _1414 = _1350;
    float _1416 = _1346;
    float _1418 = _1354;
    float _1420 = fma(_1330, _1328, _1238);
    bool _1422 = !_1324;
    int _1424 = _1422 ? _1316 : (-1);
    float _1426 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1430 = _1410 + _1428;
    float _1432 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1206);
    float _1434 = float(_1424);
    float _1436 = _1270 + 0.5;
    float _1438 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1078);
    float _1440 = fma(_1430, _1430, _1412);
    float _1442 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1196);
    float _1444 = -_1432;
    float _1446 = fma(_1426, _1434, _1444);
    float _1448 = _1292 + (-0.5);
    float _1450 = fma(_1330, _1436, _1420);
    float _1452 = -_1438;
    float _1454 = _1452 + 1.0;
    float _1456 = _1440 + _1414;
    float _1458 = -_1426;
    float _1460 = fma(_1458, _1448, _1446);
    float _1462 = -_1454;
    float _1464 = fma(_1270, _1462, _1450);
    float _1466 = -_1442;
    float _1468 = _1466 + 1.0;
    float _1470 = sqrt(_1456);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1484 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1488 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = fma(_1292, _1468, _1460);
    out.m_58.x = _1484;
    out.m_58.y = _1488;
    out.m_58.z = _1490;
    out.m_58.w = _1486;
    bool _1500 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1502 = isnan(_1470);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1508 = _1504 || _1506;
    out.m_60.x = _1492;
    out.m_60.y = _1494;
    out.m_60.z = _1496;
    out.m_62.x = _1464;
    out.m_62.y = _1498;
    float _1510 = _1468;
    float _1512 = _1488;
    if (!_1508)
    {
        _1510 = 1.0;
    }
    float _1514 = _1510;
    bool _1516 = !_1508;
    float _1518 = _1514;
    if (!_1516)
    {
        bool _1520 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1522 = isnan(_1470);
        bool _1524 = _1520 || _1522;
        bool _1526 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1528 = _1524 || _1526;
        if (!_1528)
        {
            float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1532 = _1470 + _1530;
            float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1536 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1534;
            float _1538 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1542 = 1.0 / _1536;
            float _1544 = _1532 * _1542;
            float _1546 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1518 = _1546;
            _1548 = true;
        }
        else
        {
            bool _1550 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1552 = isnan(_1470);
            bool _1554 = _1550 || _1552;
            bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1558 = _1554 || _1556;
            if (!_1558)
            {
                float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1562 = _1470 + _1560;
                float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1572 = 1.0 / _1566;
                float _1574 = _1562 * _1572;
                float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1518 = _1576;
                _1548 = true;
            }
            else
            {
                _1518 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1548 = false;
    float _1578 = _1518;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1582 = _1416 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1586 = _1410 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1590 = _1418 + _1588;
    bool _1592 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan(0.5);
    bool _1600 = _1596 || _1598;
    float _1602 = fma(_1582, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1604 = fma(_1586, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1606 = fma(_1590, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1610 = _1578;
    float _1612 = _1604;
    if (_1600)
    {
        _1608 = _1602;
    }
    float _1614 = _1608;
    float _1616 = _1614;
    if (_1600)
    {
        _1512 = _1604;
    }
    float _1618 = _1512;
    float _1620 = _1618;
    if (_1600)
    {
        _1610 = _1606;
    }
    float _1622 = _1610;
    float _1624 = _1622;
    if (!_1600)
    {
        float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1628 = _1318 + _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1632 = _1162 + _1630;
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1636 = _1628 * _1628;
        float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1640 = _1172 + _1638;
        float _1642 = fma(_1632, _1632, _1636);
        float _1644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1646 = fma(_1640, _1640, _1642);
        float _1648 = sqrt(_1646);
        float _1650 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1652 = -_1318;
        float _1654 = _1652 + _1604;
        float _1656 = precise::min(_1648, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1658 = _1656 * _1644;
        float _1660 = -_1162;
        float _1662 = _1660 + _1602;
        float _1664 = _1650 * _1658;
        float _1666 = -_1172;
        float _1668 = _1666 + _1606;
        float _1670 = fma(_1662, _1664, _1162);
        float _1672 = fma(_1654, _1664, _1318);
        float _1674 = fma(_1668, _1664, _1172);
        _1620 = _1672;
        _1616 = _1670;
        _1624 = _1674;
    }
    float _1676 = _1620;
    float _1678 = _1616;
    float _1680 = _1624;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1684 = _1676 + _1682;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1678 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1692 = _1680 + _1690;
    float _1694 = _1684 * _1684;
    float _1696 = fma(_1688, _1688, _1694);
    float _1698 = fma(_1692, _1692, _1696);
    float _1700 = rsqrt(_1698);
    float _1702 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1704 = _1688 * _1702;
    float _1706 = _1692 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 * _1706;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1700;
    float _1724 = _1720;
    float _1726 = _1702;
    float _1728 = _1704;
    if (_1716)
    {
        float _1730 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1730;
    }
    float _1732 = _1722;
    if (_1716)
    {
        float _1734 = rsqrt(_1712);
        _1342 = _1734;
    }
    float _1736 = _1342;
    float _1738 = _1736;
    if (_1716)
    {
        float _1740 = _1720 * _1732;
        _1724 = _1740;
    }
    float _1742 = _1724;
    if (_1716)
    {
        float _1744 = _1742 * 0.15915493667125701904296875;
        _1612 = _1744;
    }
    float _1746 = _1612;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1750 = _1318;
    if (_1716)
    {
        float _1752 = _1746 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        _1750 = _1754;
    }
    float _1756 = _1750;
    float _1758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1760 = precise::max(0.0, _1758);
    float _1762 = _1692;
    float _1764 = _1760;
    float _1766 = _1758;
    if (_1716)
    {
        float _1768 = _1746 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        _1762 = _1770;
    }
    float _1772 = _1762;
    float _1774 = -_1702;
    float _1776 = -_1760;
    float _1778 = fma(_1684, _1774, _1776);
    float _1780 = _1778;
    if (_1716)
    {
        float _1782 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1782;
    }
    float _1784 = _1764;
    float _1786 = sqrt(_1698);
    float _1788 = _1756;
    float _1790 = _1784;
    if (_1716)
    {
        float _1792 = fma(_1756, _1784, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1788 = _1792;
    }
    float _1794 = _1788;
    float _1796 = _1794;
    if (_1716)
    {
        float _1798 = _1772 + (-1.0);
        _1766 = _1798;
    }
    float _1800 = _1766;
    float _1802 = _1800;
    if (_1716)
    {
        float _1804 = _1736 * _1794;
        _1726 = _1804;
    }
    float _1806 = _1726;
    if (!_1716)
    {
        _1738 = _1778;
    }
    float _1808 = _1738;
    float _1810 = _1808;
    if (_1716)
    {
        float _1812 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1790 = _1812;
    }
    float _1814 = _1790;
    if (_1716)
    {
        float _1816 = _1704 * _1806;
        _1728 = _1816;
    }
    float _1818 = _1728;
    if (!_1716)
    {
        _1796 = _1706;
    }
    float _1820 = _1796;
    float _1822 = _1820;
    if (_1716)
    {
        float _1824 = _1706 * _1806;
        _1822 = _1824;
    }
    float _1826 = _1822;
    if (!_1716)
    {
        _1802 = _1708;
    }
    float _1828 = _1802;
    float _1830 = _1828;
    if (_1716)
    {
        float _1832 = fma(_1778, _1772, _1814);
        _1810 = _1832;
    }
    float _1834 = _1810;
    if (_1716)
    {
        float _1836 = _1818 * _1818;
        _1830 = _1836;
    }
    float _1838 = _1830;
    if (!_1716)
    {
        _1780 = _1710;
    }
    float _1840 = _1780;
    float _1842 = _1840;
    if (_1716)
    {
        float _1844 = _1826 * _1826;
        _1842 = _1844;
    }
    float _1846 = _1842;
    float _1848 = fma(_1834, _1834, _1838);
    float _1850 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1852 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1854 = _1848 + _1846;
    float _1856 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1850);
    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1860 = fma(_1786, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1858);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1866 = rsqrt(_1854);
    float _1868 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    float _1870 = -_1862;
    float _1872 = _1870 + 1.0;
    float _1874 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1876 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1864);
    float _1878 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1880 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1852);
    float _1882 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1874);
    float _1884 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1876);
    float _1886 = abs(_1872);
    float _1888 = log2(_1886);
    float _1890 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1892 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1882);
    float _1894 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1896 = -_1890;
    float _1898 = fma(_1896, _1748, 1.0);
    float _1900 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _1902 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1904 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = _1866 * _1818;
    float _1908 = _1866 * _1834;
    float _1910 = _1866 * _1826;
    float _1912 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1914 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1916 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1918 = log2(_1898);
    float _1920 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1912);
    float _1922 = -_1914;
    float _1924 = fma(_1908, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1922);
    float _1926 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1928 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1930 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1920);
    float _1932 = -_1910;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1924);
    float _1936 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1938 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1928);
    float _1940 = exp2(_1926);
    float _1942 = fma(_1934, -0.5, 0.5);
    float _1944 = fma(_1934, 0.5, 0.5);
    float _1946 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1936);
    float _1948 = _1908 + 1.0;
    float _1950 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1938);
    float _1952 = fma(_1944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1946);
    float _1956 = 1.0 / _1930;
    float _1958 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1950);
    float _1960 = fma(_1944, _1952, -0.212114393711090087890625);
    float _1962 = _1918 * 0.693147182464599609375;
    float _1964 = fma(_1944, _1960, 1.570728778839111328125);
    float _1966 = sqrt(_1942);
    float _1968 = -_1908;
    float _1970 = fma(_1940, _1948, _1968);
    float _1972 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1954);
    float _1974 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1976 = fma(_1970, 0.5, 0.5);
    float _1978 = _1972 * _1956;
    float _1980 = _1958 * _1956;
    float _1982 = fma(_1978, 0.5, 0.5);
    float _1984 = fma(_1980, -0.5, 0.5);
    float _1986 = _1966 * 0.636619746685028076171875;
    float _1988 = -_1964;
    float _1990 = fma(_1986, _1988, 1.0);
    float3 _5014 = float3(_1982, _1984, _1974);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5014, float3(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5014, float3(0.0), isnan(_5014)), level(0.0)).x;
    float3 _5025 = float3(_1982, _1984, _1974);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5025, float3(0.0), isnan(_5025)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5025, float3(0.0), isnan(_5025)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _5042 = float2(_1990, _1976);
    float3 _2007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5042, float2(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5042, float2(0.0), isnan(_5042)), level(0.0)).xyz;
    float _2009 = _2007.x;
    float _2011 = _2007.y;
    float _2013 = _2007.z;
    float _2015 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2017 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2019 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2017);
    float _2021 = exp2(_2015);
    float _2023 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2019);
    float _2025 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2023);
    float _2027 = _2025 + _1930;
    out.gl_Position.x = _1972;
    out.gl_Position.y = _1958;
    out.gl_Position.z = _2025;
    out.gl_Position.w = _1930;
    float _2029 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2031 = _2027 * 0.5;
    float _2033 = -_2021;
    float _2035 = _2033 + 1.0;
    out.m_47.x = _2029;
    float _2037 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2031;
    out.m_64.w = _1930;
    float _2039 = _2037 * _1992;
    float _2041 = -_2037;
    float _2043 = _2041 + 1.0;
    float _2045 = _2003 * _2039;
    float _2047 = _2013 * _2039;
    float _2049 = _2003 * _2043;
    float _2051 = fma(_2009, _2045, _1997);
    float _2053 = fma(_2011, _2045, _1999);
    float _2055 = fma(_2003, _2047, _2001);
    out.m_66.x = _2051;
    out.m_66.y = _2053;
    out.m_66.z = _2055;
    out.m_66.w = _2049;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1548 = false;
    bool _371 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2112 = as_type<float>(_101);
        out.gl_Position.z = _2112;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_137);
        out.gl_Position.z = _2181;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _143 * _141;
    float _161 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    float _173 = _169 * 0.15915493667125701904296875;
    float _175 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = 0.0;
    float _179 = _175;
    if (!_153)
    {
        float _181 = _175 * _175;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185;
    if (!_153)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = -_171;
    float _199 = _161 + _197;
    bool _201 = !_153;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _175 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _175);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _175 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = in.m_44.x;
    float _273 = in.m_44.y;
    float _275 = in.m_44.z;
    float _277 = fma(_189, 0.5, 0.5);
    bool _279 = _199 < 0.5;
    float _281 = float(_279);
    bool _283 = !_265;
    int _285 = _283 ? 0 : 1;
    float _287 = -_199;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _291 = !_157;
    int _293 = _291 ? 0 : 1;
    float _295 = -_281;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = -_277;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_285);
    float _307 = fma(_259, _163, _299);
    int _309 = abs(_293);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = fma(_259, _165, _311);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = float(_305);
    float _327 = fma(_317, _261, _273);
    float _329 = float(_309);
    float _331 = fma(_259, _167, _323);
    float _333 = abs(_289);
    float _335 = _325 * _333;
    float _337 = fma(_307, _261, _271);
    float _339 = fma(_331, _261, _275);
    float _341 = float(_321);
    float _343 = fma(_329, _303, _335);
    float _345 = abs(_297);
    float _347 = fma(_341, _345, _343);
    bool _349 = !_319;
    float _367;
    float _369;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = float(_85);
        float _357 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _359 = _357 * _351;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _355;
        _369 = _365;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _119 * _375;
        _367 = _373;
        _369 = _377;
    }
    _371 = false;
    float _379 = _367;
    float _381 = _369;
    float _383 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _385 = int(_383);
    float _387 = as_type<float>(int(gl_VertexIndex));
    float _389 = _327 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _393 = int(_391);
    float _395 = float(_385);
    float _397 = 1.0 / _395;
    float _399 = float(uint(_393));
    int _401 = ~_393;
    int _403 = _401 + 1;
    float _405 = 1.0 / _399;
    int _407 = ~_393;
    int _409 = _407 + 1;
    int _411 = ~_393;
    int _413 = _411 + 1;
    float _415 = _119 * _397;
    float _417 = trunc(_415);
    int _419 = int(_417);
    int _421 = as_type<int>(_405) + (-2);
    float _423 = float(uint(_419));
    float _425 = as_type<float>(_421) * _423;
    float _427 = trunc(_425);
    float _429 = precise::max(_427, 0.0);
    uint _432 = uint(_429);
    float _434 = float(_419);
    int _436 = _403 * int(_432);
    int _438 = _436 + _419;
    float _440 = float(_393);
    float _442 = float(uint(_438));
    bool _444 = _434 >= _440;
    bool _446 = isnan(_434);
    bool _448 = _444 || _446;
    bool _450 = isnan(_440);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = as_type<float>(_421) * _442;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _460 = _458 != 0;
    bool _462 = !_460;
    float _464 = _462 ? 7.345489978790283203125 : 1.0;
    float _466 = trunc(_456);
    float _468 = precise::max(_466, 0.0);
    uint _470 = uint(_468);
    float _472 = _464 * _139;
    float _474 = floor(_472);
    int _476 = int(_432) + int(_470);
    float _478 = trunc(_454);
    int _480 = int(_478);
    int _482 = _409 * _476;
    int _484 = _482 + _419;
    float _486 = -_474;
    float _488 = _472 + _486;
    bool _490 = uint(_484) >= uint(_393);
    float _492 = _488 * _440;
    float _494 = 1.0 / _379;
    float _496 = _119 * _440;
    bool _498 = !_490;
    int _500 = _498 ? 0 : (-1);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = ~_476;
    int _516 = _514 + _500;
    int _518 = _516 + 1;
    bool _520 = _393 == 0;
    float _522 = trunc(_492);
    int _524 = int(_522);
    int _526 = ~_480;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    int _532 = _393 * _518;
    int _534 = _532 + _419;
    int _536 = _393 + (-1);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _540 = _538 != 0;
    float _542 = _496 * _494;
    bool _544 = !_520;
    int _546 = _544 ? _534 : (-1);
    bool _548 = !_540;
    int _550 = _548 ? 0 : 1;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _554 = _552 != 0;
    int _556 = _546 * _530;
    float _558 = trunc(_542);
    int _560 = int(_558);
    bool _562 = !_508;
    int _564 = _562 ? 0 : 1;
    int _566 = _480 * _536;
    int _568 = _566 + _556;
    bool _570 = !_504;
    int _572 = _570 ? 0 : 1;
    int _574 = abs(_564);
    bool _576 = !_512;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_550);
    int _582 = abs(_572);
    bool _584 = !_554;
    int _586 = _584 ? 0 : 1;
    int _588 = _524 * _580;
    int _590 = _588 + _419;
    int _592 = abs(_578);
    int _594 = _568 * _574;
    int _596 = abs(_586);
    int _598 = _560 * _582;
    int _600 = _598 + _594;
    int _602 = ~_393;
    int _604 = _602 + 1;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _608 = _606 != 0;
    int _610 = _590 * _592;
    int _612 = _610 + _600;
    int _614 = ~_393;
    int _616 = _614 + 1;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _620 = _618 != 0;
    int _622 = _524 * _596;
    int _624 = _622 + _612;
    float _626 = float(uint(_624));
    float _628 = as_type<float>(_421) * _626;
    float _630 = trunc(_628);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    int _636 = _616 * int(_634);
    int _638 = _636 + _624;
    float _640 = float(uint(_638));
    int _642 = ~_393;
    int _644 = _642 + 1;
    float _646 = as_type<float>(_421) * _640;
    float _648 = trunc(_646);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    int _654 = int(_634) + int(_652);
    int _656 = _604 * _654;
    int _658 = _656 + _624;
    bool _660 = uint(_658) >= uint(_393);
    float _662 = float(uint(_590));
    bool _664 = !_660;
    int _666 = _664 ? 0 : (-1);
    float _668 = as_type<float>(_421) * _662;
    int _670 = ~_654;
    int _672 = _670 + _666;
    int _674 = _672 + 1;
    float _676 = trunc(_668);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = _393 * _674;
    int _684 = _682 + _624;
    bool _686 = !_520;
    int _688 = _686 ? _684 : (-1);
    int _690 = _688 >> 31;
    int _692 = _688 & 3;
    bool _694 = _692 != 0;
    int _696 = _690 & 3;
    int _698 = _644 * int(_680);
    int _700 = _698 + _590;
    bool _702 = uint(_692) > 1u;
    int _704 = _688 + _696;
    float _706 = float(uint(_700));
    int _708 = _704 >> 2;
    int _710 = _688 & 3;
    bool _712 = _710 != 0;
    float _714 = as_type<float>(_421) * _706;
    int _716 = _708 << 4;
    int _718 = _716 + 368;
    float _720 = _327 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _722 = _712 ? 0 : 1;
    float _724 = trunc(_714);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = uint(int(uint(_718) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[int(_740)][_742];
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _748 = _746 != 0;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _750;
    int _754 = ~_722;
    int _756 = _754 + 1;
    int _758 = _756 + 1;
    int _760 = _758;
    if (!_702)
    {
        int _762 = ~_722;
        int _764 = _762 + 1;
        _760 = _764;
    }
    int _766 = _760;
    float _768 = _327 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _770 = uint(_692) >= 2u;
    int _772 = _718 + 8;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[int(_784)][_786];
    bool _790 = _692 != 3;
    float _792 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _768);
    bool _794 = !_694;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _720);
    int _800 = _770 ? 0 : 1;
    float _802 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _389);
    int _804 = as_type<int>(_387) & 1;
    bool _806 = _804 != 0;
    int _808 = as_type<int>(_387) & 2;
    bool _810 = _808 != 0;
    bool _812 = !_790;
    int _814 = _812 ? 0 : (-1);
    bool _816 = _692 != 3;
    float _818 = 1.0 / _752;
    int _820 = int(_680) + int(_728);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _826 = abs(_766);
    int _828 = ~_800;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    int _834 = _413 * _820;
    int _836 = _834 + _590;
    int _838 = abs(_796);
    float _840 = 1.0 / _824;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _844 = _381 + _842;
    int _846 = _832;
    if (_816)
    {
        int _848 = ~_800;
        int _850 = _848 + 1;
        _846 = _850;
    }
    int _852 = _846;
    bool _854 = uint(_836) >= uint(_393);
    int _856 = ~_826;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _844 * _818;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _866 = _381 + _864;
    bool _868 = !_854;
    int _870 = _868 ? 0 : (-1);
    int _872 = ~_838;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = ~_820;
    int _880 = _878 + _870;
    int _882 = _880 + 1;
    float _884 = _866 * _840;
    int _886 = abs(_814);
    float _888 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _890 = int(_888);
    int _892 = _860 * as_type<int>(_744);
    int _894 = abs(_852);
    int _896 = _393 * _882;
    int _898 = _896 + _590;
    int _900 = ~_886;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = _876 * as_type<int>(_736);
    int _908 = _906 + _892;
    int _910 = ~_894;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _916;
    bool _920 = !_608;
    int _922 = _920 ? 0 : 1;
    int _924 = _914 * as_type<int>(_780);
    int _926 = _924 + _908;
    float _928 = fma(_918, _862, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _930;
    bool _934 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _936 = isnan(_381);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    int _946 = _904 * as_type<int>(_788);
    int _948 = _946 + _926;
    bool _950 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _952 = isnan(_381);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = fma(_932, _862, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _964 = abs(_890);
    float _966 = -_944;
    float _968 = _966 + 1.0;
    int _970 = abs(_922);
    float _972 = -_960;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _980 = float(uint(_890));
    float _982 = _944 * _974;
    float _984 = 1.0 / _980;
    bool _986 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _988 = isnan(_381);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1002 = float(uint(_964));
    float _1004 = fma(_978, _884, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1006 = ~_970;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_1000, _884, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1014 = _996 * _968;
    bool _1016 = !_520;
    int _1018 = _1016 ? _898 : (-1);
    float _1020 = 1.0 / _1002;
    int _1022 = _948 * _1010;
    float _1024 = _928 * _1014;
    float _1026 = _962 * _1014;
    float _1028 = -_996;
    float _1030 = _1028 + 1.0;
    int _1032 = _1018 * _970;
    int _1034 = _1032 + _1022;
    float _1036 = in.m_53.x;
    float _1038 = in.m_53.y;
    float _1040 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1024);
    float _1042 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1026);
    int _1044 = as_type<int>(_984) + (-2);
    float _1046 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1048 = float(uint(_1034));
    float _1050 = fma(_1004, _982, _1042);
    int _1052 = abs(_1034);
    float _1054 = fma(_1012, _982, _1040);
    int _1056 = as_type<int>(_1020) + (-2);
    float _1058 = as_type<float>(_1044) * _1048;
    float _1060 = float(uint(_1052));
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1064 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1054);
    float _1066 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1050);
    float _1068 = as_type<float>(_1056) * _1060;
    float _1070 = trunc(_1058);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1078 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1062);
    bool _1080 = _139 > 0.5;
    float _1082 = in.m_51.y;
    float _1084 = -_1076;
    float _1086 = fma(_1046, 2.0, _1084);
    float _1088 = _1064 * _1036;
    float _1090 = trunc(_1068);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = ~_890;
    int _1098 = _1096 + 1;
    float _1100 = _1066 * _1038;
    bool _1102 = !_810;
    float _1104 = _1102 ? (-0.5) : 0.5;
    float _1106 = _347 * _1088;
    int _1108 = ~_964;
    int _1110 = _1108 + 1;
    float _1112 = _347 * _1100;
    bool _1114 = !_806;
    float _1116 = _1114 ? (-0.5) : 0.5;
    int _1118 = _1098 * int(_1074);
    int _1120 = _1118 + _1034;
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1126 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1116);
    float _1130 = float(uint(_1120));
    float _1132 = _1124 * _1122;
    int _1134 = _1110 * int(_1094);
    int _1136 = _1134 + _1052;
    float _1138 = _1126 * _1128;
    float _1140 = as_type<float>(_1044) * _1130;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1144 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1146 = float(uint(_1136));
    float _1148 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1150 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].z, _792);
    float _1152 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    float _1154 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].z, _802);
    float _1156 = as_type<float>(_1056) * _1146;
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1142);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1152);
    float _1162 = _1150 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1164 = trunc(_1156);
    float _1166 = precise::max(_1164, 0.0);
    uint _1168 = uint(_1166);
    float _1170 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1158);
    float _1172 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1174 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1182 = _1172 + _1174;
    float _1184 = trunc(_1140);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = _1162 + _1178;
    float _1192 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1194 = _1082 > 0.5;
    float _1196 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1176);
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1200 = _1190 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1204 = _1182 + _1202;
    float _1206 = fma(_1192, -2.0, _1180);
    int _1208 = ~_964;
    int _1210 = _1208 + 1;
    float _1212 = _1200 * _1200;
    float _1214 = _1204 * _1204;
    int _1216 = int(_1094) + int(_1168);
    float _1218 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    int _1220 = ~_890;
    int _1222 = _1220 + 1;
    float _1224 = _1212 + _1214;
    float _1226 = -_1104;
    int _1228 = _1194 ? as_type<int>(_1226) : as_type<int>(_1104);
    int _1230 = _1210 * _1216;
    int _1232 = _1230 + _1052;
    int _1234 = int(_1074) + int(_1188);
    float _1236 = -_119;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1086);
    float _1240 = sqrt(_1224);
    float _1242 = -_1116;
    int _1244 = _1080 ? as_type<int>(_1242) : as_type<int>(_1116);
    int _1246 = _1222 * _1234;
    int _1248 = _1246 + _1034;
    bool _1250 = uint(_1232) >= uint(_964);
    float _1252 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1254 = _1034 ^ _890;
    bool _1256 = uint(_1248) >= uint(_890);
    float _1258 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1252);
    bool _1260 = !_1250;
    int _1262 = _1260 ? 0 : (-1);
    uint _1264 = uint(int(uint(_1254) >> uint(31)));
    float _1266 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1258);
    bool _1268 = !_620;
    float _1270 = _1268 ? _1116 : as_type<float>(_1244);
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1274 = !_1256;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1280 = ~_1262;
    int _1282 = _1216 + _1280;
    int _1284 = _1282 + 1;
    int _1286 = ~int(_1264);
    int _1288 = _1286 + 1;
    bool _1290 = !_748;
    float _1292 = _1290 ? _1104 : as_type<float>(_1228);
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1296 = ~_1234;
    int _1298 = _1296 + _1276;
    int _1300 = _1298 + 1;
    bool _1302 = _1240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1304 = _1284 ^ _1288;
    int _1306 = _890 * _1300;
    int _1308 = _1306 + _1034;
    bool _1310 = _890 == 0;
    int _1312 = ~_1288;
    int _1314 = _1312 + _1304;
    int _1316 = _1314 + 1;
    float _1318 = _1218 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1320 = !_1310;
    float _1322 = _1320 ? as_type<float>(_1308) : as_type<float>(0xffffffffu /* nan */);
    bool _1324 = _890 == 0;
    float _1326 = _1318 + _1278;
    float _1328 = float(as_type<int>(_1322));
    float _1330 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1332 = _1218;
    float _1334 = as_type<float>(_890);
    float _1336 = _1190;
    float _1338 = _1322;
    float _1340 = _1212;
    float _1342 = _1172;
    if (!_1302)
    {
        _1332 = _1190;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (!_1302)
    {
        _1334 = _1214;
    }
    float _1348 = _1334;
    float _1350 = _1348;
    if (!_1302)
    {
        _1336 = _1182;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (!_1302)
    {
        _1338 = _1326;
    }
    float _1356 = _1338;
    bool _1358 = !_1302;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1240 + _1364;
        float _1368 = rsqrt(_1224);
        float _1370 = _1366 * _1362;
        float _1372 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = _1370 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = fma(_1378, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1386 = _1368 * _1384;
        float _1388 = _1382 + (-1.0);
        float _1390 = fma(_1200, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1392 = fma(_1204, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1394 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _1390 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1402 = _1392 + _1400;
        float _1404 = fma(_1326, _1382, _1394);
        float _1406 = _1398 * _1398;
        float _1408 = _1402 * _1402;
        _1360 = _1404;
        _1340 = _1406;
        _1350 = _1408;
        _1346 = _1390;
        _1354 = _1392;
    }
    float _1410 = _1360;
    float _1412 = _1340;
    float _1414 = _1350;
    float _1416 = _1346;
    float _1418 = _1354;
    float _1420 = fma(_1330, _1328, _1238);
    bool _1422 = !_1324;
    int _1424 = _1422 ? _1316 : (-1);
    float _1426 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1430 = _1410 + _1428;
    float _1432 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1206);
    float _1434 = float(_1424);
    float _1436 = _1270 + 0.5;
    float _1438 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1078);
    float _1440 = fma(_1430, _1430, _1412);
    float _1442 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1196);
    float _1444 = -_1432;
    float _1446 = fma(_1426, _1434, _1444);
    float _1448 = _1292 + (-0.5);
    float _1450 = fma(_1330, _1436, _1420);
    float _1452 = -_1438;
    float _1454 = _1452 + 1.0;
    float _1456 = _1440 + _1414;
    float _1458 = -_1426;
    float _1460 = fma(_1458, _1448, _1446);
    float _1462 = -_1454;
    float _1464 = fma(_1270, _1462, _1450);
    float _1466 = -_1442;
    float _1468 = _1466 + 1.0;
    float _1470 = sqrt(_1456);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1484 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1488 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = fma(_1292, _1468, _1460);
    out.m_58.x = _1484;
    out.m_58.y = _1488;
    out.m_58.z = _1490;
    out.m_58.w = _1486;
    bool _1500 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1502 = isnan(_1470);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1508 = _1504 || _1506;
    out.m_60.x = _1492;
    out.m_60.y = _1494;
    out.m_60.z = _1496;
    out.m_62.x = _1464;
    out.m_62.y = _1498;
    float _1510 = _1468;
    float _1512 = _1488;
    if (!_1508)
    {
        _1510 = 1.0;
    }
    float _1514 = _1510;
    bool _1516 = !_1508;
    float _1518 = _1514;
    if (!_1516)
    {
        bool _1520 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1522 = isnan(_1470);
        bool _1524 = _1520 || _1522;
        bool _1526 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1528 = _1524 || _1526;
        if (!_1528)
        {
            float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1532 = _1470 + _1530;
            float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1536 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1534;
            float _1538 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1542 = 1.0 / _1536;
            float _1544 = _1532 * _1542;
            float _1546 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1518 = _1546;
            _1548 = true;
        }
        else
        {
            bool _1550 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1552 = isnan(_1470);
            bool _1554 = _1550 || _1552;
            bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1558 = _1554 || _1556;
            if (!_1558)
            {
                float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1562 = _1470 + _1560;
                float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1572 = 1.0 / _1566;
                float _1574 = _1562 * _1572;
                float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1518 = _1576;
                _1548 = true;
            }
            else
            {
                _1518 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1548 = false;
    float _1578 = _1518;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1582 = _1416 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1586 = _1410 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1590 = _1418 + _1588;
    bool _1592 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan(0.5);
    bool _1600 = _1596 || _1598;
    float _1602 = fma(_1582, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1604 = fma(_1586, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1606 = fma(_1590, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1610 = _1578;
    float _1612 = _1604;
    if (_1600)
    {
        _1608 = _1602;
    }
    float _1614 = _1608;
    float _1616 = _1614;
    if (_1600)
    {
        _1512 = _1604;
    }
    float _1618 = _1512;
    float _1620 = _1618;
    if (_1600)
    {
        _1610 = _1606;
    }
    float _1622 = _1610;
    float _1624 = _1622;
    if (!_1600)
    {
        float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1628 = _1318 + _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1632 = _1162 + _1630;
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1636 = _1628 * _1628;
        float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1640 = _1172 + _1638;
        float _1642 = fma(_1632, _1632, _1636);
        float _1644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1646 = fma(_1640, _1640, _1642);
        float _1648 = sqrt(_1646);
        float _1650 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1652 = -_1318;
        float _1654 = _1652 + _1604;
        float _1656 = precise::min(_1648, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1658 = _1656 * _1644;
        float _1660 = -_1162;
        float _1662 = _1660 + _1602;
        float _1664 = _1650 * _1658;
        float _1666 = -_1172;
        float _1668 = _1666 + _1606;
        float _1670 = fma(_1662, _1664, _1162);
        float _1672 = fma(_1654, _1664, _1318);
        float _1674 = fma(_1668, _1664, _1172);
        _1620 = _1672;
        _1616 = _1670;
        _1624 = _1674;
    }
    float _1676 = _1620;
    float _1678 = _1616;
    float _1680 = _1624;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1684 = _1676 + _1682;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1678 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1692 = _1680 + _1690;
    float _1694 = _1684 * _1684;
    float _1696 = fma(_1688, _1688, _1694);
    float _1698 = fma(_1692, _1692, _1696);
    float _1700 = rsqrt(_1698);
    float _1702 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1704 = _1688 * _1702;
    float _1706 = _1692 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 * _1706;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1700;
    float _1724 = _1720;
    float _1726 = _1702;
    float _1728 = _1704;
    if (_1716)
    {
        float _1730 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1730;
    }
    float _1732 = _1722;
    if (_1716)
    {
        float _1734 = rsqrt(_1712);
        _1342 = _1734;
    }
    float _1736 = _1342;
    float _1738 = _1736;
    if (_1716)
    {
        float _1740 = _1720 * _1732;
        _1724 = _1740;
    }
    float _1742 = _1724;
    if (_1716)
    {
        float _1744 = _1742 * 0.15915493667125701904296875;
        _1612 = _1744;
    }
    float _1746 = _1612;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1750 = _1318;
    if (_1716)
    {
        float _1752 = _1746 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        _1750 = _1754;
    }
    float _1756 = _1750;
    float _1758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1760 = precise::max(0.0, _1758);
    float _1762 = _1692;
    float _1764 = _1760;
    float _1766 = _1758;
    if (_1716)
    {
        float _1768 = _1746 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        _1762 = _1770;
    }
    float _1772 = _1762;
    float _1774 = -_1702;
    float _1776 = -_1760;
    float _1778 = fma(_1684, _1774, _1776);
    float _1780 = _1778;
    if (_1716)
    {
        float _1782 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1782;
    }
    float _1784 = _1764;
    float _1786 = sqrt(_1698);
    float _1788 = _1756;
    float _1790 = _1784;
    if (_1716)
    {
        float _1792 = fma(_1756, _1784, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1788 = _1792;
    }
    float _1794 = _1788;
    float _1796 = _1794;
    if (_1716)
    {
        float _1798 = _1772 + (-1.0);
        _1766 = _1798;
    }
    float _1800 = _1766;
    float _1802 = _1800;
    if (_1716)
    {
        float _1804 = _1736 * _1794;
        _1726 = _1804;
    }
    float _1806 = _1726;
    if (!_1716)
    {
        _1738 = _1778;
    }
    float _1808 = _1738;
    float _1810 = _1808;
    if (_1716)
    {
        float _1812 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1790 = _1812;
    }
    float _1814 = _1790;
    if (_1716)
    {
        float _1816 = _1704 * _1806;
        _1728 = _1816;
    }
    float _1818 = _1728;
    if (!_1716)
    {
        _1796 = _1706;
    }
    float _1820 = _1796;
    float _1822 = _1820;
    if (_1716)
    {
        float _1824 = _1706 * _1806;
        _1822 = _1824;
    }
    float _1826 = _1822;
    if (!_1716)
    {
        _1802 = _1708;
    }
    float _1828 = _1802;
    float _1830 = _1828;
    if (_1716)
    {
        float _1832 = fma(_1778, _1772, _1814);
        _1810 = _1832;
    }
    float _1834 = _1810;
    if (_1716)
    {
        float _1836 = _1818 * _1818;
        _1830 = _1836;
    }
    float _1838 = _1830;
    if (!_1716)
    {
        _1780 = _1710;
    }
    float _1840 = _1780;
    float _1842 = _1840;
    if (_1716)
    {
        float _1844 = _1826 * _1826;
        _1842 = _1844;
    }
    float _1846 = _1842;
    float _1848 = fma(_1834, _1834, _1838);
    float _1850 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1852 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1854 = _1848 + _1846;
    float _1856 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1850);
    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1860 = fma(_1786, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1858);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1866 = rsqrt(_1854);
    float _1868 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    float _1870 = -_1862;
    float _1872 = _1870 + 1.0;
    float _1874 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1876 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1864);
    float _1878 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1880 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1852);
    float _1882 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1874);
    float _1884 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1876);
    float _1886 = abs(_1872);
    float _1888 = log2(_1886);
    float _1890 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1892 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1882);
    float _1894 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1896 = -_1890;
    float _1898 = fma(_1896, _1748, 1.0);
    float _1900 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _1902 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1904 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = _1866 * _1818;
    float _1908 = _1866 * _1834;
    float _1910 = _1866 * _1826;
    float _1912 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1914 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1916 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1918 = log2(_1898);
    float _1920 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1912);
    float _1922 = -_1914;
    float _1924 = fma(_1908, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1922);
    float _1926 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1928 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1930 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1920);
    float _1932 = -_1910;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1924);
    float _1936 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1938 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1928);
    float _1940 = exp2(_1926);
    float _1942 = fma(_1934, -0.5, 0.5);
    float _1944 = fma(_1934, 0.5, 0.5);
    float _1946 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1936);
    float _1948 = _1908 + 1.0;
    float _1950 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1938);
    float _1952 = fma(_1944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1946);
    float _1956 = 1.0 / _1930;
    float _1958 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1950);
    float _1960 = fma(_1944, _1952, -0.212114393711090087890625);
    float _1962 = _1918 * 0.693147182464599609375;
    float _1964 = fma(_1944, _1960, 1.570728778839111328125);
    float _1966 = sqrt(_1942);
    float _1968 = -_1908;
    float _1970 = fma(_1940, _1948, _1968);
    float _1972 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1954);
    float _1974 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1976 = fma(_1970, 0.5, 0.5);
    float _1978 = _1972 * _1956;
    float _1980 = _1958 * _1956;
    float _1982 = fma(_1978, 0.5, 0.5);
    float _1984 = fma(_1980, -0.5, 0.5);
    float _1986 = _1966 * 0.636619746685028076171875;
    float _1988 = -_1964;
    float _1990 = fma(_1986, _1988, 1.0);
    float3 _5014 = float3(_1982, _1984, _1974);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5014, float3(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5014, float3(0.0), isnan(_5014)), level(0.0)).x;
    float3 _5025 = float3(_1982, _1984, _1974);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5025, float3(0.0), isnan(_5025)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5025, float3(0.0), isnan(_5025)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _5042 = float2(_1990, _1976);
    float3 _2007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5042, float2(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5042, float2(0.0), isnan(_5042)), level(0.0)).xyz;
    float _2009 = _2007.x;
    float _2011 = _2007.y;
    float _2013 = _2007.z;
    float _2015 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2017 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2019 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2017);
    float _2021 = exp2(_2015);
    float _2023 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2019);
    float _2025 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2023);
    float _2027 = _2025 + _1930;
    out.gl_Position.x = _1972;
    out.gl_Position.y = _1958;
    out.gl_Position.z = _2025;
    out.gl_Position.w = _1930;
    float _2029 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2031 = _2027 * 0.5;
    float _2033 = -_2021;
    float _2035 = _2033 + 1.0;
    out.m_47.x = _2029;
    float _2037 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2031;
    out.m_64.w = _1930;
    float _2039 = _2037 * _1992;
    float _2041 = -_2037;
    float _2043 = _2041 + 1.0;
    float _2045 = _2003 * _2039;
    float _2047 = _2013 * _2039;
    float _2049 = _2003 * _2043;
    float _2051 = fma(_2009, _2045, _1997);
    float _2053 = fma(_2011, _2045, _1999);
    float _2055 = fma(_2003, _2047, _2001);
    out.m_66.x = _2051;
    out.m_66.y = _2053;
    out.m_66.z = _2055;
    out.m_66.w = _2049;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1548 = false;
    bool _371 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2112 = as_type<float>(_101);
        out.gl_Position.z = _2112;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_137);
        out.gl_Position.z = _2181;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _143 * _141;
    float _161 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _163 = in.m_49.x;
    float _165 = in.m_49.y;
    float _167 = in.m_49.z;
    float _169 = _161 * 6.283185482025146484375;
    float _171 = floor(_161);
    float _173 = _169 * 0.15915493667125701904296875;
    float _175 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _177 = 0.0;
    float _179 = _175;
    if (!_153)
    {
        float _181 = _175 * _175;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = cos(_187);
    float _191 = _185;
    if (!_153)
    {
        float _193 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    float _197 = -_171;
    float _199 = _161 + _197;
    bool _201 = !_153;
    float _203 = _195;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _175 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _175);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _175 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _179 = _257;
    }
    float _259 = _179;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = in.m_44.x;
    float _273 = in.m_44.y;
    float _275 = in.m_44.z;
    float _277 = fma(_189, 0.5, 0.5);
    bool _279 = _199 < 0.5;
    float _281 = float(_279);
    bool _283 = !_265;
    int _285 = _283 ? 0 : 1;
    float _287 = -_199;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _291 = !_157;
    int _293 = _291 ? 0 : 1;
    float _295 = -_281;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = -_277;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_285);
    float _307 = fma(_259, _163, _299);
    int _309 = abs(_293);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = fma(_259, _165, _311);
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _325 = float(_305);
    float _327 = fma(_317, _261, _273);
    float _329 = float(_309);
    float _331 = fma(_259, _167, _323);
    float _333 = abs(_289);
    float _335 = _325 * _333;
    float _337 = fma(_307, _261, _271);
    float _339 = fma(_331, _261, _275);
    float _341 = float(_321);
    float _343 = fma(_329, _303, _335);
    float _345 = abs(_297);
    float _347 = fma(_341, _345, _343);
    bool _349 = !_319;
    float _367;
    float _369;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = float(_85);
        float _357 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _359 = _357 * _351;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _355;
        _369 = _365;
        _371 = true;
    }
    else
    {
        float _373 = float(_85);
        float _375 = 1.0 / _373;
        float _377 = _119 * _375;
        _367 = _373;
        _369 = _377;
    }
    _371 = false;
    float _379 = _367;
    float _381 = _369;
    float _383 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _385 = int(_383);
    float _387 = as_type<float>(int(gl_VertexIndex));
    float _389 = _327 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _393 = int(_391);
    float _395 = float(_385);
    float _397 = 1.0 / _395;
    float _399 = float(uint(_393));
    int _401 = ~_393;
    int _403 = _401 + 1;
    float _405 = 1.0 / _399;
    int _407 = ~_393;
    int _409 = _407 + 1;
    int _411 = ~_393;
    int _413 = _411 + 1;
    float _415 = _119 * _397;
    float _417 = trunc(_415);
    int _419 = int(_417);
    int _421 = as_type<int>(_405) + (-2);
    float _423 = float(uint(_419));
    float _425 = as_type<float>(_421) * _423;
    float _427 = trunc(_425);
    float _429 = precise::max(_427, 0.0);
    uint _432 = uint(_429);
    float _434 = float(_419);
    int _436 = _403 * int(_432);
    int _438 = _436 + _419;
    float _440 = float(_393);
    float _442 = float(uint(_438));
    bool _444 = _434 >= _440;
    bool _446 = isnan(_434);
    bool _448 = _444 || _446;
    bool _450 = isnan(_440);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = as_type<float>(_421) * _442;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _460 = _458 != 0;
    bool _462 = !_460;
    float _464 = _462 ? 7.345489978790283203125 : 1.0;
    float _466 = trunc(_456);
    float _468 = precise::max(_466, 0.0);
    uint _470 = uint(_468);
    float _472 = _464 * _139;
    float _474 = floor(_472);
    int _476 = int(_432) + int(_470);
    float _478 = trunc(_454);
    int _480 = int(_478);
    int _482 = _409 * _476;
    int _484 = _482 + _419;
    float _486 = -_474;
    float _488 = _472 + _486;
    bool _490 = uint(_484) >= uint(_393);
    float _492 = _488 * _440;
    float _494 = 1.0 / _379;
    float _496 = _119 * _440;
    bool _498 = !_490;
    int _500 = _498 ? 0 : (-1);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = ~_476;
    int _516 = _514 + _500;
    int _518 = _516 + 1;
    bool _520 = _393 == 0;
    float _522 = trunc(_492);
    int _524 = int(_522);
    int _526 = ~_480;
    int _528 = _526 + 1;
    int _530 = _528 + 1;
    int _532 = _393 * _518;
    int _534 = _532 + _419;
    int _536 = _393 + (-1);
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _540 = _538 != 0;
    float _542 = _496 * _494;
    bool _544 = !_520;
    int _546 = _544 ? _534 : (-1);
    bool _548 = !_540;
    int _550 = _548 ? 0 : 1;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _554 = _552 != 0;
    int _556 = _546 * _530;
    float _558 = trunc(_542);
    int _560 = int(_558);
    bool _562 = !_508;
    int _564 = _562 ? 0 : 1;
    int _566 = _480 * _536;
    int _568 = _566 + _556;
    bool _570 = !_504;
    int _572 = _570 ? 0 : 1;
    int _574 = abs(_564);
    bool _576 = !_512;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_550);
    int _582 = abs(_572);
    bool _584 = !_554;
    int _586 = _584 ? 0 : 1;
    int _588 = _524 * _580;
    int _590 = _588 + _419;
    int _592 = abs(_578);
    int _594 = _568 * _574;
    int _596 = abs(_586);
    int _598 = _560 * _582;
    int _600 = _598 + _594;
    int _602 = ~_393;
    int _604 = _602 + 1;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _608 = _606 != 0;
    int _610 = _590 * _592;
    int _612 = _610 + _600;
    int _614 = ~_393;
    int _616 = _614 + 1;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _620 = _618 != 0;
    int _622 = _524 * _596;
    int _624 = _622 + _612;
    float _626 = float(uint(_624));
    float _628 = as_type<float>(_421) * _626;
    float _630 = trunc(_628);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    int _636 = _616 * int(_634);
    int _638 = _636 + _624;
    float _640 = float(uint(_638));
    int _642 = ~_393;
    int _644 = _642 + 1;
    float _646 = as_type<float>(_421) * _640;
    float _648 = trunc(_646);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    int _654 = int(_634) + int(_652);
    int _656 = _604 * _654;
    int _658 = _656 + _624;
    bool _660 = uint(_658) >= uint(_393);
    float _662 = float(uint(_590));
    bool _664 = !_660;
    int _666 = _664 ? 0 : (-1);
    float _668 = as_type<float>(_421) * _662;
    int _670 = ~_654;
    int _672 = _670 + _666;
    int _674 = _672 + 1;
    float _676 = trunc(_668);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = _393 * _674;
    int _684 = _682 + _624;
    bool _686 = !_520;
    int _688 = _686 ? _684 : (-1);
    int _690 = _688 >> 31;
    int _692 = _688 & 3;
    bool _694 = _692 != 0;
    int _696 = _690 & 3;
    int _698 = _644 * int(_680);
    int _700 = _698 + _590;
    bool _702 = uint(_692) > 1u;
    int _704 = _688 + _696;
    float _706 = float(uint(_700));
    int _708 = _704 >> 2;
    int _710 = _688 & 3;
    bool _712 = _710 != 0;
    float _714 = as_type<float>(_421) * _706;
    int _716 = _708 << 4;
    int _718 = _716 + 368;
    float _720 = _327 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _722 = _712 ? 0 : 1;
    float _724 = trunc(_714);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = uint(int(uint(_718) >> uint(2)));
    uint _732 = uint(int(uint(int(_730)) >> uint(2)));
    int _734 = int(_730) & 3;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[int(_732)][_734];
    int _738 = int(_730) + 1;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    int _742 = _738 & 3;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[int(_740)][_742];
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _748 = _746 != 0;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _750;
    int _754 = ~_722;
    int _756 = _754 + 1;
    int _758 = _756 + 1;
    int _760 = _758;
    if (!_702)
    {
        int _762 = ~_722;
        int _764 = _762 + 1;
        _760 = _764;
    }
    int _766 = _760;
    float _768 = _327 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _770 = uint(_692) >= 2u;
    int _772 = _718 + 8;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    uint _776 = uint(int(uint(int(_774)) >> uint(2)));
    int _778 = int(_774) & 3;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[int(_776)][_778];
    int _782 = int(_774) + 1;
    uint _784 = uint(int(uint(_782) >> uint(2)));
    int _786 = _782 & 3;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[int(_784)][_786];
    bool _790 = _692 != 3;
    float _792 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _768);
    bool _794 = !_694;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _720);
    int _800 = _770 ? 0 : 1;
    float _802 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _389);
    int _804 = as_type<int>(_387) & 1;
    bool _806 = _804 != 0;
    int _808 = as_type<int>(_387) & 2;
    bool _810 = _808 != 0;
    bool _812 = !_790;
    int _814 = _812 ? 0 : (-1);
    bool _816 = _692 != 3;
    float _818 = 1.0 / _752;
    int _820 = int(_680) + int(_728);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _826 = abs(_766);
    int _828 = ~_800;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    int _834 = _413 * _820;
    int _836 = _834 + _590;
    int _838 = abs(_796);
    float _840 = 1.0 / _824;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _844 = _381 + _842;
    int _846 = _832;
    if (_816)
    {
        int _848 = ~_800;
        int _850 = _848 + 1;
        _846 = _850;
    }
    int _852 = _846;
    bool _854 = uint(_836) >= uint(_393);
    int _856 = ~_826;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _844 * _818;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _866 = _381 + _864;
    bool _868 = !_854;
    int _870 = _868 ? 0 : (-1);
    int _872 = ~_838;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = ~_820;
    int _880 = _878 + _870;
    int _882 = _880 + 1;
    float _884 = _866 * _840;
    int _886 = abs(_814);
    float _888 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _890 = int(_888);
    int _892 = _860 * as_type<int>(_744);
    int _894 = abs(_852);
    int _896 = _393 * _882;
    int _898 = _896 + _590;
    int _900 = ~_886;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = _876 * as_type<int>(_736);
    int _908 = _906 + _892;
    int _910 = ~_894;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _916;
    bool _920 = !_608;
    int _922 = _920 ? 0 : 1;
    int _924 = _914 * as_type<int>(_780);
    int _926 = _924 + _908;
    float _928 = fma(_918, _862, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _930;
    bool _934 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _936 = isnan(_381);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    int _946 = _904 * as_type<int>(_788);
    int _948 = _946 + _926;
    bool _950 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _952 = isnan(_381);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = fma(_932, _862, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _964 = abs(_890);
    float _966 = -_944;
    float _968 = _966 + 1.0;
    int _970 = abs(_922);
    float _972 = -_960;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _980 = float(uint(_890));
    float _982 = _944 * _974;
    float _984 = 1.0 / _980;
    bool _986 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _988 = isnan(_381);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1002 = float(uint(_964));
    float _1004 = fma(_978, _884, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _1006 = ~_970;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = fma(_1000, _884, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1014 = _996 * _968;
    bool _1016 = !_520;
    int _1018 = _1016 ? _898 : (-1);
    float _1020 = 1.0 / _1002;
    int _1022 = _948 * _1010;
    float _1024 = _928 * _1014;
    float _1026 = _962 * _1014;
    float _1028 = -_996;
    float _1030 = _1028 + 1.0;
    int _1032 = _1018 * _970;
    int _1034 = _1032 + _1022;
    float _1036 = in.m_53.x;
    float _1038 = in.m_53.y;
    float _1040 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1024);
    float _1042 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1026);
    int _1044 = as_type<int>(_984) + (-2);
    float _1046 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1048 = float(uint(_1034));
    float _1050 = fma(_1004, _982, _1042);
    int _1052 = abs(_1034);
    float _1054 = fma(_1012, _982, _1040);
    int _1056 = as_type<int>(_1020) + (-2);
    float _1058 = as_type<float>(_1044) * _1048;
    float _1060 = float(uint(_1052));
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1064 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1054);
    float _1066 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1050);
    float _1068 = as_type<float>(_1056) * _1060;
    float _1070 = trunc(_1058);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1078 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1062);
    bool _1080 = _139 > 0.5;
    float _1082 = in.m_51.y;
    float _1084 = -_1076;
    float _1086 = fma(_1046, 2.0, _1084);
    float _1088 = _1064 * _1036;
    float _1090 = trunc(_1068);
    float _1092 = precise::max(_1090, 0.0);
    uint _1094 = uint(_1092);
    int _1096 = ~_890;
    int _1098 = _1096 + 1;
    float _1100 = _1066 * _1038;
    bool _1102 = !_810;
    float _1104 = _1102 ? (-0.5) : 0.5;
    float _1106 = _347 * _1088;
    int _1108 = ~_964;
    int _1110 = _1108 + 1;
    float _1112 = _347 * _1100;
    bool _1114 = !_806;
    float _1116 = _1114 ? (-0.5) : 0.5;
    int _1118 = _1098 * int(_1074);
    int _1120 = _1118 + _1034;
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1104);
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1126 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1116);
    float _1130 = float(uint(_1120));
    float _1132 = _1124 * _1122;
    int _1134 = _1110 * int(_1094);
    int _1136 = _1134 + _1052;
    float _1138 = _1126 * _1128;
    float _1140 = as_type<float>(_1044) * _1130;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1144 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1146 = float(uint(_1136));
    float _1148 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1150 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].z, _792);
    float _1152 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1144);
    float _1154 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].z, _802);
    float _1156 = as_type<float>(_1056) * _1146;
    float _1158 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1142);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1152);
    float _1162 = _1150 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1164 = trunc(_1156);
    float _1166 = precise::max(_1164, 0.0);
    uint _1168 = uint(_1166);
    float _1170 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1158);
    float _1172 = _1154 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1174 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1182 = _1172 + _1174;
    float _1184 = trunc(_1140);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = _1162 + _1178;
    float _1192 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1194 = _1082 > 0.5;
    float _1196 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1176);
    float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1200 = _1190 + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1204 = _1182 + _1202;
    float _1206 = fma(_1192, -2.0, _1180);
    int _1208 = ~_964;
    int _1210 = _1208 + 1;
    float _1212 = _1200 * _1200;
    float _1214 = _1204 * _1204;
    int _1216 = int(_1094) + int(_1168);
    float _1218 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    int _1220 = ~_890;
    int _1222 = _1220 + 1;
    float _1224 = _1212 + _1214;
    float _1226 = -_1104;
    int _1228 = _1194 ? as_type<int>(_1226) : as_type<int>(_1104);
    int _1230 = _1210 * _1216;
    int _1232 = _1230 + _1052;
    int _1234 = int(_1074) + int(_1188);
    float _1236 = -_119;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1086);
    float _1240 = sqrt(_1224);
    float _1242 = -_1116;
    int _1244 = _1080 ? as_type<int>(_1242) : as_type<int>(_1116);
    int _1246 = _1222 * _1234;
    int _1248 = _1246 + _1034;
    bool _1250 = uint(_1232) >= uint(_964);
    float _1252 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1254 = _1034 ^ _890;
    bool _1256 = uint(_1248) >= uint(_890);
    float _1258 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1252);
    bool _1260 = !_1250;
    int _1262 = _1260 ? 0 : (-1);
    uint _1264 = uint(int(uint(_1254) >> uint(31)));
    float _1266 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1258);
    bool _1268 = !_620;
    float _1270 = _1268 ? _1116 : as_type<float>(_1244);
    float _1272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1274 = !_1256;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1280 = ~_1262;
    int _1282 = _1216 + _1280;
    int _1284 = _1282 + 1;
    int _1286 = ~int(_1264);
    int _1288 = _1286 + 1;
    bool _1290 = !_748;
    float _1292 = _1290 ? _1104 : as_type<float>(_1228);
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1296 = ~_1234;
    int _1298 = _1296 + _1276;
    int _1300 = _1298 + 1;
    bool _1302 = _1240 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1304 = _1284 ^ _1288;
    int _1306 = _890 * _1300;
    int _1308 = _1306 + _1034;
    bool _1310 = _890 == 0;
    int _1312 = ~_1288;
    int _1314 = _1312 + _1304;
    int _1316 = _1314 + 1;
    float _1318 = _1218 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1320 = !_1310;
    float _1322 = _1320 ? as_type<float>(_1308) : as_type<float>(0xffffffffu /* nan */);
    bool _1324 = _890 == 0;
    float _1326 = _1318 + _1278;
    float _1328 = float(as_type<int>(_1322));
    float _1330 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1332 = _1218;
    float _1334 = as_type<float>(_890);
    float _1336 = _1190;
    float _1338 = _1322;
    float _1340 = _1212;
    float _1342 = _1172;
    if (!_1302)
    {
        _1332 = _1190;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (!_1302)
    {
        _1334 = _1214;
    }
    float _1348 = _1334;
    float _1350 = _1348;
    if (!_1302)
    {
        _1336 = _1182;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (!_1302)
    {
        _1338 = _1326;
    }
    float _1356 = _1338;
    bool _1358 = !_1302;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1240 + _1364;
        float _1368 = rsqrt(_1224);
        float _1370 = _1366 * _1362;
        float _1372 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = _1370 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = cos(_1380);
        float _1384 = fma(_1378, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1386 = _1368 * _1384;
        float _1388 = _1382 + (-1.0);
        float _1390 = fma(_1200, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1392 = fma(_1204, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1394 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _1390 + _1396;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1402 = _1392 + _1400;
        float _1404 = fma(_1326, _1382, _1394);
        float _1406 = _1398 * _1398;
        float _1408 = _1402 * _1402;
        _1360 = _1404;
        _1340 = _1406;
        _1350 = _1408;
        _1346 = _1390;
        _1354 = _1392;
    }
    float _1410 = _1360;
    float _1412 = _1340;
    float _1414 = _1350;
    float _1416 = _1346;
    float _1418 = _1354;
    float _1420 = fma(_1330, _1328, _1238);
    bool _1422 = !_1324;
    int _1424 = _1422 ? _1316 : (-1);
    float _1426 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1430 = _1410 + _1428;
    float _1432 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1206);
    float _1434 = float(_1424);
    float _1436 = _1270 + 0.5;
    float _1438 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1078);
    float _1440 = fma(_1430, _1430, _1412);
    float _1442 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1196);
    float _1444 = -_1432;
    float _1446 = fma(_1426, _1434, _1444);
    float _1448 = _1292 + (-0.5);
    float _1450 = fma(_1330, _1436, _1420);
    float _1452 = -_1438;
    float _1454 = _1452 + 1.0;
    float _1456 = _1440 + _1414;
    float _1458 = -_1426;
    float _1460 = fma(_1458, _1448, _1446);
    float _1462 = -_1454;
    float _1464 = fma(_1270, _1462, _1450);
    float _1466 = -_1442;
    float _1468 = _1466 + 1.0;
    float _1470 = sqrt(_1456);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1484 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1488 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = fma(_1292, _1468, _1460);
    out.m_58.x = _1484;
    out.m_58.y = _1488;
    out.m_58.z = _1490;
    out.m_58.w = _1486;
    bool _1500 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1502 = isnan(_1470);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1508 = _1504 || _1506;
    out.m_60.x = _1492;
    out.m_60.y = _1494;
    out.m_60.z = _1496;
    out.m_62.x = _1464;
    out.m_62.y = _1498;
    float _1510 = _1468;
    float _1512 = _1488;
    if (!_1508)
    {
        _1510 = 1.0;
    }
    float _1514 = _1510;
    bool _1516 = !_1508;
    float _1518 = _1514;
    if (!_1516)
    {
        bool _1520 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1522 = isnan(_1470);
        bool _1524 = _1520 || _1522;
        bool _1526 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1528 = _1524 || _1526;
        if (!_1528)
        {
            float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1532 = _1470 + _1530;
            float _1534 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1536 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1534;
            float _1538 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1540 = _1538 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1542 = 1.0 / _1536;
            float _1544 = _1532 * _1542;
            float _1546 = fma(_1544, _1540, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1518 = _1546;
            _1548 = true;
        }
        else
        {
            bool _1550 = _1470 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1552 = isnan(_1470);
            bool _1554 = _1550 || _1552;
            bool _1556 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1558 = _1554 || _1556;
            if (!_1558)
            {
                float _1560 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1562 = _1470 + _1560;
                float _1564 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1566 = _1564 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1568 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1570 = _1568 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1572 = 1.0 / _1566;
                float _1574 = _1562 * _1572;
                float _1576 = fma(_1574, _1570, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1518 = _1576;
                _1548 = true;
            }
            else
            {
                _1518 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1548 = false;
    float _1578 = _1518;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1582 = _1416 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1586 = _1410 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1590 = _1418 + _1588;
    bool _1592 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1596 = _1592 || _1594;
    bool _1598 = isnan(0.5);
    bool _1600 = _1596 || _1598;
    float _1602 = fma(_1582, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1604 = fma(_1586, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1606 = fma(_1590, _1578, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1610 = _1578;
    float _1612 = _1604;
    if (_1600)
    {
        _1608 = _1602;
    }
    float _1614 = _1608;
    float _1616 = _1614;
    if (_1600)
    {
        _1512 = _1604;
    }
    float _1618 = _1512;
    float _1620 = _1618;
    if (_1600)
    {
        _1610 = _1606;
    }
    float _1622 = _1610;
    float _1624 = _1622;
    if (!_1600)
    {
        float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1628 = _1318 + _1626;
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1632 = _1162 + _1630;
        float _1634 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1636 = _1628 * _1628;
        float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1640 = _1172 + _1638;
        float _1642 = fma(_1632, _1632, _1636);
        float _1644 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1646 = fma(_1640, _1640, _1642);
        float _1648 = sqrt(_1646);
        float _1650 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1652 = -_1318;
        float _1654 = _1652 + _1604;
        float _1656 = precise::min(_1648, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1658 = _1656 * _1644;
        float _1660 = -_1162;
        float _1662 = _1660 + _1602;
        float _1664 = _1650 * _1658;
        float _1666 = -_1172;
        float _1668 = _1666 + _1606;
        float _1670 = fma(_1662, _1664, _1162);
        float _1672 = fma(_1654, _1664, _1318);
        float _1674 = fma(_1668, _1664, _1172);
        _1620 = _1672;
        _1616 = _1670;
        _1624 = _1674;
    }
    float _1676 = _1620;
    float _1678 = _1616;
    float _1680 = _1624;
    float _1682 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1684 = _1676 + _1682;
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1688 = _1678 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1692 = _1680 + _1690;
    float _1694 = _1684 * _1684;
    float _1696 = fma(_1688, _1688, _1694);
    float _1698 = fma(_1692, _1692, _1696);
    float _1700 = rsqrt(_1698);
    float _1702 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1704 = _1688 * _1702;
    float _1706 = _1692 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 * _1706;
    float _1712 = _1708 + _1710;
    float _1714 = sqrt(_1712);
    bool _1716 = _1714 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1720 = _1714 + _1718;
    float _1722 = _1700;
    float _1724 = _1720;
    float _1726 = _1702;
    float _1728 = _1704;
    if (_1716)
    {
        float _1730 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1722 = _1730;
    }
    float _1732 = _1722;
    if (_1716)
    {
        float _1734 = rsqrt(_1712);
        _1342 = _1734;
    }
    float _1736 = _1342;
    float _1738 = _1736;
    if (_1716)
    {
        float _1740 = _1720 * _1732;
        _1724 = _1740;
    }
    float _1742 = _1724;
    if (_1716)
    {
        float _1744 = _1742 * 0.15915493667125701904296875;
        _1612 = _1744;
    }
    float _1746 = _1612;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1750 = _1318;
    if (_1716)
    {
        float _1752 = _1746 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        _1750 = _1754;
    }
    float _1756 = _1750;
    float _1758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1760 = precise::max(0.0, _1758);
    float _1762 = _1692;
    float _1764 = _1760;
    float _1766 = _1758;
    if (_1716)
    {
        float _1768 = _1746 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        _1762 = _1770;
    }
    float _1772 = _1762;
    float _1774 = -_1702;
    float _1776 = -_1760;
    float _1778 = fma(_1684, _1774, _1776);
    float _1780 = _1778;
    if (_1716)
    {
        float _1782 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1782;
    }
    float _1784 = _1764;
    float _1786 = sqrt(_1698);
    float _1788 = _1756;
    float _1790 = _1784;
    if (_1716)
    {
        float _1792 = fma(_1756, _1784, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1788 = _1792;
    }
    float _1794 = _1788;
    float _1796 = _1794;
    if (_1716)
    {
        float _1798 = _1772 + (-1.0);
        _1766 = _1798;
    }
    float _1800 = _1766;
    float _1802 = _1800;
    if (_1716)
    {
        float _1804 = _1736 * _1794;
        _1726 = _1804;
    }
    float _1806 = _1726;
    if (!_1716)
    {
        _1738 = _1778;
    }
    float _1808 = _1738;
    float _1810 = _1808;
    if (_1716)
    {
        float _1812 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1790 = _1812;
    }
    float _1814 = _1790;
    if (_1716)
    {
        float _1816 = _1704 * _1806;
        _1728 = _1816;
    }
    float _1818 = _1728;
    if (!_1716)
    {
        _1796 = _1706;
    }
    float _1820 = _1796;
    float _1822 = _1820;
    if (_1716)
    {
        float _1824 = _1706 * _1806;
        _1822 = _1824;
    }
    float _1826 = _1822;
    if (!_1716)
    {
        _1802 = _1708;
    }
    float _1828 = _1802;
    float _1830 = _1828;
    if (_1716)
    {
        float _1832 = fma(_1778, _1772, _1814);
        _1810 = _1832;
    }
    float _1834 = _1810;
    if (_1716)
    {
        float _1836 = _1818 * _1818;
        _1830 = _1836;
    }
    float _1838 = _1830;
    if (!_1716)
    {
        _1780 = _1710;
    }
    float _1840 = _1780;
    float _1842 = _1840;
    if (_1716)
    {
        float _1844 = _1826 * _1826;
        _1842 = _1844;
    }
    float _1846 = _1842;
    float _1848 = fma(_1834, _1834, _1838);
    float _1850 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1852 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1854 = _1848 + _1846;
    float _1856 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1850);
    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1860 = fma(_1786, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1858);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1866 = rsqrt(_1854);
    float _1868 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1856);
    float _1870 = -_1862;
    float _1872 = _1870 + 1.0;
    float _1874 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1876 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1864);
    float _1878 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1880 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1852);
    float _1882 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1874);
    float _1884 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1876);
    float _1886 = abs(_1872);
    float _1888 = log2(_1886);
    float _1890 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1892 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1882);
    float _1894 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1896 = -_1890;
    float _1898 = fma(_1896, _1748, 1.0);
    float _1900 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _1902 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1904 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = _1866 * _1818;
    float _1908 = _1866 * _1834;
    float _1910 = _1866 * _1826;
    float _1912 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1914 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1916 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1918 = log2(_1898);
    float _1920 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1912);
    float _1922 = -_1914;
    float _1924 = fma(_1908, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1922);
    float _1926 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1928 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1930 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1920);
    float _1932 = -_1910;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1924);
    float _1936 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1938 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1928);
    float _1940 = exp2(_1926);
    float _1942 = fma(_1934, -0.5, 0.5);
    float _1944 = fma(_1934, 0.5, 0.5);
    float _1946 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1936);
    float _1948 = _1908 + 1.0;
    float _1950 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1938);
    float _1952 = fma(_1944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1954 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1946);
    float _1956 = 1.0 / _1930;
    float _1958 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1950);
    float _1960 = fma(_1944, _1952, -0.212114393711090087890625);
    float _1962 = _1918 * 0.693147182464599609375;
    float _1964 = fma(_1944, _1960, 1.570728778839111328125);
    float _1966 = sqrt(_1942);
    float _1968 = -_1908;
    float _1970 = fma(_1940, _1948, _1968);
    float _1972 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1954);
    float _1974 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1976 = fma(_1970, 0.5, 0.5);
    float _1978 = _1972 * _1956;
    float _1980 = _1958 * _1956;
    float _1982 = fma(_1978, 0.5, 0.5);
    float _1984 = fma(_1980, -0.5, 0.5);
    float _1986 = _1966 * 0.636619746685028076171875;
    float _1988 = -_1964;
    float _1990 = fma(_1986, _1988, 1.0);
    float3 _5014 = float3(_1982, _1984, _1974);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5014, float3(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5014, float3(0.0), isnan(_5014)), level(0.0)).x;
    float3 _5025 = float3(_1982, _1984, _1974);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5025, float3(0.0), isnan(_5025)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5025, float3(0.0), isnan(_5025)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _5042 = float2(_1990, _1976);
    float3 _2007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5042, float2(0.0), isnan(_5042)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5042, float2(0.0), isnan(_5042)), level(0.0)).xyz;
    float _2009 = _2007.x;
    float _2011 = _2007.y;
    float _2013 = _2007.z;
    float _2015 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2017 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2019 = fma(_1902, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2017);
    float _2021 = exp2(_2015);
    float _2023 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2019);
    float _2025 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2023);
    float _2027 = _2025 + _1930;
    out.gl_Position.x = _1972;
    out.gl_Position.y = _1958;
    out.gl_Position.z = _2025;
    out.gl_Position.w = _1930;
    float _2029 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2031 = _2027 * 0.5;
    float _2033 = -_2021;
    float _2035 = _2033 + 1.0;
    out.m_47.x = _2029;
    float _2037 = _2035 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2031;
    out.m_64.w = _1930;
    float _2039 = _2037 * _1992;
    float _2041 = -_2037;
    float _2043 = _2041 + 1.0;
    float _2045 = _2003 * _2039;
    float _2047 = _2013 * _2039;
    float _2049 = _2003 * _2043;
    float _2051 = fma(_2009, _2045, _1997);
    float _2053 = fma(_2011, _2045, _1999);
    float _2055 = fma(_2003, _2047, _2001);
    out.m_66.x = _2051;
    out.m_66.y = _2053;
    out.m_66.z = _2055;
    out.m_66.w = _2049;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

