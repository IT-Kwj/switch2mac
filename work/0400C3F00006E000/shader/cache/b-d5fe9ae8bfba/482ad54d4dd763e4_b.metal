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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(2)]];
    float4 m_30 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_49 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
    float4 m_45 [[attribute(10)]];
    float4 m_47 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1198 = false;
    bool _760 = false;
    bool _580 = false;
    bool _400 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2342 = as_type<float>(_94);
        out.gl_Position.z = _2342;
    }
    if (!_82)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_78);
        _88 = _112;
    }
    float _114 = _88;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    int _126 = 0;
    if (_120)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_130);
        out.gl_Position.z = _2411;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_37.x;
    float _134 = in.m_37.y;
    float _136 = in.m_37.z;
    bool _138 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _140 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _142 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _144 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _146 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _140);
    float _148 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _142);
    float _150 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _144);
    float _152 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _146);
    float _154 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _148);
    float _156 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _150);
    bool _158 = !_138;
    float _176;
    if (!_158)
    {
        float _160 = in.m_39.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_78);
        float _182 = 1.0 / _180;
        float _184 = _110 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = _186 + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _194 = _186 + _192;
    bool _196 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _198 = isnan(_186);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _186 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = 1.0 / _210;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _228 = 1.0 / _222;
    float _230 = 1.0 / _218;
    float _232 = _190 * _224;
    bool _234 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_186);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_206;
    float _248 = _246 + 1.0;
    float _250 = _244 * _248;
    float _252 = _194 * _228;
    bool _254 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_186);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _272 = isnan(_186);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _286 = -_244;
    float _288 = _286 + 1.0;
    float _290 = -_264;
    float _292 = _290 + 1.0;
    float _294 = _214 * _230;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    float _304 = _280 * _292;
    float _306 = fma(_268, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _308 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = _264 * _288;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = _308 * _304;
    float _320 = _310 * _304;
    float _322 = _306 * _304;
    float _324 = -_280;
    float _326 = _324 + 1.0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _332 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].x, _320);
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].y, _318);
    float _336 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].z, _322);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _338;
    float _342 = fma(_284, _252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _344 = fma(_330, _252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _346 = fma(_316, _252, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _352;
    float _356 = fma(_342, _312, _332);
    float _358 = fma(_340, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _360 = fma(_350, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _362 = fma(_354, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _364 = fma(_344, _312, _334);
    float _366 = fma(_346, _312, _336);
    float _368 = fma(_358, _250, _356);
    float _370 = fma(_360, _250, _364);
    float _372 = fma(_362, _250, _366);
    float _374 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].x, _368);
    float _376 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].y, _370);
    float _378 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].z, _372);
    bool _380 = !_226;
    float _398;
    if (!_380)
    {
        float _382 = in.m_39.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_78);
        float _404 = 1.0 / _402;
        float _406 = _110 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = in.m_41.x;
    float _412 = in.m_41.y;
    float _414 = in.m_41.z;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _418 = _408 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _420;
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _426 = 1.0 / _422;
    float _428 = _376 * _412;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _434 = _418 * _426;
    bool _436 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _438 = isnan(_408);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = _378 * _414;
    float _450 = 1.0 / _432;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _454 = _408 + _452;
    bool _456 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_446;
    float _470 = _468 + 1.0;
    bool _472 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_408);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _482 * _470;
    float _486 = -_482;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _466 * _488;
    float _504 = fma(_492, _434, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _506 = fma(_496, _434, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = fma(_500, _434, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _510 = _454 * _450;
    float _512 = _504 * _502;
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_466;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _536 = fma(_524, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _512);
    float _540 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _514);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _546 = fma(_534, _484, _538);
    float _548 = fma(_536, _484, _542);
    float _550 = fma(_540, _484, _544);
    float _552 = _374 * _410;
    float _554 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _556 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _558 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    bool _560 = !_424;
    float _578;
    if (!_560)
    {
        float _562 = in.m_39.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_78);
        float _584 = 1.0 / _582;
        float _586 = _110 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _588 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _602 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_588);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _618 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _620 = isnan(_588);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = 1.0 / _596;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    float _636 = -_612;
    float _638 = _636 + 1.0;
    bool _640 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _642 = isnan(_588);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = 1.0 / _600;
    float _656 = 1.0 / _616;
    float _658 = _634 * _630;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = _628 * _638;
    float _666 = -_628;
    float _668 = _666 + 1.0;
    float _670 = fma(_658, _592, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _672;
    float _676 = _650 * _668;
    float _678 = _662 * _654;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _588 + _680;
    bool _684 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _686 = isnan(_588);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _670 * _676;
    float _698 = -_650;
    float _700 = _698 + 1.0;
    float _702 = fma(_678, _682, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _706 = _588 + _704;
    float _708 = _674 * _656;
    float _710 = -_694;
    float _712 = _710 + 1.0;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[115].x, _696);
    float _716 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _718 = fma(_708, _706, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _720 = _612 * _712;
    float _722 = fma(_702, _664, _714);
    float _724 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(_718, _720, _722);
    float _728 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[118].x, _726);
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _724;
    out.m_43.y = _734;
    out.m_43.z = _736;
    out.m_43.w = _738;
    bool _740 = !_652;
    float _758;
    if (!_740)
    {
        float _742 = in.m_39.x;
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _746 = _742 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _750 = _748 * _744;
        float _752 = floor(_750);
        float _754 = -_752;
        float _756 = _750 + _754;
        _758 = _756;
        _760 = true;
    }
    else
    {
        float _762 = float(_78);
        float _764 = 1.0 / _762;
        float _766 = _110 * _764;
        _758 = _766;
    }
    _760 = false;
    float _768 = _758;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _772 = _768 + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _786;
    float _790 = 1.0 / _780;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _800;
    float _804 = 1.0 / _776;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _808 = _768 + _806;
    bool _810 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _812 = isnan(_768);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    bool _822 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _824 = isnan(_768);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _784;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _838 = _768 + _836;
    float _840 = _808 * _790;
    bool _842 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _844 = isnan(_768);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -_820;
    float _856 = _854 + 1.0;
    bool _858 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _860 = isnan(_768);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _794;
    float _872 = _838 * _804;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _876 = _768 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _880 = _768 + _878;
    float _882 = -_852;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _798;
    float _888 = _772 * _834;
    bool _890 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _892 = isnan(_768);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _902;
    float _906 = _868 * _884;
    bool _908 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _910 = 1.0 / _802;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _914 = _768 + _912;
    float _916 = _914 * _870;
    float _918 = -_868;
    float _920 = _918 + 1.0;
    float _922 = 1.0 / _788;
    float _924 = _876 * _886;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _930;
    float _934 = _900 * _920;
    float _936 = fma(_932, _872, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _938 = _880 * _910;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _942 = _768 + _940;
    float _944 = -_900;
    float _946 = _944 + 1.0;
    float _948 = fma(_904, _872, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _950 = _832 * _856;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _952;
    float _956 = _820 * _946;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = _942 * _922;
    float _964 = fma(_928, _872, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _970 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _972 = isnan(_768);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = -_832;
    float _984 = _982 + 1.0;
    bool _986 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _988 = isnan(_768);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = fma(_968, _840, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1000 = fma(_960, _840, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1002 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_768);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1018 = _980 * _984;
    float _1020 = -_980;
    float _1022 = _1020 + 1.0;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1024;
    float _1028 = fma(_1016, _840, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1030 = _1012 * _1022;
    float _1032 = -_1012;
    float _1034 = _1032 + 1.0;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1036;
    float _1040 = fma(_1026, _888, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1042 = _996 * _1034;
    float _1044 = -_996;
    float _1046 = _1044 + 1.0;
    float _1048 = fma(_1038, _888, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1050 = fma(_954, _888, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1052 = _948 * _1042;
    float _1054 = _936 * _1042;
    float _1056 = _964 * _1042;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1070 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1052);
    float _1072 = fma(_1060, _924, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1074 = fma(_1064, _924, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1076 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1054);
    float _1078 = fma(_1068, _924, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1056);
    float _1082 = fma(_998, _1030, _1070);
    float _1084 = fma(_1000, _1030, _1080);
    float _1086 = fma(_1028, _1030, _1076);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1088;
    float _1092 = fma(_1048, _1018, _1082);
    float _1094 = fma(_1050, _1018, _1084);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1096;
    float _1100 = fma(_1040, _1018, _1086);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1114;
    float _1118 = fma(_1090, _962, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1120 = fma(_1072, _950, _1092);
    float _1122 = fma(_1098, _962, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1124 = fma(_1104, _916, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1126 = fma(_1108, _916, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1128 = fma(_1112, _916, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1130 = fma(_1074, _950, _1100);
    float _1132 = fma(_1078, _950, _1094);
    float _1134 = fma(_1116, _962, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1136 = fma(_1118, _956, _1120);
    float _1138 = fma(_1122, _956, _1130);
    float _1140 = fma(_1134, _956, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1142;
    float _1146 = fma(_1124, _934, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1148;
    float _1152 = fma(_1126, _934, _1138);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1154;
    float _1158 = fma(_1144, _938, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1160 = fma(_1150, _938, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1162 = fma(_1128, _934, _1140);
    float _1164 = fma(_1156, _938, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1166 = fma(_1158, _906, _1146);
    float _1168 = fma(_1160, _906, _1152);
    float _1170 = fma(_1164, _906, _1162);
    float _1172 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1166);
    float _1174 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1168);
    float _1176 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1170);
    bool _1178 = !_908;
    float _1196;
    if (!_1178)
    {
        float _1180 = in.m_39.x;
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1184 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _1188 = _1186 * _1182;
        float _1190 = floor(_1188);
        float _1192 = -_1190;
        float _1194 = _1188 + _1192;
        _1196 = _1194;
        _1198 = true;
    }
    else
    {
        float _1200 = float(_78);
        float _1202 = 1.0 / _1200;
        float _1204 = _110 * _1202;
        _1196 = _1204;
    }
    _1198 = false;
    float _1206 = _1196;
    float _1208 = in.m_45.y;
    float _1210 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1212 = in.m_39.y;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1216 = _1214 != 0;
    float _1218 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1222 = _1220 != 0;
    float _1224 = in.m_39.z;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1228 = _1226 != 0;
    float _1230 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1234 = _1232 != 0;
    float _1236 = in.m_39.w;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1240 = in.m_47.x;
    float _1242 = in.m_49.x;
    float _1244 = in.m_49.y;
    float _1246 = in.m_49.z;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1250 = in.m_39.x;
    float _1252 = -_1208;
    float _1254 = _1252 + 1.0;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1258 = _1212 > 0.5;
    float _1260 = in.m_47.y;
    float _1262 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1264 = _1224 > 0.5;
    float _1266 = in.m_47.w;
    int _1268 = _1258 ? as_type<int>(_1254) : as_type<int>(_1208);
    bool _1270 = _1236 > 0.5;
    float _1272 = in.m_47.z;
    int _1274 = _1264 ? as_type<int>(_1254) : as_type<int>(_1208);
    out.m_51.x = _1240;
    float _1276 = _1222 ? as_type<float>(_1268) : _1208;
    float _1278 = _1228 ? as_type<float>(_1274) : _1208;
    float _1280 = _1208;
    bool _1282 = _1216;
    float _1284 = _1206;
    float _1286 = _1212;
    if (_1216)
    {
        float _1288 = _1270 ? _1254 : _1208;
        _1280 = _1288;
    }
    float _1290 = _1280;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1294 = _1292 != 0;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1300 = _1298 != 0;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1306 = _1304 != 0;
    out.m_51.y = _1260;
    float _1308 = in.m_30.x;
    float _1310 = in.m_30.y;
    float _1312 = in.m_30.z;
    if (_1234)
    {
        bool _1314 = _1250 > 0.5;
        _1282 = _1314;
    }
    bool _1316 = _1282;
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1320 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_51.w = _1266;
    float _1322 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1324 = -_1296;
    float _1326 = fma(_1320, 2.0, _1324);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_51.z = _1272;
    float _1332 = fma(_1322, -2.0, _1302);
    float _1334 = _1210 * _1318;
    float _1336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1340 = in.m_45.x;
    float _1342 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1344 = _1218 * _1336;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1348 = 1.0 / _1330;
    float _1350 = _1230 * _1346;
    float _1352 = 0.0;
    int _1354 = as_type<int>(_1342);
    float _1356 = _1338;
    float _1358 = _1326;
    if (!_1306)
    {
        _1352 = _1224;
    }
    float _1360 = _1352;
    float _1362 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1364 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1366 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1368;
    float _1372 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1362);
    float _1374 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1364);
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1378 = _1376 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1380 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1366);
    float _1382 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1372);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1388 = 1.0 / _1378;
    float _1390 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1380);
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1394 = _1370 * _1348;
    float _1396 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1374);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1402 = -_1392;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1406 = 0;
    float _1408 = _1360;
    float _1410 = _1340;
    if (_1300)
    {
        float _1412 = -_1340;
        float _1414 = _1412 + 1.0;
        _1406 = as_type<int>(_1414);
    }
    int _1416 = _1406;
    float _1418 = _1396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1420 = _1390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1422 = _1404 * _1404;
    float _1424 = 1.0 / _1386;
    float _1426 = -_1418;
    float _1428 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = -_1420;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    if (_1306)
    {
        _1408 = _1212;
    }
    float _1434 = _1408;
    float _1436 = fma(_1428, _1428, _1422);
    float _1438 = fma(_1432, _1432, _1436);
    float _1440 = rsqrt(_1438);
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1442;
    float _1446 = _1400 * _1424;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1450 = _1206 + _1448;
    float _1452 = _1444 * _1388;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1456 = _1206 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1460 = _1206 + _1458;
    float _1462 = fma(_1394, _1450, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1464 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1466 = fma(_1446, _1456, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1468 = fma(_1452, _1460, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1470 = fma(_1464, _1276, -0.5);
    float _1472 = _1428 * _1440;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1476 = _1432 * _1440;
    bool _1478 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1480 = isnan(_1206);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1486 = _1482 || _1484;
    float _1488 = float(_1486);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1492 = _1472 * _1490;
    float _1494 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1474);
    float _1496 = _1404 * _1440;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = _1476 * _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1504 = -_1492;
    float _1506 = fma(_1476, _1502, _1504);
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1512 = _1496 * _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1516 = -_1500;
    float _1518 = fma(_1496, _1514, _1516);
    float _1520 = _1506 * _1506;
    bool _1522 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1524 = isnan(_1206);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1536 = -_1512;
    float _1538 = fma(_1472, _1534, _1536);
    float _1540 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1508);
    float _1542 = fma(_1518, _1518, _1520);
    float _1544 = -_1488;
    float _1546 = _1544 + 1.0;
    bool _1548 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_1206);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = -_1532;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1538, _1538, _1542);
    float _1566 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1540);
    float _1568 = _1532 * _1546;
    float _1570 = fma(_1278, _1262, -0.5);
    float _1572 = rsqrt(_1564);
    float _1574 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1576 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1578 = isnan(_1206);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = _1558 * _1562;
    float _1590 = -_1558;
    float _1592 = _1590 + 1.0;
    float _1594 = -_1342;
    float _1596 = fma(_1566, _1470, _1594);
    float _1598 = _1564;
    float _1600 = _1438;
    float _1602 = _1434;
    if (_1234)
    {
        float _1604 = -_1340;
        float _1606 = _1604 + 1.0;
        _1354 = as_type<int>(_1606);
    }
    int _1608 = _1354;
    float _1610 = fma(_1574, _1290, -0.5);
    if (_1306)
    {
        _1284 = _1250;
    }
    float _1612 = _1284;
    float _1614 = _1586 * _1592;
    float _1616 = _1612;
    if (!_1234)
    {
        _1356 = _1340;
    }
    float _1618 = _1356;
    float _1620 = -_1586;
    float _1622 = _1620 + 1.0;
    float _1624 = _1462 * _1614;
    float _1626 = _1618;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (!_1306)
    {
        _1616 = _1224;
    }
    float _1630 = _1616;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1634 = _1518 * _1572;
    float _1636 = _1506 * _1572;
    if (_1234)
    {
        float _1638 = _1316 ? as_type<float>(_1608) : _1340;
        _1626 = _1638;
    }
    float _1640 = _1626;
    float _1642 = _1538 * _1572;
    float _1644 = _1496 * _1634;
    float _1646 = _1476 * _1636;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1650 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1652 = -_1644;
    float _1654 = fma(_1472, _1636, _1652);
    float _1656 = -_1646;
    float _1658 = fma(_1496, _1642, _1656);
    if (_1294)
    {
        float _1660 = -_1340;
        float _1662 = _1660 + 1.0;
        _1628 = as_type<int>(_1662);
    }
    int _1664 = _1628;
    float _1666 = -_1648;
    float _1668 = fma(_1650, 2.0, _1666);
    float _1670 = _1350 * _1654;
    float _1672 = _1350 * _1658;
    if (!_1294)
    {
        _1598 = _1340;
    }
    float _1674 = _1598;
    float _1676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1678 = fma(_1334, _1642, _1670);
    float _1680 = _1674;
    if (_1294)
    {
        float _1682 = _1264 ? as_type<float>(_1664) : _1340;
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = fma(_1334, _1634, _1672);
    float _1688 = fma(_1344, _1476, _1678);
    if (!_1306)
    {
        _1600 = _1212;
    }
    float _1690 = _1600;
    float _1692 = fma(_1344, _1472, _1686);
    float _1694 = _1690;
    if (_1306)
    {
        _1694 = _1250;
    }
    float _1696 = _1694;
    float _1698 = _1420 + _1688;
    float _1700 = _1698;
    if (_1300)
    {
        float _1702 = _1258 ? as_type<float>(_1416) : _1340;
        _1410 = _1702;
    }
    float _1704 = _1410;
    float _1706 = _1418 + _1692;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1712 = _1698 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1716 = _1706 + _1714;
    float _1718 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1708);
    float _1720 = _1712 * _1712;
    float _1722 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1726 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1728 = fma(_1716, _1716, _1720);
    float _1730 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1624);
    float _1732 = -_1256;
    float _1734 = fma(_1722, 2.0, _1732);
    float _1736 = _1472 * _1642;
    float _1738 = sqrt(_1728);
    float _1740 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1724);
    float _1742 = -_1736;
    float _1744 = fma(_1476, _1634, _1742);
    float _1746 = fma(_1466, _1588, _1730);
    float _1748 = _1706;
    if (!_1306)
    {
        _1602 = _1224;
    }
    float _1750 = _1602;
    float _1752 = _1350 * _1744;
    float _1754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1756 = _1750;
    if (_1306)
    {
        _1756 = _1212;
    }
    float _1758 = _1756;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1762 = fma(_1334, _1636, _1752);
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1766 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1760);
    float _1768 = fma(_1344, _1496, _1762);
    bool _1770 = _1738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1774 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1776 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1764);
    float _1778 = _1392 + _1768;
    float _1780 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1782 = fma(_1774, -2.0, _1772);
    if (!_1306)
    {
        _1286 = _1250;
    }
    float _1784 = _1286;
    float _1786 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1788 = -_110;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1326);
    float _1792 = fma(_1780, _1640, -0.5);
    float _1794 = fma(_1726, _1684, -0.5);
    float _1796 = fma(_1786, _1704, -0.5);
    float _1798 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1766);
    if (!_1770)
    {
        _1358 = _1778;
    }
    float _1800 = _1358;
    bool _1802 = !_1770;
    float _1804 = _1800;
    if (!_1802)
    {
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1810 = _1738 + _1808;
        float _1812 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1814 = rsqrt(_1728);
        float _1816 = _1810 * _1806;
        float _1818 = _1816 * 0.15915493667125701904296875;
        float _1820 = _1818 * 6.283185482025146484375;
        float _1822 = sin(_1820);
        float _1824 = _1818 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        float _1828 = fma(_1822, _1812, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1830 = _1814 * _1828;
        float _1832 = _1826 + (-1.0);
        float _1834 = fma(_1716, _1830, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1836 = fma(_1712, _1830, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1838 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = fma(_1778, _1826, _1838);
        _1804 = _1840;
        _1748 = _1834;
        _1700 = _1836;
    }
    float _1842 = _1804;
    float _1844 = _1748;
    float _1846 = _1700;
    float _1848 = -_1392;
    float _1850 = _1848 + _1842;
    float _1852 = fma(_1468, _1568, _1746);
    float _1854 = -_1418;
    float _1856 = _1854 + _1844;
    float _1858 = fma(_1798, _1792, _1790);
    float _1860 = _1850 * _1850;
    float _1862 = -_1420;
    float _1864 = _1862 + _1846;
    float _1866 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1852);
    float _1868 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1870 = fma(_1856, _1856, _1860);
    float _1872 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1874 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1876 = fma(_1864, _1864, _1870);
    float _1878 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1880 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1874);
    float _1882 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1718);
    float _1884 = sqrt(_1876);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1888 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1880);
    float _1890 = -_110;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1734);
    float _1894 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1896 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1900 = fma(_1882, _1794, _1892);
    float _1902 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1894);
    float _1904 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = 1.0 / _1898;
    float _1908 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1902);
    float _1912 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1866 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1916 = fma(_1896, -2.0, _1886);
    bool _1918 = _1884 > 0.0;
    float _1920 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1922 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1776);
    out.m_53.x = _1904;
    out.m_53.y = _1908;
    out.m_53.z = _1912;
    out.m_53.w = _1914;
    float _1924 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1494);
    float _1926 = -_110;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1668);
    float _1930 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1740);
    float _1932 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1782);
    float _1934 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1916);
    bool _1936 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1938 = isnan(0.5);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1944 = _1940 || _1942;
    float _1946 = fma(_1922, _1796, _1928);
    bool _1948 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1950 = isnan(0.5);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1956 = _1952 || _1954;
    float _1958 = -_1932;
    float _1960 = fma(_1930, _1610, _1958);
    float _1962 = -_1934;
    float _1964 = fma(_1924, _1570, _1962);
    float _1966 = _1920 + _1898;
    float _1968 = _1966 * _1906;
    float _1970 = _1968 * 0.5;
    bool _1972 = !_1918;
    float _1974 = _1844;
    float _1976 = _1842;
    float _1978 = _1846;
    float _1980 = _1912;
    float _1982 = _1914;
    float _1984 = _1908;
    float _1986 = _1934;
    if (!_1972)
    {
        float _1988 = _154 * _154;
        float _1990 = rsqrt(_1876);
        float _1992 = fma(_152, _152, _1988);
        float _1994 = fma(_156, _156, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = _1856 * _1990;
        float _2000 = _1850 * _1990;
        float _2002 = _1864 * _1990;
        bool _2004 = _1996 > 0.0;
        bool _2006 = !_2004;
        _1980 = _1994;
        _1982 = _1996;
        _1984 = _1990;
        _1986 = _2000;
        if (!_2006)
        {
            float _2008 = rsqrt(_1994);
            float _2010 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2012 = _154 * _2008;
            float _2014 = _152 * _2008;
            float _2016 = _2000 * _2012;
            float _2018 = _156 * _2008;
            float _2020 = fma(_1998, _2014, _2016);
            float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2024 = fma(_2002, _2018, _2020);
            float _2026 = _2024 * _2022;
            float _2028 = fma(_152, _2026, _1844);
            float _2030 = fma(_154, _2026, _1842);
            float _2032 = fma(_156, _2026, _1846);
            _1974 = _2028;
            _1976 = _2030;
            _1978 = _2032;
            _1980 = _2008;
            _1982 = _2024;
            _1984 = _2014;
            _1986 = _2020;
        }
    }
    float _2034 = _1974;
    float _2036 = _1976;
    float _2038 = _1978;
    float _2040 = _1980;
    float _2042 = _1982;
    float _2044 = _1984;
    float _2046 = _1986;
    float _2048 = _2042;
    float _2050 = _2040;
    float _2052 = _2044;
    float _2054 = _2046;
    if (_1944)
    {
        _2048 = _2034;
    }
    float _2056 = _2048;
    float _2058 = _2056;
    if (_1944)
    {
        _2050 = _2036;
    }
    float _2060 = _2050;
    float _2062 = _2060;
    if (_1944)
    {
        _2052 = _2038;
    }
    float _2064 = _2052;
    float _2066 = _2064;
    if (!_1944)
    {
        float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2070 = _1392 + _2068;
        float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2074 = _1418 + _2072;
        float _2076 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2078 = -_1392;
        float _2080 = _2078 + _2036;
        float _2082 = _2070 * _2070;
        float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2086 = _1420 + _2084;
        float _2088 = -_1420;
        float _2090 = _2088 + _2038;
        float _2092 = fma(_2074, _2074, _2082);
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2096 = fma(_2086, _2086, _2092);
        float _2098 = sqrt(_2096);
        float _2100 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2102 = precise::min(_2098, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2104 = _2102 * _2094;
        float _2106 = -_1418;
        float _2108 = _2106 + _2034;
        float _2110 = _2100 * _2104;
        float _2112 = fma(_2108, _2110, _1418);
        float _2114 = fma(_2080, _2110, _1392);
        float _2116 = fma(_2090, _2110, _1420);
        _2062 = _2114;
        _2058 = _2112;
        _2066 = _2116;
        _2054 = _2094;
    }
    float _2118 = _2062;
    float _2120 = _2058;
    float _2122 = _2066;
    float _2124 = _2054;
    float _2126 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = _2124;
    if (_1956)
    {
        _2128 = 1.0;
    }
    float _2130 = _2128;
    float _2132 = _2130;
    if (!_1956)
    {
        float _2134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2138 = _2134 * 0.15915493667125701904296875;
        float _2140 = _2136 * 0.15915493667125701904296875;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2144 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2142);
        float _2146 = _2138 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2138 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = 1.0 / _2148;
        float _2156 = _2140 * 6.283185482025146484375;
        float _2158 = cos(_2156);
        float _2160 = _2152 * _2154;
        float _2162 = _2140 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2166;
        float _2170 = _2158 * _2160;
        float _2172 = 1.0 / _2144;
        float _2174 = 1.0 / _2170;
        float _2176 = 1.0 / _2168;
        float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2180 = _2172 * _2178;
        float _2182 = _2164 * _2174;
        float _2184 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2186 = fma(_2182, _2180, _2184);
        float _2188 = _2186 * _2176;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        _2132 = _2190;
    }
    float _2192 = _2132;
    float _2194 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2196 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2198 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2200 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2202 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2194);
    float _2204 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2196);
    float _2206 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2198);
    float _2208 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2200);
    float _2210 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2202);
    float _2212 = _2204 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2214 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2206);
    float _2216 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2208);
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2220 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2224 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2228 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2230 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2220);
    float _2232 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2222);
    float _2234 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2224);
    float _2236 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2226);
    float _2238 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2230);
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2232);
    float _2244 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2234);
    float _2246 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2236);
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2240);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2242);
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2244);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2246);
    bool _2256 = _2192 > 0.0;
    bool _2258 = isnan(_2192);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan(0.0);
    bool _2264 = _2260 || _2262;
    float _2266 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2268 = _1596 + 0.5;
    float _2270 = _2252 + _2254;
    float _2272 = _1946 + 0.5;
    float _2274 = _2266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2276 = _1858 + 0.5;
    float _2278 = _1900 + 0.5;
    float _2280 = _1960 + 0.5;
    float _2282 = _1964 + 0.5;
    float _2284 = _2270 * 0.5;
    out.m_33.x = _2274;
    out.m_55.x = _2276;
    out.m_55.y = _2268;
    out.m_55.z = _2278;
    out.m_55.w = _2280;
    out.m_57.x = _2272;
    out.m_57.y = _2282;
    out.gl_Position.x = _2250;
    out.gl_Position.y = _2248;
    out.gl_Position.z = _2252;
    out.gl_Position.w = _2254;
    out.m_59.z = _2284;
    out.m_59.w = _2254;
    if (_2264)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2286;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1198 = false;
    bool _760 = false;
    bool _580 = false;
    bool _400 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2342 = as_type<float>(_94);
        out.gl_Position.z = _2342;
    }
    if (!_82)
    {
        return out;
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_78);
        _88 = _112;
    }
    float _114 = _88;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    int _126 = 0;
    if (_120)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_130);
        out.gl_Position.z = _2411;
    }
    if (_120)
    {
        return out;
    }
    float _132 = in.m_37.x;
    float _134 = in.m_37.y;
    float _136 = in.m_37.z;
    bool _138 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _140 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _142 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _144 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _146 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _140);
    float _148 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _142);
    float _150 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _144);
    float _152 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _146);
    float _154 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _148);
    float _156 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _150);
    bool _158 = !_138;
    float _176;
    if (!_158)
    {
        float _160 = in.m_39.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_78);
        float _182 = 1.0 / _180;
        float _184 = _110 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = _186 + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _194 = _186 + _192;
    bool _196 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _198 = isnan(_186);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _186 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = 1.0 / _210;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _228 = 1.0 / _222;
    float _230 = 1.0 / _218;
    float _232 = _190 * _224;
    bool _234 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_186);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_206;
    float _248 = _246 + 1.0;
    float _250 = _244 * _248;
    float _252 = _194 * _228;
    bool _254 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_186);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _272 = isnan(_186);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _286 = -_244;
    float _288 = _286 + 1.0;
    float _290 = -_264;
    float _292 = _290 + 1.0;
    float _294 = _214 * _230;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    float _304 = _280 * _292;
    float _306 = fma(_268, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _308 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = _264 * _288;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = _308 * _304;
    float _320 = _310 * _304;
    float _322 = _306 * _304;
    float _324 = -_280;
    float _326 = _324 + 1.0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _332 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].x, _320);
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].y, _318);
    float _336 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].z, _322);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _338;
    float _342 = fma(_284, _252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _344 = fma(_330, _252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _346 = fma(_316, _252, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _352;
    float _356 = fma(_342, _312, _332);
    float _358 = fma(_340, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _360 = fma(_350, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _362 = fma(_354, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _364 = fma(_344, _312, _334);
    float _366 = fma(_346, _312, _336);
    float _368 = fma(_358, _250, _356);
    float _370 = fma(_360, _250, _364);
    float _372 = fma(_362, _250, _366);
    float _374 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].x, _368);
    float _376 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].y, _370);
    float _378 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].z, _372);
    bool _380 = !_226;
    float _398;
    if (!_380)
    {
        float _382 = in.m_39.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_78);
        float _404 = 1.0 / _402;
        float _406 = _110 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = in.m_41.x;
    float _412 = in.m_41.y;
    float _414 = in.m_41.z;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _418 = _408 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _420;
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _426 = 1.0 / _422;
    float _428 = _376 * _412;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _434 = _418 * _426;
    bool _436 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _438 = isnan(_408);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = _378 * _414;
    float _450 = 1.0 / _432;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _454 = _408 + _452;
    bool _456 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_446;
    float _470 = _468 + 1.0;
    bool _472 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_408);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _482 * _470;
    float _486 = -_482;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _466 * _488;
    float _504 = fma(_492, _434, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _506 = fma(_496, _434, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = fma(_500, _434, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _510 = _454 * _450;
    float _512 = _504 * _502;
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_466;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _536 = fma(_524, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _512);
    float _540 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _514);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _546 = fma(_534, _484, _538);
    float _548 = fma(_536, _484, _542);
    float _550 = fma(_540, _484, _544);
    float _552 = _374 * _410;
    float _554 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _556 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _558 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    bool _560 = !_424;
    float _578;
    if (!_560)
    {
        float _562 = in.m_39.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_78);
        float _584 = 1.0 / _582;
        float _586 = _110 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _588 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _602 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_588);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _618 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _620 = isnan(_588);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = 1.0 / _596;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    float _636 = -_612;
    float _638 = _636 + 1.0;
    bool _640 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _642 = isnan(_588);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = 1.0 / _600;
    float _656 = 1.0 / _616;
    float _658 = _634 * _630;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = _628 * _638;
    float _666 = -_628;
    float _668 = _666 + 1.0;
    float _670 = fma(_658, _592, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _672;
    float _676 = _650 * _668;
    float _678 = _662 * _654;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _588 + _680;
    bool _684 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _686 = isnan(_588);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _670 * _676;
    float _698 = -_650;
    float _700 = _698 + 1.0;
    float _702 = fma(_678, _682, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _706 = _588 + _704;
    float _708 = _674 * _656;
    float _710 = -_694;
    float _712 = _710 + 1.0;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[115].x, _696);
    float _716 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _718 = fma(_708, _706, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _720 = _612 * _712;
    float _722 = fma(_702, _664, _714);
    float _724 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(_718, _720, _722);
    float _728 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[118].x, _726);
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _724;
    out.m_43.y = _734;
    out.m_43.z = _736;
    out.m_43.w = _738;
    bool _740 = !_652;
    float _758;
    if (!_740)
    {
        float _742 = in.m_39.x;
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _746 = _742 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _750 = _748 * _744;
        float _752 = floor(_750);
        float _754 = -_752;
        float _756 = _750 + _754;
        _758 = _756;
        _760 = true;
    }
    else
    {
        float _762 = float(_78);
        float _764 = 1.0 / _762;
        float _766 = _110 * _764;
        _758 = _766;
    }
    _760 = false;
    float _768 = _758;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _772 = _768 + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _786;
    float _790 = 1.0 / _780;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _800;
    float _804 = 1.0 / _776;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _808 = _768 + _806;
    bool _810 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _812 = isnan(_768);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    bool _822 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _824 = isnan(_768);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _784;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _838 = _768 + _836;
    float _840 = _808 * _790;
    bool _842 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _844 = isnan(_768);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -_820;
    float _856 = _854 + 1.0;
    bool _858 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _860 = isnan(_768);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _794;
    float _872 = _838 * _804;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _876 = _768 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _880 = _768 + _878;
    float _882 = -_852;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _798;
    float _888 = _772 * _834;
    bool _890 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _892 = isnan(_768);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _902;
    float _906 = _868 * _884;
    bool _908 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _910 = 1.0 / _802;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _914 = _768 + _912;
    float _916 = _914 * _870;
    float _918 = -_868;
    float _920 = _918 + 1.0;
    float _922 = 1.0 / _788;
    float _924 = _876 * _886;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _930;
    float _934 = _900 * _920;
    float _936 = fma(_932, _872, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _938 = _880 * _910;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _942 = _768 + _940;
    float _944 = -_900;
    float _946 = _944 + 1.0;
    float _948 = fma(_904, _872, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _950 = _832 * _856;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _952;
    float _956 = _820 * _946;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = _942 * _922;
    float _964 = fma(_928, _872, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _970 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _972 = isnan(_768);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = -_832;
    float _984 = _982 + 1.0;
    bool _986 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _988 = isnan(_768);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = fma(_968, _840, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1000 = fma(_960, _840, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1002 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_768);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1018 = _980 * _984;
    float _1020 = -_980;
    float _1022 = _1020 + 1.0;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1024;
    float _1028 = fma(_1016, _840, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1030 = _1012 * _1022;
    float _1032 = -_1012;
    float _1034 = _1032 + 1.0;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1036;
    float _1040 = fma(_1026, _888, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1042 = _996 * _1034;
    float _1044 = -_996;
    float _1046 = _1044 + 1.0;
    float _1048 = fma(_1038, _888, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1050 = fma(_954, _888, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1052 = _948 * _1042;
    float _1054 = _936 * _1042;
    float _1056 = _964 * _1042;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1070 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1052);
    float _1072 = fma(_1060, _924, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1074 = fma(_1064, _924, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1076 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1054);
    float _1078 = fma(_1068, _924, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1056);
    float _1082 = fma(_998, _1030, _1070);
    float _1084 = fma(_1000, _1030, _1080);
    float _1086 = fma(_1028, _1030, _1076);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1088;
    float _1092 = fma(_1048, _1018, _1082);
    float _1094 = fma(_1050, _1018, _1084);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1096;
    float _1100 = fma(_1040, _1018, _1086);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1114;
    float _1118 = fma(_1090, _962, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1120 = fma(_1072, _950, _1092);
    float _1122 = fma(_1098, _962, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1124 = fma(_1104, _916, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1126 = fma(_1108, _916, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1128 = fma(_1112, _916, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1130 = fma(_1074, _950, _1100);
    float _1132 = fma(_1078, _950, _1094);
    float _1134 = fma(_1116, _962, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1136 = fma(_1118, _956, _1120);
    float _1138 = fma(_1122, _956, _1130);
    float _1140 = fma(_1134, _956, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1142;
    float _1146 = fma(_1124, _934, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1148;
    float _1152 = fma(_1126, _934, _1138);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1154;
    float _1158 = fma(_1144, _938, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1160 = fma(_1150, _938, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1162 = fma(_1128, _934, _1140);
    float _1164 = fma(_1156, _938, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1166 = fma(_1158, _906, _1146);
    float _1168 = fma(_1160, _906, _1152);
    float _1170 = fma(_1164, _906, _1162);
    float _1172 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1166);
    float _1174 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1168);
    float _1176 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1170);
    bool _1178 = !_908;
    float _1196;
    if (!_1178)
    {
        float _1180 = in.m_39.x;
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1184 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _1188 = _1186 * _1182;
        float _1190 = floor(_1188);
        float _1192 = -_1190;
        float _1194 = _1188 + _1192;
        _1196 = _1194;
        _1198 = true;
    }
    else
    {
        float _1200 = float(_78);
        float _1202 = 1.0 / _1200;
        float _1204 = _110 * _1202;
        _1196 = _1204;
    }
    _1198 = false;
    float _1206 = _1196;
    float _1208 = in.m_45.y;
    float _1210 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1212 = in.m_39.y;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1216 = _1214 != 0;
    float _1218 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1222 = _1220 != 0;
    float _1224 = in.m_39.z;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1228 = _1226 != 0;
    float _1230 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1234 = _1232 != 0;
    float _1236 = in.m_39.w;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1240 = in.m_47.x;
    float _1242 = in.m_49.x;
    float _1244 = in.m_49.y;
    float _1246 = in.m_49.z;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1250 = in.m_39.x;
    float _1252 = -_1208;
    float _1254 = _1252 + 1.0;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1258 = _1212 > 0.5;
    float _1260 = in.m_47.y;
    float _1262 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1264 = _1224 > 0.5;
    float _1266 = in.m_47.w;
    int _1268 = _1258 ? as_type<int>(_1254) : as_type<int>(_1208);
    bool _1270 = _1236 > 0.5;
    float _1272 = in.m_47.z;
    int _1274 = _1264 ? as_type<int>(_1254) : as_type<int>(_1208);
    out.m_51.x = _1240;
    float _1276 = _1222 ? as_type<float>(_1268) : _1208;
    float _1278 = _1228 ? as_type<float>(_1274) : _1208;
    float _1280 = _1208;
    bool _1282 = _1216;
    float _1284 = _1206;
    float _1286 = _1212;
    if (_1216)
    {
        float _1288 = _1270 ? _1254 : _1208;
        _1280 = _1288;
    }
    float _1290 = _1280;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1294 = _1292 != 0;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1300 = _1298 != 0;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1306 = _1304 != 0;
    out.m_51.y = _1260;
    float _1308 = in.m_30.x;
    float _1310 = in.m_30.y;
    float _1312 = in.m_30.z;
    if (_1234)
    {
        bool _1314 = _1250 > 0.5;
        _1282 = _1314;
    }
    bool _1316 = _1282;
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1320 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_51.w = _1266;
    float _1322 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1324 = -_1296;
    float _1326 = fma(_1320, 2.0, _1324);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_51.z = _1272;
    float _1332 = fma(_1322, -2.0, _1302);
    float _1334 = _1210 * _1318;
    float _1336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1340 = in.m_45.x;
    float _1342 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1344 = _1218 * _1336;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1348 = 1.0 / _1330;
    float _1350 = _1230 * _1346;
    float _1352 = 0.0;
    int _1354 = as_type<int>(_1342);
    float _1356 = _1338;
    float _1358 = _1326;
    if (!_1306)
    {
        _1352 = _1224;
    }
    float _1360 = _1352;
    float _1362 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1364 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1366 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1368;
    float _1372 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1362);
    float _1374 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1364);
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1378 = _1376 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1380 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1366);
    float _1382 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1372);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1388 = 1.0 / _1378;
    float _1390 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1380);
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1394 = _1370 * _1348;
    float _1396 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1374);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1402 = -_1392;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1406 = 0;
    float _1408 = _1360;
    float _1410 = _1340;
    if (_1300)
    {
        float _1412 = -_1340;
        float _1414 = _1412 + 1.0;
        _1406 = as_type<int>(_1414);
    }
    int _1416 = _1406;
    float _1418 = _1396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1420 = _1390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1422 = _1404 * _1404;
    float _1424 = 1.0 / _1386;
    float _1426 = -_1418;
    float _1428 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = -_1420;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    if (_1306)
    {
        _1408 = _1212;
    }
    float _1434 = _1408;
    float _1436 = fma(_1428, _1428, _1422);
    float _1438 = fma(_1432, _1432, _1436);
    float _1440 = rsqrt(_1438);
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1442;
    float _1446 = _1400 * _1424;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1450 = _1206 + _1448;
    float _1452 = _1444 * _1388;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1456 = _1206 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1460 = _1206 + _1458;
    float _1462 = fma(_1394, _1450, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1464 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1466 = fma(_1446, _1456, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1468 = fma(_1452, _1460, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1470 = fma(_1464, _1276, -0.5);
    float _1472 = _1428 * _1440;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1476 = _1432 * _1440;
    bool _1478 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1480 = isnan(_1206);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1486 = _1482 || _1484;
    float _1488 = float(_1486);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1492 = _1472 * _1490;
    float _1494 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1474);
    float _1496 = _1404 * _1440;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = _1476 * _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1504 = -_1492;
    float _1506 = fma(_1476, _1502, _1504);
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1512 = _1496 * _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1516 = -_1500;
    float _1518 = fma(_1496, _1514, _1516);
    float _1520 = _1506 * _1506;
    bool _1522 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1524 = isnan(_1206);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1536 = -_1512;
    float _1538 = fma(_1472, _1534, _1536);
    float _1540 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1508);
    float _1542 = fma(_1518, _1518, _1520);
    float _1544 = -_1488;
    float _1546 = _1544 + 1.0;
    bool _1548 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_1206);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = -_1532;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1538, _1538, _1542);
    float _1566 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1540);
    float _1568 = _1532 * _1546;
    float _1570 = fma(_1278, _1262, -0.5);
    float _1572 = rsqrt(_1564);
    float _1574 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1576 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1578 = isnan(_1206);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = _1558 * _1562;
    float _1590 = -_1558;
    float _1592 = _1590 + 1.0;
    float _1594 = -_1342;
    float _1596 = fma(_1566, _1470, _1594);
    float _1598 = _1564;
    float _1600 = _1438;
    float _1602 = _1434;
    if (_1234)
    {
        float _1604 = -_1340;
        float _1606 = _1604 + 1.0;
        _1354 = as_type<int>(_1606);
    }
    int _1608 = _1354;
    float _1610 = fma(_1574, _1290, -0.5);
    if (_1306)
    {
        _1284 = _1250;
    }
    float _1612 = _1284;
    float _1614 = _1586 * _1592;
    float _1616 = _1612;
    if (!_1234)
    {
        _1356 = _1340;
    }
    float _1618 = _1356;
    float _1620 = -_1586;
    float _1622 = _1620 + 1.0;
    float _1624 = _1462 * _1614;
    float _1626 = _1618;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (!_1306)
    {
        _1616 = _1224;
    }
    float _1630 = _1616;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1634 = _1518 * _1572;
    float _1636 = _1506 * _1572;
    if (_1234)
    {
        float _1638 = _1316 ? as_type<float>(_1608) : _1340;
        _1626 = _1638;
    }
    float _1640 = _1626;
    float _1642 = _1538 * _1572;
    float _1644 = _1496 * _1634;
    float _1646 = _1476 * _1636;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1650 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1652 = -_1644;
    float _1654 = fma(_1472, _1636, _1652);
    float _1656 = -_1646;
    float _1658 = fma(_1496, _1642, _1656);
    if (_1294)
    {
        float _1660 = -_1340;
        float _1662 = _1660 + 1.0;
        _1628 = as_type<int>(_1662);
    }
    int _1664 = _1628;
    float _1666 = -_1648;
    float _1668 = fma(_1650, 2.0, _1666);
    float _1670 = _1350 * _1654;
    float _1672 = _1350 * _1658;
    if (!_1294)
    {
        _1598 = _1340;
    }
    float _1674 = _1598;
    float _1676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1678 = fma(_1334, _1642, _1670);
    float _1680 = _1674;
    if (_1294)
    {
        float _1682 = _1264 ? as_type<float>(_1664) : _1340;
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = fma(_1334, _1634, _1672);
    float _1688 = fma(_1344, _1476, _1678);
    if (!_1306)
    {
        _1600 = _1212;
    }
    float _1690 = _1600;
    float _1692 = fma(_1344, _1472, _1686);
    float _1694 = _1690;
    if (_1306)
    {
        _1694 = _1250;
    }
    float _1696 = _1694;
    float _1698 = _1420 + _1688;
    float _1700 = _1698;
    if (_1300)
    {
        float _1702 = _1258 ? as_type<float>(_1416) : _1340;
        _1410 = _1702;
    }
    float _1704 = _1410;
    float _1706 = _1418 + _1692;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1712 = _1698 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1716 = _1706 + _1714;
    float _1718 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1708);
    float _1720 = _1712 * _1712;
    float _1722 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1726 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1728 = fma(_1716, _1716, _1720);
    float _1730 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1624);
    float _1732 = -_1256;
    float _1734 = fma(_1722, 2.0, _1732);
    float _1736 = _1472 * _1642;
    float _1738 = sqrt(_1728);
    float _1740 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1724);
    float _1742 = -_1736;
    float _1744 = fma(_1476, _1634, _1742);
    float _1746 = fma(_1466, _1588, _1730);
    float _1748 = _1706;
    if (!_1306)
    {
        _1602 = _1224;
    }
    float _1750 = _1602;
    float _1752 = _1350 * _1744;
    float _1754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1756 = _1750;
    if (_1306)
    {
        _1756 = _1212;
    }
    float _1758 = _1756;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1762 = fma(_1334, _1636, _1752);
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1766 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1760);
    float _1768 = fma(_1344, _1496, _1762);
    bool _1770 = _1738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1774 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1776 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1764);
    float _1778 = _1392 + _1768;
    float _1780 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1782 = fma(_1774, -2.0, _1772);
    if (!_1306)
    {
        _1286 = _1250;
    }
    float _1784 = _1286;
    float _1786 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1788 = -_110;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1326);
    float _1792 = fma(_1780, _1640, -0.5);
    float _1794 = fma(_1726, _1684, -0.5);
    float _1796 = fma(_1786, _1704, -0.5);
    float _1798 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1766);
    if (!_1770)
    {
        _1358 = _1778;
    }
    float _1800 = _1358;
    bool _1802 = !_1770;
    float _1804 = _1800;
    if (!_1802)
    {
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1810 = _1738 + _1808;
        float _1812 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1814 = rsqrt(_1728);
        float _1816 = _1810 * _1806;
        float _1818 = _1816 * 0.15915493667125701904296875;
        float _1820 = _1818 * 6.283185482025146484375;
        float _1822 = sin(_1820);
        float _1824 = _1818 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        float _1828 = fma(_1822, _1812, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1830 = _1814 * _1828;
        float _1832 = _1826 + (-1.0);
        float _1834 = fma(_1716, _1830, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1836 = fma(_1712, _1830, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1838 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = fma(_1778, _1826, _1838);
        _1804 = _1840;
        _1748 = _1834;
        _1700 = _1836;
    }
    float _1842 = _1804;
    float _1844 = _1748;
    float _1846 = _1700;
    float _1848 = -_1392;
    float _1850 = _1848 + _1842;
    float _1852 = fma(_1468, _1568, _1746);
    float _1854 = -_1418;
    float _1856 = _1854 + _1844;
    float _1858 = fma(_1798, _1792, _1790);
    float _1860 = _1850 * _1850;
    float _1862 = -_1420;
    float _1864 = _1862 + _1846;
    float _1866 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1852);
    float _1868 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1870 = fma(_1856, _1856, _1860);
    float _1872 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1874 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1876 = fma(_1864, _1864, _1870);
    float _1878 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1880 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1874);
    float _1882 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1718);
    float _1884 = sqrt(_1876);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1888 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1880);
    float _1890 = -_110;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1734);
    float _1894 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1896 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1900 = fma(_1882, _1794, _1892);
    float _1902 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1894);
    float _1904 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = 1.0 / _1898;
    float _1908 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1902);
    float _1912 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1866 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1916 = fma(_1896, -2.0, _1886);
    bool _1918 = _1884 > 0.0;
    float _1920 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1922 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1776);
    out.m_53.x = _1904;
    out.m_53.y = _1908;
    out.m_53.z = _1912;
    out.m_53.w = _1914;
    float _1924 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1494);
    float _1926 = -_110;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1668);
    float _1930 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1740);
    float _1932 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1782);
    float _1934 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1916);
    bool _1936 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1938 = isnan(0.5);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1944 = _1940 || _1942;
    float _1946 = fma(_1922, _1796, _1928);
    bool _1948 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1950 = isnan(0.5);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1956 = _1952 || _1954;
    float _1958 = -_1932;
    float _1960 = fma(_1930, _1610, _1958);
    float _1962 = -_1934;
    float _1964 = fma(_1924, _1570, _1962);
    float _1966 = _1920 + _1898;
    float _1968 = _1966 * _1906;
    float _1970 = _1968 * 0.5;
    bool _1972 = !_1918;
    float _1974 = _1844;
    float _1976 = _1842;
    float _1978 = _1846;
    float _1980 = _1912;
    float _1982 = _1914;
    float _1984 = _1908;
    float _1986 = _1934;
    if (!_1972)
    {
        float _1988 = _154 * _154;
        float _1990 = rsqrt(_1876);
        float _1992 = fma(_152, _152, _1988);
        float _1994 = fma(_156, _156, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = _1856 * _1990;
        float _2000 = _1850 * _1990;
        float _2002 = _1864 * _1990;
        bool _2004 = _1996 > 0.0;
        bool _2006 = !_2004;
        _1980 = _1994;
        _1982 = _1996;
        _1984 = _1990;
        _1986 = _2000;
        if (!_2006)
        {
            float _2008 = rsqrt(_1994);
            float _2010 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2012 = _154 * _2008;
            float _2014 = _152 * _2008;
            float _2016 = _2000 * _2012;
            float _2018 = _156 * _2008;
            float _2020 = fma(_1998, _2014, _2016);
            float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2024 = fma(_2002, _2018, _2020);
            float _2026 = _2024 * _2022;
            float _2028 = fma(_152, _2026, _1844);
            float _2030 = fma(_154, _2026, _1842);
            float _2032 = fma(_156, _2026, _1846);
            _1974 = _2028;
            _1976 = _2030;
            _1978 = _2032;
            _1980 = _2008;
            _1982 = _2024;
            _1984 = _2014;
            _1986 = _2020;
        }
    }
    float _2034 = _1974;
    float _2036 = _1976;
    float _2038 = _1978;
    float _2040 = _1980;
    float _2042 = _1982;
    float _2044 = _1984;
    float _2046 = _1986;
    float _2048 = _2042;
    float _2050 = _2040;
    float _2052 = _2044;
    float _2054 = _2046;
    if (_1944)
    {
        _2048 = _2034;
    }
    float _2056 = _2048;
    float _2058 = _2056;
    if (_1944)
    {
        _2050 = _2036;
    }
    float _2060 = _2050;
    float _2062 = _2060;
    if (_1944)
    {
        _2052 = _2038;
    }
    float _2064 = _2052;
    float _2066 = _2064;
    if (!_1944)
    {
        float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2070 = _1392 + _2068;
        float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2074 = _1418 + _2072;
        float _2076 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2078 = -_1392;
        float _2080 = _2078 + _2036;
        float _2082 = _2070 * _2070;
        float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2086 = _1420 + _2084;
        float _2088 = -_1420;
        float _2090 = _2088 + _2038;
        float _2092 = fma(_2074, _2074, _2082);
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2096 = fma(_2086, _2086, _2092);
        float _2098 = sqrt(_2096);
        float _2100 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2102 = precise::min(_2098, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2104 = _2102 * _2094;
        float _2106 = -_1418;
        float _2108 = _2106 + _2034;
        float _2110 = _2100 * _2104;
        float _2112 = fma(_2108, _2110, _1418);
        float _2114 = fma(_2080, _2110, _1392);
        float _2116 = fma(_2090, _2110, _1420);
        _2062 = _2114;
        _2058 = _2112;
        _2066 = _2116;
        _2054 = _2094;
    }
    float _2118 = _2062;
    float _2120 = _2058;
    float _2122 = _2066;
    float _2124 = _2054;
    float _2126 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = _2124;
    if (_1956)
    {
        _2128 = 1.0;
    }
    float _2130 = _2128;
    float _2132 = _2130;
    if (!_1956)
    {
        float _2134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2138 = _2134 * 0.15915493667125701904296875;
        float _2140 = _2136 * 0.15915493667125701904296875;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2144 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2142);
        float _2146 = _2138 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2138 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = 1.0 / _2148;
        float _2156 = _2140 * 6.283185482025146484375;
        float _2158 = cos(_2156);
        float _2160 = _2152 * _2154;
        float _2162 = _2140 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2166;
        float _2170 = _2158 * _2160;
        float _2172 = 1.0 / _2144;
        float _2174 = 1.0 / _2170;
        float _2176 = 1.0 / _2168;
        float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2180 = _2172 * _2178;
        float _2182 = _2164 * _2174;
        float _2184 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2186 = fma(_2182, _2180, _2184);
        float _2188 = _2186 * _2176;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        _2132 = _2190;
    }
    float _2192 = _2132;
    float _2194 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2196 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2198 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2200 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2202 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2194);
    float _2204 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2196);
    float _2206 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2198);
    float _2208 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2200);
    float _2210 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2202);
    float _2212 = _2204 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2214 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2206);
    float _2216 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2208);
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2220 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2224 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2228 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2230 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2220);
    float _2232 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2222);
    float _2234 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2224);
    float _2236 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2226);
    float _2238 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2230);
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2232);
    float _2244 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2234);
    float _2246 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2236);
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2240);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2242);
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2244);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2246);
    bool _2256 = _2192 > 0.0;
    bool _2258 = isnan(_2192);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan(0.0);
    bool _2264 = _2260 || _2262;
    float _2266 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2268 = _1596 + 0.5;
    float _2270 = _2252 + _2254;
    float _2272 = _1946 + 0.5;
    float _2274 = _2266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2276 = _1858 + 0.5;
    float _2278 = _1900 + 0.5;
    float _2280 = _1960 + 0.5;
    float _2282 = _1964 + 0.5;
    float _2284 = _2270 * 0.5;
    out.m_33.x = _2274;
    out.m_55.x = _2276;
    out.m_55.y = _2268;
    out.m_55.z = _2278;
    out.m_55.w = _2280;
    out.m_57.x = _2272;
    out.m_57.y = _2282;
    out.gl_Position.x = _2250;
    out.gl_Position.y = _2248;
    out.gl_Position.z = _2252;
    out.gl_Position.w = _2254;
    out.m_59.z = _2284;
    out.m_59.w = _2254;
    if (_2264)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2286;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1198 = false;
    bool _760 = false;
    bool _580 = false;
    bool _400 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _73 = in.m_30.w;
    float _75 = trunc(_73);
    int _78 = int(_75);
    bool _82 = _78 >= 1;
    float _84 = 0.0;
    if (!_82)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _86 = _84;
    float _88 = _86;
    if (!_82)
    {
        out.m_33.x = 0.0;
    }
    int _90 = 0;
    if (!_82)
    {
        float _92 = _86 * 5.0;
        _90 = as_type<int>(_92);
    }
    int _94 = _90;
    if (!_82)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2342 = as_type<float>(_94);
        out.gl_Position.z = _2342;
    }
    if (!_82)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _96 = in.m_35.w;
    bool _98 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _100 = isnan(_96);
    bool _102 = _98 || _100;
    bool _104 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _106 = _102 || _104;
    float _108 = -_96;
    float _110 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_106)
    {
        float _112 = float(_78);
        _88 = _112;
    }
    float _114 = _88;
    bool _116 = _110 >= _114;
    bool _118 = !_106;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_33.x = 0.0;
    }
    int _126 = 0;
    if (_120)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_130);
        out.gl_Position.z = _2411;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_37.x;
    float _134 = in.m_37.y;
    float _136 = in.m_37.z;
    bool _138 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _140 = _134 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _142 = _134 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _144 = _134 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _146 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[4].x, _140);
    float _148 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[5].x, _142);
    float _150 = fma(_132, (*spvDescriptorSet0.vp_c10)._m0[6].x, _144);
    float _152 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[4].z, _146);
    float _154 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[5].z, _148);
    float _156 = fma(_136, (*spvDescriptorSet0.vp_c10)._m0[6].z, _150);
    bool _158 = !_138;
    float _176;
    if (!_158)
    {
        float _160 = in.m_39.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _110);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_78);
        float _182 = 1.0 / _180;
        float _184 = _110 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = _186 + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _194 = _186 + _192;
    bool _196 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _198 = isnan(_186);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _186 + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = 1.0 / _210;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _228 = 1.0 / _222;
    float _230 = 1.0 / _218;
    float _232 = _190 * _224;
    bool _234 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = isnan(_186);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_206;
    float _248 = _246 + 1.0;
    float _250 = _244 * _248;
    float _252 = _194 * _228;
    bool _254 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_186);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _272 = isnan(_186);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _286 = -_244;
    float _288 = _286 + 1.0;
    float _290 = -_264;
    float _292 = _290 + 1.0;
    float _294 = _214 * _230;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _300;
    float _304 = _280 * _292;
    float _306 = fma(_268, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _308 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _310 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = _264 * _288;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = _308 * _304;
    float _320 = _310 * _304;
    float _322 = _306 * _304;
    float _324 = -_280;
    float _326 = _324 + 1.0;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _332 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].x, _320);
    float _334 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].y, _318);
    float _336 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[143].z, _322);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _338;
    float _342 = fma(_284, _252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _344 = fma(_330, _252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _346 = fma(_316, _252, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _352;
    float _356 = fma(_342, _312, _332);
    float _358 = fma(_340, _232, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _360 = fma(_350, _232, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _362 = fma(_354, _232, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _364 = fma(_344, _312, _334);
    float _366 = fma(_346, _312, _336);
    float _368 = fma(_358, _250, _356);
    float _370 = fma(_360, _250, _364);
    float _372 = fma(_362, _250, _366);
    float _374 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].x, _368);
    float _376 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].y, _370);
    float _378 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[146].z, _372);
    bool _380 = !_226;
    float _398;
    if (!_380)
    {
        float _382 = in.m_39.x;
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _386 = _382 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[11].x, _110);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_78);
        float _404 = 1.0 / _402;
        float _406 = _110 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = in.m_41.x;
    float _412 = in.m_41.y;
    float _414 = in.m_41.z;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _418 = _408 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _420;
    bool _424 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _426 = 1.0 / _422;
    float _428 = _376 * _412;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _434 = _418 * _426;
    bool _436 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _438 = isnan(_408);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = _378 * _414;
    float _450 = 1.0 / _432;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _454 = _408 + _452;
    bool _456 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_446;
    float _470 = _468 + 1.0;
    bool _472 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_408);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _482 * _470;
    float _486 = -_482;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _490;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _466 * _488;
    float _504 = fma(_492, _434, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _506 = fma(_496, _434, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = fma(_500, _434, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _510 = _454 * _450;
    float _512 = _504 * _502;
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_466;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _536 = fma(_524, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _512);
    float _540 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _514);
    float _544 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _546 = fma(_534, _484, _538);
    float _548 = fma(_536, _484, _542);
    float _550 = fma(_540, _484, _544);
    float _552 = _374 * _410;
    float _554 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _556 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _558 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    bool _560 = !_424;
    float _578;
    if (!_560)
    {
        float _562 = in.m_39.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _110);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_78);
        float _584 = 1.0 / _582;
        float _586 = _110 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _588 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _602 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _604 = isnan(_588);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _618 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _620 = isnan(_588);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = 1.0 / _596;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    float _636 = -_612;
    float _638 = _636 + 1.0;
    bool _640 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _642 = isnan(_588);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = 1.0 / _600;
    float _656 = 1.0 / _616;
    float _658 = _634 * _630;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _664 = _628 * _638;
    float _666 = -_628;
    float _668 = _666 + 1.0;
    float _670 = fma(_658, _592, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _672;
    float _676 = _650 * _668;
    float _678 = _662 * _654;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _682 = _588 + _680;
    bool _684 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _686 = isnan(_588);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = _670 * _676;
    float _698 = -_650;
    float _700 = _698 + 1.0;
    float _702 = fma(_678, _682, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _706 = _588 + _704;
    float _708 = _674 * _656;
    float _710 = -_694;
    float _712 = _710 + 1.0;
    float _714 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[115].x, _696);
    float _716 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _718 = fma(_708, _706, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _720 = _612 * _712;
    float _722 = fma(_702, _664, _714);
    float _724 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _726 = fma(_718, _720, _722);
    float _728 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[118].x, _726);
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _738 = _732 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _724;
    out.m_43.y = _734;
    out.m_43.z = _736;
    out.m_43.w = _738;
    bool _740 = !_652;
    float _758;
    if (!_740)
    {
        float _742 = in.m_39.x;
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _746 = _742 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _748 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[11].z, _110);
        float _750 = _748 * _744;
        float _752 = floor(_750);
        float _754 = -_752;
        float _756 = _750 + _754;
        _758 = _756;
        _760 = true;
    }
    else
    {
        float _762 = float(_78);
        float _764 = 1.0 / _762;
        float _766 = _110 * _764;
        _758 = _766;
    }
    _760 = false;
    float _768 = _758;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _772 = _768 + _770;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _786;
    float _790 = 1.0 / _780;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _800;
    float _804 = 1.0 / _776;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _808 = _768 + _806;
    bool _810 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _812 = isnan(_768);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    bool _822 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _824 = isnan(_768);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _784;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _838 = _768 + _836;
    float _840 = _808 * _790;
    bool _842 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _844 = isnan(_768);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -_820;
    float _856 = _854 + 1.0;
    bool _858 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _860 = isnan(_768);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _794;
    float _872 = _838 * _804;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _876 = _768 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _880 = _768 + _878;
    float _882 = -_852;
    float _884 = _882 + 1.0;
    float _886 = 1.0 / _798;
    float _888 = _772 * _834;
    bool _890 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _892 = isnan(_768);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _902;
    float _906 = _868 * _884;
    bool _908 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _910 = 1.0 / _802;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _914 = _768 + _912;
    float _916 = _914 * _870;
    float _918 = -_868;
    float _920 = _918 + 1.0;
    float _922 = 1.0 / _788;
    float _924 = _876 * _886;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _930;
    float _934 = _900 * _920;
    float _936 = fma(_932, _872, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _938 = _880 * _910;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _942 = _768 + _940;
    float _944 = -_900;
    float _946 = _944 + 1.0;
    float _948 = fma(_904, _872, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _950 = _832 * _856;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _952;
    float _956 = _820 * _946;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _962 = _942 * _922;
    float _964 = fma(_928, _872, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _970 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _972 = isnan(_768);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = -_832;
    float _984 = _982 + 1.0;
    bool _986 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _988 = isnan(_768);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = fma(_968, _840, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1000 = fma(_960, _840, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1002 = _768 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_768);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1018 = _980 * _984;
    float _1020 = -_980;
    float _1022 = _1020 + 1.0;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1024;
    float _1028 = fma(_1016, _840, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1030 = _1012 * _1022;
    float _1032 = -_1012;
    float _1034 = _1032 + 1.0;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1036;
    float _1040 = fma(_1026, _888, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1042 = _996 * _1034;
    float _1044 = -_996;
    float _1046 = _1044 + 1.0;
    float _1048 = fma(_1038, _888, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1050 = fma(_954, _888, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1052 = _948 * _1042;
    float _1054 = _936 * _1042;
    float _1056 = _964 * _1042;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1070 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1052);
    float _1072 = fma(_1060, _924, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1074 = fma(_1064, _924, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1076 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1054);
    float _1078 = fma(_1068, _924, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1080 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1056);
    float _1082 = fma(_998, _1030, _1070);
    float _1084 = fma(_1000, _1030, _1080);
    float _1086 = fma(_1028, _1030, _1076);
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1088;
    float _1092 = fma(_1048, _1018, _1082);
    float _1094 = fma(_1050, _1018, _1084);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1096;
    float _1100 = fma(_1040, _1018, _1086);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1114;
    float _1118 = fma(_1090, _962, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1120 = fma(_1072, _950, _1092);
    float _1122 = fma(_1098, _962, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1124 = fma(_1104, _916, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1126 = fma(_1108, _916, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1128 = fma(_1112, _916, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1130 = fma(_1074, _950, _1100);
    float _1132 = fma(_1078, _950, _1094);
    float _1134 = fma(_1116, _962, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1136 = fma(_1118, _956, _1120);
    float _1138 = fma(_1122, _956, _1130);
    float _1140 = fma(_1134, _956, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1142;
    float _1146 = fma(_1124, _934, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1148;
    float _1152 = fma(_1126, _934, _1138);
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1154;
    float _1158 = fma(_1144, _938, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1160 = fma(_1150, _938, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1162 = fma(_1128, _934, _1140);
    float _1164 = fma(_1156, _938, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1166 = fma(_1158, _906, _1146);
    float _1168 = fma(_1160, _906, _1152);
    float _1170 = fma(_1164, _906, _1162);
    float _1172 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1166);
    float _1174 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1168);
    float _1176 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1170);
    bool _1178 = !_908;
    float _1196;
    if (!_1178)
    {
        float _1180 = in.m_39.x;
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1184 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[11].w, _110);
        float _1188 = _1186 * _1182;
        float _1190 = floor(_1188);
        float _1192 = -_1190;
        float _1194 = _1188 + _1192;
        _1196 = _1194;
        _1198 = true;
    }
    else
    {
        float _1200 = float(_78);
        float _1202 = 1.0 / _1200;
        float _1204 = _110 * _1202;
        _1196 = _1204;
    }
    _1198 = false;
    float _1206 = _1196;
    float _1208 = in.m_45.y;
    float _1210 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1212 = in.m_39.y;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1216 = _1214 != 0;
    float _1218 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1222 = _1220 != 0;
    float _1224 = in.m_39.z;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1228 = _1226 != 0;
    float _1230 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1234 = _1232 != 0;
    float _1236 = in.m_39.w;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1240 = in.m_47.x;
    float _1242 = in.m_49.x;
    float _1244 = in.m_49.y;
    float _1246 = in.m_49.z;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1250 = in.m_39.x;
    float _1252 = -_1208;
    float _1254 = _1252 + 1.0;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1258 = _1212 > 0.5;
    float _1260 = in.m_47.y;
    float _1262 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1264 = _1224 > 0.5;
    float _1266 = in.m_47.w;
    int _1268 = _1258 ? as_type<int>(_1254) : as_type<int>(_1208);
    bool _1270 = _1236 > 0.5;
    float _1272 = in.m_47.z;
    int _1274 = _1264 ? as_type<int>(_1254) : as_type<int>(_1208);
    out.m_51.x = _1240;
    float _1276 = _1222 ? as_type<float>(_1268) : _1208;
    float _1278 = _1228 ? as_type<float>(_1274) : _1208;
    float _1280 = _1208;
    bool _1282 = _1216;
    float _1284 = _1206;
    float _1286 = _1212;
    if (_1216)
    {
        float _1288 = _1270 ? _1254 : _1208;
        _1280 = _1288;
    }
    float _1290 = _1280;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1294 = _1292 != 0;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1300 = _1298 != 0;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1306 = _1304 != 0;
    out.m_51.y = _1260;
    float _1308 = in.m_30.x;
    float _1310 = in.m_30.y;
    float _1312 = in.m_30.z;
    if (_1234)
    {
        bool _1314 = _1250 > 0.5;
        _1282 = _1314;
    }
    bool _1316 = _1282;
    float _1318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1320 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_51.w = _1266;
    float _1322 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1324 = -_1296;
    float _1326 = fma(_1320, 2.0, _1324);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    out.m_51.z = _1272;
    float _1332 = fma(_1322, -2.0, _1302);
    float _1334 = _1210 * _1318;
    float _1336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1340 = in.m_45.x;
    float _1342 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1344 = _1218 * _1336;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1348 = 1.0 / _1330;
    float _1350 = _1230 * _1346;
    float _1352 = 0.0;
    int _1354 = as_type<int>(_1342);
    float _1356 = _1338;
    float _1358 = _1326;
    if (!_1306)
    {
        _1352 = _1224;
    }
    float _1360 = _1352;
    float _1362 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1364 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1366 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1368;
    float _1372 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1362);
    float _1374 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1364);
    float _1376 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1378 = _1376 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1380 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1366);
    float _1382 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1372);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1388 = 1.0 / _1378;
    float _1390 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1380);
    float _1392 = _1382 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1394 = _1370 * _1348;
    float _1396 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1374);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1402 = -_1392;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _1406 = 0;
    float _1408 = _1360;
    float _1410 = _1340;
    if (_1300)
    {
        float _1412 = -_1340;
        float _1414 = _1412 + 1.0;
        _1406 = as_type<int>(_1414);
    }
    int _1416 = _1406;
    float _1418 = _1396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1420 = _1390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1422 = _1404 * _1404;
    float _1424 = 1.0 / _1386;
    float _1426 = -_1418;
    float _1428 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = -_1420;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    if (_1306)
    {
        _1408 = _1212;
    }
    float _1434 = _1408;
    float _1436 = fma(_1428, _1428, _1422);
    float _1438 = fma(_1432, _1432, _1436);
    float _1440 = rsqrt(_1438);
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1442;
    float _1446 = _1400 * _1424;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1450 = _1206 + _1448;
    float _1452 = _1444 * _1388;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1456 = _1206 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1460 = _1206 + _1458;
    float _1462 = fma(_1394, _1450, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1464 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1466 = fma(_1446, _1456, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1468 = fma(_1452, _1460, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1470 = fma(_1464, _1276, -0.5);
    float _1472 = _1428 * _1440;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1476 = _1432 * _1440;
    bool _1478 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1480 = isnan(_1206);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1486 = _1482 || _1484;
    float _1488 = float(_1486);
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1492 = _1472 * _1490;
    float _1494 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1474);
    float _1496 = _1404 * _1440;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = _1476 * _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1504 = -_1492;
    float _1506 = fma(_1476, _1502, _1504);
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1512 = _1496 * _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1516 = -_1500;
    float _1518 = fma(_1496, _1514, _1516);
    float _1520 = _1506 * _1506;
    bool _1522 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1524 = isnan(_1206);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1536 = -_1512;
    float _1538 = fma(_1472, _1534, _1536);
    float _1540 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1508);
    float _1542 = fma(_1518, _1518, _1520);
    float _1544 = -_1488;
    float _1546 = _1544 + 1.0;
    bool _1548 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1550 = isnan(_1206);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = -_1532;
    float _1562 = _1560 + 1.0;
    float _1564 = fma(_1538, _1538, _1542);
    float _1566 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1540);
    float _1568 = _1532 * _1546;
    float _1570 = fma(_1278, _1262, -0.5);
    float _1572 = rsqrt(_1564);
    float _1574 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1576 = _1206 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1578 = isnan(_1206);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = _1558 * _1562;
    float _1590 = -_1558;
    float _1592 = _1590 + 1.0;
    float _1594 = -_1342;
    float _1596 = fma(_1566, _1470, _1594);
    float _1598 = _1564;
    float _1600 = _1438;
    float _1602 = _1434;
    if (_1234)
    {
        float _1604 = -_1340;
        float _1606 = _1604 + 1.0;
        _1354 = as_type<int>(_1606);
    }
    int _1608 = _1354;
    float _1610 = fma(_1574, _1290, -0.5);
    if (_1306)
    {
        _1284 = _1250;
    }
    float _1612 = _1284;
    float _1614 = _1586 * _1592;
    float _1616 = _1612;
    if (!_1234)
    {
        _1356 = _1340;
    }
    float _1618 = _1356;
    float _1620 = -_1586;
    float _1622 = _1620 + 1.0;
    float _1624 = _1462 * _1614;
    float _1626 = _1618;
    int _1628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    if (!_1306)
    {
        _1616 = _1224;
    }
    float _1630 = _1616;
    float _1632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1634 = _1518 * _1572;
    float _1636 = _1506 * _1572;
    if (_1234)
    {
        float _1638 = _1316 ? as_type<float>(_1608) : _1340;
        _1626 = _1638;
    }
    float _1640 = _1626;
    float _1642 = _1538 * _1572;
    float _1644 = _1496 * _1634;
    float _1646 = _1476 * _1636;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1650 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1652 = -_1644;
    float _1654 = fma(_1472, _1636, _1652);
    float _1656 = -_1646;
    float _1658 = fma(_1496, _1642, _1656);
    if (_1294)
    {
        float _1660 = -_1340;
        float _1662 = _1660 + 1.0;
        _1628 = as_type<int>(_1662);
    }
    int _1664 = _1628;
    float _1666 = -_1648;
    float _1668 = fma(_1650, 2.0, _1666);
    float _1670 = _1350 * _1654;
    float _1672 = _1350 * _1658;
    if (!_1294)
    {
        _1598 = _1340;
    }
    float _1674 = _1598;
    float _1676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1678 = fma(_1334, _1642, _1670);
    float _1680 = _1674;
    if (_1294)
    {
        float _1682 = _1264 ? as_type<float>(_1664) : _1340;
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = fma(_1334, _1634, _1672);
    float _1688 = fma(_1344, _1476, _1678);
    if (!_1306)
    {
        _1600 = _1212;
    }
    float _1690 = _1600;
    float _1692 = fma(_1344, _1472, _1686);
    float _1694 = _1690;
    if (_1306)
    {
        _1694 = _1250;
    }
    float _1696 = _1694;
    float _1698 = _1420 + _1688;
    float _1700 = _1698;
    if (_1300)
    {
        float _1702 = _1258 ? as_type<float>(_1416) : _1340;
        _1410 = _1702;
    }
    float _1704 = _1410;
    float _1706 = _1418 + _1692;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1712 = _1698 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1716 = _1706 + _1714;
    float _1718 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1708);
    float _1720 = _1712 * _1712;
    float _1722 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1726 = _1632 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1728 = fma(_1716, _1716, _1720);
    float _1730 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1624);
    float _1732 = -_1256;
    float _1734 = fma(_1722, 2.0, _1732);
    float _1736 = _1472 * _1642;
    float _1738 = sqrt(_1728);
    float _1740 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1724);
    float _1742 = -_1736;
    float _1744 = fma(_1476, _1634, _1742);
    float _1746 = fma(_1466, _1588, _1730);
    float _1748 = _1706;
    if (!_1306)
    {
        _1602 = _1224;
    }
    float _1750 = _1602;
    float _1752 = _1350 * _1744;
    float _1754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1756 = _1750;
    if (_1306)
    {
        _1756 = _1212;
    }
    float _1758 = _1756;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1762 = fma(_1334, _1636, _1752);
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1766 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1760);
    float _1768 = fma(_1344, _1496, _1762);
    bool _1770 = _1738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1774 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1776 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1764);
    float _1778 = _1392 + _1768;
    float _1780 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1782 = fma(_1774, -2.0, _1772);
    if (!_1306)
    {
        _1286 = _1250;
    }
    float _1784 = _1286;
    float _1786 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1788 = -_110;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1326);
    float _1792 = fma(_1780, _1640, -0.5);
    float _1794 = fma(_1726, _1684, -0.5);
    float _1796 = fma(_1786, _1704, -0.5);
    float _1798 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1766);
    if (!_1770)
    {
        _1358 = _1778;
    }
    float _1800 = _1358;
    bool _1802 = !_1770;
    float _1804 = _1800;
    if (!_1802)
    {
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1808 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1810 = _1738 + _1808;
        float _1812 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1814 = rsqrt(_1728);
        float _1816 = _1810 * _1806;
        float _1818 = _1816 * 0.15915493667125701904296875;
        float _1820 = _1818 * 6.283185482025146484375;
        float _1822 = sin(_1820);
        float _1824 = _1818 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        float _1828 = fma(_1822, _1812, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1830 = _1814 * _1828;
        float _1832 = _1826 + (-1.0);
        float _1834 = fma(_1716, _1830, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1836 = fma(_1712, _1830, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1838 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = fma(_1778, _1826, _1838);
        _1804 = _1840;
        _1748 = _1834;
        _1700 = _1836;
    }
    float _1842 = _1804;
    float _1844 = _1748;
    float _1846 = _1700;
    float _1848 = -_1392;
    float _1850 = _1848 + _1842;
    float _1852 = fma(_1468, _1568, _1746);
    float _1854 = -_1418;
    float _1856 = _1854 + _1844;
    float _1858 = fma(_1798, _1792, _1790);
    float _1860 = _1850 * _1850;
    float _1862 = -_1420;
    float _1864 = _1862 + _1846;
    float _1866 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1852);
    float _1868 = _1174 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1870 = fma(_1856, _1856, _1860);
    float _1872 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1874 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1876 = fma(_1864, _1864, _1870);
    float _1878 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1880 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1874);
    float _1882 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1718);
    float _1884 = sqrt(_1876);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1888 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1880);
    float _1890 = -_110;
    float _1892 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1734);
    float _1894 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1896 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1900 = fma(_1882, _1794, _1892);
    float _1902 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1894);
    float _1904 = _1872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1906 = 1.0 / _1898;
    float _1908 = _1868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1902);
    float _1912 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1866 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1916 = fma(_1896, -2.0, _1886);
    bool _1918 = _1884 > 0.0;
    float _1920 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1922 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1776);
    out.m_53.x = _1904;
    out.m_53.y = _1908;
    out.m_53.z = _1912;
    out.m_53.w = _1914;
    float _1924 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1494);
    float _1926 = -_110;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1668);
    float _1930 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1740);
    float _1932 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1782);
    float _1934 = fma(_110, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1916);
    bool _1936 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1938 = isnan(0.5);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1944 = _1940 || _1942;
    float _1946 = fma(_1922, _1796, _1928);
    bool _1948 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1950 = isnan(0.5);
    bool _1952 = _1948 || _1950;
    bool _1954 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1956 = _1952 || _1954;
    float _1958 = -_1932;
    float _1960 = fma(_1930, _1610, _1958);
    float _1962 = -_1934;
    float _1964 = fma(_1924, _1570, _1962);
    float _1966 = _1920 + _1898;
    float _1968 = _1966 * _1906;
    float _1970 = _1968 * 0.5;
    bool _1972 = !_1918;
    float _1974 = _1844;
    float _1976 = _1842;
    float _1978 = _1846;
    float _1980 = _1912;
    float _1982 = _1914;
    float _1984 = _1908;
    float _1986 = _1934;
    if (!_1972)
    {
        float _1988 = _154 * _154;
        float _1990 = rsqrt(_1876);
        float _1992 = fma(_152, _152, _1988);
        float _1994 = fma(_156, _156, _1992);
        float _1996 = sqrt(_1994);
        float _1998 = _1856 * _1990;
        float _2000 = _1850 * _1990;
        float _2002 = _1864 * _1990;
        bool _2004 = _1996 > 0.0;
        bool _2006 = !_2004;
        _1980 = _1994;
        _1982 = _1996;
        _1984 = _1990;
        _1986 = _2000;
        if (!_2006)
        {
            float _2008 = rsqrt(_1994);
            float _2010 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2012 = _154 * _2008;
            float _2014 = _152 * _2008;
            float _2016 = _2000 * _2012;
            float _2018 = _156 * _2008;
            float _2020 = fma(_1998, _2014, _2016);
            float _2022 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2024 = fma(_2002, _2018, _2020);
            float _2026 = _2024 * _2022;
            float _2028 = fma(_152, _2026, _1844);
            float _2030 = fma(_154, _2026, _1842);
            float _2032 = fma(_156, _2026, _1846);
            _1974 = _2028;
            _1976 = _2030;
            _1978 = _2032;
            _1980 = _2008;
            _1982 = _2024;
            _1984 = _2014;
            _1986 = _2020;
        }
    }
    float _2034 = _1974;
    float _2036 = _1976;
    float _2038 = _1978;
    float _2040 = _1980;
    float _2042 = _1982;
    float _2044 = _1984;
    float _2046 = _1986;
    float _2048 = _2042;
    float _2050 = _2040;
    float _2052 = _2044;
    float _2054 = _2046;
    if (_1944)
    {
        _2048 = _2034;
    }
    float _2056 = _2048;
    float _2058 = _2056;
    if (_1944)
    {
        _2050 = _2036;
    }
    float _2060 = _2050;
    float _2062 = _2060;
    if (_1944)
    {
        _2052 = _2038;
    }
    float _2064 = _2052;
    float _2066 = _2064;
    if (!_1944)
    {
        float _2068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2070 = _1392 + _2068;
        float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2074 = _1418 + _2072;
        float _2076 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2078 = -_1392;
        float _2080 = _2078 + _2036;
        float _2082 = _2070 * _2070;
        float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2086 = _1420 + _2084;
        float _2088 = -_1420;
        float _2090 = _2088 + _2038;
        float _2092 = fma(_2074, _2074, _2082);
        float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2096 = fma(_2086, _2086, _2092);
        float _2098 = sqrt(_2096);
        float _2100 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2102 = precise::min(_2098, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2104 = _2102 * _2094;
        float _2106 = -_1418;
        float _2108 = _2106 + _2034;
        float _2110 = _2100 * _2104;
        float _2112 = fma(_2108, _2110, _1418);
        float _2114 = fma(_2080, _2110, _1392);
        float _2116 = fma(_2090, _2110, _1420);
        _2062 = _2114;
        _2058 = _2112;
        _2066 = _2116;
        _2054 = _2094;
    }
    float _2118 = _2062;
    float _2120 = _2058;
    float _2122 = _2066;
    float _2124 = _2054;
    float _2126 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = _2124;
    if (_1956)
    {
        _2128 = 1.0;
    }
    float _2130 = _2128;
    float _2132 = _2130;
    if (!_1956)
    {
        float _2134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2136 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2138 = _2134 * 0.15915493667125701904296875;
        float _2140 = _2136 * 0.15915493667125701904296875;
        float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2144 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2142);
        float _2146 = _2138 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2138 * 6.283185482025146484375;
        float _2152 = sin(_2150);
        float _2154 = 1.0 / _2148;
        float _2156 = _2140 * 6.283185482025146484375;
        float _2158 = cos(_2156);
        float _2160 = _2152 * _2154;
        float _2162 = _2140 * 6.283185482025146484375;
        float _2164 = sin(_2162);
        float _2166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2166;
        float _2170 = _2158 * _2160;
        float _2172 = 1.0 / _2144;
        float _2174 = 1.0 / _2170;
        float _2176 = 1.0 / _2168;
        float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2180 = _2172 * _2178;
        float _2182 = _2164 * _2174;
        float _2184 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2186 = fma(_2182, _2180, _2184);
        float _2188 = _2186 * _2176;
        float _2190 = precise::clamp(_2188, 0.0, 1.0);
        _2132 = _2190;
    }
    float _2192 = _2132;
    float _2194 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2196 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2198 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2200 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2202 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2194);
    float _2204 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2196);
    float _2206 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2198);
    float _2208 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2200);
    float _2210 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2202);
    float _2212 = _2204 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2214 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2206);
    float _2216 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2208);
    float _2218 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2220 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2224 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2228 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2230 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2220);
    float _2232 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2222);
    float _2234 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2224);
    float _2236 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2226);
    float _2238 = _2216 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2230);
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2232);
    float _2244 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2234);
    float _2246 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2236);
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2240);
    float _2250 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2242);
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2244);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2246);
    bool _2256 = _2192 > 0.0;
    bool _2258 = isnan(_2192);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan(0.0);
    bool _2264 = _2260 || _2262;
    float _2266 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2268 = _1596 + 0.5;
    float _2270 = _2252 + _2254;
    float _2272 = _1946 + 0.5;
    float _2274 = _2266 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2276 = _1858 + 0.5;
    float _2278 = _1900 + 0.5;
    float _2280 = _1960 + 0.5;
    float _2282 = _1964 + 0.5;
    float _2284 = _2270 * 0.5;
    out.m_33.x = _2274;
    out.m_55.x = _2276;
    out.m_55.y = _2268;
    out.m_55.z = _2278;
    out.m_55.w = _2280;
    out.m_57.x = _2272;
    out.m_57.y = _2282;
    out.gl_Position.x = _2250;
    out.gl_Position.y = _2248;
    out.gl_Position.z = _2252;
    out.gl_Position.w = _2254;
    out.m_59.z = _2284;
    out.m_59.w = _2254;
    if (_2264)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2286;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

