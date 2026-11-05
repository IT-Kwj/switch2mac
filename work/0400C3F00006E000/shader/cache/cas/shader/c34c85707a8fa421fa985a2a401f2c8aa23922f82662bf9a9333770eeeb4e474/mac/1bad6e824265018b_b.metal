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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1301 = as_type<float>(_87);
        out.gl_Position.z = _1301;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_125);
        out.gl_Position.z = _1371;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_37.z;
    float _129 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _131 = log2(_129);
    float _133 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = _131 * _105;
    float _145 = exp2(_143);
    float _147 = _127 * 2.0;
    int _149 = as_type<int>(_135) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_135) & 2;
    bool _155 = _153 != 0;
    float _157 = floor(_147);
    float _159 = in.m_35.x;
    float _161 = in.m_35.y;
    float _163 = in.m_35.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _137 * _139;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _183 = _181 != 0;
    float _185 = trunc(_175);
    int _187 = int(_185);
    float _189 = _141 + _127;
    float _191 = _189 + (-1.0);
    bool _193 = !_151;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = 0.0;
    float _199 = _191;
    if (!_173)
    {
        float _201 = _133 * _133;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = _157 > 0.0;
    bool _209 = _157 >= 0.0;
    bool _211 = isnan(_157);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _205;
    if (!_173)
    {
        float _221 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_155;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _231 = _223;
    if (!_173)
    {
        _199 = _133;
    }
    float _233 = _199;
    bool _235 = !_173;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _133 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _133);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _267;
    }
    float _269 = _231;
    bool _271 = !_173;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _133 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _237 = _291;
    }
    float _293 = _237;
    float _295 = in.m_42.w;
    float _297 = _139 + _141;
    bool _299 = _139 > 0.5;
    float _301 = _139 * 2.0;
    float _303 = in.m_30.x;
    float _305 = in.m_30.y;
    float _307 = in.m_30.z;
    float _309 = _297 + (-1.0);
    float _311 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _313 = -_195;
    int _315 = _299 ? as_type<int>(_313) : as_type<int>(_195);
    float _317 = floor(_301);
    bool _319 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _327 = _323 || _325;
    float _329 = fma(_293, _161, _311);
    float _331 = -_145;
    float _333 = _331 + 1.0;
    float _335 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _337 = fma(_293, _163, _335);
    float _339 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _327 ? _333 : 0.0;
    float _343 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _345 = _187 << 4;
    int _347 = _345 + 1968;
    float _349 = fma(_293, _159, _339);
    bool _351 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(1.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    uint _366 = uint(int(uint(_347) >> uint(2)));
    uint _368 = uint(int(uint(int(_366)) >> uint(2)));
    int _370 = int(_366) & 3;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[int(_368)][_370];
    int _374 = int(_366) + 1;
    uint _376 = uint(int(uint(_374) >> uint(2)));
    int _378 = _374 & 3;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[int(_376)][_378];
    bool _382 = _141 > 0.5;
    float _384 = 1.0 / _363;
    float _386 = fma(_329, _295, _305);
    float _388 = fma(_349, _295, _303);
    float _390 = fma(_337, _295, _307);
    float _392 = -_227;
    int _394 = _382 ? as_type<int>(_392) : as_type<int>(_227);
    float _396 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _400 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _402 = _347 + 8;
    uint _404 = uint(int(uint(_402) >> uint(2)));
    uint _406 = uint(int(uint(int(_404)) >> uint(2)));
    int _408 = int(_404) & 3;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[int(_406)][_408];
    float _412 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _414 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _398);
    float _416 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _400);
    bool _418 = _317 > 0.0;
    float _420 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _412);
    float _422 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _414);
    bool _424 = _317 >= 0.0;
    bool _426 = isnan(_317);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _436 = _420 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = _422 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _440 = !_179;
    float _442 = _440 ? _195 : as_type<float>(_315);
    float _444 = _434 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _436 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _452 = _438 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _444 + _454;
    float _458 = _448 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_359)
    {
        float _460 = _341 * _384;
        _107 = _460;
    }
    float _462 = _107;
    float _464 = _141 * 2.0;
    bool _466 = !_183;
    float _468 = _466 ? _227 : as_type<float>(_394);
    float _470 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[28].x, _458);
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = in.m_42.x;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _488 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _470);
    float _490 = -_468;
    float _492 = _490 + 0.5;
    bool _494 = !_478;
    int _496 = _494 ? 0 : 1;
    float _498 = _442 + 0.5;
    int _500 = _217 ? 0 : 1;
    float _502 = _492 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _504 = _488 >= 0.0;
    float _506 = floor(_464);
    float _508 = _448 * _448;
    float _510 = _498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _512 = !_474;
    int _514 = _512 ? 0 : 1;
    float _516 = fma(_452, _452, _508);
    float _518 = _380 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _522 = fma(_456, _456, _516);
    float _524 = _502 * _486;
    float _526 = _372 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _530 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _532 = _506 > 0.0;
    float _534 = rsqrt(_522);
    bool _536 = _506 >= 0.0;
    bool _538 = isnan(_506);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_504)
    {
        out.m_33.x = 0.0;
    }
    bool _548 = !_482;
    int _550 = _548 ? 0 : 1;
    float _552 = _510 * _520;
    float _554 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _560 = _484;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _562 = _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _568 = _410 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _570 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = _566 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _580 = as_type<int>(_562);
    if (_504)
    {
        float _582 = _562 * 5.0;
        _580 = as_type<int>(_582);
    }
    int _584 = _580;
    out.m_44.x = _552;
    out.m_44.y = _524;
    float _586 = _578 * _534;
    out.m_46.x = _572;
    out.m_46.y = _570;
    out.m_46.z = _574;
    out.m_46.w = _528;
    float _588 = _452 * _586;
    float _590 = _448 * _586;
    out.m_48.x = _546;
    out.m_48.y = _530;
    out.m_48.z = _576;
    if (_504)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2125 = as_type<float>(_584);
        out.gl_Position.z = _2125;
    }
    if (_504)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _592 = -_590;
    float _594 = _436 + _592;
    float _596 = -_588;
    float _598 = _438 + _596;
    int _600 = _432 ? 0 : 1;
    float _602 = _141 + (-0.5);
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _594 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _598 + _608;
    int _612 = ~_600;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = -_590;
    float _620 = _448 + _618;
    float _622 = _606 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _624 = _616;
    if (!_418)
    {
        int _626 = ~_600;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = -_588;
    float _634 = _452 + _632;
    float _636 = in.m_50.x;
    float _638 = in.m_50.y;
    float _640 = in.m_50.z;
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[28].x, _622);
    float _644 = _456 * _586;
    int _646 = ~_500;
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    int _652 = _650;
    if (!_207)
    {
        int _654 = ~_500;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    float _660 = -_644;
    float _662 = _444 + _660;
    int _664 = abs(_514);
    float _666 = float(_658);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _670 = _662 + _668;
    float _672 = float(_664);
    int _674 = abs(_496);
    float _676 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[28].z, _642);
    float _678 = float(_630);
    float _680 = _672 * _666;
    float _682 = float(_674);
    int _684 = _544 ? 0 : 1;
    int _686 = abs(_550);
    float _688 = _682 * _678;
    bool _690 = _676 >= 0.0;
    float _692 = _680 * (-2.0);
    int _694 = ~_684;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    float _700 = _139 + (-0.5);
    float _702 = fma(_343, _692, _343);
    int _704 = _698;
    if (!_532)
    {
        int _706 = ~_684;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = fma(_692, _636, _636);
    float _714 = float(_686);
    float _716 = _688 * (-2.0);
    float _718 = float(_710);
    float _720 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _712);
    float _722 = _139 + _127;
    float _724 = fma(_716, _638, _638);
    float _726 = _620 * _620;
    float _728 = fma(_702, _462, _720);
    float _730 = _714 * _718;
    float _732 = fma(_229, _716, _229);
    float _734 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].y, _724);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = _716;
    if (_690)
    {
        _738 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _740 = _738;
    float _742 = fma(_732, _462, _734);
    float _744 = _736 * 6.283185482025146484375;
    float _746 = cos(_744);
    int _748 = as_type<int>(_740);
    if (_690)
    {
        out.m_33.x = 0.0;
    }
    if (_690)
    {
        float _750 = _740 * 5.0;
        _748 = as_type<int>(_750);
    }
    int _752 = _748;
    float _754 = fma(_634, _634, _726);
    float _756 = _722 + (-1.0);
    float _758 = _730 * (-2.0);
    if (_690)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2373 = as_type<float>(_752);
        out.gl_Position.z = _2373;
    }
    float _760 = _736 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _742 * 0.15915493667125701904296875;
    if (_690)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _766 = in.m_42.y;
    float _768 = -_644;
    float _770 = _456 + _768;
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _774 = fma(_758, _640, _640);
    float _776 = _127 + (-0.5);
    float _778 = fma(_770, _770, _754);
    float _780 = fma(_772, _758, _772);
    float _782 = _764 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _792 = fma(_780, _462, _786);
    bool _794 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _802 = _798 || _800;
    float _804 = sqrt(_778);
    float _806 = _792 * 0.15915493667125701904296875;
    float _808 = _764 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = _766 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _814 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _816 = _806 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _534 * _804;
    float _822 = _746 * _784;
    float _824 = _820 * _814;
    float _826 = _566 * _820;
    float _828 = _806 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _788 * _824;
    float _834 = _762 * _784;
    float _836 = _746 * _810;
    float _838 = _790 * _826;
    float _840 = _818 * _832;
    float _842 = _784 * _818;
    float _844 = _810 * _818;
    float _846 = _762 * _810;
    float _848 = _746 * _840;
    float _850 = _820 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _852 = _850 * 0.5;
    float _854 = fma(_830, _836, _834);
    float _856 = -_832;
    float _858 = _830 * _856;
    float _860 = fma(_830, _834, _836);
    float _862 = fma(_854, _838, _848);
    float _864 = -_846;
    float _866 = fma(_830, _822, _864);
    float _868 = -_822;
    float _870 = fma(_830, _846, _868);
    float _872 = _762 * _840;
    float _874 = fma(_844, _838, _858);
    float _876 = fma(_866, _852, _862);
    float _878 = _594 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _880 = fma(_870, _838, _872);
    float _882 = fma(_842, _852, _874);
    float _884 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[11].x, _878);
    float _888 = fma(_860, _852, _880);
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    float _894 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _886);
    float _896 = _594 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _904 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[10].x, _896);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _910 = 1.0 / _902;
    float _912 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _444 + _908;
    float _918 = _912 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _920 = _438 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _916 + _922;
    float _926 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _928 = _918 + _902;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _932 = _920 + _930;
    float _934 = _924 * _924;
    float _936 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[25].x, _926);
    float _938 = fma(_932, _932, _934);
    float _940 = _928 * _910;
    float _942 = _940 * 0.5;
    float _944 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _936);
    float _946 = sqrt(_938);
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _948);
    float _952 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _954 = _436 + _952;
    float _956 = 1.0 / _950;
    bool _958 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _960 = _888;
    float _962 = _952;
    float _964 = _944;
    if (!_958)
    {
        _960 = _920;
    }
    float _966 = _960;
    float _968 = _966;
    if (!_958)
    {
        _962 = _916;
    }
    float _970 = _962;
    float _972 = _970;
    if (!_958)
    {
        _964 = _954;
    }
    float _974 = _964;
    bool _976 = !_958;
    float _978 = _974;
    if (!_976)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _984 = _946 + _982;
        float _986 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = rsqrt(_938);
        float _990 = _984 * _980;
        float _992 = _990 * 0.15915493667125701904296875;
        float _994 = _992 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = _992 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _996 + (-1.0);
        float _1004 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = fma(_1000, _986, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = fma(_954, _996, _1004);
        float _1010 = _988 * _1006;
        float _1012 = fma(_932, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1014 = fma(_924, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _978 = _1008;
        _968 = _1012;
        _972 = _1014;
    }
    float _1016 = _978;
    float _1018 = _968;
    float _1020 = _972;
    float _1022 = -_590;
    float _1024 = _1022 + _1016;
    float _1026 = -_588;
    float _1028 = _1026 + _1018;
    float _1030 = -_644;
    float _1032 = _1030 + _1020;
    float _1034 = _1020;
    if (_802)
    {
        _1034 = 1.0;
    }
    float _1036 = _1034;
    float _1038 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1044 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1038);
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1050 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1042);
    float _1052 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1044);
    float _1054 = _1044;
    float _1056 = _1036;
    if (_802)
    {
        _1054 = 1.0;
    }
    float _1058 = _1054;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1062 = _956 * _1060;
    float _1064 = _1058;
    if (!_802)
    {
        float _1066 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1072 = _1068 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = _1070 * 0.15915493667125701904296875;
        float _1078 = _1068 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = 1.0 / _1074;
        float _1084 = _1076 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = _1080 * _1082;
        float _1090 = _1076 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1096 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1094;
        float _1098 = _1086 * _1088;
        float _1100 = 1.0 / _1096;
        float _1102 = 1.0 / _1098;
        float _1104 = _1092 * _1102;
        float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1108 = fma(_1062, _1104, _1106);
        float _1110 = _1108 * _1100;
        float _1112 = precise::clamp(_1110, 0.0, 1.0);
        _1056 = _1112;
    }
    float _1114 = _1056;
    if (!_802)
    {
        float _1116 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1120 = _1116 * 0.15915493667125701904296875;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1120 * 6.283185482025146484375;
        float _1130 = sin(_1128);
        float _1132 = 1.0 / _1126;
        float _1134 = _1122 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1130 * _1132;
        float _1140 = _1122 * 6.283185482025146484375;
        float _1142 = sin(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = 1.0 / _1144;
        float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1150 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1148;
        float _1152 = 1.0 / _1150;
        float _1154 = _1142 * _1146;
        float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1158 = fma(_1062, _1154, _1156);
        float _1160 = _1158 * _1152;
        float _1162 = precise::clamp(_1160, 0.0, 1.0);
        float _1164 = -_1162;
        float _1166 = _1164 + 1.0;
        _1064 = _1166;
    }
    float _1168 = _1064;
    float _1170 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1048);
    float _1172 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1046);
    bool _1174 = _1114 > 0.0;
    bool _1176 = isnan(_1114);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(0.0);
    bool _1182 = _1178 || _1180;
    float _1184 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1050);
    float _1186 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1052);
    float _1192 = _1114 * _1168;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1198 = _1168 <= 0.0;
    bool _1200 = !_1182;
    bool _1202 = _1198 || _1200;
    float _1204 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1208 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1212 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1214 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1216 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1206);
    float _1218 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1220 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1210);
    float _1222 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1212);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1214);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1216);
    float _1228 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1220);
    float _1230 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1222);
    float _1232 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1224);
    float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1226);
    float _1238 = _1228 + _1230;
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = _1238 * 0.5;
    out.m_33.x = _1240;
    out.gl_Position.x = _1234;
    out.gl_Position.y = _1236;
    out.gl_Position.z = _1228;
    out.gl_Position.w = _1230;
    out.m_52.z = _1242;
    out.m_52.w = _1230;
    if (!_1202)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1244 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1244;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1301 = as_type<float>(_87);
        out.gl_Position.z = _1301;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_125);
        out.gl_Position.z = _1371;
    }
    if (_117)
    {
        return out;
    }
    float _127 = in.m_37.z;
    float _129 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _131 = log2(_129);
    float _133 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = _131 * _105;
    float _145 = exp2(_143);
    float _147 = _127 * 2.0;
    int _149 = as_type<int>(_135) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_135) & 2;
    bool _155 = _153 != 0;
    float _157 = floor(_147);
    float _159 = in.m_35.x;
    float _161 = in.m_35.y;
    float _163 = in.m_35.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _137 * _139;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _183 = _181 != 0;
    float _185 = trunc(_175);
    int _187 = int(_185);
    float _189 = _141 + _127;
    float _191 = _189 + (-1.0);
    bool _193 = !_151;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = 0.0;
    float _199 = _191;
    if (!_173)
    {
        float _201 = _133 * _133;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = _157 > 0.0;
    bool _209 = _157 >= 0.0;
    bool _211 = isnan(_157);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _205;
    if (!_173)
    {
        float _221 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_155;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _231 = _223;
    if (!_173)
    {
        _199 = _133;
    }
    float _233 = _199;
    bool _235 = !_173;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _133 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _133);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _267;
    }
    float _269 = _231;
    bool _271 = !_173;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _133 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _237 = _291;
    }
    float _293 = _237;
    float _295 = in.m_42.w;
    float _297 = _139 + _141;
    bool _299 = _139 > 0.5;
    float _301 = _139 * 2.0;
    float _303 = in.m_30.x;
    float _305 = in.m_30.y;
    float _307 = in.m_30.z;
    float _309 = _297 + (-1.0);
    float _311 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _313 = -_195;
    int _315 = _299 ? as_type<int>(_313) : as_type<int>(_195);
    float _317 = floor(_301);
    bool _319 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _327 = _323 || _325;
    float _329 = fma(_293, _161, _311);
    float _331 = -_145;
    float _333 = _331 + 1.0;
    float _335 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _337 = fma(_293, _163, _335);
    float _339 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _327 ? _333 : 0.0;
    float _343 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _345 = _187 << 4;
    int _347 = _345 + 1968;
    float _349 = fma(_293, _159, _339);
    bool _351 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(1.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    uint _366 = uint(int(uint(_347) >> uint(2)));
    uint _368 = uint(int(uint(int(_366)) >> uint(2)));
    int _370 = int(_366) & 3;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[int(_368)][_370];
    int _374 = int(_366) + 1;
    uint _376 = uint(int(uint(_374) >> uint(2)));
    int _378 = _374 & 3;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[int(_376)][_378];
    bool _382 = _141 > 0.5;
    float _384 = 1.0 / _363;
    float _386 = fma(_329, _295, _305);
    float _388 = fma(_349, _295, _303);
    float _390 = fma(_337, _295, _307);
    float _392 = -_227;
    int _394 = _382 ? as_type<int>(_392) : as_type<int>(_227);
    float _396 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _400 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _402 = _347 + 8;
    uint _404 = uint(int(uint(_402) >> uint(2)));
    uint _406 = uint(int(uint(int(_404)) >> uint(2)));
    int _408 = int(_404) & 3;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[int(_406)][_408];
    float _412 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _414 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _398);
    float _416 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _400);
    bool _418 = _317 > 0.0;
    float _420 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _412);
    float _422 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _414);
    bool _424 = _317 >= 0.0;
    bool _426 = isnan(_317);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _436 = _420 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = _422 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _440 = !_179;
    float _442 = _440 ? _195 : as_type<float>(_315);
    float _444 = _434 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _436 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _452 = _438 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _444 + _454;
    float _458 = _448 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_359)
    {
        float _460 = _341 * _384;
        _107 = _460;
    }
    float _462 = _107;
    float _464 = _141 * 2.0;
    bool _466 = !_183;
    float _468 = _466 ? _227 : as_type<float>(_394);
    float _470 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[28].x, _458);
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = in.m_42.x;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _488 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _470);
    float _490 = -_468;
    float _492 = _490 + 0.5;
    bool _494 = !_478;
    int _496 = _494 ? 0 : 1;
    float _498 = _442 + 0.5;
    int _500 = _217 ? 0 : 1;
    float _502 = _492 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _504 = _488 >= 0.0;
    float _506 = floor(_464);
    float _508 = _448 * _448;
    float _510 = _498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _512 = !_474;
    int _514 = _512 ? 0 : 1;
    float _516 = fma(_452, _452, _508);
    float _518 = _380 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _522 = fma(_456, _456, _516);
    float _524 = _502 * _486;
    float _526 = _372 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _530 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _532 = _506 > 0.0;
    float _534 = rsqrt(_522);
    bool _536 = _506 >= 0.0;
    bool _538 = isnan(_506);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_504)
    {
        out.m_33.x = 0.0;
    }
    bool _548 = !_482;
    int _550 = _548 ? 0 : 1;
    float _552 = _510 * _520;
    float _554 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _560 = _484;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _562 = _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _568 = _410 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _570 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = _566 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _580 = as_type<int>(_562);
    if (_504)
    {
        float _582 = _562 * 5.0;
        _580 = as_type<int>(_582);
    }
    int _584 = _580;
    out.m_44.x = _552;
    out.m_44.y = _524;
    float _586 = _578 * _534;
    out.m_46.x = _572;
    out.m_46.y = _570;
    out.m_46.z = _574;
    out.m_46.w = _528;
    float _588 = _452 * _586;
    float _590 = _448 * _586;
    out.m_48.x = _546;
    out.m_48.y = _530;
    out.m_48.z = _576;
    if (_504)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2125 = as_type<float>(_584);
        out.gl_Position.z = _2125;
    }
    if (_504)
    {
        return out;
    }
    float _592 = -_590;
    float _594 = _436 + _592;
    float _596 = -_588;
    float _598 = _438 + _596;
    int _600 = _432 ? 0 : 1;
    float _602 = _141 + (-0.5);
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _594 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _598 + _608;
    int _612 = ~_600;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = -_590;
    float _620 = _448 + _618;
    float _622 = _606 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _624 = _616;
    if (!_418)
    {
        int _626 = ~_600;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = -_588;
    float _634 = _452 + _632;
    float _636 = in.m_50.x;
    float _638 = in.m_50.y;
    float _640 = in.m_50.z;
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[28].x, _622);
    float _644 = _456 * _586;
    int _646 = ~_500;
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    int _652 = _650;
    if (!_207)
    {
        int _654 = ~_500;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    float _660 = -_644;
    float _662 = _444 + _660;
    int _664 = abs(_514);
    float _666 = float(_658);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _670 = _662 + _668;
    float _672 = float(_664);
    int _674 = abs(_496);
    float _676 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[28].z, _642);
    float _678 = float(_630);
    float _680 = _672 * _666;
    float _682 = float(_674);
    int _684 = _544 ? 0 : 1;
    int _686 = abs(_550);
    float _688 = _682 * _678;
    bool _690 = _676 >= 0.0;
    float _692 = _680 * (-2.0);
    int _694 = ~_684;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    float _700 = _139 + (-0.5);
    float _702 = fma(_343, _692, _343);
    int _704 = _698;
    if (!_532)
    {
        int _706 = ~_684;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = fma(_692, _636, _636);
    float _714 = float(_686);
    float _716 = _688 * (-2.0);
    float _718 = float(_710);
    float _720 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _712);
    float _722 = _139 + _127;
    float _724 = fma(_716, _638, _638);
    float _726 = _620 * _620;
    float _728 = fma(_702, _462, _720);
    float _730 = _714 * _718;
    float _732 = fma(_229, _716, _229);
    float _734 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].y, _724);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = _716;
    if (_690)
    {
        _738 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _740 = _738;
    float _742 = fma(_732, _462, _734);
    float _744 = _736 * 6.283185482025146484375;
    float _746 = cos(_744);
    int _748 = as_type<int>(_740);
    if (_690)
    {
        out.m_33.x = 0.0;
    }
    if (_690)
    {
        float _750 = _740 * 5.0;
        _748 = as_type<int>(_750);
    }
    int _752 = _748;
    float _754 = fma(_634, _634, _726);
    float _756 = _722 + (-1.0);
    float _758 = _730 * (-2.0);
    if (_690)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2373 = as_type<float>(_752);
        out.gl_Position.z = _2373;
    }
    float _760 = _736 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _742 * 0.15915493667125701904296875;
    if (_690)
    {
        return out;
    }
    float _766 = in.m_42.y;
    float _768 = -_644;
    float _770 = _456 + _768;
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _774 = fma(_758, _640, _640);
    float _776 = _127 + (-0.5);
    float _778 = fma(_770, _770, _754);
    float _780 = fma(_772, _758, _772);
    float _782 = _764 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _792 = fma(_780, _462, _786);
    bool _794 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _802 = _798 || _800;
    float _804 = sqrt(_778);
    float _806 = _792 * 0.15915493667125701904296875;
    float _808 = _764 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = _766 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _814 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _816 = _806 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _534 * _804;
    float _822 = _746 * _784;
    float _824 = _820 * _814;
    float _826 = _566 * _820;
    float _828 = _806 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _788 * _824;
    float _834 = _762 * _784;
    float _836 = _746 * _810;
    float _838 = _790 * _826;
    float _840 = _818 * _832;
    float _842 = _784 * _818;
    float _844 = _810 * _818;
    float _846 = _762 * _810;
    float _848 = _746 * _840;
    float _850 = _820 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _852 = _850 * 0.5;
    float _854 = fma(_830, _836, _834);
    float _856 = -_832;
    float _858 = _830 * _856;
    float _860 = fma(_830, _834, _836);
    float _862 = fma(_854, _838, _848);
    float _864 = -_846;
    float _866 = fma(_830, _822, _864);
    float _868 = -_822;
    float _870 = fma(_830, _846, _868);
    float _872 = _762 * _840;
    float _874 = fma(_844, _838, _858);
    float _876 = fma(_866, _852, _862);
    float _878 = _594 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _880 = fma(_870, _838, _872);
    float _882 = fma(_842, _852, _874);
    float _884 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[11].x, _878);
    float _888 = fma(_860, _852, _880);
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    float _894 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _886);
    float _896 = _594 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _904 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[10].x, _896);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _910 = 1.0 / _902;
    float _912 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _444 + _908;
    float _918 = _912 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _920 = _438 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _916 + _922;
    float _926 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _928 = _918 + _902;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _932 = _920 + _930;
    float _934 = _924 * _924;
    float _936 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[25].x, _926);
    float _938 = fma(_932, _932, _934);
    float _940 = _928 * _910;
    float _942 = _940 * 0.5;
    float _944 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _936);
    float _946 = sqrt(_938);
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _948);
    float _952 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _954 = _436 + _952;
    float _956 = 1.0 / _950;
    bool _958 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _960 = _888;
    float _962 = _952;
    float _964 = _944;
    if (!_958)
    {
        _960 = _920;
    }
    float _966 = _960;
    float _968 = _966;
    if (!_958)
    {
        _962 = _916;
    }
    float _970 = _962;
    float _972 = _970;
    if (!_958)
    {
        _964 = _954;
    }
    float _974 = _964;
    bool _976 = !_958;
    float _978 = _974;
    if (!_976)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _984 = _946 + _982;
        float _986 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = rsqrt(_938);
        float _990 = _984 * _980;
        float _992 = _990 * 0.15915493667125701904296875;
        float _994 = _992 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = _992 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _996 + (-1.0);
        float _1004 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = fma(_1000, _986, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = fma(_954, _996, _1004);
        float _1010 = _988 * _1006;
        float _1012 = fma(_932, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1014 = fma(_924, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _978 = _1008;
        _968 = _1012;
        _972 = _1014;
    }
    float _1016 = _978;
    float _1018 = _968;
    float _1020 = _972;
    float _1022 = -_590;
    float _1024 = _1022 + _1016;
    float _1026 = -_588;
    float _1028 = _1026 + _1018;
    float _1030 = -_644;
    float _1032 = _1030 + _1020;
    float _1034 = _1020;
    if (_802)
    {
        _1034 = 1.0;
    }
    float _1036 = _1034;
    float _1038 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1044 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1038);
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1050 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1042);
    float _1052 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1044);
    float _1054 = _1044;
    float _1056 = _1036;
    if (_802)
    {
        _1054 = 1.0;
    }
    float _1058 = _1054;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1062 = _956 * _1060;
    float _1064 = _1058;
    if (!_802)
    {
        float _1066 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1072 = _1068 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = _1070 * 0.15915493667125701904296875;
        float _1078 = _1068 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = 1.0 / _1074;
        float _1084 = _1076 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = _1080 * _1082;
        float _1090 = _1076 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1096 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1094;
        float _1098 = _1086 * _1088;
        float _1100 = 1.0 / _1096;
        float _1102 = 1.0 / _1098;
        float _1104 = _1092 * _1102;
        float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1108 = fma(_1062, _1104, _1106);
        float _1110 = _1108 * _1100;
        float _1112 = precise::clamp(_1110, 0.0, 1.0);
        _1056 = _1112;
    }
    float _1114 = _1056;
    if (!_802)
    {
        float _1116 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1120 = _1116 * 0.15915493667125701904296875;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1120 * 6.283185482025146484375;
        float _1130 = sin(_1128);
        float _1132 = 1.0 / _1126;
        float _1134 = _1122 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1130 * _1132;
        float _1140 = _1122 * 6.283185482025146484375;
        float _1142 = sin(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = 1.0 / _1144;
        float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1150 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1148;
        float _1152 = 1.0 / _1150;
        float _1154 = _1142 * _1146;
        float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1158 = fma(_1062, _1154, _1156);
        float _1160 = _1158 * _1152;
        float _1162 = precise::clamp(_1160, 0.0, 1.0);
        float _1164 = -_1162;
        float _1166 = _1164 + 1.0;
        _1064 = _1166;
    }
    float _1168 = _1064;
    float _1170 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1048);
    float _1172 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1046);
    bool _1174 = _1114 > 0.0;
    bool _1176 = isnan(_1114);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(0.0);
    bool _1182 = _1178 || _1180;
    float _1184 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1050);
    float _1186 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1052);
    float _1192 = _1114 * _1168;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1198 = _1168 <= 0.0;
    bool _1200 = !_1182;
    bool _1202 = _1198 || _1200;
    float _1204 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1208 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1212 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1214 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1216 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1206);
    float _1218 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1220 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1210);
    float _1222 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1212);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1214);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1216);
    float _1228 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1220);
    float _1230 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1222);
    float _1232 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1224);
    float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1226);
    float _1238 = _1228 + _1230;
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = _1238 * 0.5;
    out.m_33.x = _1240;
    out.gl_Position.x = _1234;
    out.gl_Position.y = _1236;
    out.gl_Position.z = _1228;
    out.gl_Position.w = _1230;
    out.m_52.z = _1242;
    out.m_52.w = _1230;
    if (!_1202)
    {
        return out;
    }
    float _1244 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1244;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1301 = as_type<float>(_87);
        out.gl_Position.z = _1301;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _79 = _109;
    }
    float _111 = _79;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_125);
        out.gl_Position.z = _1371;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_37.z;
    float _129 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _131 = log2(_129);
    float _133 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = _131 * _105;
    float _145 = exp2(_143);
    float _147 = _127 * 2.0;
    int _149 = as_type<int>(_135) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_135) & 2;
    bool _155 = _153 != 0;
    float _157 = floor(_147);
    float _159 = in.m_35.x;
    float _161 = in.m_35.y;
    float _163 = in.m_35.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _137 * _139;
    int _177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _183 = _181 != 0;
    float _185 = trunc(_175);
    int _187 = int(_185);
    float _189 = _141 + _127;
    float _191 = _189 + (-1.0);
    bool _193 = !_151;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = 0.0;
    float _199 = _191;
    if (!_173)
    {
        float _201 = _133 * _133;
        float _203 = _201 * 0.5;
        _197 = _203;
    }
    float _205 = _197;
    bool _207 = _157 > 0.0;
    bool _209 = _157 >= 0.0;
    bool _211 = isnan(_157);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _205;
    if (!_173)
    {
        float _221 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _221;
    }
    float _223 = _219;
    bool _225 = !_155;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _231 = _223;
    if (!_173)
    {
        _199 = _133;
    }
    float _233 = _199;
    bool _235 = !_173;
    float _237 = _233;
    if (!_235)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _133 * _241;
        float _251 = 1.0 / _245;
        float _253 = _247 * 0.693147182464599609375;
        float _255 = exp2(_249);
        float _257 = 1.0 / _253;
        float _259 = _255 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _257, _133);
        float _265 = _263 * _251;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _267;
    }
    float _269 = _231;
    bool _271 = !_173;
    if (!_271)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = 1.0 / _279;
        float _283 = _133 * _275;
        float _285 = exp2(_283);
        float _287 = -_285;
        float _289 = _287 + 1.0;
        float _291 = _289 * _281;
        _237 = _291;
    }
    float _293 = _237;
    float _295 = in.m_42.w;
    float _297 = _139 + _141;
    bool _299 = _139 > 0.5;
    float _301 = _139 * 2.0;
    float _303 = in.m_30.x;
    float _305 = in.m_30.y;
    float _307 = in.m_30.z;
    float _309 = _297 + (-1.0);
    float _311 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _313 = -_195;
    int _315 = _299 ? as_type<int>(_313) : as_type<int>(_195);
    float _317 = floor(_301);
    bool _319 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _321 = isnan(0.0);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _327 = _323 || _325;
    float _329 = fma(_293, _161, _311);
    float _331 = -_145;
    float _333 = _331 + 1.0;
    float _335 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _337 = fma(_293, _163, _335);
    float _339 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _341 = _327 ? _333 : 0.0;
    float _343 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _345 = _187 << 4;
    int _347 = _345 + 1968;
    float _349 = fma(_293, _159, _339);
    bool _351 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _353 = isnan(1.0);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _359 = _355 || _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _363 = 1.0 + _361;
    uint _366 = uint(int(uint(_347) >> uint(2)));
    uint _368 = uint(int(uint(int(_366)) >> uint(2)));
    int _370 = int(_366) & 3;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[int(_368)][_370];
    int _374 = int(_366) + 1;
    uint _376 = uint(int(uint(_374) >> uint(2)));
    int _378 = _374 & 3;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[int(_376)][_378];
    bool _382 = _141 > 0.5;
    float _384 = 1.0 / _363;
    float _386 = fma(_329, _295, _305);
    float _388 = fma(_349, _295, _303);
    float _390 = fma(_337, _295, _307);
    float _392 = -_227;
    int _394 = _382 ? as_type<int>(_392) : as_type<int>(_227);
    float _396 = _386 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _386 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _400 = _386 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _402 = _347 + 8;
    uint _404 = uint(int(uint(_402) >> uint(2)));
    uint _406 = uint(int(uint(int(_404)) >> uint(2)));
    int _408 = int(_404) & 3;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[int(_406)][_408];
    float _412 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _414 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _398);
    float _416 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _400);
    bool _418 = _317 > 0.0;
    float _420 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].z, _412);
    float _422 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].z, _414);
    bool _424 = _317 >= 0.0;
    bool _426 = isnan(_317);
    bool _428 = _424 || _426;
    bool _430 = isnan(0.0);
    bool _432 = _428 || _430;
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    float _436 = _420 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _438 = _422 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _440 = !_179;
    float _442 = _440 ? _195 : as_type<float>(_315);
    float _444 = _434 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _448 = _436 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _452 = _438 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _456 = _444 + _454;
    float _458 = _448 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_359)
    {
        float _460 = _341 * _384;
        _107 = _460;
    }
    float _462 = _107;
    float _464 = _141 * 2.0;
    bool _466 = !_183;
    float _468 = _466 ? _227 : as_type<float>(_394);
    float _470 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[28].x, _458);
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _474 = _472 != 0;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _482 = _480 != 0;
    float _484 = in.m_42.x;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _488 = fma(_456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _470);
    float _490 = -_468;
    float _492 = _490 + 0.5;
    bool _494 = !_478;
    int _496 = _494 ? 0 : 1;
    float _498 = _442 + 0.5;
    int _500 = _217 ? 0 : 1;
    float _502 = _492 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _504 = _488 >= 0.0;
    float _506 = floor(_464);
    float _508 = _448 * _448;
    float _510 = _498 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _512 = !_474;
    int _514 = _512 ? 0 : 1;
    float _516 = fma(_452, _452, _508);
    float _518 = _380 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _522 = fma(_456, _456, _516);
    float _524 = _502 * _486;
    float _526 = _372 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _530 = _518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _532 = _506 > 0.0;
    float _534 = rsqrt(_522);
    bool _536 = _506 >= 0.0;
    bool _538 = isnan(_506);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    float _546 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_504)
    {
        out.m_33.x = 0.0;
    }
    bool _548 = !_482;
    int _550 = _548 ? 0 : 1;
    float _552 = _510 * _520;
    float _554 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _560 = _484;
    if (_504)
    {
        _560 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _562 = _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _568 = _410 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _570 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = _566 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _580 = as_type<int>(_562);
    if (_504)
    {
        float _582 = _562 * 5.0;
        _580 = as_type<int>(_582);
    }
    int _584 = _580;
    out.m_44.x = _552;
    out.m_44.y = _524;
    float _586 = _578 * _534;
    out.m_46.x = _572;
    out.m_46.y = _570;
    out.m_46.z = _574;
    out.m_46.w = _528;
    float _588 = _452 * _586;
    float _590 = _448 * _586;
    out.m_48.x = _546;
    out.m_48.y = _530;
    out.m_48.z = _576;
    if (_504)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2125 = as_type<float>(_584);
        out.gl_Position.z = _2125;
    }
    if (_504)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _592 = -_590;
    float _594 = _436 + _592;
    float _596 = -_588;
    float _598 = _438 + _596;
    int _600 = _432 ? 0 : 1;
    float _602 = _141 + (-0.5);
    float _604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _606 = _594 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _610 = _598 + _608;
    int _612 = ~_600;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    float _618 = -_590;
    float _620 = _448 + _618;
    float _622 = _606 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _624 = _616;
    if (!_418)
    {
        int _626 = ~_600;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = -_588;
    float _634 = _452 + _632;
    float _636 = in.m_50.x;
    float _638 = in.m_50.y;
    float _640 = in.m_50.z;
    float _642 = fma(_610, (*spvDescriptorSet0.vp_c8)._m0[28].x, _622);
    float _644 = _456 * _586;
    int _646 = ~_500;
    int _648 = _646 + 1;
    int _650 = _648 + 1;
    int _652 = _650;
    if (!_207)
    {
        int _654 = ~_500;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    float _660 = -_644;
    float _662 = _444 + _660;
    int _664 = abs(_514);
    float _666 = float(_658);
    float _668 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _670 = _662 + _668;
    float _672 = float(_664);
    int _674 = abs(_496);
    float _676 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[28].z, _642);
    float _678 = float(_630);
    float _680 = _672 * _666;
    float _682 = float(_674);
    int _684 = _544 ? 0 : 1;
    int _686 = abs(_550);
    float _688 = _682 * _678;
    bool _690 = _676 >= 0.0;
    float _692 = _680 * (-2.0);
    int _694 = ~_684;
    int _696 = _694 + 1;
    int _698 = _696 + 1;
    float _700 = _139 + (-0.5);
    float _702 = fma(_343, _692, _343);
    int _704 = _698;
    if (!_532)
    {
        int _706 = ~_684;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = fma(_692, _636, _636);
    float _714 = float(_686);
    float _716 = _688 * (-2.0);
    float _718 = float(_710);
    float _720 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _712);
    float _722 = _139 + _127;
    float _724 = fma(_716, _638, _638);
    float _726 = _620 * _620;
    float _728 = fma(_702, _462, _720);
    float _730 = _714 * _718;
    float _732 = fma(_229, _716, _229);
    float _734 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[196].y, _724);
    float _736 = _728 * 0.15915493667125701904296875;
    float _738 = _716;
    if (_690)
    {
        _738 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _740 = _738;
    float _742 = fma(_732, _462, _734);
    float _744 = _736 * 6.283185482025146484375;
    float _746 = cos(_744);
    int _748 = as_type<int>(_740);
    if (_690)
    {
        out.m_33.x = 0.0;
    }
    if (_690)
    {
        float _750 = _740 * 5.0;
        _748 = as_type<int>(_750);
    }
    int _752 = _748;
    float _754 = fma(_634, _634, _726);
    float _756 = _722 + (-1.0);
    float _758 = _730 * (-2.0);
    if (_690)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2373 = as_type<float>(_752);
        out.gl_Position.z = _2373;
    }
    float _760 = _736 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _742 * 0.15915493667125701904296875;
    if (_690)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _766 = in.m_42.y;
    float _768 = -_644;
    float _770 = _456 + _768;
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _774 = fma(_758, _640, _640);
    float _776 = _127 + (-0.5);
    float _778 = fma(_770, _770, _754);
    float _780 = fma(_772, _758, _772);
    float _782 = _764 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[196].z, _774);
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _792 = fma(_780, _462, _786);
    bool _794 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _802 = _798 || _800;
    float _804 = sqrt(_778);
    float _806 = _792 * 0.15915493667125701904296875;
    float _808 = _764 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = _766 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _814 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _816 = _806 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _534 * _804;
    float _822 = _746 * _784;
    float _824 = _820 * _814;
    float _826 = _566 * _820;
    float _828 = _806 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _788 * _824;
    float _834 = _762 * _784;
    float _836 = _746 * _810;
    float _838 = _790 * _826;
    float _840 = _818 * _832;
    float _842 = _784 * _818;
    float _844 = _810 * _818;
    float _846 = _762 * _810;
    float _848 = _746 * _840;
    float _850 = _820 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _852 = _850 * 0.5;
    float _854 = fma(_830, _836, _834);
    float _856 = -_832;
    float _858 = _830 * _856;
    float _860 = fma(_830, _834, _836);
    float _862 = fma(_854, _838, _848);
    float _864 = -_846;
    float _866 = fma(_830, _822, _864);
    float _868 = -_822;
    float _870 = fma(_830, _846, _868);
    float _872 = _762 * _840;
    float _874 = fma(_844, _838, _858);
    float _876 = fma(_866, _852, _862);
    float _878 = _594 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _880 = fma(_870, _838, _872);
    float _882 = fma(_842, _852, _874);
    float _884 = _876 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _886 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[11].x, _878);
    float _888 = fma(_860, _852, _880);
    float _890 = _876 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _892 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[26].x, _884);
    float _894 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _886);
    float _896 = _594 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[24].x, _890);
    float _900 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _892);
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _904 = fma(_598, (*spvDescriptorSet0.vp_c8)._m0[10].x, _896);
    float _906 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _898);
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _910 = 1.0 / _902;
    float _912 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _904);
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _916 = _444 + _908;
    float _918 = _912 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _920 = _438 + _914;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _916 + _922;
    float _926 = _876 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _928 = _918 + _902;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _932 = _920 + _930;
    float _934 = _924 * _924;
    float _936 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[25].x, _926);
    float _938 = fma(_932, _932, _934);
    float _940 = _928 * _910;
    float _942 = _940 * 0.5;
    float _944 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _936);
    float _946 = sqrt(_938);
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _948);
    float _952 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _954 = _436 + _952;
    float _956 = 1.0 / _950;
    bool _958 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _960 = _888;
    float _962 = _952;
    float _964 = _944;
    if (!_958)
    {
        _960 = _920;
    }
    float _966 = _960;
    float _968 = _966;
    if (!_958)
    {
        _962 = _916;
    }
    float _970 = _962;
    float _972 = _970;
    if (!_958)
    {
        _964 = _954;
    }
    float _974 = _964;
    bool _976 = !_958;
    float _978 = _974;
    if (!_976)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _984 = _946 + _982;
        float _986 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = rsqrt(_938);
        float _990 = _984 * _980;
        float _992 = _990 * 0.15915493667125701904296875;
        float _994 = _992 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = _992 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _996 + (-1.0);
        float _1004 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = fma(_1000, _986, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = fma(_954, _996, _1004);
        float _1010 = _988 * _1006;
        float _1012 = fma(_932, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1014 = fma(_924, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _978 = _1008;
        _968 = _1012;
        _972 = _1014;
    }
    float _1016 = _978;
    float _1018 = _968;
    float _1020 = _972;
    float _1022 = -_590;
    float _1024 = _1022 + _1016;
    float _1026 = -_588;
    float _1028 = _1026 + _1018;
    float _1030 = -_644;
    float _1032 = _1030 + _1020;
    float _1034 = _1020;
    if (_802)
    {
        _1034 = 1.0;
    }
    float _1036 = _1034;
    float _1038 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1040 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1044 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1046 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1038);
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1050 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1042);
    float _1052 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1044);
    float _1054 = _1044;
    float _1056 = _1036;
    if (_802)
    {
        _1054 = 1.0;
    }
    float _1058 = _1054;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1062 = _956 * _1060;
    float _1064 = _1058;
    if (!_802)
    {
        float _1066 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1068 = _1066 * 0.15915493667125701904296875;
        float _1070 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1072 = _1068 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = _1070 * 0.15915493667125701904296875;
        float _1078 = _1068 * 6.283185482025146484375;
        float _1080 = sin(_1078);
        float _1082 = 1.0 / _1074;
        float _1084 = _1076 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = _1080 * _1082;
        float _1090 = _1076 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1096 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1094;
        float _1098 = _1086 * _1088;
        float _1100 = 1.0 / _1096;
        float _1102 = 1.0 / _1098;
        float _1104 = _1092 * _1102;
        float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1108 = fma(_1062, _1104, _1106);
        float _1110 = _1108 * _1100;
        float _1112 = precise::clamp(_1110, 0.0, 1.0);
        _1056 = _1112;
    }
    float _1114 = _1056;
    if (!_802)
    {
        float _1116 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1120 = _1116 * 0.15915493667125701904296875;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1120 * 6.283185482025146484375;
        float _1130 = sin(_1128);
        float _1132 = 1.0 / _1126;
        float _1134 = _1122 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1130 * _1132;
        float _1140 = _1122 * 6.283185482025146484375;
        float _1142 = sin(_1140);
        float _1144 = _1136 * _1138;
        float _1146 = 1.0 / _1144;
        float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1150 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1148;
        float _1152 = 1.0 / _1150;
        float _1154 = _1142 * _1146;
        float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1158 = fma(_1062, _1154, _1156);
        float _1160 = _1158 * _1152;
        float _1162 = precise::clamp(_1160, 0.0, 1.0);
        float _1164 = -_1162;
        float _1166 = _1164 + 1.0;
        _1064 = _1166;
    }
    float _1168 = _1064;
    float _1170 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1048);
    float _1172 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1046);
    bool _1174 = _1114 > 0.0;
    bool _1176 = isnan(_1114);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan(0.0);
    bool _1182 = _1178 || _1180;
    float _1184 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1050);
    float _1186 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1052);
    float _1192 = _1114 * _1168;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1198 = _1168 <= 0.0;
    bool _1200 = !_1182;
    bool _1202 = _1198 || _1200;
    float _1204 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1208 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1212 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1214 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1204);
    float _1216 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1206);
    float _1218 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1220 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1210);
    float _1222 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1212);
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1214);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1216);
    float _1228 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1220);
    float _1230 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1222);
    float _1232 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1224);
    float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1226);
    float _1238 = _1228 + _1230;
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1242 = _1238 * 0.5;
    out.m_33.x = _1240;
    out.gl_Position.x = _1234;
    out.gl_Position.y = _1236;
    out.gl_Position.z = _1228;
    out.gl_Position.w = _1230;
    out.m_52.z = _1242;
    out.m_52.w = _1230;
    if (!_1202)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1244 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_33.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1244;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

