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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _1159 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1159, float2(0.0), isnan(_1159)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1159, float2(0.0), isnan(_1159)), int2(1, 0)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _1178 = float2(_63, _65);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1178, float2(0.0), isnan(_1178)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1178, float2(0.0), isnan(_1178)), int2(0, 1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _1193 = float2(_63, _65);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1193, float2(0.0), isnan(_1193)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1193, float2(0.0), isnan(_1193)), int2(0, -1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1209 = float2(_63, _65);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1209, float2(0.0), isnan(_1209)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1209, float2(0.0), isnan(_1209)), int2(-1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _1224 = float2(_63, _65);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1224, float2(0.0), isnan(_1224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1224, float2(0.0), isnan(_1224))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _1238 = float2(_63, _65);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1238, float2(0.0), isnan(_1238))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1238, float2(0.0), isnan(_1238))).x;
    float _111 = _73 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _113 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _115 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _117 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _119 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].x, _111);
    float _121 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _113);
    float _123 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _115);
    float _125 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].z, _119);
    float _129 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _121);
    float _131 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _133 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _123);
    float _135 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _125);
    float _137 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _131);
    float _139 = precise::max(_127, _129);
    float _141 = precise::max(_133, _135);
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _137);
    float _145 = precise::min(_127, _129);
    float _147 = precise::min(_133, _135);
    float _149 = precise::max(_141, _139);
    float _151 = precise::min(_147, _145);
    float _153 = precise::max(_143, _149);
    float _155 = precise::min(_143, _151);
    float _157 = _153 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _159 = -_155;
    float _161 = _153 + _159;
    float _163 = precise::max(_157, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _167 = _161 >= _163;
    bool _169 = isnan(_161);
    bool _171 = _167 || _169;
    bool _173 = isnan(_163);
    bool _175 = _171 || _173;
    float _177 = _157;
    float _179 = _163;
    float _181 = _153;
    float _183 = _145;
    if (!_175)
    {
        float2 _1376 = float2(_63, _65);
        float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1376, float2(0.0), isnan(_1376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1376, float2(0.0), isnan(_1376))).xyzw;
        float _188 = _186.x;
        float _190 = _186.y;
        float _192 = _186.z;
        float _194 = _186.w;
        _177 = _188;
        _179 = _190;
        _181 = _192;
        _183 = _194;
    }
    float _196 = _177;
    float _198 = _179;
    float _200 = _181;
    float _202 = _183;
    float _204 = in.m_35.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_37.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_35.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_37.y;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_35.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_37.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = _61 * _208;
    float _242 = _61 * _214;
    float _244 = _61 * _220;
    float _246 = _61 * _226;
    float _248 = _61 * _232;
    float _250 = fma(_242, _109, _240);
    float _252 = _61 * _238;
    float _254 = fma(_246, _109, _244);
    float _256 = fma(_252, _109, _248);
    float _258 = 1.0 / _250;
    float _260 = _254 * _258;
    float _262 = _256 * _258;
    float _264 = -_65;
    float _266 = _264 + _260;
    float _268 = -_63;
    float _270 = _268 + _262;
    float _272 = _266 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _274 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _276 = _272 * _272;
    float _278 = fma(_274, _274, _276);
    bool _280 = !_175;
    float _282 = _200;
    float _284 = _196;
    float _286 = _198;
    float _288 = _202;
    if (!_280)
    {
        float2 _1516 = float2(_63, _65);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1516, float2(0.0), isnan(_1516)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1516, float2(0.0), isnan(_1516)), int2(1, -1)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _1531 = float2(_63, _65);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1531, float2(0.0), isnan(_1531)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1531, float2(0.0), isnan(_1531)), int2(-1, 1)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float _306 = _127 + _135;
        float _308 = _294 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _312 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[2].x, _308);
        float _314 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[2].x, _310);
        float _316 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
        float _318 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[2].z, _314);
        float _320 = _129 + _133;
        float _322 = fma(_143, -2.0, _306);
        float _324 = _135 + _316;
        float _326 = _135 + _318;
        float _328 = _127 + _318;
        float _330 = fma(_143, -2.0, _320);
        float _332 = fma(_133, -2.0, _324);
        float _334 = fma(_135, -2.0, _326);
        float _336 = _127 + _316;
        float _338 = fma(_129, -2.0, _328);
        float _340 = abs(_322);
        float _342 = abs(_332);
        float _344 = fma(_340, 2.0, _342);
        float _346 = abs(_330);
        float _348 = abs(_334);
        float _350 = fma(_346, 2.0, _348);
        float _352 = fma(_127, -2.0, _336);
        float _354 = abs(_338);
        float _356 = _354 + _344;
        float _358 = abs(_352);
        float _360 = _358 + _350;
        bool _362 = _360 >= _356;
        float _364 = float(_362);
        bool _366 = _360 < _356;
        bool _368 = isnan(_360);
        bool _370 = _366 || _368;
        bool _372 = isnan(_356);
        bool _374 = _370 || _372;
        float _376 = float(_374);
        float _378 = _133 * _364;
        float _380 = _129 * _364;
        float _382 = _364 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _384 = fma(_135, _376, _378);
        float _386 = fma(_127, _376, _380);
        float _388 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[0].x, _382);
        float _390 = _364 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _392 = -_143;
        float _394 = _392 + _384;
        float _396 = -_143;
        float _398 = _396 + _386;
        float _400 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _402 = abs(_394);
        float _404 = abs(_398);
        bool _406 = _402 >= _404;
        float _408 = -_388;
        float _410 = _406 ? _408 : _388;
        float _412 = _410 * 0.5;
        float _414 = fma(_376, _412, _63);
        float _416 = fma(_364, _412, _65);
        float _418 = -_390;
        float _420 = _418 + _414;
        float _422 = -_400;
        float _424 = _422 + _416;
        float _426 = _390 + _414;
        float _428 = _400 + _416;
        float2 _1737 = float2(_420, _424);
        float3 _430 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1737, float2(0.0), isnan(_1737))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1737, float2(0.0), isnan(_1737))).xyz;
        float _432 = _430.x;
        float _434 = _430.y;
        float _436 = _430.z;
        float2 _1751 = float2(_426, _428);
        float3 _438 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1751, float2(0.0), isnan(_1751))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1751, float2(0.0), isnan(_1751))).xyz;
        float _440 = _438.x;
        float _442 = _438.y;
        float _444 = _438.z;
        float _446 = 1.0 / _161;
        float _448 = _320 + _306;
        float _450 = _336 + _326;
        float _452 = _406 ? _384 : _386;
        float _454 = abs(_394);
        float _456 = abs(_398);
        float _458 = _406 ? _454 : _456;
        float _460 = fma(_448, 2.0, _450);
        float _462 = fma(_460, -0.083333335816860198974609375, _143);
        float _464 = abs(_462);
        float _466 = _464 * _446;
        float _468 = precise::clamp(_466, 0.0, 1.0);
        float _470 = fma(_468, 6.0, -15.0);
        float _472 = _468 * _468;
        float _474 = fma(_468, _470, 10.0);
        float _476 = _474 * _472;
        float _478 = _468 * _476;
        float _480 = _434 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _482 = _442 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _484 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[2].x, _480);
        float _486 = _143 + _452;
        float _488 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[2].x, _482);
        float _490 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[2].z, _484);
        float _492 = _486 * 0.5;
        float _494 = _458 * 0.25;
        float _496 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[2].z, _488);
        float _498 = -_492;
        float _500 = _498 + _490;
        float _502 = -_492;
        float _504 = _502 + _496;
        float _506 = abs(_500);
        bool _508 = _506 >= _494;
        float _510 = abs(_504);
        bool _512 = _510 >= _494;
        bool _514 = false;
        float _516 = _488;
        float _518 = _500;
        float _520 = _420;
        float _522 = _424;
        float _524 = _476;
        bool _526 = _508;
        float _528 = _472;
        float _530 = _428;
        float _532 = _504;
        bool _534 = _512;
        float _536 = _426;
        float _538 = _494;
        if (_508)
        {
            _514 = true;
        }
        bool _540 = _514;
        bool _542 = _540;
        if (!_508)
        {
            float _544 = -_390;
            float _546 = _544 + _420;
            float _548 = -_400;
            float _550 = _548 + _424;
            float2 _1904 = float2(_546, _550);
            float3 _552 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1904, float2(0.0), isnan(_1904))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1904, float2(0.0), isnan(_1904))).xyz;
            float _554 = _552.x;
            float _556 = _552.y;
            float _558 = _552.z;
            float _560 = _556 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _562 = fma(_554, (*spvDescriptorSet0.fp_c3)._m0[2].x, _560);
            float _564 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[2].z, _562);
            float _566 = -_492;
            float _568 = _566 + _564;
            float _570 = abs(_568);
            bool _572 = _570 >= _494;
            _516 = _562;
            _542 = _572;
            _518 = _568;
            _520 = _546;
            _522 = _550;
            _524 = _564;
        }
        float _574 = _516;
        bool _576 = _542;
        float _578 = _518;
        float _580 = _520;
        float _582 = _522;
        float _584 = _524;
        float _586 = _584;
        float _588 = _574;
        float _590 = _578;
        bool _592 = _576;
        if (_512)
        {
            _526 = true;
        }
        bool _594 = _526;
        bool _596 = _594;
        if (_512)
        {
            _586 = _426;
        }
        float _598 = _586;
        float _600 = _598;
        if (_512)
        {
            _528 = _428;
        }
        float _602 = _528;
        float _604 = _602;
        if (!_512)
        {
            float _606 = _390 + _426;
            float _608 = _400 + _428;
            float2 _1985 = float2(_606, _608);
            float3 _610 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1985, float2(0.0), isnan(_1985))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1985, float2(0.0), isnan(_1985))).xyz;
            float _612 = _610.x;
            float _614 = _610.y;
            float _616 = _610.z;
            float _618 = _614 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _620 = fma(_612, (*spvDescriptorSet0.fp_c3)._m0[2].x, _618);
            float _622 = fma(_616, (*spvDescriptorSet0.fp_c3)._m0[2].z, _620);
            float _624 = -_492;
            float _626 = _624 + _622;
            float _628 = abs(_626);
            bool _630 = _628 >= _494;
            _588 = _612;
            _530 = _616;
            _596 = _630;
            _600 = _606;
            _604 = _608;
            _532 = _626;
        }
        float _632 = _588;
        float _634 = _530;
        bool _636 = _596;
        float _638 = _600;
        float _640 = _604;
        float _642 = _532;
        float _644 = _634;
        float _646 = _632;
        float _648 = _638;
        float _650 = _640;
        float _652 = _642;
        bool _654 = _636;
        if (_576)
        {
            _644 = _578;
        }
        float _656 = _644;
        float _658 = _656;
        if (_576)
        {
            _534 = true;
        }
        bool _660 = _534;
        bool _662 = _660;
        if (_576)
        {
            _536 = _580;
        }
        float _664 = _536;
        float _666 = _664;
        if (_576)
        {
            _590 = _582;
        }
        float _668 = _590;
        float _670 = _668;
        if (!_576)
        {
            float _672 = fma(_390, -1.5, _580);
            float _674 = fma(_400, -1.5, _582);
            float2 _2075 = float2(_672, _674);
            float3 _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2075, float2(0.0), isnan(_2075))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2075, float2(0.0), isnan(_2075))).xyz;
            float _678 = _676.x;
            float _680 = _676.y;
            float _682 = _676.z;
            float _684 = _680 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _686 = fma(_678, (*spvDescriptorSet0.fp_c3)._m0[2].x, _684);
            float _688 = fma(_682, (*spvDescriptorSet0.fp_c3)._m0[2].z, _686);
            float _690 = -_492;
            float _692 = _690 + _688;
            float _694 = abs(_692);
            bool _696 = _694 >= _494;
            _646 = _678;
            _662 = _696;
            _666 = _672;
            _670 = _674;
            _658 = _692;
        }
        float _698 = _646;
        bool _700 = _662;
        float _702 = _666;
        float _704 = _670;
        float _706 = _658;
        float _708 = _698;
        float _710 = _706;
        float _712 = _704;
        float _714 = _702;
        bool _716 = _700;
        if (_636)
        {
            _592 = true;
        }
        bool _718 = _592;
        bool _720 = _718;
        if (!_636)
        {
            float _722 = fma(_390, 1.5, _638);
            float _724 = fma(_400, 1.5, _640);
            float2 _2144 = float2(_722, _724);
            float3 _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2144, float2(0.0), isnan(_2144))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2144, float2(0.0), isnan(_2144))).xyz;
            float _728 = _726.x;
            float _730 = _726.y;
            float _732 = _726.z;
            float _734 = _730 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _736 = fma(_728, (*spvDescriptorSet0.fp_c3)._m0[2].x, _734);
            float _738 = fma(_732, (*spvDescriptorSet0.fp_c3)._m0[2].z, _736);
            float _740 = -_492;
            float _742 = _740 + _738;
            float _744 = abs(_742);
            bool _746 = _744 >= _494;
            _708 = _728;
            _720 = _746;
            _648 = _722;
            _650 = _724;
            _652 = _742;
        }
        float _748 = _708;
        bool _750 = _720;
        float _752 = _648;
        float _754 = _650;
        float _756 = _652;
        float _758 = _748;
        float _760 = _756;
        float _762 = _752;
        float _764 = _754;
        int _767 = _750 ? (-1) : 0;
        if (_700)
        {
            _654 = true;
        }
        bool _769 = _654;
        bool _771 = _769;
        if (!_700)
        {
            float _773 = fma(_390, -3.0, _702);
            float _775 = fma(_400, -3.0, _704);
            float2 _2214 = float2(_773, _775);
            float3 _777 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2214, float2(0.0), isnan(_2214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2214, float2(0.0), isnan(_2214))).xyz;
            float _779 = _777.x;
            float _781 = _777.y;
            float _783 = _777.z;
            float _785 = _781 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _787 = fma(_779, (*spvDescriptorSet0.fp_c3)._m0[2].x, _785);
            float _789 = fma(_783, (*spvDescriptorSet0.fp_c3)._m0[2].z, _787);
            float _791 = -_492;
            float _793 = _791 + _789;
            float _795 = abs(_793);
            bool _797 = _795 >= _494;
            _758 = _779;
            _771 = _797;
            _710 = _793;
            _712 = _775;
            _714 = _773;
        }
        float _799 = _758;
        bool _801 = _771;
        float _803 = _710;
        float _805 = _712;
        float _807 = _714;
        float _809 = _799;
        float _811 = _803;
        float _813 = _807;
        int _815 = _801 ? (-1) : 0;
        if (_750)
        {
            _716 = true;
        }
        bool _817 = _716;
        bool _819 = _817;
        if (!_750)
        {
            float _821 = fma(_390, 3.0, _752);
            float _823 = fma(_400, 3.0, _754);
            float2 _2283 = float2(_821, _823);
            float3 _825 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2283, float2(0.0), isnan(_2283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2283, float2(0.0), isnan(_2283))).xyz;
            float _827 = _825.x;
            float _829 = _825.y;
            float _831 = _825.z;
            float _833 = _829 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _835 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[2].x, _833);
            float _837 = fma(_831, (*spvDescriptorSet0.fp_c3)._m0[2].z, _835);
            float _839 = -_492;
            float _841 = _839 + _837;
            float _843 = abs(_841);
            bool _845 = _843 >= _494;
            _809 = _827;
            _819 = _845;
            _760 = _841;
            _762 = _821;
            _764 = _823;
        }
        float _847 = _809;
        bool _849 = _819;
        float _851 = _760;
        float _853 = _762;
        float _855 = _764;
        float _857 = _847;
        if (_801)
        {
            bool _859 = _803 >= 0.0;
            bool _861 = isnan(_803);
            bool _863 = _859 || _861;
            bool _865 = isnan(0.0);
            bool _867 = _863 || _865;
            _767 = _867 ? (-1) : 0;
        }
        int _869 = _767;
        int _871 = _869;
        if (_801)
        {
            _811 = _805;
        }
        float _873 = _811;
        float _875 = _873;
        if (!_801)
        {
            float _877 = fma(_390, -12.0, _807);
            float _879 = fma(_400, -12.0, _805);
            float2 _2367 = float2(_877, _879);
            float3 _881 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2367, float2(0.0), isnan(_2367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2367, float2(0.0), isnan(_2367))).xyz;
            float _883 = _881.x;
            float _885 = _881.y;
            float _887 = _881.z;
            float _889 = _885 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _891 = fma(_883, (*spvDescriptorSet0.fp_c3)._m0[2].x, _889);
            float _893 = fma(_887, (*spvDescriptorSet0.fp_c3)._m0[2].z, _891);
            float _895 = -_492;
            float _897 = _895 + _893;
            bool _899 = _897 >= 0.0;
            bool _901 = isnan(_897);
            bool _903 = _899 || _901;
            bool _905 = isnan(0.0);
            bool _907 = _903 || _905;
            _875 = _879;
            _857 = _891;
            _538 = _897;
            _813 = _877;
            _871 = _907 ? (-1) : 0;
        }
        float _909 = _875;
        float _911 = _857;
        float _913 = _538;
        float _915 = _813;
        int _917 = _871;
        float _919 = _913;
        float _921 = _911;
        if (_849)
        {
            bool _923 = _851 >= 0.0;
            bool _925 = isnan(_851);
            bool _927 = _923 || _925;
            bool _929 = isnan(0.0);
            bool _931 = _927 || _929;
            _815 = _931 ? (-1) : 0;
        }
        int _933 = _815;
        int _935 = _933;
        if (_849)
        {
            _919 = _853;
        }
        float _937 = _919;
        float _939 = _937;
        if (_849)
        {
            _921 = _855;
        }
        float _941 = _921;
        float _943 = _941;
        if (!_849)
        {
            float _945 = fma(_390, 12.0, _853);
            float _947 = fma(_400, 12.0, _855);
            float2 _2465 = float2(_945, _947);
            float3 _949 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2465, float2(0.0), isnan(_2465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2465, float2(0.0), isnan(_2465))).xyz;
            float _951 = _949.x;
            float _953 = _949.y;
            float _955 = _949.z;
            float _957 = _953 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _959 = fma(_951, (*spvDescriptorSet0.fp_c3)._m0[2].x, _957);
            float _961 = fma(_955, (*spvDescriptorSet0.fp_c3)._m0[2].z, _959);
            float _963 = -_492;
            float _965 = _963 + _961;
            bool _967 = _965 >= 0.0;
            bool _969 = isnan(_965);
            bool _971 = _967 || _969;
            bool _973 = isnan(0.0);
            bool _975 = _971 || _973;
            _943 = _947;
            _939 = _945;
            _935 = _975 ? (-1) : 0;
        }
        float _977 = _943;
        float _979 = _939;
        int _981 = _935;
        float _983 = -_909;
        float _985 = _65 + _983;
        float _987 = -_65;
        float _989 = _987 + _977;
        float _991 = -_63;
        float _993 = _991 + _979;
        float _995 = -_915;
        float _997 = _63 + _995;
        float _999 = _376 * _985;
        float _1001 = _376 * _989;
        float _1003 = _478 * 0.75;
        float _1005 = fma(_364, _997, _999);
        float _1007 = fma(_364, _993, _1001);
        float _1009 = _1005 + _1007;
        bool _1011 = _1005 < _1007;
        int _1013 = ~_917;
        int _1015 = (_1011 ? (-1) : 0) & _1013;
        bool _1017 = _1005 >= _1007;
        bool _1019 = isnan(_1005);
        bool _1021 = _1017 || _1019;
        bool _1023 = isnan(_1007);
        bool _1025 = _1021 || _1023;
        int _1027 = ~_981;
        int _1029 = (_1025 ? (-1) : 0) & _1027;
        float _1031 = 1.0 / _1009;
        float _1033 = precise::min(_1005, _1007);
        int _1035 = ~_1015;
        int _1037 = _1035 & _1029;
        int _1039 = ~_1029;
        int _1041 = _1015 & _1039;
        int _1043 = _1037 | _1041;
        int _1045 = _1015 & _1029;
        int _1047 = _1043 | _1045;
        bool _1049 = _143 < _492;
        int _1051 = (_1049 ? (-1) : 0) ^ _1047;
        float _1053 = -_1033;
        float _1055 = fma(_1053, _1031, 0.5);
        float _1057 = (_1051 != 0) ? _1055 : 0.0;
        float _1059 = precise::max(_1057, _1003);
        float _1061 = _410 * _1059;
        float _1063 = fma(_376, _1061, _63);
        float _1065 = fma(_364, _1061, _65);
        float2 _2639 = float2(_1063, _1065);
        float4 _1067 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2639, float2(0.0), isnan(_2639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2639, float2(0.0), isnan(_2639))).xyzw;
        float _1069 = _1067.x;
        float _1071 = _1067.y;
        float _1073 = _1067.z;
        float _1075 = _1067.w;
        _282 = _1073;
        _284 = _1069;
        _286 = _1071;
        _288 = _1075;
    }
    float _1077 = _282;
    float _1079 = _284;
    float _1081 = _286;
    float _1083 = _288;
    float2 _2664 = float2(_262, _260);
    float4 _1085 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2664, float2(0.0), isnan(_2664))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2664, float2(0.0), isnan(_2664))).xyzw;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = _1085.w;
    float _1095 = sqrt(_278);
    float _1097 = 0.0 + _1095;
    float _1099 = precise::clamp(_1097, 0.0, 1.0);
    float _1101 = fma(_1099, -0.5, 0.5);
    float _1103 = -_1077;
    float _1105 = _1091 + _1103;
    float _1107 = -_1079;
    float _1109 = _1087 + _1107;
    float _1111 = -_1081;
    float _1113 = _1089 + _1111;
    float _1115 = -_1083;
    float _1117 = _1093 + _1115;
    float _1119 = fma(_1101, _1105, _1077);
    float _1121 = fma(_1101, _1109, _1079);
    float _1123 = fma(_1101, _1113, _1081);
    float _1125 = fma(_1101, _1117, _1083);
    out.m_40.x = _1121;
    out.m_40.y = _1123;
    out.m_40.z = _1119;
    out.m_40.w = _1125;
    return out;
}

