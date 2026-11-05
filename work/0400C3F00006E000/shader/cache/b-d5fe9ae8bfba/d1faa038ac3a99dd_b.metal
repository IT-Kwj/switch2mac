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
    float4 m_37 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
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
    float2 _1169 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1169, float2(0.0), isnan(_1169)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1169, float2(0.0), isnan(_1169)), int2(1, 0)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _1188 = float2(_63, _65);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1188, float2(0.0), isnan(_1188)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1188, float2(0.0), isnan(_1188)), int2(0, 1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _1203 = float2(_63, _65);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1203, float2(0.0), isnan(_1203)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1203, float2(0.0), isnan(_1203)), int2(0, -1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _1219 = float2(_63, _65);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1219, float2(0.0), isnan(_1219)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1219, float2(0.0), isnan(_1219)), int2(-1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _1234 = float2(_63, _65);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1234, float2(0.0), isnan(_1234))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1234, float2(0.0), isnan(_1234))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _1248 = float2(_63, _65);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1248, float2(0.0), isnan(_1248))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1248, float2(0.0), isnan(_1248))).x;
    float _111 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _113 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _115 = _73 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _117 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _119 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _111);
    float _121 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _113);
    float _123 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].x, _115);
    float _125 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _119);
    float _129 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _121);
    float _131 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].z, _123);
    float _133 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _135 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _125);
    float _137 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _133);
    float _139 = precise::max(_131, _127);
    float _141 = precise::max(_129, _135);
    float _143 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _137);
    float _145 = precise::min(_131, _127);
    float _147 = precise::min(_129, _135);
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
        float2 _1386 = float2(_63, _65);
        float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1386, float2(0.0), isnan(_1386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1386, float2(0.0), isnan(_1386))).xyzw;
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
    float _204 = in.m_35.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_37.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_37.w;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_37.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_35.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_35.w;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = -_109;
    float _242 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _244 = _240 + _242;
    float _246 = _61 * _208;
    float _248 = _61 * _214;
    float _250 = _61 * _220;
    float _252 = _61 * _226;
    float _254 = _61 * _232;
    float _256 = _61 * _238;
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _260 = _256 * _258;
    float _262 = _254 * _258;
    float _264 = _246 * _258;
    float _266 = fma(_250, _244, _260);
    float _268 = fma(_248, _244, _262);
    float _270 = fma(_252, _244, _264);
    float _272 = 1.0 / _266;
    float _274 = _268 * _272;
    float _276 = _270 * _272;
    float _278 = -_65;
    float _280 = _278 + _274;
    float _282 = -_63;
    float _284 = _282 + _276;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _288 = _284 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _290 = _286 * _286;
    float _292 = fma(_288, _288, _290);
    bool _294 = !_175;
    float _296 = _200;
    float _298 = _196;
    float _300 = _198;
    float _302 = _202;
    if (!_294)
    {
        float2 _1550 = float2(_63, _65);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1550, float2(0.0), isnan(_1550)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1550, float2(0.0), isnan(_1550)), int2(1, -1)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _1565 = float2(_63, _65);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1565, float2(0.0), isnan(_1565)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1565, float2(0.0), isnan(_1565)), int2(-1, 1)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float _320 = _131 + _135;
        float _322 = _308 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _324 = _316 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _326 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[2].x, _322);
        float _328 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[2].x, _324);
        float _330 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[2].z, _326);
        float _332 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[2].z, _328);
        float _334 = _127 + _129;
        float _336 = fma(_143, -2.0, _320);
        float _338 = _135 + _330;
        float _340 = _135 + _332;
        float _342 = fma(_143, -2.0, _334);
        float _344 = _131 + _330;
        float _346 = fma(_129, -2.0, _338);
        float _348 = fma(_135, -2.0, _340);
        float _350 = _131 + _332;
        float _352 = fma(_131, -2.0, _344);
        float _354 = abs(_336);
        float _356 = abs(_346);
        float _358 = fma(_354, 2.0, _356);
        float _360 = abs(_342);
        float _362 = abs(_348);
        float _364 = fma(_360, 2.0, _362);
        float _366 = fma(_127, -2.0, _350);
        float _368 = abs(_352);
        float _370 = _368 + _364;
        float _372 = abs(_366);
        float _374 = _372 + _358;
        bool _376 = _370 >= _374;
        float _378 = float(_376);
        bool _380 = _370 < _374;
        bool _382 = isnan(_370);
        bool _384 = _380 || _382;
        bool _386 = isnan(_374);
        bool _388 = _384 || _386;
        float _390 = float(_388);
        float _392 = _129 * _378;
        float _394 = _127 * _378;
        float _396 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _398 = fma(_135, _390, _392);
        float _400 = fma(_131, _390, _394);
        float _402 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[0].x, _396);
        float _404 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _406 = -_143;
        float _408 = _406 + _398;
        float _410 = -_143;
        float _412 = _410 + _400;
        float _414 = _390 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _416 = abs(_408);
        float _418 = abs(_412);
        bool _420 = _416 >= _418;
        float _422 = -_402;
        float _424 = _420 ? _422 : _402;
        float _426 = _424 * 0.5;
        float _428 = fma(_390, _426, _63);
        float _430 = fma(_378, _426, _65);
        float _432 = -_404;
        float _434 = _432 + _428;
        float _436 = -_414;
        float _438 = _436 + _430;
        float _440 = _404 + _428;
        float _442 = _414 + _430;
        float2 _1771 = float2(_434, _438);
        float3 _444 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1771, float2(0.0), isnan(_1771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1771, float2(0.0), isnan(_1771))).xyz;
        float _446 = _444.x;
        float _448 = _444.y;
        float _450 = _444.z;
        float2 _1785 = float2(_440, _442);
        float3 _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1785, float2(0.0), isnan(_1785))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1785, float2(0.0), isnan(_1785))).xyz;
        float _454 = _452.x;
        float _456 = _452.y;
        float _458 = _452.z;
        float _460 = 1.0 / _161;
        float _462 = _334 + _320;
        float _464 = _344 + _340;
        float _466 = _420 ? _398 : _400;
        float _468 = abs(_408);
        float _470 = abs(_412);
        float _472 = _420 ? _468 : _470;
        float _474 = fma(_462, 2.0, _464);
        float _476 = fma(_474, -0.083333335816860198974609375, _143);
        float _478 = abs(_476);
        float _480 = _478 * _460;
        float _482 = precise::clamp(_480, 0.0, 1.0);
        float _484 = fma(_482, 6.0, -15.0);
        float _486 = _482 * _482;
        float _488 = fma(_482, _484, 10.0);
        float _490 = _488 * _486;
        float _492 = _482 * _490;
        float _494 = _448 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _496 = _456 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _498 = fma(_446, (*spvDescriptorSet0.fp_c3)._m0[2].x, _494);
        float _500 = _143 + _466;
        float _502 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[2].x, _496);
        float _504 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[2].z, _498);
        float _506 = _500 * 0.5;
        float _508 = fma(_458, (*spvDescriptorSet0.fp_c3)._m0[2].z, _502);
        float _510 = _472 * 0.25;
        float _512 = -_506;
        float _514 = _512 + _504;
        float _516 = -_506;
        float _518 = _516 + _508;
        float _520 = abs(_514);
        bool _522 = _520 >= _510;
        float _524 = abs(_518);
        bool _526 = _524 >= _510;
        bool _528 = false;
        float _530 = _454;
        float _532 = _514;
        float _534 = _434;
        float _536 = _438;
        float _538 = _508;
        bool _540 = _522;
        float _542 = _486;
        float _544 = _442;
        float _546 = _518;
        bool _548 = _526;
        float _550 = _440;
        float _552 = _510;
        if (_522)
        {
            _528 = true;
        }
        bool _554 = _528;
        bool _556 = _554;
        if (!_522)
        {
            float _558 = -_404;
            float _560 = _558 + _434;
            float _562 = -_414;
            float _564 = _562 + _438;
            float2 _1938 = float2(_560, _564);
            float3 _566 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1938, float2(0.0), isnan(_1938))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1938, float2(0.0), isnan(_1938))).xyz;
            float _568 = _566.x;
            float _570 = _566.y;
            float _572 = _566.z;
            float _574 = _570 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _576 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[2].x, _574);
            float _578 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[2].z, _576);
            float _580 = -_506;
            float _582 = _580 + _578;
            float _584 = abs(_582);
            bool _586 = _584 >= _510;
            _530 = _576;
            _556 = _586;
            _532 = _582;
            _534 = _560;
            _536 = _564;
            _538 = _578;
        }
        float _588 = _530;
        bool _590 = _556;
        float _592 = _532;
        float _594 = _534;
        float _596 = _536;
        float _598 = _538;
        float _600 = _598;
        float _602 = _588;
        float _604 = _596;
        bool _606 = _590;
        if (_526)
        {
            _540 = true;
        }
        bool _608 = _540;
        bool _610 = _608;
        if (_526)
        {
            _600 = _440;
        }
        float _612 = _600;
        float _614 = _612;
        if (_526)
        {
            _542 = _442;
        }
        float _616 = _542;
        float _618 = _616;
        if (!_526)
        {
            float _620 = _404 + _440;
            float _622 = _414 + _442;
            float2 _2019 = float2(_620, _622);
            float3 _624 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2019, float2(0.0), isnan(_2019))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2019, float2(0.0), isnan(_2019))).xyz;
            float _626 = _624.x;
            float _628 = _624.y;
            float _630 = _624.z;
            float _632 = _628 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _634 = fma(_626, (*spvDescriptorSet0.fp_c3)._m0[2].x, _632);
            float _636 = fma(_630, (*spvDescriptorSet0.fp_c3)._m0[2].z, _634);
            float _638 = -_506;
            float _640 = _638 + _636;
            float _642 = abs(_640);
            bool _644 = _642 >= _510;
            _602 = _626;
            _544 = _630;
            _610 = _644;
            _614 = _620;
            _618 = _622;
            _546 = _640;
        }
        float _646 = _602;
        float _648 = _544;
        bool _650 = _610;
        float _652 = _614;
        float _654 = _618;
        float _656 = _546;
        float _658 = _648;
        float _660 = _646;
        float _662 = _652;
        float _664 = _654;
        float _666 = _656;
        bool _668 = _650;
        if (_590)
        {
            _658 = _592;
        }
        float _670 = _658;
        float _672 = _670;
        if (_590)
        {
            _548 = true;
        }
        bool _674 = _548;
        bool _676 = _674;
        if (_590)
        {
            _550 = _594;
        }
        float _678 = _550;
        float _680 = _678;
        if (!_590)
        {
            float _682 = fma(_404, -1.5, _594);
            float _684 = fma(_414, -1.5, _596);
            float2 _2103 = float2(_682, _684);
            float3 _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2103, float2(0.0), isnan(_2103))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2103, float2(0.0), isnan(_2103))).xyz;
            float _688 = _686.x;
            float _690 = _686.y;
            float _692 = _686.z;
            float _694 = _690 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _696 = fma(_688, (*spvDescriptorSet0.fp_c3)._m0[2].x, _694);
            float _698 = fma(_692, (*spvDescriptorSet0.fp_c3)._m0[2].z, _696);
            float _700 = -_506;
            float _702 = _700 + _698;
            float _704 = abs(_702);
            bool _706 = _704 >= _510;
            _660 = _688;
            _676 = _706;
            _680 = _682;
            _604 = _684;
            _672 = _702;
        }
        float _708 = _660;
        bool _710 = _676;
        float _712 = _680;
        float _714 = _604;
        float _716 = _672;
        float _718 = _708;
        float _720 = _716;
        float _722 = _714;
        float _724 = _712;
        bool _726 = _710;
        if (_650)
        {
            _606 = true;
        }
        bool _728 = _606;
        bool _730 = _728;
        if (!_650)
        {
            float _732 = fma(_404, 1.5, _652);
            float _734 = fma(_414, 1.5, _654);
            float2 _2172 = float2(_732, _734);
            float3 _736 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2172, float2(0.0), isnan(_2172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2172, float2(0.0), isnan(_2172))).xyz;
            float _738 = _736.x;
            float _740 = _736.y;
            float _742 = _736.z;
            float _744 = _740 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _746 = fma(_738, (*spvDescriptorSet0.fp_c3)._m0[2].x, _744);
            float _748 = fma(_742, (*spvDescriptorSet0.fp_c3)._m0[2].z, _746);
            float _750 = -_506;
            float _752 = _750 + _748;
            float _754 = abs(_752);
            bool _756 = _754 >= _510;
            _718 = _738;
            _730 = _756;
            _662 = _732;
            _664 = _734;
            _666 = _752;
        }
        float _758 = _718;
        bool _760 = _730;
        float _762 = _662;
        float _764 = _664;
        float _766 = _666;
        float _768 = _758;
        float _770 = _766;
        float _772 = _762;
        float _774 = _764;
        int _777 = _760 ? (-1) : 0;
        if (_710)
        {
            _668 = true;
        }
        bool _779 = _668;
        bool _781 = _779;
        if (!_710)
        {
            float _783 = fma(_404, -3.0, _712);
            float _785 = fma(_414, -3.0, _714);
            float2 _2242 = float2(_783, _785);
            float3 _787 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2242, float2(0.0), isnan(_2242))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2242, float2(0.0), isnan(_2242))).xyz;
            float _789 = _787.x;
            float _791 = _787.y;
            float _793 = _787.z;
            float _795 = _791 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _797 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[2].x, _795);
            float _799 = fma(_793, (*spvDescriptorSet0.fp_c3)._m0[2].z, _797);
            float _801 = -_506;
            float _803 = _801 + _799;
            float _805 = abs(_803);
            bool _807 = _805 >= _510;
            _768 = _789;
            _781 = _807;
            _720 = _803;
            _722 = _785;
            _724 = _783;
        }
        float _809 = _768;
        bool _811 = _781;
        float _813 = _720;
        float _815 = _722;
        float _817 = _724;
        float _819 = _809;
        float _821 = _813;
        float _823 = _817;
        int _825 = _811 ? (-1) : 0;
        if (_760)
        {
            _726 = true;
        }
        bool _827 = _726;
        bool _829 = _827;
        if (!_760)
        {
            float _831 = fma(_404, 3.0, _762);
            float _833 = fma(_414, 3.0, _764);
            float2 _2311 = float2(_831, _833);
            float3 _835 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2311, float2(0.0), isnan(_2311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2311, float2(0.0), isnan(_2311))).xyz;
            float _837 = _835.x;
            float _839 = _835.y;
            float _841 = _835.z;
            float _843 = _839 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _845 = fma(_837, (*spvDescriptorSet0.fp_c3)._m0[2].x, _843);
            float _847 = fma(_841, (*spvDescriptorSet0.fp_c3)._m0[2].z, _845);
            float _849 = -_506;
            float _851 = _849 + _847;
            float _853 = abs(_851);
            bool _855 = _853 >= _510;
            _819 = _837;
            _829 = _855;
            _770 = _851;
            _772 = _831;
            _774 = _833;
        }
        float _857 = _819;
        bool _859 = _829;
        float _861 = _770;
        float _863 = _772;
        float _865 = _774;
        float _867 = _857;
        if (_811)
        {
            bool _869 = _813 >= 0.0;
            bool _871 = isnan(_813);
            bool _873 = _869 || _871;
            bool _875 = isnan(0.0);
            bool _877 = _873 || _875;
            _777 = _877 ? (-1) : 0;
        }
        int _879 = _777;
        int _881 = _879;
        if (_811)
        {
            _821 = _815;
        }
        float _883 = _821;
        float _885 = _883;
        if (!_811)
        {
            float _887 = fma(_404, -12.0, _817);
            float _889 = fma(_414, -12.0, _815);
            float2 _2395 = float2(_887, _889);
            float3 _891 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2395, float2(0.0), isnan(_2395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2395, float2(0.0), isnan(_2395))).xyz;
            float _893 = _891.x;
            float _895 = _891.y;
            float _897 = _891.z;
            float _899 = _895 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _901 = fma(_893, (*spvDescriptorSet0.fp_c3)._m0[2].x, _899);
            float _903 = fma(_897, (*spvDescriptorSet0.fp_c3)._m0[2].z, _901);
            float _905 = -_506;
            float _907 = _905 + _903;
            bool _909 = _907 >= 0.0;
            bool _911 = isnan(_907);
            bool _913 = _909 || _911;
            bool _915 = isnan(0.0);
            bool _917 = _913 || _915;
            _885 = _889;
            _867 = _901;
            _552 = _907;
            _823 = _887;
            _881 = _917 ? (-1) : 0;
        }
        float _919 = _885;
        float _921 = _867;
        float _923 = _552;
        float _925 = _823;
        int _927 = _881;
        float _929 = _923;
        float _931 = _921;
        if (_859)
        {
            bool _933 = _861 >= 0.0;
            bool _935 = isnan(_861);
            bool _937 = _933 || _935;
            bool _939 = isnan(0.0);
            bool _941 = _937 || _939;
            _825 = _941 ? (-1) : 0;
        }
        int _943 = _825;
        int _945 = _943;
        if (_859)
        {
            _929 = _863;
        }
        float _947 = _929;
        float _949 = _947;
        if (_859)
        {
            _931 = _865;
        }
        float _951 = _931;
        float _953 = _951;
        if (!_859)
        {
            float _955 = fma(_404, 12.0, _863);
            float _957 = fma(_414, 12.0, _865);
            float2 _2493 = float2(_955, _957);
            float3 _959 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2493, float2(0.0), isnan(_2493))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2493, float2(0.0), isnan(_2493))).xyz;
            float _961 = _959.x;
            float _963 = _959.y;
            float _965 = _959.z;
            float _967 = _963 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _969 = fma(_961, (*spvDescriptorSet0.fp_c3)._m0[2].x, _967);
            float _971 = fma(_965, (*spvDescriptorSet0.fp_c3)._m0[2].z, _969);
            float _973 = -_506;
            float _975 = _973 + _971;
            bool _977 = _975 >= 0.0;
            bool _979 = isnan(_975);
            bool _981 = _977 || _979;
            bool _983 = isnan(0.0);
            bool _985 = _981 || _983;
            _953 = _957;
            _949 = _955;
            _945 = _985 ? (-1) : 0;
        }
        float _987 = _953;
        float _989 = _949;
        int _991 = _945;
        float _993 = -_919;
        float _995 = _65 + _993;
        float _997 = -_65;
        float _999 = _997 + _987;
        float _1001 = -_63;
        float _1003 = _1001 + _989;
        float _1005 = -_925;
        float _1007 = _63 + _1005;
        float _1009 = _390 * _995;
        float _1011 = _390 * _999;
        float _1013 = _492 * 0.75;
        float _1015 = fma(_378, _1007, _1009);
        float _1017 = fma(_378, _1003, _1011);
        float _1019 = _1015 + _1017;
        bool _1021 = _1015 < _1017;
        int _1023 = ~_927;
        int _1025 = (_1021 ? (-1) : 0) & _1023;
        bool _1027 = _1015 >= _1017;
        bool _1029 = isnan(_1015);
        bool _1031 = _1027 || _1029;
        bool _1033 = isnan(_1017);
        bool _1035 = _1031 || _1033;
        int _1037 = ~_991;
        int _1039 = (_1035 ? (-1) : 0) & _1037;
        float _1041 = 1.0 / _1019;
        float _1043 = precise::min(_1015, _1017);
        int _1045 = ~_1025;
        int _1047 = _1045 & _1039;
        int _1049 = ~_1039;
        int _1051 = _1025 & _1049;
        int _1053 = _1047 | _1051;
        int _1055 = _1025 & _1039;
        int _1057 = _1053 | _1055;
        bool _1059 = _143 < _506;
        int _1061 = (_1059 ? (-1) : 0) ^ _1057;
        float _1063 = -_1043;
        float _1065 = fma(_1063, _1041, 0.5);
        float _1067 = (_1061 != 0) ? _1065 : 0.0;
        float _1069 = precise::max(_1067, _1013);
        float _1071 = _424 * _1069;
        float _1073 = fma(_390, _1071, _63);
        float _1075 = fma(_378, _1071, _65);
        float2 _2667 = float2(_1073, _1075);
        float4 _1077 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2667, float2(0.0), isnan(_2667))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2667, float2(0.0), isnan(_2667))).xyzw;
        float _1079 = _1077.x;
        float _1081 = _1077.y;
        float _1083 = _1077.z;
        float _1085 = _1077.w;
        _296 = _1083;
        _298 = _1079;
        _300 = _1081;
        _302 = _1085;
    }
    float _1087 = _296;
    float _1089 = _298;
    float _1091 = _300;
    float _1093 = _302;
    float2 _2692 = float2(_276, _274);
    float4 _1095 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2692, float2(0.0), isnan(_2692))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2692, float2(0.0), isnan(_2692))).xyzw;
    float _1097 = _1095.x;
    float _1099 = _1095.y;
    float _1101 = _1095.z;
    float _1103 = _1095.w;
    float _1105 = sqrt(_292);
    float _1107 = 0.0 + _1105;
    float _1109 = precise::clamp(_1107, 0.0, 1.0);
    float _1111 = fma(_1109, -0.5, 0.5);
    float _1113 = -_1087;
    float _1115 = _1101 + _1113;
    float _1117 = -_1089;
    float _1119 = _1097 + _1117;
    float _1121 = -_1091;
    float _1123 = _1099 + _1121;
    float _1125 = -_1093;
    float _1127 = _1103 + _1125;
    float _1129 = fma(_1111, _1115, _1087);
    float _1131 = fma(_1111, _1119, _1089);
    float _1133 = fma(_1111, _1123, _1091);
    float _1135 = fma(_1111, _1127, _1093);
    out.m_40.x = _1131;
    out.m_40.y = _1133;
    out.m_40.z = _1129;
    out.m_40.w = _1135;
    return out;
}

