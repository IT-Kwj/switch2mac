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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_39 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_41 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _932 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = as_type<float>(_74);
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1122 = as_type<float>(_90);
        out.gl_Position.z = _1122;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = _108;
    if (_104)
    {
        float _112 = float(_74);
        _82 = _112;
    }
    float _114 = _82;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_35.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1192 = as_type<float>(_128);
        out.gl_Position.z = _1192;
    }
    if (_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_39.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_39.y;
    float _148 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _152 = in.m_41.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _156 = in.m_37.x;
    float _158 = in.m_37.y;
    float _160 = in.m_37.z;
    float _162 = in.m_32.x;
    float _164 = in.m_32.y;
    float _166 = in.m_32.z;
    float _168 = 0.0;
    if (!_144)
    {
        float _170 = _134 * _134;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _148 * _132;
    float _178 = _174;
    if (!_144)
    {
        _110 = _134;
    }
    float _180 = _110;
    float _182 = in.m_43.x;
    float _184 = in.m_43.y;
    float _186 = in.m_43.z;
    float _188 = in.m_43.w;
    float _190 = _180;
    if (!_144)
    {
        float _192 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _192;
    }
    float _194 = _178;
    float _196 = _150 * _154;
    bool _198 = !_144;
    float _200 = _194;
    float _202 = _152;
    float _204 = _186;
    if (!_198)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _134 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _134);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _234;
    }
    float _236 = _200;
    bool _238 = !_144;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _134 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _190 = _258;
    }
    float _260 = _190;
    float _262 = in.m_41.x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _158, _264);
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _274 = _272 != 0;
    float _276 = fma(_260, _156, _266);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _280 = _278 != 0;
    float _282 = fma(_270, _188, _164);
    float _284 = fma(_260, _160, _268);
    float _286 = fma(_276, _188, _162);
    bool _288 = _130 > 0.5;
    bool _290 = _288 && _280;
    float _292 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = -_152;
    float _296 = _294 + 1.0;
    bool _298 = _146 > 0.5;
    float _300 = fma(_284, _188, _166);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _306 = _282;
    if (_274)
    {
        float _308 = _298 ? _296 : _152;
        _202 = _308;
    }
    float _310 = _202;
    float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _314 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _320 = _318;
    if (_280)
    {
        _306 = _262;
    }
    float _322 = _306;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _328 = _326 != 0;
    float _330 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _334 = _318 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _336 = _322;
    if (_290)
    {
        float _338 = -_322;
        float _340 = _338 + 1.0;
        _336 = _340;
    }
    float _342 = _336;
    float _344 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _346 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _324);
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _350 = _334 + _348;
    if (!_280)
    {
        _320 = _262;
    }
    float _352 = _320;
    float _354 = _310 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _356 = _352;
    if (_280)
    {
        _356 = _342;
    }
    float _358 = _356;
    float _360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _362 = _344 + _360;
    float _364 = _350 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _366 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _368 = _354 * _312;
    float _370 = _358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _372 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[28].x, _364);
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _376 = _366 + _374;
    float _378 = _370 * _332;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[28].z, _372);
    float _382 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _390 = _388 != 0;
    out.m_45.x = _378;
    out.m_45.y = _368;
    bool _392 = _380 >= 0.0;
    float _394 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _382);
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (!_328)
    {
        _404 = 0.0;
    }
    float _412 = _404;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _416 = _412;
    if (_392)
    {
        _406 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _418 = _406;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _426 = as_type<int>(_418);
    if (!_328)
    {
        _408 = 0.0;
    }
    float _428 = _408;
    float _430 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _428;
    if (!_328)
    {
        _410 = 0.0;
    }
    float _434 = _410;
    float _436 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _434;
    if (_392)
    {
        float _450 = _418 * 5.0;
        _426 = as_type<int>(_450);
    }
    int _452 = _426;
    bool _454 = !_390;
    int _456 = _454 ? 0 : 1;
    bool _458 = !_328;
    if (!_458)
    {
        float _460 = -_334;
        float _462 = _460 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _464 = -_344;
        float _466 = _464 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _468 = -_366;
        float _470 = _468 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _472 = _462 * _462;
        float _474 = fma(_466, _466, _472);
        float _476 = fma(_470, _470, _474);
        float _478 = rsqrt(_476);
        float _480 = _478 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _482 = _466 * _480;
        float _484 = _462 * _480;
        float _486 = _470 * _480;
        _448 = _484;
        _432 = _482;
        _416 = _486;
    }
    float _488 = _448;
    float _490 = _432;
    float _492 = _416;
    if (_392)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_452);
        out.gl_Position.z = _1805;
    }
    out.m_49.x = _402;
    out.m_49.y = _430;
    out.m_49.z = _436;
    out.m_49.w = _424;
    out.m_51.x = _438;
    out.m_51.y = _440;
    out.m_51.z = _442;
    if (_392)
    {
        out.m_35.x = 0.0;
    }
    if (_392)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _494 = _334 + _488;
    float _496 = _344 + _490;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _500 = _494 + _498;
    float _502 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _394);
    float _506 = _500 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _510 = _496 + _508;
    float _512 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].y, _196);
    int _514 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _516 = _514 != 0;
    float _518 = _366 + _492;
    float _520 = rsqrt(_504);
    float _522 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[28].x, _506);
    float _526 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _528 = _502 * 6.283185482025146484375;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = _518 + _530;
    float _534 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    float _536 = floor(_502);
    float _538 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _540 = _528 * 0.15915493667125701904296875;
    float _542 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[28].z, _524);
    float _544 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _546 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = floor(_512);
    bool _550 = _542 >= 0.0;
    float _552 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _554 = _544 * _520;
    float _556 = _512 * 6.283185482025146484375;
    float _558 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _538);
    float _560 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _562 = !_516;
    int _564 = _562 ? 0 : 1;
    float _566 = _540 * 6.283185482025146484375;
    float _568 = cos(_566);
    float _570 = _556 * 0.15915493667125701904296875;
    float _572 = -_536;
    float _574 = _502 + _572;
    if (_550)
    {
        out.m_35.x = 0.0;
    }
    if (_550)
    {
        _204 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _576 = _204;
    float _578 = -_548;
    float _580 = _512 + _578;
    float _582 = rsqrt(_558);
    bool _584 = _574 < 0.5;
    float _586 = float(_584);
    float _588 = -_574;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _592 = abs(_564);
    int _594 = as_type<int>(_576);
    if (_550)
    {
        float _596 = _576 * 5.0;
        _594 = as_type<int>(_596);
    }
    int _598 = _594;
    float _600 = -_586;
    float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _604 = fma(_568, 0.5, 0.5);
    float _606 = sqrt(_552);
    if (_550)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_598);
        out.gl_Position.z = _2027;
    }
    float _608 = -_604;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _612 = abs(_446);
    float _614 = float(_592);
    float _616 = _570 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = rsqrt(_552);
    if (_550)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _622 = in.m_53.x;
    float _624 = in.m_53.y;
    float _626 = in.m_53.z;
    int _628 = abs(_456);
    float _630 = -_580;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _634 = float(_612);
    float _636 = fma(_618, 0.5, 0.5);
    bool _638 = _580 < 0.5;
    float _640 = float(_638);
    float _642 = _560 * _582;
    float _644 = abs(_632);
    float _646 = _634 * _644;
    float _648 = -_636;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _652 = abs(_590);
    float _654 = _634 * _652;
    float _656 = float(_628);
    float _658 = -_640;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _662 = fma(_614, _650, _646);
    float _664 = fma(_614, _610, _654);
    float _666 = _546 * _620;
    float _668 = _606 * _554;
    float _670 = abs(_660);
    float _672 = fma(_656, _670, _662);
    float _674 = abs(_602);
    float _676 = fma(_656, _674, _664);
    float _678 = _606 * _666;
    float _680 = _606 * _642;
    float _682 = _672 * _668;
    float _684 = _676 * _678;
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    float _688 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _626);
    float _696 = _686 * _688;
    float _698 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _700 = _690 * _692;
    float _702 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _704 = _696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _706 = _694 * _698;
    float _708 = _696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _710 = _696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _712 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _704);
    float _714 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _716 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _708);
    float _718 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _710);
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[25].z, _712);
    float _722 = _702 * _702;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[24].z, _716);
    float _726 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[26].z, _718);
    float _728 = _720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _730 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _734 = _726 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _736 = _728 * _728;
    float _738 = fma(_714, _714, _722);
    float _740 = fma(_732, _732, _736);
    float _742 = fma(_730, _730, _738);
    float _744 = fma(_734, _734, _740);
    float _746 = rsqrt(_742);
    float _748 = rsqrt(_744);
    float _750 = _702 * _746;
    float _752 = sqrt(_742);
    float _754 = _714 * _746;
    float _756 = _730 * _746;
    float _758 = _728 * _748;
    float _760 = _732 * _748;
    float _762 = _734 * _748;
    float _764 = _750 * _758;
    float _766 = fma(_754, _760, _764);
    float _768 = fma(_756, _762, _766);
    float _770 = _768 * _752;
    float _772 = fma(_754, _770, _732);
    float _774 = fma(_756, _770, _734);
    float _776 = fma(_750, _770, _728);
    float _778 = _344 + _772;
    float _780 = _366 + _774;
    float _782 = _334 + _776;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _786 = _778 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _780 + _788;
    float _792 = _786 * _786;
    float _794 = _790 * _790;
    float _796 = _792 + _794;
    float _798 = sqrt(_796);
    bool _800 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _748;
    float _804 = _792;
    float _806 = _794;
    float _808 = _778;
    float _810 = _780;
    if (!_800)
    {
        _802 = _782;
    }
    float _812 = _802;
    bool _814 = !_800;
    float _816 = _812;
    if (!_814)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _822 = _798 + _820;
        float _824 = rsqrt(_796);
        float _826 = _822 * _818;
        float _828 = _782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _830 = _826 * 0.15915493667125701904296875;
        float _832 = _830 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 * 6.283185482025146484375;
        float _838 = cos(_836);
        float _840 = fma(_834, _828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _842 = _824 * _840;
        float _844 = _838 + (-1.0);
        float _846 = fma(_786, _842, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _848 = fma(_790, _842, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _850 = _844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _854 = _846 + _852;
        float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _858 = _848 + _856;
        float _860 = fma(_782, _838, _850);
        float _862 = _854 * _854;
        float _864 = _858 * _858;
        _816 = _860;
        _804 = _862;
        _806 = _864;
        _808 = _846;
        _810 = _848;
    }
    float _866 = _816;
    float _868 = _804;
    float _870 = _806;
    float _872 = _808;
    float _874 = _810;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _878 = _866 + _876;
    out.m_49.x = _402;
    out.m_49.y = _430;
    out.m_49.z = _436;
    out.m_49.w = _424;
    float _880 = fma(_878, _878, _868);
    out.m_51.x = _438;
    out.m_51.y = _440;
    out.m_51.z = _442;
    float _882 = _880 + _870;
    float _884 = sqrt(_882);
    bool _886 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _888 = isnan(_884);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _894 = _890 || _892;
    float _896 = _880;
    if (!_894)
    {
        _896 = 1.0;
    }
    float _898 = _896;
    bool _900 = !_894;
    float _902 = _898;
    if (!_900)
    {
        bool _904 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _906 = isnan(_884);
        bool _908 = _904 || _906;
        bool _910 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _912 = _908 || _910;
        if (!_912)
        {
            float _914 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _916 = _884 + _914;
            float _918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _920 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _918;
            float _922 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _924 = _922 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _926 = 1.0 / _920;
            float _928 = _916 * _926;
            float _930 = fma(_928, _924, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _902 = _930;
            _932 = true;
        }
        else
        {
            bool _934 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _936 = isnan(_884);
            bool _938 = _934 || _936;
            bool _940 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _942 = _938 || _940;
            if (!_942)
            {
                float _944 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _946 = _884 + _944;
                float _948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _950 = _948 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _952 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _954 = _952 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _956 = 1.0 / _950;
                float _958 = _946 * _956;
                float _960 = fma(_958, _954, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _902 = _960;
                _932 = true;
            }
            else
            {
                _902 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _932 = false;
    float _962 = _902;
    float _964 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _966 = _866 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _970 = _872 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _974 = _874 + _972;
    float _976 = fma(_966, _962, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _978 = fma(_970, _962, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _980 = fma(_974, _962, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _982 = _976 + _488;
    float _984 = _978 + _490;
    float _986 = _980 + _492;
    float _988 = _982 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].x, _988);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].x, _990);
    float _1000 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].x, _992);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].z, _996);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].z, _998);
    float _1008 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1000);
    float _1010 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1002);
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1026 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1020);
    float _1030 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1024);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1026);
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1028);
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1030);
    float _1040 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1032);
    float _1042 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1044 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1036);
    float _1046 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1038);
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1040);
    float _1050 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1042);
    float _1052 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1054 = _1046 + _1050;
    float _1056 = _1048 + _1050;
    float _1058 = _1050 * 0.5;
    float _1060 = _1054 * 0.5;
    float _1062 = _1056 * 0.5;
    float _1064 = fma(_1044, -0.5, _1058);
    out.m_35.x = _1052;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1044;
    out.gl_Position.z = _1048;
    out.gl_Position.w = _1050;
    out.m_55.x = _1060;
    out.m_55.y = _1064;
    out.m_55.z = _1062;
    out.m_55.w = _1050;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _932 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = as_type<float>(_74);
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1122 = as_type<float>(_90);
        out.gl_Position.z = _1122;
    }
    if (!_78)
    {
        return out;
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = _108;
    if (_104)
    {
        float _112 = float(_74);
        _82 = _112;
    }
    float _114 = _82;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_35.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1192 = as_type<float>(_128);
        out.gl_Position.z = _1192;
    }
    if (_120)
    {
        return out;
    }
    float _130 = in.m_39.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_39.y;
    float _148 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _152 = in.m_41.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _156 = in.m_37.x;
    float _158 = in.m_37.y;
    float _160 = in.m_37.z;
    float _162 = in.m_32.x;
    float _164 = in.m_32.y;
    float _166 = in.m_32.z;
    float _168 = 0.0;
    if (!_144)
    {
        float _170 = _134 * _134;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _148 * _132;
    float _178 = _174;
    if (!_144)
    {
        _110 = _134;
    }
    float _180 = _110;
    float _182 = in.m_43.x;
    float _184 = in.m_43.y;
    float _186 = in.m_43.z;
    float _188 = in.m_43.w;
    float _190 = _180;
    if (!_144)
    {
        float _192 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _192;
    }
    float _194 = _178;
    float _196 = _150 * _154;
    bool _198 = !_144;
    float _200 = _194;
    float _202 = _152;
    float _204 = _186;
    if (!_198)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _134 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _134);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _234;
    }
    float _236 = _200;
    bool _238 = !_144;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _134 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _190 = _258;
    }
    float _260 = _190;
    float _262 = in.m_41.x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _158, _264);
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _274 = _272 != 0;
    float _276 = fma(_260, _156, _266);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _280 = _278 != 0;
    float _282 = fma(_270, _188, _164);
    float _284 = fma(_260, _160, _268);
    float _286 = fma(_276, _188, _162);
    bool _288 = _130 > 0.5;
    bool _290 = _288 && _280;
    float _292 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = -_152;
    float _296 = _294 + 1.0;
    bool _298 = _146 > 0.5;
    float _300 = fma(_284, _188, _166);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _306 = _282;
    if (_274)
    {
        float _308 = _298 ? _296 : _152;
        _202 = _308;
    }
    float _310 = _202;
    float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _314 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _320 = _318;
    if (_280)
    {
        _306 = _262;
    }
    float _322 = _306;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _328 = _326 != 0;
    float _330 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _334 = _318 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _336 = _322;
    if (_290)
    {
        float _338 = -_322;
        float _340 = _338 + 1.0;
        _336 = _340;
    }
    float _342 = _336;
    float _344 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _346 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _324);
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _350 = _334 + _348;
    if (!_280)
    {
        _320 = _262;
    }
    float _352 = _320;
    float _354 = _310 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _356 = _352;
    if (_280)
    {
        _356 = _342;
    }
    float _358 = _356;
    float _360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _362 = _344 + _360;
    float _364 = _350 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _366 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _368 = _354 * _312;
    float _370 = _358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _372 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[28].x, _364);
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _376 = _366 + _374;
    float _378 = _370 * _332;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[28].z, _372);
    float _382 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _390 = _388 != 0;
    out.m_45.x = _378;
    out.m_45.y = _368;
    bool _392 = _380 >= 0.0;
    float _394 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _382);
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (!_328)
    {
        _404 = 0.0;
    }
    float _412 = _404;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _416 = _412;
    if (_392)
    {
        _406 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _418 = _406;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _426 = as_type<int>(_418);
    if (!_328)
    {
        _408 = 0.0;
    }
    float _428 = _408;
    float _430 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _428;
    if (!_328)
    {
        _410 = 0.0;
    }
    float _434 = _410;
    float _436 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _434;
    if (_392)
    {
        float _450 = _418 * 5.0;
        _426 = as_type<int>(_450);
    }
    int _452 = _426;
    bool _454 = !_390;
    int _456 = _454 ? 0 : 1;
    bool _458 = !_328;
    if (!_458)
    {
        float _460 = -_334;
        float _462 = _460 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _464 = -_344;
        float _466 = _464 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _468 = -_366;
        float _470 = _468 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _472 = _462 * _462;
        float _474 = fma(_466, _466, _472);
        float _476 = fma(_470, _470, _474);
        float _478 = rsqrt(_476);
        float _480 = _478 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _482 = _466 * _480;
        float _484 = _462 * _480;
        float _486 = _470 * _480;
        _448 = _484;
        _432 = _482;
        _416 = _486;
    }
    float _488 = _448;
    float _490 = _432;
    float _492 = _416;
    if (_392)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_452);
        out.gl_Position.z = _1805;
    }
    out.m_49.x = _402;
    out.m_49.y = _430;
    out.m_49.z = _436;
    out.m_49.w = _424;
    out.m_51.x = _438;
    out.m_51.y = _440;
    out.m_51.z = _442;
    if (_392)
    {
        out.m_35.x = 0.0;
    }
    if (_392)
    {
        return out;
    }
    float _494 = _334 + _488;
    float _496 = _344 + _490;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _500 = _494 + _498;
    float _502 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _394);
    float _506 = _500 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _510 = _496 + _508;
    float _512 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].y, _196);
    int _514 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _516 = _514 != 0;
    float _518 = _366 + _492;
    float _520 = rsqrt(_504);
    float _522 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[28].x, _506);
    float _526 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _528 = _502 * 6.283185482025146484375;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = _518 + _530;
    float _534 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    float _536 = floor(_502);
    float _538 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _540 = _528 * 0.15915493667125701904296875;
    float _542 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[28].z, _524);
    float _544 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _546 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = floor(_512);
    bool _550 = _542 >= 0.0;
    float _552 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _554 = _544 * _520;
    float _556 = _512 * 6.283185482025146484375;
    float _558 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _538);
    float _560 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _562 = !_516;
    int _564 = _562 ? 0 : 1;
    float _566 = _540 * 6.283185482025146484375;
    float _568 = cos(_566);
    float _570 = _556 * 0.15915493667125701904296875;
    float _572 = -_536;
    float _574 = _502 + _572;
    if (_550)
    {
        out.m_35.x = 0.0;
    }
    if (_550)
    {
        _204 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _576 = _204;
    float _578 = -_548;
    float _580 = _512 + _578;
    float _582 = rsqrt(_558);
    bool _584 = _574 < 0.5;
    float _586 = float(_584);
    float _588 = -_574;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _592 = abs(_564);
    int _594 = as_type<int>(_576);
    if (_550)
    {
        float _596 = _576 * 5.0;
        _594 = as_type<int>(_596);
    }
    int _598 = _594;
    float _600 = -_586;
    float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _604 = fma(_568, 0.5, 0.5);
    float _606 = sqrt(_552);
    if (_550)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_598);
        out.gl_Position.z = _2027;
    }
    float _608 = -_604;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _612 = abs(_446);
    float _614 = float(_592);
    float _616 = _570 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = rsqrt(_552);
    if (_550)
    {
        return out;
    }
    float _622 = in.m_53.x;
    float _624 = in.m_53.y;
    float _626 = in.m_53.z;
    int _628 = abs(_456);
    float _630 = -_580;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _634 = float(_612);
    float _636 = fma(_618, 0.5, 0.5);
    bool _638 = _580 < 0.5;
    float _640 = float(_638);
    float _642 = _560 * _582;
    float _644 = abs(_632);
    float _646 = _634 * _644;
    float _648 = -_636;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _652 = abs(_590);
    float _654 = _634 * _652;
    float _656 = float(_628);
    float _658 = -_640;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _662 = fma(_614, _650, _646);
    float _664 = fma(_614, _610, _654);
    float _666 = _546 * _620;
    float _668 = _606 * _554;
    float _670 = abs(_660);
    float _672 = fma(_656, _670, _662);
    float _674 = abs(_602);
    float _676 = fma(_656, _674, _664);
    float _678 = _606 * _666;
    float _680 = _606 * _642;
    float _682 = _672 * _668;
    float _684 = _676 * _678;
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    float _688 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _626);
    float _696 = _686 * _688;
    float _698 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _700 = _690 * _692;
    float _702 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _704 = _696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _706 = _694 * _698;
    float _708 = _696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _710 = _696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _712 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _704);
    float _714 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _716 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _708);
    float _718 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _710);
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[25].z, _712);
    float _722 = _702 * _702;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[24].z, _716);
    float _726 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[26].z, _718);
    float _728 = _720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _730 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _734 = _726 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _736 = _728 * _728;
    float _738 = fma(_714, _714, _722);
    float _740 = fma(_732, _732, _736);
    float _742 = fma(_730, _730, _738);
    float _744 = fma(_734, _734, _740);
    float _746 = rsqrt(_742);
    float _748 = rsqrt(_744);
    float _750 = _702 * _746;
    float _752 = sqrt(_742);
    float _754 = _714 * _746;
    float _756 = _730 * _746;
    float _758 = _728 * _748;
    float _760 = _732 * _748;
    float _762 = _734 * _748;
    float _764 = _750 * _758;
    float _766 = fma(_754, _760, _764);
    float _768 = fma(_756, _762, _766);
    float _770 = _768 * _752;
    float _772 = fma(_754, _770, _732);
    float _774 = fma(_756, _770, _734);
    float _776 = fma(_750, _770, _728);
    float _778 = _344 + _772;
    float _780 = _366 + _774;
    float _782 = _334 + _776;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _786 = _778 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _780 + _788;
    float _792 = _786 * _786;
    float _794 = _790 * _790;
    float _796 = _792 + _794;
    float _798 = sqrt(_796);
    bool _800 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _748;
    float _804 = _792;
    float _806 = _794;
    float _808 = _778;
    float _810 = _780;
    if (!_800)
    {
        _802 = _782;
    }
    float _812 = _802;
    bool _814 = !_800;
    float _816 = _812;
    if (!_814)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _822 = _798 + _820;
        float _824 = rsqrt(_796);
        float _826 = _822 * _818;
        float _828 = _782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _830 = _826 * 0.15915493667125701904296875;
        float _832 = _830 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 * 6.283185482025146484375;
        float _838 = cos(_836);
        float _840 = fma(_834, _828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _842 = _824 * _840;
        float _844 = _838 + (-1.0);
        float _846 = fma(_786, _842, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _848 = fma(_790, _842, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _850 = _844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _854 = _846 + _852;
        float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _858 = _848 + _856;
        float _860 = fma(_782, _838, _850);
        float _862 = _854 * _854;
        float _864 = _858 * _858;
        _816 = _860;
        _804 = _862;
        _806 = _864;
        _808 = _846;
        _810 = _848;
    }
    float _866 = _816;
    float _868 = _804;
    float _870 = _806;
    float _872 = _808;
    float _874 = _810;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _878 = _866 + _876;
    out.m_49.x = _402;
    out.m_49.y = _430;
    out.m_49.z = _436;
    out.m_49.w = _424;
    float _880 = fma(_878, _878, _868);
    out.m_51.x = _438;
    out.m_51.y = _440;
    out.m_51.z = _442;
    float _882 = _880 + _870;
    float _884 = sqrt(_882);
    bool _886 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _888 = isnan(_884);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _894 = _890 || _892;
    float _896 = _880;
    if (!_894)
    {
        _896 = 1.0;
    }
    float _898 = _896;
    bool _900 = !_894;
    float _902 = _898;
    if (!_900)
    {
        bool _904 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _906 = isnan(_884);
        bool _908 = _904 || _906;
        bool _910 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _912 = _908 || _910;
        if (!_912)
        {
            float _914 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _916 = _884 + _914;
            float _918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _920 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _918;
            float _922 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _924 = _922 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _926 = 1.0 / _920;
            float _928 = _916 * _926;
            float _930 = fma(_928, _924, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _902 = _930;
            _932 = true;
        }
        else
        {
            bool _934 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _936 = isnan(_884);
            bool _938 = _934 || _936;
            bool _940 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _942 = _938 || _940;
            if (!_942)
            {
                float _944 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _946 = _884 + _944;
                float _948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _950 = _948 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _952 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _954 = _952 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _956 = 1.0 / _950;
                float _958 = _946 * _956;
                float _960 = fma(_958, _954, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _902 = _960;
                _932 = true;
            }
            else
            {
                _902 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _932 = false;
    float _962 = _902;
    float _964 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _966 = _866 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _970 = _872 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _974 = _874 + _972;
    float _976 = fma(_966, _962, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _978 = fma(_970, _962, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _980 = fma(_974, _962, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _982 = _976 + _488;
    float _984 = _978 + _490;
    float _986 = _980 + _492;
    float _988 = _982 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].x, _988);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].x, _990);
    float _1000 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].x, _992);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].z, _996);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].z, _998);
    float _1008 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1000);
    float _1010 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1002);
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1026 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1020);
    float _1030 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1024);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1026);
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1028);
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1030);
    float _1040 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1032);
    float _1042 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1044 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1036);
    float _1046 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1038);
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1040);
    float _1050 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1042);
    float _1052 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1054 = _1046 + _1050;
    float _1056 = _1048 + _1050;
    float _1058 = _1050 * 0.5;
    float _1060 = _1054 * 0.5;
    float _1062 = _1056 * 0.5;
    float _1064 = fma(_1044, -0.5, _1058);
    out.m_35.x = _1052;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1044;
    out.gl_Position.z = _1048;
    out.gl_Position.w = _1050;
    out.m_55.x = _1060;
    out.m_55.y = _1064;
    out.m_55.z = _1062;
    out.m_55.w = _1050;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    bool _932 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_32.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    float _82 = as_type<float>(_74);
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _80;
    if (!_78)
    {
        out.m_35.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1122 = as_type<float>(_90);
        out.gl_Position.z = _1122;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _94 = in.m_37.w;
    bool _96 = _94 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _98 = isnan(_94);
    bool _100 = _96 || _98;
    bool _102 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _104 = _100 || _102;
    float _106 = -_94;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _110 = _108;
    if (_104)
    {
        float _112 = float(_74);
        _82 = _112;
    }
    float _114 = _82;
    bool _116 = _108 >= _114;
    bool _118 = !_104;
    bool _120 = _116 || _118;
    float _122 = _114;
    if (_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    if (_120)
    {
        out.m_35.x = 0.0;
    }
    if (_120)
    {
        float _126 = _124 * 5.0;
        _92 = as_type<int>(_126);
    }
    int _128 = _92;
    if (_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1192 = as_type<float>(_128);
        out.gl_Position.z = _1192;
    }
    if (_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_39.x;
    float _132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _134 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = in.m_39.y;
    float _148 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = _108 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _152 = in.m_41.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _156 = in.m_37.x;
    float _158 = in.m_37.y;
    float _160 = in.m_37.z;
    float _162 = in.m_32.x;
    float _164 = in.m_32.y;
    float _166 = in.m_32.z;
    float _168 = 0.0;
    if (!_144)
    {
        float _170 = _134 * _134;
        float _172 = _170 * 0.5;
        _168 = _172;
    }
    float _174 = _168;
    float _176 = _148 * _132;
    float _178 = _174;
    if (!_144)
    {
        _110 = _134;
    }
    float _180 = _110;
    float _182 = in.m_43.x;
    float _184 = in.m_43.y;
    float _186 = in.m_43.z;
    float _188 = in.m_43.w;
    float _190 = _180;
    if (!_144)
    {
        float _192 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _192;
    }
    float _194 = _178;
    float _196 = _150 * _154;
    bool _198 = !_144;
    float _200 = _194;
    float _202 = _152;
    float _204 = _186;
    if (!_198)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _134 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _134);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _234;
    }
    float _236 = _200;
    bool _238 = !_144;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _134 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _190 = _258;
    }
    float _260 = _190;
    float _262 = in.m_41.x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _158, _264);
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _274 = _272 != 0;
    float _276 = fma(_260, _156, _266);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _280 = _278 != 0;
    float _282 = fma(_270, _188, _164);
    float _284 = fma(_260, _160, _268);
    float _286 = fma(_276, _188, _162);
    bool _288 = _130 > 0.5;
    bool _290 = _288 && _280;
    float _292 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _294 = -_152;
    float _296 = _294 + 1.0;
    bool _298 = _146 > 0.5;
    float _300 = fma(_284, _188, _166);
    float _302 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _292);
    float _306 = _282;
    if (_274)
    {
        float _308 = _298 ? _296 : _152;
        _202 = _308;
    }
    float _310 = _202;
    float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _314 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _318 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _304);
    float _320 = _318;
    if (_280)
    {
        _306 = _262;
    }
    float _322 = _306;
    float _324 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _328 = _326 != 0;
    float _330 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _316);
    float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _334 = _318 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _336 = _322;
    if (_290)
    {
        float _338 = -_322;
        float _340 = _338 + 1.0;
        _336 = _340;
    }
    float _342 = _336;
    float _344 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _346 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _324);
    float _348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _350 = _334 + _348;
    if (!_280)
    {
        _320 = _262;
    }
    float _352 = _320;
    float _354 = _310 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _356 = _352;
    if (_280)
    {
        _356 = _342;
    }
    float _358 = _356;
    float _360 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _362 = _344 + _360;
    float _364 = _350 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _366 = _346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _368 = _354 * _312;
    float _370 = _358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _372 = fma(_362, (*spvDescriptorSet0.vp_c8)._m0[28].x, _364);
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _376 = _366 + _374;
    float _378 = _370 * _332;
    float _380 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[28].z, _372);
    float _382 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _386 = _384 != 0;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _390 = _388 != 0;
    out.m_45.x = _378;
    out.m_45.y = _368;
    bool _392 = _380 >= 0.0;
    float _394 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _382);
    out.m_47.x = 1.0;
    out.m_47.y = 1.0;
    out.m_47.z = 1.0;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (!_328)
    {
        _404 = 0.0;
    }
    float _412 = _404;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _416 = _412;
    if (_392)
    {
        _406 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _418 = _406;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _426 = as_type<int>(_418);
    if (!_328)
    {
        _408 = 0.0;
    }
    float _428 = _408;
    float _430 = _396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _432 = _428;
    if (!_328)
    {
        _410 = 0.0;
    }
    float _434 = _410;
    float _436 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _438 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = _422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _444 = !_386;
    int _446 = _444 ? 0 : 1;
    float _448 = _434;
    if (_392)
    {
        float _450 = _418 * 5.0;
        _426 = as_type<int>(_450);
    }
    int _452 = _426;
    bool _454 = !_390;
    int _456 = _454 ? 0 : 1;
    bool _458 = !_328;
    if (!_458)
    {
        float _460 = -_334;
        float _462 = _460 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _464 = -_344;
        float _466 = _464 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _468 = -_366;
        float _470 = _468 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _472 = _462 * _462;
        float _474 = fma(_466, _466, _472);
        float _476 = fma(_470, _470, _474);
        float _478 = rsqrt(_476);
        float _480 = _478 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _482 = _466 * _480;
        float _484 = _462 * _480;
        float _486 = _470 * _480;
        _448 = _484;
        _432 = _482;
        _416 = _486;
    }
    float _488 = _448;
    float _490 = _432;
    float _492 = _416;
    if (_392)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1805 = as_type<float>(_452);
        out.gl_Position.z = _1805;
    }
    out.m_49.x = _402;
    out.m_49.y = _430;
    out.m_49.z = _436;
    out.m_49.w = _424;
    out.m_51.x = _438;
    out.m_51.y = _440;
    out.m_51.z = _442;
    if (_392)
    {
        out.m_35.x = 0.0;
    }
    if (_392)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _494 = _334 + _488;
    float _496 = _344 + _490;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _500 = _494 + _498;
    float _502 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _504 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _394);
    float _506 = _500 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _510 = _496 + _508;
    float _512 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[20].y, _196);
    int _514 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _516 = _514 != 0;
    float _518 = _366 + _492;
    float _520 = rsqrt(_504);
    float _522 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[28].x, _506);
    float _526 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _528 = _502 * 6.283185482025146484375;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = _518 + _530;
    float _534 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _522);
    float _536 = floor(_502);
    float _538 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _540 = _528 * 0.15915493667125701904296875;
    float _542 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[28].z, _524);
    float _544 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _546 = _182 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _548 = floor(_512);
    bool _550 = _542 >= 0.0;
    float _552 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _554 = _544 * _520;
    float _556 = _512 * 6.283185482025146484375;
    float _558 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _538);
    float _560 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _562 = !_516;
    int _564 = _562 ? 0 : 1;
    float _566 = _540 * 6.283185482025146484375;
    float _568 = cos(_566);
    float _570 = _556 * 0.15915493667125701904296875;
    float _572 = -_536;
    float _574 = _502 + _572;
    if (_550)
    {
        out.m_35.x = 0.0;
    }
    if (_550)
    {
        _204 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _576 = _204;
    float _578 = -_548;
    float _580 = _512 + _578;
    float _582 = rsqrt(_558);
    bool _584 = _574 < 0.5;
    float _586 = float(_584);
    float _588 = -_574;
    float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _592 = abs(_564);
    int _594 = as_type<int>(_576);
    if (_550)
    {
        float _596 = _576 * 5.0;
        _594 = as_type<int>(_596);
    }
    int _598 = _594;
    float _600 = -_586;
    float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _604 = fma(_568, 0.5, 0.5);
    float _606 = sqrt(_552);
    if (_550)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2027 = as_type<float>(_598);
        out.gl_Position.z = _2027;
    }
    float _608 = -_604;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _612 = abs(_446);
    float _614 = float(_592);
    float _616 = _570 * 6.283185482025146484375;
    float _618 = cos(_616);
    float _620 = rsqrt(_552);
    if (_550)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _622 = in.m_53.x;
    float _624 = in.m_53.y;
    float _626 = in.m_53.z;
    int _628 = abs(_456);
    float _630 = -_580;
    float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _634 = float(_612);
    float _636 = fma(_618, 0.5, 0.5);
    bool _638 = _580 < 0.5;
    float _640 = float(_638);
    float _642 = _560 * _582;
    float _644 = abs(_632);
    float _646 = _634 * _644;
    float _648 = -_636;
    float _650 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _652 = abs(_590);
    float _654 = _634 * _652;
    float _656 = float(_628);
    float _658 = -_640;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _662 = fma(_614, _650, _646);
    float _664 = fma(_614, _610, _654);
    float _666 = _546 * _620;
    float _668 = _606 * _554;
    float _670 = abs(_660);
    float _672 = fma(_656, _670, _662);
    float _674 = abs(_602);
    float _676 = fma(_656, _674, _664);
    float _678 = _606 * _666;
    float _680 = _606 * _642;
    float _682 = _672 * _668;
    float _684 = _676 * _678;
    float _686 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _624);
    float _688 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _622);
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _694 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _626);
    float _696 = _686 * _688;
    float _698 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _700 = _690 * _692;
    float _702 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _704 = _696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _706 = _694 * _698;
    float _708 = _696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _710 = _696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _712 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _704);
    float _714 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _716 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _708);
    float _718 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _710);
    float _720 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[25].z, _712);
    float _722 = _702 * _702;
    float _724 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[24].z, _716);
    float _726 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[26].z, _718);
    float _728 = _720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _730 = 0.07999999821186065673828125 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _734 = _726 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _736 = _728 * _728;
    float _738 = fma(_714, _714, _722);
    float _740 = fma(_732, _732, _736);
    float _742 = fma(_730, _730, _738);
    float _744 = fma(_734, _734, _740);
    float _746 = rsqrt(_742);
    float _748 = rsqrt(_744);
    float _750 = _702 * _746;
    float _752 = sqrt(_742);
    float _754 = _714 * _746;
    float _756 = _730 * _746;
    float _758 = _728 * _748;
    float _760 = _732 * _748;
    float _762 = _734 * _748;
    float _764 = _750 * _758;
    float _766 = fma(_754, _760, _764);
    float _768 = fma(_756, _762, _766);
    float _770 = _768 * _752;
    float _772 = fma(_754, _770, _732);
    float _774 = fma(_756, _770, _734);
    float _776 = fma(_750, _770, _728);
    float _778 = _344 + _772;
    float _780 = _366 + _774;
    float _782 = _334 + _776;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _786 = _778 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _790 = _780 + _788;
    float _792 = _786 * _786;
    float _794 = _790 * _790;
    float _796 = _792 + _794;
    float _798 = sqrt(_796);
    bool _800 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _748;
    float _804 = _792;
    float _806 = _794;
    float _808 = _778;
    float _810 = _780;
    if (!_800)
    {
        _802 = _782;
    }
    float _812 = _802;
    bool _814 = !_800;
    float _816 = _812;
    if (!_814)
    {
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _820 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _822 = _798 + _820;
        float _824 = rsqrt(_796);
        float _826 = _822 * _818;
        float _828 = _782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _830 = _826 * 0.15915493667125701904296875;
        float _832 = _830 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 * 6.283185482025146484375;
        float _838 = cos(_836);
        float _840 = fma(_834, _828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _842 = _824 * _840;
        float _844 = _838 + (-1.0);
        float _846 = fma(_786, _842, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _848 = fma(_790, _842, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _850 = _844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _854 = _846 + _852;
        float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _858 = _848 + _856;
        float _860 = fma(_782, _838, _850);
        float _862 = _854 * _854;
        float _864 = _858 * _858;
        _816 = _860;
        _804 = _862;
        _806 = _864;
        _808 = _846;
        _810 = _848;
    }
    float _866 = _816;
    float _868 = _804;
    float _870 = _806;
    float _872 = _808;
    float _874 = _810;
    float _876 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _878 = _866 + _876;
    out.m_49.x = _402;
    out.m_49.y = _430;
    out.m_49.z = _436;
    out.m_49.w = _424;
    float _880 = fma(_878, _878, _868);
    out.m_51.x = _438;
    out.m_51.y = _440;
    out.m_51.z = _442;
    float _882 = _880 + _870;
    float _884 = sqrt(_882);
    bool _886 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _888 = isnan(_884);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _894 = _890 || _892;
    float _896 = _880;
    if (!_894)
    {
        _896 = 1.0;
    }
    float _898 = _896;
    bool _900 = !_894;
    float _902 = _898;
    if (!_900)
    {
        bool _904 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _906 = isnan(_884);
        bool _908 = _904 || _906;
        bool _910 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _912 = _908 || _910;
        if (!_912)
        {
            float _914 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _916 = _884 + _914;
            float _918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _920 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _918;
            float _922 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _924 = _922 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _926 = 1.0 / _920;
            float _928 = _916 * _926;
            float _930 = fma(_928, _924, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _902 = _930;
            _932 = true;
        }
        else
        {
            bool _934 = _884 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _936 = isnan(_884);
            bool _938 = _934 || _936;
            bool _940 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _942 = _938 || _940;
            if (!_942)
            {
                float _944 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _946 = _884 + _944;
                float _948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _950 = _948 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _952 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _954 = _952 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _956 = 1.0 / _950;
                float _958 = _946 * _956;
                float _960 = fma(_958, _954, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _902 = _960;
                _932 = true;
            }
            else
            {
                _902 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _932 = false;
    float _962 = _902;
    float _964 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _966 = _866 + _964;
    float _968 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _970 = _872 + _968;
    float _972 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _974 = _874 + _972;
    float _976 = fma(_966, _962, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _978 = fma(_970, _962, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _980 = fma(_974, _962, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _982 = _976 + _488;
    float _984 = _978 + _490;
    float _986 = _980 + _492;
    float _988 = _982 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _990 = _982 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _992 = _982 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _994 = _982 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _996 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[1].x, _988);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[0].x, _990);
    float _1000 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[2].x, _992);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[3].x, _994);
    float _1004 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].z, _996);
    float _1006 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].z, _998);
    float _1008 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1000);
    float _1010 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1002);
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1016 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1018 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1026 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1020);
    float _1030 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1024);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1026);
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1028);
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1030);
    float _1040 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1032);
    float _1042 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1034);
    float _1044 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1036);
    float _1046 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1038);
    float _1048 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1040);
    float _1050 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1042);
    float _1052 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1054 = _1046 + _1050;
    float _1056 = _1048 + _1050;
    float _1058 = _1050 * 0.5;
    float _1060 = _1054 * 0.5;
    float _1062 = _1056 * 0.5;
    float _1064 = fma(_1044, -0.5, _1058);
    out.m_35.x = _1052;
    out.gl_Position.x = _1046;
    out.gl_Position.y = _1044;
    out.gl_Position.z = _1048;
    out.gl_Position.w = _1050;
    out.m_55.x = _1060;
    out.m_55.y = _1064;
    out.m_55.z = _1062;
    out.m_55.w = _1050;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

