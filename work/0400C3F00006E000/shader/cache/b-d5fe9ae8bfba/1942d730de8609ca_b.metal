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
    float2 _959 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_959, float2(0.0), isnan(_959)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _974 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_974, float2(0.0), isnan(_974)), int2(0), component::x).xzw;
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
    if (!_129)
    {
        float2 _1043 = float2(_73, _75);
        float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1043, float2(0.0), isnan(_1043))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1043, float2(0.0), isnan(_1043))).xyzw;
        float _134 = _132.x;
        float _136 = _132.y;
        float _138 = _132.z;
        float _140 = _132.w;
        out.m_34.x = _134;
        out.m_34.y = _136;
        out.m_34.z = _138;
        out.m_34.w = _140;
        return out;
    }
    float2 _1069 = float2(_73, _75);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1069, float2(0.0), isnan(_1069)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1069, float2(0.0), isnan(_1069)), int2(1, -1)).x;
    float2 _1080 = float2(_73, _75);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1080, float2(0.0), isnan(_1080)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1080, float2(0.0), isnan(_1080)), int2(-1, 1)).x;
    float _146 = _91 + _81;
    float _148 = _89 + _83;
    float _150 = fma(_93, -2.0, _146);
    float _152 = fma(_93, -2.0, _148);
    float _154 = _81 + _142;
    float _156 = _91 + _142;
    float _158 = _81 + _144;
    float _160 = _91 + _144;
    float _162 = fma(_83, -2.0, _154);
    float _164 = fma(_91, -2.0, _156);
    float _166 = fma(_81, -2.0, _158);
    float _168 = fma(_89, -2.0, _160);
    float _170 = abs(_150);
    float _172 = abs(_162);
    float _174 = fma(_170, 2.0, _172);
    float _176 = abs(_152);
    float _178 = abs(_166);
    float _180 = fma(_176, 2.0, _178);
    float _182 = abs(_168);
    float _184 = _182 + _174;
    float _186 = abs(_164);
    float _188 = _186 + _180;
    bool _190 = _188 >= _184;
    float _192 = float(_190);
    bool _194 = _188 < _184;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan(_184);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = _83 * _192;
    float _208 = _89 * _192;
    float _210 = _192 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _212 = _192 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _214 = fma(_81, _204, _206);
    float _216 = fma(_91, _204, _208);
    float _218 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].x, _210);
    float _220 = _204 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _222 = -_93;
    float _224 = _222 + _214;
    float _226 = -_93;
    float _228 = _226 + _216;
    float _230 = abs(_224);
    float _232 = abs(_228);
    bool _234 = _230 >= _232;
    float _236 = -_218;
    float _238 = _234 ? _236 : _218;
    float _240 = _238 * 0.5;
    float _242 = fma(_204, _240, _73);
    float _244 = fma(_192, _240, _75);
    float _246 = -_212;
    float _248 = _246 + _242;
    float _250 = -_220;
    float _252 = _250 + _244;
    float _254 = _212 + _242;
    float _256 = _220 + _244;
    float2 _1252 = float2(_248, _252);
    float3 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1252, float2(0.0), isnan(_1252))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1252, float2(0.0), isnan(_1252))).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float2 _1266 = float2(_254, _256);
    float3 _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1266, float2(0.0), isnan(_1266))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1266, float2(0.0), isnan(_1266))).xyz;
    float _268 = _266.x;
    float _270 = _266.y;
    float _272 = _266.z;
    float _274 = 1.0 / _115;
    float _276 = _148 + _146;
    float _278 = _156 + _158;
    float _280 = _234 ? _214 : _216;
    float _282 = abs(_224);
    float _284 = abs(_228);
    float _286 = _234 ? _282 : _284;
    float _288 = fma(_276, 2.0, _278);
    float _290 = fma(_288, -0.083333335816860198974609375, _93);
    float _292 = abs(_290);
    float _294 = _292 * _274;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = fma(_296, 6.0, -15.0);
    float _300 = _296 * _296;
    float _302 = fma(_296, _298, 10.0);
    float _304 = _302 * _300;
    float _306 = _296 * _304;
    float _308 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _310 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _312 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _308);
    float _314 = _93 + _280;
    float _316 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _310);
    float _318 = _286 * 0.25;
    float _320 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
    float _322 = _314 * 0.5;
    float _324 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _316);
    float _326 = -_322;
    float _328 = _326 + _320;
    float _330 = -_322;
    float _332 = _330 + _324;
    float _334 = abs(_328);
    bool _336 = _334 >= _318;
    float _338 = abs(_332);
    bool _340 = _338 >= _318;
    bool _342 = false;
    float _344 = _158;
    float _346 = _268;
    float _348 = _328;
    float _350 = _300;
    float _352 = _304;
    bool _354 = _336;
    float _356 = _332;
    bool _358 = _340;
    float _360 = _318;
    if (_336)
    {
        _342 = true;
    }
    bool _362 = _342;
    bool _364 = _362;
    if (_336)
    {
        _344 = _248;
    }
    float _366 = _344;
    float _368 = _366;
    if (_336)
    {
        _346 = _252;
    }
    float _370 = _346;
    float _372 = _370;
    if (!_336)
    {
        float _374 = -_212;
        float _376 = _374 + _248;
        float _378 = -_220;
        float _380 = _378 + _252;
        float2 _1428 = float2(_376, _380);
        float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1428, float2(0.0), isnan(_1428))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1428, float2(0.0), isnan(_1428))).xyz;
        float _384 = _382.x;
        float _386 = _382.y;
        float _388 = _382.z;
        float _390 = _386 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _392 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[2].x, _390);
        float _394 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[2].z, _392);
        float _396 = -_322;
        float _398 = _396 + _394;
        float _400 = abs(_398);
        bool _402 = _400 >= _318;
        _364 = _402;
        _368 = _376;
        _372 = _380;
        _348 = _398;
        _350 = _390;
        _352 = _394;
    }
    bool _404 = _364;
    float _406 = _368;
    float _408 = _372;
    float _410 = _348;
    float _412 = _350;
    float _414 = _352;
    float _416 = _412;
    float _418 = _414;
    float _420 = _406;
    float _422 = _408;
    float _424 = _410;
    bool _426 = _404;
    if (_340)
    {
        _354 = true;
    }
    bool _428 = _354;
    bool _430 = _428;
    if (_340)
    {
        _416 = _254;
    }
    float _432 = _416;
    float _434 = _432;
    if (_340)
    {
        _418 = _256;
    }
    float _436 = _418;
    float _438 = _436;
    if (!_340)
    {
        float _440 = _212 + _254;
        float _442 = _220 + _256;
        float2 _1511 = float2(_440, _442);
        float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1511, float2(0.0), isnan(_1511))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1511, float2(0.0), isnan(_1511))).xyz;
        float _446 = _444.x;
        float _448 = _444.y;
        float _450 = _444.z;
        float _452 = _448 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _454 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[2].x, _452);
        float _456 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[2].z, _454);
        float _458 = -_322;
        float _460 = _458 + _456;
        float _462 = abs(_460);
        bool _464 = _462 >= _318;
        _430 = _464;
        _434 = _440;
        _438 = _442;
        _356 = _460;
    }
    bool _466 = _430;
    float _468 = _434;
    float _470 = _438;
    float _472 = _356;
    float _474 = _468;
    float _476 = _470;
    float _478 = _472;
    bool _480 = _466;
    if (_404)
    {
        _358 = true;
    }
    bool _482 = _358;
    bool _484 = _482;
    if (!_404)
    {
        float _486 = fma(_212, -1.5, _406);
        float _488 = fma(_220, -1.5, _408);
        float2 _1577 = float2(_486, _488);
        float3 _490 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1577, float2(0.0), isnan(_1577))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1577, float2(0.0), isnan(_1577))).xyz;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _490.z;
        float _498 = _494 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _500 = fma(_492, (*spvDescriptorSet0.fp_c3)._m0[2].x, _498);
        float _502 = fma(_496, (*spvDescriptorSet0.fp_c3)._m0[2].z, _500);
        float _504 = -_322;
        float _506 = _504 + _502;
        float _508 = abs(_506);
        bool _510 = _508 >= _318;
        _484 = _510;
        _420 = _486;
        _422 = _488;
        _424 = _506;
    }
    bool _512 = _484;
    float _514 = _420;
    float _516 = _422;
    float _518 = _424;
    float _520 = _518;
    float _522 = _514;
    float _524 = _516;
    bool _526 = _512;
    if (_466)
    {
        _426 = true;
    }
    bool _528 = _426;
    bool _530 = _528;
    if (!_466)
    {
        float _532 = fma(_212, 1.5, _468);
        float _534 = fma(_220, 1.5, _470);
        float2 _1643 = float2(_532, _534);
        float3 _536 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1643, float2(0.0), isnan(_1643))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1643, float2(0.0), isnan(_1643))).xyz;
        float _538 = _536.x;
        float _540 = _536.y;
        float _542 = _536.z;
        float _544 = _540 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _546 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[2].x, _544);
        float _548 = fma(_542, (*spvDescriptorSet0.fp_c3)._m0[2].z, _546);
        float _550 = -_322;
        float _552 = _550 + _548;
        float _554 = abs(_552);
        bool _556 = _554 >= _318;
        _530 = _556;
        _474 = _532;
        _476 = _534;
        _478 = _552;
    }
    bool _558 = _530;
    float _560 = _474;
    float _562 = _476;
    float _564 = _478;
    float _566 = _564;
    float _568 = _560;
    float _570 = _562;
    int _573 = _558 ? (-1) : 0;
    if (_512)
    {
        _480 = true;
    }
    bool _575 = _480;
    bool _577 = _575;
    if (!_512)
    {
        float _579 = fma(_212, -3.0, _514);
        float _581 = fma(_220, -3.0, _516);
        float2 _1710 = float2(_579, _581);
        float3 _583 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1710, float2(0.0), isnan(_1710))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1710, float2(0.0), isnan(_1710))).xyz;
        float _585 = _583.x;
        float _587 = _583.y;
        float _589 = _583.z;
        float _591 = _587 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _593 = fma(_585, (*spvDescriptorSet0.fp_c3)._m0[2].x, _591);
        float _595 = fma(_589, (*spvDescriptorSet0.fp_c3)._m0[2].z, _593);
        float _597 = -_322;
        float _599 = _597 + _595;
        float _601 = abs(_599);
        bool _603 = _601 >= _318;
        _577 = _603;
        _520 = _599;
        _522 = _579;
        _524 = _581;
    }
    bool _605 = _577;
    float _607 = _520;
    float _609 = _522;
    float _611 = _524;
    float _613 = _607;
    float _615 = _611;
    int _617 = _605 ? (-1) : 0;
    if (_558)
    {
        _526 = true;
    }
    bool _619 = _526;
    bool _621 = _619;
    if (!_558)
    {
        float _623 = fma(_212, 3.0, _560);
        float _625 = fma(_220, 3.0, _562);
        float2 _1776 = float2(_623, _625);
        float3 _627 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1776, float2(0.0), isnan(_1776))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1776, float2(0.0), isnan(_1776))).xyz;
        float _629 = _627.x;
        float _631 = _627.y;
        float _633 = _627.z;
        float _635 = _631 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _637 = fma(_629, (*spvDescriptorSet0.fp_c3)._m0[2].x, _635);
        float _639 = fma(_633, (*spvDescriptorSet0.fp_c3)._m0[2].z, _637);
        float _641 = -_322;
        float _643 = _641 + _639;
        float _645 = abs(_643);
        bool _647 = _645 >= _318;
        _621 = _647;
        _566 = _643;
        _568 = _623;
        _570 = _625;
    }
    bool _649 = _621;
    float _651 = _566;
    float _653 = _568;
    float _655 = _570;
    float _657 = _651;
    if (_605)
    {
        bool _659 = _607 >= 0.0;
        bool _661 = isnan(_607);
        bool _663 = _659 || _661;
        bool _665 = isnan(0.0);
        bool _667 = _663 || _665;
        _573 = _667 ? (-1) : 0;
    }
    int _669 = _573;
    int _671 = _669;
    if (_605)
    {
        _613 = _609;
    }
    float _673 = _613;
    float _675 = _673;
    if (!_605)
    {
        float _677 = fma(_212, -12.0, _609);
        float _679 = fma(_220, -12.0, _611);
        float2 _1858 = float2(_677, _679);
        float3 _681 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1858, float2(0.0), isnan(_1858))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1858, float2(0.0), isnan(_1858))).xyz;
        float _683 = _681.x;
        float _685 = _681.y;
        float _687 = _681.z;
        float _689 = _685 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _691 = fma(_683, (*spvDescriptorSet0.fp_c3)._m0[2].x, _689);
        float _693 = fma(_687, (*spvDescriptorSet0.fp_c3)._m0[2].z, _691);
        float _695 = -_322;
        float _697 = _695 + _693;
        bool _699 = _697 >= 0.0;
        bool _701 = isnan(_697);
        bool _703 = _699 || _701;
        bool _705 = isnan(0.0);
        bool _707 = _703 || _705;
        _615 = _679;
        _360 = _697;
        _675 = _677;
        _671 = _707 ? (-1) : 0;
    }
    float _709 = _615;
    float _711 = _360;
    float _713 = _675;
    int _715 = _671;
    float _717 = _711;
    if (_649)
    {
        bool _719 = _651 >= 0.0;
        bool _721 = isnan(_651);
        bool _723 = _719 || _721;
        bool _725 = isnan(0.0);
        bool _727 = _723 || _725;
        _617 = _727 ? (-1) : 0;
    }
    int _729 = _617;
    int _731 = _729;
    if (_649)
    {
        _657 = _653;
    }
    float _733 = _657;
    float _735 = _733;
    if (_649)
    {
        _717 = _655;
    }
    float _737 = _717;
    float _739 = _737;
    if (!_649)
    {
        float _741 = fma(_212, 12.0, _653);
        float _743 = fma(_220, 12.0, _655);
        float2 _1953 = float2(_741, _743);
        float3 _745 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1953, float2(0.0), isnan(_1953))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1953, float2(0.0), isnan(_1953))).xyz;
        float _747 = _745.x;
        float _749 = _745.y;
        float _751 = _745.z;
        float _753 = _749 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _755 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[2].x, _753);
        float _757 = fma(_751, (*spvDescriptorSet0.fp_c3)._m0[2].z, _755);
        float _759 = -_322;
        float _761 = _759 + _757;
        bool _763 = _761 >= 0.0;
        bool _765 = isnan(_761);
        bool _767 = _763 || _765;
        bool _769 = isnan(0.0);
        bool _771 = _767 || _769;
        _739 = _743;
        _735 = _741;
        _731 = _771 ? (-1) : 0;
    }
    float _773 = _739;
    float _775 = _735;
    int _777 = _731;
    float _779 = -_709;
    float _781 = _75 + _779;
    float _783 = -_75;
    float _785 = _783 + _773;
    float _787 = -_73;
    float _789 = _787 + _775;
    float _791 = -_713;
    float _793 = _73 + _791;
    float _795 = _204 * _781;
    float _797 = _204 * _785;
    float _799 = fma(_192, _793, _795);
    float _801 = fma(_192, _789, _797);
    float _803 = _799 + _801;
    bool _805 = _799 < _801;
    int _807 = ~_715;
    int _809 = (_805 ? (-1) : 0) & _807;
    bool _811 = _799 >= _801;
    bool _813 = isnan(_799);
    bool _815 = _811 || _813;
    bool _817 = isnan(_801);
    bool _819 = _815 || _817;
    int _821 = ~_777;
    int _823 = (_819 ? (-1) : 0) & _821;
    float _825 = 1.0 / _803;
    float _827 = precise::min(_799, _801);
    int _829 = ~_809;
    int _831 = _829 & _823;
    int _833 = ~_823;
    int _835 = _809 & _833;
    int _837 = _831 | _835;
    int _839 = _809 & _823;
    int _841 = _837 | _839;
    bool _843 = _93 < _322;
    int _845 = (_843 ? (-1) : 0) ^ _841;
    float _847 = _306 * 0.75;
    float _849 = -_827;
    float _851 = fma(_849, _825, 0.5);
    float _853 = (_845 != 0) ? _851 : 0.0;
    float _855 = precise::max(_853, _847);
    float _857 = _238 * _855;
    float _859 = fma(_204, _857, _73);
    float _861 = fma(_192, _857, _75);
    float2 _2127 = float2(_73, _75);
    float4 _863 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2127, float2(0.0), isnan(_2127))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2127, float2(0.0), isnan(_2127))).xyzw;
    float _865 = _863.x;
    float _867 = _863.y;
    float _869 = _863.z;
    float _871 = _863.w;
    float2 _2143 = float2(_859, _861);
    float4 _873 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2143, float2(0.0), isnan(_2143))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2143, float2(0.0), isnan(_2143))).xyzw;
    float _875 = _873.x;
    float _877 = _873.y;
    float _879 = _873.z;
    float _881 = _873.w;
    float _883 = -_875;
    float _885 = _865 + _883;
    float _887 = -_879;
    float _889 = _869 + _887;
    float _891 = -_877;
    float _893 = _867 + _891;
    float _895 = -_881;
    float _897 = _871 + _895;
    float _899 = fma(_885, (*spvDescriptorSet0.fp_c3)._m0[5].x, _875);
    float _901 = fma(_889, (*spvDescriptorSet0.fp_c3)._m0[5].x, _879);
    float _903 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[5].x, _877);
    float _905 = fma(_897, (*spvDescriptorSet0.fp_c3)._m0[5].x, _881);
    out.m_34.x = _899;
    out.m_34.y = _903;
    out.m_34.z = _901;
    out.m_34.w = _905;
    return out;
}

