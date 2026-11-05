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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_81)
    {
        float _89 = _85 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2021 = as_type<float>(_91);
        out.gl_Position.z = _2021;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _95 = in.m_35.w;
    float _97 = float(_77);
    float _99 = 1.0 / _97;
    float _101 = -_95;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_95);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = _103 * _99;
    bool _117 = _103 >= _97;
    bool _119 = !_113;
    bool _121 = _117 || _119;
    out.m_37.x = _115;
    float _123 = _95;
    float _125 = _115;
    float _127 = _103;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _131 = _129 * 5.0;
        _93 = as_type<int>(_131);
    }
    int _133 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_133);
        out.gl_Position.z = _2094;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _139 = in.m_42.w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    float _163 = 0.0;
    float _165 = _137;
    if (!_149)
    {
        float _167 = _137 * _137;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    int _179 = as_type<int>(_135) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_135) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_149;
    float _197 = _177;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _137 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _137);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_149;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _137 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _165 = _251;
    }
    float _253 = _165;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _151, _257);
    float _265 = fma(_253, _153, _259);
    float _267 = fma(_253, _155, _261);
    float _269 = fma(_263, _139, _157);
    float _271 = fma(_265, _139, _159);
    float _273 = fma(_267, _139, _161);
    bool _275 = !_255;
    if (!_275)
    {
        float _277 = in.m_44.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _125 = _291;
    }
    float _293 = _125;
    float _295 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _297 = int(_295);
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _301 = _299 != 0;
    float _303 = in.m_44.z;
    float _305 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _307 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _309 = int(_307);
    float _311 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _305);
    out.m_46.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _293 + _313;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_301)
    {
        _317 = 1.0;
    }
    float _319 = _317;
    float _321 = float(_297);
    float _323 = _319;
    if (!_301)
    {
        _323 = 7.345489978790283203125;
    }
    float _325 = _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _329 = 1.0 + _327;
    float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _333 = log2(_331);
    out.m_33.x = 1.0;
    float _335 = float(uint(_309));
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _339 = 1.0 / _321;
    int _341 = ~_309;
    int _343 = _341 + 1;
    float _345 = _303 * 2.0;
    int _347 = ~_309;
    int _349 = _347 + 1;
    float _351 = float(_309);
    int _353 = ~_309;
    int _355 = _353 + 1;
    float _357 = 1.0 / _335;
    float _359 = _339 * _103;
    float _361 = floor(_345);
    int _363 = as_type<int>(_357) + (-2);
    float _365 = trunc(_359);
    int _367 = int(_365);
    float _369 = 1.0 / _329;
    float _371 = float(uint(_367));
    float _373 = float(_367);
    float _375 = as_type<float>(_363) * _371;
    bool _377 = _373 >= _351;
    bool _379 = isnan(_373);
    bool _381 = _377 || _379;
    bool _383 = isnan(_351);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = trunc(_375);
    float _391 = precise::max(_389, 0.0);
    uint _394 = uint(_391);
    int _396 = _343 * int(_394);
    int _398 = _396 + _367;
    float _400 = in.m_44.x;
    float _402 = in.m_44.y;
    float _404 = float(uint(_398));
    float _406 = as_type<float>(_363) * _404;
    float _408 = trunc(_406);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    float _414 = _400 * _325;
    float _416 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _337);
    float _418 = floor(_414);
    int _420 = int(_394) + int(_412);
    int _422 = _349 * _420;
    int _424 = _422 + _367;
    float _426 = trunc(_387);
    int _428 = int(_426);
    bool _430 = uint(_424) >= uint(_309);
    bool _432 = !_430;
    int _434 = _432 ? 0 : (-1);
    float _436 = _351 * _103;
    bool _438 = _309 == 0;
    int _440 = ~_420;
    int _442 = _440 + _434;
    int _444 = _442 + 1;
    float _446 = -_418;
    float _448 = _414 + _446;
    float _450 = _436 * _99;
    int _452 = _309 * _444;
    int _454 = _452 + _367;
    int _456 = ~_428;
    int _458 = _456 + 1;
    int _460 = _458 + 1;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _472 = _470 != 0;
    float _474 = trunc(_450);
    int _476 = int(_474);
    bool _478 = !_438;
    int _480 = _478 ? _454 : (-1);
    float _482 = _448 * _351;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _486 = _484 != 0;
    bool _488 = !_468;
    int _490 = _488 ? 0 : 1;
    int _492 = _480 * _460;
    int _494 = _309 + (-1);
    float _496 = trunc(_482);
    int _498 = int(_496);
    bool _500 = !_486;
    int _502 = _500 ? 0 : 1;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _506 = _504 != 0;
    int _508 = _428 * _494;
    int _510 = _508 + _492;
    bool _512 = !_464;
    int _514 = _512 ? 0 : 1;
    int _516 = abs(_490);
    bool _518 = !_472;
    int _520 = _518 ? 0 : 1;
    int _522 = abs(_502);
    int _524 = abs(_514);
    bool _526 = !_506;
    int _528 = _526 ? 0 : 1;
    int _530 = _498 * _522;
    int _532 = _530 + _367;
    int _534 = abs(_520);
    int _536 = _510 * _516;
    int _538 = abs(_528);
    int _540 = _476 * _524;
    int _542 = _540 + _536;
    int _544 = ~_309;
    int _546 = _544 + 1;
    int _548 = _532 * _534;
    int _550 = _548 + _542;
    int _552 = ~_309;
    int _554 = _552 + 1;
    int _556 = _498 * _538;
    int _558 = _556 + _550;
    float _560 = float(uint(_558));
    float _562 = as_type<float>(_363) * _560;
    float _564 = trunc(_562);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = _554 * int(_568);
    int _572 = _570 + _558;
    float _574 = float(uint(_572));
    float _576 = as_type<float>(_363) * _574;
    float _578 = trunc(_576);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    int _584 = int(_568) + int(_582);
    float _586 = _400 * 2.0;
    int _588 = _546 * _584;
    int _590 = _588 + _558;
    float _592 = floor(_586);
    bool _594 = uint(_590) >= uint(_309);
    float _596 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _598 = !_594;
    int _600 = _598 ? 0 : (-1);
    float _602 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _596);
    float _604 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _606 = ~_584;
    int _608 = _606 + _600;
    int _610 = _608 + 1;
    float _612 = _402 * 2.0;
    float _614 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _602);
    bool _616 = _592 >= 0.0;
    bool _618 = isnan(_592);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    int _626 = _309 * _610;
    int _628 = _626 + _558;
    float _630 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _632 = floor(_612);
    int _634 = _624 ? 0 : 1;
    bool _636 = !_438;
    int _638 = _636 ? _628 : (-1);
    int _640 = _638 & 3;
    bool _642 = _640 != 0;
    int _644 = _638 & 3;
    bool _646 = _644 != 0;
    bool _648 = uint(_640) >= 2u;
    int _650 = _646 ? 0 : 1;
    bool _652 = _592 > 0.0;
    int _654 = _648 ? 0 : 1;
    bool _656 = uint(_640) > 1u;
    bool _658 = _632 > 0.0;
    bool _660 = _640 != 3;
    bool _662 = _632 >= 0.0;
    bool _664 = isnan(_632);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    int _672 = ~_650;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    int _678 = _670 ? 0 : 1;
    int _680 = ~_654;
    int _682 = _680 + 1;
    int _684 = _682 + 1;
    int _686 = ~_678;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    int _692 = _676;
    int _694 = _690;
    int _696 = _684;
    if (!_656)
    {
        int _698 = ~_650;
        int _700 = _698 + 1;
        _692 = _700;
    }
    int _702 = _692;
    if (!_658)
    {
        int _704 = ~_678;
        int _706 = _704 + 1;
        _694 = _706;
    }
    int _708 = _694;
    int _710 = ~_634;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    int _716 = _714;
    if (_660)
    {
        int _718 = ~_654;
        int _720 = _718 + 1;
        _696 = _720;
    }
    int _722 = _696;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _734 = _732 != 0;
    if (!_652)
    {
        int _736 = ~_634;
        int _738 = _736 + 1;
        _716 = _738;
    }
    int _740 = _716;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _742;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _748 = _746 != 0;
    bool _750 = !_730;
    int _752 = _750 ? 0 : 1;
    float _754 = 1.0 / _744;
    bool _756 = !_748;
    int _758 = _756 ? 0 : 1;
    bool _760 = !_734;
    int _762 = _760 ? 0 : 1;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _774 = _772 != 0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _776;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _782 = _780 != 0;
    float _784 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _790 = 1.0 / _778;
    float _792 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _784);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _796 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _798 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _311);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _802 = 1.0 / _788;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _806 = _293 + _804;
    float _808 = -_794;
    float _810 = fma(_604, 2.0, _808);
    float _812 = _333 * _103;
    float _814 = _303 + _400;
    float _816 = _806 * _754;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _820 = _293 + _818;
    float _822 = 0.0;
    bool _824 = _766;
    if (_770)
    {
        float _826 = in.m_44.x;
        _822 = _826;
    }
    float _828 = _822;
    float _830 = _814 + (-1.0);
    float _832 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _834 = exp2(_812);
    float _836 = _315 * _790;
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _840 = fma(_832, -2.0, _800);
    float _842 = _402 + _400;
    float _844 = _402 + _303;
    float _846 = _820 * _802;
    float _848 = _842 + (-1.0);
    float _850 = _802;
    if (_766)
    {
        float _852 = in.m_44.w;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = _844 + (-1.0);
    float _858 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _860 = !_726;
    int _862 = _860 ? 0 : 1;
    float _864 = _796 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _866 = _361 >= 0.0;
    bool _868 = isnan(_361);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    float _876 = -_834;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _880;
    int _884 = _874 ? 0 : 1;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _890 = _361 > 0.0;
    float _892 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _894 = ~_884;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _900;
    bool _904 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _906 = isnan(_293);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _920 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _922 = isnan(_293);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = fma(_888, _846, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _934 = fma(_882, _816, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _936 = fma(_918, _846, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _938 = fma(_902, _816, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _940 = _854;
    int _942 = _898;
    float _944 = _938;
    if (_766)
    {
        float _946 = _854 * 3.1415927410125732421875;
        _940 = _946;
    }
    float _948 = _940;
    if (!_890)
    {
        int _950 = ~_884;
        int _952 = _950 + 1;
        _942 = _952;
    }
    int _954 = _942;
    float _956 = _798 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _958 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _960 = isnan(_293);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = 0.0;
    if (_766)
    {
        float _972 = _948 * 0.15915493667125701904296875;
        _970 = _972;
    }
    float _974 = _970;
    bool _976 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _978 = isnan(_293);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _303 + (-0.5);
    bool _990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    int _1000 = abs(_862);
    float _1002 = -_986;
    float _1004 = _1002 + 1.0;
    float _1006 = _998 ? _878 : 0.0;
    float _1008 = _974;
    if (_766)
    {
        float _1010 = _974 * 6.283185482025146484375;
        float _1012 = sin(_1010);
        _1008 = _1012;
    }
    float _1014 = _1008;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = _930 * _1004;
    float _1028 = -_930;
    float _1030 = _1028 + 1.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1034 = -_914;
    float _1036 = _1034 + 1.0;
    float _1038 = _914 * _1030;
    float _1040 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1032);
    float _1042 = _1030;
    float _1044 = _1040;
    bool _1046 = _1024;
    if (_770)
    {
        float _1048 = _828 * 3.1415927410125732421875;
        _1042 = _1048;
    }
    float _1050 = _1042;
    float _1052 = _968 * _1036;
    float _1054 = -_103;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[76].x, _810);
    float _1058 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1040);
    float _1060 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _840);
    if (_770)
    {
        float _1062 = _1050 * 0.15915493667125701904296875;
        _1044 = _1062;
    }
    float _1064 = _1044;
    float _1066 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _416);
    float _1068 = _934 * _1052;
    float _1070 = _938 * _1052;
    float _1072 = -_968;
    float _1074 = _1072 + 1.0;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1076;
    float _1080 = float(uint(_532));
    if (_1024)
    {
        float _1082 = _1006 * _369;
        _127 = _1082;
    }
    float _1084 = _127;
    float _1086 = _369;
    if (_770)
    {
        float _1088 = _1064 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        _1086 = _1090;
    }
    float _1092 = _1086;
    if (_766)
    {
        bool _1094 = _1014 > 0.5;
        _1046 = _1094;
    }
    bool _1096 = _1046;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1100 = _864 + _1098;
    if (!_766)
    {
        _944 = _189;
    }
    float _1102 = _944;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1104;
    float _1108 = _1102;
    if (_766)
    {
        float _1110 = -_189;
        float _1112 = _1096 ? _1110 : _189;
        _1108 = _1112;
    }
    float _1114 = _1108;
    bool _1116 = _400 > 0.5;
    float _1118 = fma(_1106, _836, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1120 = fma(_1078, _836, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1122 = as_type<float>(_363) * _1080;
    float _1124 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1068);
    float _1126 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1070);
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _630 + _1128;
    float _1132 = _1100 * _1100;
    float _1134 = fma(_932, _1038, _1124);
    float _1136 = trunc(_1122);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    if (_770)
    {
        bool _1142 = _1092 > 0.5;
        _824 = _1142;
    }
    bool _1144 = _824;
    float _1146 = fma(_936, _1038, _1126);
    int _1148 = abs(_752);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _956 + _1150;
    int _1154 = ~_309;
    int _1156 = _1154 + 1;
    float _1158 = fma(_1130, _1130, _1132);
    float _1160 = fma(_1118, _1026, _1134);
    float _1162 = fma(_1120, _1026, _1146);
    float _1164 = fma(_1152, _1152, _1158);
    int _1166 = abs(_762);
    float _1168 = _400 + (-0.5);
    float _1170 = float(_1148);
    float _1172 = float(_1166);
    int _1174 = _1156 * int(_1140);
    int _1176 = _1174 + _532;
    float _1178 = float(_740);
    float _1180 = rsqrt(_1164);
    float _1182 = float(uint(_1176));
    float _1184 = _1170 * _1178;
    float _1186 = in.m_48.x;
    float _1188 = in.m_48.y;
    float _1190 = in.m_48.z;
    float _1192 = float(_708);
    float _1194 = as_type<float>(_363) * _1182;
    int _1196 = _638 >> 31;
    float _1198 = _1172 * _1192;
    float _1200 = float(_1000);
    float _1202 = trunc(_1194);
    float _1204 = precise::max(_1202, 0.0);
    uint _1206 = uint(_1204);
    int _1208 = _1196 & 3;
    float _1210 = _1130 * _1180;
    float _1212 = float(_954);
    float _1214 = _1100 * _1180;
    int _1216 = _638 + _1208;
    float _1218 = -_1210;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1222 = _1198 * (-2.0);
    float _1224 = _1200 * _1212;
    int _1226 = _1216 >> 2;
    float _1228 = -_1214;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1232 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1234 = int(_1232);
    float _1236 = _1224 * (-2.0);
    float _1238 = _1230 * _1230;
    int _1240 = int(_1140) + int(_1206);
    float _1242 = fma(_858, _1236, _858);
    int _1244 = _1226 << 4;
    int _1246 = _1244 + 368;
    float _1248 = fma(_1236, _1186, _1186);
    float _1250 = fma(_1220, _1220, _1238);
    bool _1252 = !_642;
    int _1254 = _1252 ? 0 : 1;
    uint _1256 = uint(int(uint(_1246) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[int(_1266)][_1268];
    bool _1272 = _640 != 3;
    int _1274 = _355 * _1240;
    int _1276 = _1274 + _532;
    float _1278 = in.m_42.x;
    float _1280 = in.m_42.y;
    float _1282 = _1152 * _1180;
    bool _1284 = !_1272;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1248);
    bool _1290 = uint(_1276) >= uint(_309);
    int _1292 = _1246 + 8;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[int(_1304)][_1306];
    float _1310 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1162);
    float _1312 = -_1282;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1152);
    float _1316 = _1184 * (-2.0);
    float _1318 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1160);
    bool _1320 = !_1290;
    int _1322 = _1320 ? 0 : (-1);
    float _1324 = fma(_1242, _1084, _1288);
    bool _1326 = _402 > 0.5;
    float _1328 = _402 + (-0.5);
    float _1330 = fma(_1316, _1188, _1188);
    float _1332 = fma(_892, _1316, _892);
    int _1334 = abs(_1254);
    float _1336 = fma(_838, _1222, _838);
    float _1338 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1330);
    float _1340 = fma(_1222, _1190, _1190);
    int _1342 = abs(_722);
    float _1344 = fma(_1314, _1314, _1250);
    float _1346 = fma(_1332, _1084, _1338);
    float _1348 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1340);
    float _1350 = _1310 * _1280;
    int _1352 = abs(_702);
    float _1354 = _1346 * 0.15915493667125701904296875;
    float _1356 = fma(_1336, _1084, _1348);
    int _1358 = ~_1352;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    float _1364 = sqrt(_1344);
    int _1366 = abs(_1286);
    float _1368 = _1324 * 0.15915493667125701904296875;
    int _1370 = ~_1334;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _1318 * _1278;
    float _1378 = _1356 * 0.15915493667125701904296875;
    int _1380 = ~_1240;
    int _1382 = _1380 + _1322;
    int _1384 = _1382 + 1;
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1392 = float(uint(_1234));
    int _1394 = _309 * _1384;
    int _1396 = _1394 + _532;
    int _1398 = _1362 * as_type<int>(_1270);
    int _1400 = ~_1342;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = _1368 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = _1180 * _1364;
    int _1412 = _1374 * as_type<int>(_1262);
    int _1414 = _1412 + _1398;
    int _1416 = ~_1366;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1424 = !_438;
    int _1426 = _1424 ? _1396 : (-1);
    int _1428 = _1404 * as_type<int>(_1300);
    int _1430 = _1428 + _1414;
    float _1432 = _1390 * _1410;
    float _1434 = _1354 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = _1422 * _1410;
    int _1440 = _1420 * as_type<int>(_1308);
    int _1442 = _1440 + _1430;
    int _1444 = abs(_1234);
    float _1446 = float(uint(_1444));
    float _1448 = _1368 * 6.283185482025146484375;
    float _1450 = cos(_1448);
    int _1452 = abs(_758);
    float _1454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    int _1458 = ~_1452;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = _1432 * _1454;
    float _1466 = _1438 * _1456;
    float _1468 = _1378 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = _1408 * _1436;
    int _1474 = _1442 * _1462;
    int _1476 = _1426 * _1452;
    int _1478 = _1476 + _1474;
    float _1480 = _1378 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1450 * _1388;
    int _1486 = abs(_1478);
    float _1488 = float(uint(_1478));
    float _1490 = 1.0 / _1446;
    float _1492 = _1436 * _1470;
    float _1494 = _1450 * _1436;
    float _1496 = _1482 * _1466;
    float _1498 = -_1484;
    float _1500 = fma(_1482, _1472, _1498);
    float _1502 = -_1472;
    float _1504 = fma(_1482, _1484, _1502);
    float _1506 = 1.0 / _1392;
    float _1508 = -_1496;
    float _1510 = fma(_1492, _1464, _1508);
    int _1512 = as_type<int>(_1490) + (-2);
    float _1514 = _1470 * _1466;
    float _1516 = float(uint(_1486));
    float _1518 = _1388 * _1470;
    float _1520 = _1408 * _1388;
    float _1522 = _1450 * _1514;
    float _1524 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1526 = _1524 * 0.5;
    float _1528 = as_type<float>(_1512) * _1516;
    float _1530 = _1408 * _1514;
    float _1532 = fma(_1482, _1494, _1520);
    float _1534 = fma(_1518, _1526, _1510);
    int _1536 = as_type<int>(_1506) + (-2);
    float _1538 = fma(_1482, _1520, _1494);
    float _1540 = fma(_1532, _1464, _1522);
    float _1542 = trunc(_1528);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    float _1548 = fma(_1500, _1464, _1530);
    float _1550 = as_type<float>(_1536) * _1488;
    float _1552 = fma(_1504, _1526, _1540);
    int _1554 = ~_1444;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1538, _1526, _1548);
    int _1560 = ~_1234;
    int _1562 = _1560 + 1;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1568 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1570 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1564);
    float _1572 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1574 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1576 = _1114 + 0.5;
    float _1578 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1570);
    float _1580 = trunc(_1550);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1574);
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1590 = _956 + _1578;
    int _1592 = _1556 * int(_1546);
    int _1594 = _1592 + _1486;
    float _1596 = _630 + _1586;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1600 = _1590 + _1598;
    float _1602 = _1588 * _1566;
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1606 = _1596 + _1604;
    float _1608 = float(uint(_1594));
    float _1610 = _1600 * _1600;
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1618 = fma(_1606, _1606, _1610);
    int _1620 = _1562 * int(_1584);
    int _1622 = _1620 + _1478;
    float _1624 = _1610;
    float _1626 = _1590;
    float _1628 = _1596;
    if (!_770)
    {
        _1624 = _193;
    }
    float _1630 = _1624;
    float _1632 = as_type<float>(_1512) * _1608;
    float _1634 = _1630;
    if (_770)
    {
        float _1636 = -_193;
        float _1638 = _1144 ? _1636 : _193;
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = sqrt(_1618);
    float _1644 = float(uint(_1622));
    float _1646 = -_1640;
    float _1648 = _1646 + 0.5;
    float _1650 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1658 = as_type<float>(_1536) * _1644;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1666 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1654 * _1612;
    float _1672 = trunc(_1658);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1680 = _1642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_50.x = _1602;
    out.m_50.y = _1670;
    float _1682 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1572);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1686 = trunc(_1632);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    float _1692 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1682);
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1698 = -_189;
    int _1700 = _1116 ? as_type<int>(_1698) : as_type<int>(_189);
    out.m_52.x = _1692;
    out.m_52.y = _1650;
    out.m_52.z = _1662;
    out.m_52.w = _1684;
    float _1702 = _864 + _1694;
    float _1704 = -_193;
    int _1706 = _1326 ? as_type<int>(_1704) : as_type<int>(_193);
    out.m_54.x = _1664;
    out.m_54.y = _1666;
    out.m_54.z = _1668;
    out.m_54.w = _1696;
    bool _1708 = !_774;
    float _1710 = _1708 ? _189 : as_type<float>(_1700);
    bool _1712 = !_782;
    float _1714 = _1712 ? _193 : as_type<float>(_1706);
    int _1716 = int(_1584) + int(_1676);
    int _1718 = int(_1546) + int(_1690);
    int _1720 = ~_1234;
    int _1722 = _1720 + 1;
    float _1724 = _1650;
    if (!_1680)
    {
        _1724 = _1702;
    }
    float _1726 = _1724;
    int _1728 = ~_1444;
    int _1730 = _1728 + 1;
    bool _1732 = !_1680;
    float _1734 = _1726;
    if (!_1732)
    {
        float _1736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1740 = _1642 + _1738;
        float _1742 = _1702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1744 = rsqrt(_1618);
        float _1746 = _1740 * _1736;
        float _1748 = _1746 * 0.15915493667125701904296875;
        float _1750 = _1748 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = _1748 * 6.283185482025146484375;
        float _1756 = sin(_1754);
        float _1758 = _1752 + (-1.0);
        float _1760 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1762 = fma(_1756, _1742, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1764 = fma(_1702, _1752, _1760);
        float _1766 = _1744 * _1762;
        float _1768 = fma(_1606, _1766, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1770 = fma(_1600, _1766, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1734 = _1764;
        _1626 = _1770;
        _1628 = _1768;
    }
    float _1772 = _1734;
    float _1774 = _1626;
    float _1776 = _1628;
    float _1778 = -_1214;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1772);
    int _1782 = _1730 * _1718;
    int _1784 = _1782 + _1486;
    float _1786 = -_1282;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1774);
    float _1790 = -_1210;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1776);
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1796 = _1722 * _1716;
    int _1798 = _1796 + _1478;
    bool _1800 = uint(_1784) >= uint(_1444);
    float _1802 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    int _1806 = _1478 ^ _1234;
    float _1808 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1810 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1812 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1802);
    bool _1814 = !_1800;
    int _1816 = _1814 ? 0 : (-1);
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1820 = uint(int(uint(_1806) >> uint(31)));
    float _1822 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    bool _1824 = uint(_1798) >= uint(_1234);
    float _1826 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1808);
    int _1828 = ~_1816;
    int _1830 = _1718 + _1828;
    int _1832 = _1830 + 1;
    float _1834 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1804);
    int _1836 = ~int(_1820);
    int _1838 = _1836 + 1;
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1842 = !_1824;
    int _1844 = _1842 ? 0 : (-1);
    float _1846 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1810);
    int _1848 = _1832 ^ _1838;
    float _1850 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1852 = ~_1716;
    int _1854 = _1852 + _1844;
    int _1856 = _1854 + 1;
    float _1858 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1860 = _1234 == 0;
    float _1862 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    int _1864 = ~_1838;
    int _1866 = _1864 + _1848;
    int _1868 = _1866 + 1;
    int _1870 = _1234 * _1856;
    int _1872 = _1870 + _1478;
    bool _1874 = _1234 == 0;
    float _1876 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1878 = !_1860;
    int _1880 = _1878 ? _1868 : (-1);
    float _1882 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1884 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1886 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1826);
    float _1888 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1890 = !_1874;
    int _1892 = _1890 ? _1872 : (-1);
    float _1894 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1896 = float(_1880);
    float _1898 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1846);
    float _1900 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1882);
    float _1902 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1888);
    float _1904 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1906 = float(_1892);
    float _1908 = -_1060;
    float _1910 = fma(_1894, _1896, _1908);
    float _1912 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1862);
    float _1914 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1884);
    float _1916 = _1714 + (-0.5);
    float _1918 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1920 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1922 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1902);
    float _1924 = fma(_1876, _1906, _1056);
    float _1926 = _1710 + 0.5;
    float _1928 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1930 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1914);
    float _1932 = -_1894;
    float _1934 = fma(_1932, _1916, _1910);
    float _1936 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1920);
    float _1938 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    float _1940 = fma(_1876, _1926, _1924);
    float _1942 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1928);
    float _1944 = -_1058;
    float _1946 = _1944 + 1.0;
    float _1948 = _1936 + _1938;
    float _1950 = _1938 * 0.5;
    float _1952 = -_1066;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1930);
    float _1958 = -_1946;
    float _1960 = fma(_1710, _1958, _1940);
    float _1962 = _1948 * 0.5;
    float _1964 = fma(_1942, -0.5, _1950);
    float _1966 = fma(_1714, _1954, _1934);
    out.gl_Position.x = _1936;
    out.gl_Position.y = _1942;
    out.gl_Position.z = _1956;
    out.gl_Position.w = _1938;
    out.m_56.w = _1938;
    out.m_56.x = _1962;
    out.m_56.y = _1964;
    out.m_58.x = _1960;
    out.m_58.y = _1966;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_81)
    {
        float _89 = _85 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2021 = as_type<float>(_91);
        out.gl_Position.z = _2021;
    }
    if (!_81)
    {
        return out;
    }
    float _95 = in.m_35.w;
    float _97 = float(_77);
    float _99 = 1.0 / _97;
    float _101 = -_95;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_95);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = _103 * _99;
    bool _117 = _103 >= _97;
    bool _119 = !_113;
    bool _121 = _117 || _119;
    out.m_37.x = _115;
    float _123 = _95;
    float _125 = _115;
    float _127 = _103;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _131 = _129 * 5.0;
        _93 = as_type<int>(_131);
    }
    int _133 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_133);
        out.gl_Position.z = _2094;
    }
    if (_121)
    {
        return out;
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _139 = in.m_42.w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    float _163 = 0.0;
    float _165 = _137;
    if (!_149)
    {
        float _167 = _137 * _137;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    int _179 = as_type<int>(_135) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_135) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_149;
    float _197 = _177;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _137 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _137);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_149;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _137 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _165 = _251;
    }
    float _253 = _165;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _151, _257);
    float _265 = fma(_253, _153, _259);
    float _267 = fma(_253, _155, _261);
    float _269 = fma(_263, _139, _157);
    float _271 = fma(_265, _139, _159);
    float _273 = fma(_267, _139, _161);
    bool _275 = !_255;
    if (!_275)
    {
        float _277 = in.m_44.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _125 = _291;
    }
    float _293 = _125;
    float _295 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _297 = int(_295);
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _301 = _299 != 0;
    float _303 = in.m_44.z;
    float _305 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _307 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _309 = int(_307);
    float _311 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _305);
    out.m_46.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _293 + _313;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_301)
    {
        _317 = 1.0;
    }
    float _319 = _317;
    float _321 = float(_297);
    float _323 = _319;
    if (!_301)
    {
        _323 = 7.345489978790283203125;
    }
    float _325 = _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _329 = 1.0 + _327;
    float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _333 = log2(_331);
    out.m_33.x = 1.0;
    float _335 = float(uint(_309));
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _339 = 1.0 / _321;
    int _341 = ~_309;
    int _343 = _341 + 1;
    float _345 = _303 * 2.0;
    int _347 = ~_309;
    int _349 = _347 + 1;
    float _351 = float(_309);
    int _353 = ~_309;
    int _355 = _353 + 1;
    float _357 = 1.0 / _335;
    float _359 = _339 * _103;
    float _361 = floor(_345);
    int _363 = as_type<int>(_357) + (-2);
    float _365 = trunc(_359);
    int _367 = int(_365);
    float _369 = 1.0 / _329;
    float _371 = float(uint(_367));
    float _373 = float(_367);
    float _375 = as_type<float>(_363) * _371;
    bool _377 = _373 >= _351;
    bool _379 = isnan(_373);
    bool _381 = _377 || _379;
    bool _383 = isnan(_351);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = trunc(_375);
    float _391 = precise::max(_389, 0.0);
    uint _394 = uint(_391);
    int _396 = _343 * int(_394);
    int _398 = _396 + _367;
    float _400 = in.m_44.x;
    float _402 = in.m_44.y;
    float _404 = float(uint(_398));
    float _406 = as_type<float>(_363) * _404;
    float _408 = trunc(_406);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    float _414 = _400 * _325;
    float _416 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _337);
    float _418 = floor(_414);
    int _420 = int(_394) + int(_412);
    int _422 = _349 * _420;
    int _424 = _422 + _367;
    float _426 = trunc(_387);
    int _428 = int(_426);
    bool _430 = uint(_424) >= uint(_309);
    bool _432 = !_430;
    int _434 = _432 ? 0 : (-1);
    float _436 = _351 * _103;
    bool _438 = _309 == 0;
    int _440 = ~_420;
    int _442 = _440 + _434;
    int _444 = _442 + 1;
    float _446 = -_418;
    float _448 = _414 + _446;
    float _450 = _436 * _99;
    int _452 = _309 * _444;
    int _454 = _452 + _367;
    int _456 = ~_428;
    int _458 = _456 + 1;
    int _460 = _458 + 1;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _472 = _470 != 0;
    float _474 = trunc(_450);
    int _476 = int(_474);
    bool _478 = !_438;
    int _480 = _478 ? _454 : (-1);
    float _482 = _448 * _351;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _486 = _484 != 0;
    bool _488 = !_468;
    int _490 = _488 ? 0 : 1;
    int _492 = _480 * _460;
    int _494 = _309 + (-1);
    float _496 = trunc(_482);
    int _498 = int(_496);
    bool _500 = !_486;
    int _502 = _500 ? 0 : 1;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _506 = _504 != 0;
    int _508 = _428 * _494;
    int _510 = _508 + _492;
    bool _512 = !_464;
    int _514 = _512 ? 0 : 1;
    int _516 = abs(_490);
    bool _518 = !_472;
    int _520 = _518 ? 0 : 1;
    int _522 = abs(_502);
    int _524 = abs(_514);
    bool _526 = !_506;
    int _528 = _526 ? 0 : 1;
    int _530 = _498 * _522;
    int _532 = _530 + _367;
    int _534 = abs(_520);
    int _536 = _510 * _516;
    int _538 = abs(_528);
    int _540 = _476 * _524;
    int _542 = _540 + _536;
    int _544 = ~_309;
    int _546 = _544 + 1;
    int _548 = _532 * _534;
    int _550 = _548 + _542;
    int _552 = ~_309;
    int _554 = _552 + 1;
    int _556 = _498 * _538;
    int _558 = _556 + _550;
    float _560 = float(uint(_558));
    float _562 = as_type<float>(_363) * _560;
    float _564 = trunc(_562);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = _554 * int(_568);
    int _572 = _570 + _558;
    float _574 = float(uint(_572));
    float _576 = as_type<float>(_363) * _574;
    float _578 = trunc(_576);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    int _584 = int(_568) + int(_582);
    float _586 = _400 * 2.0;
    int _588 = _546 * _584;
    int _590 = _588 + _558;
    float _592 = floor(_586);
    bool _594 = uint(_590) >= uint(_309);
    float _596 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _598 = !_594;
    int _600 = _598 ? 0 : (-1);
    float _602 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _596);
    float _604 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _606 = ~_584;
    int _608 = _606 + _600;
    int _610 = _608 + 1;
    float _612 = _402 * 2.0;
    float _614 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _602);
    bool _616 = _592 >= 0.0;
    bool _618 = isnan(_592);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    int _626 = _309 * _610;
    int _628 = _626 + _558;
    float _630 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _632 = floor(_612);
    int _634 = _624 ? 0 : 1;
    bool _636 = !_438;
    int _638 = _636 ? _628 : (-1);
    int _640 = _638 & 3;
    bool _642 = _640 != 0;
    int _644 = _638 & 3;
    bool _646 = _644 != 0;
    bool _648 = uint(_640) >= 2u;
    int _650 = _646 ? 0 : 1;
    bool _652 = _592 > 0.0;
    int _654 = _648 ? 0 : 1;
    bool _656 = uint(_640) > 1u;
    bool _658 = _632 > 0.0;
    bool _660 = _640 != 3;
    bool _662 = _632 >= 0.0;
    bool _664 = isnan(_632);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    int _672 = ~_650;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    int _678 = _670 ? 0 : 1;
    int _680 = ~_654;
    int _682 = _680 + 1;
    int _684 = _682 + 1;
    int _686 = ~_678;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    int _692 = _676;
    int _694 = _690;
    int _696 = _684;
    if (!_656)
    {
        int _698 = ~_650;
        int _700 = _698 + 1;
        _692 = _700;
    }
    int _702 = _692;
    if (!_658)
    {
        int _704 = ~_678;
        int _706 = _704 + 1;
        _694 = _706;
    }
    int _708 = _694;
    int _710 = ~_634;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    int _716 = _714;
    if (_660)
    {
        int _718 = ~_654;
        int _720 = _718 + 1;
        _696 = _720;
    }
    int _722 = _696;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _734 = _732 != 0;
    if (!_652)
    {
        int _736 = ~_634;
        int _738 = _736 + 1;
        _716 = _738;
    }
    int _740 = _716;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _742;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _748 = _746 != 0;
    bool _750 = !_730;
    int _752 = _750 ? 0 : 1;
    float _754 = 1.0 / _744;
    bool _756 = !_748;
    int _758 = _756 ? 0 : 1;
    bool _760 = !_734;
    int _762 = _760 ? 0 : 1;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _774 = _772 != 0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _776;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _782 = _780 != 0;
    float _784 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _790 = 1.0 / _778;
    float _792 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _784);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _796 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _798 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _311);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _802 = 1.0 / _788;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _806 = _293 + _804;
    float _808 = -_794;
    float _810 = fma(_604, 2.0, _808);
    float _812 = _333 * _103;
    float _814 = _303 + _400;
    float _816 = _806 * _754;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _820 = _293 + _818;
    float _822 = 0.0;
    bool _824 = _766;
    if (_770)
    {
        float _826 = in.m_44.x;
        _822 = _826;
    }
    float _828 = _822;
    float _830 = _814 + (-1.0);
    float _832 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _834 = exp2(_812);
    float _836 = _315 * _790;
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _840 = fma(_832, -2.0, _800);
    float _842 = _402 + _400;
    float _844 = _402 + _303;
    float _846 = _820 * _802;
    float _848 = _842 + (-1.0);
    float _850 = _802;
    if (_766)
    {
        float _852 = in.m_44.w;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = _844 + (-1.0);
    float _858 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _860 = !_726;
    int _862 = _860 ? 0 : 1;
    float _864 = _796 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _866 = _361 >= 0.0;
    bool _868 = isnan(_361);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    float _876 = -_834;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _880;
    int _884 = _874 ? 0 : 1;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _890 = _361 > 0.0;
    float _892 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _894 = ~_884;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _900;
    bool _904 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _906 = isnan(_293);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _920 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _922 = isnan(_293);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = fma(_888, _846, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _934 = fma(_882, _816, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _936 = fma(_918, _846, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _938 = fma(_902, _816, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _940 = _854;
    int _942 = _898;
    float _944 = _938;
    if (_766)
    {
        float _946 = _854 * 3.1415927410125732421875;
        _940 = _946;
    }
    float _948 = _940;
    if (!_890)
    {
        int _950 = ~_884;
        int _952 = _950 + 1;
        _942 = _952;
    }
    int _954 = _942;
    float _956 = _798 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _958 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _960 = isnan(_293);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = 0.0;
    if (_766)
    {
        float _972 = _948 * 0.15915493667125701904296875;
        _970 = _972;
    }
    float _974 = _970;
    bool _976 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _978 = isnan(_293);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _303 + (-0.5);
    bool _990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    int _1000 = abs(_862);
    float _1002 = -_986;
    float _1004 = _1002 + 1.0;
    float _1006 = _998 ? _878 : 0.0;
    float _1008 = _974;
    if (_766)
    {
        float _1010 = _974 * 6.283185482025146484375;
        float _1012 = sin(_1010);
        _1008 = _1012;
    }
    float _1014 = _1008;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = _930 * _1004;
    float _1028 = -_930;
    float _1030 = _1028 + 1.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1034 = -_914;
    float _1036 = _1034 + 1.0;
    float _1038 = _914 * _1030;
    float _1040 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1032);
    float _1042 = _1030;
    float _1044 = _1040;
    bool _1046 = _1024;
    if (_770)
    {
        float _1048 = _828 * 3.1415927410125732421875;
        _1042 = _1048;
    }
    float _1050 = _1042;
    float _1052 = _968 * _1036;
    float _1054 = -_103;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[76].x, _810);
    float _1058 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1040);
    float _1060 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _840);
    if (_770)
    {
        float _1062 = _1050 * 0.15915493667125701904296875;
        _1044 = _1062;
    }
    float _1064 = _1044;
    float _1066 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _416);
    float _1068 = _934 * _1052;
    float _1070 = _938 * _1052;
    float _1072 = -_968;
    float _1074 = _1072 + 1.0;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1076;
    float _1080 = float(uint(_532));
    if (_1024)
    {
        float _1082 = _1006 * _369;
        _127 = _1082;
    }
    float _1084 = _127;
    float _1086 = _369;
    if (_770)
    {
        float _1088 = _1064 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        _1086 = _1090;
    }
    float _1092 = _1086;
    if (_766)
    {
        bool _1094 = _1014 > 0.5;
        _1046 = _1094;
    }
    bool _1096 = _1046;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1100 = _864 + _1098;
    if (!_766)
    {
        _944 = _189;
    }
    float _1102 = _944;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1104;
    float _1108 = _1102;
    if (_766)
    {
        float _1110 = -_189;
        float _1112 = _1096 ? _1110 : _189;
        _1108 = _1112;
    }
    float _1114 = _1108;
    bool _1116 = _400 > 0.5;
    float _1118 = fma(_1106, _836, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1120 = fma(_1078, _836, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1122 = as_type<float>(_363) * _1080;
    float _1124 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1068);
    float _1126 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1070);
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _630 + _1128;
    float _1132 = _1100 * _1100;
    float _1134 = fma(_932, _1038, _1124);
    float _1136 = trunc(_1122);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    if (_770)
    {
        bool _1142 = _1092 > 0.5;
        _824 = _1142;
    }
    bool _1144 = _824;
    float _1146 = fma(_936, _1038, _1126);
    int _1148 = abs(_752);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _956 + _1150;
    int _1154 = ~_309;
    int _1156 = _1154 + 1;
    float _1158 = fma(_1130, _1130, _1132);
    float _1160 = fma(_1118, _1026, _1134);
    float _1162 = fma(_1120, _1026, _1146);
    float _1164 = fma(_1152, _1152, _1158);
    int _1166 = abs(_762);
    float _1168 = _400 + (-0.5);
    float _1170 = float(_1148);
    float _1172 = float(_1166);
    int _1174 = _1156 * int(_1140);
    int _1176 = _1174 + _532;
    float _1178 = float(_740);
    float _1180 = rsqrt(_1164);
    float _1182 = float(uint(_1176));
    float _1184 = _1170 * _1178;
    float _1186 = in.m_48.x;
    float _1188 = in.m_48.y;
    float _1190 = in.m_48.z;
    float _1192 = float(_708);
    float _1194 = as_type<float>(_363) * _1182;
    int _1196 = _638 >> 31;
    float _1198 = _1172 * _1192;
    float _1200 = float(_1000);
    float _1202 = trunc(_1194);
    float _1204 = precise::max(_1202, 0.0);
    uint _1206 = uint(_1204);
    int _1208 = _1196 & 3;
    float _1210 = _1130 * _1180;
    float _1212 = float(_954);
    float _1214 = _1100 * _1180;
    int _1216 = _638 + _1208;
    float _1218 = -_1210;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1222 = _1198 * (-2.0);
    float _1224 = _1200 * _1212;
    int _1226 = _1216 >> 2;
    float _1228 = -_1214;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1232 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1234 = int(_1232);
    float _1236 = _1224 * (-2.0);
    float _1238 = _1230 * _1230;
    int _1240 = int(_1140) + int(_1206);
    float _1242 = fma(_858, _1236, _858);
    int _1244 = _1226 << 4;
    int _1246 = _1244 + 368;
    float _1248 = fma(_1236, _1186, _1186);
    float _1250 = fma(_1220, _1220, _1238);
    bool _1252 = !_642;
    int _1254 = _1252 ? 0 : 1;
    uint _1256 = uint(int(uint(_1246) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[int(_1266)][_1268];
    bool _1272 = _640 != 3;
    int _1274 = _355 * _1240;
    int _1276 = _1274 + _532;
    float _1278 = in.m_42.x;
    float _1280 = in.m_42.y;
    float _1282 = _1152 * _1180;
    bool _1284 = !_1272;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1248);
    bool _1290 = uint(_1276) >= uint(_309);
    int _1292 = _1246 + 8;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[int(_1304)][_1306];
    float _1310 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1162);
    float _1312 = -_1282;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1152);
    float _1316 = _1184 * (-2.0);
    float _1318 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1160);
    bool _1320 = !_1290;
    int _1322 = _1320 ? 0 : (-1);
    float _1324 = fma(_1242, _1084, _1288);
    bool _1326 = _402 > 0.5;
    float _1328 = _402 + (-0.5);
    float _1330 = fma(_1316, _1188, _1188);
    float _1332 = fma(_892, _1316, _892);
    int _1334 = abs(_1254);
    float _1336 = fma(_838, _1222, _838);
    float _1338 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1330);
    float _1340 = fma(_1222, _1190, _1190);
    int _1342 = abs(_722);
    float _1344 = fma(_1314, _1314, _1250);
    float _1346 = fma(_1332, _1084, _1338);
    float _1348 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1340);
    float _1350 = _1310 * _1280;
    int _1352 = abs(_702);
    float _1354 = _1346 * 0.15915493667125701904296875;
    float _1356 = fma(_1336, _1084, _1348);
    int _1358 = ~_1352;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    float _1364 = sqrt(_1344);
    int _1366 = abs(_1286);
    float _1368 = _1324 * 0.15915493667125701904296875;
    int _1370 = ~_1334;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _1318 * _1278;
    float _1378 = _1356 * 0.15915493667125701904296875;
    int _1380 = ~_1240;
    int _1382 = _1380 + _1322;
    int _1384 = _1382 + 1;
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1392 = float(uint(_1234));
    int _1394 = _309 * _1384;
    int _1396 = _1394 + _532;
    int _1398 = _1362 * as_type<int>(_1270);
    int _1400 = ~_1342;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = _1368 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = _1180 * _1364;
    int _1412 = _1374 * as_type<int>(_1262);
    int _1414 = _1412 + _1398;
    int _1416 = ~_1366;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1424 = !_438;
    int _1426 = _1424 ? _1396 : (-1);
    int _1428 = _1404 * as_type<int>(_1300);
    int _1430 = _1428 + _1414;
    float _1432 = _1390 * _1410;
    float _1434 = _1354 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = _1422 * _1410;
    int _1440 = _1420 * as_type<int>(_1308);
    int _1442 = _1440 + _1430;
    int _1444 = abs(_1234);
    float _1446 = float(uint(_1444));
    float _1448 = _1368 * 6.283185482025146484375;
    float _1450 = cos(_1448);
    int _1452 = abs(_758);
    float _1454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    int _1458 = ~_1452;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = _1432 * _1454;
    float _1466 = _1438 * _1456;
    float _1468 = _1378 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = _1408 * _1436;
    int _1474 = _1442 * _1462;
    int _1476 = _1426 * _1452;
    int _1478 = _1476 + _1474;
    float _1480 = _1378 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1450 * _1388;
    int _1486 = abs(_1478);
    float _1488 = float(uint(_1478));
    float _1490 = 1.0 / _1446;
    float _1492 = _1436 * _1470;
    float _1494 = _1450 * _1436;
    float _1496 = _1482 * _1466;
    float _1498 = -_1484;
    float _1500 = fma(_1482, _1472, _1498);
    float _1502 = -_1472;
    float _1504 = fma(_1482, _1484, _1502);
    float _1506 = 1.0 / _1392;
    float _1508 = -_1496;
    float _1510 = fma(_1492, _1464, _1508);
    int _1512 = as_type<int>(_1490) + (-2);
    float _1514 = _1470 * _1466;
    float _1516 = float(uint(_1486));
    float _1518 = _1388 * _1470;
    float _1520 = _1408 * _1388;
    float _1522 = _1450 * _1514;
    float _1524 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1526 = _1524 * 0.5;
    float _1528 = as_type<float>(_1512) * _1516;
    float _1530 = _1408 * _1514;
    float _1532 = fma(_1482, _1494, _1520);
    float _1534 = fma(_1518, _1526, _1510);
    int _1536 = as_type<int>(_1506) + (-2);
    float _1538 = fma(_1482, _1520, _1494);
    float _1540 = fma(_1532, _1464, _1522);
    float _1542 = trunc(_1528);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    float _1548 = fma(_1500, _1464, _1530);
    float _1550 = as_type<float>(_1536) * _1488;
    float _1552 = fma(_1504, _1526, _1540);
    int _1554 = ~_1444;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1538, _1526, _1548);
    int _1560 = ~_1234;
    int _1562 = _1560 + 1;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1568 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1570 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1564);
    float _1572 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1574 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1576 = _1114 + 0.5;
    float _1578 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1570);
    float _1580 = trunc(_1550);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1574);
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1590 = _956 + _1578;
    int _1592 = _1556 * int(_1546);
    int _1594 = _1592 + _1486;
    float _1596 = _630 + _1586;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1600 = _1590 + _1598;
    float _1602 = _1588 * _1566;
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1606 = _1596 + _1604;
    float _1608 = float(uint(_1594));
    float _1610 = _1600 * _1600;
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1618 = fma(_1606, _1606, _1610);
    int _1620 = _1562 * int(_1584);
    int _1622 = _1620 + _1478;
    float _1624 = _1610;
    float _1626 = _1590;
    float _1628 = _1596;
    if (!_770)
    {
        _1624 = _193;
    }
    float _1630 = _1624;
    float _1632 = as_type<float>(_1512) * _1608;
    float _1634 = _1630;
    if (_770)
    {
        float _1636 = -_193;
        float _1638 = _1144 ? _1636 : _193;
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = sqrt(_1618);
    float _1644 = float(uint(_1622));
    float _1646 = -_1640;
    float _1648 = _1646 + 0.5;
    float _1650 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1658 = as_type<float>(_1536) * _1644;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1666 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1654 * _1612;
    float _1672 = trunc(_1658);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1680 = _1642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_50.x = _1602;
    out.m_50.y = _1670;
    float _1682 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1572);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1686 = trunc(_1632);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    float _1692 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1682);
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1698 = -_189;
    int _1700 = _1116 ? as_type<int>(_1698) : as_type<int>(_189);
    out.m_52.x = _1692;
    out.m_52.y = _1650;
    out.m_52.z = _1662;
    out.m_52.w = _1684;
    float _1702 = _864 + _1694;
    float _1704 = -_193;
    int _1706 = _1326 ? as_type<int>(_1704) : as_type<int>(_193);
    out.m_54.x = _1664;
    out.m_54.y = _1666;
    out.m_54.z = _1668;
    out.m_54.w = _1696;
    bool _1708 = !_774;
    float _1710 = _1708 ? _189 : as_type<float>(_1700);
    bool _1712 = !_782;
    float _1714 = _1712 ? _193 : as_type<float>(_1706);
    int _1716 = int(_1584) + int(_1676);
    int _1718 = int(_1546) + int(_1690);
    int _1720 = ~_1234;
    int _1722 = _1720 + 1;
    float _1724 = _1650;
    if (!_1680)
    {
        _1724 = _1702;
    }
    float _1726 = _1724;
    int _1728 = ~_1444;
    int _1730 = _1728 + 1;
    bool _1732 = !_1680;
    float _1734 = _1726;
    if (!_1732)
    {
        float _1736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1740 = _1642 + _1738;
        float _1742 = _1702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1744 = rsqrt(_1618);
        float _1746 = _1740 * _1736;
        float _1748 = _1746 * 0.15915493667125701904296875;
        float _1750 = _1748 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = _1748 * 6.283185482025146484375;
        float _1756 = sin(_1754);
        float _1758 = _1752 + (-1.0);
        float _1760 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1762 = fma(_1756, _1742, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1764 = fma(_1702, _1752, _1760);
        float _1766 = _1744 * _1762;
        float _1768 = fma(_1606, _1766, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1770 = fma(_1600, _1766, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1734 = _1764;
        _1626 = _1770;
        _1628 = _1768;
    }
    float _1772 = _1734;
    float _1774 = _1626;
    float _1776 = _1628;
    float _1778 = -_1214;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1772);
    int _1782 = _1730 * _1718;
    int _1784 = _1782 + _1486;
    float _1786 = -_1282;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1774);
    float _1790 = -_1210;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1776);
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1796 = _1722 * _1716;
    int _1798 = _1796 + _1478;
    bool _1800 = uint(_1784) >= uint(_1444);
    float _1802 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    int _1806 = _1478 ^ _1234;
    float _1808 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1810 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1812 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1802);
    bool _1814 = !_1800;
    int _1816 = _1814 ? 0 : (-1);
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1820 = uint(int(uint(_1806) >> uint(31)));
    float _1822 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    bool _1824 = uint(_1798) >= uint(_1234);
    float _1826 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1808);
    int _1828 = ~_1816;
    int _1830 = _1718 + _1828;
    int _1832 = _1830 + 1;
    float _1834 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1804);
    int _1836 = ~int(_1820);
    int _1838 = _1836 + 1;
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1842 = !_1824;
    int _1844 = _1842 ? 0 : (-1);
    float _1846 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1810);
    int _1848 = _1832 ^ _1838;
    float _1850 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1852 = ~_1716;
    int _1854 = _1852 + _1844;
    int _1856 = _1854 + 1;
    float _1858 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1860 = _1234 == 0;
    float _1862 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    int _1864 = ~_1838;
    int _1866 = _1864 + _1848;
    int _1868 = _1866 + 1;
    int _1870 = _1234 * _1856;
    int _1872 = _1870 + _1478;
    bool _1874 = _1234 == 0;
    float _1876 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1878 = !_1860;
    int _1880 = _1878 ? _1868 : (-1);
    float _1882 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1884 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1886 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1826);
    float _1888 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1890 = !_1874;
    int _1892 = _1890 ? _1872 : (-1);
    float _1894 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1896 = float(_1880);
    float _1898 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1846);
    float _1900 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1882);
    float _1902 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1888);
    float _1904 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1906 = float(_1892);
    float _1908 = -_1060;
    float _1910 = fma(_1894, _1896, _1908);
    float _1912 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1862);
    float _1914 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1884);
    float _1916 = _1714 + (-0.5);
    float _1918 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1920 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1922 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1902);
    float _1924 = fma(_1876, _1906, _1056);
    float _1926 = _1710 + 0.5;
    float _1928 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1930 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1914);
    float _1932 = -_1894;
    float _1934 = fma(_1932, _1916, _1910);
    float _1936 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1920);
    float _1938 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    float _1940 = fma(_1876, _1926, _1924);
    float _1942 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1928);
    float _1944 = -_1058;
    float _1946 = _1944 + 1.0;
    float _1948 = _1936 + _1938;
    float _1950 = _1938 * 0.5;
    float _1952 = -_1066;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1930);
    float _1958 = -_1946;
    float _1960 = fma(_1710, _1958, _1940);
    float _1962 = _1948 * 0.5;
    float _1964 = fma(_1942, -0.5, _1950);
    float _1966 = fma(_1714, _1954, _1934);
    out.gl_Position.x = _1936;
    out.gl_Position.y = _1942;
    out.gl_Position.z = _1956;
    out.gl_Position.w = _1938;
    out.m_56.w = _1938;
    out.m_56.x = _1962;
    out.m_56.y = _1964;
    out.m_58.x = _1960;
    out.m_58.y = _1966;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_81)
    {
        float _89 = _85 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2021 = as_type<float>(_91);
        out.gl_Position.z = _2021;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    float _97 = float(_77);
    float _99 = 1.0 / _97;
    float _101 = -_95;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_95);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = _103 * _99;
    bool _117 = _103 >= _97;
    bool _119 = !_113;
    bool _121 = _117 || _119;
    out.m_37.x = _115;
    float _123 = _95;
    float _125 = _115;
    float _127 = _103;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _123;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _131 = _129 * 5.0;
        _93 = as_type<int>(_131);
    }
    int _133 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2094 = as_type<float>(_133);
        out.gl_Position.z = _2094;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _139 = in.m_42.w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = in.m_30.x;
    float _159 = in.m_30.y;
    float _161 = in.m_30.z;
    float _163 = 0.0;
    float _165 = _137;
    if (!_149)
    {
        float _167 = _137 * _137;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    int _179 = as_type<int>(_135) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_135) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_149;
    float _197 = _177;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _137 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _137);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    bool _231 = !_149;
    if (!_231)
    {
        float _233 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = log2(_233);
        float _237 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _239 = _237 + 1.0;
        float _241 = 1.0 / _239;
        float _243 = _137 * _235;
        float _245 = exp2(_243);
        float _247 = -_245;
        float _249 = _247 + 1.0;
        float _251 = _249 * _241;
        _165 = _251;
    }
    float _253 = _165;
    bool _255 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = fma(_253, _151, _257);
    float _265 = fma(_253, _153, _259);
    float _267 = fma(_253, _155, _261);
    float _269 = fma(_263, _139, _157);
    float _271 = fma(_265, _139, _159);
    float _273 = fma(_267, _139, _161);
    bool _275 = !_255;
    if (!_275)
    {
        float _277 = in.m_44.x;
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _277 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _125 = _291;
    }
    float _293 = _125;
    float _295 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _297 = int(_295);
    int _299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _301 = _299 != 0;
    float _303 = in.m_44.z;
    float _305 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _307 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _309 = int(_307);
    float _311 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _305);
    out.m_46.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = _293 + _313;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_301)
    {
        _317 = 1.0;
    }
    float _319 = _317;
    float _321 = float(_297);
    float _323 = _319;
    if (!_301)
    {
        _323 = 7.345489978790283203125;
    }
    float _325 = _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _329 = 1.0 + _327;
    float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _333 = log2(_331);
    out.m_33.x = 1.0;
    float _335 = float(uint(_309));
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _339 = 1.0 / _321;
    int _341 = ~_309;
    int _343 = _341 + 1;
    float _345 = _303 * 2.0;
    int _347 = ~_309;
    int _349 = _347 + 1;
    float _351 = float(_309);
    int _353 = ~_309;
    int _355 = _353 + 1;
    float _357 = 1.0 / _335;
    float _359 = _339 * _103;
    float _361 = floor(_345);
    int _363 = as_type<int>(_357) + (-2);
    float _365 = trunc(_359);
    int _367 = int(_365);
    float _369 = 1.0 / _329;
    float _371 = float(uint(_367));
    float _373 = float(_367);
    float _375 = as_type<float>(_363) * _371;
    bool _377 = _373 >= _351;
    bool _379 = isnan(_373);
    bool _381 = _377 || _379;
    bool _383 = isnan(_351);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = trunc(_375);
    float _391 = precise::max(_389, 0.0);
    uint _394 = uint(_391);
    int _396 = _343 * int(_394);
    int _398 = _396 + _367;
    float _400 = in.m_44.x;
    float _402 = in.m_44.y;
    float _404 = float(uint(_398));
    float _406 = as_type<float>(_363) * _404;
    float _408 = trunc(_406);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    float _414 = _400 * _325;
    float _416 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[78].w, _337);
    float _418 = floor(_414);
    int _420 = int(_394) + int(_412);
    int _422 = _349 * _420;
    int _424 = _422 + _367;
    float _426 = trunc(_387);
    int _428 = int(_426);
    bool _430 = uint(_424) >= uint(_309);
    bool _432 = !_430;
    int _434 = _432 ? 0 : (-1);
    float _436 = _351 * _103;
    bool _438 = _309 == 0;
    int _440 = ~_420;
    int _442 = _440 + _434;
    int _444 = _442 + 1;
    float _446 = -_418;
    float _448 = _414 + _446;
    float _450 = _436 * _99;
    int _452 = _309 * _444;
    int _454 = _452 + _367;
    int _456 = ~_428;
    int _458 = _456 + 1;
    int _460 = _458 + 1;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _472 = _470 != 0;
    float _474 = trunc(_450);
    int _476 = int(_474);
    bool _478 = !_438;
    int _480 = _478 ? _454 : (-1);
    float _482 = _448 * _351;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _486 = _484 != 0;
    bool _488 = !_468;
    int _490 = _488 ? 0 : 1;
    int _492 = _480 * _460;
    int _494 = _309 + (-1);
    float _496 = trunc(_482);
    int _498 = int(_496);
    bool _500 = !_486;
    int _502 = _500 ? 0 : 1;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _506 = _504 != 0;
    int _508 = _428 * _494;
    int _510 = _508 + _492;
    bool _512 = !_464;
    int _514 = _512 ? 0 : 1;
    int _516 = abs(_490);
    bool _518 = !_472;
    int _520 = _518 ? 0 : 1;
    int _522 = abs(_502);
    int _524 = abs(_514);
    bool _526 = !_506;
    int _528 = _526 ? 0 : 1;
    int _530 = _498 * _522;
    int _532 = _530 + _367;
    int _534 = abs(_520);
    int _536 = _510 * _516;
    int _538 = abs(_528);
    int _540 = _476 * _524;
    int _542 = _540 + _536;
    int _544 = ~_309;
    int _546 = _544 + 1;
    int _548 = _532 * _534;
    int _550 = _548 + _542;
    int _552 = ~_309;
    int _554 = _552 + 1;
    int _556 = _498 * _538;
    int _558 = _556 + _550;
    float _560 = float(uint(_558));
    float _562 = as_type<float>(_363) * _560;
    float _564 = trunc(_562);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = _554 * int(_568);
    int _572 = _570 + _558;
    float _574 = float(uint(_572));
    float _576 = as_type<float>(_363) * _574;
    float _578 = trunc(_576);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    int _584 = int(_568) + int(_582);
    float _586 = _400 * 2.0;
    int _588 = _546 * _584;
    int _590 = _588 + _558;
    float _592 = floor(_586);
    bool _594 = uint(_590) >= uint(_309);
    float _596 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _598 = !_594;
    int _600 = _598 ? 0 : (-1);
    float _602 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _596);
    float _604 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _606 = ~_584;
    int _608 = _606 + _600;
    int _610 = _608 + 1;
    float _612 = _402 * 2.0;
    float _614 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _602);
    bool _616 = _592 >= 0.0;
    bool _618 = isnan(_592);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    int _626 = _309 * _610;
    int _628 = _626 + _558;
    float _630 = _614 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _632 = floor(_612);
    int _634 = _624 ? 0 : 1;
    bool _636 = !_438;
    int _638 = _636 ? _628 : (-1);
    int _640 = _638 & 3;
    bool _642 = _640 != 0;
    int _644 = _638 & 3;
    bool _646 = _644 != 0;
    bool _648 = uint(_640) >= 2u;
    int _650 = _646 ? 0 : 1;
    bool _652 = _592 > 0.0;
    int _654 = _648 ? 0 : 1;
    bool _656 = uint(_640) > 1u;
    bool _658 = _632 > 0.0;
    bool _660 = _640 != 3;
    bool _662 = _632 >= 0.0;
    bool _664 = isnan(_632);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    int _672 = ~_650;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    int _678 = _670 ? 0 : 1;
    int _680 = ~_654;
    int _682 = _680 + 1;
    int _684 = _682 + 1;
    int _686 = ~_678;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    int _692 = _676;
    int _694 = _690;
    int _696 = _684;
    if (!_656)
    {
        int _698 = ~_650;
        int _700 = _698 + 1;
        _692 = _700;
    }
    int _702 = _692;
    if (!_658)
    {
        int _704 = ~_678;
        int _706 = _704 + 1;
        _694 = _706;
    }
    int _708 = _694;
    int _710 = ~_634;
    int _712 = _710 + 1;
    int _714 = _712 + 1;
    int _716 = _714;
    if (_660)
    {
        int _718 = ~_654;
        int _720 = _718 + 1;
        _696 = _720;
    }
    int _722 = _696;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _734 = _732 != 0;
    if (!_652)
    {
        int _736 = ~_634;
        int _738 = _736 + 1;
        _716 = _738;
    }
    int _740 = _716;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _742;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _748 = _746 != 0;
    bool _750 = !_730;
    int _752 = _750 ? 0 : 1;
    float _754 = 1.0 / _744;
    bool _756 = !_748;
    int _758 = _756 ? 0 : 1;
    bool _760 = !_734;
    int _762 = _760 ? 0 : 1;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _770 = _768 != 0;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _774 = _772 != 0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _776;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _782 = _780 != 0;
    float _784 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _790 = 1.0 / _778;
    float _792 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _784);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _796 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _798 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _311);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _802 = 1.0 / _788;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _806 = _293 + _804;
    float _808 = -_794;
    float _810 = fma(_604, 2.0, _808);
    float _812 = _333 * _103;
    float _814 = _303 + _400;
    float _816 = _806 * _754;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _820 = _293 + _818;
    float _822 = 0.0;
    bool _824 = _766;
    if (_770)
    {
        float _826 = in.m_44.x;
        _822 = _826;
    }
    float _828 = _822;
    float _830 = _814 + (-1.0);
    float _832 = _402 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _834 = exp2(_812);
    float _836 = _315 * _790;
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _840 = fma(_832, -2.0, _800);
    float _842 = _402 + _400;
    float _844 = _402 + _303;
    float _846 = _820 * _802;
    float _848 = _842 + (-1.0);
    float _850 = _802;
    if (_766)
    {
        float _852 = in.m_44.w;
        _850 = _852;
    }
    float _854 = _850;
    float _856 = _844 + (-1.0);
    float _858 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _860 = !_726;
    int _862 = _860 ? 0 : 1;
    float _864 = _796 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _866 = _361 >= 0.0;
    bool _868 = isnan(_361);
    bool _870 = _866 || _868;
    bool _872 = isnan(0.0);
    bool _874 = _870 || _872;
    float _876 = -_834;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _880;
    int _884 = _874 ? 0 : 1;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _890 = _361 > 0.0;
    float _892 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _894 = ~_884;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _900;
    bool _904 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _906 = isnan(_293);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _920 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _922 = isnan(_293);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = fma(_888, _846, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _934 = fma(_882, _816, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _936 = fma(_918, _846, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _938 = fma(_902, _816, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _940 = _854;
    int _942 = _898;
    float _944 = _938;
    if (_766)
    {
        float _946 = _854 * 3.1415927410125732421875;
        _940 = _946;
    }
    float _948 = _940;
    if (!_890)
    {
        int _950 = ~_884;
        int _952 = _950 + 1;
        _942 = _952;
    }
    int _954 = _942;
    float _956 = _798 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _958 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _960 = isnan(_293);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = 0.0;
    if (_766)
    {
        float _972 = _948 * 0.15915493667125701904296875;
        _970 = _972;
    }
    float _974 = _970;
    bool _976 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _978 = isnan(_293);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _303 + (-0.5);
    bool _990 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    int _1000 = abs(_862);
    float _1002 = -_986;
    float _1004 = _1002 + 1.0;
    float _1006 = _998 ? _878 : 0.0;
    float _1008 = _974;
    if (_766)
    {
        float _1010 = _974 * 6.283185482025146484375;
        float _1012 = sin(_1010);
        _1008 = _1012;
    }
    float _1014 = _1008;
    bool _1016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1018 = isnan(1.0);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1024 = _1020 || _1022;
    float _1026 = _930 * _1004;
    float _1028 = -_930;
    float _1030 = _1028 + 1.0;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1034 = -_914;
    float _1036 = _1034 + 1.0;
    float _1038 = _914 * _1030;
    float _1040 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1032);
    float _1042 = _1030;
    float _1044 = _1040;
    bool _1046 = _1024;
    if (_770)
    {
        float _1048 = _828 * 3.1415927410125732421875;
        _1042 = _1048;
    }
    float _1050 = _1042;
    float _1052 = _968 * _1036;
    float _1054 = -_103;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[76].x, _810);
    float _1058 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1040);
    float _1060 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _840);
    if (_770)
    {
        float _1062 = _1050 * 0.15915493667125701904296875;
        _1044 = _1062;
    }
    float _1064 = _1044;
    float _1066 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _416);
    float _1068 = _934 * _1052;
    float _1070 = _938 * _1052;
    float _1072 = -_968;
    float _1074 = _1072 + 1.0;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1076;
    float _1080 = float(uint(_532));
    if (_1024)
    {
        float _1082 = _1006 * _369;
        _127 = _1082;
    }
    float _1084 = _127;
    float _1086 = _369;
    if (_770)
    {
        float _1088 = _1064 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        _1086 = _1090;
    }
    float _1092 = _1086;
    if (_766)
    {
        bool _1094 = _1014 > 0.5;
        _1046 = _1094;
    }
    bool _1096 = _1046;
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1100 = _864 + _1098;
    if (!_766)
    {
        _944 = _189;
    }
    float _1102 = _944;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1104;
    float _1108 = _1102;
    if (_766)
    {
        float _1110 = -_189;
        float _1112 = _1096 ? _1110 : _189;
        _1108 = _1112;
    }
    float _1114 = _1108;
    bool _1116 = _400 > 0.5;
    float _1118 = fma(_1106, _836, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1120 = fma(_1078, _836, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1122 = as_type<float>(_363) * _1080;
    float _1124 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1068);
    float _1126 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1070);
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _630 + _1128;
    float _1132 = _1100 * _1100;
    float _1134 = fma(_932, _1038, _1124);
    float _1136 = trunc(_1122);
    float _1138 = precise::max(_1136, 0.0);
    uint _1140 = uint(_1138);
    if (_770)
    {
        bool _1142 = _1092 > 0.5;
        _824 = _1142;
    }
    bool _1144 = _824;
    float _1146 = fma(_936, _1038, _1126);
    int _1148 = abs(_752);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1152 = _956 + _1150;
    int _1154 = ~_309;
    int _1156 = _1154 + 1;
    float _1158 = fma(_1130, _1130, _1132);
    float _1160 = fma(_1118, _1026, _1134);
    float _1162 = fma(_1120, _1026, _1146);
    float _1164 = fma(_1152, _1152, _1158);
    int _1166 = abs(_762);
    float _1168 = _400 + (-0.5);
    float _1170 = float(_1148);
    float _1172 = float(_1166);
    int _1174 = _1156 * int(_1140);
    int _1176 = _1174 + _532;
    float _1178 = float(_740);
    float _1180 = rsqrt(_1164);
    float _1182 = float(uint(_1176));
    float _1184 = _1170 * _1178;
    float _1186 = in.m_48.x;
    float _1188 = in.m_48.y;
    float _1190 = in.m_48.z;
    float _1192 = float(_708);
    float _1194 = as_type<float>(_363) * _1182;
    int _1196 = _638 >> 31;
    float _1198 = _1172 * _1192;
    float _1200 = float(_1000);
    float _1202 = trunc(_1194);
    float _1204 = precise::max(_1202, 0.0);
    uint _1206 = uint(_1204);
    int _1208 = _1196 & 3;
    float _1210 = _1130 * _1180;
    float _1212 = float(_954);
    float _1214 = _1100 * _1180;
    int _1216 = _638 + _1208;
    float _1218 = -_1210;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1222 = _1198 * (-2.0);
    float _1224 = _1200 * _1212;
    int _1226 = _1216 >> 2;
    float _1228 = -_1214;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1100);
    float _1232 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1234 = int(_1232);
    float _1236 = _1224 * (-2.0);
    float _1238 = _1230 * _1230;
    int _1240 = int(_1140) + int(_1206);
    float _1242 = fma(_858, _1236, _858);
    int _1244 = _1226 << 4;
    int _1246 = _1244 + 368;
    float _1248 = fma(_1236, _1186, _1186);
    float _1250 = fma(_1220, _1220, _1238);
    bool _1252 = !_642;
    int _1254 = _1252 ? 0 : 1;
    uint _1256 = uint(int(uint(_1246) >> uint(2)));
    uint _1258 = uint(int(uint(int(_1256)) >> uint(2)));
    int _1260 = int(_1256) & 3;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[int(_1258)][_1260];
    int _1264 = int(_1256) + 1;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    int _1268 = _1264 & 3;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[int(_1266)][_1268];
    bool _1272 = _640 != 3;
    int _1274 = _355 * _1240;
    int _1276 = _1274 + _532;
    float _1278 = in.m_42.x;
    float _1280 = in.m_42.y;
    float _1282 = _1152 * _1180;
    bool _1284 = !_1272;
    int _1286 = _1284 ? 0 : (-1);
    float _1288 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1248);
    bool _1290 = uint(_1276) >= uint(_309);
    int _1292 = _1246 + 8;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[int(_1304)][_1306];
    float _1310 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1162);
    float _1312 = -_1282;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1152);
    float _1316 = _1184 * (-2.0);
    float _1318 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1160);
    bool _1320 = !_1290;
    int _1322 = _1320 ? 0 : (-1);
    float _1324 = fma(_1242, _1084, _1288);
    bool _1326 = _402 > 0.5;
    float _1328 = _402 + (-0.5);
    float _1330 = fma(_1316, _1188, _1188);
    float _1332 = fma(_892, _1316, _892);
    int _1334 = abs(_1254);
    float _1336 = fma(_838, _1222, _838);
    float _1338 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1330);
    float _1340 = fma(_1222, _1190, _1190);
    int _1342 = abs(_722);
    float _1344 = fma(_1314, _1314, _1250);
    float _1346 = fma(_1332, _1084, _1338);
    float _1348 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1340);
    float _1350 = _1310 * _1280;
    int _1352 = abs(_702);
    float _1354 = _1346 * 0.15915493667125701904296875;
    float _1356 = fma(_1336, _1084, _1348);
    int _1358 = ~_1352;
    int _1360 = _1358 + 1;
    int _1362 = _1360 + 1;
    float _1364 = sqrt(_1344);
    int _1366 = abs(_1286);
    float _1368 = _1324 * 0.15915493667125701904296875;
    int _1370 = ~_1334;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    float _1376 = _1318 * _1278;
    float _1378 = _1356 * 0.15915493667125701904296875;
    int _1380 = ~_1240;
    int _1382 = _1380 + _1322;
    int _1384 = _1382 + 1;
    float _1386 = _1354 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1392 = float(uint(_1234));
    int _1394 = _309 * _1384;
    int _1396 = _1394 + _532;
    int _1398 = _1362 * as_type<int>(_1270);
    int _1400 = ~_1342;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    float _1406 = _1368 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    float _1410 = _1180 * _1364;
    int _1412 = _1374 * as_type<int>(_1262);
    int _1414 = _1412 + _1398;
    int _1416 = ~_1366;
    int _1418 = _1416 + 1;
    int _1420 = _1418 + 1;
    float _1422 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1424 = !_438;
    int _1426 = _1424 ? _1396 : (-1);
    int _1428 = _1404 * as_type<int>(_1300);
    int _1430 = _1428 + _1414;
    float _1432 = _1390 * _1410;
    float _1434 = _1354 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = _1422 * _1410;
    int _1440 = _1420 * as_type<int>(_1308);
    int _1442 = _1440 + _1430;
    int _1444 = abs(_1234);
    float _1446 = float(uint(_1444));
    float _1448 = _1368 * 6.283185482025146484375;
    float _1450 = cos(_1448);
    int _1452 = abs(_758);
    float _1454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    int _1458 = ~_1452;
    int _1460 = _1458 + 1;
    int _1462 = _1460 + 1;
    float _1464 = _1432 * _1454;
    float _1466 = _1438 * _1456;
    float _1468 = _1378 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = _1408 * _1436;
    int _1474 = _1442 * _1462;
    int _1476 = _1426 * _1452;
    int _1478 = _1476 + _1474;
    float _1480 = _1378 * 6.283185482025146484375;
    float _1482 = sin(_1480);
    float _1484 = _1450 * _1388;
    int _1486 = abs(_1478);
    float _1488 = float(uint(_1478));
    float _1490 = 1.0 / _1446;
    float _1492 = _1436 * _1470;
    float _1494 = _1450 * _1436;
    float _1496 = _1482 * _1466;
    float _1498 = -_1484;
    float _1500 = fma(_1482, _1472, _1498);
    float _1502 = -_1472;
    float _1504 = fma(_1482, _1484, _1502);
    float _1506 = 1.0 / _1392;
    float _1508 = -_1496;
    float _1510 = fma(_1492, _1464, _1508);
    int _1512 = as_type<int>(_1490) + (-2);
    float _1514 = _1470 * _1466;
    float _1516 = float(uint(_1486));
    float _1518 = _1388 * _1470;
    float _1520 = _1408 * _1388;
    float _1522 = _1450 * _1514;
    float _1524 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1526 = _1524 * 0.5;
    float _1528 = as_type<float>(_1512) * _1516;
    float _1530 = _1408 * _1514;
    float _1532 = fma(_1482, _1494, _1520);
    float _1534 = fma(_1518, _1526, _1510);
    int _1536 = as_type<int>(_1506) + (-2);
    float _1538 = fma(_1482, _1520, _1494);
    float _1540 = fma(_1532, _1464, _1522);
    float _1542 = trunc(_1528);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    float _1548 = fma(_1500, _1464, _1530);
    float _1550 = as_type<float>(_1536) * _1488;
    float _1552 = fma(_1504, _1526, _1540);
    int _1554 = ~_1444;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1538, _1526, _1548);
    int _1560 = ~_1234;
    int _1562 = _1560 + 1;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1568 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1570 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1564);
    float _1572 = _1552 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1574 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1568);
    float _1576 = _1114 + 0.5;
    float _1578 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1570);
    float _1580 = trunc(_1550);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1574);
    float _1588 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1590 = _956 + _1578;
    int _1592 = _1556 * int(_1546);
    int _1594 = _1592 + _1486;
    float _1596 = _630 + _1586;
    float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1600 = _1590 + _1598;
    float _1602 = _1588 * _1566;
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1606 = _1596 + _1604;
    float _1608 = float(uint(_1594));
    float _1610 = _1600 * _1600;
    float _1612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1618 = fma(_1606, _1606, _1610);
    int _1620 = _1562 * int(_1584);
    int _1622 = _1620 + _1478;
    float _1624 = _1610;
    float _1626 = _1590;
    float _1628 = _1596;
    if (!_770)
    {
        _1624 = _193;
    }
    float _1630 = _1624;
    float _1632 = as_type<float>(_1512) * _1608;
    float _1634 = _1630;
    if (_770)
    {
        float _1636 = -_193;
        float _1638 = _1144 ? _1636 : _193;
        _1634 = _1638;
    }
    float _1640 = _1634;
    float _1642 = sqrt(_1618);
    float _1644 = float(uint(_1622));
    float _1646 = -_1640;
    float _1648 = _1646 + 0.5;
    float _1650 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1658 = as_type<float>(_1536) * _1644;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1662 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1664 = _1656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1666 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1668 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1670 = _1654 * _1612;
    float _1672 = trunc(_1658);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1680 = _1642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_50.x = _1602;
    out.m_50.y = _1670;
    float _1682 = fma(_1534, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1572);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1686 = trunc(_1632);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    float _1692 = _1678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1694 = fma(_1558, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1682);
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1698 = -_189;
    int _1700 = _1116 ? as_type<int>(_1698) : as_type<int>(_189);
    out.m_52.x = _1692;
    out.m_52.y = _1650;
    out.m_52.z = _1662;
    out.m_52.w = _1684;
    float _1702 = _864 + _1694;
    float _1704 = -_193;
    int _1706 = _1326 ? as_type<int>(_1704) : as_type<int>(_193);
    out.m_54.x = _1664;
    out.m_54.y = _1666;
    out.m_54.z = _1668;
    out.m_54.w = _1696;
    bool _1708 = !_774;
    float _1710 = _1708 ? _189 : as_type<float>(_1700);
    bool _1712 = !_782;
    float _1714 = _1712 ? _193 : as_type<float>(_1706);
    int _1716 = int(_1584) + int(_1676);
    int _1718 = int(_1546) + int(_1690);
    int _1720 = ~_1234;
    int _1722 = _1720 + 1;
    float _1724 = _1650;
    if (!_1680)
    {
        _1724 = _1702;
    }
    float _1726 = _1724;
    int _1728 = ~_1444;
    int _1730 = _1728 + 1;
    bool _1732 = !_1680;
    float _1734 = _1726;
    if (!_1732)
    {
        float _1736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1740 = _1642 + _1738;
        float _1742 = _1702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1744 = rsqrt(_1618);
        float _1746 = _1740 * _1736;
        float _1748 = _1746 * 0.15915493667125701904296875;
        float _1750 = _1748 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = _1748 * 6.283185482025146484375;
        float _1756 = sin(_1754);
        float _1758 = _1752 + (-1.0);
        float _1760 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1762 = fma(_1756, _1742, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1764 = fma(_1702, _1752, _1760);
        float _1766 = _1744 * _1762;
        float _1768 = fma(_1606, _1766, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1770 = fma(_1600, _1766, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1734 = _1764;
        _1626 = _1770;
        _1628 = _1768;
    }
    float _1772 = _1734;
    float _1774 = _1626;
    float _1776 = _1628;
    float _1778 = -_1214;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1772);
    int _1782 = _1730 * _1718;
    int _1784 = _1782 + _1486;
    float _1786 = -_1282;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1774);
    float _1790 = -_1210;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1776);
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _1796 = _1722 * _1716;
    int _1798 = _1796 + _1478;
    bool _1800 = uint(_1784) >= uint(_1444);
    float _1802 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1804 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1794);
    int _1806 = _1478 ^ _1234;
    float _1808 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1810 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1812 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1802);
    bool _1814 = !_1800;
    int _1816 = _1814 ? 0 : (-1);
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1820 = uint(int(uint(_1806) >> uint(31)));
    float _1822 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    bool _1824 = uint(_1798) >= uint(_1234);
    float _1826 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1808);
    int _1828 = ~_1816;
    int _1830 = _1718 + _1828;
    int _1832 = _1830 + 1;
    float _1834 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1804);
    int _1836 = ~int(_1820);
    int _1838 = _1836 + 1;
    float _1840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1842 = !_1824;
    int _1844 = _1842 ? 0 : (-1);
    float _1846 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1810);
    int _1848 = _1832 ^ _1838;
    float _1850 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _1852 = ~_1716;
    int _1854 = _1852 + _1844;
    int _1856 = _1854 + 1;
    float _1858 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1860 = _1234 == 0;
    float _1862 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    int _1864 = ~_1838;
    int _1866 = _1864 + _1848;
    int _1868 = _1866 + 1;
    int _1870 = _1234 * _1856;
    int _1872 = _1870 + _1478;
    bool _1874 = _1234 == 0;
    float _1876 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1878 = !_1860;
    int _1880 = _1878 ? _1868 : (-1);
    float _1882 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1884 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1886 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1826);
    float _1888 = _1850 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1890 = !_1874;
    int _1892 = _1890 ? _1872 : (-1);
    float _1894 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1896 = float(_1880);
    float _1898 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1846);
    float _1900 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1882);
    float _1902 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1888);
    float _1904 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1906 = float(_1892);
    float _1908 = -_1060;
    float _1910 = fma(_1894, _1896, _1908);
    float _1912 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1862);
    float _1914 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1884);
    float _1916 = _1714 + (-0.5);
    float _1918 = _1898 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1920 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1922 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1902);
    float _1924 = fma(_1876, _1906, _1056);
    float _1926 = _1710 + 0.5;
    float _1928 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1912);
    float _1930 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1914);
    float _1932 = -_1894;
    float _1934 = fma(_1932, _1916, _1910);
    float _1936 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1920);
    float _1938 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    float _1940 = fma(_1876, _1926, _1924);
    float _1942 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1928);
    float _1944 = -_1058;
    float _1946 = _1944 + 1.0;
    float _1948 = _1936 + _1938;
    float _1950 = _1938 * 0.5;
    float _1952 = -_1066;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1930);
    float _1958 = -_1946;
    float _1960 = fma(_1710, _1958, _1940);
    float _1962 = _1948 * 0.5;
    float _1964 = fma(_1942, -0.5, _1950);
    float _1966 = fma(_1714, _1954, _1934);
    out.gl_Position.x = _1936;
    out.gl_Position.y = _1942;
    out.gl_Position.z = _1956;
    out.gl_Position.w = _1938;
    out.m_56.w = _1938;
    out.m_56.x = _1962;
    out.m_56.y = _1964;
    out.m_58.x = _1960;
    out.m_58.y = _1966;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

