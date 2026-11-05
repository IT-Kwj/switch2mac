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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1276 = false;
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_89);
        out.gl_Position.z = _1533;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_103)
    {
        float _109 = float(_73);
        _83 = _109;
    }
    float _111 = _83;
    bool _113 = _107 >= _111;
    bool _115 = !_103;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _91 = as_type<int>(_123);
    }
    int _125 = _91;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_125);
        out.gl_Position.z = _1602;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_39.w;
    float _129 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _129;
    if (!_139)
    {
        float _157 = _129 * _129;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    bool _169 = !_139;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _129 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _129);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _201;
    }
    float _203 = _171;
    bool _205 = !_139;
    if (!_205)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _129 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _155 = _225;
    }
    float _227 = _155;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _141, _231);
    float _239 = fma(_227, _143, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _147);
    float _245 = fma(_239, _127, _149);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _269;
    float _271;
    if (!_249)
    {
        float _251 = in.m_41.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = float(_73);
        float _257 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _261 = _259 * _253;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = _255;
        _273 = true;
    }
    else
    {
        float _275 = float(_73);
        float _277 = 1.0 / _275;
        float _279 = _107 * _277;
        _269 = _279;
        _271 = _275;
    }
    _273 = false;
    float _281 = _269;
    float _283 = _271;
    float _285 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _287 = int(_285);
    float _289 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _291 = int(_289);
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _295 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_281);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = float(_287);
    float _309 = 1.0 / _283;
    float _311 = float(uint(_291));
    float _313 = 1.0 / _307;
    int _315 = ~_291;
    int _317 = _315 + 1;
    int _319 = ~_291;
    int _321 = _319 + 1;
    bool _323 = _291 == 0;
    float _325 = 1.0 / _311;
    float _327 = _107 * _313;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _331 = _329 != 0;
    float _333 = trunc(_327);
    int _335 = int(_333);
    int _337 = as_type<int>(_325) + (-2);
    bool _339 = !_331;
    float _341 = _339 ? 7.345489978790283203125 : 1.0;
    float _343 = float(uint(_335));
    float _345 = float(_335);
    float _347 = as_type<float>(_337) * _343;
    float _349 = in.m_41.x;
    float _351 = in.m_41.y;
    float _353 = trunc(_347);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    int _360 = _317 * int(_358);
    int _362 = _360 + _335;
    float _364 = float(uint(_362));
    float _366 = _341 * _349;
    float _368 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _293);
    float _370 = as_type<float>(_337) * _364;
    float _372 = float(_291);
    float _374 = floor(_366);
    bool _376 = _345 >= _372;
    bool _378 = isnan(_345);
    bool _380 = _376 || _378;
    bool _382 = isnan(_372);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = trunc(_370);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = trunc(_386);
    int _396 = int(_394);
    float _398 = -_374;
    float _400 = _366 + _398;
    int _402 = int(_358) + int(_392);
    int _404 = _321 * _402;
    int _406 = _404 + _335;
    int _408 = ~_396;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    bool _414 = uint(_406) >= uint(_291);
    bool _416 = !_414;
    int _418 = _416 ? 0 : (-1);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _430 = _428 != 0;
    int _432 = ~_402;
    int _434 = _432 + _418;
    int _436 = _434 + 1;
    float _438 = _400 * _372;
    float _440 = _107 * _372;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _444 = _442 != 0;
    int _446 = _291 * _436;
    int _448 = _446 + _335;
    float _450 = _440 * _309;
    float _452 = trunc(_438);
    int _454 = int(_452);
    bool _456 = !_444;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_323;
    int _462 = _460 ? _448 : (-1);
    int _464 = _291 + (-1);
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _468 = _466 != 0;
    int _470 = _462 * _412;
    bool _472 = !_426;
    int _474 = _472 ? 0 : 1;
    float _476 = trunc(_450);
    int _478 = int(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _482 = _480 != 0;
    int _484 = _396 * _464;
    int _486 = _484 + _470;
    bool _488 = !_422;
    int _490 = _488 ? 0 : 1;
    int _492 = abs(_474);
    int _494 = abs(_458);
    bool _496 = !_430;
    int _498 = _496 ? 0 : 1;
    int _500 = abs(_490);
    int _502 = _454 * _494;
    int _504 = _502 + _335;
    bool _506 = !_468;
    int _508 = _506 ? 0 : 1;
    int _510 = abs(_498);
    int _512 = _486 * _492;
    float _514 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _516 = abs(_508);
    int _518 = _478 * _500;
    int _520 = _518 + _512;
    float _522 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _526 = _524 != 0;
    int _528 = _504 * _510;
    int _530 = _528 + _520;
    int _532 = ~_291;
    int _534 = _532 + 1;
    float _536 = as_type<float>(int(gl_VertexIndex));
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _540 = _538 != 0;
    int _542 = _454 * _516;
    int _544 = _542 + _530;
    float _546 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _550 = float(uint(_544));
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = as_type<float>(_337) * _550;
    float _558 = trunc(_556);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    int _564 = as_type<int>(_536) & 1;
    bool _566 = _564 != 0;
    int _568 = as_type<int>(_536) & 2;
    bool _570 = _568 != 0;
    int _572 = ~_291;
    int _574 = _572 + 1;
    int _576 = _534 * int(_562);
    int _578 = _576 + _544;
    float _580 = float(uint(_578));
    float _582 = as_type<float>(_337) * _580;
    float _584 = trunc(_582);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _598 = int(_562) + int(_588);
    float _600 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = 1.0 / _592;
    float _604 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _606 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    int _608 = _574 * _598;
    int _610 = _608 + _544;
    float _612 = -_552;
    float _614 = fma(_604, 2.0, _612);
    float _616 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = 1.0 / _596;
    bool _620 = uint(_610) >= uint(_291);
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _624 = fma(_616, -2.0, _554);
    float _626 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    bool _628 = !_620;
    int _630 = _628 ? 0 : (-1);
    float _632 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _622);
    bool _634 = _349 > 0.5;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _638 = _281 + _636;
    bool _640 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _642 = isnan(_281);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -_107;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[76].x, _614);
    bool _656 = !_566;
    float _658 = _656 ? (-0.5) : 0.5;
    float _660 = _638 * _602;
    bool _662 = _351 > 0.5;
    float _664 = -_650;
    float _666 = _664 + 1.0;
    bool _668 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _670 = isnan(_281);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _281 + _680;
    int _684 = ~_598;
    int _686 = _684 + _630;
    int _688 = _686 + 1;
    float _690 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _692 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _694 = _678 * _666;
    float _696 = -_678;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _704;
    float _708 = _682 * _618;
    float _710 = _305 * _698;
    float _712 = fma(_702, _660, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _714 = fma(_706, _660, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _716 = float(uint(_504));
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _722 = _712 * _710;
    float _724 = _714 * _710;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _730 = as_type<float>(_337) * _716;
    float _732 = in.m_39.x;
    float _734 = in.m_39.y;
    float _736 = -_305;
    float _738 = _736 + 1.0;
    float _740 = fma(_720, _708, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _742 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _548);
    float _744 = fma(_728, _708, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _746 = trunc(_730);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _722);
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _724);
    int _756 = ~_291;
    int _758 = _756 + 1;
    int _760 = _291 * _688;
    int _762 = _760 + _544;
    float _764 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _624);
    float _766 = fma(_740, _694, _752);
    float _768 = fma(_744, _694, _754);
    bool _770 = !_323;
    int _772 = _770 ? _762 : (-1);
    float _774 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _776 = ~_291;
    int _778 = _776 + 1;
    float _780 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    float _782 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _784 = _758 * int(_750);
    int _786 = _784 + _504;
    float _788 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _368);
    float _790 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[145].x, _766);
    float _792 = _780 * _734;
    float _794 = float(uint(_786));
    float _796 = _790 * _732;
    int _798 = _772 >> 31;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _802 = !_570;
    float _804 = _802 ? (-0.5) : 0.5;
    float _806 = as_type<float>(_337) * _794;
    int _808 = _798 & 3;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _812 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _804);
    int _816 = _772 + _808;
    float _818 = trunc(_806);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = _812 * _810;
    float _826 = _800 * _814;
    int _828 = _816 >> 2;
    float _830 = -_658;
    int _832 = _634 ? as_type<int>(_830) : as_type<int>(_658);
    float _834 = _826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _836 = _826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _838 = _828 << 4;
    int _840 = _838 + 368;
    float _842 = _826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _844 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _834);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _836);
    uint _848 = uint(int(uint(_840) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[int(_858)][_860];
    bool _864 = !_526;
    float _866 = _864 ? _658 : as_type<float>(_832);
    float _868 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _844);
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _846);
    int _872 = int(_750) + int(_822);
    float _874 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _876 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _878 = _868 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _880 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _882 = _772 & 3;
    bool _884 = _882 != 0;
    int _886 = _778 * _872;
    int _888 = _886 + _504;
    float _890 = _874 + _878;
    float _892 = _876 + _880;
    int _894 = _772 & 3;
    bool _896 = _894 != 0;
    float _898 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _842);
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _902 = _890 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _906 = _892 + _904;
    float _908 = -_804;
    int _910 = _662 ? as_type<int>(_908) : as_type<int>(_804);
    float _912 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _898);
    bool _914 = uint(_894) > 1u;
    float _916 = _902 * _902;
    float _918 = _906 * _906;
    bool _920 = !_540;
    float _922 = _920 ? _804 : as_type<float>(_910);
    bool _924 = uint(_888) >= uint(_291);
    float _926 = _916 + _918;
    int _928 = _884 ? 0 : 1;
    int _930 = _840 + 8;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    uint _934 = uint(int(uint(int(_932)) >> uint(2)));
    int _936 = int(_932) & 3;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[int(_934)][_936];
    int _940 = int(_932) + 1;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    int _944 = _940 & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    bool _948 = !_896;
    int _950 = _948 ? 0 : 1;
    float _952 = sqrt(_926);
    int _954 = ~_928;
    int _956 = _954 + 1;
    int _958 = _956 + 1;
    int _960 = _958;
    float _962 = _890;
    float _964 = _892;
    if (!_914)
    {
        int _966 = ~_928;
        int _968 = _966 + 1;
        _960 = _968;
    }
    int _970 = _960;
    float _972 = _866 + 0.5;
    bool _974 = !_924;
    int _976 = _974 ? 0 : (-1);
    bool _978 = _894 != 3;
    float _980 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[80].x, _654);
    int _982 = abs(_970);
    bool _984 = uint(_894) >= 2u;
    int _986 = abs(_950);
    int _988 = ~_982;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    bool _994 = _894 != 3;
    int _996 = _984 ? 0 : 1;
    int _998 = _992 * as_type<int>(_862);
    float _1000 = _912 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1002 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1004 = ~_986;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = _782 + _1000;
    int _1012 = ~_996;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    int _1018 = _1016;
    float _1020 = _854;
    if (_978)
    {
        int _1022 = ~_996;
        int _1024 = _1022 + 1;
        _1018 = _1024;
    }
    int _1026 = _1018;
    int _1028 = _1008 * as_type<int>(_854);
    int _1030 = _1028 + _998;
    bool _1032 = !_482;
    float _1034 = _1032 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1036 = !_994;
    float _1038 = _1036 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1040 = abs(_1026);
    int _1042 = ~_872;
    int _1044 = _1042 + _976;
    int _1046 = _1044 + 1;
    int _1048 = abs(as_type<int>(_1034));
    int _1050 = abs(as_type<int>(_1038));
    float _1052 = _1034;
    float _1054 = _1038;
    if (!_1002)
    {
        _1052 = _918;
    }
    float _1056 = _1052;
    float _1058 = _1056;
    if (!_1002)
    {
        _1020 = _916;
    }
    float _1060 = _1020;
    int _1062 = ~_1040;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = _1060;
    if (!_1002)
    {
        _1054 = _1010;
    }
    float _1070 = _1054;
    bool _1072 = !_1002;
    float _1074 = _1070;
    if (!_1072)
    {
        float _1076 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1080 = _952 + _1078;
        float _1082 = rsqrt(_926);
        float _1084 = _1080 * _1076;
        float _1086 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = _1084 * 0.15915493667125701904296875;
        float _1090 = _1088 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        float _1098 = fma(_1092, _1086, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1100 = _1082 * _1098;
        float _1102 = _1096 + (-1.0);
        float _1104 = fma(_902, _1100, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1106 = fma(_906, _1100, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1108 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1112 = _1104 + _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1116 = _1106 + _1114;
        float _1118 = fma(_1010, _1096, _1108);
        float _1120 = _1112 * _1112;
        float _1122 = _1116 * _1116;
        _1074 = _1118;
        _1068 = _1120;
        _1058 = _1122;
        _962 = _1104;
        _964 = _1106;
    }
    float _1124 = _1074;
    float _1126 = _1068;
    float _1128 = _1058;
    float _1130 = _962;
    float _1132 = _964;
    int _1134 = _1066 * as_type<int>(_938);
    int _1136 = _1134 + _1030;
    int _1138 = ~_1050;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1124 + _1144;
    int _1148 = _291 * _1046;
    int _1150 = _1148 + _504;
    int _1152 = ~_1048;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = -_692;
    float _1160 = _1158 + 1.0;
    int _1162 = _1142 * as_type<int>(_946);
    int _1164 = _1162 + _1136;
    float _1166 = fma(_1146, _1146, _1126);
    float _1168 = _922 + (-0.5);
    bool _1170 = !_323;
    int _1172 = _1170 ? _1150 : (-1);
    int _1174 = _1164 * _1156;
    float _1176 = _1166 + _1128;
    float _1178 = -_1168;
    float _1180 = -_764;
    float _1182 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1180);
    float _1184 = -_1160;
    float _1186 = fma(_866, _1184, _980);
    int _1188 = _1172 * _1048;
    int _1190 = _1188 + _1174;
    float _1192 = -_788;
    float _1194 = _1192 + 1.0;
    float _1196 = sqrt(_1176);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = fma(_922, _1194, _1182);
    float _1226 = float(_1190);
    out.m_46.x = _1208;
    out.m_46.y = _1212;
    out.m_46.z = _1216;
    out.m_46.w = _1214;
    bool _1228 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1230 = isnan(_1196);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1236 = _1232 || _1234;
    out.m_48.x = _1218;
    out.m_48.y = _1220;
    out.m_48.z = _1222;
    out.m_50.x = _1186;
    out.m_50.y = _1224;
    out.m_52.x = _1226;
    float _1238 = _1210;
    float _1240 = _1216;
    if (!_1236)
    {
        _1238 = 1.0;
    }
    float _1242 = _1238;
    bool _1244 = !_1236;
    float _1246 = _1242;
    if (!_1244)
    {
        bool _1248 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1250 = isnan(_1196);
        bool _1252 = _1248 || _1250;
        bool _1254 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1256 = _1252 || _1254;
        if (!_1256)
        {
            float _1258 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1260 = _1196 + _1258;
            float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1264 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1262;
            float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1268 = _1266 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1270 = 1.0 / _1264;
            float _1272 = _1260 * _1270;
            float _1274 = fma(_1272, _1268, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1246 = _1274;
            _1276 = true;
        }
        else
        {
            bool _1278 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1280 = isnan(_1196);
            bool _1282 = _1278 || _1280;
            bool _1284 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1286 = _1282 || _1284;
            if (!_1286)
            {
                float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1290 = _1196 + _1288;
                float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1294 = _1292 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1298 = _1296 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1300 = 1.0 / _1294;
                float _1302 = _1290 * _1300;
                float _1304 = fma(_1302, _1298, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1246 = _1304;
                _1276 = true;
            }
            else
            {
                _1246 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1276 = false;
    float _1306 = _1246;
    float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1310 = _1130 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1314 = _1124 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1318 = _1132 + _1316;
    bool _1320 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    float _1330 = fma(_1310, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1332 = fma(_1314, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1334 = fma(_1318, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1336 = _1318;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1328)
    {
        _1240 = _1330;
    }
    float _1340 = _1240;
    float _1342 = _1340;
    if (_1328)
    {
        _1336 = _1332;
    }
    float _1344 = _1336;
    float _1346 = _1344;
    if (_1328)
    {
        _1338 = _1334;
    }
    float _1348 = _1338;
    float _1350 = _1348;
    if (!_1328)
    {
        float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1354 = _782 + _1352;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1358 = _874 + _1356;
        float _1360 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1362 = _1354 * _1354;
        float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1366 = _876 + _1364;
        float _1368 = fma(_1358, _1358, _1362);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1366, _1366, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = -_874;
        float _1384 = _1382 + _1330;
        float _1386 = -_876;
        float _1388 = _1386 + _1334;
        float _1390 = _1376 * _1380;
        float _1392 = -_782;
        float _1394 = _1392 + _1332;
        float _1396 = fma(_1384, _1390, _874);
        float _1398 = fma(_1394, _1390, _782);
        float _1400 = fma(_1388, _1390, _876);
        _1346 = _1398;
        _1342 = _1396;
        _1350 = _1400;
    }
    float _1402 = _1346;
    float _1404 = _1342;
    float _1406 = _1350;
    float _1408 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1418 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1416);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1440);
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1454);
    float _1464 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1456);
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1458);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1460);
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1462);
    float _1472 = _1464 + _1466;
    float _1474 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1472 * 0.5;
    out.m_35.x = _1474;
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1464;
    out.gl_Position.w = _1466;
    out.m_54.z = _1476;
    out.m_54.w = _1466;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1276 = false;
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_89);
        out.gl_Position.z = _1533;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_103)
    {
        float _109 = float(_73);
        _83 = _109;
    }
    float _111 = _83;
    bool _113 = _107 >= _111;
    bool _115 = !_103;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _91 = as_type<int>(_123);
    }
    int _125 = _91;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_125);
        out.gl_Position.z = _1602;
    }
    if (_117)
    {
        return out;
    }
    float _127 = in.m_39.w;
    float _129 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _129;
    if (!_139)
    {
        float _157 = _129 * _129;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    bool _169 = !_139;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _129 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _129);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _201;
    }
    float _203 = _171;
    bool _205 = !_139;
    if (!_205)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _129 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _155 = _225;
    }
    float _227 = _155;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _141, _231);
    float _239 = fma(_227, _143, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _147);
    float _245 = fma(_239, _127, _149);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _269;
    float _271;
    if (!_249)
    {
        float _251 = in.m_41.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = float(_73);
        float _257 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _261 = _259 * _253;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = _255;
        _273 = true;
    }
    else
    {
        float _275 = float(_73);
        float _277 = 1.0 / _275;
        float _279 = _107 * _277;
        _269 = _279;
        _271 = _275;
    }
    _273 = false;
    float _281 = _269;
    float _283 = _271;
    float _285 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _287 = int(_285);
    float _289 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _291 = int(_289);
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _295 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_281);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = float(_287);
    float _309 = 1.0 / _283;
    float _311 = float(uint(_291));
    float _313 = 1.0 / _307;
    int _315 = ~_291;
    int _317 = _315 + 1;
    int _319 = ~_291;
    int _321 = _319 + 1;
    bool _323 = _291 == 0;
    float _325 = 1.0 / _311;
    float _327 = _107 * _313;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _331 = _329 != 0;
    float _333 = trunc(_327);
    int _335 = int(_333);
    int _337 = as_type<int>(_325) + (-2);
    bool _339 = !_331;
    float _341 = _339 ? 7.345489978790283203125 : 1.0;
    float _343 = float(uint(_335));
    float _345 = float(_335);
    float _347 = as_type<float>(_337) * _343;
    float _349 = in.m_41.x;
    float _351 = in.m_41.y;
    float _353 = trunc(_347);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    int _360 = _317 * int(_358);
    int _362 = _360 + _335;
    float _364 = float(uint(_362));
    float _366 = _341 * _349;
    float _368 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _293);
    float _370 = as_type<float>(_337) * _364;
    float _372 = float(_291);
    float _374 = floor(_366);
    bool _376 = _345 >= _372;
    bool _378 = isnan(_345);
    bool _380 = _376 || _378;
    bool _382 = isnan(_372);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = trunc(_370);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = trunc(_386);
    int _396 = int(_394);
    float _398 = -_374;
    float _400 = _366 + _398;
    int _402 = int(_358) + int(_392);
    int _404 = _321 * _402;
    int _406 = _404 + _335;
    int _408 = ~_396;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    bool _414 = uint(_406) >= uint(_291);
    bool _416 = !_414;
    int _418 = _416 ? 0 : (-1);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _430 = _428 != 0;
    int _432 = ~_402;
    int _434 = _432 + _418;
    int _436 = _434 + 1;
    float _438 = _400 * _372;
    float _440 = _107 * _372;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _444 = _442 != 0;
    int _446 = _291 * _436;
    int _448 = _446 + _335;
    float _450 = _440 * _309;
    float _452 = trunc(_438);
    int _454 = int(_452);
    bool _456 = !_444;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_323;
    int _462 = _460 ? _448 : (-1);
    int _464 = _291 + (-1);
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _468 = _466 != 0;
    int _470 = _462 * _412;
    bool _472 = !_426;
    int _474 = _472 ? 0 : 1;
    float _476 = trunc(_450);
    int _478 = int(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _482 = _480 != 0;
    int _484 = _396 * _464;
    int _486 = _484 + _470;
    bool _488 = !_422;
    int _490 = _488 ? 0 : 1;
    int _492 = abs(_474);
    int _494 = abs(_458);
    bool _496 = !_430;
    int _498 = _496 ? 0 : 1;
    int _500 = abs(_490);
    int _502 = _454 * _494;
    int _504 = _502 + _335;
    bool _506 = !_468;
    int _508 = _506 ? 0 : 1;
    int _510 = abs(_498);
    int _512 = _486 * _492;
    float _514 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _516 = abs(_508);
    int _518 = _478 * _500;
    int _520 = _518 + _512;
    float _522 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _526 = _524 != 0;
    int _528 = _504 * _510;
    int _530 = _528 + _520;
    int _532 = ~_291;
    int _534 = _532 + 1;
    float _536 = as_type<float>(int(gl_VertexIndex));
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _540 = _538 != 0;
    int _542 = _454 * _516;
    int _544 = _542 + _530;
    float _546 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _550 = float(uint(_544));
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = as_type<float>(_337) * _550;
    float _558 = trunc(_556);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    int _564 = as_type<int>(_536) & 1;
    bool _566 = _564 != 0;
    int _568 = as_type<int>(_536) & 2;
    bool _570 = _568 != 0;
    int _572 = ~_291;
    int _574 = _572 + 1;
    int _576 = _534 * int(_562);
    int _578 = _576 + _544;
    float _580 = float(uint(_578));
    float _582 = as_type<float>(_337) * _580;
    float _584 = trunc(_582);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _598 = int(_562) + int(_588);
    float _600 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = 1.0 / _592;
    float _604 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _606 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    int _608 = _574 * _598;
    int _610 = _608 + _544;
    float _612 = -_552;
    float _614 = fma(_604, 2.0, _612);
    float _616 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = 1.0 / _596;
    bool _620 = uint(_610) >= uint(_291);
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _624 = fma(_616, -2.0, _554);
    float _626 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    bool _628 = !_620;
    int _630 = _628 ? 0 : (-1);
    float _632 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _622);
    bool _634 = _349 > 0.5;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _638 = _281 + _636;
    bool _640 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _642 = isnan(_281);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -_107;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[76].x, _614);
    bool _656 = !_566;
    float _658 = _656 ? (-0.5) : 0.5;
    float _660 = _638 * _602;
    bool _662 = _351 > 0.5;
    float _664 = -_650;
    float _666 = _664 + 1.0;
    bool _668 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _670 = isnan(_281);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _281 + _680;
    int _684 = ~_598;
    int _686 = _684 + _630;
    int _688 = _686 + 1;
    float _690 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _692 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _694 = _678 * _666;
    float _696 = -_678;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _704;
    float _708 = _682 * _618;
    float _710 = _305 * _698;
    float _712 = fma(_702, _660, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _714 = fma(_706, _660, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _716 = float(uint(_504));
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _722 = _712 * _710;
    float _724 = _714 * _710;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _730 = as_type<float>(_337) * _716;
    float _732 = in.m_39.x;
    float _734 = in.m_39.y;
    float _736 = -_305;
    float _738 = _736 + 1.0;
    float _740 = fma(_720, _708, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _742 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _548);
    float _744 = fma(_728, _708, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _746 = trunc(_730);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _722);
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _724);
    int _756 = ~_291;
    int _758 = _756 + 1;
    int _760 = _291 * _688;
    int _762 = _760 + _544;
    float _764 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _624);
    float _766 = fma(_740, _694, _752);
    float _768 = fma(_744, _694, _754);
    bool _770 = !_323;
    int _772 = _770 ? _762 : (-1);
    float _774 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _776 = ~_291;
    int _778 = _776 + 1;
    float _780 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    float _782 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _784 = _758 * int(_750);
    int _786 = _784 + _504;
    float _788 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _368);
    float _790 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[145].x, _766);
    float _792 = _780 * _734;
    float _794 = float(uint(_786));
    float _796 = _790 * _732;
    int _798 = _772 >> 31;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _802 = !_570;
    float _804 = _802 ? (-0.5) : 0.5;
    float _806 = as_type<float>(_337) * _794;
    int _808 = _798 & 3;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _812 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _804);
    int _816 = _772 + _808;
    float _818 = trunc(_806);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = _812 * _810;
    float _826 = _800 * _814;
    int _828 = _816 >> 2;
    float _830 = -_658;
    int _832 = _634 ? as_type<int>(_830) : as_type<int>(_658);
    float _834 = _826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _836 = _826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _838 = _828 << 4;
    int _840 = _838 + 368;
    float _842 = _826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _844 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _834);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _836);
    uint _848 = uint(int(uint(_840) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[int(_858)][_860];
    bool _864 = !_526;
    float _866 = _864 ? _658 : as_type<float>(_832);
    float _868 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _844);
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _846);
    int _872 = int(_750) + int(_822);
    float _874 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _876 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _878 = _868 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _880 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _882 = _772 & 3;
    bool _884 = _882 != 0;
    int _886 = _778 * _872;
    int _888 = _886 + _504;
    float _890 = _874 + _878;
    float _892 = _876 + _880;
    int _894 = _772 & 3;
    bool _896 = _894 != 0;
    float _898 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _842);
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _902 = _890 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _906 = _892 + _904;
    float _908 = -_804;
    int _910 = _662 ? as_type<int>(_908) : as_type<int>(_804);
    float _912 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _898);
    bool _914 = uint(_894) > 1u;
    float _916 = _902 * _902;
    float _918 = _906 * _906;
    bool _920 = !_540;
    float _922 = _920 ? _804 : as_type<float>(_910);
    bool _924 = uint(_888) >= uint(_291);
    float _926 = _916 + _918;
    int _928 = _884 ? 0 : 1;
    int _930 = _840 + 8;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    uint _934 = uint(int(uint(int(_932)) >> uint(2)));
    int _936 = int(_932) & 3;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[int(_934)][_936];
    int _940 = int(_932) + 1;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    int _944 = _940 & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    bool _948 = !_896;
    int _950 = _948 ? 0 : 1;
    float _952 = sqrt(_926);
    int _954 = ~_928;
    int _956 = _954 + 1;
    int _958 = _956 + 1;
    int _960 = _958;
    float _962 = _890;
    float _964 = _892;
    if (!_914)
    {
        int _966 = ~_928;
        int _968 = _966 + 1;
        _960 = _968;
    }
    int _970 = _960;
    float _972 = _866 + 0.5;
    bool _974 = !_924;
    int _976 = _974 ? 0 : (-1);
    bool _978 = _894 != 3;
    float _980 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[80].x, _654);
    int _982 = abs(_970);
    bool _984 = uint(_894) >= 2u;
    int _986 = abs(_950);
    int _988 = ~_982;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    bool _994 = _894 != 3;
    int _996 = _984 ? 0 : 1;
    int _998 = _992 * as_type<int>(_862);
    float _1000 = _912 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1002 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1004 = ~_986;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = _782 + _1000;
    int _1012 = ~_996;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    int _1018 = _1016;
    float _1020 = _854;
    if (_978)
    {
        int _1022 = ~_996;
        int _1024 = _1022 + 1;
        _1018 = _1024;
    }
    int _1026 = _1018;
    int _1028 = _1008 * as_type<int>(_854);
    int _1030 = _1028 + _998;
    bool _1032 = !_482;
    float _1034 = _1032 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1036 = !_994;
    float _1038 = _1036 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1040 = abs(_1026);
    int _1042 = ~_872;
    int _1044 = _1042 + _976;
    int _1046 = _1044 + 1;
    int _1048 = abs(as_type<int>(_1034));
    int _1050 = abs(as_type<int>(_1038));
    float _1052 = _1034;
    float _1054 = _1038;
    if (!_1002)
    {
        _1052 = _918;
    }
    float _1056 = _1052;
    float _1058 = _1056;
    if (!_1002)
    {
        _1020 = _916;
    }
    float _1060 = _1020;
    int _1062 = ~_1040;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = _1060;
    if (!_1002)
    {
        _1054 = _1010;
    }
    float _1070 = _1054;
    bool _1072 = !_1002;
    float _1074 = _1070;
    if (!_1072)
    {
        float _1076 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1080 = _952 + _1078;
        float _1082 = rsqrt(_926);
        float _1084 = _1080 * _1076;
        float _1086 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = _1084 * 0.15915493667125701904296875;
        float _1090 = _1088 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        float _1098 = fma(_1092, _1086, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1100 = _1082 * _1098;
        float _1102 = _1096 + (-1.0);
        float _1104 = fma(_902, _1100, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1106 = fma(_906, _1100, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1108 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1112 = _1104 + _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1116 = _1106 + _1114;
        float _1118 = fma(_1010, _1096, _1108);
        float _1120 = _1112 * _1112;
        float _1122 = _1116 * _1116;
        _1074 = _1118;
        _1068 = _1120;
        _1058 = _1122;
        _962 = _1104;
        _964 = _1106;
    }
    float _1124 = _1074;
    float _1126 = _1068;
    float _1128 = _1058;
    float _1130 = _962;
    float _1132 = _964;
    int _1134 = _1066 * as_type<int>(_938);
    int _1136 = _1134 + _1030;
    int _1138 = ~_1050;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1124 + _1144;
    int _1148 = _291 * _1046;
    int _1150 = _1148 + _504;
    int _1152 = ~_1048;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = -_692;
    float _1160 = _1158 + 1.0;
    int _1162 = _1142 * as_type<int>(_946);
    int _1164 = _1162 + _1136;
    float _1166 = fma(_1146, _1146, _1126);
    float _1168 = _922 + (-0.5);
    bool _1170 = !_323;
    int _1172 = _1170 ? _1150 : (-1);
    int _1174 = _1164 * _1156;
    float _1176 = _1166 + _1128;
    float _1178 = -_1168;
    float _1180 = -_764;
    float _1182 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1180);
    float _1184 = -_1160;
    float _1186 = fma(_866, _1184, _980);
    int _1188 = _1172 * _1048;
    int _1190 = _1188 + _1174;
    float _1192 = -_788;
    float _1194 = _1192 + 1.0;
    float _1196 = sqrt(_1176);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = fma(_922, _1194, _1182);
    float _1226 = float(_1190);
    out.m_46.x = _1208;
    out.m_46.y = _1212;
    out.m_46.z = _1216;
    out.m_46.w = _1214;
    bool _1228 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1230 = isnan(_1196);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1236 = _1232 || _1234;
    out.m_48.x = _1218;
    out.m_48.y = _1220;
    out.m_48.z = _1222;
    out.m_50.x = _1186;
    out.m_50.y = _1224;
    out.m_52.x = _1226;
    float _1238 = _1210;
    float _1240 = _1216;
    if (!_1236)
    {
        _1238 = 1.0;
    }
    float _1242 = _1238;
    bool _1244 = !_1236;
    float _1246 = _1242;
    if (!_1244)
    {
        bool _1248 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1250 = isnan(_1196);
        bool _1252 = _1248 || _1250;
        bool _1254 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1256 = _1252 || _1254;
        if (!_1256)
        {
            float _1258 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1260 = _1196 + _1258;
            float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1264 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1262;
            float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1268 = _1266 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1270 = 1.0 / _1264;
            float _1272 = _1260 * _1270;
            float _1274 = fma(_1272, _1268, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1246 = _1274;
            _1276 = true;
        }
        else
        {
            bool _1278 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1280 = isnan(_1196);
            bool _1282 = _1278 || _1280;
            bool _1284 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1286 = _1282 || _1284;
            if (!_1286)
            {
                float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1290 = _1196 + _1288;
                float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1294 = _1292 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1298 = _1296 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1300 = 1.0 / _1294;
                float _1302 = _1290 * _1300;
                float _1304 = fma(_1302, _1298, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1246 = _1304;
                _1276 = true;
            }
            else
            {
                _1246 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1276 = false;
    float _1306 = _1246;
    float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1310 = _1130 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1314 = _1124 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1318 = _1132 + _1316;
    bool _1320 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    float _1330 = fma(_1310, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1332 = fma(_1314, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1334 = fma(_1318, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1336 = _1318;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1328)
    {
        _1240 = _1330;
    }
    float _1340 = _1240;
    float _1342 = _1340;
    if (_1328)
    {
        _1336 = _1332;
    }
    float _1344 = _1336;
    float _1346 = _1344;
    if (_1328)
    {
        _1338 = _1334;
    }
    float _1348 = _1338;
    float _1350 = _1348;
    if (!_1328)
    {
        float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1354 = _782 + _1352;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1358 = _874 + _1356;
        float _1360 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1362 = _1354 * _1354;
        float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1366 = _876 + _1364;
        float _1368 = fma(_1358, _1358, _1362);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1366, _1366, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = -_874;
        float _1384 = _1382 + _1330;
        float _1386 = -_876;
        float _1388 = _1386 + _1334;
        float _1390 = _1376 * _1380;
        float _1392 = -_782;
        float _1394 = _1392 + _1332;
        float _1396 = fma(_1384, _1390, _874);
        float _1398 = fma(_1394, _1390, _782);
        float _1400 = fma(_1388, _1390, _876);
        _1346 = _1398;
        _1342 = _1396;
        _1350 = _1400;
    }
    float _1402 = _1346;
    float _1404 = _1342;
    float _1406 = _1350;
    float _1408 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1418 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1416);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1440);
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1454);
    float _1464 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1456);
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1458);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1460);
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1462);
    float _1472 = _1464 + _1466;
    float _1474 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1472 * 0.5;
    out.m_35.x = _1474;
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1464;
    out.gl_Position.w = _1466;
    out.m_54.z = _1476;
    out.m_54.w = _1466;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1276 = false;
    bool _273 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1533 = as_type<float>(_89);
        out.gl_Position.z = _1533;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_103)
    {
        float _109 = float(_73);
        _83 = _109;
    }
    float _111 = _83;
    bool _113 = _107 >= _111;
    bool _115 = !_103;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _91 = as_type<int>(_123);
    }
    int _125 = _91;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1602 = as_type<float>(_125);
        out.gl_Position.z = _1602;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_39.w;
    float _129 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_37.x;
    float _143 = in.m_37.y;
    float _145 = in.m_37.z;
    float _147 = in.m_32.x;
    float _149 = in.m_32.y;
    float _151 = in.m_32.z;
    float _153 = 0.0;
    float _155 = _129;
    if (!_139)
    {
        float _157 = _129 * _129;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    bool _169 = !_139;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _129 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _129);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _201;
    }
    float _203 = _171;
    bool _205 = !_139;
    if (!_205)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _129 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _155 = _225;
    }
    float _227 = _155;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _141, _231);
    float _239 = fma(_227, _143, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _147);
    float _245 = fma(_239, _127, _149);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _269;
    float _271;
    if (!_249)
    {
        float _251 = in.m_41.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = float(_73);
        float _257 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _261 = _259 * _253;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = _255;
        _273 = true;
    }
    else
    {
        float _275 = float(_73);
        float _277 = 1.0 / _275;
        float _279 = _107 * _277;
        _269 = _279;
        _271 = _275;
    }
    _273 = false;
    float _281 = _269;
    float _283 = _271;
    float _285 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _287 = int(_285);
    float _289 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _291 = int(_289);
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _295 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _297 = isnan(_281);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = float(_287);
    float _309 = 1.0 / _283;
    float _311 = float(uint(_291));
    float _313 = 1.0 / _307;
    int _315 = ~_291;
    int _317 = _315 + 1;
    int _319 = ~_291;
    int _321 = _319 + 1;
    bool _323 = _291 == 0;
    float _325 = 1.0 / _311;
    float _327 = _107 * _313;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _331 = _329 != 0;
    float _333 = trunc(_327);
    int _335 = int(_333);
    int _337 = as_type<int>(_325) + (-2);
    bool _339 = !_331;
    float _341 = _339 ? 7.345489978790283203125 : 1.0;
    float _343 = float(uint(_335));
    float _345 = float(_335);
    float _347 = as_type<float>(_337) * _343;
    float _349 = in.m_41.x;
    float _351 = in.m_41.y;
    float _353 = trunc(_347);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    int _360 = _317 * int(_358);
    int _362 = _360 + _335;
    float _364 = float(uint(_362));
    float _366 = _341 * _349;
    float _368 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _293);
    float _370 = as_type<float>(_337) * _364;
    float _372 = float(_291);
    float _374 = floor(_366);
    bool _376 = _345 >= _372;
    bool _378 = isnan(_345);
    bool _380 = _376 || _378;
    bool _382 = isnan(_372);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = trunc(_370);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = trunc(_386);
    int _396 = int(_394);
    float _398 = -_374;
    float _400 = _366 + _398;
    int _402 = int(_358) + int(_392);
    int _404 = _321 * _402;
    int _406 = _404 + _335;
    int _408 = ~_396;
    int _410 = _408 + 1;
    int _412 = _410 + 1;
    bool _414 = uint(_406) >= uint(_291);
    bool _416 = !_414;
    int _418 = _416 ? 0 : (-1);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _430 = _428 != 0;
    int _432 = ~_402;
    int _434 = _432 + _418;
    int _436 = _434 + 1;
    float _438 = _400 * _372;
    float _440 = _107 * _372;
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _444 = _442 != 0;
    int _446 = _291 * _436;
    int _448 = _446 + _335;
    float _450 = _440 * _309;
    float _452 = trunc(_438);
    int _454 = int(_452);
    bool _456 = !_444;
    int _458 = _456 ? 0 : 1;
    bool _460 = !_323;
    int _462 = _460 ? _448 : (-1);
    int _464 = _291 + (-1);
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _468 = _466 != 0;
    int _470 = _462 * _412;
    bool _472 = !_426;
    int _474 = _472 ? 0 : 1;
    float _476 = trunc(_450);
    int _478 = int(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _482 = _480 != 0;
    int _484 = _396 * _464;
    int _486 = _484 + _470;
    bool _488 = !_422;
    int _490 = _488 ? 0 : 1;
    int _492 = abs(_474);
    int _494 = abs(_458);
    bool _496 = !_430;
    int _498 = _496 ? 0 : 1;
    int _500 = abs(_490);
    int _502 = _454 * _494;
    int _504 = _502 + _335;
    bool _506 = !_468;
    int _508 = _506 ? 0 : 1;
    int _510 = abs(_498);
    int _512 = _486 * _492;
    float _514 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _516 = abs(_508);
    int _518 = _478 * _500;
    int _520 = _518 + _512;
    float _522 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _526 = _524 != 0;
    int _528 = _504 * _510;
    int _530 = _528 + _520;
    int _532 = ~_291;
    int _534 = _532 + 1;
    float _536 = as_type<float>(int(gl_VertexIndex));
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _540 = _538 != 0;
    int _542 = _454 * _516;
    int _544 = _542 + _530;
    float _546 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _550 = float(uint(_544));
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = as_type<float>(_337) * _550;
    float _558 = trunc(_556);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    int _564 = as_type<int>(_536) & 1;
    bool _566 = _564 != 0;
    int _568 = as_type<int>(_536) & 2;
    bool _570 = _568 != 0;
    int _572 = ~_291;
    int _574 = _572 + 1;
    int _576 = _534 * int(_562);
    int _578 = _576 + _544;
    float _580 = float(uint(_578));
    float _582 = as_type<float>(_337) * _580;
    float _584 = trunc(_582);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _598 = int(_562) + int(_588);
    float _600 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = 1.0 / _592;
    float _604 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _606 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    int _608 = _574 * _598;
    int _610 = _608 + _544;
    float _612 = -_552;
    float _614 = fma(_604, 2.0, _612);
    float _616 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = 1.0 / _596;
    bool _620 = uint(_610) >= uint(_291);
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _624 = fma(_616, -2.0, _554);
    float _626 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _606);
    bool _628 = !_620;
    int _630 = _628 ? 0 : (-1);
    float _632 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _622);
    bool _634 = _349 > 0.5;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _638 = _281 + _636;
    bool _640 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _642 = isnan(_281);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -_107;
    float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[76].x, _614);
    bool _656 = !_566;
    float _658 = _656 ? (-0.5) : 0.5;
    float _660 = _638 * _602;
    bool _662 = _351 > 0.5;
    float _664 = -_650;
    float _666 = _664 + 1.0;
    bool _668 = _281 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _670 = isnan(_281);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _281 + _680;
    int _684 = ~_598;
    int _686 = _684 + _630;
    int _688 = _686 + 1;
    float _690 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _692 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _632);
    float _694 = _678 * _666;
    float _696 = -_678;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _704;
    float _708 = _682 * _618;
    float _710 = _305 * _698;
    float _712 = fma(_702, _660, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _714 = fma(_706, _660, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _716 = float(uint(_504));
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _722 = _712 * _710;
    float _724 = _714 * _710;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _730 = as_type<float>(_337) * _716;
    float _732 = in.m_39.x;
    float _734 = in.m_39.y;
    float _736 = -_305;
    float _738 = _736 + 1.0;
    float _740 = fma(_720, _708, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _742 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _548);
    float _744 = fma(_728, _708, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _746 = trunc(_730);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    float _752 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _722);
    float _754 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _724);
    int _756 = ~_291;
    int _758 = _756 + 1;
    int _760 = _291 * _688;
    int _762 = _760 + _544;
    float _764 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _624);
    float _766 = fma(_740, _694, _752);
    float _768 = fma(_744, _694, _754);
    bool _770 = !_323;
    int _772 = _770 ? _762 : (-1);
    float _774 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _776 = ~_291;
    int _778 = _776 + 1;
    float _780 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[145].y, _768);
    float _782 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _784 = _758 * int(_750);
    int _786 = _784 + _504;
    float _788 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _368);
    float _790 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[145].x, _766);
    float _792 = _780 * _734;
    float _794 = float(uint(_786));
    float _796 = _790 * _732;
    int _798 = _772 >> 31;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _802 = !_570;
    float _804 = _802 ? (-0.5) : 0.5;
    float _806 = as_type<float>(_337) * _794;
    int _808 = _798 & 3;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _658);
    float _812 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _804);
    int _816 = _772 + _808;
    float _818 = trunc(_806);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = _812 * _810;
    float _826 = _800 * _814;
    int _828 = _816 >> 2;
    float _830 = -_658;
    int _832 = _634 ? as_type<int>(_830) : as_type<int>(_658);
    float _834 = _826 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _836 = _826 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _838 = _828 << 4;
    int _840 = _838 + 368;
    float _842 = _826 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _844 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[24].x, _834);
    float _846 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[26].x, _836);
    uint _848 = uint(int(uint(_840) >> uint(2)));
    uint _850 = uint(int(uint(int(_848)) >> uint(2)));
    int _852 = int(_848) & 3;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[int(_850)][_852];
    int _856 = int(_848) + 1;
    uint _858 = uint(int(uint(_856) >> uint(2)));
    int _860 = _856 & 3;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[int(_858)][_860];
    bool _864 = !_526;
    float _866 = _864 ? _658 : as_type<float>(_832);
    float _868 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _844);
    float _870 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _846);
    int _872 = int(_750) + int(_822);
    float _874 = _626 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _876 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _878 = _868 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _880 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _882 = _772 & 3;
    bool _884 = _882 != 0;
    int _886 = _778 * _872;
    int _888 = _886 + _504;
    float _890 = _874 + _878;
    float _892 = _876 + _880;
    int _894 = _772 & 3;
    bool _896 = _894 != 0;
    float _898 = fma(_824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _842);
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _902 = _890 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _906 = _892 + _904;
    float _908 = -_804;
    int _910 = _662 ? as_type<int>(_908) : as_type<int>(_804);
    float _912 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _898);
    bool _914 = uint(_894) > 1u;
    float _916 = _902 * _902;
    float _918 = _906 * _906;
    bool _920 = !_540;
    float _922 = _920 ? _804 : as_type<float>(_910);
    bool _924 = uint(_888) >= uint(_291);
    float _926 = _916 + _918;
    int _928 = _884 ? 0 : 1;
    int _930 = _840 + 8;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    uint _934 = uint(int(uint(int(_932)) >> uint(2)));
    int _936 = int(_932) & 3;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[int(_934)][_936];
    int _940 = int(_932) + 1;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    int _944 = _940 & 3;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[int(_942)][_944];
    bool _948 = !_896;
    int _950 = _948 ? 0 : 1;
    float _952 = sqrt(_926);
    int _954 = ~_928;
    int _956 = _954 + 1;
    int _958 = _956 + 1;
    int _960 = _958;
    float _962 = _890;
    float _964 = _892;
    if (!_914)
    {
        int _966 = ~_928;
        int _968 = _966 + 1;
        _960 = _968;
    }
    int _970 = _960;
    float _972 = _866 + 0.5;
    bool _974 = !_924;
    int _976 = _974 ? 0 : (-1);
    bool _978 = _894 != 3;
    float _980 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[80].x, _654);
    int _982 = abs(_970);
    bool _984 = uint(_894) >= 2u;
    int _986 = abs(_950);
    int _988 = ~_982;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    bool _994 = _894 != 3;
    int _996 = _984 ? 0 : 1;
    int _998 = _992 * as_type<int>(_862);
    float _1000 = _912 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1002 = _952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1004 = ~_986;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = _782 + _1000;
    int _1012 = ~_996;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    int _1018 = _1016;
    float _1020 = _854;
    if (_978)
    {
        int _1022 = ~_996;
        int _1024 = _1022 + 1;
        _1018 = _1024;
    }
    int _1026 = _1018;
    int _1028 = _1008 * as_type<int>(_854);
    int _1030 = _1028 + _998;
    bool _1032 = !_482;
    float _1034 = _1032 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1036 = !_994;
    float _1038 = _1036 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1040 = abs(_1026);
    int _1042 = ~_872;
    int _1044 = _1042 + _976;
    int _1046 = _1044 + 1;
    int _1048 = abs(as_type<int>(_1034));
    int _1050 = abs(as_type<int>(_1038));
    float _1052 = _1034;
    float _1054 = _1038;
    if (!_1002)
    {
        _1052 = _918;
    }
    float _1056 = _1052;
    float _1058 = _1056;
    if (!_1002)
    {
        _1020 = _916;
    }
    float _1060 = _1020;
    int _1062 = ~_1040;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = _1060;
    if (!_1002)
    {
        _1054 = _1010;
    }
    float _1070 = _1054;
    bool _1072 = !_1002;
    float _1074 = _1070;
    if (!_1072)
    {
        float _1076 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1080 = _952 + _1078;
        float _1082 = rsqrt(_926);
        float _1084 = _1080 * _1076;
        float _1086 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = _1084 * 0.15915493667125701904296875;
        float _1090 = _1088 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        float _1098 = fma(_1092, _1086, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1100 = _1082 * _1098;
        float _1102 = _1096 + (-1.0);
        float _1104 = fma(_902, _1100, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1106 = fma(_906, _1100, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1108 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1112 = _1104 + _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1116 = _1106 + _1114;
        float _1118 = fma(_1010, _1096, _1108);
        float _1120 = _1112 * _1112;
        float _1122 = _1116 * _1116;
        _1074 = _1118;
        _1068 = _1120;
        _1058 = _1122;
        _962 = _1104;
        _964 = _1106;
    }
    float _1124 = _1074;
    float _1126 = _1068;
    float _1128 = _1058;
    float _1130 = _962;
    float _1132 = _964;
    int _1134 = _1066 * as_type<int>(_938);
    int _1136 = _1134 + _1030;
    int _1138 = ~_1050;
    int _1140 = _1138 + 1;
    int _1142 = _1140 + 1;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1124 + _1144;
    int _1148 = _291 * _1046;
    int _1150 = _1148 + _504;
    int _1152 = ~_1048;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    float _1158 = -_692;
    float _1160 = _1158 + 1.0;
    int _1162 = _1142 * as_type<int>(_946);
    int _1164 = _1162 + _1136;
    float _1166 = fma(_1146, _1146, _1126);
    float _1168 = _922 + (-0.5);
    bool _1170 = !_323;
    int _1172 = _1170 ? _1150 : (-1);
    int _1174 = _1164 * _1156;
    float _1176 = _1166 + _1128;
    float _1178 = -_1168;
    float _1180 = -_764;
    float _1182 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1180);
    float _1184 = -_1160;
    float _1186 = fma(_866, _1184, _980);
    int _1188 = _1172 * _1048;
    int _1190 = _1188 + _1174;
    float _1192 = -_788;
    float _1194 = _1192 + 1.0;
    float _1196 = sqrt(_1176);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1216 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1218 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1222 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1224 = fma(_922, _1194, _1182);
    float _1226 = float(_1190);
    out.m_46.x = _1208;
    out.m_46.y = _1212;
    out.m_46.z = _1216;
    out.m_46.w = _1214;
    bool _1228 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1230 = isnan(_1196);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1236 = _1232 || _1234;
    out.m_48.x = _1218;
    out.m_48.y = _1220;
    out.m_48.z = _1222;
    out.m_50.x = _1186;
    out.m_50.y = _1224;
    out.m_52.x = _1226;
    float _1238 = _1210;
    float _1240 = _1216;
    if (!_1236)
    {
        _1238 = 1.0;
    }
    float _1242 = _1238;
    bool _1244 = !_1236;
    float _1246 = _1242;
    if (!_1244)
    {
        bool _1248 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1250 = isnan(_1196);
        bool _1252 = _1248 || _1250;
        bool _1254 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1256 = _1252 || _1254;
        if (!_1256)
        {
            float _1258 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1260 = _1196 + _1258;
            float _1262 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1264 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1262;
            float _1266 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1268 = _1266 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1270 = 1.0 / _1264;
            float _1272 = _1260 * _1270;
            float _1274 = fma(_1272, _1268, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1246 = _1274;
            _1276 = true;
        }
        else
        {
            bool _1278 = _1196 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1280 = isnan(_1196);
            bool _1282 = _1278 || _1280;
            bool _1284 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1286 = _1282 || _1284;
            if (!_1286)
            {
                float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1290 = _1196 + _1288;
                float _1292 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1294 = _1292 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1296 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1298 = _1296 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1300 = 1.0 / _1294;
                float _1302 = _1290 * _1300;
                float _1304 = fma(_1302, _1298, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1246 = _1304;
                _1276 = true;
            }
            else
            {
                _1246 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1276 = false;
    float _1306 = _1246;
    float _1308 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1310 = _1130 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1314 = _1124 + _1312;
    float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1318 = _1132 + _1316;
    bool _1320 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.5);
    bool _1328 = _1324 || _1326;
    float _1330 = fma(_1310, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1332 = fma(_1314, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1334 = fma(_1318, _1306, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1336 = _1318;
    float _1338 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1328)
    {
        _1240 = _1330;
    }
    float _1340 = _1240;
    float _1342 = _1340;
    if (_1328)
    {
        _1336 = _1332;
    }
    float _1344 = _1336;
    float _1346 = _1344;
    if (_1328)
    {
        _1338 = _1334;
    }
    float _1348 = _1338;
    float _1350 = _1348;
    if (!_1328)
    {
        float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1354 = _782 + _1352;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1358 = _874 + _1356;
        float _1360 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1362 = _1354 * _1354;
        float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1366 = _876 + _1364;
        float _1368 = fma(_1358, _1358, _1362);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1366, _1366, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = -_874;
        float _1384 = _1382 + _1330;
        float _1386 = -_876;
        float _1388 = _1386 + _1334;
        float _1390 = _1376 * _1380;
        float _1392 = -_782;
        float _1394 = _1392 + _1332;
        float _1396 = fma(_1384, _1390, _874);
        float _1398 = fma(_1394, _1390, _782);
        float _1400 = fma(_1388, _1390, _876);
        _1346 = _1398;
        _1342 = _1396;
        _1350 = _1400;
    }
    float _1402 = _1346;
    float _1404 = _1342;
    float _1406 = _1350;
    float _1408 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1410 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1414 = _1402 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1408);
    float _1418 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1412);
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1416);
    float _1426 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1428 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1420);
    float _1430 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1432 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1440 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1442 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = _1432 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1440);
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1446);
    float _1456 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1458 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1460 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1462 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1454);
    float _1464 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1456);
    float _1466 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1458);
    float _1468 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1460);
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1462);
    float _1472 = _1464 + _1466;
    float _1474 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1476 = _1472 * 0.5;
    out.m_35.x = _1474;
    out.gl_Position.x = _1468;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1464;
    out.gl_Position.w = _1466;
    out.m_54.z = _1476;
    out.m_54.w = _1466;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

