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
    float4 m_41 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_43 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_47 [[attribute(9)]];
    float4 m_45 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _702 = false;
    bool _510 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1841 = as_type<float>(_90);
        out.gl_Position.z = _1841;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _84 = _110;
    }
    float _112 = _84;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1910 = as_type<float>(_126);
        out.gl_Position.z = _1910;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_37.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _136 = _134 != 0;
    int _138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _140 = _138 != 0;
    int _142 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _144 = _142 != 0;
    float _146 = _132 * _130;
    float _148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _146);
    float _150 = _148 * 6.283185482025146484375;
    float _152 = floor(_148);
    float _154 = _150 * 0.15915493667125701904296875;
    bool _156 = !_136;
    int _158 = _156 ? 0 : 1;
    int _160 = abs(_158);
    float _162 = _154 * 6.283185482025146484375;
    float _164 = cos(_162);
    bool _166 = !_144;
    int _168 = _166 ? 0 : 1;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _172 = abs(_168);
    float _174 = -_152;
    float _176 = _148 + _174;
    bool _178 = !_140;
    int _180 = _178 ? 0 : 1;
    float _182 = -_176;
    float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _186 = float(_160);
    int _188 = abs(_180);
    float _190 = fma(_164, 0.5, 0.5);
    bool _192 = _176 < 0.5;
    float _194 = float(_192);
    float _196 = abs(_184);
    float _198 = _186 * _196;
    float _200 = -_190;
    float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _204 = float(_172);
    float _206 = -_194;
    float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _210 = float(_188);
    float _212 = fma(_204, _202, _198);
    float _214 = abs(_208);
    float _216 = fma(_210, _214, _212);
    bool _218 = !_170;
    float _234;
    if (!_218)
    {
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_74);
        float _240 = 1.0 / _238;
        float _242 = _108 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _244 + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _274 = 1.0 / _260;
    float _276 = 1.0 / _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _244 + _278;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _284 = 1.0 / _264;
    float _286 = _248 * _274;
    bool _288 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_244);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_244);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_244);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _268;
    float _326 = _280 * _276;
    float _328 = -_298;
    float _330 = _328 + 1.0;
    bool _332 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _334 = isnan(_244);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = _310 * _330;
    float _346 = -_310;
    float _348 = _346 + 1.0;
    float _350 = _252 * _284;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    bool _356 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_244);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _322 * _348;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = fma(_354, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _380 = _256 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_372, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _392 = fma(_378, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = fma(_384, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_322;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = _342 * _400;
    float _408 = -_342;
    float _410 = _408 + 1.0;
    float _412 = fma(_404, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = _366 * _410;
    float _416 = -_366;
    float _418 = _416 + 1.0;
    float _420 = _374 * _414;
    float _422 = _394 * _414;
    float _424 = _396 * _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _432 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _434 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_428, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_390, _406, _430);
    float _448 = fma(_412, _406, _432);
    float _450 = fma(_392, _406, _434);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = fma(_438, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = fma(_442, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = fma(_444, _368, _446);
    float _470 = fma(_454, _326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _472 = fma(_458, _326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = fma(_466, _326, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _476 = fma(_460, _368, _448);
    float _478 = fma(_462, _368, _450);
    float _480 = fma(_470, _344, _468);
    float _482 = fma(_472, _344, _476);
    float _484 = fma(_474, _344, _478);
    float _486 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    bool _492 = !_282;
    float _508;
    if (!_492)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _496 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _500 = _498 * _494;
        float _502 = floor(_500);
        float _504 = -_502;
        float _506 = _500 + _504;
        _508 = _506;
        _510 = true;
    }
    else
    {
        float _512 = float(_74);
        float _514 = 1.0 / _512;
        float _516 = _108 * _514;
        _508 = _516;
    }
    _510 = false;
    float _518 = _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = _518 + _520;
    bool _524 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _526 = isnan(_518);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _518 + _536;
    bool _540 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_518);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _560 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_518);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _558;
    float _574 = -_570;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _580 = _550 * _576;
    float _582 = -_550;
    float _584 = _582 + 1.0;
    float _586 = 1.0 / _554;
    float _588 = _538 * _572;
    float _590 = _522 * _586;
    float _592 = -_534;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _596;
    float _600 = _570 * _594;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _606;
    float _610 = fma(_598, _590, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _612 = fma(_604, _590, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _614 = fma(_608, _590, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _616 = _610 * _580;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _622 = _612 * _580;
    float _624 = _614 * _580;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _634 = fma(_620, _588, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _636 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].x, _622);
    float _638 = fma(_628, _588, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _640 = fma(_632, _588, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _642 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].y, _616);
    float _644 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].z, _624);
    float _646 = fma(_638, _600, _636);
    float _648 = fma(_634, _600, _642);
    float _650 = fma(_640, _600, _644);
    float _652 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].x, _646);
    float _654 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].y, _648);
    float _656 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].z, _650);
    float _658 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = in.m_39.x;
    float _670 = in.m_39.y;
    float _672 = in.m_39.z;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _666;
    out.m_41.y = _674;
    out.m_41.z = _676;
    out.m_41.w = _660;
    float _678 = _490 * _672;
    float _680 = _488 * _670;
    float _682 = _486 * _668;
    bool _684 = !_578;
    float _700;
    if (!_684)
    {
        float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _688 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _690 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _692 = _690 * _686;
        float _694 = floor(_692);
        float _696 = -_694;
        float _698 = _692 + _696;
        _700 = _698;
        _702 = true;
    }
    else
    {
        float _704 = float(_74);
        float _706 = 1.0 / _704;
        float _708 = _108 * _706;
        _700 = _708;
    }
    _702 = false;
    float _710 = _700;
    float _712 = in.m_43.x;
    float _714 = in.m_43.y;
    float _716 = in.m_43.z;
    float _718 = _216 * _682;
    float _720 = _216 * _680;
    float _722 = in.m_45.y;
    float _724 = _216 * _678;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _728 = _726 != 0;
    float _730 = in.m_45.z;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _746 = _742 || _744;
    float _748 = in.m_45.x;
    bool _750 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _752 = isnan(0.5);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _758 = _754 || _756;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _762 = in.m_47.y;
    float _764 = in.m_37.y;
    bool _766 = _128 > 0.5;
    bool _768 = _766 && _728;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _776 = _128 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _778 = in.m_45.w;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _780;
    float _784 = -_736;
    float _786 = fma(_776, 2.0, _784);
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_49.y = _722;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _792 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[78].z, _788);
    out.m_49.z = _730;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _794;
    float _798 = -_108;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[76].x, _786);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _802;
    float _806 = in.m_30.x;
    float _808 = in.m_30.y;
    float _810 = in.m_30.z;
    float _812 = 1.0 / _782;
    bool _814 = _764 > 0.5;
    float _816 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _792);
    out.m_49.x = _748;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _822 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _824 = isnan(_710);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _796;
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _838 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _840 = isnan(_710);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _854 = -_762;
    float _856 = _854 + 1.0;
    out.m_49.w = _778;
    bool _858 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _860 = isnan(_710);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _852;
    float _872 = _762;
    if (_734)
    {
        float _874 = _814 ? _856 : _762;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = _764 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _880 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _888 = _880 * _772;
    float _890 = 1.0 / _884;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _894 = _808 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _896 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[78].w, _886);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _898;
    float _902 = fma(_878, -2.0, _892);
    float _904 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = _808 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _908 = _808 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _914 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _916 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[4].x, _906);
    float _918 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[5].x, _894);
    float _920 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[6].x, _908);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _924 = _710 + _922;
    float _926 = 1.0 / _912;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _930 = _710 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _932;
    float _936 = _924 * _812;
    float _938 = _930 * _870;
    float _940 = _904 * _770;
    float _942 = 1.0 / _934;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _950 = _710 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _952;
    float _956 = fma(_836, _876, -0.5);
    float _958 = fma(_804, _936, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _960 = fma(_946, _936, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _962 = fma(_954, _936, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _964 = 1.0 / _900;
    float _966 = _914 * _774;
    float _968 = _950 * _926;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _972 = _710 + _970;
    float _974 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _902);
    float _976 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _980 = _710 + _978;
    float _982 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _916);
    float _984 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _986 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _920);
    float _988 = in.m_47.x;
    float _990 = _972 * _834;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1006 = _710 + _1004;
    float _1008 = -_974;
    float _1010 = fma(_976, _956, _1008);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1018 = _710 + _1016;
    float _1020 = _980 * _890;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1034 = fma(_998, _990, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1036 = fma(_1002, _990, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1038 = _1006 * _942;
    float _1040 = fma(_1014, _990, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1042 = _1018 * _964;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1044;
    float _1048 = fma(_1024, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1050 = fma(_1028, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1052 = _984 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1054;
    float _1058 = fma(_1032, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1060;
    float _1064 = fma(_1046, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1066 = _982 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1068 = -_1052;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = fma(_1056, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1074 = fma(_1062, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1080 = _986 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1082 = -_1066;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1070 * _1070;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1092 = -_1080;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _964;
    float _1098 = _988;
    float _1100 = _1058;
    float _1102 = _1050;
    float _1104 = _966;
    if (_728)
    {
        _1096 = _988;
    }
    float _1106 = _1096;
    float _1108 = fma(_1084, _1084, _1086);
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1114 = fma(_1078, _968, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1116 = fma(_1094, _1094, _1108);
    float _1118 = _1106;
    if (_768)
    {
        float _1120 = -_1106;
        float _1122 = _1120 + 1.0;
        _1118 = _1122;
    }
    float _1124 = _1118;
    float _1126 = fma(_1090, _968, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1128 = fma(_1112, _968, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1130 = rsqrt(_1116);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1136 = _1126;
    if (_728)
    {
        _1098 = _1124;
    }
    float _1138 = _1098;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1144;
    bool _1148 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1150 = isnan(_710);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = fma(_820, _938, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1162 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1164 = isnan(_710);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = fma(_994, _938, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1176 = fma(_1134, _938, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1178;
    float _1182 = -_1158;
    float _1184 = _1182 + 1.0;
    float _1186 = -_1172;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1146, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1192 = fma(_1142, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1194 = _1084 * _1130;
    float _1196 = fma(_1180, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1198 = _1172 * _1184;
    float _1200 = _1070 * _1130;
    float _1202 = _1094 * _1130;
    float _1204 = _832 * _1188;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = _1194 * _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1212 = _1200 * _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1216 = _1202 * _1214;
    bool _1218 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1220 = isnan(_710);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1232 = -_1208;
    float _1234 = fma(_1202, _1230, _1232);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1212;
    float _1240 = fma(_1194, _1236, _1238);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1244 = -_1216;
    float _1246 = fma(_1200, _1242, _1244);
    float _1248 = -_832;
    float _1250 = _1248 + 1.0;
    float _1252 = _1234 * _1234;
    bool _1254 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1256 = isnan(_710);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1268 = _1228 * _1250;
    float _1270 = fma(_1246, _1246, _1252);
    float _1272 = -_1228;
    float _1274 = _1272 + 1.0;
    float _1276 = -_1264;
    float _1278 = _1276 + 1.0;
    float _1280 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1266);
    float _1282 = fma(_1240, _1240, _1270);
    float _1284 = _1264 * _1274;
    float _1286 = _848 * _1278;
    float _1288 = -_848;
    float _1290 = _1288 + 1.0;
    bool _1292 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1294 = isnan(_710);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1280);
    float _1306 = rsqrt(_1282);
    float _1308 = _868 * _1290;
    float _1310 = -_868;
    float _1312 = _1310 + 1.0;
    float _1314 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1316 = _760 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1318 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1320 = _1302 * _1312;
    float _1322 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1314);
    float _1324 = fma(_1316, _1138, -0.5);
    float _1326 = 1.0 / _1318;
    float _1328 = _958 * _1320;
    float _1330 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1322);
    float _1332 = _960 * _1320;
    float _1334 = fma(_816, _1324, _800);
    float _1336 = _962 * _1320;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = _1246 * _1306;
    float _1342 = _1234 * _1306;
    float _1344 = _1240 * _1306;
    float _1346 = _1338 + _1318;
    float _1348 = _1200 * _1340;
    float _1350 = _1202 * _1342;
    float _1352 = -_1302;
    float _1354 = _1352 + 1.0;
    float _1356 = -_1348;
    float _1358 = fma(_1194, _1342, _1356);
    float _1360 = -_1350;
    float _1362 = fma(_1200, _1344, _1360);
    float _1364 = _1346 * _1326;
    float _1366 = _1364 * 0.5;
    float _1368 = _888 * _1358;
    float _1370 = _888 * _1362;
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1336);
    float _1376 = fma(_940, _1344, _1368);
    float _1378 = fma(_940, _1340, _1370);
    float _1380 = fma(_1174, _1308, _1372);
    float _1382 = fma(_1176, _1308, _1374);
    float _1384 = fma(_966, _1202, _1376);
    float _1386 = fma(_966, _1194, _1378);
    float _1388 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1328);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1392 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1390);
    float _1394 = _1080 + _1384;
    float _1396 = _1066 + _1386;
    float _1398 = fma(_1160, _1308, _1388);
    float _1400 = fma(_1036, _1286, _1380);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1404 = _1394 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1408 = _1396 + _1406;
    float _1410 = fma(_1034, _1286, _1398);
    float _1412 = _1348;
    float _1414 = _1382;
    float _1416 = _1358;
    float _1418 = _1394;
    if (!_758)
    {
        _1412 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1420 = _1412;
    float _1422 = _1404 * _1404;
    float _1424 = fma(_1040, _1286, _1382);
    float _1426 = _1420;
    if (!_758)
    {
        _1414 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1428 = _1414;
    float _1430 = 1.0 / _1392;
    float _1432 = fma(_1408, _1408, _1422);
    if (!_758)
    {
        float _1434 = -_1420;
        float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1416 = _1436;
    }
    float _1438 = _1416;
    float _1440 = fma(_1058, _1284, _1424);
    if (!_758)
    {
        float _1442 = -_1428;
        float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1100 = _1444;
    }
    float _1446 = _1100;
    float _1448 = _1194 * _1344;
    float _1450 = fma(_1048, _1284, _1410);
    float _1452 = fma(_1050, _1284, _1400);
    float _1454 = sqrt(_1432);
    float _1456 = -_1448;
    float _1458 = fma(_1202, _1340, _1456);
    float _1460 = fma(_1064, _1268, _1450);
    float _1462 = fma(_1072, _1268, _1452);
    float _1464 = fma(_1074, _1268, _1440);
    float _1466 = _888 * _1458;
    float _1468 = fma(_1114, _1204, _1460);
    float _1470 = fma(_1126, _1204, _1462);
    float _1472 = _1438;
    float _1474 = _1450;
    if (!_758)
    {
        float _1476 = 1.0 / _1438;
        _1472 = _1476;
    }
    float _1478 = _1472;
    float _1480 = fma(_940, _1342, _1466);
    float _1482 = _1430;
    if (!_758)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1486 = -_1420;
        float _1488 = fma(_1430, _1484, _1486);
        _1426 = _1488;
    }
    float _1490 = _1426;
    float _1492 = fma(_1128, _1204, _1464);
    if (!_758)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1496 = -_1428;
        float _1498 = fma(_1430, _1494, _1496);
        _1482 = _1498;
    }
    float _1500 = _1482;
    float _1502 = fma(_966, _1200, _1480);
    float _1504 = _1500;
    if (_758)
    {
        _1102 = 1.0;
    }
    float _1506 = _1102;
    float _1508 = fma(_1190, _1198, _1468);
    float _1510 = _1446;
    float _1512 = _1506;
    float _1514 = _1508;
    if (!_758)
    {
        float _1516 = 1.0 / _1446;
        _1510 = _1516;
    }
    float _1518 = _1510;
    bool _1520 = _1454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = fma(_1192, _1198, _1470);
    float _1524 = _1052 + _1502;
    float _1526 = fma(_1196, _1198, _1492);
    if (_758)
    {
        _1104 = 1.0;
    }
    float _1528 = _1104;
    float _1530 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1508);
    float _1532 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1522);
    float _1534 = _1528;
    if (!_758)
    {
        float _1536 = _1490 * _1478;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        _1512 = _1538;
    }
    float _1540 = _1512;
    float _1542 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1526);
    bool _1544 = _1540 > 0.0;
    bool _1546 = isnan(_1540);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    if (!_1520)
    {
        _1136 = _1396;
    }
    float _1554 = _1136;
    float _1556 = _1554;
    if (!_758)
    {
        float _1558 = _1500 * _1518;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1504 = _1560;
    }
    float _1562 = _1504;
    if (!_1520)
    {
        _1474 = _1524;
    }
    float _1564 = _1474;
    float _1566 = _1564;
    if (!_758)
    {
        float _1568 = -_1562;
        float _1570 = _1568 + 1.0;
        _1534 = _1570;
    }
    float _1572 = _1534;
    bool _1574 = !_1520;
    if (!_1574)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1454 + _1578;
        float _1582 = _1524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1432);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = cos(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 + (-1.0);
        float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = fma(_1596, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = fma(_1524, _1592, _1600);
        float _1606 = _1584 * _1602;
        float _1608 = fma(_1408, _1606, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1404, _1606, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1418 = _1610;
        _1556 = _1608;
        _1566 = _1604;
        _1514 = _1602;
    }
    float _1612 = _1418;
    float _1614 = _1556;
    float _1616 = _1566;
    float _1618 = _1514;
    float _1620 = _1618;
    float _1622 = _1616;
    float _1624 = _1614;
    if (_746)
    {
        _1620 = _1612;
    }
    float _1626 = _1620;
    float _1628 = _1626;
    if (!_746)
    {
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1632 = _1052 + _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1636 = _1066 + _1634;
        float _1638 = -_1066;
        float _1640 = _1638 + _1614;
        float _1642 = -_1052;
        float _1644 = _1642 + _1616;
        float _1646 = _1632 * _1632;
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1650 = _1080 + _1648;
        float _1652 = -_1080;
        float _1654 = _1652 + _1612;
        float _1656 = fma(_1636, _1636, _1646);
        float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1660 = fma(_1650, _1650, _1656);
        float _1662 = sqrt(_1660);
        float _1664 = precise::min(_1662, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1666 = _1664 * _1658;
        float _1668 = fma(_1640, _1666, _1066);
        float _1670 = fma(_1644, _1666, _1052);
        float _1672 = fma(_1654, _1666, _1080);
        _1622 = _1670;
        _1624 = _1668;
        _1628 = _1672;
    }
    float _1674 = _1622;
    float _1676 = _1624;
    float _1678 = _1628;
    float _1680 = _1540 * _1572;
    float _1682 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1686 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1690 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1682);
    float _1692 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1684);
    float _1694 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1686);
    bool _1696 = _1572 <= 0.0;
    bool _1698 = !_1552;
    bool _1700 = _1696 || _1698;
    float _1702 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1690);
    float _1704 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1692);
    float _1706 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1688);
    float _1708 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1694);
    float _1710 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1714 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1716 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1718 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1722 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1724 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1718);
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1720);
    float _1730 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    float _1732 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1734 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1738 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1728);
    float _1740 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1730);
    float _1742 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1736);
    float _1746 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1748 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1750 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1740);
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1754 = _1530 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1756 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1758 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1760 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _1748 + _1752;
    float _1764 = _1750 + _1752;
    float _1766 = _1752 * 0.5;
    float _1768 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1774 = _1010 + 0.5;
    float _1776 = _1334 + 0.5;
    float _1778 = _1762 * 0.5;
    float _1780 = _1764 * 0.5;
    float _1782 = fma(_1744, -0.5, _1766);
    out.m_51.x = _1776;
    out.m_51.y = _1774;
    out.m_53.x = _1768;
    out.m_53.y = _1760;
    out.m_53.z = _1770;
    out.m_33.x = _1772;
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1744;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1752;
    out.m_55.x = _1778;
    out.m_55.y = _1782;
    out.m_55.z = _1780;
    out.m_55.w = _1752;
    if (!_1700)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1784 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1784;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _702 = false;
    bool _510 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1841 = as_type<float>(_90);
        out.gl_Position.z = _1841;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _84 = _110;
    }
    float _112 = _84;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1910 = as_type<float>(_126);
        out.gl_Position.z = _1910;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_37.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _136 = _134 != 0;
    int _138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _140 = _138 != 0;
    int _142 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _144 = _142 != 0;
    float _146 = _132 * _130;
    float _148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _146);
    float _150 = _148 * 6.283185482025146484375;
    float _152 = floor(_148);
    float _154 = _150 * 0.15915493667125701904296875;
    bool _156 = !_136;
    int _158 = _156 ? 0 : 1;
    int _160 = abs(_158);
    float _162 = _154 * 6.283185482025146484375;
    float _164 = cos(_162);
    bool _166 = !_144;
    int _168 = _166 ? 0 : 1;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _172 = abs(_168);
    float _174 = -_152;
    float _176 = _148 + _174;
    bool _178 = !_140;
    int _180 = _178 ? 0 : 1;
    float _182 = -_176;
    float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _186 = float(_160);
    int _188 = abs(_180);
    float _190 = fma(_164, 0.5, 0.5);
    bool _192 = _176 < 0.5;
    float _194 = float(_192);
    float _196 = abs(_184);
    float _198 = _186 * _196;
    float _200 = -_190;
    float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _204 = float(_172);
    float _206 = -_194;
    float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _210 = float(_188);
    float _212 = fma(_204, _202, _198);
    float _214 = abs(_208);
    float _216 = fma(_210, _214, _212);
    bool _218 = !_170;
    float _234;
    if (!_218)
    {
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_74);
        float _240 = 1.0 / _238;
        float _242 = _108 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _244 + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _274 = 1.0 / _260;
    float _276 = 1.0 / _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _244 + _278;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _284 = 1.0 / _264;
    float _286 = _248 * _274;
    bool _288 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_244);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_244);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_244);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _268;
    float _326 = _280 * _276;
    float _328 = -_298;
    float _330 = _328 + 1.0;
    bool _332 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _334 = isnan(_244);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = _310 * _330;
    float _346 = -_310;
    float _348 = _346 + 1.0;
    float _350 = _252 * _284;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    bool _356 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_244);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _322 * _348;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = fma(_354, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _380 = _256 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_372, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _392 = fma(_378, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = fma(_384, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_322;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = _342 * _400;
    float _408 = -_342;
    float _410 = _408 + 1.0;
    float _412 = fma(_404, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = _366 * _410;
    float _416 = -_366;
    float _418 = _416 + 1.0;
    float _420 = _374 * _414;
    float _422 = _394 * _414;
    float _424 = _396 * _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _432 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _434 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_428, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_390, _406, _430);
    float _448 = fma(_412, _406, _432);
    float _450 = fma(_392, _406, _434);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = fma(_438, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = fma(_442, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = fma(_444, _368, _446);
    float _470 = fma(_454, _326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _472 = fma(_458, _326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = fma(_466, _326, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _476 = fma(_460, _368, _448);
    float _478 = fma(_462, _368, _450);
    float _480 = fma(_470, _344, _468);
    float _482 = fma(_472, _344, _476);
    float _484 = fma(_474, _344, _478);
    float _486 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    bool _492 = !_282;
    float _508;
    if (!_492)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _496 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _500 = _498 * _494;
        float _502 = floor(_500);
        float _504 = -_502;
        float _506 = _500 + _504;
        _508 = _506;
        _510 = true;
    }
    else
    {
        float _512 = float(_74);
        float _514 = 1.0 / _512;
        float _516 = _108 * _514;
        _508 = _516;
    }
    _510 = false;
    float _518 = _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = _518 + _520;
    bool _524 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _526 = isnan(_518);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _518 + _536;
    bool _540 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_518);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _560 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_518);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _558;
    float _574 = -_570;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _580 = _550 * _576;
    float _582 = -_550;
    float _584 = _582 + 1.0;
    float _586 = 1.0 / _554;
    float _588 = _538 * _572;
    float _590 = _522 * _586;
    float _592 = -_534;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _596;
    float _600 = _570 * _594;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _606;
    float _610 = fma(_598, _590, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _612 = fma(_604, _590, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _614 = fma(_608, _590, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _616 = _610 * _580;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _622 = _612 * _580;
    float _624 = _614 * _580;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _634 = fma(_620, _588, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _636 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].x, _622);
    float _638 = fma(_628, _588, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _640 = fma(_632, _588, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _642 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].y, _616);
    float _644 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].z, _624);
    float _646 = fma(_638, _600, _636);
    float _648 = fma(_634, _600, _642);
    float _650 = fma(_640, _600, _644);
    float _652 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].x, _646);
    float _654 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].y, _648);
    float _656 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].z, _650);
    float _658 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = in.m_39.x;
    float _670 = in.m_39.y;
    float _672 = in.m_39.z;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _666;
    out.m_41.y = _674;
    out.m_41.z = _676;
    out.m_41.w = _660;
    float _678 = _490 * _672;
    float _680 = _488 * _670;
    float _682 = _486 * _668;
    bool _684 = !_578;
    float _700;
    if (!_684)
    {
        float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _688 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _690 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _692 = _690 * _686;
        float _694 = floor(_692);
        float _696 = -_694;
        float _698 = _692 + _696;
        _700 = _698;
        _702 = true;
    }
    else
    {
        float _704 = float(_74);
        float _706 = 1.0 / _704;
        float _708 = _108 * _706;
        _700 = _708;
    }
    _702 = false;
    float _710 = _700;
    float _712 = in.m_43.x;
    float _714 = in.m_43.y;
    float _716 = in.m_43.z;
    float _718 = _216 * _682;
    float _720 = _216 * _680;
    float _722 = in.m_45.y;
    float _724 = _216 * _678;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _728 = _726 != 0;
    float _730 = in.m_45.z;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _746 = _742 || _744;
    float _748 = in.m_45.x;
    bool _750 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _752 = isnan(0.5);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _758 = _754 || _756;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _762 = in.m_47.y;
    float _764 = in.m_37.y;
    bool _766 = _128 > 0.5;
    bool _768 = _766 && _728;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _776 = _128 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _778 = in.m_45.w;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _780;
    float _784 = -_736;
    float _786 = fma(_776, 2.0, _784);
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_49.y = _722;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _792 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[78].z, _788);
    out.m_49.z = _730;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _794;
    float _798 = -_108;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[76].x, _786);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _802;
    float _806 = in.m_30.x;
    float _808 = in.m_30.y;
    float _810 = in.m_30.z;
    float _812 = 1.0 / _782;
    bool _814 = _764 > 0.5;
    float _816 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _792);
    out.m_49.x = _748;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _822 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _824 = isnan(_710);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _796;
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _838 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _840 = isnan(_710);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _854 = -_762;
    float _856 = _854 + 1.0;
    out.m_49.w = _778;
    bool _858 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _860 = isnan(_710);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _852;
    float _872 = _762;
    if (_734)
    {
        float _874 = _814 ? _856 : _762;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = _764 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _880 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _888 = _880 * _772;
    float _890 = 1.0 / _884;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _894 = _808 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _896 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[78].w, _886);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _898;
    float _902 = fma(_878, -2.0, _892);
    float _904 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = _808 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _908 = _808 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _914 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _916 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[4].x, _906);
    float _918 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[5].x, _894);
    float _920 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[6].x, _908);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _924 = _710 + _922;
    float _926 = 1.0 / _912;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _930 = _710 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _932;
    float _936 = _924 * _812;
    float _938 = _930 * _870;
    float _940 = _904 * _770;
    float _942 = 1.0 / _934;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _950 = _710 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _952;
    float _956 = fma(_836, _876, -0.5);
    float _958 = fma(_804, _936, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _960 = fma(_946, _936, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _962 = fma(_954, _936, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _964 = 1.0 / _900;
    float _966 = _914 * _774;
    float _968 = _950 * _926;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _972 = _710 + _970;
    float _974 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _902);
    float _976 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _980 = _710 + _978;
    float _982 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _916);
    float _984 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _986 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _920);
    float _988 = in.m_47.x;
    float _990 = _972 * _834;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1006 = _710 + _1004;
    float _1008 = -_974;
    float _1010 = fma(_976, _956, _1008);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1018 = _710 + _1016;
    float _1020 = _980 * _890;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1034 = fma(_998, _990, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1036 = fma(_1002, _990, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1038 = _1006 * _942;
    float _1040 = fma(_1014, _990, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1042 = _1018 * _964;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1044;
    float _1048 = fma(_1024, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1050 = fma(_1028, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1052 = _984 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1054;
    float _1058 = fma(_1032, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1060;
    float _1064 = fma(_1046, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1066 = _982 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1068 = -_1052;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = fma(_1056, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1074 = fma(_1062, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1080 = _986 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1082 = -_1066;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1070 * _1070;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1092 = -_1080;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _964;
    float _1098 = _988;
    float _1100 = _1058;
    float _1102 = _1050;
    float _1104 = _966;
    if (_728)
    {
        _1096 = _988;
    }
    float _1106 = _1096;
    float _1108 = fma(_1084, _1084, _1086);
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1114 = fma(_1078, _968, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1116 = fma(_1094, _1094, _1108);
    float _1118 = _1106;
    if (_768)
    {
        float _1120 = -_1106;
        float _1122 = _1120 + 1.0;
        _1118 = _1122;
    }
    float _1124 = _1118;
    float _1126 = fma(_1090, _968, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1128 = fma(_1112, _968, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1130 = rsqrt(_1116);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1136 = _1126;
    if (_728)
    {
        _1098 = _1124;
    }
    float _1138 = _1098;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1144;
    bool _1148 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1150 = isnan(_710);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = fma(_820, _938, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1162 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1164 = isnan(_710);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = fma(_994, _938, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1176 = fma(_1134, _938, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1178;
    float _1182 = -_1158;
    float _1184 = _1182 + 1.0;
    float _1186 = -_1172;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1146, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1192 = fma(_1142, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1194 = _1084 * _1130;
    float _1196 = fma(_1180, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1198 = _1172 * _1184;
    float _1200 = _1070 * _1130;
    float _1202 = _1094 * _1130;
    float _1204 = _832 * _1188;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = _1194 * _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1212 = _1200 * _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1216 = _1202 * _1214;
    bool _1218 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1220 = isnan(_710);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1232 = -_1208;
    float _1234 = fma(_1202, _1230, _1232);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1212;
    float _1240 = fma(_1194, _1236, _1238);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1244 = -_1216;
    float _1246 = fma(_1200, _1242, _1244);
    float _1248 = -_832;
    float _1250 = _1248 + 1.0;
    float _1252 = _1234 * _1234;
    bool _1254 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1256 = isnan(_710);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1268 = _1228 * _1250;
    float _1270 = fma(_1246, _1246, _1252);
    float _1272 = -_1228;
    float _1274 = _1272 + 1.0;
    float _1276 = -_1264;
    float _1278 = _1276 + 1.0;
    float _1280 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1266);
    float _1282 = fma(_1240, _1240, _1270);
    float _1284 = _1264 * _1274;
    float _1286 = _848 * _1278;
    float _1288 = -_848;
    float _1290 = _1288 + 1.0;
    bool _1292 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1294 = isnan(_710);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1280);
    float _1306 = rsqrt(_1282);
    float _1308 = _868 * _1290;
    float _1310 = -_868;
    float _1312 = _1310 + 1.0;
    float _1314 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1316 = _760 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1318 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1320 = _1302 * _1312;
    float _1322 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1314);
    float _1324 = fma(_1316, _1138, -0.5);
    float _1326 = 1.0 / _1318;
    float _1328 = _958 * _1320;
    float _1330 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1322);
    float _1332 = _960 * _1320;
    float _1334 = fma(_816, _1324, _800);
    float _1336 = _962 * _1320;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = _1246 * _1306;
    float _1342 = _1234 * _1306;
    float _1344 = _1240 * _1306;
    float _1346 = _1338 + _1318;
    float _1348 = _1200 * _1340;
    float _1350 = _1202 * _1342;
    float _1352 = -_1302;
    float _1354 = _1352 + 1.0;
    float _1356 = -_1348;
    float _1358 = fma(_1194, _1342, _1356);
    float _1360 = -_1350;
    float _1362 = fma(_1200, _1344, _1360);
    float _1364 = _1346 * _1326;
    float _1366 = _1364 * 0.5;
    float _1368 = _888 * _1358;
    float _1370 = _888 * _1362;
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1336);
    float _1376 = fma(_940, _1344, _1368);
    float _1378 = fma(_940, _1340, _1370);
    float _1380 = fma(_1174, _1308, _1372);
    float _1382 = fma(_1176, _1308, _1374);
    float _1384 = fma(_966, _1202, _1376);
    float _1386 = fma(_966, _1194, _1378);
    float _1388 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1328);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1392 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1390);
    float _1394 = _1080 + _1384;
    float _1396 = _1066 + _1386;
    float _1398 = fma(_1160, _1308, _1388);
    float _1400 = fma(_1036, _1286, _1380);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1404 = _1394 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1408 = _1396 + _1406;
    float _1410 = fma(_1034, _1286, _1398);
    float _1412 = _1348;
    float _1414 = _1382;
    float _1416 = _1358;
    float _1418 = _1394;
    if (!_758)
    {
        _1412 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1420 = _1412;
    float _1422 = _1404 * _1404;
    float _1424 = fma(_1040, _1286, _1382);
    float _1426 = _1420;
    if (!_758)
    {
        _1414 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1428 = _1414;
    float _1430 = 1.0 / _1392;
    float _1432 = fma(_1408, _1408, _1422);
    if (!_758)
    {
        float _1434 = -_1420;
        float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1416 = _1436;
    }
    float _1438 = _1416;
    float _1440 = fma(_1058, _1284, _1424);
    if (!_758)
    {
        float _1442 = -_1428;
        float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1100 = _1444;
    }
    float _1446 = _1100;
    float _1448 = _1194 * _1344;
    float _1450 = fma(_1048, _1284, _1410);
    float _1452 = fma(_1050, _1284, _1400);
    float _1454 = sqrt(_1432);
    float _1456 = -_1448;
    float _1458 = fma(_1202, _1340, _1456);
    float _1460 = fma(_1064, _1268, _1450);
    float _1462 = fma(_1072, _1268, _1452);
    float _1464 = fma(_1074, _1268, _1440);
    float _1466 = _888 * _1458;
    float _1468 = fma(_1114, _1204, _1460);
    float _1470 = fma(_1126, _1204, _1462);
    float _1472 = _1438;
    float _1474 = _1450;
    if (!_758)
    {
        float _1476 = 1.0 / _1438;
        _1472 = _1476;
    }
    float _1478 = _1472;
    float _1480 = fma(_940, _1342, _1466);
    float _1482 = _1430;
    if (!_758)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1486 = -_1420;
        float _1488 = fma(_1430, _1484, _1486);
        _1426 = _1488;
    }
    float _1490 = _1426;
    float _1492 = fma(_1128, _1204, _1464);
    if (!_758)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1496 = -_1428;
        float _1498 = fma(_1430, _1494, _1496);
        _1482 = _1498;
    }
    float _1500 = _1482;
    float _1502 = fma(_966, _1200, _1480);
    float _1504 = _1500;
    if (_758)
    {
        _1102 = 1.0;
    }
    float _1506 = _1102;
    float _1508 = fma(_1190, _1198, _1468);
    float _1510 = _1446;
    float _1512 = _1506;
    float _1514 = _1508;
    if (!_758)
    {
        float _1516 = 1.0 / _1446;
        _1510 = _1516;
    }
    float _1518 = _1510;
    bool _1520 = _1454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = fma(_1192, _1198, _1470);
    float _1524 = _1052 + _1502;
    float _1526 = fma(_1196, _1198, _1492);
    if (_758)
    {
        _1104 = 1.0;
    }
    float _1528 = _1104;
    float _1530 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1508);
    float _1532 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1522);
    float _1534 = _1528;
    if (!_758)
    {
        float _1536 = _1490 * _1478;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        _1512 = _1538;
    }
    float _1540 = _1512;
    float _1542 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1526);
    bool _1544 = _1540 > 0.0;
    bool _1546 = isnan(_1540);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    if (!_1520)
    {
        _1136 = _1396;
    }
    float _1554 = _1136;
    float _1556 = _1554;
    if (!_758)
    {
        float _1558 = _1500 * _1518;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1504 = _1560;
    }
    float _1562 = _1504;
    if (!_1520)
    {
        _1474 = _1524;
    }
    float _1564 = _1474;
    float _1566 = _1564;
    if (!_758)
    {
        float _1568 = -_1562;
        float _1570 = _1568 + 1.0;
        _1534 = _1570;
    }
    float _1572 = _1534;
    bool _1574 = !_1520;
    if (!_1574)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1454 + _1578;
        float _1582 = _1524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1432);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = cos(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 + (-1.0);
        float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = fma(_1596, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = fma(_1524, _1592, _1600);
        float _1606 = _1584 * _1602;
        float _1608 = fma(_1408, _1606, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1404, _1606, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1418 = _1610;
        _1556 = _1608;
        _1566 = _1604;
        _1514 = _1602;
    }
    float _1612 = _1418;
    float _1614 = _1556;
    float _1616 = _1566;
    float _1618 = _1514;
    float _1620 = _1618;
    float _1622 = _1616;
    float _1624 = _1614;
    if (_746)
    {
        _1620 = _1612;
    }
    float _1626 = _1620;
    float _1628 = _1626;
    if (!_746)
    {
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1632 = _1052 + _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1636 = _1066 + _1634;
        float _1638 = -_1066;
        float _1640 = _1638 + _1614;
        float _1642 = -_1052;
        float _1644 = _1642 + _1616;
        float _1646 = _1632 * _1632;
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1650 = _1080 + _1648;
        float _1652 = -_1080;
        float _1654 = _1652 + _1612;
        float _1656 = fma(_1636, _1636, _1646);
        float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1660 = fma(_1650, _1650, _1656);
        float _1662 = sqrt(_1660);
        float _1664 = precise::min(_1662, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1666 = _1664 * _1658;
        float _1668 = fma(_1640, _1666, _1066);
        float _1670 = fma(_1644, _1666, _1052);
        float _1672 = fma(_1654, _1666, _1080);
        _1622 = _1670;
        _1624 = _1668;
        _1628 = _1672;
    }
    float _1674 = _1622;
    float _1676 = _1624;
    float _1678 = _1628;
    float _1680 = _1540 * _1572;
    float _1682 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1686 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1690 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1682);
    float _1692 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1684);
    float _1694 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1686);
    bool _1696 = _1572 <= 0.0;
    bool _1698 = !_1552;
    bool _1700 = _1696 || _1698;
    float _1702 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1690);
    float _1704 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1692);
    float _1706 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1688);
    float _1708 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1694);
    float _1710 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1714 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1716 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1718 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1722 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1724 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1718);
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1720);
    float _1730 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    float _1732 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1734 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1738 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1728);
    float _1740 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1730);
    float _1742 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1736);
    float _1746 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1748 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1750 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1740);
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1754 = _1530 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1756 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1758 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1760 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _1748 + _1752;
    float _1764 = _1750 + _1752;
    float _1766 = _1752 * 0.5;
    float _1768 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1774 = _1010 + 0.5;
    float _1776 = _1334 + 0.5;
    float _1778 = _1762 * 0.5;
    float _1780 = _1764 * 0.5;
    float _1782 = fma(_1744, -0.5, _1766);
    out.m_51.x = _1776;
    out.m_51.y = _1774;
    out.m_53.x = _1768;
    out.m_53.y = _1760;
    out.m_53.z = _1770;
    out.m_33.x = _1772;
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1744;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1752;
    out.m_55.x = _1778;
    out.m_55.y = _1782;
    out.m_55.z = _1780;
    out.m_55.w = _1752;
    if (!_1700)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1784 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1784;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _702 = false;
    bool _510 = false;
    bool _236 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_30.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_33.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1841 = as_type<float>(_90);
        out.gl_Position.z = _1841;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_35.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_104)
    {
        float _110 = float(_74);
        _84 = _110;
    }
    float _112 = _84;
    bool _114 = _108 >= _112;
    bool _116 = !_104;
    bool _118 = _114 || _116;
    float _120 = _112;
    if (_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (_118)
    {
        out.m_33.x = 0.0;
    }
    if (_118)
    {
        float _124 = _122 * 5.0;
        _92 = as_type<int>(_124);
    }
    int _126 = _92;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1910 = as_type<float>(_126);
        out.gl_Position.z = _1910;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_37.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _136 = _134 != 0;
    int _138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _140 = _138 != 0;
    int _142 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _144 = _142 != 0;
    float _146 = _132 * _130;
    float _148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _146);
    float _150 = _148 * 6.283185482025146484375;
    float _152 = floor(_148);
    float _154 = _150 * 0.15915493667125701904296875;
    bool _156 = !_136;
    int _158 = _156 ? 0 : 1;
    int _160 = abs(_158);
    float _162 = _154 * 6.283185482025146484375;
    float _164 = cos(_162);
    bool _166 = !_144;
    int _168 = _166 ? 0 : 1;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _172 = abs(_168);
    float _174 = -_152;
    float _176 = _148 + _174;
    bool _178 = !_140;
    int _180 = _178 ? 0 : 1;
    float _182 = -_176;
    float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _186 = float(_160);
    int _188 = abs(_180);
    float _190 = fma(_164, 0.5, 0.5);
    bool _192 = _176 < 0.5;
    float _194 = float(_192);
    float _196 = abs(_184);
    float _198 = _186 * _196;
    float _200 = -_190;
    float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _204 = float(_172);
    float _206 = -_194;
    float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _210 = float(_188);
    float _212 = fma(_204, _202, _198);
    float _214 = abs(_208);
    float _216 = fma(_210, _214, _212);
    bool _218 = !_170;
    float _234;
    if (!_218)
    {
        float _220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _222 = _128 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _224 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[12].x, _108);
        float _226 = _224 * _220;
        float _228 = floor(_226);
        float _230 = -_228;
        float _232 = _226 + _230;
        _234 = _232;
        _236 = true;
    }
    else
    {
        float _238 = float(_74);
        float _240 = 1.0 / _238;
        float _242 = _108 * _240;
        _234 = _242;
    }
    _236 = false;
    float _244 = _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = _244 + _246;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _244 + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _244 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _262 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _274 = 1.0 / _260;
    float _276 = 1.0 / _272;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _244 + _278;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _284 = 1.0 / _264;
    float _286 = _248 * _274;
    bool _288 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_244);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _302 = isnan(_244);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    bool _312 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _314 = isnan(_244);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _268;
    float _326 = _280 * _276;
    float _328 = -_298;
    float _330 = _328 + 1.0;
    bool _332 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _334 = isnan(_244);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = _310 * _330;
    float _346 = -_310;
    float _348 = _346 + 1.0;
    float _350 = _252 * _284;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _352;
    bool _356 = _244 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _358 = isnan(_244);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _322 * _348;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = fma(_354, _286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _380 = _256 * _324;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _386;
    float _390 = fma(_372, _350, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _392 = fma(_378, _350, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = fma(_384, _286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _286, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_322;
    float _400 = _398 + 1.0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = _342 * _400;
    float _408 = -_342;
    float _410 = _408 + 1.0;
    float _412 = fma(_404, _350, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _414 = _366 * _410;
    float _416 = -_366;
    float _418 = _416 + 1.0;
    float _420 = _374 * _414;
    float _422 = _394 * _414;
    float _424 = _396 * _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _420);
    float _432 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _422);
    float _434 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_428, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _446 = fma(_390, _406, _430);
    float _448 = fma(_412, _406, _432);
    float _450 = fma(_392, _406, _434);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = fma(_438, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _462 = fma(_442, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = fma(_444, _368, _446);
    float _470 = fma(_454, _326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _472 = fma(_458, _326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _474 = fma(_466, _326, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _476 = fma(_460, _368, _448);
    float _478 = fma(_462, _368, _450);
    float _480 = fma(_470, _344, _468);
    float _482 = fma(_472, _344, _476);
    float _484 = fma(_474, _344, _478);
    float _486 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].x, _480);
    float _488 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].y, _482);
    float _490 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[147].z, _484);
    bool _492 = !_282;
    float _508;
    if (!_492)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _496 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[11].x, _108);
        float _500 = _498 * _494;
        float _502 = floor(_500);
        float _504 = -_502;
        float _506 = _500 + _504;
        _508 = _506;
        _510 = true;
    }
    else
    {
        float _512 = float(_74);
        float _514 = 1.0 / _512;
        float _516 = _108 * _514;
        _508 = _516;
    }
    _510 = false;
    float _518 = _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _522 = _518 + _520;
    bool _524 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _526 = isnan(_518);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _538 = _518 + _536;
    bool _540 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_518);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _560 = _518 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_518);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _558;
    float _574 = -_570;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _580 = _550 * _576;
    float _582 = -_550;
    float _584 = _582 + 1.0;
    float _586 = 1.0 / _554;
    float _588 = _538 * _572;
    float _590 = _522 * _586;
    float _592 = -_534;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _596;
    float _600 = _570 * _594;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _606;
    float _610 = fma(_598, _590, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _612 = fma(_604, _590, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _614 = fma(_608, _590, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _616 = _610 * _580;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _622 = _612 * _580;
    float _624 = _614 * _580;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _634 = fma(_620, _588, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _636 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].x, _622);
    float _638 = fma(_628, _588, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _640 = fma(_632, _588, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _642 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].y, _616);
    float _644 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[107].z, _624);
    float _646 = fma(_638, _600, _636);
    float _648 = fma(_634, _600, _642);
    float _650 = fma(_640, _600, _644);
    float _652 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].x, _646);
    float _654 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].y, _648);
    float _656 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[109].z, _650);
    float _658 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = in.m_39.x;
    float _670 = in.m_39.y;
    float _672 = in.m_39.z;
    float _674 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_41.x = _666;
    out.m_41.y = _674;
    out.m_41.z = _676;
    out.m_41.w = _660;
    float _678 = _490 * _672;
    float _680 = _488 * _670;
    float _682 = _486 * _668;
    bool _684 = !_578;
    float _700;
    if (!_684)
    {
        float _686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _688 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _690 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[11].z, _108);
        float _692 = _690 * _686;
        float _694 = floor(_692);
        float _696 = -_694;
        float _698 = _692 + _696;
        _700 = _698;
        _702 = true;
    }
    else
    {
        float _704 = float(_74);
        float _706 = 1.0 / _704;
        float _708 = _108 * _706;
        _700 = _708;
    }
    _702 = false;
    float _710 = _700;
    float _712 = in.m_43.x;
    float _714 = in.m_43.y;
    float _716 = in.m_43.z;
    float _718 = _216 * _682;
    float _720 = _216 * _680;
    float _722 = in.m_45.y;
    float _724 = _216 * _678;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _728 = _726 != 0;
    float _730 = in.m_45.z;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _738 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _740 = isnan(0.5);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _746 = _742 || _744;
    float _748 = in.m_45.x;
    bool _750 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _752 = isnan(0.5);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _758 = _754 || _756;
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _762 = in.m_47.y;
    float _764 = in.m_37.y;
    bool _766 = _128 > 0.5;
    bool _768 = _766 && _728;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _712);
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _714);
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _716);
    float _776 = _128 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _778 = in.m_45.w;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _780;
    float _784 = -_736;
    float _786 = fma(_776, 2.0, _784);
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_49.y = _722;
    float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _792 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[78].z, _788);
    out.m_49.z = _730;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _794;
    float _798 = -_108;
    float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[76].x, _786);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _802;
    float _806 = in.m_30.x;
    float _808 = in.m_30.y;
    float _810 = in.m_30.z;
    float _812 = 1.0 / _782;
    bool _814 = _764 > 0.5;
    float _816 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _792);
    out.m_49.x = _748;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _822 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _824 = isnan(_710);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = 1.0 / _796;
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _838 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _840 = isnan(_710);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _854 = -_762;
    float _856 = _854 + 1.0;
    out.m_49.w = _778;
    bool _858 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _860 = isnan(_710);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = 1.0 / _852;
    float _872 = _762;
    if (_734)
    {
        float _874 = _814 ? _856 : _762;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = _764 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _880 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _888 = _880 * _772;
    float _890 = 1.0 / _884;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _894 = _808 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _896 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[78].w, _886);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _898;
    float _902 = fma(_878, -2.0, _892);
    float _904 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _906 = _808 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _908 = _808 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _914 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _916 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[4].x, _906);
    float _918 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[5].x, _894);
    float _920 = fma(_806, (*spvDescriptorSet0.vp_c10)._m0[6].x, _908);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _924 = _710 + _922;
    float _926 = 1.0 / _912;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _930 = _710 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _932;
    float _936 = _924 * _812;
    float _938 = _930 * _870;
    float _940 = _904 * _770;
    float _942 = 1.0 / _934;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _950 = _710 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _952;
    float _956 = fma(_836, _876, -0.5);
    float _958 = fma(_804, _936, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _960 = fma(_946, _936, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _962 = fma(_954, _936, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _964 = 1.0 / _900;
    float _966 = _914 * _774;
    float _968 = _950 * _926;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _972 = _710 + _970;
    float _974 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _902);
    float _976 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _980 = _710 + _978;
    float _982 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[4].z, _916);
    float _984 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _986 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[6].z, _920);
    float _988 = in.m_47.x;
    float _990 = _972 * _834;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1006 = _710 + _1004;
    float _1008 = -_974;
    float _1010 = fma(_976, _956, _1008);
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1018 = _710 + _1016;
    float _1020 = _980 * _890;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1034 = fma(_998, _990, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1036 = fma(_1002, _990, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1038 = _1006 * _942;
    float _1040 = fma(_1014, _990, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1042 = _1018 * _964;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1044;
    float _1048 = fma(_1024, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1050 = fma(_1028, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1052 = _984 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1054;
    float _1058 = fma(_1032, _1020, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1060;
    float _1064 = fma(_1046, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1066 = _982 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1068 = -_1052;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = fma(_1056, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1074 = fma(_1062, _1042, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1080 = _986 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1082 = -_1066;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1070 * _1070;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1092 = -_1080;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _964;
    float _1098 = _988;
    float _1100 = _1058;
    float _1102 = _1050;
    float _1104 = _966;
    if (_728)
    {
        _1096 = _988;
    }
    float _1106 = _1096;
    float _1108 = fma(_1084, _1084, _1086);
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1114 = fma(_1078, _968, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1116 = fma(_1094, _1094, _1108);
    float _1118 = _1106;
    if (_768)
    {
        float _1120 = -_1106;
        float _1122 = _1120 + 1.0;
        _1118 = _1122;
    }
    float _1124 = _1118;
    float _1126 = fma(_1090, _968, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1128 = fma(_1112, _968, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1130 = rsqrt(_1116);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1136 = _1126;
    if (_728)
    {
        _1098 = _1124;
    }
    float _1138 = _1098;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1144;
    bool _1148 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1150 = isnan(_710);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = fma(_820, _938, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1162 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1164 = isnan(_710);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = fma(_994, _938, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1176 = fma(_1134, _938, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1178;
    float _1182 = -_1158;
    float _1184 = _1182 + 1.0;
    float _1186 = -_1172;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1146, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1192 = fma(_1142, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1194 = _1084 * _1130;
    float _1196 = fma(_1180, _1038, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1198 = _1172 * _1184;
    float _1200 = _1070 * _1130;
    float _1202 = _1094 * _1130;
    float _1204 = _832 * _1188;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1208 = _1194 * _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1212 = _1200 * _1210;
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1216 = _1202 * _1214;
    bool _1218 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1220 = isnan(_710);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1232 = -_1208;
    float _1234 = fma(_1202, _1230, _1232);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1212;
    float _1240 = fma(_1194, _1236, _1238);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1244 = -_1216;
    float _1246 = fma(_1200, _1242, _1244);
    float _1248 = -_832;
    float _1250 = _1248 + 1.0;
    float _1252 = _1234 * _1234;
    bool _1254 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1256 = isnan(_710);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1268 = _1228 * _1250;
    float _1270 = fma(_1246, _1246, _1252);
    float _1272 = -_1228;
    float _1274 = _1272 + 1.0;
    float _1276 = -_1264;
    float _1278 = _1276 + 1.0;
    float _1280 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1266);
    float _1282 = fma(_1240, _1240, _1270);
    float _1284 = _1264 * _1274;
    float _1286 = _848 * _1278;
    float _1288 = -_848;
    float _1290 = _1288 + 1.0;
    bool _1292 = _710 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1294 = isnan(_710);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1280);
    float _1306 = rsqrt(_1282);
    float _1308 = _868 * _1290;
    float _1310 = -_868;
    float _1312 = _1310 + 1.0;
    float _1314 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1316 = _760 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1318 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1320 = _1302 * _1312;
    float _1322 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1314);
    float _1324 = fma(_1316, _1138, -0.5);
    float _1326 = 1.0 / _1318;
    float _1328 = _958 * _1320;
    float _1330 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1322);
    float _1332 = _960 * _1320;
    float _1334 = fma(_816, _1324, _800);
    float _1336 = _962 * _1320;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = _1246 * _1306;
    float _1342 = _1234 * _1306;
    float _1344 = _1240 * _1306;
    float _1346 = _1338 + _1318;
    float _1348 = _1200 * _1340;
    float _1350 = _1202 * _1342;
    float _1352 = -_1302;
    float _1354 = _1352 + 1.0;
    float _1356 = -_1348;
    float _1358 = fma(_1194, _1342, _1356);
    float _1360 = -_1350;
    float _1362 = fma(_1200, _1344, _1360);
    float _1364 = _1346 * _1326;
    float _1366 = _1364 * 0.5;
    float _1368 = _888 * _1358;
    float _1370 = _888 * _1362;
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1332);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1336);
    float _1376 = fma(_940, _1344, _1368);
    float _1378 = fma(_940, _1340, _1370);
    float _1380 = fma(_1174, _1308, _1372);
    float _1382 = fma(_1176, _1308, _1374);
    float _1384 = fma(_966, _1202, _1376);
    float _1386 = fma(_966, _1194, _1378);
    float _1388 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1328);
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1392 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1390);
    float _1394 = _1080 + _1384;
    float _1396 = _1066 + _1386;
    float _1398 = fma(_1160, _1308, _1388);
    float _1400 = fma(_1036, _1286, _1380);
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1404 = _1394 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1408 = _1396 + _1406;
    float _1410 = fma(_1034, _1286, _1398);
    float _1412 = _1348;
    float _1414 = _1382;
    float _1416 = _1358;
    float _1418 = _1394;
    if (!_758)
    {
        _1412 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1420 = _1412;
    float _1422 = _1404 * _1404;
    float _1424 = fma(_1040, _1286, _1382);
    float _1426 = _1420;
    if (!_758)
    {
        _1414 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1428 = _1414;
    float _1430 = 1.0 / _1392;
    float _1432 = fma(_1408, _1408, _1422);
    if (!_758)
    {
        float _1434 = -_1420;
        float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1416 = _1436;
    }
    float _1438 = _1416;
    float _1440 = fma(_1058, _1284, _1424);
    if (!_758)
    {
        float _1442 = -_1428;
        float _1444 = _1442 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1100 = _1444;
    }
    float _1446 = _1100;
    float _1448 = _1194 * _1344;
    float _1450 = fma(_1048, _1284, _1410);
    float _1452 = fma(_1050, _1284, _1400);
    float _1454 = sqrt(_1432);
    float _1456 = -_1448;
    float _1458 = fma(_1202, _1340, _1456);
    float _1460 = fma(_1064, _1268, _1450);
    float _1462 = fma(_1072, _1268, _1452);
    float _1464 = fma(_1074, _1268, _1440);
    float _1466 = _888 * _1458;
    float _1468 = fma(_1114, _1204, _1460);
    float _1470 = fma(_1126, _1204, _1462);
    float _1472 = _1438;
    float _1474 = _1450;
    if (!_758)
    {
        float _1476 = 1.0 / _1438;
        _1472 = _1476;
    }
    float _1478 = _1472;
    float _1480 = fma(_940, _1342, _1466);
    float _1482 = _1430;
    if (!_758)
    {
        float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1486 = -_1420;
        float _1488 = fma(_1430, _1484, _1486);
        _1426 = _1488;
    }
    float _1490 = _1426;
    float _1492 = fma(_1128, _1204, _1464);
    if (!_758)
    {
        float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1496 = -_1428;
        float _1498 = fma(_1430, _1494, _1496);
        _1482 = _1498;
    }
    float _1500 = _1482;
    float _1502 = fma(_966, _1200, _1480);
    float _1504 = _1500;
    if (_758)
    {
        _1102 = 1.0;
    }
    float _1506 = _1102;
    float _1508 = fma(_1190, _1198, _1468);
    float _1510 = _1446;
    float _1512 = _1506;
    float _1514 = _1508;
    if (!_758)
    {
        float _1516 = 1.0 / _1446;
        _1510 = _1516;
    }
    float _1518 = _1510;
    bool _1520 = _1454 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = fma(_1192, _1198, _1470);
    float _1524 = _1052 + _1502;
    float _1526 = fma(_1196, _1198, _1492);
    if (_758)
    {
        _1104 = 1.0;
    }
    float _1528 = _1104;
    float _1530 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1508);
    float _1532 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1522);
    float _1534 = _1528;
    if (!_758)
    {
        float _1536 = _1490 * _1478;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        _1512 = _1538;
    }
    float _1540 = _1512;
    float _1542 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1526);
    bool _1544 = _1540 > 0.0;
    bool _1546 = isnan(_1540);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.0);
    bool _1552 = _1548 || _1550;
    if (!_1520)
    {
        _1136 = _1396;
    }
    float _1554 = _1136;
    float _1556 = _1554;
    if (!_758)
    {
        float _1558 = _1500 * _1518;
        float _1560 = precise::clamp(_1558, 0.0, 1.0);
        _1504 = _1560;
    }
    float _1562 = _1504;
    if (!_1520)
    {
        _1474 = _1524;
    }
    float _1564 = _1474;
    float _1566 = _1564;
    if (!_758)
    {
        float _1568 = -_1562;
        float _1570 = _1568 + 1.0;
        _1534 = _1570;
    }
    float _1572 = _1534;
    bool _1574 = !_1520;
    if (!_1574)
    {
        float _1576 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1580 = _1454 + _1578;
        float _1582 = _1524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = rsqrt(_1432);
        float _1586 = _1580 * _1576;
        float _1588 = _1586 * 0.15915493667125701904296875;
        float _1590 = _1588 * 6.283185482025146484375;
        float _1592 = cos(_1590);
        float _1594 = _1588 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592 + (-1.0);
        float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = fma(_1596, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1604 = fma(_1524, _1592, _1600);
        float _1606 = _1584 * _1602;
        float _1608 = fma(_1408, _1606, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1610 = fma(_1404, _1606, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1418 = _1610;
        _1556 = _1608;
        _1566 = _1604;
        _1514 = _1602;
    }
    float _1612 = _1418;
    float _1614 = _1556;
    float _1616 = _1566;
    float _1618 = _1514;
    float _1620 = _1618;
    float _1622 = _1616;
    float _1624 = _1614;
    if (_746)
    {
        _1620 = _1612;
    }
    float _1626 = _1620;
    float _1628 = _1626;
    if (!_746)
    {
        float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1632 = _1052 + _1630;
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1636 = _1066 + _1634;
        float _1638 = -_1066;
        float _1640 = _1638 + _1614;
        float _1642 = -_1052;
        float _1644 = _1642 + _1616;
        float _1646 = _1632 * _1632;
        float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1650 = _1080 + _1648;
        float _1652 = -_1080;
        float _1654 = _1652 + _1612;
        float _1656 = fma(_1636, _1636, _1646);
        float _1658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1660 = fma(_1650, _1650, _1656);
        float _1662 = sqrt(_1660);
        float _1664 = precise::min(_1662, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1666 = _1664 * _1658;
        float _1668 = fma(_1640, _1666, _1066);
        float _1670 = fma(_1644, _1666, _1052);
        float _1672 = fma(_1654, _1666, _1080);
        _1622 = _1670;
        _1624 = _1668;
        _1628 = _1672;
    }
    float _1674 = _1622;
    float _1676 = _1624;
    float _1678 = _1628;
    float _1680 = _1540 * _1572;
    float _1682 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1684 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1686 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1690 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1682);
    float _1692 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1684);
    float _1694 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1686);
    bool _1696 = _1572 <= 0.0;
    bool _1698 = !_1552;
    bool _1700 = _1696 || _1698;
    float _1702 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1690);
    float _1704 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1692);
    float _1706 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1688);
    float _1708 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1694);
    float _1710 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1714 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1716 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1718 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1722 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1724 = _1710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1718);
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1720);
    float _1730 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1722);
    float _1732 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1734 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1738 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1728);
    float _1740 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1730);
    float _1742 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1736);
    float _1746 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1748 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1750 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1740);
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1754 = _1530 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1756 = _1542 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1758 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1760 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _1748 + _1752;
    float _1764 = _1750 + _1752;
    float _1766 = _1752 * 0.5;
    float _1768 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1770 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1772 = _1758 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1774 = _1010 + 0.5;
    float _1776 = _1334 + 0.5;
    float _1778 = _1762 * 0.5;
    float _1780 = _1764 * 0.5;
    float _1782 = fma(_1744, -0.5, _1766);
    out.m_51.x = _1776;
    out.m_51.y = _1774;
    out.m_53.x = _1768;
    out.m_53.y = _1760;
    out.m_53.z = _1770;
    out.m_33.x = _1772;
    out.gl_Position.x = _1748;
    out.gl_Position.y = _1744;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1752;
    out.m_55.x = _1778;
    out.m_55.y = _1782;
    out.m_55.z = _1780;
    out.m_55.w = _1752;
    if (!_1700)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1784 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1784;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

