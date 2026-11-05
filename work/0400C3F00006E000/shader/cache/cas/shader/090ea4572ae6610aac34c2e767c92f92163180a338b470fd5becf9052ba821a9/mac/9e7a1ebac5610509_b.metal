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
    float2 _1929 = float2(_77, _79);
    float2 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1929, float2(0.0), isnan(_1929)), int2(0), component::x).xz;
    float _89 = _87.x;
    float _91 = _87.y;
    float2 _1944 = float2(_81, _83);
    float3 _95 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1944, float2(0.0), isnan(_1944)), int2(0), component::x).xzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _1958 = float2(_81, _83);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1958, float2(0.0), isnan(_1958))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1958, float2(0.0), isnan(_1958))).x;
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
        float2 _2024 = float2(_81, _83);
        float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2024, float2(0.0), isnan(_2024))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2024, float2(0.0), isnan(_2024))).xyzw;
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
    float _174 = in.m_39.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_37.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_37.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_39.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = -_103;
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _208 = _204 + _206;
    float _210 = _75 * _172;
    float _212 = _75 * _178;
    float _214 = _75 * _184;
    float _216 = _75 * _190;
    float _218 = _75 * _196;
    float _220 = _75 * _202;
    float _222 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _224 = _220 * _222;
    float _226 = _218 * _222;
    float _228 = _212 * _222;
    float _230 = fma(_210, _208, _224);
    float _232 = fma(_216, _208, _226);
    float _234 = fma(_214, _208, _228);
    float _236 = 1.0 / _230;
    float _238 = _232 * _236;
    float _240 = _234 * _236;
    float _242 = -_83;
    float _244 = _242 + _238;
    float _246 = -_81;
    float _248 = _246 + _240;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _252 = _248 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _254 = _250 * _250;
    float _256 = fma(_252, _252, _254);
    bool _258 = !_139;
    float _260 = _160;
    float _262 = _162;
    float _264 = _164;
    float _266 = _166;
    if (!_258)
    {
        float2 _2188 = float2(_81, _83);
        float _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2188, float2(0.0), isnan(_2188)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2188, float2(0.0), isnan(_2188)), int2(1, -1)).x;
        float2 _2199 = float2(_81, _83);
        float _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2199, float2(0.0), isnan(_2199)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2199, float2(0.0), isnan(_2199)), int2(-1, 1)).x;
        float _272 = _99 + _89;
        float _274 = _97 + _91;
        float _276 = fma(_101, -2.0, _272);
        float _278 = fma(_101, -2.0, _274);
        float _280 = _89 + _268;
        float _282 = _99 + _268;
        float _284 = _89 + _270;
        float _286 = _99 + _270;
        float _288 = fma(_91, -2.0, _280);
        float _290 = fma(_99, -2.0, _282);
        float _292 = fma(_89, -2.0, _284);
        float _294 = fma(_97, -2.0, _286);
        float _296 = abs(_276);
        float _298 = abs(_288);
        float _300 = fma(_296, 2.0, _298);
        float _302 = abs(_278);
        float _304 = abs(_292);
        float _306 = fma(_302, 2.0, _304);
        float _308 = abs(_294);
        float _310 = _308 + _300;
        float _312 = abs(_290);
        float _314 = _312 + _306;
        bool _316 = _314 >= _310;
        float _318 = float(_316);
        bool _320 = _314 < _310;
        bool _322 = isnan(_314);
        bool _324 = _320 || _322;
        bool _326 = isnan(_310);
        bool _328 = _324 || _326;
        float _330 = float(_328);
        float _332 = _91 * _318;
        float _334 = _97 * _318;
        float _336 = _318 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _338 = _330 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _340 = fma(_89, _330, _332);
        float _342 = fma(_99, _330, _334);
        float _344 = fma(_330, (*spvDescriptorSet0.fp_c3)._m0[0].x, _336);
        float _346 = _318 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _348 = -_101;
        float _350 = _348 + _340;
        float _352 = -_101;
        float _354 = _352 + _342;
        float _356 = abs(_350);
        float _358 = abs(_354);
        bool _360 = _356 >= _358;
        float _362 = -_344;
        float _364 = _360 ? _362 : _344;
        float _366 = _364 * 0.5;
        float _368 = fma(_330, _366, _81);
        float _370 = fma(_318, _366, _83);
        float _372 = -_346;
        float _374 = _372 + _368;
        float _376 = -_338;
        float _378 = _376 + _370;
        float _380 = _346 + _368;
        float _382 = _338 + _370;
        float2 _2371 = float2(_374, _378);
        float3 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2371, float2(0.0), isnan(_2371))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2371, float2(0.0), isnan(_2371))).xyz;
        float _386 = _384.x;
        float _388 = _384.y;
        float _390 = _384.z;
        float2 _2385 = float2(_380, _382);
        float3 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2385, float2(0.0), isnan(_2385))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2385, float2(0.0), isnan(_2385))).xyz;
        float _394 = _392.x;
        float _396 = _392.y;
        float _398 = _392.z;
        float _400 = 1.0 / _125;
        float _402 = _274 + _272;
        float _404 = _282 + _284;
        float _406 = _360 ? _340 : _342;
        float _408 = abs(_350);
        float _410 = abs(_354);
        float _412 = _360 ? _408 : _410;
        float _414 = fma(_402, 2.0, _404);
        float _416 = fma(_414, -0.083333335816860198974609375, _101);
        float _418 = abs(_416);
        float _420 = _418 * _400;
        float _422 = precise::clamp(_420, 0.0, 1.0);
        float _424 = fma(_422, 6.0, -15.0);
        float _426 = _422 * _422;
        float _428 = fma(_422, _424, 10.0);
        float _430 = _428 * _426;
        float _432 = _422 * _430;
        float _434 = _388 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _436 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[2].x, _434);
        float _438 = _101 + _406;
        float _440 = _396 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
        float _442 = _412 * 0.25;
        float _444 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[2].z, _436);
        float _446 = _438 * 0.5;
        float _448 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[2].x, _440);
        float _450 = -_446;
        float _452 = _450 + _444;
        float _454 = fma(_398, (*spvDescriptorSet0.fp_c3)._m0[2].z, _448);
        float _456 = abs(_452);
        bool _458 = _456 >= _442;
        float _460 = -_446;
        float _462 = _460 + _454;
        float _464 = abs(_462);
        bool _466 = _464 >= _442;
        bool _468 = !_466;
        int _471 = _468 ? 0 : 1;
        int _473 = as_type<int>(_426);
        float _475 = _374;
        float _477 = _378;
        float _479 = _452;
        int _481 = _471;
        float _483 = _380;
        float _485 = _382;
        float _487 = _462;
        int _489 = as_type<int>(_454);
        int _491 = _466 ? (-1) : 0;
        float _493 = _442;
        if (_458)
        {
            bool _495 = !_458;
            int _497 = _495 ? 0 : 1;
            _473 = _497;
        }
        int _499 = _473;
        int _501 = _499;
        if (!_458)
        {
            float _503 = -_346;
            float _505 = _503 + _374;
            float _507 = -_338;
            float _509 = _507 + _378;
            float2 _2547 = float2(_505, _509);
            float3 _511 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2547, float2(0.0), isnan(_2547))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2547, float2(0.0), isnan(_2547))).xyz;
            float _513 = _511.x;
            float _515 = _511.y;
            float _517 = _511.z;
            float _519 = _515 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _521 = fma(_513, (*spvDescriptorSet0.fp_c3)._m0[2].x, _519);
            float _523 = fma(_517, (*spvDescriptorSet0.fp_c3)._m0[2].z, _521);
            float _525 = -_446;
            float _527 = _525 + _523;
            float _529 = abs(_527);
            bool _531 = _529 >= _442;
            bool _533 = !_531;
            int _535 = _533 ? 0 : 1;
            _501 = _535;
            _475 = _505;
            _477 = _509;
            _479 = _527;
        }
        int _537 = _501;
        float _539 = _475;
        float _541 = _477;
        float _543 = _479;
        int _545 = _537;
        float _547 = _539;
        float _549 = _541;
        float _551 = _543;
        if (!_466)
        {
            float _553 = _346 + _380;
            float _555 = _338 + _382;
            float2 _2611 = float2(_553, _555);
            float3 _557 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2611, float2(0.0), isnan(_2611))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2611, float2(0.0), isnan(_2611))).xyz;
            float _559 = _557.x;
            float _561 = _557.y;
            float _563 = _557.z;
            float _565 = _561 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _567 = fma(_559, (*spvDescriptorSet0.fp_c3)._m0[2].x, _565);
            float _569 = fma(_563, (*spvDescriptorSet0.fp_c3)._m0[2].z, _567);
            float _571 = -_446;
            float _573 = _571 + _569;
            float _575 = abs(_573);
            bool _577 = _575 >= _442;
            bool _579 = !_577;
            int _581 = _579 ? 0 : 1;
            _481 = _581;
            _483 = _553;
            _485 = _555;
            _487 = _573;
        }
        int _583 = _481;
        float _585 = _483;
        float _587 = _485;
        float _589 = _487;
        int _591 = _537 & 1;
        bool _593 = _591 != 0;
        float _595 = _585;
        float _597 = _587;
        float _599 = _589;
        if (!_593)
        {
            float _601 = -_346;
            float _603 = _601 + _539;
            float _605 = -_338;
            float _607 = _605 + _541;
            float2 _2682 = float2(_603, _607);
            float3 _609 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2682, float2(0.0), isnan(_2682))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2682, float2(0.0), isnan(_2682))).xyz;
            float _611 = _609.x;
            float _613 = _609.y;
            float _615 = _609.z;
            float _617 = _613 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _619 = fma(_611, (*spvDescriptorSet0.fp_c3)._m0[2].x, _617);
            float _621 = fma(_615, (*spvDescriptorSet0.fp_c3)._m0[2].z, _619);
            float _623 = -_446;
            float _625 = _623 + _621;
            float _627 = abs(_625);
            bool _629 = _627 >= _442;
            bool _631 = !_629;
            int _633 = _631 ? 0 : 1;
            _545 = _633;
            _547 = _603;
            _549 = _607;
            _551 = _625;
        }
        int _635 = _545;
        float _637 = _547;
        float _639 = _549;
        float _641 = _551;
        int _643 = _583 & 1;
        bool _645 = _643 != 0;
        int _647 = _635;
        float _649 = _637;
        float _651 = _639;
        float _653 = _641;
        if (_645)
        {
            _489 = _583;
        }
        int _655 = _489;
        int _657 = _655;
        if (!_645)
        {
            float _659 = _346 + _585;
            float _661 = _338 + _587;
            float2 _2756 = float2(_659, _661);
            float3 _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2756, float2(0.0), isnan(_2756))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2756, float2(0.0), isnan(_2756))).xyz;
            float _665 = _663.x;
            float _667 = _663.y;
            float _669 = _663.z;
            float _671 = _667 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _673 = fma(_665, (*spvDescriptorSet0.fp_c3)._m0[2].x, _671);
            float _675 = fma(_669, (*spvDescriptorSet0.fp_c3)._m0[2].z, _673);
            float _677 = -_446;
            float _679 = _677 + _675;
            float _681 = abs(_679);
            bool _683 = _681 >= _442;
            bool _685 = !_683;
            int _687 = _685 ? 0 : 1;
            _657 = _687;
            _595 = _659;
            _597 = _661;
            _599 = _679;
        }
        int _689 = _657;
        float _691 = _595;
        float _693 = _597;
        float _695 = _599;
        int _697 = _635 & 1;
        bool _699 = _697 != 0;
        int _701 = _689;
        float _703 = _691;
        float _705 = _693;
        float _707 = _695;
        if (!_699)
        {
            float _709 = -_346;
            float _711 = _709 + _637;
            float _713 = -_338;
            float _715 = _713 + _639;
            float2 _2828 = float2(_711, _715);
            float3 _717 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2828, float2(0.0), isnan(_2828))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2828, float2(0.0), isnan(_2828))).xyz;
            float _719 = _717.x;
            float _721 = _717.y;
            float _723 = _717.z;
            float _725 = _721 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _727 = fma(_719, (*spvDescriptorSet0.fp_c3)._m0[2].x, _725);
            float _729 = fma(_723, (*spvDescriptorSet0.fp_c3)._m0[2].z, _727);
            float _731 = -_446;
            float _733 = _731 + _729;
            float _735 = abs(_733);
            bool _737 = _735 >= _442;
            bool _739 = !_737;
            int _741 = _739 ? 0 : 1;
            _647 = _741;
            _649 = _711;
            _651 = _715;
            _653 = _733;
        }
        int _743 = _647;
        float _745 = _649;
        float _747 = _651;
        float _749 = _653;
        int _751 = _689 & 1;
        bool _753 = _751 != 0;
        int _755 = _743;
        float _757 = _745;
        float _759 = _747;
        float _761 = _749;
        if (!_753)
        {
            float _763 = _346 + _691;
            float _765 = _338 + _693;
            float2 _2896 = float2(_763, _765);
            float3 _767 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2896, float2(0.0), isnan(_2896))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2896, float2(0.0), isnan(_2896))).xyz;
            float _769 = _767.x;
            float _771 = _767.y;
            float _773 = _767.z;
            float _775 = _771 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _777 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[2].x, _775);
            float _779 = fma(_773, (*spvDescriptorSet0.fp_c3)._m0[2].z, _777);
            float _781 = -_446;
            float _783 = _781 + _779;
            float _785 = abs(_783);
            bool _787 = _785 >= _442;
            bool _789 = !_787;
            int _791 = _789 ? 0 : 1;
            _701 = _791;
            _703 = _763;
            _705 = _765;
            _707 = _783;
        }
        int _793 = _701;
        float _795 = _703;
        float _797 = _705;
        float _799 = _707;
        int _801 = _743 & 1;
        bool _803 = _801 != 0;
        int _805 = _793;
        float _807 = _795;
        float _809 = _797;
        float _811 = _799;
        if (!_803)
        {
            float _813 = -_346;
            float _815 = _813 + _745;
            float _817 = -_338;
            float _819 = _817 + _747;
            float2 _2968 = float2(_815, _819);
            float3 _821 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2968, float2(0.0), isnan(_2968))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2968, float2(0.0), isnan(_2968))).xyz;
            float _823 = _821.x;
            float _825 = _821.y;
            float _827 = _821.z;
            float _829 = _825 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _831 = fma(_823, (*spvDescriptorSet0.fp_c3)._m0[2].x, _829);
            float _833 = fma(_827, (*spvDescriptorSet0.fp_c3)._m0[2].z, _831);
            float _835 = -_446;
            float _837 = _835 + _833;
            float _839 = abs(_837);
            bool _841 = _839 >= _442;
            bool _843 = !_841;
            int _845 = _843 ? 0 : 1;
            _755 = _845;
            _757 = _815;
            _759 = _819;
            _761 = _837;
        }
        int _847 = _755;
        float _849 = _757;
        float _851 = _759;
        float _853 = _761;
        int _855 = _793 & 1;
        bool _857 = _855 != 0;
        int _859 = _847;
        float _861 = _849;
        float _863 = _851;
        float _865 = _853;
        if (!_857)
        {
            float _867 = _346 + _795;
            float _869 = _338 + _797;
            float2 _3036 = float2(_867, _869);
            float3 _871 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3036, float2(0.0), isnan(_3036))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3036, float2(0.0), isnan(_3036))).xyz;
            float _873 = _871.x;
            float _875 = _871.y;
            float _877 = _871.z;
            float _879 = _875 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _881 = fma(_873, (*spvDescriptorSet0.fp_c3)._m0[2].x, _879);
            float _883 = fma(_877, (*spvDescriptorSet0.fp_c3)._m0[2].z, _881);
            float _885 = -_446;
            float _887 = _885 + _883;
            float _889 = abs(_887);
            bool _891 = _889 >= _442;
            bool _893 = !_891;
            int _895 = _893 ? 0 : 1;
            _805 = _895;
            _807 = _867;
            _809 = _869;
            _811 = _887;
        }
        int _897 = _805;
        float _899 = _807;
        float _901 = _809;
        float _903 = _811;
        int _905 = _847 & 1;
        bool _907 = _905 != 0;
        int _909 = _897;
        float _911 = _899;
        float _913 = _901;
        float _915 = _903;
        if (!_907)
        {
            float _917 = -_346;
            float _919 = _917 + _849;
            float _921 = -_338;
            float _923 = _921 + _851;
            float2 _3108 = float2(_919, _923);
            float3 _925 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3108, float2(0.0), isnan(_3108))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3108, float2(0.0), isnan(_3108))).xyz;
            float _927 = _925.x;
            float _929 = _925.y;
            float _931 = _925.z;
            float _933 = _929 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _935 = fma(_927, (*spvDescriptorSet0.fp_c3)._m0[2].x, _933);
            float _937 = fma(_931, (*spvDescriptorSet0.fp_c3)._m0[2].z, _935);
            float _939 = -_446;
            float _941 = _939 + _937;
            float _943 = abs(_941);
            bool _945 = _943 >= _442;
            bool _947 = !_945;
            int _949 = _947 ? 0 : 1;
            _859 = _949;
            _861 = _919;
            _863 = _923;
            _865 = _941;
        }
        int _951 = _859;
        float _953 = _861;
        float _955 = _863;
        float _957 = _865;
        int _959 = _897 & 1;
        bool _961 = _959 != 0;
        int _963 = _951;
        float _965 = _953;
        float _967 = _955;
        float _969 = _957;
        if (!_961)
        {
            float _971 = _346 + _899;
            float _973 = _338 + _901;
            float2 _3176 = float2(_971, _973);
            float3 _975 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3176, float2(0.0), isnan(_3176))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3176, float2(0.0), isnan(_3176))).xyz;
            float _977 = _975.x;
            float _979 = _975.y;
            float _981 = _975.z;
            float _983 = _979 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _985 = fma(_977, (*spvDescriptorSet0.fp_c3)._m0[2].x, _983);
            float _987 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[2].z, _985);
            float _989 = -_446;
            float _991 = _989 + _987;
            float _993 = abs(_991);
            bool _995 = _993 >= _442;
            bool _997 = !_995;
            int _999 = _997 ? 0 : 1;
            _909 = _999;
            _911 = _971;
            _913 = _973;
            _915 = _991;
        }
        int _1001 = _909;
        float _1003 = _911;
        float _1005 = _913;
        float _1007 = _915;
        int _1009 = _951 & 1;
        bool _1011 = _1009 != 0;
        int _1013 = _1001;
        float _1015 = _1003;
        float _1017 = _1005;
        float _1019 = _1007;
        if (!_1011)
        {
            float _1021 = fma(_346, -1.5, _953);
            float _1023 = fma(_338, -1.5, _955);
            float2 _3245 = float2(_1021, _1023);
            float3 _1025 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3245, float2(0.0), isnan(_3245))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3245, float2(0.0), isnan(_3245))).xyz;
            float _1027 = _1025.x;
            float _1029 = _1025.y;
            float _1031 = _1025.z;
            float _1033 = _1029 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1035 = fma(_1027, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1033);
            float _1037 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1035);
            float _1039 = -_446;
            float _1041 = _1039 + _1037;
            float _1043 = abs(_1041);
            bool _1045 = _1043 >= _442;
            bool _1047 = !_1045;
            int _1049 = _1047 ? 0 : 1;
            _963 = _1049;
            _965 = _1021;
            _967 = _1023;
            _969 = _1041;
        }
        int _1051 = _963;
        float _1053 = _965;
        float _1055 = _967;
        float _1057 = _969;
        int _1059 = _1001 & 1;
        bool _1061 = _1059 != 0;
        int _1063 = _1051;
        float _1065 = _1053;
        float _1067 = _1055;
        float _1069 = _1057;
        if (!_1061)
        {
            float _1071 = fma(_346, 1.5, _1003);
            float _1073 = fma(_338, 1.5, _1005);
            float2 _3314 = float2(_1071, _1073);
            float3 _1075 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3314, float2(0.0), isnan(_3314))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3314, float2(0.0), isnan(_3314))).xyz;
            float _1077 = _1075.x;
            float _1079 = _1075.y;
            float _1081 = _1075.z;
            float _1083 = _1079 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1085 = fma(_1077, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1083);
            float _1087 = fma(_1081, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1085);
            float _1089 = -_446;
            float _1091 = _1089 + _1087;
            float _1093 = abs(_1091);
            bool _1095 = _1093 >= _442;
            bool _1097 = !_1095;
            int _1099 = _1097 ? 0 : 1;
            _1013 = _1099;
            _1015 = _1071;
            _1017 = _1073;
            _1019 = _1091;
        }
        int _1101 = _1013;
        float _1103 = _1015;
        float _1105 = _1017;
        float _1107 = _1019;
        int _1109 = _1051 & 1;
        bool _1111 = _1109 != 0;
        int _1113 = _1101;
        float _1115 = _1103;
        float _1117 = _1105;
        float _1119 = _1107;
        if (!_1111)
        {
            float _1121 = fma(_346, -2.0, _1053);
            float _1123 = fma(_338, -2.0, _1055);
            float2 _3382 = float2(_1121, _1123);
            float3 _1125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3382, float2(0.0), isnan(_3382))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3382, float2(0.0), isnan(_3382))).xyz;
            float _1127 = _1125.x;
            float _1129 = _1125.y;
            float _1131 = _1125.z;
            float _1133 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1135 = fma(_1127, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1133);
            float _1137 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1135);
            float _1139 = -_446;
            float _1141 = _1139 + _1137;
            float _1143 = abs(_1141);
            bool _1145 = _1143 >= _442;
            bool _1147 = !_1145;
            int _1149 = _1147 ? 0 : 1;
            _1063 = _1149;
            _1065 = _1121;
            _1067 = _1123;
            _1069 = _1141;
        }
        int _1151 = _1063;
        float _1153 = _1065;
        float _1155 = _1067;
        float _1157 = _1069;
        int _1159 = _1101 & 1;
        bool _1161 = _1159 != 0;
        int _1163 = _1151;
        float _1165 = _1153;
        float _1167 = _1155;
        float _1169 = _1157;
        if (!_1161)
        {
            float _1171 = fma(_346, 2.0, _1103);
            float _1173 = fma(_338, 2.0, _1105);
            float2 _3450 = float2(_1171, _1173);
            float3 _1175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3450, float2(0.0), isnan(_3450))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3450, float2(0.0), isnan(_3450))).xyz;
            float _1177 = _1175.x;
            float _1179 = _1175.y;
            float _1181 = _1175.z;
            float _1183 = _1179 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1185 = fma(_1177, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1183);
            float _1187 = fma(_1181, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1185);
            float _1189 = -_446;
            float _1191 = _1189 + _1187;
            float _1193 = abs(_1191);
            bool _1195 = _1193 >= _442;
            bool _1197 = !_1195;
            int _1199 = _1197 ? 0 : 1;
            _1113 = _1199;
            _1115 = _1171;
            _1117 = _1173;
            _1119 = _1191;
        }
        int _1201 = _1113;
        float _1203 = _1115;
        float _1205 = _1117;
        float _1207 = _1119;
        int _1209 = _1151 & 1;
        bool _1211 = _1209 != 0;
        int _1213 = _1201;
        float _1215 = _1203;
        float _1217 = _1205;
        float _1219 = _1207;
        if (!_1211)
        {
            float _1221 = fma(_346, -2.0, _1153);
            float _1223 = fma(_338, -2.0, _1155);
            float2 _3518 = float2(_1221, _1223);
            float3 _1225 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3518, float2(0.0), isnan(_3518))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3518, float2(0.0), isnan(_3518))).xyz;
            float _1227 = _1225.x;
            float _1229 = _1225.y;
            float _1231 = _1225.z;
            float _1233 = _1229 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1235 = fma(_1227, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1233);
            float _1237 = fma(_1231, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1235);
            float _1239 = -_446;
            float _1241 = _1239 + _1237;
            float _1243 = abs(_1241);
            bool _1245 = _1243 >= _442;
            bool _1247 = !_1245;
            int _1249 = _1247 ? 0 : 1;
            _1163 = _1249;
            _1165 = _1221;
            _1167 = _1223;
            _1169 = _1241;
        }
        int _1251 = _1163;
        float _1253 = _1165;
        float _1255 = _1167;
        float _1257 = _1169;
        int _1259 = _1201 & 1;
        bool _1261 = _1259 != 0;
        int _1263 = _1251;
        float _1265 = _1253;
        float _1267 = _1255;
        float _1269 = _1257;
        if (!_1261)
        {
            float _1271 = fma(_346, 2.0, _1203);
            float _1273 = fma(_338, 2.0, _1205);
            float2 _3586 = float2(_1271, _1273);
            float3 _1275 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3586, float2(0.0), isnan(_3586))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3586, float2(0.0), isnan(_3586))).xyz;
            float _1277 = _1275.x;
            float _1279 = _1275.y;
            float _1281 = _1275.z;
            float _1283 = _1279 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1285 = fma(_1277, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1283);
            float _1287 = fma(_1281, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1285);
            float _1289 = -_446;
            float _1291 = _1289 + _1287;
            float _1293 = abs(_1291);
            bool _1295 = _1293 >= _442;
            bool _1297 = !_1295;
            int _1299 = _1297 ? 0 : 1;
            _1213 = _1299;
            _1215 = _1271;
            _1217 = _1273;
            _1219 = _1291;
        }
        int _1301 = _1213;
        float _1303 = _1215;
        float _1305 = _1217;
        float _1307 = _1219;
        int _1309 = _1251 & 1;
        bool _1311 = _1309 != 0;
        int _1313 = _1301;
        float _1315 = _1303;
        float _1317 = _1305;
        float _1319 = _1307;
        if (!_1311)
        {
            float _1321 = fma(_346, -2.0, _1253);
            float _1323 = fma(_338, -2.0, _1255);
            float2 _3654 = float2(_1321, _1323);
            float3 _1325 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3654, float2(0.0), isnan(_3654))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3654, float2(0.0), isnan(_3654))).xyz;
            float _1327 = _1325.x;
            float _1329 = _1325.y;
            float _1331 = _1325.z;
            float _1333 = _1329 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1335 = fma(_1327, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1333);
            float _1337 = fma(_1331, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1335);
            float _1339 = -_446;
            float _1341 = _1339 + _1337;
            float _1343 = abs(_1341);
            bool _1345 = _1343 >= _442;
            bool _1347 = !_1345;
            int _1349 = _1347 ? 0 : 1;
            _1263 = _1349;
            _1265 = _1321;
            _1267 = _1323;
            _1269 = _1341;
        }
        int _1351 = _1263;
        float _1353 = _1265;
        float _1355 = _1267;
        float _1357 = _1269;
        int _1359 = _1301 & 1;
        bool _1361 = _1359 != 0;
        int _1363 = _1351;
        float _1365 = _1353;
        float _1367 = _1355;
        float _1369 = _1357;
        if (!_1361)
        {
            float _1371 = fma(_346, 2.0, _1303);
            float _1373 = fma(_338, 2.0, _1305);
            float2 _3722 = float2(_1371, _1373);
            float3 _1375 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3722, float2(0.0), isnan(_3722))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3722, float2(0.0), isnan(_3722))).xyz;
            float _1377 = _1375.x;
            float _1379 = _1375.y;
            float _1381 = _1375.z;
            float _1383 = _1379 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1385 = fma(_1377, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1383);
            float _1387 = fma(_1381, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1385);
            float _1389 = -_446;
            float _1391 = _1389 + _1387;
            float _1393 = abs(_1391);
            bool _1395 = _1393 >= _442;
            bool _1397 = !_1395;
            int _1399 = _1397 ? 0 : 1;
            _1313 = _1399;
            _1315 = _1371;
            _1317 = _1373;
            _1319 = _1391;
        }
        int _1401 = _1313;
        float _1403 = _1315;
        float _1405 = _1317;
        float _1407 = _1319;
        int _1409 = _1351 & 1;
        bool _1411 = _1409 != 0;
        int _1413 = _1401;
        float _1415 = _1403;
        float _1417 = _1405;
        float _1419 = _1407;
        if (!_1411)
        {
            float _1421 = fma(_346, -2.0, _1353);
            float _1423 = fma(_338, -2.0, _1355);
            float2 _3790 = float2(_1421, _1423);
            float3 _1425 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3790, float2(0.0), isnan(_3790))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3790, float2(0.0), isnan(_3790))).xyz;
            float _1427 = _1425.x;
            float _1429 = _1425.y;
            float _1431 = _1425.z;
            float _1433 = _1429 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1435 = fma(_1427, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1433);
            float _1437 = fma(_1431, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1435);
            float _1439 = -_446;
            float _1441 = _1439 + _1437;
            float _1443 = abs(_1441);
            bool _1445 = _1443 >= _442;
            bool _1447 = !_1445;
            int _1449 = _1447 ? 0 : 1;
            _1363 = _1449;
            _1365 = _1421;
            _1367 = _1423;
            _1369 = _1441;
        }
        int _1451 = _1363;
        float _1453 = _1365;
        float _1455 = _1367;
        float _1457 = _1369;
        int _1459 = _1401 & 1;
        bool _1461 = _1459 != 0;
        int _1463 = _1451;
        float _1465 = _1457;
        float _1467 = _1453;
        float _1469 = _1455;
        if (!_1461)
        {
            float _1471 = fma(_346, 2.0, _1403);
            float _1473 = fma(_338, 2.0, _1405);
            float2 _3858 = float2(_1471, _1473);
            float3 _1475 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3858, float2(0.0), isnan(_3858))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3858, float2(0.0), isnan(_3858))).xyz;
            float _1477 = _1475.x;
            float _1479 = _1475.y;
            float _1481 = _1475.z;
            float _1483 = _1479 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1485 = fma(_1477, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1483);
            float _1487 = fma(_1481, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1485);
            float _1489 = -_446;
            float _1491 = _1489 + _1487;
            float _1493 = abs(_1491);
            bool _1495 = _1493 >= _442;
            bool _1497 = !_1495;
            int _1499 = _1497 ? 0 : 1;
            _1413 = _1499;
            _1415 = _1471;
            _1417 = _1473;
            _1419 = _1491;
        }
        int _1501 = _1413;
        float _1503 = _1415;
        float _1505 = _1417;
        float _1507 = _1419;
        int _1509 = _1451 & 1;
        bool _1511 = _1509 != 0;
        int _1513 = _1501;
        float _1515 = _1507;
        float _1517 = _1503;
        float _1519 = _1505;
        if (!_1511)
        {
            float _1521 = fma(_346, -4.0, _1453);
            float _1523 = fma(_338, -4.0, _1455);
            float2 _3927 = float2(_1521, _1523);
            float3 _1525 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3927, float2(0.0), isnan(_3927))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3927, float2(0.0), isnan(_3927))).xyz;
            float _1527 = _1525.x;
            float _1529 = _1525.y;
            float _1531 = _1525.z;
            float _1533 = _1529 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1535 = fma(_1527, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1533);
            float _1537 = fma(_1531, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1535);
            float _1539 = -_446;
            float _1541 = _1539 + _1537;
            float _1543 = abs(_1541);
            bool _1545 = _1543 >= _442;
            bool _1547 = !_1545;
            int _1549 = _1547 ? 0 : 1;
            _1463 = _1549;
            _1465 = _1541;
            _1467 = _1521;
            _1469 = _1523;
        }
        int _1551 = _1463;
        float _1553 = _1465;
        float _1555 = _1467;
        float _1557 = _1469;
        int _1559 = _1501 & 1;
        bool _1561 = _1559 != 0;
        float _1563 = _1557;
        float _1565 = _1555;
        if (!_1561)
        {
            float _1567 = fma(_346, 4.0, _1503);
            float _1569 = fma(_338, 4.0, _1505);
            float2 _3994 = float2(_1567, _1569);
            float3 _1571 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3994, float2(0.0), isnan(_3994))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3994, float2(0.0), isnan(_3994))).xyz;
            float _1573 = _1571.x;
            float _1575 = _1571.y;
            float _1577 = _1571.z;
            float _1579 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1581 = fma(_1573, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1579);
            float _1583 = fma(_1577, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1581);
            float _1585 = -_446;
            float _1587 = _1585 + _1583;
            float _1589 = abs(_1587);
            bool _1591 = _1589 >= _442;
            bool _1593 = !_1591;
            int _1595 = _1593 ? 0 : 1;
            _1513 = _1595;
            _1515 = _1587;
            _1517 = _1567;
            _1519 = _1569;
        }
        int _1597 = _1513;
        float _1599 = _1515;
        float _1601 = _1517;
        float _1603 = _1519;
        int _1605 = _1551 & 1;
        bool _1607 = _1605 != 0;
        int _1609 = _1607 ? (-1) : 0;
        float _1611 = _1599;
        if (_1607)
        {
            bool _1613 = _1553 >= 0.0;
            bool _1615 = isnan(_1553);
            bool _1617 = _1613 || _1615;
            bool _1619 = isnan(0.0);
            bool _1621 = _1617 || _1619;
            _491 = _1621 ? (-1) : 0;
        }
        int _1623 = _491;
        int _1625 = _1623;
        if (!_1607)
        {
            float _1627 = fma(_346, -8.0, _1555);
            float _1629 = fma(_338, -8.0, _1557);
            float2 _4080 = float2(_1627, _1629);
            float3 _1631 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4080, float2(0.0), isnan(_4080))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4080, float2(0.0), isnan(_4080))).xyz;
            float _1633 = _1631.x;
            float _1635 = _1631.y;
            float _1637 = _1631.z;
            float _1639 = _1635 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1641 = fma(_1633, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1639);
            float _1643 = fma(_1637, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1641);
            float _1645 = -_446;
            float _1647 = _1645 + _1643;
            bool _1649 = _1647 >= 0.0;
            bool _1651 = isnan(_1647);
            bool _1653 = _1649 || _1651;
            bool _1655 = isnan(0.0);
            bool _1657 = _1653 || _1655;
            _1563 = _1629;
            _493 = _1647;
            _1565 = _1627;
            _1625 = _1657 ? (-1) : 0;
        }
        float _1659 = _1563;
        float _1661 = _493;
        float _1663 = _1565;
        int _1665 = _1625;
        int _1667 = _1597 & 1;
        bool _1669 = _1667 != 0;
        float _1671 = _1661;
        if (_1669)
        {
            bool _1673 = _1599 >= 0.0;
            bool _1675 = isnan(_1599);
            bool _1677 = _1673 || _1675;
            bool _1679 = isnan(0.0);
            bool _1681 = _1677 || _1679;
            _1609 = _1681 ? (-1) : 0;
        }
        int _1683 = _1609;
        int _1685 = _1683;
        if (_1669)
        {
            _1611 = _1601;
        }
        float _1687 = _1611;
        float _1689 = _1687;
        if (_1669)
        {
            _1671 = _1603;
        }
        float _1691 = _1671;
        float _1693 = _1691;
        if (!_1669)
        {
            float _1695 = fma(_346, 8.0, _1601);
            float _1697 = fma(_338, 8.0, _1603);
            float2 _4179 = float2(_1695, _1697);
            float3 _1699 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4179, float2(0.0), isnan(_4179))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4179, float2(0.0), isnan(_4179))).xyz;
            float _1701 = _1699.x;
            float _1703 = _1699.y;
            float _1705 = _1699.z;
            float _1707 = _1703 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _1709 = fma(_1701, (*spvDescriptorSet0.fp_c3)._m0[2].x, _1707);
            float _1711 = fma(_1705, (*spvDescriptorSet0.fp_c3)._m0[2].z, _1709);
            float _1713 = -_446;
            float _1715 = _1713 + _1711;
            bool _1717 = _1715 >= 0.0;
            bool _1719 = isnan(_1715);
            bool _1721 = _1717 || _1719;
            bool _1723 = isnan(0.0);
            bool _1725 = _1721 || _1723;
            _1693 = _1697;
            _1689 = _1695;
            _1685 = _1725 ? (-1) : 0;
        }
        float _1727 = _1693;
        float _1729 = _1689;
        int _1731 = _1685;
        float _1733 = -_1659;
        float _1735 = _83 + _1733;
        float _1737 = -_83;
        float _1739 = _1737 + _1727;
        float _1741 = -_1663;
        float _1743 = _81 + _1741;
        float _1745 = -_81;
        float _1747 = _1745 + _1729;
        float _1749 = _330 * _1735;
        float _1751 = _330 * _1739;
        float _1753 = _432 * 0.75;
        float _1755 = fma(_318, _1743, _1749);
        float _1757 = fma(_318, _1747, _1751);
        float _1759 = _1755 + _1757;
        bool _1761 = _1755 < _1757;
        int _1763 = ~_1665;
        int _1765 = (_1761 ? (-1) : 0) & _1763;
        bool _1767 = _1755 >= _1757;
        bool _1769 = isnan(_1755);
        bool _1771 = _1767 || _1769;
        bool _1773 = isnan(_1757);
        bool _1775 = _1771 || _1773;
        int _1777 = ~_1731;
        int _1779 = (_1775 ? (-1) : 0) & _1777;
        float _1781 = precise::min(_1755, _1757);
        float _1783 = 1.0 / _1759;
        int _1785 = ~_1765;
        int _1787 = _1785 & _1779;
        int _1789 = ~_1779;
        int _1791 = _1765 & _1789;
        int _1793 = _1787 | _1791;
        int _1795 = _1765 & _1779;
        int _1797 = _1793 | _1795;
        bool _1799 = _101 < _446;
        int _1801 = (_1799 ? (-1) : 0) ^ _1797;
        float _1803 = -_1781;
        float _1805 = fma(_1803, _1783, 0.5);
        float _1807 = (_1801 != 0) ? _1805 : 0.0;
        float _1809 = precise::max(_1753, _1807);
        float _1811 = _364 * _1809;
        float _1813 = fma(_330, _1811, _81);
        float _1815 = fma(_318, _1811, _83);
        float2 _4353 = float2(_1813, _1815);
        float4 _1817 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_4353, float2(0.0), isnan(_4353))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_4353, float2(0.0), isnan(_4353))).xyzw;
        float _1819 = _1817.x;
        float _1821 = _1817.y;
        float _1823 = _1817.z;
        float _1825 = _1817.w;
        _260 = _1819;
        _262 = _1821;
        _264 = _1823;
        _266 = _1825;
    }
    float _1827 = _260;
    float _1829 = _262;
    float _1831 = _264;
    float _1833 = _266;
    float2 _4378 = float2(_240, _238);
    float4 _1835 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4378, float2(0.0), isnan(_4378))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4378, float2(0.0), isnan(_4378))).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float _1845 = sqrt(_256);
    float _1847 = 0.0 + _1845;
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = fma(_1849, -0.5, 0.5);
    float _1853 = -_1827;
    float _1855 = _1837 + _1853;
    float _1857 = -_1829;
    float _1859 = _1839 + _1857;
    float _1861 = -_1831;
    float _1863 = _1841 + _1861;
    float _1865 = -_1833;
    float _1867 = _1843 + _1865;
    float _1869 = fma(_1851, _1855, _1827);
    float _1871 = fma(_1851, _1859, _1829);
    float _1873 = fma(_1851, _1863, _1831);
    float _1875 = fma(_1851, _1867, _1833);
    out.m_42.x = _1869;
    out.m_42.y = _1871;
    out.m_42.z = _1873;
    out.m_42.w = _1875;
    return out;
}

