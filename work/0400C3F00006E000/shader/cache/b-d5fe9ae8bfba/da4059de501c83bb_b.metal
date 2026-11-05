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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_59 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(1)]];
    float4 m_47 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_34 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_55 [[attribute(8)]];
    float4 m_43 [[attribute(9)]];
    float4 m_41 [[attribute(10)]];
    float4 m_53 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1454 = false;
    bool _696 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_34.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_37.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_106);
        out.gl_Position.z = _1903;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_39.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_37.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_142);
        out.gl_Position.z = _1972;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_39.x;
    float _146 = in.m_39.y;
    float _148 = in.m_39.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_34.x;
    float _164 = in.m_34.y;
    float _166 = in.m_34.z;
    float _168 = in.m_41.x;
    float _170 = in.m_41.y;
    float _172 = in.m_41.z;
    float _174 = in.m_41.w;
    float _176 = 0.0;
    float _178 = _150;
    if (!_160)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_160;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _144, _254);
    float _262 = fma(_250, _146, _256);
    float _264 = fma(_250, _148, _258);
    float _266 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = fma(_260, _174, _162);
    float _270 = fma(_262, _174, _164);
    float _272 = fma(_264, _174, _166);
    float _274 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _278 = !_252;
    float _296;
    if (!_278)
    {
        float _280 = in.m_43.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_90);
        float _302 = 1.0 / _300;
        float _304 = _124 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _328 = 1.0 / _314;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _338 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _340 = isnan(_306);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _352 = isnan(_306);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _322;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = _306 + _364;
    bool _368 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _370 = isnan(_306);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _382 = isnan(_306);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = 1.0 / _326;
    float _394 = _366 * _328;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _398 = _306 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = 1.0 / _318;
    float _406 = _398 * _362;
    bool _408 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _410 = isnan(_306);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _422 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _424 = isnan(_306);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _436 = 1.0 / _336;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _306 + _438;
    float _442 = 1.0 / _332;
    float _444 = _440 * _404;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _448 = _306 + _446;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _454;
    float _458 = _348 * _452;
    float _460 = _448 * _436;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _464 = _306 + _462;
    float _466 = -_348;
    float _468 = _466 + 1.0;
    float _470 = fma(_456, _394, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _472 = _464 * _392;
    float _474 = _360 * _468;
    float _476 = _310 * _442;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _486 = -_432;
    float _488 = _486 + 1.0;
    float _490 = fma(_480, _394, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _492 = -_360;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _504 = fma(_484, _444, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _506 = _432 * _494;
    bool _508 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_306);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _378 * _488;
    float _522 = -_378;
    float _524 = _522 + 1.0;
    float _526 = fma(_498, _444, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _528 = fma(_502, _444, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _530 = -_518;
    float _532 = _530 + 1.0;
    float _534 = _518 * _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _544;
    float _548 = _390 * _532;
    float _550 = fma(_538, _476, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _552 = fma(_542, _476, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _554 = fma(_546, _476, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _556 = _470 * _548;
    float _558 = _490 * _548;
    float _560 = -_390;
    float _562 = _560 + 1.0;
    float _564 = _420 * _548;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _578 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].x, _556);
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].y, _558);
    float _582 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].z, _564);
    float _584 = fma(_568, _460, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _586 = fma(_572, _460, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _588 = fma(_576, _460, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _590 = fma(_526, _534, _578);
    float _592 = fma(_504, _534, _580);
    float _594 = fma(_528, _534, _582);
    float _596 = fma(_550, _520, _590);
    float _598 = fma(_552, _520, _592);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _604;
    float _608 = fma(_554, _520, _594);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _610;
    float _614 = fma(_584, _506, _596);
    float _616 = fma(_586, _506, _598);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _626 = fma(_602, _406, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _628 = fma(_606, _406, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _630 = fma(_612, _406, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _636 = fma(_588, _506, _608);
    float _638 = fma(_620, _472, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _640 = fma(_624, _472, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _642 = fma(_634, _472, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _644 = fma(_626, _474, _614);
    float _646 = fma(_628, _474, _616);
    float _648 = fma(_630, _474, _636);
    float _650 = fma(_638, _458, _644);
    float _652 = fma(_640, _458, _646);
    float _654 = fma(_642, _458, _648);
    float _656 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].x, _650);
    float _658 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].y, _652);
    float _660 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].z, _654);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _670 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _670;
    out.m_45.y = _672;
    out.m_45.z = _674;
    out.m_45.w = _662;
    bool _676 = !_434;
    float _694;
    if (!_676)
    {
        float _678 = in.m_43.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_90);
        float _700 = 1.0 / _698;
        float _702 = _124 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = in.m_47.x;
    float _708 = in.m_47.y;
    float _710 = in.m_47.z;
    float _712 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = in.m_49.x;
    float _716 = in.m_49.y;
    float _718 = in.m_49.z;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _728 = in.m_51.x;
    float _730 = in.m_51.y;
    float _732 = in.m_51.z;
    float _734 = 1.0 / _726;
    float _736 = in.m_53.y;
    float _738 = in.m_43.y;
    float _740 = 1.0 / _722;
    float _742 = in.m_53.x;
    bool _744 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _746 = isnan(_704);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _270 * _708;
    float _758 = -_754;
    float _760 = _758 + 1.0;
    float _762 = _270 * _716;
    float _764 = fma(_268, _706, _756);
    float _766 = _270 * _730;
    float _768 = fma(_268, _714, _762);
    float _770 = fma(_268, _728, _766);
    float _772 = fma(_272, _710, _764);
    float _774 = fma(_272, _718, _768);
    float _776 = -_736;
    float _778 = _776 + 1.0;
    float _780 = fma(_272, _732, _770);
    float _782 = _772 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _784 = _774 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _786;
    float _790 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _782 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _798 = _784 + _796;
    float _800 = in.m_55.x;
    float _802 = in.m_55.y;
    float _804 = in.m_55.z;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _808 = _790 + _806;
    float _810 = _794 * _794;
    float _812 = 1.0 / _788;
    bool _814 = _738 > 0.5;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _820 = fma(_798, _798, _810);
    float _822 = fma(_808, _808, _820);
    float _824 = 1.0 / _818;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _832 = _830 != 0;
    float _834 = sqrt(_822);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _836;
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _800);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _802);
    float _844 = _712 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _846 = rsqrt(_822);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _852 = _774;
    float _854 = _736;
    float _856 = _742;
    float _858 = _790;
    if (_828)
    {
        float _860 = in.m_43.x;
        _852 = _860;
    }
    float _862 = _852;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _804);
    if (_832)
    {
        float _866 = _814 ? _778 : _736;
        _854 = _866;
    }
    float _868 = _854;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _872 = _704 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _876 = _704 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _880 = _704 + _878;
    float _882 = 1.0 / _838;
    float _884 = _834 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _886 = _872 * _734;
    float _888 = _876 * _740;
    float _890 = _880 * _812;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _894 = _704 + _892;
    float _896 = precise::min(_844, _884);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _900 = _704 + _898;
    float _902 = 1.0 / _850;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _906 = _704 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _908;
    float _912 = _846 * _896;
    float _914 = _900 * _824;
    float _916 = _794 * _912;
    float _918 = _894 * _882;
    float _920 = _798 * _912;
    bool _922 = _862 > 0.5;
    bool _924 = _922 && _828;
    float _926 = -_916;
    float _928 = _794 + _926;
    float _930 = -_920;
    float _932 = _798 + _930;
    float _934 = _928 * _928;
    float _936 = _906 * _902;
    float _938 = _808 * _912;
    float _940 = fma(_932, _932, _934);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _942;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _946;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _950;
    float _954 = -_938;
    float _956 = _808 + _954;
    float _958 = fma(_944, _888, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _960 = fma(_948, _888, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _962 = fma(_952, _888, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _964 = fma(_956, _956, _940);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = sqrt(_964);
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _984;
    float _988 = fma(_972, _890, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _990 = fma(_976, _886, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _992 = fma(_982, _886, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _994 = fma(_968, _886, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1000 = fma(_986, _890, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1002 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1012;
    float _1016 = fma(_998, _914, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1018 = _846 * _978;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1024;
    float _1028 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1030 = fma(_1006, _914, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1032 = fma(_1010, _914, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1034 = fma(_1022, _918, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1036 = fma(_1014, _918, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1038 = fma(_1026, _918, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1040 = _1028 * _1018;
    float _1042 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1044 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1046 = isnan(_704);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = _712 * _1018;
    float _1058 = _1040 * _842;
    float _1060 = _1042 * _1018;
    bool _1062 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1064 = isnan(_704);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = -_1054;
    float _1076 = _1074 + 1.0;
    float _1078 = _1056 * _840;
    float _1080 = _1060 * _864;
    bool _1082 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1084 = isnan(_704);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1072 * _1076;
    float _1096 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1098 = -_1072;
    float _1100 = _1098 + 1.0;
    float _1102 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1104 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1106 = isnan(_704);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1096);
    float _1118 = _1092 * _1100;
    float _1120 = -_1092;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1102);
    float _1126 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1116);
    bool _1128 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1130 = isnan(_704);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = _1114 * _1122;
    float _1142 = -_1114;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1124);
    float _1148 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1150 = -_1138;
    float _1152 = _1150 + 1.0;
    float _1154 = _1138 * _1144;
    float _1156 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1158 = _790 + _1148;
    bool _1160 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1162 = isnan(_704);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _754 * _1152;
    float _1174 = _784 + _1156;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1178 = _1158 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1174 + _1188;
    float _1192 = _1178 * _1178;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1198 = fma(_1182, _936, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1200 = fma(_1186, _936, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1202 = fma(_1190, _1190, _1192);
    float _1204 = fma(_1196, _936, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1206 = _1156;
    float _1208 = _1174;
    float _1210 = _1158;
    if (_828)
    {
        _1206 = _742;
    }
    float _1212 = _1206;
    float _1214 = _1170 * _760;
    float _1216 = sqrt(_1202);
    float _1218 = -_1170;
    float _1220 = _1218 + 1.0;
    float _1222 = _962 * _1214;
    float _1224 = _958 * _1214;
    float _1226 = _960 * _1214;
    float _1228 = _1212;
    if (_924)
    {
        float _1230 = -_1212;
        float _1232 = _1230 + 1.0;
        _1228 = _1232;
    }
    float _1234 = _1228;
    float _1236 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1224);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1222);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1226);
    float _1244 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1236);
    if (_828)
    {
        _856 = _1234;
    }
    float _1246 = _856;
    float _1248 = fma(_990, _1172, _1240);
    float _1250 = fma(_992, _1172, _1238);
    float _1252 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1244);
    bool _1254 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1258 = fma(_994, _1172, _1242);
    float _1260 = fma(_1000, _1154, _1248);
    float _1262 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1264 = fma(_988, _1154, _1250);
    float _1266 = fma(_1002, _1154, _1258);
    float _1268 = fma(_1016, _1140, _1260);
    float _1270 = _782 + _1262;
    float _1272 = fma(_1030, _1140, _1264);
    float _1274 = fma(_1032, _1140, _1266);
    float _1276 = fma(_1034, _1118, _1268);
    float _1278 = _1268;
    if (!_1254)
    {
        _1278 = _1270;
    }
    float _1280 = _1278;
    bool _1282 = !_1254;
    float _1284 = _1280;
    if (!_1282)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1290 = _1216 + _1288;
        float _1292 = rsqrt(_1202);
        float _1294 = _1290 * _1286;
        float _1296 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = _1294 * 0.15915493667125701904296875;
        float _1300 = _1298 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1298 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = _1302 + (-1.0);
        float _1310 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = fma(_1306, _1296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1314 = fma(_1270, _1302, _1310);
        float _1316 = _1292 * _1312;
        float _1318 = fma(_1190, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1320 = fma(_1178, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1284 = _1314;
        _1208 = _1318;
        _1210 = _1320;
    }
    float _1322 = _1284;
    float _1324 = _1208;
    float _1326 = _1210;
    float _1328 = -_916;
    float _1330 = _1328 + _1322;
    float _1332 = fma(_1036, _1118, _1272);
    float _1334 = -_920;
    float _1336 = _1334 + _1324;
    float _1338 = -_938;
    float _1340 = _1338 + _1326;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1330 + _1342;
    float _1346 = fma(_1038, _1118, _1274);
    float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1350 = _1336 + _1348;
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1198, _1094, _1276);
    float _1358 = fma(_1200, _1094, _1332);
    float _1360 = fma(_1204, _1094, _1346);
    float _1362 = fma(_1350, _1350, _1354);
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1366 = _1340 + _1364;
    float _1368 = _868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1370 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1356);
    float _1372 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1358);
    float _1374 = fma(_1366, _1366, _1362);
    float _1376 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1360);
    float _1378 = _1368 * _1256;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1382 = sqrt(_1374);
    float _1384 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1390 = _1384 * _1352;
    float _1392 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1390;
    out.m_57.y = _1378;
    float _1398 = -_938;
    float _1400 = _790 + _1398;
    float _1402 = -_920;
    float _1404 = _784 + _1402;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1406 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1408 = isnan(_1382);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1414 = _1410 || _1412;
    float _1416 = -_916;
    float _1418 = _782 + _1416;
    out.m_61.w = _896;
    out.m_63.x = _1392;
    out.m_63.y = _1394;
    out.m_63.z = _1396;
    out.m_65.x = _1056;
    if (!_1414)
    {
        _858 = 1.0;
    }
    float _1420 = _858;
    bool _1422 = !_1414;
    float _1424 = _1420;
    if (!_1422)
    {
        bool _1426 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1428 = isnan(_1382);
        bool _1430 = _1426 || _1428;
        bool _1432 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1434 = _1430 || _1432;
        if (!_1434)
        {
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = _1382 + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1448 = 1.0 / _1442;
            float _1450 = _1438 * _1448;
            float _1452 = fma(_1450, _1446, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1424 = _1452;
            _1454 = true;
        }
        else
        {
            bool _1456 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1458 = isnan(_1382);
            bool _1460 = _1456 || _1458;
            bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1464 = _1460 || _1462;
            if (!_1464)
            {
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1382 + _1466;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1478 = 1.0 / _1472;
                float _1480 = _1468 * _1478;
                float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1424 = _1482;
                _1454 = true;
            }
            else
            {
                _1424 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1454 = false;
    float _1484 = _1424;
    float _1486 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_67.x = _1404;
    out.m_67.y = _1418;
    out.m_67.z = _1400;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1490 = _1330 + _1488;
    float _1492 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1486);
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1496 = _1340 + _1494;
    bool _1498 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(0.5);
    bool _1506 = _1502 || _1504;
    float _1508 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1510 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1492);
    float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1514 = _1336 + _1512;
    float _1516 = fma(_1490, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1518 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1508);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1522 = fma(_1514, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1524 = fma(_1496, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1526 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1518);
    float _1528 = 1.0 / _1520;
    float _1530 = _1484;
    float _1532 = _1514;
    float _1534 = _1510;
    if (_1506)
    {
        _1530 = _1522;
    }
    float _1536 = _1530;
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1540 = _1536;
    if (_1506)
    {
        _1532 = _1516;
    }
    float _1542 = _1532;
    float _1544 = _1542;
    if (_1506)
    {
        _1534 = _1524;
    }
    float _1546 = _1534;
    float _1548 = _1546;
    if (!_1506)
    {
        float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1552 = _1418 + _1550;
        float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1556 = _1404 + _1554;
        float _1558 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1560 = _1552 * _1552;
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1564 = _1400 + _1562;
        float _1566 = fma(_1556, _1556, _1560);
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = fma(_1564, _1564, _1566);
        float _1572 = sqrt(_1570);
        float _1574 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1576 = -_1418;
        float _1578 = _1576 + _1516;
        float _1580 = precise::min(_1572, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1582 = _1580 * _1568;
        float _1584 = -_1404;
        float _1586 = _1584 + _1522;
        float _1588 = _1574 * _1582;
        float _1590 = -_1400;
        float _1592 = _1590 + _1524;
        float _1594 = fma(_1586, _1588, _1404);
        float _1596 = fma(_1578, _1588, _1418);
        float _1598 = fma(_1592, _1588, _1400);
        _1544 = _1596;
        _1540 = _1594;
        _1548 = _1598;
    }
    float _1600 = _1544;
    float _1602 = _1540;
    float _1604 = _1548;
    float _1606 = _1538 + _1520;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1610 = _1606 * _1528;
    float _1612 = _1610 * 0.5;
    float _1614 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1608);
    bool _1618 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1628);
    float _1632 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1614);
    float _1634 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1636 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1638 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1640 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1642 = 1.0 / _1630;
    float _1644 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1636);
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1638);
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1658 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1660 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1652);
    float _1664 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1666 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1656);
    float _1668 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1658);
    float _1670 = _1652;
    float _1672 = _1648;
    if (_1626)
    {
        _1670 = 1.0;
    }
    float _1674 = _1670;
    float _1676 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1650);
    float _1678 = _1674;
    if (_1626)
    {
        _1672 = 1.0;
    }
    float _1680 = _1672;
    float _1682 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1686 = _1642 * _1684;
    float _1688 = _1680;
    if (!_1626)
    {
        float _1690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1692 = _1690 * 0.15915493667125701904296875;
        float _1694 = _1692 * 6.283185482025146484375;
        float _1696 = cos(_1694);
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1692 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = 1.0 / _1696;
        float _1708 = _1700 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = _1700 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1720 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1718;
        float _1722 = _1710 * _1712;
        float _1724 = 1.0 / _1720;
        float _1726 = 1.0 / _1722;
        float _1728 = _1716 * _1726;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1732 = fma(_1686, _1728, _1730);
        float _1734 = _1732 * _1724;
        float _1736 = precise::clamp(_1734, 0.0, 1.0);
        _1678 = _1736;
    }
    float _1738 = _1678;
    if (!_1626)
    {
        float _1740 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1742 = _1740 * 0.15915493667125701904296875;
        float _1744 = _1742 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1750 = _1748 * 0.15915493667125701904296875;
        float _1752 = _1742 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        float _1756 = 1.0 / _1746;
        float _1758 = _1750 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = _1750 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = _1760 * _1762;
        float _1770 = 1.0 / _1768;
        float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1774 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1772;
        float _1776 = 1.0 / _1774;
        float _1778 = _1766 * _1770;
        float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1782 = fma(_1686, _1778, _1780);
        float _1784 = _1782 * _1776;
        float _1786 = precise::clamp(_1784, 0.0, 1.0);
        float _1788 = -_1786;
        float _1790 = _1788 + 1.0;
        _1688 = _1790;
    }
    float _1792 = _1688;
    float _1794 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1662);
    float _1798 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1666);
    float _1800 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    bool _1802 = _1738 > 0.0;
    bool _1804 = isnan(_1738);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.0);
    bool _1810 = _1806 || _1808;
    float _1812 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1664);
    float _1814 = _1738 * _1792;
    float _1816 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1796);
    float _1818 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1800);
    float _1820 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1798);
    bool _1822 = _1792 <= 0.0;
    bool _1824 = !_1810;
    bool _1826 = _1822 || _1824;
    float _1828 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1812);
    float _1830 = _1816 + _1818;
    float _1832 = _1820 + _1818;
    float _1834 = _1818 * 0.5;
    float _1836 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1838 = _1830 * 0.5;
    float _1840 = _1832 * 0.5;
    float _1842 = fma(_1828, -0.5, _1834);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1602;
    out.m_69.y = _1600;
    out.m_69.z = _1604;
    out.gl_Position.x = _1816;
    out.gl_Position.y = _1828;
    out.gl_Position.z = _1820;
    out.gl_Position.w = _1818;
    out.m_71.x = _1838;
    out.m_71.y = _1842;
    out.m_71.z = _1840;
    out.m_71.w = _1818;
    out.m_37.x = _1844;
    if (!_1826)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_37.x = 0.0;
    float _1846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1846;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1454 = false;
    bool _696 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_34.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_37.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_106);
        out.gl_Position.z = _1903;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_39.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_37.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_142);
        out.gl_Position.z = _1972;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_39.x;
    float _146 = in.m_39.y;
    float _148 = in.m_39.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_34.x;
    float _164 = in.m_34.y;
    float _166 = in.m_34.z;
    float _168 = in.m_41.x;
    float _170 = in.m_41.y;
    float _172 = in.m_41.z;
    float _174 = in.m_41.w;
    float _176 = 0.0;
    float _178 = _150;
    if (!_160)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_160;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _144, _254);
    float _262 = fma(_250, _146, _256);
    float _264 = fma(_250, _148, _258);
    float _266 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = fma(_260, _174, _162);
    float _270 = fma(_262, _174, _164);
    float _272 = fma(_264, _174, _166);
    float _274 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _278 = !_252;
    float _296;
    if (!_278)
    {
        float _280 = in.m_43.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_90);
        float _302 = 1.0 / _300;
        float _304 = _124 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _328 = 1.0 / _314;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _338 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _340 = isnan(_306);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _352 = isnan(_306);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _322;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = _306 + _364;
    bool _368 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _370 = isnan(_306);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _382 = isnan(_306);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = 1.0 / _326;
    float _394 = _366 * _328;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _398 = _306 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = 1.0 / _318;
    float _406 = _398 * _362;
    bool _408 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _410 = isnan(_306);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _422 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _424 = isnan(_306);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _436 = 1.0 / _336;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _306 + _438;
    float _442 = 1.0 / _332;
    float _444 = _440 * _404;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _448 = _306 + _446;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _454;
    float _458 = _348 * _452;
    float _460 = _448 * _436;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _464 = _306 + _462;
    float _466 = -_348;
    float _468 = _466 + 1.0;
    float _470 = fma(_456, _394, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _472 = _464 * _392;
    float _474 = _360 * _468;
    float _476 = _310 * _442;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _486 = -_432;
    float _488 = _486 + 1.0;
    float _490 = fma(_480, _394, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _492 = -_360;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _504 = fma(_484, _444, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _506 = _432 * _494;
    bool _508 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_306);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _378 * _488;
    float _522 = -_378;
    float _524 = _522 + 1.0;
    float _526 = fma(_498, _444, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _528 = fma(_502, _444, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _530 = -_518;
    float _532 = _530 + 1.0;
    float _534 = _518 * _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _544;
    float _548 = _390 * _532;
    float _550 = fma(_538, _476, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _552 = fma(_542, _476, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _554 = fma(_546, _476, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _556 = _470 * _548;
    float _558 = _490 * _548;
    float _560 = -_390;
    float _562 = _560 + 1.0;
    float _564 = _420 * _548;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _578 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].x, _556);
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].y, _558);
    float _582 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].z, _564);
    float _584 = fma(_568, _460, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _586 = fma(_572, _460, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _588 = fma(_576, _460, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _590 = fma(_526, _534, _578);
    float _592 = fma(_504, _534, _580);
    float _594 = fma(_528, _534, _582);
    float _596 = fma(_550, _520, _590);
    float _598 = fma(_552, _520, _592);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _604;
    float _608 = fma(_554, _520, _594);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _610;
    float _614 = fma(_584, _506, _596);
    float _616 = fma(_586, _506, _598);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _626 = fma(_602, _406, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _628 = fma(_606, _406, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _630 = fma(_612, _406, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _636 = fma(_588, _506, _608);
    float _638 = fma(_620, _472, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _640 = fma(_624, _472, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _642 = fma(_634, _472, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _644 = fma(_626, _474, _614);
    float _646 = fma(_628, _474, _616);
    float _648 = fma(_630, _474, _636);
    float _650 = fma(_638, _458, _644);
    float _652 = fma(_640, _458, _646);
    float _654 = fma(_642, _458, _648);
    float _656 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].x, _650);
    float _658 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].y, _652);
    float _660 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].z, _654);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _670 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _670;
    out.m_45.y = _672;
    out.m_45.z = _674;
    out.m_45.w = _662;
    bool _676 = !_434;
    float _694;
    if (!_676)
    {
        float _678 = in.m_43.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_90);
        float _700 = 1.0 / _698;
        float _702 = _124 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = in.m_47.x;
    float _708 = in.m_47.y;
    float _710 = in.m_47.z;
    float _712 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = in.m_49.x;
    float _716 = in.m_49.y;
    float _718 = in.m_49.z;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _728 = in.m_51.x;
    float _730 = in.m_51.y;
    float _732 = in.m_51.z;
    float _734 = 1.0 / _726;
    float _736 = in.m_53.y;
    float _738 = in.m_43.y;
    float _740 = 1.0 / _722;
    float _742 = in.m_53.x;
    bool _744 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _746 = isnan(_704);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _270 * _708;
    float _758 = -_754;
    float _760 = _758 + 1.0;
    float _762 = _270 * _716;
    float _764 = fma(_268, _706, _756);
    float _766 = _270 * _730;
    float _768 = fma(_268, _714, _762);
    float _770 = fma(_268, _728, _766);
    float _772 = fma(_272, _710, _764);
    float _774 = fma(_272, _718, _768);
    float _776 = -_736;
    float _778 = _776 + 1.0;
    float _780 = fma(_272, _732, _770);
    float _782 = _772 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _784 = _774 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _786;
    float _790 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _782 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _798 = _784 + _796;
    float _800 = in.m_55.x;
    float _802 = in.m_55.y;
    float _804 = in.m_55.z;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _808 = _790 + _806;
    float _810 = _794 * _794;
    float _812 = 1.0 / _788;
    bool _814 = _738 > 0.5;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _820 = fma(_798, _798, _810);
    float _822 = fma(_808, _808, _820);
    float _824 = 1.0 / _818;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _832 = _830 != 0;
    float _834 = sqrt(_822);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _836;
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _800);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _802);
    float _844 = _712 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _846 = rsqrt(_822);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _852 = _774;
    float _854 = _736;
    float _856 = _742;
    float _858 = _790;
    if (_828)
    {
        float _860 = in.m_43.x;
        _852 = _860;
    }
    float _862 = _852;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _804);
    if (_832)
    {
        float _866 = _814 ? _778 : _736;
        _854 = _866;
    }
    float _868 = _854;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _872 = _704 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _876 = _704 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _880 = _704 + _878;
    float _882 = 1.0 / _838;
    float _884 = _834 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _886 = _872 * _734;
    float _888 = _876 * _740;
    float _890 = _880 * _812;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _894 = _704 + _892;
    float _896 = precise::min(_844, _884);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _900 = _704 + _898;
    float _902 = 1.0 / _850;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _906 = _704 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _908;
    float _912 = _846 * _896;
    float _914 = _900 * _824;
    float _916 = _794 * _912;
    float _918 = _894 * _882;
    float _920 = _798 * _912;
    bool _922 = _862 > 0.5;
    bool _924 = _922 && _828;
    float _926 = -_916;
    float _928 = _794 + _926;
    float _930 = -_920;
    float _932 = _798 + _930;
    float _934 = _928 * _928;
    float _936 = _906 * _902;
    float _938 = _808 * _912;
    float _940 = fma(_932, _932, _934);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _942;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _946;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _950;
    float _954 = -_938;
    float _956 = _808 + _954;
    float _958 = fma(_944, _888, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _960 = fma(_948, _888, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _962 = fma(_952, _888, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _964 = fma(_956, _956, _940);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = sqrt(_964);
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _984;
    float _988 = fma(_972, _890, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _990 = fma(_976, _886, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _992 = fma(_982, _886, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _994 = fma(_968, _886, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1000 = fma(_986, _890, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1002 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1012;
    float _1016 = fma(_998, _914, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1018 = _846 * _978;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1024;
    float _1028 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1030 = fma(_1006, _914, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1032 = fma(_1010, _914, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1034 = fma(_1022, _918, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1036 = fma(_1014, _918, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1038 = fma(_1026, _918, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1040 = _1028 * _1018;
    float _1042 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1044 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1046 = isnan(_704);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = _712 * _1018;
    float _1058 = _1040 * _842;
    float _1060 = _1042 * _1018;
    bool _1062 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1064 = isnan(_704);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = -_1054;
    float _1076 = _1074 + 1.0;
    float _1078 = _1056 * _840;
    float _1080 = _1060 * _864;
    bool _1082 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1084 = isnan(_704);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1072 * _1076;
    float _1096 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1098 = -_1072;
    float _1100 = _1098 + 1.0;
    float _1102 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1104 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1106 = isnan(_704);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1096);
    float _1118 = _1092 * _1100;
    float _1120 = -_1092;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1102);
    float _1126 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1116);
    bool _1128 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1130 = isnan(_704);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = _1114 * _1122;
    float _1142 = -_1114;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1124);
    float _1148 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1150 = -_1138;
    float _1152 = _1150 + 1.0;
    float _1154 = _1138 * _1144;
    float _1156 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1158 = _790 + _1148;
    bool _1160 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1162 = isnan(_704);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _754 * _1152;
    float _1174 = _784 + _1156;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1178 = _1158 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1174 + _1188;
    float _1192 = _1178 * _1178;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1198 = fma(_1182, _936, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1200 = fma(_1186, _936, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1202 = fma(_1190, _1190, _1192);
    float _1204 = fma(_1196, _936, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1206 = _1156;
    float _1208 = _1174;
    float _1210 = _1158;
    if (_828)
    {
        _1206 = _742;
    }
    float _1212 = _1206;
    float _1214 = _1170 * _760;
    float _1216 = sqrt(_1202);
    float _1218 = -_1170;
    float _1220 = _1218 + 1.0;
    float _1222 = _962 * _1214;
    float _1224 = _958 * _1214;
    float _1226 = _960 * _1214;
    float _1228 = _1212;
    if (_924)
    {
        float _1230 = -_1212;
        float _1232 = _1230 + 1.0;
        _1228 = _1232;
    }
    float _1234 = _1228;
    float _1236 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1224);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1222);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1226);
    float _1244 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1236);
    if (_828)
    {
        _856 = _1234;
    }
    float _1246 = _856;
    float _1248 = fma(_990, _1172, _1240);
    float _1250 = fma(_992, _1172, _1238);
    float _1252 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1244);
    bool _1254 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1258 = fma(_994, _1172, _1242);
    float _1260 = fma(_1000, _1154, _1248);
    float _1262 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1264 = fma(_988, _1154, _1250);
    float _1266 = fma(_1002, _1154, _1258);
    float _1268 = fma(_1016, _1140, _1260);
    float _1270 = _782 + _1262;
    float _1272 = fma(_1030, _1140, _1264);
    float _1274 = fma(_1032, _1140, _1266);
    float _1276 = fma(_1034, _1118, _1268);
    float _1278 = _1268;
    if (!_1254)
    {
        _1278 = _1270;
    }
    float _1280 = _1278;
    bool _1282 = !_1254;
    float _1284 = _1280;
    if (!_1282)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1290 = _1216 + _1288;
        float _1292 = rsqrt(_1202);
        float _1294 = _1290 * _1286;
        float _1296 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = _1294 * 0.15915493667125701904296875;
        float _1300 = _1298 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1298 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = _1302 + (-1.0);
        float _1310 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = fma(_1306, _1296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1314 = fma(_1270, _1302, _1310);
        float _1316 = _1292 * _1312;
        float _1318 = fma(_1190, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1320 = fma(_1178, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1284 = _1314;
        _1208 = _1318;
        _1210 = _1320;
    }
    float _1322 = _1284;
    float _1324 = _1208;
    float _1326 = _1210;
    float _1328 = -_916;
    float _1330 = _1328 + _1322;
    float _1332 = fma(_1036, _1118, _1272);
    float _1334 = -_920;
    float _1336 = _1334 + _1324;
    float _1338 = -_938;
    float _1340 = _1338 + _1326;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1330 + _1342;
    float _1346 = fma(_1038, _1118, _1274);
    float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1350 = _1336 + _1348;
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1198, _1094, _1276);
    float _1358 = fma(_1200, _1094, _1332);
    float _1360 = fma(_1204, _1094, _1346);
    float _1362 = fma(_1350, _1350, _1354);
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1366 = _1340 + _1364;
    float _1368 = _868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1370 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1356);
    float _1372 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1358);
    float _1374 = fma(_1366, _1366, _1362);
    float _1376 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1360);
    float _1378 = _1368 * _1256;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1382 = sqrt(_1374);
    float _1384 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1390 = _1384 * _1352;
    float _1392 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1390;
    out.m_57.y = _1378;
    float _1398 = -_938;
    float _1400 = _790 + _1398;
    float _1402 = -_920;
    float _1404 = _784 + _1402;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1406 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1408 = isnan(_1382);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1414 = _1410 || _1412;
    float _1416 = -_916;
    float _1418 = _782 + _1416;
    out.m_61.w = _896;
    out.m_63.x = _1392;
    out.m_63.y = _1394;
    out.m_63.z = _1396;
    out.m_65.x = _1056;
    if (!_1414)
    {
        _858 = 1.0;
    }
    float _1420 = _858;
    bool _1422 = !_1414;
    float _1424 = _1420;
    if (!_1422)
    {
        bool _1426 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1428 = isnan(_1382);
        bool _1430 = _1426 || _1428;
        bool _1432 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1434 = _1430 || _1432;
        if (!_1434)
        {
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = _1382 + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1448 = 1.0 / _1442;
            float _1450 = _1438 * _1448;
            float _1452 = fma(_1450, _1446, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1424 = _1452;
            _1454 = true;
        }
        else
        {
            bool _1456 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1458 = isnan(_1382);
            bool _1460 = _1456 || _1458;
            bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1464 = _1460 || _1462;
            if (!_1464)
            {
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1382 + _1466;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1478 = 1.0 / _1472;
                float _1480 = _1468 * _1478;
                float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1424 = _1482;
                _1454 = true;
            }
            else
            {
                _1424 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1454 = false;
    float _1484 = _1424;
    float _1486 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_67.x = _1404;
    out.m_67.y = _1418;
    out.m_67.z = _1400;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1490 = _1330 + _1488;
    float _1492 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1486);
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1496 = _1340 + _1494;
    bool _1498 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(0.5);
    bool _1506 = _1502 || _1504;
    float _1508 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1510 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1492);
    float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1514 = _1336 + _1512;
    float _1516 = fma(_1490, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1518 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1508);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1522 = fma(_1514, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1524 = fma(_1496, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1526 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1518);
    float _1528 = 1.0 / _1520;
    float _1530 = _1484;
    float _1532 = _1514;
    float _1534 = _1510;
    if (_1506)
    {
        _1530 = _1522;
    }
    float _1536 = _1530;
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1540 = _1536;
    if (_1506)
    {
        _1532 = _1516;
    }
    float _1542 = _1532;
    float _1544 = _1542;
    if (_1506)
    {
        _1534 = _1524;
    }
    float _1546 = _1534;
    float _1548 = _1546;
    if (!_1506)
    {
        float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1552 = _1418 + _1550;
        float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1556 = _1404 + _1554;
        float _1558 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1560 = _1552 * _1552;
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1564 = _1400 + _1562;
        float _1566 = fma(_1556, _1556, _1560);
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = fma(_1564, _1564, _1566);
        float _1572 = sqrt(_1570);
        float _1574 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1576 = -_1418;
        float _1578 = _1576 + _1516;
        float _1580 = precise::min(_1572, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1582 = _1580 * _1568;
        float _1584 = -_1404;
        float _1586 = _1584 + _1522;
        float _1588 = _1574 * _1582;
        float _1590 = -_1400;
        float _1592 = _1590 + _1524;
        float _1594 = fma(_1586, _1588, _1404);
        float _1596 = fma(_1578, _1588, _1418);
        float _1598 = fma(_1592, _1588, _1400);
        _1544 = _1596;
        _1540 = _1594;
        _1548 = _1598;
    }
    float _1600 = _1544;
    float _1602 = _1540;
    float _1604 = _1548;
    float _1606 = _1538 + _1520;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1610 = _1606 * _1528;
    float _1612 = _1610 * 0.5;
    float _1614 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1608);
    bool _1618 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1628);
    float _1632 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1614);
    float _1634 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1636 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1638 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1640 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1642 = 1.0 / _1630;
    float _1644 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1636);
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1638);
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1658 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1660 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1652);
    float _1664 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1666 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1656);
    float _1668 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1658);
    float _1670 = _1652;
    float _1672 = _1648;
    if (_1626)
    {
        _1670 = 1.0;
    }
    float _1674 = _1670;
    float _1676 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1650);
    float _1678 = _1674;
    if (_1626)
    {
        _1672 = 1.0;
    }
    float _1680 = _1672;
    float _1682 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1686 = _1642 * _1684;
    float _1688 = _1680;
    if (!_1626)
    {
        float _1690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1692 = _1690 * 0.15915493667125701904296875;
        float _1694 = _1692 * 6.283185482025146484375;
        float _1696 = cos(_1694);
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1692 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = 1.0 / _1696;
        float _1708 = _1700 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = _1700 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1720 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1718;
        float _1722 = _1710 * _1712;
        float _1724 = 1.0 / _1720;
        float _1726 = 1.0 / _1722;
        float _1728 = _1716 * _1726;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1732 = fma(_1686, _1728, _1730);
        float _1734 = _1732 * _1724;
        float _1736 = precise::clamp(_1734, 0.0, 1.0);
        _1678 = _1736;
    }
    float _1738 = _1678;
    if (!_1626)
    {
        float _1740 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1742 = _1740 * 0.15915493667125701904296875;
        float _1744 = _1742 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1750 = _1748 * 0.15915493667125701904296875;
        float _1752 = _1742 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        float _1756 = 1.0 / _1746;
        float _1758 = _1750 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = _1750 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = _1760 * _1762;
        float _1770 = 1.0 / _1768;
        float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1774 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1772;
        float _1776 = 1.0 / _1774;
        float _1778 = _1766 * _1770;
        float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1782 = fma(_1686, _1778, _1780);
        float _1784 = _1782 * _1776;
        float _1786 = precise::clamp(_1784, 0.0, 1.0);
        float _1788 = -_1786;
        float _1790 = _1788 + 1.0;
        _1688 = _1790;
    }
    float _1792 = _1688;
    float _1794 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1662);
    float _1798 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1666);
    float _1800 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    bool _1802 = _1738 > 0.0;
    bool _1804 = isnan(_1738);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.0);
    bool _1810 = _1806 || _1808;
    float _1812 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1664);
    float _1814 = _1738 * _1792;
    float _1816 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1796);
    float _1818 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1800);
    float _1820 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1798);
    bool _1822 = _1792 <= 0.0;
    bool _1824 = !_1810;
    bool _1826 = _1822 || _1824;
    float _1828 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1812);
    float _1830 = _1816 + _1818;
    float _1832 = _1820 + _1818;
    float _1834 = _1818 * 0.5;
    float _1836 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1838 = _1830 * 0.5;
    float _1840 = _1832 * 0.5;
    float _1842 = fma(_1828, -0.5, _1834);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1602;
    out.m_69.y = _1600;
    out.m_69.z = _1604;
    out.gl_Position.x = _1816;
    out.gl_Position.y = _1828;
    out.gl_Position.z = _1820;
    out.gl_Position.w = _1818;
    out.m_71.x = _1838;
    out.m_71.y = _1842;
    out.m_71.z = _1840;
    out.m_71.w = _1818;
    out.m_37.x = _1844;
    if (!_1826)
    {
        return out;
    }
    out.m_37.x = 0.0;
    float _1846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1846;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1454 = false;
    bool _696 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_34.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_37.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_106);
        out.gl_Position.z = _1903;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_39.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_37.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1972 = as_type<float>(_142);
        out.gl_Position.z = _1972;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_39.x;
    float _146 = in.m_39.y;
    float _148 = in.m_39.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_34.x;
    float _164 = in.m_34.y;
    float _166 = in.m_34.z;
    float _168 = in.m_41.x;
    float _170 = in.m_41.y;
    float _172 = in.m_41.z;
    float _174 = in.m_41.w;
    float _176 = 0.0;
    float _178 = _150;
    if (!_160)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_160;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _144, _254);
    float _262 = fma(_250, _146, _256);
    float _264 = fma(_250, _148, _258);
    float _266 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = fma(_260, _174, _162);
    float _270 = fma(_262, _174, _164);
    float _272 = fma(_264, _174, _166);
    float _274 = _168 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _278 = !_252;
    float _296;
    if (!_278)
    {
        float _280 = in.m_43.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_90);
        float _302 = 1.0 / _300;
        float _304 = _124 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _310 = _306 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _328 = 1.0 / _314;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _338 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _340 = isnan(_306);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _352 = isnan(_306);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _322;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = _306 + _364;
    bool _368 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _370 = isnan(_306);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    bool _380 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _382 = isnan(_306);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = 1.0 / _326;
    float _394 = _366 * _328;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _398 = _306 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = 1.0 / _318;
    float _406 = _398 * _362;
    bool _408 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _410 = isnan(_306);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _422 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _424 = isnan(_306);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _436 = 1.0 / _336;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _306 + _438;
    float _442 = 1.0 / _332;
    float _444 = _440 * _404;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _448 = _306 + _446;
    float _450 = -_418;
    float _452 = _450 + 1.0;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _454;
    float _458 = _348 * _452;
    float _460 = _448 * _436;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _464 = _306 + _462;
    float _466 = -_348;
    float _468 = _466 + 1.0;
    float _470 = fma(_456, _394, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _472 = _464 * _392;
    float _474 = _360 * _468;
    float _476 = _310 * _442;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _486 = -_432;
    float _488 = _486 + 1.0;
    float _490 = fma(_480, _394, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _492 = -_360;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _504 = fma(_484, _444, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _506 = _432 * _494;
    bool _508 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _510 = isnan(_306);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _378 * _488;
    float _522 = -_378;
    float _524 = _522 + 1.0;
    float _526 = fma(_498, _444, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _528 = fma(_502, _444, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _530 = -_518;
    float _532 = _530 + 1.0;
    float _534 = _518 * _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _540;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _544;
    float _548 = _390 * _532;
    float _550 = fma(_538, _476, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _552 = fma(_542, _476, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _554 = fma(_546, _476, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _556 = _470 * _548;
    float _558 = _490 * _548;
    float _560 = -_390;
    float _562 = _560 + 1.0;
    float _564 = _420 * _548;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _578 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].x, _556);
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].y, _558);
    float _582 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[107].z, _564);
    float _584 = fma(_568, _460, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _586 = fma(_572, _460, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _588 = fma(_576, _460, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _590 = fma(_526, _534, _578);
    float _592 = fma(_504, _534, _580);
    float _594 = fma(_528, _534, _582);
    float _596 = fma(_550, _520, _590);
    float _598 = fma(_552, _520, _592);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _604;
    float _608 = fma(_554, _520, _594);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _610;
    float _614 = fma(_584, _506, _596);
    float _616 = fma(_586, _506, _598);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _626 = fma(_602, _406, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _628 = fma(_606, _406, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _630 = fma(_612, _406, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _636 = fma(_588, _506, _608);
    float _638 = fma(_620, _472, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _640 = fma(_624, _472, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _642 = fma(_634, _472, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _644 = fma(_626, _474, _614);
    float _646 = fma(_628, _474, _616);
    float _648 = fma(_630, _474, _636);
    float _650 = fma(_638, _458, _644);
    float _652 = fma(_640, _458, _646);
    float _654 = fma(_642, _458, _648);
    float _656 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].x, _650);
    float _658 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].y, _652);
    float _660 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[113].z, _654);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _670 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_45.x = _670;
    out.m_45.y = _672;
    out.m_45.z = _674;
    out.m_45.w = _662;
    bool _676 = !_434;
    float _694;
    if (!_676)
    {
        float _678 = in.m_43.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_90);
        float _700 = 1.0 / _698;
        float _702 = _124 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = in.m_47.x;
    float _708 = in.m_47.y;
    float _710 = in.m_47.z;
    float _712 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = in.m_49.x;
    float _716 = in.m_49.y;
    float _718 = in.m_49.z;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _720;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _728 = in.m_51.x;
    float _730 = in.m_51.y;
    float _732 = in.m_51.z;
    float _734 = 1.0 / _726;
    float _736 = in.m_53.y;
    float _738 = in.m_43.y;
    float _740 = 1.0 / _722;
    float _742 = in.m_53.x;
    bool _744 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _746 = isnan(_704);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _270 * _708;
    float _758 = -_754;
    float _760 = _758 + 1.0;
    float _762 = _270 * _716;
    float _764 = fma(_268, _706, _756);
    float _766 = _270 * _730;
    float _768 = fma(_268, _714, _762);
    float _770 = fma(_268, _728, _766);
    float _772 = fma(_272, _710, _764);
    float _774 = fma(_272, _718, _768);
    float _776 = -_736;
    float _778 = _776 + 1.0;
    float _780 = fma(_272, _732, _770);
    float _782 = _772 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _784 = _774 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _786;
    float _790 = _780 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _782 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _798 = _784 + _796;
    float _800 = in.m_55.x;
    float _802 = in.m_55.y;
    float _804 = in.m_55.z;
    float _806 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _808 = _790 + _806;
    float _810 = _794 * _794;
    float _812 = 1.0 / _788;
    bool _814 = _738 > 0.5;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _820 = fma(_798, _798, _810);
    float _822 = fma(_808, _808, _820);
    float _824 = 1.0 / _818;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _832 = _830 != 0;
    float _834 = sqrt(_822);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _836;
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _800);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _802);
    float _844 = _712 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _846 = rsqrt(_822);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _852 = _774;
    float _854 = _736;
    float _856 = _742;
    float _858 = _790;
    if (_828)
    {
        float _860 = in.m_43.x;
        _852 = _860;
    }
    float _862 = _852;
    float _864 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _804);
    if (_832)
    {
        float _866 = _814 ? _778 : _736;
        _854 = _866;
    }
    float _868 = _854;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _872 = _704 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _876 = _704 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _880 = _704 + _878;
    float _882 = 1.0 / _838;
    float _884 = _834 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _886 = _872 * _734;
    float _888 = _876 * _740;
    float _890 = _880 * _812;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _894 = _704 + _892;
    float _896 = precise::min(_844, _884);
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _900 = _704 + _898;
    float _902 = 1.0 / _850;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _906 = _704 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _908;
    float _912 = _846 * _896;
    float _914 = _900 * _824;
    float _916 = _794 * _912;
    float _918 = _894 * _882;
    float _920 = _798 * _912;
    bool _922 = _862 > 0.5;
    bool _924 = _922 && _828;
    float _926 = -_916;
    float _928 = _794 + _926;
    float _930 = -_920;
    float _932 = _798 + _930;
    float _934 = _928 * _928;
    float _936 = _906 * _902;
    float _938 = _808 * _912;
    float _940 = fma(_932, _932, _934);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _942;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _946;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _950;
    float _954 = -_938;
    float _956 = _808 + _954;
    float _958 = fma(_944, _888, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _960 = fma(_948, _888, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _962 = fma(_952, _888, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _964 = fma(_956, _956, _940);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = sqrt(_964);
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _984;
    float _988 = fma(_972, _890, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _990 = fma(_976, _886, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _992 = fma(_982, _886, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _994 = fma(_968, _886, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1000 = fma(_986, _890, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1002 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1012;
    float _1016 = fma(_998, _914, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1018 = _846 * _978;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1024;
    float _1028 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1030 = fma(_1006, _914, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1032 = fma(_1010, _914, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1034 = fma(_1022, _918, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1036 = fma(_1014, _918, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1038 = fma(_1026, _918, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1040 = _1028 * _1018;
    float _1042 = _276 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1044 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1046 = isnan(_704);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1052 = _1048 || _1050;
    float _1054 = float(_1052);
    float _1056 = _712 * _1018;
    float _1058 = _1040 * _842;
    float _1060 = _1042 * _1018;
    bool _1062 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1064 = isnan(_704);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = -_1054;
    float _1076 = _1074 + 1.0;
    float _1078 = _1056 * _840;
    float _1080 = _1060 * _864;
    bool _1082 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1084 = isnan(_704);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = _1072 * _1076;
    float _1096 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1098 = -_1072;
    float _1100 = _1098 + 1.0;
    float _1102 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1104 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1106 = isnan(_704);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1096);
    float _1118 = _1092 * _1100;
    float _1120 = -_1092;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1102);
    float _1126 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1116);
    bool _1128 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1130 = isnan(_704);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = _1114 * _1122;
    float _1142 = -_1114;
    float _1144 = _1142 + 1.0;
    float _1146 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1124);
    float _1148 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1150 = -_1138;
    float _1152 = _1150 + 1.0;
    float _1154 = _1138 * _1144;
    float _1156 = _1146 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1158 = _790 + _1148;
    bool _1160 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1162 = isnan(_704);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _754 * _1152;
    float _1174 = _784 + _1156;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1178 = _1158 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1174 + _1188;
    float _1192 = _1178 * _1178;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1198 = fma(_1182, _936, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1200 = fma(_1186, _936, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1202 = fma(_1190, _1190, _1192);
    float _1204 = fma(_1196, _936, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1206 = _1156;
    float _1208 = _1174;
    float _1210 = _1158;
    if (_828)
    {
        _1206 = _742;
    }
    float _1212 = _1206;
    float _1214 = _1170 * _760;
    float _1216 = sqrt(_1202);
    float _1218 = -_1170;
    float _1220 = _1218 + 1.0;
    float _1222 = _962 * _1214;
    float _1224 = _958 * _1214;
    float _1226 = _960 * _1214;
    float _1228 = _1212;
    if (_924)
    {
        float _1230 = -_1212;
        float _1232 = _1230 + 1.0;
        _1228 = _1232;
    }
    float _1234 = _1228;
    float _1236 = _1058 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1238 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1224);
    float _1240 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1222);
    float _1242 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1226);
    float _1244 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1236);
    if (_828)
    {
        _856 = _1234;
    }
    float _1246 = _856;
    float _1248 = fma(_990, _1172, _1240);
    float _1250 = fma(_992, _1172, _1238);
    float _1252 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1244);
    bool _1254 = _1216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1258 = fma(_994, _1172, _1242);
    float _1260 = fma(_1000, _1154, _1248);
    float _1262 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1264 = fma(_988, _1154, _1250);
    float _1266 = fma(_1002, _1154, _1258);
    float _1268 = fma(_1016, _1140, _1260);
    float _1270 = _782 + _1262;
    float _1272 = fma(_1030, _1140, _1264);
    float _1274 = fma(_1032, _1140, _1266);
    float _1276 = fma(_1034, _1118, _1268);
    float _1278 = _1268;
    if (!_1254)
    {
        _1278 = _1270;
    }
    float _1280 = _1278;
    bool _1282 = !_1254;
    float _1284 = _1280;
    if (!_1282)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1290 = _1216 + _1288;
        float _1292 = rsqrt(_1202);
        float _1294 = _1290 * _1286;
        float _1296 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1298 = _1294 * 0.15915493667125701904296875;
        float _1300 = _1298 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1298 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = _1302 + (-1.0);
        float _1310 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = fma(_1306, _1296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1314 = fma(_1270, _1302, _1310);
        float _1316 = _1292 * _1312;
        float _1318 = fma(_1190, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1320 = fma(_1178, _1316, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1284 = _1314;
        _1208 = _1318;
        _1210 = _1320;
    }
    float _1322 = _1284;
    float _1324 = _1208;
    float _1326 = _1210;
    float _1328 = -_916;
    float _1330 = _1328 + _1322;
    float _1332 = fma(_1036, _1118, _1272);
    float _1334 = -_920;
    float _1336 = _1334 + _1324;
    float _1338 = -_938;
    float _1340 = _1338 + _1326;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1330 + _1342;
    float _1346 = fma(_1038, _1118, _1274);
    float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1350 = _1336 + _1348;
    float _1352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1198, _1094, _1276);
    float _1358 = fma(_1200, _1094, _1332);
    float _1360 = fma(_1204, _1094, _1346);
    float _1362 = fma(_1350, _1350, _1354);
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1366 = _1340 + _1364;
    float _1368 = _868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1370 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1356);
    float _1372 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1358);
    float _1374 = fma(_1366, _1366, _1362);
    float _1376 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1360);
    float _1378 = _1368 * _1256;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1382 = sqrt(_1374);
    float _1384 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1390 = _1384 * _1352;
    float _1392 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1390;
    out.m_57.y = _1378;
    float _1398 = -_938;
    float _1400 = _790 + _1398;
    float _1402 = -_920;
    float _1404 = _784 + _1402;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _1406 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1408 = isnan(_1382);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1414 = _1410 || _1412;
    float _1416 = -_916;
    float _1418 = _782 + _1416;
    out.m_61.w = _896;
    out.m_63.x = _1392;
    out.m_63.y = _1394;
    out.m_63.z = _1396;
    out.m_65.x = _1056;
    if (!_1414)
    {
        _858 = 1.0;
    }
    float _1420 = _858;
    bool _1422 = !_1414;
    float _1424 = _1420;
    if (!_1422)
    {
        bool _1426 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1428 = isnan(_1382);
        bool _1430 = _1426 || _1428;
        bool _1432 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1434 = _1430 || _1432;
        if (!_1434)
        {
            float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1438 = _1382 + _1436;
            float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1442 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1440;
            float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1446 = _1444 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1448 = 1.0 / _1442;
            float _1450 = _1438 * _1448;
            float _1452 = fma(_1450, _1446, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1424 = _1452;
            _1454 = true;
        }
        else
        {
            bool _1456 = _1382 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1458 = isnan(_1382);
            bool _1460 = _1456 || _1458;
            bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1464 = _1460 || _1462;
            if (!_1464)
            {
                float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1468 = _1382 + _1466;
                float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1478 = 1.0 / _1472;
                float _1480 = _1468 * _1478;
                float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1424 = _1482;
                _1454 = true;
            }
            else
            {
                _1424 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1454 = false;
    float _1484 = _1424;
    float _1486 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_67.x = _1404;
    out.m_67.y = _1418;
    out.m_67.z = _1400;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1490 = _1330 + _1488;
    float _1492 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1486);
    float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1496 = _1340 + _1494;
    bool _1498 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(0.5);
    bool _1506 = _1502 || _1504;
    float _1508 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1510 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1492);
    float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1514 = _1336 + _1512;
    float _1516 = fma(_1490, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1518 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1508);
    float _1520 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1522 = fma(_1514, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1524 = fma(_1496, _1484, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1526 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1518);
    float _1528 = 1.0 / _1520;
    float _1530 = _1484;
    float _1532 = _1514;
    float _1534 = _1510;
    if (_1506)
    {
        _1530 = _1522;
    }
    float _1536 = _1530;
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1540 = _1536;
    if (_1506)
    {
        _1532 = _1516;
    }
    float _1542 = _1532;
    float _1544 = _1542;
    if (_1506)
    {
        _1534 = _1524;
    }
    float _1546 = _1534;
    float _1548 = _1546;
    if (!_1506)
    {
        float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1552 = _1418 + _1550;
        float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1556 = _1404 + _1554;
        float _1558 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1560 = _1552 * _1552;
        float _1562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1564 = _1400 + _1562;
        float _1566 = fma(_1556, _1556, _1560);
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = fma(_1564, _1564, _1566);
        float _1572 = sqrt(_1570);
        float _1574 = _1558 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1576 = -_1418;
        float _1578 = _1576 + _1516;
        float _1580 = precise::min(_1572, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1582 = _1580 * _1568;
        float _1584 = -_1404;
        float _1586 = _1584 + _1522;
        float _1588 = _1574 * _1582;
        float _1590 = -_1400;
        float _1592 = _1590 + _1524;
        float _1594 = fma(_1586, _1588, _1404);
        float _1596 = fma(_1578, _1588, _1418);
        float _1598 = fma(_1592, _1588, _1400);
        _1544 = _1596;
        _1540 = _1594;
        _1548 = _1598;
    }
    float _1600 = _1544;
    float _1602 = _1540;
    float _1604 = _1548;
    float _1606 = _1538 + _1520;
    float _1608 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1610 = _1606 * _1528;
    float _1612 = _1610 * 0.5;
    float _1614 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1616 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1608);
    bool _1618 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    float _1628 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1628);
    float _1632 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1614);
    float _1634 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1636 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1638 = _1600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1640 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1642 = 1.0 / _1630;
    float _1644 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1636);
    float _1648 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1638);
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1658 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1660 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1652);
    float _1664 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1666 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1656);
    float _1668 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1658);
    float _1670 = _1652;
    float _1672 = _1648;
    if (_1626)
    {
        _1670 = 1.0;
    }
    float _1674 = _1670;
    float _1676 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1650);
    float _1678 = _1674;
    if (_1626)
    {
        _1672 = 1.0;
    }
    float _1680 = _1672;
    float _1682 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1686 = _1642 * _1684;
    float _1688 = _1680;
    if (!_1626)
    {
        float _1690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1692 = _1690 * 0.15915493667125701904296875;
        float _1694 = _1692 * 6.283185482025146484375;
        float _1696 = cos(_1694);
        float _1698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1700 = _1698 * 0.15915493667125701904296875;
        float _1702 = _1692 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = 1.0 / _1696;
        float _1708 = _1700 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = _1704 * _1706;
        float _1714 = _1700 * 6.283185482025146484375;
        float _1716 = sin(_1714);
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1720 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1718;
        float _1722 = _1710 * _1712;
        float _1724 = 1.0 / _1720;
        float _1726 = 1.0 / _1722;
        float _1728 = _1716 * _1726;
        float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1732 = fma(_1686, _1728, _1730);
        float _1734 = _1732 * _1724;
        float _1736 = precise::clamp(_1734, 0.0, 1.0);
        _1678 = _1736;
    }
    float _1738 = _1678;
    if (!_1626)
    {
        float _1740 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1742 = _1740 * 0.15915493667125701904296875;
        float _1744 = _1742 * 6.283185482025146484375;
        float _1746 = cos(_1744);
        float _1748 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1750 = _1748 * 0.15915493667125701904296875;
        float _1752 = _1742 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        float _1756 = 1.0 / _1746;
        float _1758 = _1750 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1754 * _1756;
        float _1764 = _1750 * 6.283185482025146484375;
        float _1766 = sin(_1764);
        float _1768 = _1760 * _1762;
        float _1770 = 1.0 / _1768;
        float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1774 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1772;
        float _1776 = 1.0 / _1774;
        float _1778 = _1766 * _1770;
        float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1782 = fma(_1686, _1778, _1780);
        float _1784 = _1782 * _1776;
        float _1786 = precise::clamp(_1784, 0.0, 1.0);
        float _1788 = -_1786;
        float _1790 = _1788 + 1.0;
        _1688 = _1790;
    }
    float _1792 = _1688;
    float _1794 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1662);
    float _1798 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1666);
    float _1800 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    bool _1802 = _1738 > 0.0;
    bool _1804 = isnan(_1738);
    bool _1806 = _1802 || _1804;
    bool _1808 = isnan(0.0);
    bool _1810 = _1806 || _1808;
    float _1812 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1664);
    float _1814 = _1738 * _1792;
    float _1816 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1796);
    float _1818 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1800);
    float _1820 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1798);
    bool _1822 = _1792 <= 0.0;
    bool _1824 = !_1810;
    bool _1826 = _1822 || _1824;
    float _1828 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1812);
    float _1830 = _1816 + _1818;
    float _1832 = _1820 + _1818;
    float _1834 = _1818 * 0.5;
    float _1836 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1838 = _1830 * 0.5;
    float _1840 = _1832 * 0.5;
    float _1842 = fma(_1828, -0.5, _1834);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1602;
    out.m_69.y = _1600;
    out.m_69.z = _1604;
    out.gl_Position.x = _1816;
    out.gl_Position.y = _1828;
    out.gl_Position.z = _1820;
    out.gl_Position.w = _1818;
    out.m_71.x = _1838;
    out.m_71.y = _1842;
    out.m_71.z = _1840;
    out.m_71.w = _1818;
    out.m_37.x = _1844;
    if (!_1826)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_37.x = 0.0;
    float _1846 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1846;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

