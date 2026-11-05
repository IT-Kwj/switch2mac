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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _49;
    float _77 = _75 * _55;
    float _79 = _75 * _61;
    float _81 = _75 * _67;
    float _83 = _75 * _73;
    float2 _1115 = float2(_77, _79);
    float2 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1115, float2(0.0), isnan(_1115)), int2(0), component::x).xz;
    float _89 = _87.x;
    float _91 = _87.y;
    float2 _1130 = float2(_81, _83);
    float3 _95 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1130, float2(0.0), isnan(_1130)), int2(0), component::x).xzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _1144 = float2(_81, _83);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1144, float2(0.0), isnan(_1144))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1144, float2(0.0), isnan(_1144))).x;
    float _105 = precise::max(_89, _91);
    float _107 = precise::max(_97, _99);
    float _109 = precise::min(_89, _91);
    float _111 = precise::min(_97, _99);
    float _113 = precise::max(_105, _107);
    float _115 = precise::min(_109, _111);
    float _117 = precise::max(_101, _113);
    float _119 = precise::min(_101, _115);
    float _121 = _117 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _123 = -_119;
    float _125 = _117 + _123;
    float _127 = precise::max(_121, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _131 = _125 >= _127;
    bool _133 = isnan(_125);
    bool _135 = _131 || _133;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    float _141 = _127;
    float _143 = _121;
    float _145 = 0.0;
    float _147 = 0.0;
    if (!_139)
    {
        float2 _1209 = float2(_81, _83);
        float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1209, float2(0.0), isnan(_1209))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1209, float2(0.0), isnan(_1209))).xyzw;
        float _152 = _150.x;
        float _154 = _150.y;
        float _156 = _150.z;
        float _158 = _150.w;
        _141 = _152;
        _143 = _154;
        _145 = _156;
        _147 = _158;
    }
    float _160 = _141;
    float _162 = _143;
    float _164 = _145;
    float _166 = _147;
    float _168 = in.m_37.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_37.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_39.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_37.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_39.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _75 * _172;
    float _206 = _75 * _178;
    float _208 = _75 * _184;
    float _210 = _75 * _190;
    float _212 = _75 * _196;
    float _214 = fma(_206, _103, _204);
    float _216 = _75 * _202;
    float _218 = fma(_210, _103, _208);
    float _220 = fma(_216, _103, _212);
    float _222 = 1.0 / _214;
    float _224 = _218 * _222;
    float _226 = _220 * _222;
    float _228 = -_83;
    float _230 = _228 + _224;
    float _232 = -_81;
    float _234 = _232 + _226;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _238 = _234 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _240 = _236 * _236;
    float _242 = fma(_238, _238, _240);
    bool _244 = !_139;
    float _246 = _164;
    float _248 = _160;
    float _250 = _162;
    float _252 = _166;
    if (!_244)
    {
        float2 _1349 = float2(_81, _83);
        float _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1349, float2(0.0), isnan(_1349)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1349, float2(0.0), isnan(_1349)), int2(1, -1)).x;
        float2 _1360 = float2(_81, _83);
        float _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1360, float2(0.0), isnan(_1360)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1360, float2(0.0), isnan(_1360)), int2(-1, 1)).x;
        float _258 = _99 + _89;
        float _260 = _97 + _91;
        float _262 = fma(_101, -2.0, _258);
        float _264 = fma(_101, -2.0, _260);
        float _266 = _89 + _254;
        float _268 = _99 + _254;
        float _270 = _89 + _256;
        float _272 = _99 + _256;
        float _274 = fma(_91, -2.0, _266);
        float _276 = fma(_99, -2.0, _268);
        float _278 = fma(_89, -2.0, _270);
        float _280 = fma(_97, -2.0, _272);
        float _282 = abs(_262);
        float _284 = abs(_274);
        float _286 = fma(_282, 2.0, _284);
        float _288 = abs(_264);
        float _290 = abs(_278);
        float _292 = fma(_288, 2.0, _290);
        float _294 = abs(_280);
        float _296 = _294 + _286;
        float _298 = abs(_276);
        float _300 = _298 + _292;
        bool _302 = _300 >= _296;
        float _304 = float(_302);
        bool _306 = _300 < _296;
        bool _308 = isnan(_300);
        bool _310 = _306 || _308;
        bool _312 = isnan(_296);
        bool _314 = _310 || _312;
        float _316 = float(_314);
        float _318 = _91 * _304;
        float _320 = _97 * _304;
        float _322 = _304 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _324 = _316 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _326 = fma(_89, _316, _318);
        float _328 = fma(_99, _316, _320);
        float _330 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[0].x, _322);
        float _332 = _304 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _334 = -_101;
        float _336 = _334 + _326;
        float _338 = -_101;
        float _340 = _338 + _328;
        float _342 = abs(_336);
        float _344 = abs(_340);
        bool _346 = _342 >= _344;
        float _348 = -_330;
        float _350 = _346 ? _348 : _330;
        float _352 = _350 * 0.5;
        float _354 = fma(_316, _352, _81);
        float _356 = fma(_304, _352, _83);
        float _358 = -_332;
        float _360 = _358 + _354;
        float _362 = -_324;
        float _364 = _362 + _356;
        float _366 = _332 + _354;
        float _368 = _324 + _356;
        float2 _1532 = float2(_360, _364);
        float3 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1532, float2(0.0), isnan(_1532))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1532, float2(0.0), isnan(_1532))).xyz;
        float _372 = _370.x;
        float _374 = _370.y;
        float _376 = _370.z;
        float2 _1546 = float2(_366, _368);
        float3 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1546, float2(0.0), isnan(_1546))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1546, float2(0.0), isnan(_1546))).xyz;
        float _380 = _378.x;
        float _382 = _378.y;
        float _384 = _378.z;
        float _386 = 1.0 / _125;
        float _388 = _260 + _258;
        float _390 = _268 + _270;
        float _392 = _346 ? _326 : _328;
        float _394 = abs(_336);
        float _396 = abs(_340);
        float _398 = _346 ? _394 : _396;
        float _400 = fma(_388, 2.0, _390);
        float _402 = fma(_400, -0.083333335816860198974609375, _101);
        float _404 = abs(_402);
        float _406 = _404 * _386;
        float _408 = precise::clamp(_406, 0.0, 1.0);
        float _410 = fma(_408, 6.0, -15.0);
        float _412 = _408 * _408;
        float _414 = fma(_408, _410, 10.0);
        float _416 = _414 * _412;
        float _418 = _408 * _416;
        float _420 = _374 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _422 = _382 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _424 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[2].x, _420);
        float _426 = _101 + _392;
        float _428 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[2].x, _422);
        float _430 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[2].z, _424);
        float _432 = _426 * 0.5;
        float _434 = _398 * 0.25;
        float _436 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[2].z, _428);
        float _438 = -_432;
        float _440 = _438 + _430;
        float _442 = -_432;
        float _444 = _442 + _436;
        float _446 = abs(_440);
        bool _448 = _446 >= _434;
        float _450 = abs(_444);
        bool _452 = _450 >= _434;
        bool _454 = false;
        float _456 = _428;
        float _458 = _440;
        float _460 = _360;
        float _462 = _364;
        float _464 = _416;
        bool _466 = _448;
        float _468 = _412;
        float _470 = _366;
        float _472 = _444;
        bool _474 = _452;
        float _476 = _368;
        float _478 = _434;
        if (_448)
        {
            _454 = true;
        }
        bool _480 = _454;
        bool _482 = _480;
        if (!_448)
        {
            float _484 = -_332;
            float _486 = _484 + _360;
            float _488 = -_324;
            float _490 = _488 + _364;
            float2 _1699 = float2(_486, _490);
            float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1699, float2(0.0), isnan(_1699))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1699, float2(0.0), isnan(_1699))).xyz;
            float _494 = _492.x;
            float _496 = _492.y;
            float _498 = _492.z;
            float _500 = _496 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _502 = fma(_494, (*spvDescriptorSet0.fp_c3)._m0[2].x, _500);
            float _504 = fma(_498, (*spvDescriptorSet0.fp_c3)._m0[2].z, _502);
            float _506 = -_432;
            float _508 = _506 + _504;
            float _510 = abs(_508);
            bool _512 = _510 >= _434;
            _456 = _502;
            _482 = _512;
            _458 = _508;
            _460 = _486;
            _462 = _490;
            _464 = _504;
        }
        float _514 = _456;
        bool _516 = _482;
        float _518 = _458;
        float _520 = _460;
        float _522 = _462;
        float _524 = _464;
        float _526 = _524;
        float _528 = _514;
        float _530 = _522;
        bool _532 = _516;
        if (_452)
        {
            _466 = true;
        }
        bool _534 = _466;
        bool _536 = _534;
        if (_452)
        {
            _468 = _366;
        }
        float _538 = _468;
        float _540 = _538;
        if (_452)
        {
            _526 = _368;
        }
        float _542 = _526;
        float _544 = _542;
        if (!_452)
        {
            float _546 = _332 + _366;
            float _548 = _324 + _368;
            float2 _1780 = float2(_546, _548);
            float3 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1780, float2(0.0), isnan(_1780))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1780, float2(0.0), isnan(_1780))).xyz;
            float _552 = _550.x;
            float _554 = _550.y;
            float _556 = _550.z;
            float _558 = _554 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _560 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[2].x, _558);
            float _562 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[2].z, _560);
            float _564 = -_432;
            float _566 = _564 + _562;
            float _568 = abs(_566);
            bool _570 = _568 >= _434;
            _528 = _552;
            _470 = _556;
            _536 = _570;
            _540 = _546;
            _544 = _548;
            _472 = _566;
        }
        float _572 = _528;
        float _574 = _470;
        bool _576 = _536;
        float _578 = _540;
        float _580 = _544;
        float _582 = _472;
        float _584 = _574;
        float _586 = _572;
        float _588 = _578;
        float _590 = _580;
        float _592 = _582;
        bool _594 = _576;
        if (_516)
        {
            _584 = _518;
        }
        float _596 = _584;
        float _598 = _596;
        if (_516)
        {
            _474 = true;
        }
        bool _600 = _474;
        bool _602 = _600;
        if (_516)
        {
            _476 = _520;
        }
        float _604 = _476;
        float _606 = _604;
        if (!_516)
        {
            float _608 = fma(_332, -1.5, _520);
            float _610 = fma(_324, -1.5, _522);
            float2 _1864 = float2(_608, _610);
            float3 _612 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1864, float2(0.0), isnan(_1864))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1864, float2(0.0), isnan(_1864))).xyz;
            float _614 = _612.x;
            float _616 = _612.y;
            float _618 = _612.z;
            float _620 = _616 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _622 = fma(_614, (*spvDescriptorSet0.fp_c3)._m0[2].x, _620);
            float _624 = fma(_618, (*spvDescriptorSet0.fp_c3)._m0[2].z, _622);
            float _626 = -_432;
            float _628 = _626 + _624;
            float _630 = abs(_628);
            bool _632 = _630 >= _434;
            _586 = _614;
            _602 = _632;
            _606 = _608;
            _530 = _610;
            _598 = _628;
        }
        float _634 = _586;
        bool _636 = _602;
        float _638 = _606;
        float _640 = _530;
        float _642 = _598;
        float _644 = _634;
        float _646 = _642;
        float _648 = _640;
        float _650 = _638;
        bool _652 = _636;
        if (_576)
        {
            _532 = true;
        }
        bool _654 = _532;
        bool _656 = _654;
        if (!_576)
        {
            float _658 = fma(_332, 1.5, _578);
            float _660 = fma(_324, 1.5, _580);
            float2 _1933 = float2(_658, _660);
            float3 _662 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1933, float2(0.0), isnan(_1933))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1933, float2(0.0), isnan(_1933))).xyz;
            float _664 = _662.x;
            float _666 = _662.y;
            float _668 = _662.z;
            float _670 = _666 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _672 = fma(_664, (*spvDescriptorSet0.fp_c3)._m0[2].x, _670);
            float _674 = fma(_668, (*spvDescriptorSet0.fp_c3)._m0[2].z, _672);
            float _676 = -_432;
            float _678 = _676 + _674;
            float _680 = abs(_678);
            bool _682 = _680 >= _434;
            _644 = _664;
            _656 = _682;
            _588 = _658;
            _590 = _660;
            _592 = _678;
        }
        float _684 = _644;
        bool _686 = _656;
        float _688 = _588;
        float _690 = _590;
        float _692 = _592;
        float _694 = _684;
        float _696 = _692;
        float _698 = _688;
        float _700 = _690;
        int _703 = _686 ? (-1) : 0;
        if (_636)
        {
            _594 = true;
        }
        bool _705 = _594;
        bool _707 = _705;
        if (!_636)
        {
            float _709 = fma(_332, -3.0, _638);
            float _711 = fma(_324, -3.0, _640);
            float2 _2003 = float2(_709, _711);
            float3 _713 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2003, float2(0.0), isnan(_2003))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2003, float2(0.0), isnan(_2003))).xyz;
            float _715 = _713.x;
            float _717 = _713.y;
            float _719 = _713.z;
            float _721 = _717 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _723 = fma(_715, (*spvDescriptorSet0.fp_c3)._m0[2].x, _721);
            float _725 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[2].z, _723);
            float _727 = -_432;
            float _729 = _727 + _725;
            float _731 = abs(_729);
            bool _733 = _731 >= _434;
            _694 = _715;
            _707 = _733;
            _646 = _729;
            _648 = _711;
            _650 = _709;
        }
        float _735 = _694;
        bool _737 = _707;
        float _739 = _646;
        float _741 = _648;
        float _743 = _650;
        float _745 = _735;
        float _747 = _739;
        float _749 = _743;
        int _751 = _737 ? (-1) : 0;
        if (_686)
        {
            _652 = true;
        }
        bool _753 = _652;
        bool _755 = _753;
        if (!_686)
        {
            float _757 = fma(_332, 3.0, _688);
            float _759 = fma(_324, 3.0, _690);
            float2 _2072 = float2(_757, _759);
            float3 _761 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2072, float2(0.0), isnan(_2072))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2072, float2(0.0), isnan(_2072))).xyz;
            float _763 = _761.x;
            float _765 = _761.y;
            float _767 = _761.z;
            float _769 = _765 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _771 = fma(_763, (*spvDescriptorSet0.fp_c3)._m0[2].x, _769);
            float _773 = fma(_767, (*spvDescriptorSet0.fp_c3)._m0[2].z, _771);
            float _775 = -_432;
            float _777 = _775 + _773;
            float _779 = abs(_777);
            bool _781 = _779 >= _434;
            _745 = _763;
            _755 = _781;
            _696 = _777;
            _698 = _757;
            _700 = _759;
        }
        float _783 = _745;
        bool _785 = _755;
        float _787 = _696;
        float _789 = _698;
        float _791 = _700;
        float _793 = _783;
        if (_737)
        {
            bool _795 = _739 >= 0.0;
            bool _797 = isnan(_739);
            bool _799 = _795 || _797;
            bool _801 = isnan(0.0);
            bool _803 = _799 || _801;
            _703 = _803 ? (-1) : 0;
        }
        int _805 = _703;
        int _807 = _805;
        if (_737)
        {
            _747 = _741;
        }
        float _809 = _747;
        float _811 = _809;
        if (!_737)
        {
            float _813 = fma(_332, -12.0, _743);
            float _815 = fma(_324, -12.0, _741);
            float2 _2156 = float2(_813, _815);
            float3 _817 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2156, float2(0.0), isnan(_2156))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2156, float2(0.0), isnan(_2156))).xyz;
            float _819 = _817.x;
            float _821 = _817.y;
            float _823 = _817.z;
            float _825 = _821 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _827 = fma(_819, (*spvDescriptorSet0.fp_c3)._m0[2].x, _825);
            float _829 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[2].z, _827);
            float _831 = -_432;
            float _833 = _831 + _829;
            bool _835 = _833 >= 0.0;
            bool _837 = isnan(_833);
            bool _839 = _835 || _837;
            bool _841 = isnan(0.0);
            bool _843 = _839 || _841;
            _811 = _815;
            _793 = _827;
            _478 = _833;
            _749 = _813;
            _807 = _843 ? (-1) : 0;
        }
        float _845 = _811;
        float _847 = _793;
        float _849 = _478;
        float _851 = _749;
        int _853 = _807;
        float _855 = _849;
        float _857 = _847;
        if (_785)
        {
            bool _859 = _787 >= 0.0;
            bool _861 = isnan(_787);
            bool _863 = _859 || _861;
            bool _865 = isnan(0.0);
            bool _867 = _863 || _865;
            _751 = _867 ? (-1) : 0;
        }
        int _869 = _751;
        int _871 = _869;
        if (_785)
        {
            _855 = _789;
        }
        float _873 = _855;
        float _875 = _873;
        if (_785)
        {
            _857 = _791;
        }
        float _877 = _857;
        float _879 = _877;
        if (!_785)
        {
            float _881 = fma(_332, 12.0, _789);
            float _883 = fma(_324, 12.0, _791);
            float2 _2254 = float2(_881, _883);
            float3 _885 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2254, float2(0.0), isnan(_2254))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2254, float2(0.0), isnan(_2254))).xyz;
            float _887 = _885.x;
            float _889 = _885.y;
            float _891 = _885.z;
            float _893 = _889 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _895 = fma(_887, (*spvDescriptorSet0.fp_c3)._m0[2].x, _893);
            float _897 = fma(_891, (*spvDescriptorSet0.fp_c3)._m0[2].z, _895);
            float _899 = -_432;
            float _901 = _899 + _897;
            bool _903 = _901 >= 0.0;
            bool _905 = isnan(_901);
            bool _907 = _903 || _905;
            bool _909 = isnan(0.0);
            bool _911 = _907 || _909;
            _879 = _883;
            _875 = _881;
            _871 = _911 ? (-1) : 0;
        }
        float _913 = _879;
        float _915 = _875;
        int _917 = _871;
        float _919 = -_845;
        float _921 = _83 + _919;
        float _923 = -_83;
        float _925 = _923 + _913;
        float _927 = -_81;
        float _929 = _927 + _915;
        float _931 = -_851;
        float _933 = _81 + _931;
        float _935 = _316 * _921;
        float _937 = _316 * _925;
        float _939 = fma(_304, _933, _935);
        float _941 = fma(_304, _929, _937);
        float _943 = _939 + _941;
        bool _945 = _939 < _941;
        int _947 = ~_853;
        int _949 = (_945 ? (-1) : 0) & _947;
        bool _951 = _939 >= _941;
        bool _953 = isnan(_939);
        bool _955 = _951 || _953;
        bool _957 = isnan(_941);
        bool _959 = _955 || _957;
        int _961 = ~_917;
        int _963 = (_959 ? (-1) : 0) & _961;
        float _965 = 1.0 / _943;
        float _967 = precise::min(_939, _941);
        int _969 = ~_949;
        int _971 = _969 & _963;
        int _973 = ~_963;
        int _975 = _949 & _973;
        int _977 = _971 | _975;
        int _979 = _949 & _963;
        int _981 = _977 | _979;
        bool _983 = _101 < _432;
        int _985 = (_983 ? (-1) : 0) ^ _981;
        float _987 = _418 * 0.75;
        float _989 = -_967;
        float _991 = fma(_989, _965, 0.5);
        float _993 = (_985 != 0) ? _991 : 0.0;
        float _995 = precise::max(_993, _987);
        float _997 = _350 * _995;
        float _999 = fma(_316, _997, _81);
        float _1001 = fma(_304, _997, _83);
        float2 _2428 = float2(_999, _1001);
        float4 _1003 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2428, float2(0.0), isnan(_2428))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2428, float2(0.0), isnan(_2428))).xyzw;
        float _1005 = _1003.x;
        float _1007 = _1003.y;
        float _1009 = _1003.z;
        float _1011 = _1003.w;
        _246 = _1009;
        _248 = _1005;
        _250 = _1007;
        _252 = _1011;
    }
    float _1013 = _246;
    float _1015 = _248;
    float _1017 = _250;
    float _1019 = _252;
    float2 _2453 = float2(_226, _224);
    float4 _1021 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2453, float2(0.0), isnan(_2453))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2453, float2(0.0), isnan(_2453))).xyzw;
    float _1023 = _1021.x;
    float _1025 = _1021.y;
    float _1027 = _1021.z;
    float _1029 = _1021.w;
    float _1031 = sqrt(_242);
    float _1033 = 0.0 + _1031;
    float _1035 = precise::clamp(_1033, 0.0, 1.0);
    float _1037 = fma(_1035, -0.5, 0.5);
    float _1039 = -_1013;
    float _1041 = _1027 + _1039;
    float _1043 = -_1015;
    float _1045 = _1023 + _1043;
    float _1047 = -_1017;
    float _1049 = _1025 + _1047;
    float _1051 = -_1019;
    float _1053 = _1029 + _1051;
    float _1055 = fma(_1037, _1041, _1013);
    float _1057 = fma(_1037, _1045, _1015);
    float _1059 = fma(_1037, _1049, _1017);
    float _1061 = fma(_1037, _1053, _1019);
    out.m_42.x = _1057;
    out.m_42.y = _1059;
    out.m_42.z = _1055;
    out.m_42.w = _1061;
    return out;
}

