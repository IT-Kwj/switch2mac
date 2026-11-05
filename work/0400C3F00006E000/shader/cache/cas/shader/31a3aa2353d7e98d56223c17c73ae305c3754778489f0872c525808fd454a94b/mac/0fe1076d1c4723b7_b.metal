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
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_63 [[attribute(0)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_43 [[attribute(5)]];
    float4 m_41 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_39 [[attribute(9)]];
    float4 m_45 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _814 = as_type<float>(_102);
        out.gl_Position.z = _814;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_35.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_84);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _882 = as_type<float>(_136);
        out.gl_Position.z = _882;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _146 = in.m_39.y;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _150 = _148 != 0;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _154 = _152 != 0;
    float _156 = in.m_41.x;
    float _158 = in.m_41.y;
    float _160 = in.m_43.x;
    float _162 = in.m_43.y;
    float _164 = in.m_43.z;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _168 = in.m_45.w;
    float _170 = 0.0;
    if (_154)
    {
        float _172 = in.m_41.x;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = in.m_39.x;
    float _182 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = -_146;
    float _186 = _184 + 1.0;
    float _188 = in.m_47.x;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _192 = _158 > 0.5;
    float _194 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _196 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _166);
    float _198 = _162 + (-0.5);
    float _200 = _146;
    float _202 = _164;
    if (_150)
    {
        float _204 = _192 ? _186 : _146;
        _200 = _204;
    }
    float _206 = _200;
    float _208 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _210 = -_178;
    float _212 = fma(_194, 2.0, _210);
    float _214 = abs(_198);
    float _216 = fma(_214, -2.0, 1.0);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _208 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_49.w = _168;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _226 = _220 * 0.15915493667125701904296875;
    float _228 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _230 = _218 * _218;
    float _232 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _224);
    float _234 = _226 * 6.283185482025146484375;
    float _236 = cos(_234);
    float _238 = fma(_228, -2.0, _222);
    float _240 = _144 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _242 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _244 = -_120;
    float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[76].x, _212);
    float _248 = fma(_240, _206, -0.5);
    float _250 = _242 * 0.15915493667125701904296875;
    float _252 = _226 * 6.283185482025146484375;
    float _254 = sin(_252);
    float _256 = fma(_218, -2.0, 3.0);
    float _258 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _196);
    float _260 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _238);
    float _262 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _232);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _266 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _268 = _174 > 0.5;
    bool _270 = _268 && _154;
    float _272 = _256 * _230;
    float _274 = _272 * 0.125;
    float _276 = _236 * _160;
    float _278 = in.m_47.z;
    float _280 = _266 * _264;
    float _282 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = _250 * 6.283185482025146484375;
    float _286 = sin(_284);
    float _288 = 0.0;
    if (_154)
    {
        _288 = _180;
    }
    float _290 = _288;
    float _292 = fma(_254, _164, _276);
    float _294 = _254 * _160;
    float _296 = in.m_30.x;
    float _298 = in.m_30.y;
    float _300 = in.m_30.z;
    float _302 = -_260;
    float _304 = fma(_262, _248, _302);
    float _306 = _254 * _188;
    float _308 = _290;
    if (_270)
    {
        float _310 = -_290;
        float _312 = _310 + 1.0;
        _308 = _312;
    }
    float _314 = _308;
    float _316 = _250 * 6.283185482025146484375;
    float _318 = cos(_316);
    float _320 = -_294;
    float _322 = fma(_236, _164, _320);
    if (!_154)
    {
        _202 = _180;
    }
    float _324 = _202;
    float _326 = in.m_47.y;
    float _328 = _324;
    if (_154)
    {
        _328 = _314;
    }
    float _330 = _328;
    float _332 = _282 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _334 = _162 != 0.0;
    bool _336 = isnan(_162);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _346 = fma(_286, _274, _292);
    float _348 = -_306;
    float _350 = fma(_236, _278, _348);
    bool _352 = _346 == 0.0;
    bool _354 = !_342;
    bool _356 = _352 && _354;
    float _358 = fma(_274, _318, _322);
    float _360 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _362 = _358 == 0.0;
    bool _364 = _362 && _356;
    float _366 = _344 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _368 = _236 * _188;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _372 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _374 = fma(_366, _330, -0.5);
    float _376 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _190 * _370;
    float _380 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _382 = fma(_258, _374, _246);
    float _384 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _358);
    float _386 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _388 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[10].x, _380);
    float _392 = _332 * _384;
    float _394 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _396 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = _388 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].z, _390);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[8].x, _394);
    float _404 = fma(_254, _278, _368);
    float _406 = _326;
    float _408 = _404;
    float _410 = _350;
    float _412 = _296;
    int _414 = as_type<int>(_300);
    if (!_364)
    {
        float _416 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _326);
        _406 = _416;
    }
    float _418 = _406;
    float _420 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _422 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].z, _402);
    float _424 = _398 + _400;
    if (!_364)
    {
        float _426 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _404);
        _408 = _426;
    }
    float _428 = _408;
    float _430 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _432 = _420 + _422;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _424 + _434;
    float _438 = _418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].x, _430);
    float _442 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _446 = _432 + _444;
    float _448 = _436 * _436;
    if (!_364)
    {
        float _450 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[17].y, _350);
        _410 = _450;
    }
    float _452 = _410;
    float _454 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _456 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].x, _442);
    float _458 = fma(_446, _446, _448);
    float _460 = _382 + 0.5;
    float _462 = sqrt(_458);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _476 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _454);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _484 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _304 + 0.5;
    float _496 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _440);
    float _498 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _456);
    out.m_51.x = _480;
    out.m_51.y = _484;
    out.m_51.z = _486;
    out.m_51.w = _478;
    float _500 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _502 = _462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_53.x = _488;
    out.m_53.y = _490;
    out.m_53.z = _492;
    out.m_53.w = _482;
    float _506 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _500);
    float _508 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[9].x, _504);
    out.m_55.x = _460;
    out.m_55.y = _494;
    float _510 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    float _512 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].z, _508);
    out.m_57.x = _476;
    out.m_57.y = _496;
    out.m_57.z = _498;
    float _514 = _510 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_502)
    {
        _412 = _432;
    }
    float _516 = _412;
    float _518 = _514 + _512;
    float _520 = _518;
    float _522 = _516;
    if (!_502)
    {
        _414 = as_type<int>(_424);
    }
    int _524 = _414;
    bool _526 = !_502;
    int _528 = _524;
    if (!_526)
    {
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _532 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _534 = _462 + _532;
        float _536 = rsqrt(_458);
        float _538 = _534 * _530;
        float _540 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = _538 * 0.15915493667125701904296875;
        float _544 = _542 * 6.283185482025146484375;
        float _546 = cos(_544);
        float _548 = _542 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _546 + (-1.0);
        float _554 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _556 = fma(_550, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _558 = fma(_518, _546, _554);
        float _560 = _536 * _556;
        float _562 = fma(_446, _560, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _564 = fma(_436, _560, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _520 = _558;
        _522 = _562;
        _528 = as_type<int>(_564);
    }
    float _566 = _520;
    float _568 = _522;
    int _570 = _528;
    bool _572 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _574 = isnan(0.5);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _580 = _576 || _578;
    float _582 = _566 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _584 = _566 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _586 = _566 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _588 = _566 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[0].x, _582);
    float _592 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[1].x, _584);
    float _594 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[2].x, _586);
    float _596 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[3].x, _588);
    out.m_59.x = _568;
    out.m_59.y = _566;
    out.m_59.z = as_type<float>(_570);
    float _598 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[0].z, _590);
    float _600 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[1].z, _592);
    float _602 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[2].z, _594);
    float _604 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[3].z, _596);
    float _606 = _568;
    float _608 = _566;
    if (_580)
    {
        _606 = 1.0;
    }
    float _610 = _606;
    float _612 = _610;
    if (!_580)
    {
        float _614 = as_type<float>(in.m_63.w);
        int _616 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _618 = _616 == 4;
        bool _620 = _616 == 8;
        bool _622 = _616 == 12;
        int _624 = as_type<int>(_614) << 16;
        int _626 = as_type<int>(_614) << 8;
        int _628 = as_type<int>(_614) << 24;
        int _630 = _624 >> 24;
        int _632 = _626 >> 24;
        int _634 = as_type<int>(_614) >> 24;
        int _636 = _628 >> 24;
        float _638 = float(_630);
        float _640 = float(_632);
        float _642 = float(_634);
        float _644 = _638 * 0.0078740157186985015869140625;
        float _646 = float(_636);
        float _648 = _640 * 0.0078740157186985015869140625;
        float _650 = _642 * 0.0078740157186985015869140625;
        float _652 = precise::min(_644, 1.0);
        float _654 = _646 * 0.0078740157186985015869140625;
        float _656 = precise::min(_648, 1.0);
        float _658 = precise::min(_650, 1.0);
        float _660 = precise::min(_654, 1.0);
        float _662 = precise::max(_652, -1.0);
        float _664 = precise::max(_656, -1.0);
        float _666 = precise::max(_658, -1.0);
        float _668 = precise::max(_660, -1.0);
        float _670 = _668;
        _608 = _662;
        if (_618)
        {
            _670 = _662;
        }
        float _672 = _670;
        float _674 = _672;
        if (_620)
        {
            _674 = _664;
        }
        float _676 = _674;
        float _678 = _676;
        if (_622)
        {
            _678 = _666;
        }
        float _680 = _678;
        float _682 = abs(_680);
        float _684 = (-0.0) + _682;
        _612 = _684;
    }
    float _686 = _612;
    float _688 = _608;
    float _690 = _600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _692 = _686 != 0.0;
    bool _694 = isnan(_686);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = _598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _704 = _602 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _708 = _690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _710 = _690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _712 = _690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[5].x, _706);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[4].x, _708);
    float _718 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[6].x, _710);
    float _720 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[7].x, _712);
    float _722 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _724 = _604 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _714);
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _716);
    float _730 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _718);
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _720);
    float _734 = _722;
    float _736 = _688;
    int _738 = as_type<int>(_732);
    if (!_700)
    {
        _734 = 0.0;
    }
    float _740 = _734;
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _726);
    if (!_700)
    {
        _736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _744 = _736;
    float _746 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _728);
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _730);
    float _750 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _732);
    float _752 = _740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    if (!_700)
    {
        float _754 = _744 * 5.0;
        _738 = as_type<int>(_754);
    }
    int _756 = _738;
    out.gl_Position.x = _746;
    out.gl_Position.y = _742;
    out.gl_Position.z = _748;
    out.gl_Position.w = _750;
    out.m_33.x = 1.0;
    out.m_65.w = _752;
    if (!_700)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_756);
        out.gl_Position.z = _2008;
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _814 = as_type<float>(_102);
        out.gl_Position.z = _814;
    }
    if (!_88)
    {
        return out;
    }
    float _106 = in.m_35.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_84);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _882 = as_type<float>(_136);
        out.gl_Position.z = _882;
    }
    if (_130)
    {
        return out;
    }
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _146 = in.m_39.y;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _150 = _148 != 0;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _154 = _152 != 0;
    float _156 = in.m_41.x;
    float _158 = in.m_41.y;
    float _160 = in.m_43.x;
    float _162 = in.m_43.y;
    float _164 = in.m_43.z;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _168 = in.m_45.w;
    float _170 = 0.0;
    if (_154)
    {
        float _172 = in.m_41.x;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = in.m_39.x;
    float _182 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = -_146;
    float _186 = _184 + 1.0;
    float _188 = in.m_47.x;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _192 = _158 > 0.5;
    float _194 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _196 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _166);
    float _198 = _162 + (-0.5);
    float _200 = _146;
    float _202 = _164;
    if (_150)
    {
        float _204 = _192 ? _186 : _146;
        _200 = _204;
    }
    float _206 = _200;
    float _208 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _210 = -_178;
    float _212 = fma(_194, 2.0, _210);
    float _214 = abs(_198);
    float _216 = fma(_214, -2.0, 1.0);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _208 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_49.w = _168;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _226 = _220 * 0.15915493667125701904296875;
    float _228 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _230 = _218 * _218;
    float _232 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _224);
    float _234 = _226 * 6.283185482025146484375;
    float _236 = cos(_234);
    float _238 = fma(_228, -2.0, _222);
    float _240 = _144 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _242 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _244 = -_120;
    float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[76].x, _212);
    float _248 = fma(_240, _206, -0.5);
    float _250 = _242 * 0.15915493667125701904296875;
    float _252 = _226 * 6.283185482025146484375;
    float _254 = sin(_252);
    float _256 = fma(_218, -2.0, 3.0);
    float _258 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _196);
    float _260 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _238);
    float _262 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _232);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _266 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _268 = _174 > 0.5;
    bool _270 = _268 && _154;
    float _272 = _256 * _230;
    float _274 = _272 * 0.125;
    float _276 = _236 * _160;
    float _278 = in.m_47.z;
    float _280 = _266 * _264;
    float _282 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = _250 * 6.283185482025146484375;
    float _286 = sin(_284);
    float _288 = 0.0;
    if (_154)
    {
        _288 = _180;
    }
    float _290 = _288;
    float _292 = fma(_254, _164, _276);
    float _294 = _254 * _160;
    float _296 = in.m_30.x;
    float _298 = in.m_30.y;
    float _300 = in.m_30.z;
    float _302 = -_260;
    float _304 = fma(_262, _248, _302);
    float _306 = _254 * _188;
    float _308 = _290;
    if (_270)
    {
        float _310 = -_290;
        float _312 = _310 + 1.0;
        _308 = _312;
    }
    float _314 = _308;
    float _316 = _250 * 6.283185482025146484375;
    float _318 = cos(_316);
    float _320 = -_294;
    float _322 = fma(_236, _164, _320);
    if (!_154)
    {
        _202 = _180;
    }
    float _324 = _202;
    float _326 = in.m_47.y;
    float _328 = _324;
    if (_154)
    {
        _328 = _314;
    }
    float _330 = _328;
    float _332 = _282 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _334 = _162 != 0.0;
    bool _336 = isnan(_162);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _346 = fma(_286, _274, _292);
    float _348 = -_306;
    float _350 = fma(_236, _278, _348);
    bool _352 = _346 == 0.0;
    bool _354 = !_342;
    bool _356 = _352 && _354;
    float _358 = fma(_274, _318, _322);
    float _360 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _362 = _358 == 0.0;
    bool _364 = _362 && _356;
    float _366 = _344 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _368 = _236 * _188;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _372 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _374 = fma(_366, _330, -0.5);
    float _376 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _190 * _370;
    float _380 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _382 = fma(_258, _374, _246);
    float _384 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _358);
    float _386 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _388 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[10].x, _380);
    float _392 = _332 * _384;
    float _394 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _396 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = _388 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].z, _390);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[8].x, _394);
    float _404 = fma(_254, _278, _368);
    float _406 = _326;
    float _408 = _404;
    float _410 = _350;
    float _412 = _296;
    int _414 = as_type<int>(_300);
    if (!_364)
    {
        float _416 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _326);
        _406 = _416;
    }
    float _418 = _406;
    float _420 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _422 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].z, _402);
    float _424 = _398 + _400;
    if (!_364)
    {
        float _426 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _404);
        _408 = _426;
    }
    float _428 = _408;
    float _430 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _432 = _420 + _422;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _424 + _434;
    float _438 = _418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].x, _430);
    float _442 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _446 = _432 + _444;
    float _448 = _436 * _436;
    if (!_364)
    {
        float _450 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[17].y, _350);
        _410 = _450;
    }
    float _452 = _410;
    float _454 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _456 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].x, _442);
    float _458 = fma(_446, _446, _448);
    float _460 = _382 + 0.5;
    float _462 = sqrt(_458);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _476 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _454);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _484 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _304 + 0.5;
    float _496 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _440);
    float _498 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _456);
    out.m_51.x = _480;
    out.m_51.y = _484;
    out.m_51.z = _486;
    out.m_51.w = _478;
    float _500 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _502 = _462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_53.x = _488;
    out.m_53.y = _490;
    out.m_53.z = _492;
    out.m_53.w = _482;
    float _506 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _500);
    float _508 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[9].x, _504);
    out.m_55.x = _460;
    out.m_55.y = _494;
    float _510 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    float _512 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].z, _508);
    out.m_57.x = _476;
    out.m_57.y = _496;
    out.m_57.z = _498;
    float _514 = _510 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_502)
    {
        _412 = _432;
    }
    float _516 = _412;
    float _518 = _514 + _512;
    float _520 = _518;
    float _522 = _516;
    if (!_502)
    {
        _414 = as_type<int>(_424);
    }
    int _524 = _414;
    bool _526 = !_502;
    int _528 = _524;
    if (!_526)
    {
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _532 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _534 = _462 + _532;
        float _536 = rsqrt(_458);
        float _538 = _534 * _530;
        float _540 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = _538 * 0.15915493667125701904296875;
        float _544 = _542 * 6.283185482025146484375;
        float _546 = cos(_544);
        float _548 = _542 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _546 + (-1.0);
        float _554 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _556 = fma(_550, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _558 = fma(_518, _546, _554);
        float _560 = _536 * _556;
        float _562 = fma(_446, _560, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _564 = fma(_436, _560, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _520 = _558;
        _522 = _562;
        _528 = as_type<int>(_564);
    }
    float _566 = _520;
    float _568 = _522;
    int _570 = _528;
    bool _572 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _574 = isnan(0.5);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _580 = _576 || _578;
    float _582 = _566 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _584 = _566 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _586 = _566 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _588 = _566 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[0].x, _582);
    float _592 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[1].x, _584);
    float _594 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[2].x, _586);
    float _596 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[3].x, _588);
    out.m_59.x = _568;
    out.m_59.y = _566;
    out.m_59.z = as_type<float>(_570);
    float _598 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[0].z, _590);
    float _600 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[1].z, _592);
    float _602 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[2].z, _594);
    float _604 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[3].z, _596);
    float _606 = _568;
    float _608 = _566;
    if (_580)
    {
        _606 = 1.0;
    }
    float _610 = _606;
    float _612 = _610;
    if (!_580)
    {
        float _614 = as_type<float>(in.m_63.w);
        int _616 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _618 = _616 == 4;
        bool _620 = _616 == 8;
        bool _622 = _616 == 12;
        int _624 = as_type<int>(_614) << 16;
        int _626 = as_type<int>(_614) << 8;
        int _628 = as_type<int>(_614) << 24;
        int _630 = _624 >> 24;
        int _632 = _626 >> 24;
        int _634 = as_type<int>(_614) >> 24;
        int _636 = _628 >> 24;
        float _638 = float(_630);
        float _640 = float(_632);
        float _642 = float(_634);
        float _644 = _638 * 0.0078740157186985015869140625;
        float _646 = float(_636);
        float _648 = _640 * 0.0078740157186985015869140625;
        float _650 = _642 * 0.0078740157186985015869140625;
        float _652 = precise::min(_644, 1.0);
        float _654 = _646 * 0.0078740157186985015869140625;
        float _656 = precise::min(_648, 1.0);
        float _658 = precise::min(_650, 1.0);
        float _660 = precise::min(_654, 1.0);
        float _662 = precise::max(_652, -1.0);
        float _664 = precise::max(_656, -1.0);
        float _666 = precise::max(_658, -1.0);
        float _668 = precise::max(_660, -1.0);
        float _670 = _668;
        _608 = _662;
        if (_618)
        {
            _670 = _662;
        }
        float _672 = _670;
        float _674 = _672;
        if (_620)
        {
            _674 = _664;
        }
        float _676 = _674;
        float _678 = _676;
        if (_622)
        {
            _678 = _666;
        }
        float _680 = _678;
        float _682 = abs(_680);
        float _684 = (-0.0) + _682;
        _612 = _684;
    }
    float _686 = _612;
    float _688 = _608;
    float _690 = _600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _692 = _686 != 0.0;
    bool _694 = isnan(_686);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = _598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _704 = _602 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _708 = _690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _710 = _690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _712 = _690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[5].x, _706);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[4].x, _708);
    float _718 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[6].x, _710);
    float _720 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[7].x, _712);
    float _722 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _724 = _604 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _714);
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _716);
    float _730 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _718);
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _720);
    float _734 = _722;
    float _736 = _688;
    int _738 = as_type<int>(_732);
    if (!_700)
    {
        _734 = 0.0;
    }
    float _740 = _734;
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _726);
    if (!_700)
    {
        _736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _744 = _736;
    float _746 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _728);
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _730);
    float _750 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _732);
    float _752 = _740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    if (!_700)
    {
        float _754 = _744 * 5.0;
        _738 = as_type<int>(_754);
    }
    int _756 = _738;
    out.gl_Position.x = _746;
    out.gl_Position.y = _742;
    out.gl_Position.z = _748;
    out.gl_Position.w = _750;
    out.m_33.x = 1.0;
    out.m_65.w = _752;
    if (!_700)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_756);
        out.gl_Position.z = _2008;
    }
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_30.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    float _96 = _94;
    if (!_88)
    {
        out.m_33.x = 0.0;
    }
    int _98 = 0;
    if (!_88)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _814 = as_type<float>(_102);
        out.gl_Position.z = _814;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_35.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_84);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    if (_130)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _92;
    if (_130)
    {
        out.m_33.x = 0.0;
    }
    if (_130)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _882 = as_type<float>(_136);
        out.gl_Position.z = _882;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_37.x;
    float _140 = in.m_37.y;
    float _142 = in.m_37.z;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _146 = in.m_39.y;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _150 = _148 != 0;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _154 = _152 != 0;
    float _156 = in.m_41.x;
    float _158 = in.m_41.y;
    float _160 = in.m_43.x;
    float _162 = in.m_43.y;
    float _164 = in.m_43.z;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _168 = in.m_45.w;
    float _170 = 0.0;
    if (_154)
    {
        float _172 = in.m_41.x;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _140 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _180 = in.m_39.x;
    float _182 = _138 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = -_146;
    float _186 = _184 + 1.0;
    float _188 = in.m_47.x;
    float _190 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _192 = _158 > 0.5;
    float _194 = _156 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _196 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[78].z, _166);
    float _198 = _162 + (-0.5);
    float _200 = _146;
    float _202 = _164;
    if (_150)
    {
        float _204 = _192 ? _186 : _146;
        _200 = _204;
    }
    float _206 = _200;
    float _208 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _210 = -_178;
    float _212 = fma(_194, 2.0, _210);
    float _214 = abs(_198);
    float _216 = fma(_214, -2.0, 1.0);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _208 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_49.w = _168;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _226 = _220 * 0.15915493667125701904296875;
    float _228 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _230 = _218 * _218;
    float _232 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _224);
    float _234 = _226 * 6.283185482025146484375;
    float _236 = cos(_234);
    float _238 = fma(_228, -2.0, _222);
    float _240 = _144 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _242 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _244 = -_120;
    float _246 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[76].x, _212);
    float _248 = fma(_240, _206, -0.5);
    float _250 = _242 * 0.15915493667125701904296875;
    float _252 = _226 * 6.283185482025146484375;
    float _254 = sin(_252);
    float _256 = fma(_218, -2.0, 3.0);
    float _258 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _196);
    float _260 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _238);
    float _262 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _232);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _162);
    float _266 = _176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _268 = _174 > 0.5;
    bool _270 = _268 && _154;
    float _272 = _256 * _230;
    float _274 = _272 * 0.125;
    float _276 = _236 * _160;
    float _278 = in.m_47.z;
    float _280 = _266 * _264;
    float _282 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = _250 * 6.283185482025146484375;
    float _286 = sin(_284);
    float _288 = 0.0;
    if (_154)
    {
        _288 = _180;
    }
    float _290 = _288;
    float _292 = fma(_254, _164, _276);
    float _294 = _254 * _160;
    float _296 = in.m_30.x;
    float _298 = in.m_30.y;
    float _300 = in.m_30.z;
    float _302 = -_260;
    float _304 = fma(_262, _248, _302);
    float _306 = _254 * _188;
    float _308 = _290;
    if (_270)
    {
        float _310 = -_290;
        float _312 = _310 + 1.0;
        _308 = _312;
    }
    float _314 = _308;
    float _316 = _250 * 6.283185482025146484375;
    float _318 = cos(_316);
    float _320 = -_294;
    float _322 = fma(_236, _164, _320);
    if (!_154)
    {
        _202 = _180;
    }
    float _324 = _202;
    float _326 = in.m_47.y;
    float _328 = _324;
    if (_154)
    {
        _328 = _314;
    }
    float _330 = _328;
    float _332 = _282 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _334 = _162 != 0.0;
    bool _336 = isnan(_162);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _346 = fma(_286, _274, _292);
    float _348 = -_306;
    float _350 = fma(_236, _278, _348);
    bool _352 = _346 == 0.0;
    bool _354 = !_342;
    bool _356 = _352 && _354;
    float _358 = fma(_274, _318, _322);
    float _360 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _362 = _358 == 0.0;
    bool _364 = _362 && _356;
    float _366 = _344 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _368 = _236 * _188;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _372 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[6].x, _360);
    float _374 = fma(_366, _330, -0.5);
    float _376 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _190 * _370;
    float _380 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _382 = fma(_258, _374, _246);
    float _384 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _358);
    float _386 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _388 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[6].z, _372);
    float _390 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[10].x, _380);
    float _392 = _332 * _384;
    float _394 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _396 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _398 = _388 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[10].z, _390);
    float _402 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[8].x, _394);
    float _404 = fma(_254, _278, _368);
    float _406 = _326;
    float _408 = _404;
    float _410 = _350;
    float _412 = _296;
    int _414 = as_type<int>(_300);
    if (!_364)
    {
        float _416 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[17].y, _326);
        _406 = _416;
    }
    float _418 = _406;
    float _420 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _422 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[8].z, _402);
    float _424 = _398 + _400;
    if (!_364)
    {
        float _426 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _404);
        _408 = _426;
    }
    float _428 = _408;
    float _430 = _418 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _432 = _420 + _422;
    float _434 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _436 = _424 + _434;
    float _438 = _418 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[9].x, _430);
    float _442 = _418 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _446 = _432 + _444;
    float _448 = _436 * _436;
    if (!_364)
    {
        float _450 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[17].y, _350);
        _410 = _450;
    }
    float _452 = _410;
    float _454 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[8].x, _438);
    float _456 = fma(_428, (*spvDescriptorSet0.vp_c10)._m0[10].x, _442);
    float _458 = fma(_446, _446, _448);
    float _460 = _382 + 0.5;
    float _462 = sqrt(_458);
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _476 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _454);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _480 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _484 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = _468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _488 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _490 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = _304 + 0.5;
    float _496 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _440);
    float _498 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _456);
    out.m_51.x = _480;
    out.m_51.y = _484;
    out.m_51.z = _486;
    out.m_51.w = _478;
    float _500 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _502 = _462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_53.x = _488;
    out.m_53.y = _490;
    out.m_53.z = _492;
    out.m_53.w = _482;
    float _506 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[5].x, _500);
    float _508 = fma(_378, (*spvDescriptorSet0.vp_c10)._m0[9].x, _504);
    out.m_55.x = _460;
    out.m_55.y = _494;
    float _510 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    float _512 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[9].z, _508);
    out.m_57.x = _476;
    out.m_57.y = _496;
    out.m_57.z = _498;
    float _514 = _510 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_502)
    {
        _412 = _432;
    }
    float _516 = _412;
    float _518 = _514 + _512;
    float _520 = _518;
    float _522 = _516;
    if (!_502)
    {
        _414 = as_type<int>(_424);
    }
    int _524 = _414;
    bool _526 = !_502;
    int _528 = _524;
    if (!_526)
    {
        float _530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _532 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _534 = _462 + _532;
        float _536 = rsqrt(_458);
        float _538 = _534 * _530;
        float _540 = _518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _542 = _538 * 0.15915493667125701904296875;
        float _544 = _542 * 6.283185482025146484375;
        float _546 = cos(_544);
        float _548 = _542 * 6.283185482025146484375;
        float _550 = sin(_548);
        float _552 = _546 + (-1.0);
        float _554 = _552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _556 = fma(_550, _540, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _558 = fma(_518, _546, _554);
        float _560 = _536 * _556;
        float _562 = fma(_446, _560, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _564 = fma(_436, _560, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _520 = _558;
        _522 = _562;
        _528 = as_type<int>(_564);
    }
    float _566 = _520;
    float _568 = _522;
    int _570 = _528;
    bool _572 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _574 = isnan(0.5);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _580 = _576 || _578;
    float _582 = _566 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _584 = _566 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _586 = _566 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _588 = _566 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[0].x, _582);
    float _592 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[1].x, _584);
    float _594 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[2].x, _586);
    float _596 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[3].x, _588);
    out.m_59.x = _568;
    out.m_59.y = _566;
    out.m_59.z = as_type<float>(_570);
    float _598 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[0].z, _590);
    float _600 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[1].z, _592);
    float _602 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[2].z, _594);
    float _604 = fma(as_type<float>(_570), (*spvDescriptorSet0.vp_c8)._m0[3].z, _596);
    float _606 = _568;
    float _608 = _566;
    if (_580)
    {
        _606 = 1.0;
    }
    float _610 = _606;
    float _612 = _610;
    if (!_580)
    {
        float _614 = as_type<float>(in.m_63.w);
        int _616 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _618 = _616 == 4;
        bool _620 = _616 == 8;
        bool _622 = _616 == 12;
        int _624 = as_type<int>(_614) << 16;
        int _626 = as_type<int>(_614) << 8;
        int _628 = as_type<int>(_614) << 24;
        int _630 = _624 >> 24;
        int _632 = _626 >> 24;
        int _634 = as_type<int>(_614) >> 24;
        int _636 = _628 >> 24;
        float _638 = float(_630);
        float _640 = float(_632);
        float _642 = float(_634);
        float _644 = _638 * 0.0078740157186985015869140625;
        float _646 = float(_636);
        float _648 = _640 * 0.0078740157186985015869140625;
        float _650 = _642 * 0.0078740157186985015869140625;
        float _652 = precise::min(_644, 1.0);
        float _654 = _646 * 0.0078740157186985015869140625;
        float _656 = precise::min(_648, 1.0);
        float _658 = precise::min(_650, 1.0);
        float _660 = precise::min(_654, 1.0);
        float _662 = precise::max(_652, -1.0);
        float _664 = precise::max(_656, -1.0);
        float _666 = precise::max(_658, -1.0);
        float _668 = precise::max(_660, -1.0);
        float _670 = _668;
        _608 = _662;
        if (_618)
        {
            _670 = _662;
        }
        float _672 = _670;
        float _674 = _672;
        if (_620)
        {
            _674 = _664;
        }
        float _676 = _674;
        float _678 = _676;
        if (_622)
        {
            _678 = _666;
        }
        float _680 = _678;
        float _682 = abs(_680);
        float _684 = (-0.0) + _682;
        _612 = _684;
    }
    float _686 = _612;
    float _688 = _608;
    float _690 = _600 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _692 = _686 != 0.0;
    bool _694 = isnan(_686);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = _598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _704 = _602 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _706 = _690 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _708 = _690 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _710 = _690 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _712 = _690 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[5].x, _706);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[4].x, _708);
    float _718 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[6].x, _710);
    float _720 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[7].x, _712);
    float _722 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _724 = _604 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _714);
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _716);
    float _730 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _718);
    float _732 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _720);
    float _734 = _722;
    float _736 = _688;
    int _738 = as_type<int>(_732);
    if (!_700)
    {
        _734 = 0.0;
    }
    float _740 = _734;
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _726);
    if (!_700)
    {
        _736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _744 = _736;
    float _746 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _728);
    float _748 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _730);
    float _750 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _732);
    float _752 = _740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    if (!_700)
    {
        float _754 = _744 * 5.0;
        _738 = as_type<int>(_754);
    }
    int _756 = _738;
    out.gl_Position.x = _746;
    out.gl_Position.y = _742;
    out.gl_Position.z = _748;
    out.gl_Position.w = _750;
    out.m_33.x = 1.0;
    out.m_65.w = _752;
    if (!_700)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_756);
        out.gl_Position.z = _2008;
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

