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
    constant _16* vp_c5 [[id(0)]];
    constant _16* vp_c11 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_38 [[attribute(4)]];
    uint4 m_31 [[attribute(6)]];
    float4 m_36 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(in.m_31.x);
    float _54 = as_type<float>(in.m_31.y);
    float _56 = in.m_34.x;
    float _58 = in.m_34.y;
    float _60 = in.m_34.z;
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    float _68 = in.m_36.w;
    int _71 = as_type<int>(_54) * 48;
    int _73 = as_type<int>(_52) * 48;
    int _75 = _71 + 16;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    uint _80 = uint(int(uint(int(_78)) >> uint(2)));
    int _82 = int(_78) & 3;
    float _84 = (*spvDescriptorSet0.vp_c5)._m0[int(_80)][_82];
    int _86 = int(_78) + 1;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    int _90 = _86 & 3;
    float _92 = (*spvDescriptorSet0.vp_c5)._m0[int(_88)][_90];
    float _94 = _60 + (-0.2599999904632568359375);
    float _96 = _68 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _98 = _94 * _94;
    float _100 = _66 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _104 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _102;
    int _106 = _73 + 16;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.vp_c5)._m0[int(_110)][_112];
    int _116 = int(_108) + 1;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    int _120 = _116 & 3;
    float _122 = (*spvDescriptorSet0.vp_c5)._m0[int(_118)][_120];
    float _124 = fma(_56, _56, _98);
    float _126 = fma(_64, (*spvDescriptorSet0.vp_c11)._m0[21].y, _96);
    float _128 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _130 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _128;
    float _132 = _104 * _104;
    float _134 = fma(_62, (*spvDescriptorSet0.vp_c11)._m0[21].x, _100);
    float _136 = _126 + _58;
    float _138 = rsqrt(_124);
    uint _140 = uint(int(uint(_71) >> uint(2)));
    uint _142 = uint(int(uint(int(_140)) >> uint(2)));
    int _144 = int(_140) & 3;
    float _146 = (*spvDescriptorSet0.vp_c5)._m0[int(_142)][_144];
    int _148 = int(_140) + 1;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    int _152 = _148 & 3;
    float _154 = (*spvDescriptorSet0.vp_c5)._m0[int(_150)][_152];
    float _156 = fma(_130, _130, _132);
    float _158 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _160 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _158;
    uint _162 = uint(int(uint(_73) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    float _178 = fma(_160, _160, _156);
    float _180 = _138 * _56;
    int _182 = _71 + 32;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    uint _186 = uint(int(uint(int(_184)) >> uint(2)));
    int _188 = int(_184) & 3;
    float _190 = (*spvDescriptorSet0.vp_c5)._m0[int(_186)][_188];
    int _192 = int(_184) + 1;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    int _196 = _192 & 3;
    float _198 = (*spvDescriptorSet0.vp_c5)._m0[int(_194)][_196];
    float _200 = _94 * _138;
    float _202 = sqrt(_178);
    float _204 = fma(_180, _134, _56);
    float _206 = in.m_38.x;
    float _208 = in.m_38.y;
    float _210 = fma(_200, _100, _60);
    int _212 = _71 + 24;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    uint _216 = uint(int(uint(int(_214)) >> uint(2)));
    int _218 = int(_214) & 3;
    float _220 = (*spvDescriptorSet0.vp_c5)._m0[int(_216)][_218];
    int _222 = int(_214) + 1;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    int _226 = _222 & 3;
    float _228 = (*spvDescriptorSet0.vp_c5)._m0[int(_224)][_226];
    int _230 = _73 + 32;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
    int _236 = int(_232) & 3;
    float _238 = (*spvDescriptorSet0.vp_c5)._m0[int(_234)][_236];
    int _240 = int(_232) + 1;
    uint _242 = uint(int(uint(_240) >> uint(2)));
    int _244 = _240 & 3;
    float _246 = (*spvDescriptorSet0.vp_c5)._m0[int(_242)][_244];
    float _248 = _136 * _92;
    bool _252 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _254 = isnan(_202);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _260 = _256 || _258;
    float _262 = fma(_204, _84, _248);
    int _264 = _73 + 24;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    uint _268 = uint(int(uint(int(_266)) >> uint(2)));
    int _270 = int(_266) & 3;
    float _272 = (*spvDescriptorSet0.vp_c5)._m0[int(_268)][_270];
    int _274 = int(_266) + 1;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    int _278 = _274 & 3;
    float _280 = (*spvDescriptorSet0.vp_c5)._m0[int(_276)][_278];
    float _282 = _136 * _122;
    float _284 = fma(_204, _114, _282);
    int _286 = _71 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    uint _290 = uint(int(uint(int(_288)) >> uint(2)));
    int _292 = int(_288) & 3;
    float _294 = (*spvDescriptorSet0.vp_c5)._m0[int(_290)][_292];
    int _296 = int(_288) + 1;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    int _300 = _296 & 3;
    float _302 = (*spvDescriptorSet0.vp_c5)._m0[int(_298)][_300];
    float _304 = _136 * _154;
    float _306 = fma(_204, _146, _304);
    int _308 = _73 + 8;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    uint _312 = uint(int(uint(int(_310)) >> uint(2)));
    int _314 = int(_310) & 3;
    float _316 = (*spvDescriptorSet0.vp_c5)._m0[int(_312)][_314];
    int _318 = int(_310) + 1;
    uint _320 = uint(int(uint(_318) >> uint(2)));
    int _322 = _318 & 3;
    float _324 = (*spvDescriptorSet0.vp_c5)._m0[int(_320)][_322];
    float _326 = _136 * _176;
    float _328 = fma(_204, _168, _326);
    int _330 = _71 + 40;
    uint _332 = uint(int(uint(_330) >> uint(2)));
    uint _334 = uint(int(uint(int(_332)) >> uint(2)));
    int _336 = int(_332) & 3;
    float _338 = (*spvDescriptorSet0.vp_c5)._m0[int(_334)][_336];
    int _340 = int(_332) + 1;
    uint _342 = uint(int(uint(_340) >> uint(2)));
    int _344 = _340 & 3;
    float _346 = (*spvDescriptorSet0.vp_c5)._m0[int(_342)][_344];
    float _348 = _136 * _198;
    float _350 = fma(_204, _190, _348);
    int _352 = _73 + 40;
    uint _354 = uint(int(uint(_352) >> uint(2)));
    uint _356 = uint(int(uint(int(_354)) >> uint(2)));
    int _358 = int(_354) & 3;
    float _360 = (*spvDescriptorSet0.vp_c5)._m0[int(_356)][_358];
    int _362 = int(_354) + 1;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    int _366 = _362 & 3;
    float _368 = (*spvDescriptorSet0.vp_c5)._m0[int(_364)][_366];
    float _370 = fma(_210, _220, _262);
    float _372 = _370 + _228;
    float _374 = _136 * _246;
    float _376 = _372 * _208;
    float _378 = fma(_204, _238, _374);
    float _380 = fma(_210, _272, _284);
    float _382 = _380 + _280;
    float _384 = fma(_210, _294, _306);
    float _386 = fma(_382, _206, _376);
    float _388 = _384 + _302;
    float _390 = _386 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _392 = _386 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _394 = fma(_210, _316, _328);
    float _396 = _388 * _208;
    float _398 = _394 + _324;
    float _400 = _386 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _402 = fma(_210, _338, _350);
    float _404 = fma(_398, _206, _396);
    float _406 = _402 + _346;
    float _408 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[3].x, _390);
    float _410 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[4].x, _400);
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[5].x, _392);
    float _414 = fma(_210, _360, _378);
    float _416 = _406 * _208;
    float _418 = _414 + _368;
    float _420 = fma(_418, _206, _416);
    float _422 = _206;
    if (!_260)
    {
        _422 = 1.0;
    }
    float _424 = _422;
    float _426 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[3].z, _408);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[4].z, _410);
    float _430 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[5].z, _412);
    float _432 = _426 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _434 = _428 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _436 = _430 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _438 = !_260;
    float _440 = _424;
    if (!_438)
    {
        bool _442 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _444 = isnan(_202);
        bool _446 = _442 || _444;
        bool _448 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _450 = _446 || _448;
        if (!_450)
        {
            float _452 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _454 = _202 + _452;
            float _456 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _458 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _456;
            float _460 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _462 = _460 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _464 = 1.0 / _458;
            float _466 = _454 * _464;
            float _468 = fma(_466, _462, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _440 = _468;
            _470 = true;
        }
        else
        {
            bool _472 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _474 = isnan(_202);
            bool _476 = _472 || _474;
            bool _478 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _480 = _476 || _478;
            if (!_480)
            {
                float _482 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _484 = _202 + _482;
                float _486 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _488 = _486 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _490 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _492 = _490 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _494 = 1.0 / _488;
                float _496 = _484 * _494;
                float _498 = fma(_496, _492, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _440 = _498;
                _470 = true;
            }
            else
            {
                _440 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _470 = false;
    float _500 = _440;
    float _502 = _500 + (-1.0);
    float _504 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _506 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _508 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _510 = fma(_434, _500, _504);
    float _512 = fma(_432, _500, _506);
    float _514 = fma(_436, _500, _508);
    float _516 = _510 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _518 = _510 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _520 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[2].x, _516);
    float _522 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[0].x, _518);
    float _524 = _510 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[2].z, _520);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[0].z, _522);
    float _530 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[1].x, _524);
    float _532 = _526 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _534 = _528 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[1].z, _530);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _540 = _532 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _544 = _534 + _542;
    float _546 = _536 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _548 = _540 * _540;
    float _550 = _546 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _552 = fma(_544, _544, _548);
    float _554 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[2].x, _550);
    float _556 = sqrt(_552);
    float _558 = fma(_532, (*spvDescriptorSet0.vp_c4)._m0[2].z, _554);
    float _560 = _558 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _562 = _556 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _564 = _514;
    float _566 = _558;
    float _568 = _536;
    float _570 = _560;
    if (!_562)
    {
        _564 = _534;
    }
    float _572 = _564;
    float _574 = _572;
    if (!_562)
    {
        _566 = _532;
    }
    float _576 = _566;
    float _578 = _576;
    if (!_562)
    {
        _568 = _546;
    }
    float _580 = _568;
    bool _582 = !_562;
    float _584 = _580;
    if (!_582)
    {
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _588 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _590 = _556 + _588;
        float _592 = _546 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _594 = rsqrt(_552);
        float _596 = _590 * _586;
        float _598 = _596 * 0.15915493667125701904296875;
        float _600 = _598 * 6.283185482025146484375;
        float _602 = cos(_600);
        float _604 = _598 * 6.283185482025146484375;
        float _606 = sin(_604);
        float _608 = _602 + (-1.0);
        float _610 = _608 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _612 = fma(_606, _592, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _614 = fma(_546, _602, _610);
        float _616 = _594 * _612;
        float _618 = _614 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _620 = fma(_544, _616, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _622 = fma(_540, _616, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _624 = fma(_620, (*spvDescriptorSet0.vp_c4)._m0[2].x, _618);
        float _626 = fma(_622, (*spvDescriptorSet0.vp_c4)._m0[2].z, _624);
        float _628 = _626 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _584 = _614;
        _574 = _620;
        _578 = _622;
        _570 = _628;
    }
    float _630 = _584;
    float _632 = _574;
    float _634 = _578;
    float _636 = _570;
    float _638 = _630 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _640 = _630 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c4)._m0[1].x, _638);
    float _644 = fma(_632, (*spvDescriptorSet0.vp_c4)._m0[0].x, _640);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c4)._m0[1].z, _642);
    float _648 = fma(_634, (*spvDescriptorSet0.vp_c4)._m0[0].z, _644);
    float _650 = _646 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _652 = _648 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _654 = _650 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _656 = _650 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _660 = _650 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _662 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[8].x, _654);
    float _664 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[7].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[9].x, _658);
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[10].x, _660);
    float _670 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[8].z, _662);
    float _672 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[7].z, _664);
    float _674 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[9].z, _666);
    float _676 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[10].z, _668);
    float _678 = _670 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _682 = _674 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _684 = _676 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _680;
    out.gl_Position.y = _678;
    out.gl_Position.z = _682;
    out.gl_Position.w = _684;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(in.m_31.x);
    float _54 = as_type<float>(in.m_31.y);
    float _56 = in.m_34.x;
    float _58 = in.m_34.y;
    float _60 = in.m_34.z;
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    float _68 = in.m_36.w;
    int _71 = as_type<int>(_54) * 48;
    int _73 = as_type<int>(_52) * 48;
    int _75 = _71 + 16;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    uint _80 = uint(int(uint(int(_78)) >> uint(2)));
    int _82 = int(_78) & 3;
    float _84 = (*spvDescriptorSet0.vp_c5)._m0[int(_80)][_82];
    int _86 = int(_78) + 1;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    int _90 = _86 & 3;
    float _92 = (*spvDescriptorSet0.vp_c5)._m0[int(_88)][_90];
    float _94 = _60 + (-0.2599999904632568359375);
    float _96 = _68 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _98 = _94 * _94;
    float _100 = _66 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _104 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _102;
    int _106 = _73 + 16;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.vp_c5)._m0[int(_110)][_112];
    int _116 = int(_108) + 1;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    int _120 = _116 & 3;
    float _122 = (*spvDescriptorSet0.vp_c5)._m0[int(_118)][_120];
    float _124 = fma(_56, _56, _98);
    float _126 = fma(_64, (*spvDescriptorSet0.vp_c11)._m0[21].y, _96);
    float _128 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _130 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _128;
    float _132 = _104 * _104;
    float _134 = fma(_62, (*spvDescriptorSet0.vp_c11)._m0[21].x, _100);
    float _136 = _126 + _58;
    float _138 = rsqrt(_124);
    uint _140 = uint(int(uint(_71) >> uint(2)));
    uint _142 = uint(int(uint(int(_140)) >> uint(2)));
    int _144 = int(_140) & 3;
    float _146 = (*spvDescriptorSet0.vp_c5)._m0[int(_142)][_144];
    int _148 = int(_140) + 1;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    int _152 = _148 & 3;
    float _154 = (*spvDescriptorSet0.vp_c5)._m0[int(_150)][_152];
    float _156 = fma(_130, _130, _132);
    float _158 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _160 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _158;
    uint _162 = uint(int(uint(_73) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    float _178 = fma(_160, _160, _156);
    float _180 = _138 * _56;
    int _182 = _71 + 32;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    uint _186 = uint(int(uint(int(_184)) >> uint(2)));
    int _188 = int(_184) & 3;
    float _190 = (*spvDescriptorSet0.vp_c5)._m0[int(_186)][_188];
    int _192 = int(_184) + 1;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    int _196 = _192 & 3;
    float _198 = (*spvDescriptorSet0.vp_c5)._m0[int(_194)][_196];
    float _200 = _94 * _138;
    float _202 = sqrt(_178);
    float _204 = fma(_180, _134, _56);
    float _206 = in.m_38.x;
    float _208 = in.m_38.y;
    float _210 = fma(_200, _100, _60);
    int _212 = _71 + 24;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    uint _216 = uint(int(uint(int(_214)) >> uint(2)));
    int _218 = int(_214) & 3;
    float _220 = (*spvDescriptorSet0.vp_c5)._m0[int(_216)][_218];
    int _222 = int(_214) + 1;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    int _226 = _222 & 3;
    float _228 = (*spvDescriptorSet0.vp_c5)._m0[int(_224)][_226];
    int _230 = _73 + 32;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
    int _236 = int(_232) & 3;
    float _238 = (*spvDescriptorSet0.vp_c5)._m0[int(_234)][_236];
    int _240 = int(_232) + 1;
    uint _242 = uint(int(uint(_240) >> uint(2)));
    int _244 = _240 & 3;
    float _246 = (*spvDescriptorSet0.vp_c5)._m0[int(_242)][_244];
    float _248 = _136 * _92;
    bool _252 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _254 = isnan(_202);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _260 = _256 || _258;
    float _262 = fma(_204, _84, _248);
    int _264 = _73 + 24;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    uint _268 = uint(int(uint(int(_266)) >> uint(2)));
    int _270 = int(_266) & 3;
    float _272 = (*spvDescriptorSet0.vp_c5)._m0[int(_268)][_270];
    int _274 = int(_266) + 1;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    int _278 = _274 & 3;
    float _280 = (*spvDescriptorSet0.vp_c5)._m0[int(_276)][_278];
    float _282 = _136 * _122;
    float _284 = fma(_204, _114, _282);
    int _286 = _71 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    uint _290 = uint(int(uint(int(_288)) >> uint(2)));
    int _292 = int(_288) & 3;
    float _294 = (*spvDescriptorSet0.vp_c5)._m0[int(_290)][_292];
    int _296 = int(_288) + 1;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    int _300 = _296 & 3;
    float _302 = (*spvDescriptorSet0.vp_c5)._m0[int(_298)][_300];
    float _304 = _136 * _154;
    float _306 = fma(_204, _146, _304);
    int _308 = _73 + 8;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    uint _312 = uint(int(uint(int(_310)) >> uint(2)));
    int _314 = int(_310) & 3;
    float _316 = (*spvDescriptorSet0.vp_c5)._m0[int(_312)][_314];
    int _318 = int(_310) + 1;
    uint _320 = uint(int(uint(_318) >> uint(2)));
    int _322 = _318 & 3;
    float _324 = (*spvDescriptorSet0.vp_c5)._m0[int(_320)][_322];
    float _326 = _136 * _176;
    float _328 = fma(_204, _168, _326);
    int _330 = _71 + 40;
    uint _332 = uint(int(uint(_330) >> uint(2)));
    uint _334 = uint(int(uint(int(_332)) >> uint(2)));
    int _336 = int(_332) & 3;
    float _338 = (*spvDescriptorSet0.vp_c5)._m0[int(_334)][_336];
    int _340 = int(_332) + 1;
    uint _342 = uint(int(uint(_340) >> uint(2)));
    int _344 = _340 & 3;
    float _346 = (*spvDescriptorSet0.vp_c5)._m0[int(_342)][_344];
    float _348 = _136 * _198;
    float _350 = fma(_204, _190, _348);
    int _352 = _73 + 40;
    uint _354 = uint(int(uint(_352) >> uint(2)));
    uint _356 = uint(int(uint(int(_354)) >> uint(2)));
    int _358 = int(_354) & 3;
    float _360 = (*spvDescriptorSet0.vp_c5)._m0[int(_356)][_358];
    int _362 = int(_354) + 1;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    int _366 = _362 & 3;
    float _368 = (*spvDescriptorSet0.vp_c5)._m0[int(_364)][_366];
    float _370 = fma(_210, _220, _262);
    float _372 = _370 + _228;
    float _374 = _136 * _246;
    float _376 = _372 * _208;
    float _378 = fma(_204, _238, _374);
    float _380 = fma(_210, _272, _284);
    float _382 = _380 + _280;
    float _384 = fma(_210, _294, _306);
    float _386 = fma(_382, _206, _376);
    float _388 = _384 + _302;
    float _390 = _386 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _392 = _386 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _394 = fma(_210, _316, _328);
    float _396 = _388 * _208;
    float _398 = _394 + _324;
    float _400 = _386 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _402 = fma(_210, _338, _350);
    float _404 = fma(_398, _206, _396);
    float _406 = _402 + _346;
    float _408 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[3].x, _390);
    float _410 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[4].x, _400);
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[5].x, _392);
    float _414 = fma(_210, _360, _378);
    float _416 = _406 * _208;
    float _418 = _414 + _368;
    float _420 = fma(_418, _206, _416);
    float _422 = _206;
    if (!_260)
    {
        _422 = 1.0;
    }
    float _424 = _422;
    float _426 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[3].z, _408);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[4].z, _410);
    float _430 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[5].z, _412);
    float _432 = _426 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _434 = _428 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _436 = _430 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _438 = !_260;
    float _440 = _424;
    if (!_438)
    {
        bool _442 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _444 = isnan(_202);
        bool _446 = _442 || _444;
        bool _448 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _450 = _446 || _448;
        if (!_450)
        {
            float _452 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _454 = _202 + _452;
            float _456 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _458 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _456;
            float _460 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _462 = _460 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _464 = 1.0 / _458;
            float _466 = _454 * _464;
            float _468 = fma(_466, _462, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _440 = _468;
            _470 = true;
        }
        else
        {
            bool _472 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _474 = isnan(_202);
            bool _476 = _472 || _474;
            bool _478 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _480 = _476 || _478;
            if (!_480)
            {
                float _482 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _484 = _202 + _482;
                float _486 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _488 = _486 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _490 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _492 = _490 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _494 = 1.0 / _488;
                float _496 = _484 * _494;
                float _498 = fma(_496, _492, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _440 = _498;
                _470 = true;
            }
            else
            {
                _440 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _470 = false;
    float _500 = _440;
    float _502 = _500 + (-1.0);
    float _504 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _506 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _508 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _510 = fma(_434, _500, _504);
    float _512 = fma(_432, _500, _506);
    float _514 = fma(_436, _500, _508);
    float _516 = _510 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _518 = _510 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _520 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[2].x, _516);
    float _522 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[0].x, _518);
    float _524 = _510 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[2].z, _520);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[0].z, _522);
    float _530 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[1].x, _524);
    float _532 = _526 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _534 = _528 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[1].z, _530);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _540 = _532 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _544 = _534 + _542;
    float _546 = _536 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _548 = _540 * _540;
    float _550 = _546 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _552 = fma(_544, _544, _548);
    float _554 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[2].x, _550);
    float _556 = sqrt(_552);
    float _558 = fma(_532, (*spvDescriptorSet0.vp_c4)._m0[2].z, _554);
    float _560 = _558 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _562 = _556 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _564 = _514;
    float _566 = _558;
    float _568 = _536;
    float _570 = _560;
    if (!_562)
    {
        _564 = _534;
    }
    float _572 = _564;
    float _574 = _572;
    if (!_562)
    {
        _566 = _532;
    }
    float _576 = _566;
    float _578 = _576;
    if (!_562)
    {
        _568 = _546;
    }
    float _580 = _568;
    bool _582 = !_562;
    float _584 = _580;
    if (!_582)
    {
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _588 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _590 = _556 + _588;
        float _592 = _546 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _594 = rsqrt(_552);
        float _596 = _590 * _586;
        float _598 = _596 * 0.15915493667125701904296875;
        float _600 = _598 * 6.283185482025146484375;
        float _602 = cos(_600);
        float _604 = _598 * 6.283185482025146484375;
        float _606 = sin(_604);
        float _608 = _602 + (-1.0);
        float _610 = _608 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _612 = fma(_606, _592, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _614 = fma(_546, _602, _610);
        float _616 = _594 * _612;
        float _618 = _614 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _620 = fma(_544, _616, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _622 = fma(_540, _616, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _624 = fma(_620, (*spvDescriptorSet0.vp_c4)._m0[2].x, _618);
        float _626 = fma(_622, (*spvDescriptorSet0.vp_c4)._m0[2].z, _624);
        float _628 = _626 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _584 = _614;
        _574 = _620;
        _578 = _622;
        _570 = _628;
    }
    float _630 = _584;
    float _632 = _574;
    float _634 = _578;
    float _636 = _570;
    float _638 = _630 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _640 = _630 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c4)._m0[1].x, _638);
    float _644 = fma(_632, (*spvDescriptorSet0.vp_c4)._m0[0].x, _640);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c4)._m0[1].z, _642);
    float _648 = fma(_634, (*spvDescriptorSet0.vp_c4)._m0[0].z, _644);
    float _650 = _646 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _652 = _648 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _654 = _650 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _656 = _650 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _660 = _650 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _662 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[8].x, _654);
    float _664 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[7].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[9].x, _658);
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[10].x, _660);
    float _670 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[8].z, _662);
    float _672 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[7].z, _664);
    float _674 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[9].z, _666);
    float _676 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[10].z, _668);
    float _678 = _670 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _682 = _674 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _684 = _676 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _680;
    out.gl_Position.y = _678;
    out.gl_Position.z = _682;
    out.gl_Position.w = _684;
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
    bool _470 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = as_type<float>(in.m_31.x);
    float _54 = as_type<float>(in.m_31.y);
    float _56 = in.m_34.x;
    float _58 = in.m_34.y;
    float _60 = in.m_34.z;
    float _62 = in.m_36.x;
    float _64 = in.m_36.y;
    float _66 = in.m_36.z;
    float _68 = in.m_36.w;
    int _71 = as_type<int>(_54) * 48;
    int _73 = as_type<int>(_52) * 48;
    int _75 = _71 + 16;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    uint _80 = uint(int(uint(int(_78)) >> uint(2)));
    int _82 = int(_78) & 3;
    float _84 = (*spvDescriptorSet0.vp_c5)._m0[int(_80)][_82];
    int _86 = int(_78) + 1;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    int _90 = _86 & 3;
    float _92 = (*spvDescriptorSet0.vp_c5)._m0[int(_88)][_90];
    float _94 = _60 + (-0.2599999904632568359375);
    float _96 = _68 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _98 = _94 * _94;
    float _100 = _66 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _102 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _104 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _102;
    int _106 = _73 + 16;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.vp_c5)._m0[int(_110)][_112];
    int _116 = int(_108) + 1;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    int _120 = _116 & 3;
    float _122 = (*spvDescriptorSet0.vp_c5)._m0[int(_118)][_120];
    float _124 = fma(_56, _56, _98);
    float _126 = fma(_64, (*spvDescriptorSet0.vp_c11)._m0[21].y, _96);
    float _128 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _130 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _128;
    float _132 = _104 * _104;
    float _134 = fma(_62, (*spvDescriptorSet0.vp_c11)._m0[21].x, _100);
    float _136 = _126 + _58;
    float _138 = rsqrt(_124);
    uint _140 = uint(int(uint(_71) >> uint(2)));
    uint _142 = uint(int(uint(int(_140)) >> uint(2)));
    int _144 = int(_140) & 3;
    float _146 = (*spvDescriptorSet0.vp_c5)._m0[int(_142)][_144];
    int _148 = int(_140) + 1;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    int _152 = _148 & 3;
    float _154 = (*spvDescriptorSet0.vp_c5)._m0[int(_150)][_152];
    float _156 = fma(_130, _130, _132);
    float _158 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _160 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _158;
    uint _162 = uint(int(uint(_73) >> uint(2)));
    uint _164 = uint(int(uint(int(_162)) >> uint(2)));
    int _166 = int(_162) & 3;
    float _168 = (*spvDescriptorSet0.vp_c5)._m0[int(_164)][_166];
    int _170 = int(_162) + 1;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    int _174 = _170 & 3;
    float _176 = (*spvDescriptorSet0.vp_c5)._m0[int(_172)][_174];
    float _178 = fma(_160, _160, _156);
    float _180 = _138 * _56;
    int _182 = _71 + 32;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    uint _186 = uint(int(uint(int(_184)) >> uint(2)));
    int _188 = int(_184) & 3;
    float _190 = (*spvDescriptorSet0.vp_c5)._m0[int(_186)][_188];
    int _192 = int(_184) + 1;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    int _196 = _192 & 3;
    float _198 = (*spvDescriptorSet0.vp_c5)._m0[int(_194)][_196];
    float _200 = _94 * _138;
    float _202 = sqrt(_178);
    float _204 = fma(_180, _134, _56);
    float _206 = in.m_38.x;
    float _208 = in.m_38.y;
    float _210 = fma(_200, _100, _60);
    int _212 = _71 + 24;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    uint _216 = uint(int(uint(int(_214)) >> uint(2)));
    int _218 = int(_214) & 3;
    float _220 = (*spvDescriptorSet0.vp_c5)._m0[int(_216)][_218];
    int _222 = int(_214) + 1;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    int _226 = _222 & 3;
    float _228 = (*spvDescriptorSet0.vp_c5)._m0[int(_224)][_226];
    int _230 = _73 + 32;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
    int _236 = int(_232) & 3;
    float _238 = (*spvDescriptorSet0.vp_c5)._m0[int(_234)][_236];
    int _240 = int(_232) + 1;
    uint _242 = uint(int(uint(_240) >> uint(2)));
    int _244 = _240 & 3;
    float _246 = (*spvDescriptorSet0.vp_c5)._m0[int(_242)][_244];
    float _248 = _136 * _92;
    bool _252 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _254 = isnan(_202);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _260 = _256 || _258;
    float _262 = fma(_204, _84, _248);
    int _264 = _73 + 24;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    uint _268 = uint(int(uint(int(_266)) >> uint(2)));
    int _270 = int(_266) & 3;
    float _272 = (*spvDescriptorSet0.vp_c5)._m0[int(_268)][_270];
    int _274 = int(_266) + 1;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    int _278 = _274 & 3;
    float _280 = (*spvDescriptorSet0.vp_c5)._m0[int(_276)][_278];
    float _282 = _136 * _122;
    float _284 = fma(_204, _114, _282);
    int _286 = _71 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    uint _290 = uint(int(uint(int(_288)) >> uint(2)));
    int _292 = int(_288) & 3;
    float _294 = (*spvDescriptorSet0.vp_c5)._m0[int(_290)][_292];
    int _296 = int(_288) + 1;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    int _300 = _296 & 3;
    float _302 = (*spvDescriptorSet0.vp_c5)._m0[int(_298)][_300];
    float _304 = _136 * _154;
    float _306 = fma(_204, _146, _304);
    int _308 = _73 + 8;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    uint _312 = uint(int(uint(int(_310)) >> uint(2)));
    int _314 = int(_310) & 3;
    float _316 = (*spvDescriptorSet0.vp_c5)._m0[int(_312)][_314];
    int _318 = int(_310) + 1;
    uint _320 = uint(int(uint(_318) >> uint(2)));
    int _322 = _318 & 3;
    float _324 = (*spvDescriptorSet0.vp_c5)._m0[int(_320)][_322];
    float _326 = _136 * _176;
    float _328 = fma(_204, _168, _326);
    int _330 = _71 + 40;
    uint _332 = uint(int(uint(_330) >> uint(2)));
    uint _334 = uint(int(uint(int(_332)) >> uint(2)));
    int _336 = int(_332) & 3;
    float _338 = (*spvDescriptorSet0.vp_c5)._m0[int(_334)][_336];
    int _340 = int(_332) + 1;
    uint _342 = uint(int(uint(_340) >> uint(2)));
    int _344 = _340 & 3;
    float _346 = (*spvDescriptorSet0.vp_c5)._m0[int(_342)][_344];
    float _348 = _136 * _198;
    float _350 = fma(_204, _190, _348);
    int _352 = _73 + 40;
    uint _354 = uint(int(uint(_352) >> uint(2)));
    uint _356 = uint(int(uint(int(_354)) >> uint(2)));
    int _358 = int(_354) & 3;
    float _360 = (*spvDescriptorSet0.vp_c5)._m0[int(_356)][_358];
    int _362 = int(_354) + 1;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    int _366 = _362 & 3;
    float _368 = (*spvDescriptorSet0.vp_c5)._m0[int(_364)][_366];
    float _370 = fma(_210, _220, _262);
    float _372 = _370 + _228;
    float _374 = _136 * _246;
    float _376 = _372 * _208;
    float _378 = fma(_204, _238, _374);
    float _380 = fma(_210, _272, _284);
    float _382 = _380 + _280;
    float _384 = fma(_210, _294, _306);
    float _386 = fma(_382, _206, _376);
    float _388 = _384 + _302;
    float _390 = _386 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _392 = _386 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _394 = fma(_210, _316, _328);
    float _396 = _388 * _208;
    float _398 = _394 + _324;
    float _400 = _386 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _402 = fma(_210, _338, _350);
    float _404 = fma(_398, _206, _396);
    float _406 = _402 + _346;
    float _408 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[3].x, _390);
    float _410 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[4].x, _400);
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c6)._m0[5].x, _392);
    float _414 = fma(_210, _360, _378);
    float _416 = _406 * _208;
    float _418 = _414 + _368;
    float _420 = fma(_418, _206, _416);
    float _422 = _206;
    if (!_260)
    {
        _422 = 1.0;
    }
    float _424 = _422;
    float _426 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[3].z, _408);
    float _428 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[4].z, _410);
    float _430 = fma(_420, (*spvDescriptorSet0.vp_c6)._m0[5].z, _412);
    float _432 = _426 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _434 = _428 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _436 = _430 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _438 = !_260;
    float _440 = _424;
    if (!_438)
    {
        bool _442 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _444 = isnan(_202);
        bool _446 = _442 || _444;
        bool _448 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _450 = _446 || _448;
        if (!_450)
        {
            float _452 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _454 = _202 + _452;
            float _456 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _458 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _456;
            float _460 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _462 = _460 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _464 = 1.0 / _458;
            float _466 = _454 * _464;
            float _468 = fma(_466, _462, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _440 = _468;
            _470 = true;
        }
        else
        {
            bool _472 = _202 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _474 = isnan(_202);
            bool _476 = _472 || _474;
            bool _478 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _480 = _476 || _478;
            if (!_480)
            {
                float _482 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _484 = _202 + _482;
                float _486 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _488 = _486 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _490 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _492 = _490 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _494 = 1.0 / _488;
                float _496 = _484 * _494;
                float _498 = fma(_496, _492, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _440 = _498;
                _470 = true;
            }
            else
            {
                _440 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _470 = false;
    float _500 = _440;
    float _502 = _500 + (-1.0);
    float _504 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _506 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _508 = _502 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _510 = fma(_434, _500, _504);
    float _512 = fma(_432, _500, _506);
    float _514 = fma(_436, _500, _508);
    float _516 = _510 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _518 = _510 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _520 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[2].x, _516);
    float _522 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[0].x, _518);
    float _524 = _510 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[2].z, _520);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[0].z, _522);
    float _530 = fma(_512, (*spvDescriptorSet0.vp_c6)._m0[1].x, _524);
    float _532 = _526 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _534 = _528 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c6)._m0[1].z, _530);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _540 = _532 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _544 = _534 + _542;
    float _546 = _536 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _548 = _540 * _540;
    float _550 = _546 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _552 = fma(_544, _544, _548);
    float _554 = fma(_534, (*spvDescriptorSet0.vp_c4)._m0[2].x, _550);
    float _556 = sqrt(_552);
    float _558 = fma(_532, (*spvDescriptorSet0.vp_c4)._m0[2].z, _554);
    float _560 = _558 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _562 = _556 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _564 = _514;
    float _566 = _558;
    float _568 = _536;
    float _570 = _560;
    if (!_562)
    {
        _564 = _534;
    }
    float _572 = _564;
    float _574 = _572;
    if (!_562)
    {
        _566 = _532;
    }
    float _576 = _566;
    float _578 = _576;
    if (!_562)
    {
        _568 = _546;
    }
    float _580 = _568;
    bool _582 = !_562;
    float _584 = _580;
    if (!_582)
    {
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _588 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _590 = _556 + _588;
        float _592 = _546 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _594 = rsqrt(_552);
        float _596 = _590 * _586;
        float _598 = _596 * 0.15915493667125701904296875;
        float _600 = _598 * 6.283185482025146484375;
        float _602 = cos(_600);
        float _604 = _598 * 6.283185482025146484375;
        float _606 = sin(_604);
        float _608 = _602 + (-1.0);
        float _610 = _608 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _612 = fma(_606, _592, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _614 = fma(_546, _602, _610);
        float _616 = _594 * _612;
        float _618 = _614 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _620 = fma(_544, _616, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _622 = fma(_540, _616, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _624 = fma(_620, (*spvDescriptorSet0.vp_c4)._m0[2].x, _618);
        float _626 = fma(_622, (*spvDescriptorSet0.vp_c4)._m0[2].z, _624);
        float _628 = _626 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _584 = _614;
        _574 = _620;
        _578 = _622;
        _570 = _628;
    }
    float _630 = _584;
    float _632 = _574;
    float _634 = _578;
    float _636 = _570;
    float _638 = _630 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _640 = _630 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c4)._m0[1].x, _638);
    float _644 = fma(_632, (*spvDescriptorSet0.vp_c4)._m0[0].x, _640);
    float _646 = fma(_634, (*spvDescriptorSet0.vp_c4)._m0[1].z, _642);
    float _648 = fma(_634, (*spvDescriptorSet0.vp_c4)._m0[0].z, _644);
    float _650 = _646 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _652 = _648 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _654 = _650 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _656 = _650 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _658 = _650 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _660 = _650 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _662 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[8].x, _654);
    float _664 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[7].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[9].x, _658);
    float _668 = fma(_652, (*spvDescriptorSet0.vp_c4)._m0[10].x, _660);
    float _670 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[8].z, _662);
    float _672 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[7].z, _664);
    float _674 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[9].z, _666);
    float _676 = fma(_636, (*spvDescriptorSet0.vp_c4)._m0[10].z, _668);
    float _678 = _670 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _682 = _674 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _684 = _676 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _680;
    out.gl_Position.y = _678;
    out.gl_Position.z = _682;
    out.gl_Position.w = _684;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

