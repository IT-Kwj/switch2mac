#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _916 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_916, float2(0.0), isnan(_916)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _931 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_931, float2(0.0), isnan(_931)), int2(0), component::x).xzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = precise::max(_81, _83);
    float _97 = precise::max(_89, _91);
    float _99 = precise::min(_81, _83);
    float _101 = precise::min(_89, _91);
    float _103 = precise::max(_95, _97);
    float _105 = precise::min(_99, _101);
    float _107 = precise::max(_93, _103);
    float _109 = precise::min(_93, _105);
    float _111 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = -_109;
    float _115 = _107 + _113;
    float _117 = precise::max(_111, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _121 = _115 >= _117;
    bool _123 = isnan(_115);
    bool _125 = _121 || _123;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    int _132 = as_type<int>(_111);
    if (!_129)
    {
        _132 = 0;
    }
    int _134 = _132;
    bool _136 = !_129;
    int _138 = _134;
    if (!_136)
    {
        float2 _1010 = float2(_73, _75);
        float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1010, float2(0.0), isnan(_1010)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1010, float2(0.0), isnan(_1010)), int2(1, -1)).x;
        float2 _1021 = float2(_73, _75);
        float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1021, float2(0.0), isnan(_1021)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1021, float2(0.0), isnan(_1021)), int2(-1, 1)).x;
        float _144 = _91 + _81;
        float _146 = _89 + _83;
        float _148 = fma(_93, -2.0, _144);
        float _150 = fma(_93, -2.0, _146);
        float _152 = _81 + _140;
        float _154 = _91 + _140;
        float _156 = _81 + _142;
        float _158 = _91 + _142;
        float _160 = fma(_83, -2.0, _152);
        float _162 = fma(_91, -2.0, _154);
        float _164 = fma(_81, -2.0, _156);
        float _166 = fma(_89, -2.0, _158);
        float _168 = abs(_148);
        float _170 = abs(_160);
        float _172 = fma(_168, 2.0, _170);
        float _174 = abs(_150);
        float _176 = abs(_164);
        float _178 = fma(_174, 2.0, _176);
        float _180 = abs(_166);
        float _182 = _180 + _172;
        float _184 = abs(_162);
        float _186 = _184 + _178;
        bool _188 = _186 >= _182;
        float _190 = float(_188);
        bool _192 = _186 < _182;
        bool _194 = isnan(_186);
        bool _196 = _192 || _194;
        bool _198 = isnan(_182);
        bool _200 = _196 || _198;
        float _202 = float(_200);
        float _204 = _83 * _190;
        float _206 = _89 * _190;
        float _208 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _212 = fma(_81, _202, _204);
        float _214 = fma(_91, _202, _206);
        float _216 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].x, _208);
        float _218 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _220 = -_93;
        float _222 = _220 + _212;
        float _224 = -_93;
        float _226 = _224 + _214;
        float _228 = abs(_222);
        float _230 = abs(_226);
        bool _232 = _228 >= _230;
        float _234 = -_216;
        float _236 = _232 ? _234 : _216;
        float _238 = _236 * 0.5;
        float _240 = fma(_202, _238, _73);
        float _242 = fma(_190, _238, _75);
        float _244 = -_218;
        float _246 = _244 + _240;
        float _248 = -_210;
        float _250 = _248 + _242;
        float _252 = _218 + _240;
        float _254 = _210 + _242;
        float2 _1193 = float2(_246, _250);
        float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1193, float2(0.0), isnan(_1193))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1193, float2(0.0), isnan(_1193))).xyz;
        float _258 = _256.x;
        float _260 = _256.y;
        float _262 = _256.z;
        float2 _1207 = float2(_252, _254);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1207, float2(0.0), isnan(_1207))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1207, float2(0.0), isnan(_1207))).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float _272 = 1.0 / _115;
        float _274 = _146 + _144;
        float _276 = _154 + _156;
        float _278 = _232 ? _212 : _214;
        float _280 = abs(_222);
        float _282 = abs(_226);
        float _284 = _232 ? _280 : _282;
        float _286 = fma(_274, 2.0, _276);
        float _288 = fma(_286, -0.083333335816860198974609375, _93);
        float _290 = abs(_288);
        float _292 = _290 * _272;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = fma(_294, 6.0, -15.0);
        float _298 = _294 * _294;
        float _300 = fma(_294, _296, 10.0);
        float _302 = _300 * _298;
        float _304 = _294 * _302;
        float _306 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _308 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _310 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
        float _312 = _93 + _278;
        float _314 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _308);
        float _316 = _284 * 0.25;
        float _318 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _310);
        float _320 = _312 * 0.5;
        float _322 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _314);
        float _324 = -_320;
        float _326 = _324 + _318;
        float _328 = -_320;
        float _330 = _328 + _322;
        float _332 = abs(_326);
        bool _334 = _332 >= _316;
        float _336 = abs(_330);
        bool _338 = _336 >= _316;
        bool _340 = false;
        float _342 = _156;
        float _344 = _266;
        float _346 = _326;
        float _348 = _298;
        float _350 = _302;
        bool _352 = _334;
        float _354 = _330;
        bool _356 = _338;
        float _358 = _316;
        if (_334)
        {
            _340 = true;
        }
        bool _360 = _340;
        bool _362 = _360;
        if (_334)
        {
            _342 = _246;
        }
        float _364 = _342;
        float _366 = _364;
        if (_334)
        {
            _344 = _250;
        }
        float _368 = _344;
        float _370 = _368;
        if (!_334)
        {
            float _372 = -_218;
            float _374 = _372 + _246;
            float _376 = -_210;
            float _378 = _376 + _250;
            float2 _1369 = float2(_374, _378);
            float3 _380 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1369, float2(0.0), isnan(_1369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1369, float2(0.0), isnan(_1369))).xyz;
            float _382 = _380.x;
            float _384 = _380.y;
            float _386 = _380.z;
            float _388 = _384 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _390 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[2].x, _388);
            float _392 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[2].z, _390);
            float _394 = -_320;
            float _396 = _394 + _392;
            float _398 = abs(_396);
            bool _400 = _398 >= _316;
            _362 = _400;
            _366 = _374;
            _370 = _378;
            _346 = _396;
            _348 = _388;
            _350 = _392;
        }
        bool _402 = _362;
        float _404 = _366;
        float _406 = _370;
        float _408 = _346;
        float _410 = _348;
        float _412 = _350;
        float _414 = _410;
        float _416 = _412;
        float _418 = _404;
        float _420 = _406;
        float _422 = _408;
        bool _424 = _402;
        if (_338)
        {
            _352 = true;
        }
        bool _426 = _352;
        bool _428 = _426;
        if (_338)
        {
            _414 = _252;
        }
        float _430 = _414;
        float _432 = _430;
        if (_338)
        {
            _416 = _254;
        }
        float _434 = _416;
        float _436 = _434;
        if (!_338)
        {
            float _438 = _218 + _252;
            float _440 = _210 + _254;
            float2 _1452 = float2(_438, _440);
            float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1452, float2(0.0), isnan(_1452))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1452, float2(0.0), isnan(_1452))).xyz;
            float _444 = _442.x;
            float _446 = _442.y;
            float _448 = _442.z;
            float _450 = _446 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _452 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[2].x, _450);
            float _454 = fma(_448, (*spvDescriptorSet0.fp_c3)._m0[2].z, _452);
            float _456 = -_320;
            float _458 = _456 + _454;
            float _460 = abs(_458);
            bool _462 = _460 >= _316;
            _428 = _462;
            _432 = _438;
            _436 = _440;
            _354 = _458;
        }
        bool _464 = _428;
        float _466 = _432;
        float _468 = _436;
        float _470 = _354;
        float _472 = _466;
        float _474 = _468;
        float _476 = _470;
        bool _478 = _464;
        if (_402)
        {
            _356 = true;
        }
        bool _480 = _356;
        bool _482 = _480;
        if (!_402)
        {
            float _484 = fma(_218, -1.5, _404);
            float _486 = fma(_210, -1.5, _406);
            float2 _1518 = float2(_484, _486);
            float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1518, float2(0.0), isnan(_1518))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1518, float2(0.0), isnan(_1518))).xyz;
            float _490 = _488.x;
            float _492 = _488.y;
            float _494 = _488.z;
            float _496 = _492 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _498 = fma(_490, (*spvDescriptorSet0.fp_c3)._m0[2].x, _496);
            float _500 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[2].z, _498);
            float _502 = -_320;
            float _504 = _502 + _500;
            float _506 = abs(_504);
            bool _508 = _506 >= _316;
            _482 = _508;
            _418 = _484;
            _420 = _486;
            _422 = _504;
        }
        bool _510 = _482;
        float _512 = _418;
        float _514 = _420;
        float _516 = _422;
        float _518 = _516;
        float _520 = _512;
        float _522 = _514;
        bool _524 = _510;
        if (_464)
        {
            _424 = true;
        }
        bool _526 = _424;
        bool _528 = _526;
        if (!_464)
        {
            float _530 = fma(_218, 1.5, _466);
            float _532 = fma(_210, 1.5, _468);
            float2 _1584 = float2(_530, _532);
            float3 _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1584, float2(0.0), isnan(_1584))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1584, float2(0.0), isnan(_1584))).xyz;
            float _536 = _534.x;
            float _538 = _534.y;
            float _540 = _534.z;
            float _542 = _538 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _544 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[2].x, _542);
            float _546 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[2].z, _544);
            float _548 = -_320;
            float _550 = _548 + _546;
            float _552 = abs(_550);
            bool _554 = _552 >= _316;
            _528 = _554;
            _472 = _530;
            _474 = _532;
            _476 = _550;
        }
        bool _556 = _528;
        float _558 = _472;
        float _560 = _474;
        float _562 = _476;
        float _564 = _562;
        float _566 = _558;
        float _568 = _560;
        int _570 = _556 ? (-1) : 0;
        if (_510)
        {
            _478 = true;
        }
        bool _572 = _478;
        bool _574 = _572;
        if (!_510)
        {
            float _576 = fma(_218, -3.0, _512);
            float _578 = fma(_210, -3.0, _514);
            float2 _1651 = float2(_576, _578);
            float3 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1651, float2(0.0), isnan(_1651))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1651, float2(0.0), isnan(_1651))).xyz;
            float _582 = _580.x;
            float _584 = _580.y;
            float _586 = _580.z;
            float _588 = _584 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _590 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[2].x, _588);
            float _592 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[2].z, _590);
            float _594 = -_320;
            float _596 = _594 + _592;
            float _598 = abs(_596);
            bool _600 = _598 >= _316;
            _574 = _600;
            _518 = _596;
            _520 = _576;
            _522 = _578;
        }
        bool _602 = _574;
        float _604 = _518;
        float _606 = _520;
        float _608 = _522;
        float _610 = _604;
        float _612 = _608;
        int _614 = _602 ? (-1) : 0;
        if (_556)
        {
            _524 = true;
        }
        bool _616 = _524;
        bool _618 = _616;
        if (!_556)
        {
            float _620 = fma(_218, 3.0, _558);
            float _622 = fma(_210, 3.0, _560);
            float2 _1717 = float2(_620, _622);
            float3 _624 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1717, float2(0.0), isnan(_1717))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1717, float2(0.0), isnan(_1717))).xyz;
            float _626 = _624.x;
            float _628 = _624.y;
            float _630 = _624.z;
            float _632 = _628 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _634 = fma(_626, (*spvDescriptorSet0.fp_c3)._m0[2].x, _632);
            float _636 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[2].z, _634);
            float _638 = -_320;
            float _640 = _638 + _636;
            float _642 = abs(_640);
            bool _644 = _642 >= _316;
            _618 = _644;
            _564 = _640;
            _566 = _620;
            _568 = _622;
        }
        bool _646 = _618;
        float _648 = _564;
        float _650 = _566;
        float _652 = _568;
        float _654 = _648;
        if (_602)
        {
            bool _656 = _604 >= 0.0;
            bool _658 = isnan(_604);
            bool _660 = _656 || _658;
            bool _662 = isnan(0.0);
            bool _664 = _660 || _662;
            _570 = _664 ? (-1) : 0;
        }
        int _666 = _570;
        int _668 = _666;
        if (_602)
        {
            _610 = _606;
        }
        float _670 = _610;
        float _672 = _670;
        if (!_602)
        {
            float _674 = fma(_218, -12.0, _606);
            float _676 = fma(_210, -12.0, _608);
            float2 _1799 = float2(_674, _676);
            float3 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1799, float2(0.0), isnan(_1799))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1799, float2(0.0), isnan(_1799))).xyz;
            float _680 = _678.x;
            float _682 = _678.y;
            float _684 = _678.z;
            float _686 = _682 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _688 = fma(_680, (*spvDescriptorSet0.fp_c3)._m0[2].x, _686);
            float _690 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[2].z, _688);
            float _692 = -_320;
            float _694 = _692 + _690;
            bool _696 = _694 >= 0.0;
            bool _698 = isnan(_694);
            bool _700 = _696 || _698;
            bool _702 = isnan(0.0);
            bool _704 = _700 || _702;
            _612 = _676;
            _358 = _694;
            _672 = _674;
            _668 = _704 ? (-1) : 0;
        }
        float _706 = _612;
        float _708 = _358;
        float _710 = _672;
        int _712 = _668;
        float _714 = _708;
        if (_646)
        {
            bool _716 = _648 >= 0.0;
            bool _718 = isnan(_648);
            bool _720 = _716 || _718;
            bool _722 = isnan(0.0);
            bool _724 = _720 || _722;
            _614 = _724 ? (-1) : 0;
        }
        int _726 = _614;
        int _728 = _726;
        if (_646)
        {
            _654 = _650;
        }
        float _730 = _654;
        float _732 = _730;
        if (_646)
        {
            _714 = _652;
        }
        float _734 = _714;
        float _736 = _734;
        if (!_646)
        {
            float _738 = fma(_218, 12.0, _650);
            float _740 = fma(_210, 12.0, _652);
            float2 _1894 = float2(_738, _740);
            float3 _742 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1894, float2(0.0), isnan(_1894))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1894, float2(0.0), isnan(_1894))).xyz;
            float _744 = _742.x;
            float _746 = _742.y;
            float _748 = _742.z;
            float _750 = _746 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _752 = fma(_744, (*spvDescriptorSet0.fp_c3)._m0[2].x, _750);
            float _754 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[2].z, _752);
            float _756 = -_320;
            float _758 = _756 + _754;
            bool _760 = _758 >= 0.0;
            bool _762 = isnan(_758);
            bool _764 = _760 || _762;
            bool _766 = isnan(0.0);
            bool _768 = _764 || _766;
            _736 = _740;
            _732 = _738;
            _728 = _768 ? (-1) : 0;
        }
        float _770 = _736;
        float _772 = _732;
        int _774 = _728;
        float _776 = -_706;
        float _778 = _75 + _776;
        float _780 = -_75;
        float _782 = _780 + _770;
        float _784 = -_710;
        float _786 = _73 + _784;
        float _788 = -_73;
        float _790 = _788 + _772;
        float _792 = _202 * _778;
        float _794 = _202 * _782;
        float _796 = _218 + _210;
        float _798 = fma(_190, _786, _792);
        float _800 = fma(_190, _790, _794);
        float _802 = 1.0 / _796;
        float _804 = _798 + _800;
        bool _806 = _798 < _800;
        int _808 = ~_712;
        int _810 = (_806 ? (-1) : 0) & _808;
        bool _812 = _798 >= _800;
        bool _814 = isnan(_798);
        bool _816 = _812 || _814;
        bool _818 = isnan(_800);
        bool _820 = _816 || _818;
        int _822 = ~_774;
        int _824 = (_820 ? (-1) : 0) & _822;
        float _826 = precise::min(_798, _800);
        float _828 = 1.0 / _804;
        int _830 = ~_810;
        int _832 = _830 & _824;
        int _834 = ~_824;
        int _836 = _810 & _834;
        int _838 = _832 | _836;
        int _840 = _810 & _824;
        int _842 = _838 | _840;
        bool _844 = _93 < _320;
        int _846 = (_844 ? (-1) : 0) ^ _842;
        float _848 = _304 * 0.75;
        float _850 = -_826;
        float _852 = fma(_850, _828, 0.5);
        float _854 = (_846 != 0) ? _852 : 0.0;
        float _856 = precise::max(_854, _848);
        float _858 = _236 * _856;
        float _860 = _858 * _802;
        _138 = as_type<int>(_860);
    }
    int _862 = _138;
    out.m_34.x = as_type<float>(_862);
    out.m_34.y = as_type<float>(_862);
    out.m_34.z = as_type<float>(_862);
    out.m_34.w = as_type<float>(_862);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _916 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_916, float2(0.0), isnan(_916)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _931 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_931, float2(0.0), isnan(_931)), int2(0), component::x).xzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = precise::max(_81, _83);
    float _97 = precise::max(_89, _91);
    float _99 = precise::min(_81, _83);
    float _101 = precise::min(_89, _91);
    float _103 = precise::max(_95, _97);
    float _105 = precise::min(_99, _101);
    float _107 = precise::max(_93, _103);
    float _109 = precise::min(_93, _105);
    float _111 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = -_109;
    float _115 = _107 + _113;
    float _117 = precise::max(_111, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _121 = _115 >= _117;
    bool _123 = isnan(_115);
    bool _125 = _121 || _123;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    int _132 = as_type<int>(_111);
    if (!_129)
    {
        _132 = 0;
    }
    int _134 = _132;
    bool _136 = !_129;
    int _138 = _134;
    if (!_136)
    {
        float2 _1010 = float2(_73, _75);
        float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1010, float2(0.0), isnan(_1010)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1010, float2(0.0), isnan(_1010)), int2(1, -1)).x;
        float2 _1021 = float2(_73, _75);
        float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1021, float2(0.0), isnan(_1021)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1021, float2(0.0), isnan(_1021)), int2(-1, 1)).x;
        float _144 = _91 + _81;
        float _146 = _89 + _83;
        float _148 = fma(_93, -2.0, _144);
        float _150 = fma(_93, -2.0, _146);
        float _152 = _81 + _140;
        float _154 = _91 + _140;
        float _156 = _81 + _142;
        float _158 = _91 + _142;
        float _160 = fma(_83, -2.0, _152);
        float _162 = fma(_91, -2.0, _154);
        float _164 = fma(_81, -2.0, _156);
        float _166 = fma(_89, -2.0, _158);
        float _168 = abs(_148);
        float _170 = abs(_160);
        float _172 = fma(_168, 2.0, _170);
        float _174 = abs(_150);
        float _176 = abs(_164);
        float _178 = fma(_174, 2.0, _176);
        float _180 = abs(_166);
        float _182 = _180 + _172;
        float _184 = abs(_162);
        float _186 = _184 + _178;
        bool _188 = _186 >= _182;
        float _190 = float(_188);
        bool _192 = _186 < _182;
        bool _194 = isnan(_186);
        bool _196 = _192 || _194;
        bool _198 = isnan(_182);
        bool _200 = _196 || _198;
        float _202 = float(_200);
        float _204 = _83 * _190;
        float _206 = _89 * _190;
        float _208 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _212 = fma(_81, _202, _204);
        float _214 = fma(_91, _202, _206);
        float _216 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].x, _208);
        float _218 = _190 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _220 = -_93;
        float _222 = _220 + _212;
        float _224 = -_93;
        float _226 = _224 + _214;
        float _228 = abs(_222);
        float _230 = abs(_226);
        bool _232 = _228 >= _230;
        float _234 = -_216;
        float _236 = _232 ? _234 : _216;
        float _238 = _236 * 0.5;
        float _240 = fma(_202, _238, _73);
        float _242 = fma(_190, _238, _75);
        float _244 = -_218;
        float _246 = _244 + _240;
        float _248 = -_210;
        float _250 = _248 + _242;
        float _252 = _218 + _240;
        float _254 = _210 + _242;
        float2 _1193 = float2(_246, _250);
        float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1193, float2(0.0), isnan(_1193))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1193, float2(0.0), isnan(_1193))).xyz;
        float _258 = _256.x;
        float _260 = _256.y;
        float _262 = _256.z;
        float2 _1207 = float2(_252, _254);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1207, float2(0.0), isnan(_1207))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1207, float2(0.0), isnan(_1207))).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float _272 = 1.0 / _115;
        float _274 = _146 + _144;
        float _276 = _154 + _156;
        float _278 = _232 ? _212 : _214;
        float _280 = abs(_222);
        float _282 = abs(_226);
        float _284 = _232 ? _280 : _282;
        float _286 = fma(_274, 2.0, _276);
        float _288 = fma(_286, -0.083333335816860198974609375, _93);
        float _290 = abs(_288);
        float _292 = _290 * _272;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = fma(_294, 6.0, -15.0);
        float _298 = _294 * _294;
        float _300 = fma(_294, _296, 10.0);
        float _302 = _300 * _298;
        float _304 = _294 * _302;
        float _306 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _308 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _310 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
        float _312 = _93 + _278;
        float _314 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _308);
        float _316 = _284 * 0.25;
        float _318 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _310);
        float _320 = _312 * 0.5;
        float _322 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _314);
        float _324 = -_320;
        float _326 = _324 + _318;
        float _328 = -_320;
        float _330 = _328 + _322;
        float _332 = abs(_326);
        bool _334 = _332 >= _316;
        float _336 = abs(_330);
        bool _338 = _336 >= _316;
        bool _340 = false;
        float _342 = _156;
        float _344 = _266;
        float _346 = _326;
        float _348 = _298;
        float _350 = _302;
        bool _352 = _334;
        float _354 = _330;
        bool _356 = _338;
        float _358 = _316;
        if (_334)
        {
            _340 = true;
        }
        bool _360 = _340;
        bool _362 = _360;
        if (_334)
        {
            _342 = _246;
        }
        float _364 = _342;
        float _366 = _364;
        if (_334)
        {
            _344 = _250;
        }
        float _368 = _344;
        float _370 = _368;
        if (!_334)
        {
            float _372 = -_218;
            float _374 = _372 + _246;
            float _376 = -_210;
            float _378 = _376 + _250;
            float2 _1369 = float2(_374, _378);
            float3 _380 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1369, float2(0.0), isnan(_1369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1369, float2(0.0), isnan(_1369))).xyz;
            float _382 = _380.x;
            float _384 = _380.y;
            float _386 = _380.z;
            float _388 = _384 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _390 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[2].x, _388);
            float _392 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[2].z, _390);
            float _394 = -_320;
            float _396 = _394 + _392;
            float _398 = abs(_396);
            bool _400 = _398 >= _316;
            _362 = _400;
            _366 = _374;
            _370 = _378;
            _346 = _396;
            _348 = _388;
            _350 = _392;
        }
        bool _402 = _362;
        float _404 = _366;
        float _406 = _370;
        float _408 = _346;
        float _410 = _348;
        float _412 = _350;
        float _414 = _410;
        float _416 = _412;
        float _418 = _404;
        float _420 = _406;
        float _422 = _408;
        bool _424 = _402;
        if (_338)
        {
            _352 = true;
        }
        bool _426 = _352;
        bool _428 = _426;
        if (_338)
        {
            _414 = _252;
        }
        float _430 = _414;
        float _432 = _430;
        if (_338)
        {
            _416 = _254;
        }
        float _434 = _416;
        float _436 = _434;
        if (!_338)
        {
            float _438 = _218 + _252;
            float _440 = _210 + _254;
            float2 _1452 = float2(_438, _440);
            float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1452, float2(0.0), isnan(_1452))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1452, float2(0.0), isnan(_1452))).xyz;
            float _444 = _442.x;
            float _446 = _442.y;
            float _448 = _442.z;
            float _450 = _446 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _452 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[2].x, _450);
            float _454 = fma(_448, (*spvDescriptorSet0.fp_c3)._m0[2].z, _452);
            float _456 = -_320;
            float _458 = _456 + _454;
            float _460 = abs(_458);
            bool _462 = _460 >= _316;
            _428 = _462;
            _432 = _438;
            _436 = _440;
            _354 = _458;
        }
        bool _464 = _428;
        float _466 = _432;
        float _468 = _436;
        float _470 = _354;
        float _472 = _466;
        float _474 = _468;
        float _476 = _470;
        bool _478 = _464;
        if (_402)
        {
            _356 = true;
        }
        bool _480 = _356;
        bool _482 = _480;
        if (!_402)
        {
            float _484 = fma(_218, -1.5, _404);
            float _486 = fma(_210, -1.5, _406);
            float2 _1518 = float2(_484, _486);
            float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1518, float2(0.0), isnan(_1518))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1518, float2(0.0), isnan(_1518))).xyz;
            float _490 = _488.x;
            float _492 = _488.y;
            float _494 = _488.z;
            float _496 = _492 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _498 = fma(_490, (*spvDescriptorSet0.fp_c3)._m0[2].x, _496);
            float _500 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[2].z, _498);
            float _502 = -_320;
            float _504 = _502 + _500;
            float _506 = abs(_504);
            bool _508 = _506 >= _316;
            _482 = _508;
            _418 = _484;
            _420 = _486;
            _422 = _504;
        }
        bool _510 = _482;
        float _512 = _418;
        float _514 = _420;
        float _516 = _422;
        float _518 = _516;
        float _520 = _512;
        float _522 = _514;
        bool _524 = _510;
        if (_464)
        {
            _424 = true;
        }
        bool _526 = _424;
        bool _528 = _526;
        if (!_464)
        {
            float _530 = fma(_218, 1.5, _466);
            float _532 = fma(_210, 1.5, _468);
            float2 _1584 = float2(_530, _532);
            float3 _534 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1584, float2(0.0), isnan(_1584))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1584, float2(0.0), isnan(_1584))).xyz;
            float _536 = _534.x;
            float _538 = _534.y;
            float _540 = _534.z;
            float _542 = _538 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _544 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[2].x, _542);
            float _546 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[2].z, _544);
            float _548 = -_320;
            float _550 = _548 + _546;
            float _552 = abs(_550);
            bool _554 = _552 >= _316;
            _528 = _554;
            _472 = _530;
            _474 = _532;
            _476 = _550;
        }
        bool _556 = _528;
        float _558 = _472;
        float _560 = _474;
        float _562 = _476;
        float _564 = _562;
        float _566 = _558;
        float _568 = _560;
        int _570 = _556 ? (-1) : 0;
        if (_510)
        {
            _478 = true;
        }
        bool _572 = _478;
        bool _574 = _572;
        if (!_510)
        {
            float _576 = fma(_218, -3.0, _512);
            float _578 = fma(_210, -3.0, _514);
            float2 _1651 = float2(_576, _578);
            float3 _580 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1651, float2(0.0), isnan(_1651))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1651, float2(0.0), isnan(_1651))).xyz;
            float _582 = _580.x;
            float _584 = _580.y;
            float _586 = _580.z;
            float _588 = _584 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _590 = fma(_582, (*spvDescriptorSet0.fp_c3)._m0[2].x, _588);
            float _592 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[2].z, _590);
            float _594 = -_320;
            float _596 = _594 + _592;
            float _598 = abs(_596);
            bool _600 = _598 >= _316;
            _574 = _600;
            _518 = _596;
            _520 = _576;
            _522 = _578;
        }
        bool _602 = _574;
        float _604 = _518;
        float _606 = _520;
        float _608 = _522;
        float _610 = _604;
        float _612 = _608;
        int _614 = _602 ? (-1) : 0;
        if (_556)
        {
            _524 = true;
        }
        bool _616 = _524;
        bool _618 = _616;
        if (!_556)
        {
            float _620 = fma(_218, 3.0, _558);
            float _622 = fma(_210, 3.0, _560);
            float2 _1717 = float2(_620, _622);
            float3 _624 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1717, float2(0.0), isnan(_1717))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1717, float2(0.0), isnan(_1717))).xyz;
            float _626 = _624.x;
            float _628 = _624.y;
            float _630 = _624.z;
            float _632 = _628 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _634 = fma(_626, (*spvDescriptorSet0.fp_c3)._m0[2].x, _632);
            float _636 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[2].z, _634);
            float _638 = -_320;
            float _640 = _638 + _636;
            float _642 = abs(_640);
            bool _644 = _642 >= _316;
            _618 = _644;
            _564 = _640;
            _566 = _620;
            _568 = _622;
        }
        bool _646 = _618;
        float _648 = _564;
        float _650 = _566;
        float _652 = _568;
        float _654 = _648;
        if (_602)
        {
            bool _656 = _604 >= 0.0;
            bool _658 = isnan(_604);
            bool _660 = _656 || _658;
            bool _662 = isnan(0.0);
            bool _664 = _660 || _662;
            _570 = _664 ? (-1) : 0;
        }
        int _666 = _570;
        int _668 = _666;
        if (_602)
        {
            _610 = _606;
        }
        float _670 = _610;
        float _672 = _670;
        if (!_602)
        {
            float _674 = fma(_218, -12.0, _606);
            float _676 = fma(_210, -12.0, _608);
            float2 _1799 = float2(_674, _676);
            float3 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1799, float2(0.0), isnan(_1799))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1799, float2(0.0), isnan(_1799))).xyz;
            float _680 = _678.x;
            float _682 = _678.y;
            float _684 = _678.z;
            float _686 = _682 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _688 = fma(_680, (*spvDescriptorSet0.fp_c3)._m0[2].x, _686);
            float _690 = fma(_684, (*spvDescriptorSet0.fp_c3)._m0[2].z, _688);
            float _692 = -_320;
            float _694 = _692 + _690;
            bool _696 = _694 >= 0.0;
            bool _698 = isnan(_694);
            bool _700 = _696 || _698;
            bool _702 = isnan(0.0);
            bool _704 = _700 || _702;
            _612 = _676;
            _358 = _694;
            _672 = _674;
            _668 = _704 ? (-1) : 0;
        }
        float _706 = _612;
        float _708 = _358;
        float _710 = _672;
        int _712 = _668;
        float _714 = _708;
        if (_646)
        {
            bool _716 = _648 >= 0.0;
            bool _718 = isnan(_648);
            bool _720 = _716 || _718;
            bool _722 = isnan(0.0);
            bool _724 = _720 || _722;
            _614 = _724 ? (-1) : 0;
        }
        int _726 = _614;
        int _728 = _726;
        if (_646)
        {
            _654 = _650;
        }
        float _730 = _654;
        float _732 = _730;
        if (_646)
        {
            _714 = _652;
        }
        float _734 = _714;
        float _736 = _734;
        if (!_646)
        {
            float _738 = fma(_218, 12.0, _650);
            float _740 = fma(_210, 12.0, _652);
            float2 _1894 = float2(_738, _740);
            float3 _742 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1894, float2(0.0), isnan(_1894))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1894, float2(0.0), isnan(_1894))).xyz;
            float _744 = _742.x;
            float _746 = _742.y;
            float _748 = _742.z;
            float _750 = _746 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _752 = fma(_744, (*spvDescriptorSet0.fp_c3)._m0[2].x, _750);
            float _754 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[2].z, _752);
            float _756 = -_320;
            float _758 = _756 + _754;
            bool _760 = _758 >= 0.0;
            bool _762 = isnan(_758);
            bool _764 = _760 || _762;
            bool _766 = isnan(0.0);
            bool _768 = _764 || _766;
            _736 = _740;
            _732 = _738;
            _728 = _768 ? (-1) : 0;
        }
        float _770 = _736;
        float _772 = _732;
        int _774 = _728;
        float _776 = -_706;
        float _778 = _75 + _776;
        float _780 = -_75;
        float _782 = _780 + _770;
        float _784 = -_710;
        float _786 = _73 + _784;
        float _788 = -_73;
        float _790 = _788 + _772;
        float _792 = _202 * _778;
        float _794 = _202 * _782;
        float _796 = _218 + _210;
        float _798 = fma(_190, _786, _792);
        float _800 = fma(_190, _790, _794);
        float _802 = 1.0 / _796;
        float _804 = _798 + _800;
        bool _806 = _798 < _800;
        int _808 = ~_712;
        int _810 = (_806 ? (-1) : 0) & _808;
        bool _812 = _798 >= _800;
        bool _814 = isnan(_798);
        bool _816 = _812 || _814;
        bool _818 = isnan(_800);
        bool _820 = _816 || _818;
        int _822 = ~_774;
        int _824 = (_820 ? (-1) : 0) & _822;
        float _826 = precise::min(_798, _800);
        float _828 = 1.0 / _804;
        int _830 = ~_810;
        int _832 = _830 & _824;
        int _834 = ~_824;
        int _836 = _810 & _834;
        int _838 = _832 | _836;
        int _840 = _810 & _824;
        int _842 = _838 | _840;
        bool _844 = _93 < _320;
        int _846 = (_844 ? (-1) : 0) ^ _842;
        float _848 = _304 * 0.75;
        float _850 = -_826;
        float _852 = fma(_850, _828, 0.5);
        float _854 = (_846 != 0) ? _852 : 0.0;
        float _856 = precise::max(_854, _848);
        float _858 = _236 * _856;
        float _860 = _858 * _802;
        _138 = as_type<int>(_860);
    }
    int _862 = _138;
    out.m_34.x = as_type<float>(_862);
    out.m_34.y = as_type<float>(_862);
    out.m_34.z = as_type<float>(_862);
    out.m_34.w = as_type<float>(_862);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

