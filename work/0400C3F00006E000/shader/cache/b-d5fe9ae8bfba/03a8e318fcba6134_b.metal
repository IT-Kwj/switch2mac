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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>(in.m_36.y);
    float _64 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _66 = in.m_39.x;
    float _68 = in.m_39.y;
    float _70 = in.m_39.z;
    float _72 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _74 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _72;
    float _76 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _78 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _76;
    int _81 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _83 = _81 + as_type<int>(_60);
    int _85 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _87 = _85 + as_type<int>(_62);
    int _89 = _83 * 48;
    int _91 = _87 * 48;
    int _93 = _89 + 16;
    int _95 = _91 + 16;
    int _97 = _91 + 32;
    int _99 = _91 + 48;
    uint _102 = uint(int(uint(_93) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_102)];
    float _104 = as_type<float>(_dmw0.x);
    int _106 = _93 + 4;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    float _110 = as_type<float>(_dmw0.y);
    int _112 = _93 + 8;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw0.z);
    int _118 = _93 + 12;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.w);
    int _124 = _89 + 32;
    int _126 = _89 + 48;
    uint _128 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw3.x);
    int _132 = _95 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw3.y);
    int _138 = _95 + 8;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw3.z);
    int _144 = _95 + 12;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw3.w);
    uint _150 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_150)];
    float _152 = as_type<float>(_dmw4.x);
    int _154 = _97 + 4;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>(_dmw4.y);
    int _160 = _97 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>(_dmw4.z);
    int _166 = _97 + 12;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>(_dmw4.w);
    uint _172 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_172)];
    float _174 = as_type<float>(_dmw5.x);
    int _176 = _99 + 4;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>(_dmw5.y);
    int _182 = _99 + 8;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>(_dmw5.z);
    int _188 = _99 + 12;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>(_dmw5.w);
    uint _194 = uint(int(uint(_124) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_194)];
    float _196 = as_type<float>(_dmw1.x);
    int _198 = _124 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>(_dmw1.y);
    int _204 = _124 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>(_dmw1.z);
    int _210 = _124 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>(_dmw1.w);
    uint _216 = uint(int(uint(_126) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_216)];
    float _218 = as_type<float>(_dmw2.x);
    int _220 = _126 + 4;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>(_dmw2.y);
    int _226 = _126 + 8;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>(_dmw2.z);
    int _232 = _126 + 12;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>(_dmw2.w);
    float _238 = _74 * _74;
    float _240 = fma(_78, _78, _238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _244 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _242;
    float _246 = fma(_244, _244, _240);
    float _248 = in.m_41.x;
    float _250 = in.m_41.y;
    float _252 = sqrt(_246);
    bool _256 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _264 = _260 || _262;
    float _266 = _110 * _68;
    float _268 = _136 * _68;
    float _270 = _158 * _68;
    float _272 = fma(_130, _66, _268);
    float _274 = _180 * _68;
    float _276 = fma(_152, _66, _270);
    float _278 = _202 * _68;
    float _280 = fma(_174, _66, _274);
    float _282 = _224 * _68;
    float _284 = fma(_104, _66, _266);
    float _286 = fma(_196, _66, _278);
    float _288 = fma(_142, _70, _272);
    float _290 = fma(_164, _70, _276);
    float _292 = fma(_218, _66, _282);
    float _294 = fma(_186, _70, _280);
    float _296 = fma(_116, _70, _284);
    float _298 = fma(_208, _70, _286);
    float _300 = _148 + _288;
    float _302 = _170 + _290;
    float _304 = fma(_230, _70, _292);
    float _306 = _192 + _294;
    float _308 = _122 + _296;
    float _310 = _214 + _298;
    float _312 = _300 * _250;
    float _314 = _302 * _250;
    float _316 = _236 + _304;
    float _318 = _306 * _250;
    float _320 = fma(_308, _248, _312);
    float _322 = fma(_310, _248, _314);
    float _324 = _284;
    if (!_264)
    {
        _324 = 1.0;
    }
    float _326 = _324;
    float _328 = fma(_316, _248, _318);
    bool _330 = !_264;
    float _332 = _326;
    if (!_330)
    {
        bool _334 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _336 = isnan(_252);
        bool _338 = _334 || _336;
        bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _342 = _338 || _340;
        if (!_342)
        {
            float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _346 = _252 + _344;
            float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _350 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _348;
            float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _356 = 1.0 / _350;
            float _358 = _346 * _356;
            float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _332 = _360;
            _362 = true;
        }
        else
        {
            bool _364 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _366 = isnan(_252);
            bool _368 = _364 || _366;
            bool _370 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _372 = _368 || _370;
            if (!_372)
            {
                float _374 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _376 = _252 + _374;
                float _378 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _380 = _378 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _382 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _384 = _382 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _386 = 1.0 / _380;
                float _388 = _376 * _386;
                float _390 = fma(_388, _384, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _332 = _390;
                _362 = true;
            }
            else
            {
                _332 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _362 = false;
    float _392 = _332;
    float _394 = -(*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[26].z + _394;
    float _398 = -(*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[26].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[26].x + _402;
    float _406 = _396 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _408 = _400 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _410 = _404 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _412 = -_406;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[2].y, _412);
    float _416 = -_408;
    float _418 = fma(_396, (*spvDescriptorSet0.vp_c7)._m0[1].y, _416);
    float _420 = -_410;
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c7)._m0[0].y, _420);
    float _424 = _414 * _414;
    float _426 = _418 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _428 = _414 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _432 = fma(_418, _418, _424);
    float _434 = -_426;
    float _436 = fma(_422, (*spvDescriptorSet0.vp_c7)._m0[0].y, _434);
    float _438 = -_428;
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c7)._m0[1].y, _438);
    float _442 = -_430;
    float _444 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[2].y, _442);
    float _446 = fma(_422, _422, _432);
    float _448 = _436 * _436;
    float _450 = 1.0 / _446;
    float _452 = fma(_444, _444, _448);
    float _454 = fma(_440, _440, _452);
    float _456 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _458 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _456);
    float _460 = 1.0 / _454;
    float _462 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _464 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _458);
    float _466 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _462);
    float _468 = _464 * _450;
    float _470 = _392 + (-1.0);
    float _472 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _474 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _466);
    float _476 = sqrt(_468);
    float _478 = _474 * _460;
    float _480 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _482 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _484 = fma(_322, _392, _480);
    float _486 = sqrt(_478);
    float _488 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _490 = fma(_320, _392, _482);
    float _492 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _494 = _484 * _472;
    float _496 = fma(_422, _476, 9.9999997473787516355514526367188e-06);
    float _498 = fma(_328, _392, _488);
    float _500 = fma(_418, _476, 9.9999997473787516355514526367188e-06);
    float _502 = _484 * _492;
    float _504 = fma(_490, _496, _494);
    float _506 = fma(_414, _476, 9.9999997473787516355514526367188e-06);
    float _508 = fma(_490, _500, _502);
    float _510 = fma(_440, _486, 9.9999997473787516355514526367188e-06);
    float _512 = fma(_444, _486, 9.9999997473787516355514526367188e-06);
    float _514 = fma(_436, _486, 9.9999997473787516355514526367188e-06);
    float _516 = fma(_498, _510, _504);
    float _518 = fma(_498, _512, _508);
    float _520 = _516 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _522 = _518 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _524 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _528 = _520 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _532 = _522 + _530;
    float _534 = _484 * _524;
    float _536 = _528 * _528;
    float _538 = fma(_490, _506, _534);
    float _540 = fma(_532, _532, _536);
    float _542 = fma(_498, _514, _538);
    float _544 = sqrt(_540);
    float _546 = _542 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _548 = _546 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[2].x, _548);
    float _552 = fma(_520, (*spvDescriptorSet0.vp_c4)._m0[2].z, _550);
    bool _554 = _544 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _556 = _552 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _558 = _414;
    float _560 = _552;
    float _562 = _498;
    float _564 = _556;
    if (!_554)
    {
        _558 = _522;
    }
    float _566 = _558;
    float _568 = _566;
    if (!_554)
    {
        _560 = _520;
    }
    float _570 = _560;
    float _572 = _570;
    if (!_554)
    {
        _562 = _546;
    }
    float _574 = _562;
    bool _576 = !_554;
    float _578 = _574;
    if (!_576)
    {
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _582 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _584 = _544 + _582;
        float _586 = _546 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _588 = rsqrt(_540);
        float _590 = _584 * _580;
        float _592 = _590 * 0.15915493667125701904296875;
        float _594 = _592 * 6.283185482025146484375;
        float _596 = cos(_594);
        float _598 = _592 * 6.283185482025146484375;
        float _600 = sin(_598);
        float _602 = _596 + (-1.0);
        float _604 = _602 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _606 = fma(_600, _586, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _608 = fma(_546, _596, _604);
        float _610 = _588 * _606;
        float _612 = _608 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _614 = fma(_532, _610, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _616 = fma(_528, _610, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _618 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[2].x, _612);
        float _620 = fma(_616, (*spvDescriptorSet0.vp_c4)._m0[2].z, _618);
        float _622 = _620 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _578 = _608;
        _568 = _614;
        _572 = _616;
        _564 = _622;
    }
    float _624 = _578;
    float _626 = _568;
    float _628 = _572;
    float _630 = _564;
    float _632 = _624 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _634 = _624 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _636 = in.m_43.x;
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c4)._m0[1].x, _632);
    float _640 = fma(_626, (*spvDescriptorSet0.vp_c4)._m0[0].x, _634);
    float _642 = in.m_43.y;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c4)._m0[1].z, _638);
    float _646 = fma(_628, (*spvDescriptorSet0.vp_c4)._m0[0].z, _640);
    float _648 = _644 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _650 = _646 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _652 = _648 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _654 = _648 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _656 = _648 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _658 = _648 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[8].x, _652);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[7].x, _654);
    float _664 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[9].x, _656);
    float _666 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[10].x, _658);
    float _668 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[8].z, _660);
    float _670 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[7].z, _662);
    float _672 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[9].z, _664);
    float _674 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[10].z, _666);
    float _676 = _670 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _678 = _668 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _682 = _674 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _636;
    out.m_46.y = _642;
    out.gl_Position.x = _676;
    out.gl_Position.y = _678;
    out.gl_Position.z = _680;
    out.gl_Position.w = _682;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>(in.m_36.y);
    float _64 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _66 = in.m_39.x;
    float _68 = in.m_39.y;
    float _70 = in.m_39.z;
    float _72 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _74 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _72;
    float _76 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _78 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _76;
    int _81 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _83 = _81 + as_type<int>(_60);
    int _85 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _87 = _85 + as_type<int>(_62);
    int _89 = _83 * 48;
    int _91 = _87 * 48;
    int _93 = _89 + 16;
    int _95 = _91 + 16;
    int _97 = _91 + 32;
    int _99 = _91 + 48;
    uint _102 = uint(int(uint(_93) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_102)];
    float _104 = as_type<float>(_dmw0.x);
    int _106 = _93 + 4;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    float _110 = as_type<float>(_dmw0.y);
    int _112 = _93 + 8;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw0.z);
    int _118 = _93 + 12;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.w);
    int _124 = _89 + 32;
    int _126 = _89 + 48;
    uint _128 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw3.x);
    int _132 = _95 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw3.y);
    int _138 = _95 + 8;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw3.z);
    int _144 = _95 + 12;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw3.w);
    uint _150 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_150)];
    float _152 = as_type<float>(_dmw4.x);
    int _154 = _97 + 4;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>(_dmw4.y);
    int _160 = _97 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>(_dmw4.z);
    int _166 = _97 + 12;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>(_dmw4.w);
    uint _172 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_172)];
    float _174 = as_type<float>(_dmw5.x);
    int _176 = _99 + 4;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>(_dmw5.y);
    int _182 = _99 + 8;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>(_dmw5.z);
    int _188 = _99 + 12;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>(_dmw5.w);
    uint _194 = uint(int(uint(_124) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_194)];
    float _196 = as_type<float>(_dmw1.x);
    int _198 = _124 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>(_dmw1.y);
    int _204 = _124 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>(_dmw1.z);
    int _210 = _124 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>(_dmw1.w);
    uint _216 = uint(int(uint(_126) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_216)];
    float _218 = as_type<float>(_dmw2.x);
    int _220 = _126 + 4;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>(_dmw2.y);
    int _226 = _126 + 8;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>(_dmw2.z);
    int _232 = _126 + 12;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>(_dmw2.w);
    float _238 = _74 * _74;
    float _240 = fma(_78, _78, _238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _244 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _242;
    float _246 = fma(_244, _244, _240);
    float _248 = in.m_41.x;
    float _250 = in.m_41.y;
    float _252 = sqrt(_246);
    bool _256 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _264 = _260 || _262;
    float _266 = _110 * _68;
    float _268 = _136 * _68;
    float _270 = _158 * _68;
    float _272 = fma(_130, _66, _268);
    float _274 = _180 * _68;
    float _276 = fma(_152, _66, _270);
    float _278 = _202 * _68;
    float _280 = fma(_174, _66, _274);
    float _282 = _224 * _68;
    float _284 = fma(_104, _66, _266);
    float _286 = fma(_196, _66, _278);
    float _288 = fma(_142, _70, _272);
    float _290 = fma(_164, _70, _276);
    float _292 = fma(_218, _66, _282);
    float _294 = fma(_186, _70, _280);
    float _296 = fma(_116, _70, _284);
    float _298 = fma(_208, _70, _286);
    float _300 = _148 + _288;
    float _302 = _170 + _290;
    float _304 = fma(_230, _70, _292);
    float _306 = _192 + _294;
    float _308 = _122 + _296;
    float _310 = _214 + _298;
    float _312 = _300 * _250;
    float _314 = _302 * _250;
    float _316 = _236 + _304;
    float _318 = _306 * _250;
    float _320 = fma(_308, _248, _312);
    float _322 = fma(_310, _248, _314);
    float _324 = _284;
    if (!_264)
    {
        _324 = 1.0;
    }
    float _326 = _324;
    float _328 = fma(_316, _248, _318);
    bool _330 = !_264;
    float _332 = _326;
    if (!_330)
    {
        bool _334 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _336 = isnan(_252);
        bool _338 = _334 || _336;
        bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _342 = _338 || _340;
        if (!_342)
        {
            float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _346 = _252 + _344;
            float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _350 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _348;
            float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _356 = 1.0 / _350;
            float _358 = _346 * _356;
            float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _332 = _360;
            _362 = true;
        }
        else
        {
            bool _364 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _366 = isnan(_252);
            bool _368 = _364 || _366;
            bool _370 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _372 = _368 || _370;
            if (!_372)
            {
                float _374 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _376 = _252 + _374;
                float _378 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _380 = _378 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _382 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _384 = _382 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _386 = 1.0 / _380;
                float _388 = _376 * _386;
                float _390 = fma(_388, _384, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _332 = _390;
                _362 = true;
            }
            else
            {
                _332 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _362 = false;
    float _392 = _332;
    float _394 = -(*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[26].z + _394;
    float _398 = -(*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[26].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[26].x + _402;
    float _406 = _396 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _408 = _400 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _410 = _404 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _412 = -_406;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[2].y, _412);
    float _416 = -_408;
    float _418 = fma(_396, (*spvDescriptorSet0.vp_c7)._m0[1].y, _416);
    float _420 = -_410;
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c7)._m0[0].y, _420);
    float _424 = _414 * _414;
    float _426 = _418 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _428 = _414 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _432 = fma(_418, _418, _424);
    float _434 = -_426;
    float _436 = fma(_422, (*spvDescriptorSet0.vp_c7)._m0[0].y, _434);
    float _438 = -_428;
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c7)._m0[1].y, _438);
    float _442 = -_430;
    float _444 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[2].y, _442);
    float _446 = fma(_422, _422, _432);
    float _448 = _436 * _436;
    float _450 = 1.0 / _446;
    float _452 = fma(_444, _444, _448);
    float _454 = fma(_440, _440, _452);
    float _456 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _458 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _456);
    float _460 = 1.0 / _454;
    float _462 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _464 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _458);
    float _466 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _462);
    float _468 = _464 * _450;
    float _470 = _392 + (-1.0);
    float _472 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _474 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _466);
    float _476 = sqrt(_468);
    float _478 = _474 * _460;
    float _480 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _482 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _484 = fma(_322, _392, _480);
    float _486 = sqrt(_478);
    float _488 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _490 = fma(_320, _392, _482);
    float _492 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _494 = _484 * _472;
    float _496 = fma(_422, _476, 9.9999997473787516355514526367188e-06);
    float _498 = fma(_328, _392, _488);
    float _500 = fma(_418, _476, 9.9999997473787516355514526367188e-06);
    float _502 = _484 * _492;
    float _504 = fma(_490, _496, _494);
    float _506 = fma(_414, _476, 9.9999997473787516355514526367188e-06);
    float _508 = fma(_490, _500, _502);
    float _510 = fma(_440, _486, 9.9999997473787516355514526367188e-06);
    float _512 = fma(_444, _486, 9.9999997473787516355514526367188e-06);
    float _514 = fma(_436, _486, 9.9999997473787516355514526367188e-06);
    float _516 = fma(_498, _510, _504);
    float _518 = fma(_498, _512, _508);
    float _520 = _516 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _522 = _518 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _524 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _528 = _520 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _532 = _522 + _530;
    float _534 = _484 * _524;
    float _536 = _528 * _528;
    float _538 = fma(_490, _506, _534);
    float _540 = fma(_532, _532, _536);
    float _542 = fma(_498, _514, _538);
    float _544 = sqrt(_540);
    float _546 = _542 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _548 = _546 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[2].x, _548);
    float _552 = fma(_520, (*spvDescriptorSet0.vp_c4)._m0[2].z, _550);
    bool _554 = _544 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _556 = _552 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _558 = _414;
    float _560 = _552;
    float _562 = _498;
    float _564 = _556;
    if (!_554)
    {
        _558 = _522;
    }
    float _566 = _558;
    float _568 = _566;
    if (!_554)
    {
        _560 = _520;
    }
    float _570 = _560;
    float _572 = _570;
    if (!_554)
    {
        _562 = _546;
    }
    float _574 = _562;
    bool _576 = !_554;
    float _578 = _574;
    if (!_576)
    {
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _582 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _584 = _544 + _582;
        float _586 = _546 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _588 = rsqrt(_540);
        float _590 = _584 * _580;
        float _592 = _590 * 0.15915493667125701904296875;
        float _594 = _592 * 6.283185482025146484375;
        float _596 = cos(_594);
        float _598 = _592 * 6.283185482025146484375;
        float _600 = sin(_598);
        float _602 = _596 + (-1.0);
        float _604 = _602 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _606 = fma(_600, _586, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _608 = fma(_546, _596, _604);
        float _610 = _588 * _606;
        float _612 = _608 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _614 = fma(_532, _610, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _616 = fma(_528, _610, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _618 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[2].x, _612);
        float _620 = fma(_616, (*spvDescriptorSet0.vp_c4)._m0[2].z, _618);
        float _622 = _620 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _578 = _608;
        _568 = _614;
        _572 = _616;
        _564 = _622;
    }
    float _624 = _578;
    float _626 = _568;
    float _628 = _572;
    float _630 = _564;
    float _632 = _624 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _634 = _624 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _636 = in.m_43.x;
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c4)._m0[1].x, _632);
    float _640 = fma(_626, (*spvDescriptorSet0.vp_c4)._m0[0].x, _634);
    float _642 = in.m_43.y;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c4)._m0[1].z, _638);
    float _646 = fma(_628, (*spvDescriptorSet0.vp_c4)._m0[0].z, _640);
    float _648 = _644 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _650 = _646 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _652 = _648 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _654 = _648 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _656 = _648 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _658 = _648 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[8].x, _652);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[7].x, _654);
    float _664 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[9].x, _656);
    float _666 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[10].x, _658);
    float _668 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[8].z, _660);
    float _670 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[7].z, _662);
    float _672 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[9].z, _664);
    float _674 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[10].z, _666);
    float _676 = _670 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _678 = _668 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _682 = _674 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _636;
    out.m_46.y = _642;
    out.gl_Position.x = _676;
    out.gl_Position.y = _678;
    out.gl_Position.z = _680;
    out.gl_Position.w = _682;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>(in.m_36.y);
    float _64 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _66 = in.m_39.x;
    float _68 = in.m_39.y;
    float _70 = in.m_39.z;
    float _72 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _74 = (*spvDescriptorSet0.vp_c7)._m0[1].w + _72;
    float _76 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _78 = (*spvDescriptorSet0.vp_c7)._m0[0].w + _76;
    int _81 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _83 = _81 + as_type<int>(_60);
    int _85 = as_type<int>(_64) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _87 = _85 + as_type<int>(_62);
    int _89 = _83 * 48;
    int _91 = _87 * 48;
    int _93 = _89 + 16;
    int _95 = _91 + 16;
    int _97 = _91 + 32;
    int _99 = _91 + 48;
    uint _102 = uint(int(uint(_93) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_102)];
    float _104 = as_type<float>(_dmw0.x);
    int _106 = _93 + 4;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    float _110 = as_type<float>(_dmw0.y);
    int _112 = _93 + 8;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw0.z);
    int _118 = _93 + 12;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.w);
    int _124 = _89 + 32;
    int _126 = _89 + 48;
    uint _128 = uint(int(uint(_95) >> uint(2)));
    packed_uint4 _dmw3 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw3.x);
    int _132 = _95 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw3.y);
    int _138 = _95 + 8;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw3.z);
    int _144 = _95 + 12;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw3.w);
    uint _150 = uint(int(uint(_97) >> uint(2)));
    packed_uint4 _dmw4 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_150)];
    float _152 = as_type<float>(_dmw4.x);
    int _154 = _97 + 4;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>(_dmw4.y);
    int _160 = _97 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>(_dmw4.z);
    int _166 = _97 + 12;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>(_dmw4.w);
    uint _172 = uint(int(uint(_99) >> uint(2)));
    packed_uint4 _dmw5 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_172)];
    float _174 = as_type<float>(_dmw5.x);
    int _176 = _99 + 4;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>(_dmw5.y);
    int _182 = _99 + 8;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>(_dmw5.z);
    int _188 = _99 + 12;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>(_dmw5.w);
    uint _194 = uint(int(uint(_124) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_194)];
    float _196 = as_type<float>(_dmw1.x);
    int _198 = _124 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>(_dmw1.y);
    int _204 = _124 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>(_dmw1.z);
    int _210 = _124 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>(_dmw1.w);
    uint _216 = uint(int(uint(_126) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_216)];
    float _218 = as_type<float>(_dmw2.x);
    int _220 = _126 + 4;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>(_dmw2.y);
    int _226 = _126 + 8;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>(_dmw2.z);
    int _232 = _126 + 12;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>(_dmw2.w);
    float _238 = _74 * _74;
    float _240 = fma(_78, _78, _238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _244 = (*spvDescriptorSet0.vp_c7)._m0[2].w + _242;
    float _246 = fma(_244, _244, _240);
    float _248 = in.m_41.x;
    float _250 = in.m_41.y;
    float _252 = sqrt(_246);
    bool _256 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _258 = isnan(_252);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _264 = _260 || _262;
    float _266 = _110 * _68;
    float _268 = _136 * _68;
    float _270 = _158 * _68;
    float _272 = fma(_130, _66, _268);
    float _274 = _180 * _68;
    float _276 = fma(_152, _66, _270);
    float _278 = _202 * _68;
    float _280 = fma(_174, _66, _274);
    float _282 = _224 * _68;
    float _284 = fma(_104, _66, _266);
    float _286 = fma(_196, _66, _278);
    float _288 = fma(_142, _70, _272);
    float _290 = fma(_164, _70, _276);
    float _292 = fma(_218, _66, _282);
    float _294 = fma(_186, _70, _280);
    float _296 = fma(_116, _70, _284);
    float _298 = fma(_208, _70, _286);
    float _300 = _148 + _288;
    float _302 = _170 + _290;
    float _304 = fma(_230, _70, _292);
    float _306 = _192 + _294;
    float _308 = _122 + _296;
    float _310 = _214 + _298;
    float _312 = _300 * _250;
    float _314 = _302 * _250;
    float _316 = _236 + _304;
    float _318 = _306 * _250;
    float _320 = fma(_308, _248, _312);
    float _322 = fma(_310, _248, _314);
    float _324 = _284;
    if (!_264)
    {
        _324 = 1.0;
    }
    float _326 = _324;
    float _328 = fma(_316, _248, _318);
    bool _330 = !_264;
    float _332 = _326;
    if (!_330)
    {
        bool _334 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _336 = isnan(_252);
        bool _338 = _334 || _336;
        bool _340 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _342 = _338 || _340;
        if (!_342)
        {
            float _344 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _346 = _252 + _344;
            float _348 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _350 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _348;
            float _352 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _354 = _352 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _356 = 1.0 / _350;
            float _358 = _346 * _356;
            float _360 = fma(_358, _354, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _332 = _360;
            _362 = true;
        }
        else
        {
            bool _364 = _252 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _366 = isnan(_252);
            bool _368 = _364 || _366;
            bool _370 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _372 = _368 || _370;
            if (!_372)
            {
                float _374 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _376 = _252 + _374;
                float _378 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _380 = _378 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _382 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _384 = _382 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _386 = 1.0 / _380;
                float _388 = _376 * _386;
                float _390 = fma(_388, _384, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _332 = _390;
                _362 = true;
            }
            else
            {
                _332 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _362 = false;
    float _392 = _332;
    float _394 = -(*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[26].z + _394;
    float _398 = -(*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[26].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[26].x + _402;
    float _406 = _396 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _408 = _400 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _410 = _404 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _412 = -_406;
    float _414 = fma(_404, (*spvDescriptorSet0.vp_c7)._m0[2].y, _412);
    float _416 = -_408;
    float _418 = fma(_396, (*spvDescriptorSet0.vp_c7)._m0[1].y, _416);
    float _420 = -_410;
    float _422 = fma(_400, (*spvDescriptorSet0.vp_c7)._m0[0].y, _420);
    float _424 = _414 * _414;
    float _426 = _418 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _428 = _414 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _430 = _422 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _432 = fma(_418, _418, _424);
    float _434 = -_426;
    float _436 = fma(_422, (*spvDescriptorSet0.vp_c7)._m0[0].y, _434);
    float _438 = -_428;
    float _440 = fma(_418, (*spvDescriptorSet0.vp_c7)._m0[1].y, _438);
    float _442 = -_430;
    float _444 = fma(_414, (*spvDescriptorSet0.vp_c7)._m0[2].y, _442);
    float _446 = fma(_422, _422, _432);
    float _448 = _436 * _436;
    float _450 = 1.0 / _446;
    float _452 = fma(_444, _444, _448);
    float _454 = fma(_440, _440, _452);
    float _456 = (*spvDescriptorSet0.vp_c7)._m0[1].x * (*spvDescriptorSet0.vp_c7)._m0[1].x;
    float _458 = fma((*spvDescriptorSet0.vp_c7)._m0[0].x, (*spvDescriptorSet0.vp_c7)._m0[0].x, _456);
    float _460 = 1.0 / _454;
    float _462 = (*spvDescriptorSet0.vp_c7)._m0[1].z * (*spvDescriptorSet0.vp_c7)._m0[1].z;
    float _464 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c7)._m0[2].x, _458);
    float _466 = fma((*spvDescriptorSet0.vp_c7)._m0[0].z, (*spvDescriptorSet0.vp_c7)._m0[0].z, _462);
    float _468 = _464 * _450;
    float _470 = _392 + (-1.0);
    float _472 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _474 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c7)._m0[2].z, _466);
    float _476 = sqrt(_468);
    float _478 = _474 * _460;
    float _480 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _482 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _484 = fma(_322, _392, _480);
    float _486 = sqrt(_478);
    float _488 = _470 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _490 = fma(_320, _392, _482);
    float _492 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _494 = _484 * _472;
    float _496 = fma(_422, _476, 9.9999997473787516355514526367188e-06);
    float _498 = fma(_328, _392, _488);
    float _500 = fma(_418, _476, 9.9999997473787516355514526367188e-06);
    float _502 = _484 * _492;
    float _504 = fma(_490, _496, _494);
    float _506 = fma(_414, _476, 9.9999997473787516355514526367188e-06);
    float _508 = fma(_490, _500, _502);
    float _510 = fma(_440, _486, 9.9999997473787516355514526367188e-06);
    float _512 = fma(_444, _486, 9.9999997473787516355514526367188e-06);
    float _514 = fma(_436, _486, 9.9999997473787516355514526367188e-06);
    float _516 = fma(_498, _510, _504);
    float _518 = fma(_498, _512, _508);
    float _520 = _516 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _522 = _518 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _524 = 9.9999997473787516355514526367188e-06 + (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _528 = _520 + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _532 = _522 + _530;
    float _534 = _484 * _524;
    float _536 = _528 * _528;
    float _538 = fma(_490, _506, _534);
    float _540 = fma(_532, _532, _536);
    float _542 = fma(_498, _514, _538);
    float _544 = sqrt(_540);
    float _546 = _542 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _548 = _546 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _550 = fma(_522, (*spvDescriptorSet0.vp_c4)._m0[2].x, _548);
    float _552 = fma(_520, (*spvDescriptorSet0.vp_c4)._m0[2].z, _550);
    bool _554 = _544 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _556 = _552 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _558 = _414;
    float _560 = _552;
    float _562 = _498;
    float _564 = _556;
    if (!_554)
    {
        _558 = _522;
    }
    float _566 = _558;
    float _568 = _566;
    if (!_554)
    {
        _560 = _520;
    }
    float _570 = _560;
    float _572 = _570;
    if (!_554)
    {
        _562 = _546;
    }
    float _574 = _562;
    bool _576 = !_554;
    float _578 = _574;
    if (!_576)
    {
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _582 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _584 = _544 + _582;
        float _586 = _546 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _588 = rsqrt(_540);
        float _590 = _584 * _580;
        float _592 = _590 * 0.15915493667125701904296875;
        float _594 = _592 * 6.283185482025146484375;
        float _596 = cos(_594);
        float _598 = _592 * 6.283185482025146484375;
        float _600 = sin(_598);
        float _602 = _596 + (-1.0);
        float _604 = _602 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _606 = fma(_600, _586, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _608 = fma(_546, _596, _604);
        float _610 = _588 * _606;
        float _612 = _608 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _614 = fma(_532, _610, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _616 = fma(_528, _610, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _618 = fma(_614, (*spvDescriptorSet0.vp_c4)._m0[2].x, _612);
        float _620 = fma(_616, (*spvDescriptorSet0.vp_c4)._m0[2].z, _618);
        float _622 = _620 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _578 = _608;
        _568 = _614;
        _572 = _616;
        _564 = _622;
    }
    float _624 = _578;
    float _626 = _568;
    float _628 = _572;
    float _630 = _564;
    float _632 = _624 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _634 = _624 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _636 = in.m_43.x;
    float _638 = fma(_626, (*spvDescriptorSet0.vp_c4)._m0[1].x, _632);
    float _640 = fma(_626, (*spvDescriptorSet0.vp_c4)._m0[0].x, _634);
    float _642 = in.m_43.y;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c4)._m0[1].z, _638);
    float _646 = fma(_628, (*spvDescriptorSet0.vp_c4)._m0[0].z, _640);
    float _648 = _644 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _650 = _646 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _652 = _648 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _654 = _648 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _656 = _648 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _658 = _648 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[8].x, _652);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[7].x, _654);
    float _664 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[9].x, _656);
    float _666 = fma(_650, (*spvDescriptorSet0.vp_c4)._m0[10].x, _658);
    float _668 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[8].z, _660);
    float _670 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[7].z, _662);
    float _672 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[9].z, _664);
    float _674 = fma(_630, (*spvDescriptorSet0.vp_c4)._m0[10].z, _666);
    float _676 = _670 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _678 = _668 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _680 = _672 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _682 = _674 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _636;
    out.m_46.y = _642;
    out.gl_Position.x = _676;
    out.gl_Position.y = _678;
    out.gl_Position.z = _680;
    out.gl_Position.w = _682;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

