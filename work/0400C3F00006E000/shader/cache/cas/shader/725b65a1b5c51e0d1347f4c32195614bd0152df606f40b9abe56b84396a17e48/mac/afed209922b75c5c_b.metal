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
    float2 _1949 = float2(_77, _79);
    float2 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1949, float2(0.0), isnan(_1949)), int2(0), component::x).xz;
    float _89 = _87.x;
    float _91 = _87.y;
    float2 _1964 = float2(_81, _83);
    float3 _95 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1964, float2(0.0), isnan(_1964)), int2(0), component::x).xzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _1978 = float2(_81, _83);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1978, float2(0.0), isnan(_1978))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1978, float2(0.0), isnan(_1978))).x;
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
    float _143 = _117;
    float _145 = _111;
    float _147 = 0.0;
    if (!_139)
    {
        float2 _2044 = float2(_81, _83);
        float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2044, float2(0.0), isnan(_2044))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2044, float2(0.0), isnan(_2044))).xyzw;
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
    float _180 = in.m_37.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_37.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_39.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _75 * _172;
    float _206 = _75 * _178;
    float _208 = _75 * _184;
    float _210 = _75 * _190;
    float _212 = _75 * _196;
    float _214 = fma(_206, _103, _204);
    float _216 = _75 * _202;
    float _218 = fma(_212, _103, _208);
    float _220 = fma(_216, _103, _210);
    float _222 = 1.0 / _214;
    float _224 = _220 * _222;
    float _226 = _218 * _222;
    float _228 = -_83;
    float _230 = _228 + _224;
    float _232 = -_81;
    float _234 = _232 + _226;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _238 = _234 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _240 = _236 * _236;
    float _242 = fma(_238, _238, _240);
    bool _244 = !_139;
    float _246 = _160;
    float _248 = _162;
    float _250 = _164;
    float _252 = _166;
    if (!_244)
    {
        float2 _2184 = float2(_81, _83);
        float _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2184, float2(0.0), isnan(_2184)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2184, float2(0.0), isnan(_2184)), int2(1, -1)).x;
        float2 _2195 = float2(_81, _83);
        float _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2195, float2(0.0), isnan(_2195)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2195, float2(0.0), isnan(_2195)), int2(-1, 1)).x;
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
        float2 _2367 = float2(_360, _364);
        float3 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2367, float2(0.0), isnan(_2367))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2367, float2(0.0), isnan(_2367))).xyz;
        float _372 = _370.x;
        float _374 = _370.y;
        float _376 = _370.z;
        float2 _2381 = float2(_366, _368);
        float3 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2381, float2(0.0), isnan(_2381))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2381, float2(0.0), isnan(_2381))).xyz;
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
        float _422 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[2].x, _420);
        float _424 = _101 + _392;
        float _426 = _382 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _428 = _398 * 0.25;
        float _430 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[2].z, _422);
        float _432 = _424 * 0.5;
        float _434 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[2].x, _426);
        float _436 = -_432;
        float _438 = _436 + _430;
        float _440 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[2].z, _434);
        float _442 = abs(_438);
        bool _444 = _442 >= _428;
        float _446 = -_432;
        float _448 = _446 + _440;
        float _450 = abs(_448);
        bool _452 = _450 >= _428;
        bool _454 = !_452;
        int _457 = _454 ? 0 : 1;
        int _459 = as_type<int>(_412);
        float _461 = _360;
        float _463 = _364;
        float _465 = _438;
        int _467 = _457;
        float _469 = _366;
        float _471 = _368;
        float _473 = _448;
        int _475 = as_type<int>(_440);
        int _477 = _452 ? (-1) : 0;
        float _479 = _428;
        if (_444)
        {
            bool _481 = !_444;
            int _483 = _481 ? 0 : 1;
            _459 = _483;
        }
        int _485 = _459;
        int _487 = _485;
        if (!_444)
        {
            float _489 = -_332;
            float _491 = _489 + _360;
            float _493 = -_324;
            float _495 = _493 + _364;
            float2 _2543 = float2(_491, _495);
            float3 _497 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2543, float2(0.0), isnan(_2543))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2543, float2(0.0), isnan(_2543))).xyz;
            float _499 = _497.x;
            float _501 = _497.y;
            float _503 = _497.z;
            float _505 = _501 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _507 = fma(_499, (*spvDescriptorSet0.fp_c3)._m0[2].x, _505);
            float _509 = fma(_503, (*spvDescriptorSet0.fp_c3)._m0[2].z, _507);
            float _511 = -_432;
            float _513 = _511 + _509;
            float _515 = abs(_513);
            bool _517 = _515 >= _428;
            bool _519 = !_517;
            int _521 = _519 ? 0 : 1;
            _487 = _521;
            _461 = _491;
            _463 = _495;
            _465 = _513;
        }
        int _523 = _487;
        float _525 = _461;
        float _527 = _463;
        float _529 = _465;
        int _531 = _523;
        float _533 = _525;
        float _535 = _527;
        float _537 = _529;
        if (!_452)
        {
            float _539 = _332 + _366;
            float _541 = _324 + _368;
            float2 _2607 = float2(_539, _541);
            float3 _543 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2607, float2(0.0), isnan(_2607))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2607, float2(0.0), isnan(_2607))).xyz;
            float _545 = _543.x;
            float _547 = _543.y;
            float _549 = _543.z;
            float _551 = _547 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _553 = fma(_545, (*spvDescriptorSet0.fp_c3)._m0[2].x, _551);
            float _555 = fma(_549, (*spvDescriptorSet0.fp_c3)._m0[2].z, _553);
            float _557 = -_432;
            float _559 = _557 + _555;
            float _561 = abs(_559);
            bool _563 = _561 >= _428;
            bool _565 = !_563;
            int _567 = _565 ? 0 : 1;
            _467 = _567;
            _469 = _539;
            _471 = _541;
            _473 = _559;
        }
        int _569 = _467;
        float _571 = _469;
        float _573 = _471;
        float _575 = _473;
        int _577 = _523 & 1;
        bool _579 = _577 != 0;
        float _581 = _571;
        float _583 = _573;
        float _585 = _575;
        if (!_579)
        {
            float _587 = -_332;
            float _589 = _587 + _525;
            float _591 = -_324;
            float _593 = _591 + _527;
            float2 _2678 = float2(_589, _593);
            float3 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2678, float2(0.0), isnan(_2678))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2678, float2(0.0), isnan(_2678))).xyz;
            float _597 = _595.x;
            float _599 = _595.y;
            float _601 = _595.z;
            float _603 = _599 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _605 = fma(_597, (*spvDescriptorSet0.fp_c3)._m0[2].x, _603);
            float _607 = fma(_601, (*spvDescriptorSet0.fp_c3)._m0[2].z, _605);
            float _609 = -_432;
            float _611 = _609 + _607;
            float _613 = abs(_611);
            bool _615 = _613 >= _428;
            bool _617 = !_615;
            int _619 = _617 ? 0 : 1;
            _531 = _619;
            _533 = _589;
            _535 = _593;
            _537 = _611;
        }
        int _621 = _531;
        float _623 = _533;
        float _625 = _535;
        float _627 = _537;
        int _629 = _569 & 1;
        bool _631 = _629 != 0;
        int _633 = _621;
        float _635 = _623;
        float _637 = _625;
        float _639 = _627;
        if (_631)
        {
            _475 = _569;
        }
        int _641 = _475;
        int _643 = _641;
        if (!_631)
        {
            float _645 = _332 + _571;
            float _647 = _324 + _573;
            float2 _2752 = float2(_645, _647);
            float3 _649 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2752, float2(0.0), isnan(_2752))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2752, float2(0.0), isnan(_2752))).xyz;
            float _651 = _649.x;
            float _653 = _649.y;
            float _655 = _649.z;
            float _657 = _653 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _659 = fma(_651, (*spvDescriptorSet0.fp_c3)._m0[2].x, _657);
            float _661 = fma(_655, (*spvDescriptorSet0.fp_c3)._m0[2].z, _659);
            float _663 = -_432;
            float _665 = _663 + _661;
            float _667 = abs(_665);
            bool _669 = _667 >= _428;
            bool _671 = !_669;
            int _673 = _671 ? 0 : 1;
            _643 = _673;
            _581 = _645;
            _583 = _647;
            _585 = _665;
        }
        int _675 = _643;
        float _677 = _581;
        float _679 = _583;
        float _681 = _585;
        int _683 = _621 & 1;
        bool _685 = _683 != 0;
        int _687 = _675;
        float _689 = _677;
        float _691 = _679;
        float _693 = _681;
        if (!_685)
        {
            float _695 = -_332;
            float _697 = _695 + _623;
            float _699 = -_324;
            float _701 = _699 + _625;
            float2 _2824 = float2(_697, _701);
            float3 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2824, float2(0.0), isnan(_2824))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2824, float2(0.0), isnan(_2824))).xyz;
            float _705 = _703.x;
            float _707 = _703.y;
            float _709 = _703.z;
            float _711 = _707 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _713 = fma(_705, (*spvDescriptorSet0.fp_c3)._m0[2].x, _711);
            float _715 = fma(_709, (*spvDescriptorSet0.fp_c3)._m0[2].z, _713);
            float _717 = -_432;
            float _719 = _717 + _715;
            float _721 = abs(_719);
            bool _723 = _721 >= _428;
            bool _725 = !_723;
            int _727 = _725 ? 0 : 1;
            _633 = _727;
            _635 = _697;
            _637 = _701;
            _639 = _719;
        }
        int _729 = _633;
        float _731 = _635;
        float _733 = _637;
        float _735 = _639;
        int _737 = _675 & 1;
        bool _739 = _737 != 0;
        int _741 = _729;
        float _743 = _731;
        float _745 = _733;
        float _747 = _735;
        if (!_739)
        {
            float _749 = _332 + _677;
            float _751 = _324 + _679;
            float2 _2892 = float2(_749, _751);
            float3 _753 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2892, float2(0.0), isnan(_2892))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2892, float2(0.0), isnan(_2892))).xyz;
            float _755 = _753.x;
            float _757 = _753.y;
            float _759 = _753.z;
            float _761 = _757 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _763 = fma(_755, (*spvDescriptorSet0.fp_c3)._m0[2].x, _761);
            float _765 = fma(_759, (*spvDescriptorSet0.fp_c3)._m0[2].z, _763);
            float _767 = -_432;
            float _769 = _767 + _765;
            float _771 = abs(_769);
            bool _773 = _771 >= _428;
            bool _775 = !_773;
            int _777 = _775 ? 0 : 1;
            _687 = _777;
            _689 = _749;
            _691 = _751;
            _693 = _769;
        }
        int _779 = _687;
        float _781 = _689;
        float _783 = _691;
        float _785 = _693;
        int _787 = _729 & 1;
        bool _789 = _787 != 0;
        int _791 = _779;
        float _793 = _781;
        float _795 = _783;
        float _797 = _785;
        if (!_789)
        {
            float _799 = -_332;
            float _801 = _799 + _731;
            float _803 = -_324;
            float _805 = _803 + _733;
            float2 _2964 = float2(_801, _805);
            float3 _807 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2964, float2(0.0), isnan(_2964))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2964, float2(0.0), isnan(_2964))).xyz;
            float _809 = _807.x;
            float _811 = _807.y;
            float _813 = _807.z;
            float _815 = _811 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _817 = fma(_809, (*spvDescriptorSet0.fp_c3)._m0[2].x, _815);
            float _819 = fma(_813, (*spvDescriptorSet0.fp_c3)._m0[2].z, _817);
            float _821 = -_432;
            float _823 = _821 + _819;
            float _825 = abs(_823);
            bool _827 = _825 >= _428;
            bool _829 = !_827;
            int _831 = _829 ? 0 : 1;
            _741 = _831;
            _743 = _801;
            _745 = _805;
            _747 = _823;
        }
        int _833 = _741;
        float _835 = _743;
        float _837 = _745;
        float _839 = _747;
        int _841 = _779 & 1;
        bool _843 = _841 != 0;
        int _845 = _833;
        float _847 = _835;
        float _849 = _837;
        float _851 = _839;
        if (!_843)
        {
            float _853 = _332 + _781;
            float _855 = _324 + _783;
            float2 _3032 = float2(_853, _855);
            float3 _857 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3032, float2(0.0), isnan(_3032))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3032, float2(0.0), isnan(_3032))).xyz;
            float _859 = _857.x;
            float _861 = _857.y;
            float _863 = _857.z;
            float _865 = _861 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _867 = fma(_859, (*spvDescriptorSet0.fp_c3)._m0[2].x, _865);
            float _869 = fma(_863, (*spvDescriptorSet0.fp_c3)._m0[2].z, _867);
            float _871 = -_432;
            float _873 = _871 + _869;
            float _875 = abs(_873);
            bool _877 = _875 >= _428;
            bool _879 = !_877;
            int _881 = _879 ? 0 : 1;
            _791 = _881;
            _793 = _853;
            _795 = _855;
            _797 = _873;
        }
        int _883 = _791;
        float _885 = _793;
        float _887 = _795;
        float _889 = _797;
        int _891 = _833 & 1;
        bool _893 = _891 != 0;
        int _895 = _883;
        float _897 = _885;
        float _899 = _887;
        float _901 = _889;
        if (!_893)
        {
            float _903 = -_332;
            float _905 = _903 + _835;
            float _907 = -_324;
            float _909 = _907 + _837;
            float2 _3104 = float2(_905, _909);
            float3 _911 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3104, float2(0.0), isnan(_3104))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3104, float2(0.0), isnan(_3104))).xyz;
            float _913 = _911.x;
            float _915 = _911.y;
            float _917 = _911.z;
            float _919 = _915 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _921 = fma(_913, (*spvDescriptorSet0.fp_c3)._m0[2].x, _919);
            float _923 = fma(_917, (*spvDescriptorSet0.fp_c3)._m0[2].z, _921);
            float _925 = -_432;
            float _927 = _925 + _923;
            float _929 = abs(_927);
            bool _931 = _929 >= _428;
            bool _933 = !_931;
            int _935 = _933 ? 0 : 1;
            _845 = _935;
            _847 = _905;
            _849 = _909;
            _851 = _927;
        }
        int _937 = _845;
        float _939 = _847;
        float _941 = _849;
        float _943 = _851;
        int _945 = _883 & 1;
        bool _947 = _945 != 0;
        int _949 = _937;
        float _951 = _939;
        float _953 = _941;
        float _955 = _943;
        if (!_947)
        {
            float _957 = _332 + _885;
            float _959 = _324 + _887;
            float2 _3172 = float2(_957, _959);
            float3 _961 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3172, float2(0.0), isnan(_3172))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3172, float2(0.0), isnan(_3172))).xyz;
            float _963 = _961.x;
            float _965 = _961.y;
            float _967 = _961.z;
            float _969 = _965 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _971 = fma(_963, (*spvDescriptorSet0.fp_c3)._m0[2].x, _969);
            float _973 = fma(_967, (*spvDescriptorSet0.fp_c3)._m0[2].z, _971);
            float _975 = -_432;
            float _977 = _975 + _973;
            float _979 = abs(_977);
            bool _981 = _979 >= _428;
            bool _983 = !_981;
            int _985 = _983 ? 0 : 1;
            _895 = _985;
            _897 = _957;
            _899 = _959;
            _901 = _977;
        }
        int _987 = _895;
        float _989 = _897;
        float _991 = _899;
        float _993 = _901;
        int _995 = _937 & 1;
        bool _997 = _995 != 0;
        int _999 = _987;
        float _1001 = _989;
        float _1003 = _991;
        float _1005 = _993;
        if (!_997)
        {
            float _1007 = fma(_332, -1.5, _939);
            float _1009 = fma(_324, -1.5, _941);
            float2 _3241 = float2(_1007, _1009);
            float3 _1011 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3241, float2(0.0), isnan(_3241))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3241, float2(0.0), isnan(_3241))).xyz;
            float _1013 = _1011.x;
            float _1015 = _1011.y;
            float _1017 = _1011.z;
            float _1019 = _1015 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1021 = fma(_1013, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1019);
            float _1023 = fma(_1017, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1021);
            float _1025 = -_432;
            float _1027 = _1025 + _1023;
            float _1029 = abs(_1027);
            bool _1031 = _1029 >= _428;
            bool _1033 = !_1031;
            int _1035 = _1033 ? 0 : 1;
            _949 = _1035;
            _951 = _1007;
            _953 = _1009;
            _955 = _1027;
        }
        int _1037 = _949;
        float _1039 = _951;
        float _1041 = _953;
        float _1043 = _955;
        int _1045 = _987 & 1;
        bool _1047 = _1045 != 0;
        int _1049 = _1037;
        float _1051 = _1039;
        float _1053 = _1041;
        float _1055 = _1043;
        if (!_1047)
        {
            float _1057 = fma(_332, 1.5, _989);
            float _1059 = fma(_324, 1.5, _991);
            float2 _3310 = float2(_1057, _1059);
            float3 _1061 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3310, float2(0.0), isnan(_3310))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3310, float2(0.0), isnan(_3310))).xyz;
            float _1063 = _1061.x;
            float _1065 = _1061.y;
            float _1067 = _1061.z;
            float _1069 = _1065 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1071 = fma(_1063, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1069);
            float _1073 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1071);
            float _1075 = -_432;
            float _1077 = _1075 + _1073;
            float _1079 = abs(_1077);
            bool _1081 = _1079 >= _428;
            bool _1083 = !_1081;
            int _1085 = _1083 ? 0 : 1;
            _999 = _1085;
            _1001 = _1057;
            _1003 = _1059;
            _1005 = _1077;
        }
        int _1087 = _999;
        float _1089 = _1001;
        float _1091 = _1003;
        float _1093 = _1005;
        int _1095 = _1037 & 1;
        bool _1097 = _1095 != 0;
        int _1099 = _1087;
        float _1101 = _1089;
        float _1103 = _1091;
        float _1105 = _1093;
        if (!_1097)
        {
            float _1107 = fma(_332, -2.0, _1039);
            float _1109 = fma(_324, -2.0, _1041);
            float2 _3378 = float2(_1107, _1109);
            float3 _1111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3378, float2(0.0), isnan(_3378))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3378, float2(0.0), isnan(_3378))).xyz;
            float _1113 = _1111.x;
            float _1115 = _1111.y;
            float _1117 = _1111.z;
            float _1119 = _1115 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1121 = fma(_1113, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1119);
            float _1123 = fma(_1117, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1121);
            float _1125 = -_432;
            float _1127 = _1125 + _1123;
            float _1129 = abs(_1127);
            bool _1131 = _1129 >= _428;
            bool _1133 = !_1131;
            int _1135 = _1133 ? 0 : 1;
            _1049 = _1135;
            _1051 = _1107;
            _1053 = _1109;
            _1055 = _1127;
        }
        int _1137 = _1049;
        float _1139 = _1051;
        float _1141 = _1053;
        float _1143 = _1055;
        int _1145 = _1087 & 1;
        bool _1147 = _1145 != 0;
        int _1149 = _1137;
        float _1151 = _1139;
        float _1153 = _1141;
        float _1155 = _1143;
        if (!_1147)
        {
            float _1157 = fma(_332, 2.0, _1089);
            float _1159 = fma(_324, 2.0, _1091);
            float2 _3446 = float2(_1157, _1159);
            float3 _1161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3446, float2(0.0), isnan(_3446))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3446, float2(0.0), isnan(_3446))).xyz;
            float _1163 = _1161.x;
            float _1165 = _1161.y;
            float _1167 = _1161.z;
            float _1169 = _1165 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1171 = fma(_1163, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1169);
            float _1173 = fma(_1167, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1171);
            float _1175 = -_432;
            float _1177 = _1175 + _1173;
            float _1179 = abs(_1177);
            bool _1181 = _1179 >= _428;
            bool _1183 = !_1181;
            int _1185 = _1183 ? 0 : 1;
            _1099 = _1185;
            _1101 = _1157;
            _1103 = _1159;
            _1105 = _1177;
        }
        int _1187 = _1099;
        float _1189 = _1101;
        float _1191 = _1103;
        float _1193 = _1105;
        int _1195 = _1137 & 1;
        bool _1197 = _1195 != 0;
        int _1199 = _1187;
        float _1201 = _1189;
        float _1203 = _1191;
        float _1205 = _1193;
        if (!_1197)
        {
            float _1207 = fma(_332, -2.0, _1139);
            float _1209 = fma(_324, -2.0, _1141);
            float2 _3514 = float2(_1207, _1209);
            float3 _1211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3514, float2(0.0), isnan(_3514))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3514, float2(0.0), isnan(_3514))).xyz;
            float _1213 = _1211.x;
            float _1215 = _1211.y;
            float _1217 = _1211.z;
            float _1219 = _1215 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1221 = fma(_1213, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1219);
            float _1223 = fma(_1217, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1221);
            float _1225 = -_432;
            float _1227 = _1225 + _1223;
            float _1229 = abs(_1227);
            bool _1231 = _1229 >= _428;
            bool _1233 = !_1231;
            int _1235 = _1233 ? 0 : 1;
            _1149 = _1235;
            _1151 = _1207;
            _1153 = _1209;
            _1155 = _1227;
        }
        int _1237 = _1149;
        float _1239 = _1151;
        float _1241 = _1153;
        float _1243 = _1155;
        int _1245 = _1187 & 1;
        bool _1247 = _1245 != 0;
        int _1249 = _1237;
        float _1251 = _1239;
        float _1253 = _1241;
        float _1255 = _1243;
        if (!_1247)
        {
            float _1257 = fma(_332, 2.0, _1189);
            float _1259 = fma(_324, 2.0, _1191);
            float2 _3582 = float2(_1257, _1259);
            float3 _1261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3582, float2(0.0), isnan(_3582))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3582, float2(0.0), isnan(_3582))).xyz;
            float _1263 = _1261.x;
            float _1265 = _1261.y;
            float _1267 = _1261.z;
            float _1269 = _1265 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1271 = fma(_1263, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1269);
            float _1273 = fma(_1267, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1271);
            float _1275 = -_432;
            float _1277 = _1275 + _1273;
            float _1279 = abs(_1277);
            bool _1281 = _1279 >= _428;
            bool _1283 = !_1281;
            int _1285 = _1283 ? 0 : 1;
            _1199 = _1285;
            _1201 = _1257;
            _1203 = _1259;
            _1205 = _1277;
        }
        int _1287 = _1199;
        float _1289 = _1201;
        float _1291 = _1203;
        float _1293 = _1205;
        int _1295 = _1237 & 1;
        bool _1297 = _1295 != 0;
        int _1299 = _1287;
        float _1301 = _1289;
        float _1303 = _1291;
        float _1305 = _1293;
        if (!_1297)
        {
            float _1307 = fma(_332, -2.0, _1239);
            float _1309 = fma(_324, -2.0, _1241);
            float2 _3650 = float2(_1307, _1309);
            float3 _1311 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3650, float2(0.0), isnan(_3650))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3650, float2(0.0), isnan(_3650))).xyz;
            float _1313 = _1311.x;
            float _1315 = _1311.y;
            float _1317 = _1311.z;
            float _1319 = _1315 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1321 = fma(_1313, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1319);
            float _1323 = fma(_1317, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1321);
            float _1325 = -_432;
            float _1327 = _1325 + _1323;
            float _1329 = abs(_1327);
            bool _1331 = _1329 >= _428;
            bool _1333 = !_1331;
            int _1335 = _1333 ? 0 : 1;
            _1249 = _1335;
            _1251 = _1307;
            _1253 = _1309;
            _1255 = _1327;
        }
        int _1337 = _1249;
        float _1339 = _1251;
        float _1341 = _1253;
        float _1343 = _1255;
        int _1345 = _1287 & 1;
        bool _1347 = _1345 != 0;
        int _1349 = _1337;
        float _1351 = _1339;
        float _1353 = _1341;
        float _1355 = _1343;
        if (!_1347)
        {
            float _1357 = fma(_332, 2.0, _1289);
            float _1359 = fma(_324, 2.0, _1291);
            float2 _3718 = float2(_1357, _1359);
            float3 _1361 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3718, float2(0.0), isnan(_3718))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3718, float2(0.0), isnan(_3718))).xyz;
            float _1363 = _1361.x;
            float _1365 = _1361.y;
            float _1367 = _1361.z;
            float _1369 = _1365 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1371 = fma(_1363, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1369);
            float _1373 = fma(_1367, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1371);
            float _1375 = -_432;
            float _1377 = _1375 + _1373;
            float _1379 = abs(_1377);
            bool _1381 = _1379 >= _428;
            bool _1383 = !_1381;
            int _1385 = _1383 ? 0 : 1;
            _1299 = _1385;
            _1301 = _1357;
            _1303 = _1359;
            _1305 = _1377;
        }
        int _1387 = _1299;
        float _1389 = _1301;
        float _1391 = _1303;
        float _1393 = _1305;
        int _1395 = _1337 & 1;
        bool _1397 = _1395 != 0;
        int _1399 = _1387;
        float _1401 = _1389;
        float _1403 = _1391;
        float _1405 = _1393;
        if (!_1397)
        {
            float _1407 = fma(_332, -2.0, _1339);
            float _1409 = fma(_324, -2.0, _1341);
            float2 _3786 = float2(_1407, _1409);
            float3 _1411 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3786, float2(0.0), isnan(_3786))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3786, float2(0.0), isnan(_3786))).xyz;
            float _1413 = _1411.x;
            float _1415 = _1411.y;
            float _1417 = _1411.z;
            float _1419 = _1415 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1421 = fma(_1413, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1419);
            float _1423 = fma(_1417, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1421);
            float _1425 = -_432;
            float _1427 = _1425 + _1423;
            float _1429 = abs(_1427);
            bool _1431 = _1429 >= _428;
            bool _1433 = !_1431;
            int _1435 = _1433 ? 0 : 1;
            _1349 = _1435;
            _1351 = _1407;
            _1353 = _1409;
            _1355 = _1427;
        }
        int _1437 = _1349;
        float _1439 = _1351;
        float _1441 = _1353;
        float _1443 = _1355;
        int _1445 = _1387 & 1;
        bool _1447 = _1445 != 0;
        int _1449 = _1437;
        float _1451 = _1443;
        float _1453 = _1439;
        float _1455 = _1441;
        if (!_1447)
        {
            float _1457 = fma(_332, 2.0, _1389);
            float _1459 = fma(_324, 2.0, _1391);
            float2 _3854 = float2(_1457, _1459);
            float3 _1461 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3854, float2(0.0), isnan(_3854))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3854, float2(0.0), isnan(_3854))).xyz;
            float _1463 = _1461.x;
            float _1465 = _1461.y;
            float _1467 = _1461.z;
            float _1469 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1471 = fma(_1463, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1469);
            float _1473 = fma(_1467, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1471);
            float _1475 = -_432;
            float _1477 = _1475 + _1473;
            float _1479 = abs(_1477);
            bool _1481 = _1479 >= _428;
            bool _1483 = !_1481;
            int _1485 = _1483 ? 0 : 1;
            _1399 = _1485;
            _1401 = _1457;
            _1403 = _1459;
            _1405 = _1477;
        }
        int _1487 = _1399;
        float _1489 = _1401;
        float _1491 = _1403;
        float _1493 = _1405;
        int _1495 = _1437 & 1;
        bool _1497 = _1495 != 0;
        int _1499 = _1487;
        float _1501 = _1493;
        float _1503 = _1489;
        float _1505 = _1491;
        if (!_1497)
        {
            float _1507 = fma(_332, -4.0, _1439);
            float _1509 = fma(_324, -4.0, _1441);
            float2 _3923 = float2(_1507, _1509);
            float3 _1511 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3923, float2(0.0), isnan(_3923))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3923, float2(0.0), isnan(_3923))).xyz;
            float _1513 = _1511.x;
            float _1515 = _1511.y;
            float _1517 = _1511.z;
            float _1519 = _1515 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1521 = fma(_1513, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1519);
            float _1523 = fma(_1517, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1521);
            float _1525 = -_432;
            float _1527 = _1525 + _1523;
            float _1529 = abs(_1527);
            bool _1531 = _1529 >= _428;
            bool _1533 = !_1531;
            int _1535 = _1533 ? 0 : 1;
            _1449 = _1535;
            _1451 = _1527;
            _1453 = _1507;
            _1455 = _1509;
        }
        int _1537 = _1449;
        float _1539 = _1451;
        float _1541 = _1453;
        float _1543 = _1455;
        int _1545 = _1487 & 1;
        bool _1547 = _1545 != 0;
        float _1549 = _1543;
        float _1551 = _1541;
        if (!_1547)
        {
            float _1553 = fma(_332, 4.0, _1489);
            float _1555 = fma(_324, 4.0, _1491);
            float2 _3990 = float2(_1553, _1555);
            float3 _1557 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3990, float2(0.0), isnan(_3990))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3990, float2(0.0), isnan(_3990))).xyz;
            float _1559 = _1557.x;
            float _1561 = _1557.y;
            float _1563 = _1557.z;
            float _1565 = _1561 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1567 = fma(_1559, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1565);
            float _1569 = fma(_1563, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1567);
            float _1571 = -_432;
            float _1573 = _1571 + _1569;
            float _1575 = abs(_1573);
            bool _1577 = _1575 >= _428;
            bool _1579 = !_1577;
            int _1581 = _1579 ? 0 : 1;
            _1499 = _1581;
            _1501 = _1573;
            _1503 = _1553;
            _1505 = _1555;
        }
        int _1583 = _1499;
        float _1585 = _1501;
        float _1587 = _1503;
        float _1589 = _1505;
        int _1591 = _1537 & 1;
        bool _1593 = _1591 != 0;
        int _1595 = _1593 ? (-1) : 0;
        float _1597 = _1585;
        if (_1593)
        {
            bool _1599 = _1539 >= 0.0;
            bool _1601 = isnan(_1539);
            bool _1603 = _1599 || _1601;
            bool _1605 = isnan(0.0);
            bool _1607 = _1603 || _1605;
            _477 = _1607 ? (-1) : 0;
        }
        int _1609 = _477;
        int _1611 = _1609;
        if (!_1593)
        {
            float _1613 = fma(_332, -8.0, _1541);
            float _1615 = fma(_324, -8.0, _1543);
            float2 _4076 = float2(_1613, _1615);
            float3 _1617 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4076, float2(0.0), isnan(_4076))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4076, float2(0.0), isnan(_4076))).xyz;
            float _1619 = _1617.x;
            float _1621 = _1617.y;
            float _1623 = _1617.z;
            float _1625 = _1621 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1627 = fma(_1619, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1625);
            float _1629 = fma(_1623, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1627);
            float _1631 = -_432;
            float _1633 = _1631 + _1629;
            bool _1635 = _1633 >= 0.0;
            bool _1637 = isnan(_1633);
            bool _1639 = _1635 || _1637;
            bool _1641 = isnan(0.0);
            bool _1643 = _1639 || _1641;
            _1549 = _1615;
            _479 = _1633;
            _1551 = _1613;
            _1611 = _1643 ? (-1) : 0;
        }
        float _1645 = _1549;
        float _1647 = _479;
        float _1649 = _1551;
        int _1651 = _1611;
        int _1653 = _1583 & 1;
        bool _1655 = _1653 != 0;
        float _1657 = _1647;
        if (_1655)
        {
            bool _1659 = _1585 >= 0.0;
            bool _1661 = isnan(_1585);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan(0.0);
            bool _1667 = _1663 || _1665;
            _1595 = _1667 ? (-1) : 0;
        }
        int _1669 = _1595;
        int _1671 = _1669;
        if (_1655)
        {
            _1597 = _1587;
        }
        float _1673 = _1597;
        float _1675 = _1673;
        if (_1655)
        {
            _1657 = _1589;
        }
        float _1677 = _1657;
        float _1679 = _1677;
        if (!_1655)
        {
            float _1681 = fma(_332, 8.0, _1587);
            float _1683 = fma(_324, 8.0, _1589);
            float2 _4175 = float2(_1681, _1683);
            float3 _1685 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4175, float2(0.0), isnan(_4175))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4175, float2(0.0), isnan(_4175))).xyz;
            float _1687 = _1685.x;
            float _1689 = _1685.y;
            float _1691 = _1685.z;
            float _1693 = _1689 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1695 = fma(_1687, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1693);
            float _1697 = fma(_1691, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1695);
            float _1699 = -_432;
            float _1701 = _1699 + _1697;
            bool _1703 = _1701 >= 0.0;
            bool _1705 = isnan(_1701);
            bool _1707 = _1703 || _1705;
            bool _1709 = isnan(0.0);
            bool _1711 = _1707 || _1709;
            _1679 = _1683;
            _1675 = _1681;
            _1671 = _1711 ? (-1) : 0;
        }
        float _1713 = _1679;
        float _1715 = _1675;
        int _1717 = _1671;
        float _1719 = -_1645;
        float _1721 = _83 + _1719;
        float _1723 = -_83;
        float _1725 = _1723 + _1713;
        float _1727 = -_1649;
        float _1729 = _81 + _1727;
        float _1731 = -_81;
        float _1733 = _1731 + _1715;
        float _1735 = _316 * _1721;
        float _1737 = _316 * _1725;
        float _1739 = _418 * 0.75;
        float _1741 = fma(_304, _1729, _1735);
        float _1743 = fma(_304, _1733, _1737);
        float _1745 = _1741 + _1743;
        bool _1747 = _1741 < _1743;
        int _1749 = ~_1651;
        int _1751 = (_1747 ? (-1) : 0) & _1749;
        bool _1753 = _1741 >= _1743;
        bool _1755 = isnan(_1741);
        bool _1757 = _1753 || _1755;
        bool _1759 = isnan(_1743);
        bool _1761 = _1757 || _1759;
        int _1763 = ~_1717;
        int _1765 = (_1761 ? (-1) : 0) & _1763;
        float _1767 = precise::min(_1741, _1743);
        float _1769 = 1.0 / _1745;
        int _1771 = ~_1751;
        int _1773 = _1771 & _1765;
        int _1775 = ~_1765;
        int _1777 = _1751 & _1775;
        int _1779 = _1773 | _1777;
        int _1781 = _1751 & _1765;
        int _1783 = _1779 | _1781;
        bool _1785 = _101 < _432;
        int _1787 = (_1785 ? (-1) : 0) ^ _1783;
        float _1789 = -_1767;
        float _1791 = fma(_1789, _1769, 0.5);
        float _1793 = (_1787 != 0) ? _1791 : 0.0;
        float _1795 = precise::max(_1739, _1793);
        float _1797 = _350 * _1795;
        float _1799 = fma(_316, _1797, _81);
        float _1801 = fma(_304, _1797, _83);
        float2 _4349 = float2(_81, _83);
        float4 _1803 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4349, float2(0.0), isnan(_4349))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4349, float2(0.0), isnan(_4349))).xyzw;
        float _1805 = _1803.x;
        float _1807 = _1803.y;
        float _1809 = _1803.z;
        float _1811 = _1803.w;
        float2 _4365 = float2(_1799, _1801);
        float4 _1813 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4365, float2(0.0), isnan(_4365))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4365, float2(0.0), isnan(_4365))).xyzw;
        float _1815 = _1813.x;
        float _1817 = _1813.y;
        float _1819 = _1813.z;
        float _1821 = _1813.w;
        float _1823 = -_1815;
        float _1825 = _1805 + _1823;
        float _1827 = -_1817;
        float _1829 = _1807 + _1827;
        float _1831 = -_1819;
        float _1833 = _1809 + _1831;
        float _1835 = -_1821;
        float _1837 = _1811 + _1835;
        float _1839 = fma(_1825, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1815);
        float _1841 = fma(_1829, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1817);
        float _1843 = fma(_1833, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1819);
        float _1845 = fma(_1837, (*spvDescriptorSet0.fp_c3)._m0[5].x, _1821);
        _246 = _1839;
        _248 = _1841;
        _250 = _1843;
        _252 = _1845;
    }
    float _1847 = _246;
    float _1849 = _248;
    float _1851 = _250;
    float _1853 = _252;
    float2 _4431 = float2(_226, _224);
    float4 _1855 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4431, float2(0.0), isnan(_4431))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4431, float2(0.0), isnan(_4431))).xyzw;
    float _1857 = _1855.x;
    float _1859 = _1855.y;
    float _1861 = _1855.z;
    float _1863 = _1855.w;
    float _1865 = sqrt(_242);
    float _1867 = 0.0 + _1865;
    float _1869 = precise::clamp(_1867, 0.0, 1.0);
    float _1871 = fma(_1869, -0.5, 0.5);
    float _1873 = -_1847;
    float _1875 = _1857 + _1873;
    float _1877 = -_1849;
    float _1879 = _1859 + _1877;
    float _1881 = -_1851;
    float _1883 = _1861 + _1881;
    float _1885 = -_1853;
    float _1887 = _1863 + _1885;
    float _1889 = fma(_1871, _1875, _1847);
    float _1891 = fma(_1871, _1879, _1849);
    float _1893 = fma(_1871, _1883, _1851);
    float _1895 = fma(_1871, _1887, _1853);
    out.m_42.x = _1889;
    out.m_42.y = _1891;
    out.m_42.z = _1893;
    out.m_42.w = _1895;
    return out;
}

