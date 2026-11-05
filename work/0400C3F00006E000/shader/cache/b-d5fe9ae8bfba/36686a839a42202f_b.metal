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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float _63 = fma(_59, 2.0, -1.0);
    float _65 = fma(_61, 2.0, -1.0);
    float _67 = _63 * _63;
    float _69 = fma(_65, _65, _67);
    float _71 = sqrt(_69);
    bool _75 = _71 >= 1.0;
    bool _77 = isnan(_71);
    bool _79 = _75 || _77;
    bool _81 = isnan(1.0);
    bool _83 = _79 || _81;
    float _85 = _67;
    float _87 = _63;
    float _89 = _65;
    float _91 = _71;
    if (_83)
    {
        _85 = _61;
    }
    float _93 = _85;
    float _95 = 0.0;
    float _97 = _93;
    if (_83)
    {
        _95 = _59;
    }
    float _99 = _95;
    float _101 = _99;
    if (!_83)
    {
        float _103 = -_69;
        float _105 = _103 + 1.0;
        float _107 = abs(_65);
        float _109 = abs(_63);
        float _111 = precise::max(_107, _109);
        bool _113 = _111 >= 16.0;
        float _115 = sqrt(_105);
        bool _117 = _113;
        int _120 = as_type<int>(_111);
        if (_113)
        {
            float _122 = _63 * 0.0625;
            _87 = _122;
        }
        float _124 = _87;
        if (_113)
        {
            float _126 = _65 * 0.0625;
            _89 = _126;
        }
        float _128 = _89;
        float _130 = _115 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
        float _132 = abs(_71);
        float _134 = abs(_130);
        float _136 = precise::max(_132, _134);
        bool _138 = _136 >= 16.0;
        float _140 = _130;
        int _142 = as_type<int>(_136);
        if (_138)
        {
            float _144 = _71 * 0.0625;
            _91 = _144;
        }
        float _146 = _91;
        if (_138)
        {
            float _148 = _130 * 0.0625;
            _140 = _148;
        }
        float _150 = _140;
        float _152 = abs(_124);
        bool _154 = _152 != 0.0;
        bool _156 = isnan(_152);
        bool _158 = _154 || _156;
        bool _160 = isnan(0.0);
        bool _162 = _158 || _160;
        float _164 = abs(_146);
        bool _166 = _164 != 0.0;
        bool _168 = isnan(_164);
        bool _170 = _166 || _168;
        bool _172 = isnan(0.0);
        bool _174 = _170 || _172;
        float _176 = abs(_128);
        bool _178 = _176 == 0.0;
        bool _180 = !_162;
        bool _182 = _178 && _180;
        float _184 = abs(_150);
        bool _186 = _184 == 0.0;
        bool _188 = !_174;
        bool _190 = _186 && _188;
        float _192 = abs(_150);
        bool _194 = _192 == 0.0;
        bool _196 = false;
        int _198 = _190 ? (-1) : 0;
        int _200 = _174 ? (-1) : 0;
        if (_182)
        {
            bool _202 = as_type<int>(_128) >= 0;
            _196 = _202;
        }
        bool _204 = _196;
        if (_190)
        {
            bool _206 = as_type<int>(_150) >= 0;
            _117 = _206;
        }
        bool _208 = _117;
        if (_182)
        {
            int _210 = _204 ? 0 : 1078530011;
            _142 = _210;
        }
        int _212 = _142;
        int _214 = _212;
        if (_190)
        {
            int _216 = _208 ? 0 : 1078530011;
            _120 = _216;
        }
        int _218 = _120;
        float _220 = abs(_128);
        bool _222 = _220 == 0.0;
        int _224 = _218;
        if (_182)
        {
            int _226 = int(0x80000000) & as_type<int>(_124);
            int _228 = _212 | _226;
            _214 = _228;
        }
        int _230 = _214;
        int _232 = _230;
        float _234 = as_type<float>(_230);
        if (_190)
        {
            int _236 = int(0x80000000) & as_type<int>(_146);
            int _238 = _218 | _236;
            _224 = _238;
        }
        int _240 = _224;
        bool _242 = !_174;
        bool _244 = _242 && _194;
        int _246 = _240;
        float _248 = as_type<float>(_240);
        if (!_244)
        {
            float _250 = abs(_146);
            bool _252 = _250 != as_type<float>(0x7f800000u /* inf */);
            bool _254 = isnan(_250);
            bool _256 = _252 || _254;
            bool _258 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _260 = _256 || _258;
            float _262 = abs(_150);
            bool _264 = _262 == as_type<float>(0x7f800000u /* inf */);
            float _266 = abs(_150);
            bool _268 = _266 == as_type<float>(0x7f800000u /* inf */);
            bool _270 = !_260;
            bool _272 = _268 && _270;
            _200 = _272 ? (-1) : 0;
            if (_272)
            {
                bool _274 = as_type<int>(_150) >= 0;
                _198 = _274 ? (-1) : 0;
            }
            int _276 = _198;
            if (_272)
            {
                _246 = 1075235812;
            }
            int _278 = _246;
            int _280 = _278;
            if (_272)
            {
                int _282 = ~_276;
                int _284 = (_282 != 0) ? _278 : 1061752795;
                _280 = _284;
            }
            int _286 = _280;
            float _288 = as_type<float>(_286);
            if (_272)
            {
                int _290 = int(0x80000000) & as_type<int>(_146);
                int _292 = _286 | _290;
                _288 = as_type<float>(_292);
            }
            float _294 = _288;
            bool _296 = !_260;
            bool _298 = _296 && _264;
            _248 = _294;
            if (!_298)
            {
                float _300 = abs(_146);
                float _302 = abs(_150);
                float _304 = precise::max(_300, _302);
                float _306 = abs(_146);
                float _308 = abs(_150);
                float _310 = precise::min(_306, _308);
                float _312 = 1.0 / _304;
                float _314 = abs(_146);
                float _316 = abs(_150);
                bool _318 = _314 > _316;
                bool _320 = as_type<int>(_150) >= 0;
                float _322 = abs(_146);
                float _324 = abs(_150);
                float _326 = _322 + _324;
                int _328 = as_type<int>(_146) & int(0x80000000);
                bool _330 = _326 > as_type<float>(0x7f800000u /* inf */);
                bool _332 = isnan(_326);
                bool _334 = _330 || _332;
                bool _336 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _338 = _334 || _336;
                float _340 = _310 * _312;
                float _342 = _340 * _340;
                float _344 = _342 + 11.33538818359375;
                float _346 = fma(_342, _344, 28.84246826171875);
                float _348 = fma(_342, _346, 19.6966705322265625);
                float _350 = fma(_342, -0.82336294651031494140625, -5.674867153167724609375);
                float _352 = fma(_342, _350, -6.565555095672607421875);
                float _354 = 1.0 / _348;
                float _356 = _342 * _352;
                float _358 = _340 * _356;
                float _360 = fma(_358, _354, _340);
                float _362 = _360;
                _200 = _318 ? (-1) : 0;
                _248 = _326;
                if (_318)
                {
                    float _364 = -_360;
                    float _366 = _364 + 1.57079637050628662109375;
                    _362 = _366;
                }
                float _368 = _362;
                int _370 = as_type<int>(_368);
                if (!_320)
                {
                    float _372 = -_368;
                    float _374 = _372 + 3.1415927410125732421875;
                    _370 = as_type<int>(_374);
                }
                int _376 = _370;
                if (!_338)
                {
                    int _378 = _328 | _376;
                    _248 = as_type<float>(_378);
                }
            }
        }
        int _380 = _200;
        float _382 = _248;
        bool _384 = !_162;
        bool _386 = _384 && _222;
        int _388 = _380;
        if (!_386)
        {
            float _390 = abs(_124);
            bool _392 = _390 != as_type<float>(0x7f800000u /* inf */);
            bool _394 = isnan(_390);
            bool _396 = _392 || _394;
            bool _398 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _400 = _396 || _398;
            float _402 = abs(_128);
            bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
            float _406 = abs(_128);
            bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
            bool _410 = !_400;
            bool _412 = _408 && _410;
            if (_412)
            {
                bool _414 = as_type<int>(_128) >= 0;
                _388 = _414 ? (-1) : 0;
            }
            int _416 = _388;
            if (_412)
            {
                _232 = 1075235812;
            }
            int _418 = _232;
            int _420 = _418;
            if (_412)
            {
                int _422 = ~_416;
                int _424 = (_422 != 0) ? _418 : 1061752795;
                _420 = _424;
            }
            int _426 = _420;
            float _428 = as_type<float>(_426);
            if (_412)
            {
                int _430 = int(0x80000000) & as_type<int>(_124);
                int _432 = _426 | _430;
                _428 = as_type<float>(_432);
            }
            float _434 = _428;
            bool _436 = !_400;
            bool _438 = _436 && _404;
            _234 = _434;
            if (!_438)
            {
                float _440 = abs(_124);
                float _442 = abs(_128);
                float _444 = precise::max(_440, _442);
                float _446 = abs(_124);
                float _448 = abs(_128);
                float _450 = precise::min(_446, _448);
                float _452 = 1.0 / _444;
                float _454 = abs(_124);
                float _456 = abs(_128);
                bool _458 = _454 > _456;
                bool _460 = as_type<int>(_128) >= 0;
                float _462 = _450 * _452;
                float _464 = abs(_124);
                float _466 = abs(_128);
                float _468 = _464 + _466;
                int _470 = as_type<int>(_124) & int(0x80000000);
                float _472 = _462 * _462;
                bool _474 = _468 > as_type<float>(0x7f800000u /* inf */);
                bool _476 = isnan(_468);
                bool _478 = _474 || _476;
                bool _480 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _482 = _478 || _480;
                float _484 = _472 + 11.33538818359375;
                float _486 = fma(_472, _484, 28.84246826171875);
                float _488 = fma(_472, _486, 19.6966705322265625);
                float _490 = fma(_472, -0.82336294651031494140625, -5.674867153167724609375);
                float _492 = fma(_472, _490, -6.565555095672607421875);
                float _494 = 1.0 / _488;
                float _496 = _472 * _492;
                float _498 = _462 * _496;
                float _500 = fma(_498, _494, _462);
                float _502 = _500;
                _234 = _468;
                if (_458)
                {
                    float _504 = -_500;
                    float _506 = _504 + 1.57079637050628662109375;
                    _502 = _506;
                }
                float _508 = _502;
                int _510 = as_type<int>(_508);
                if (!_460)
                {
                    float _512 = -_508;
                    float _514 = _512 + 3.1415927410125732421875;
                    _510 = as_type<int>(_514);
                }
                int _516 = _510;
                if (!_482)
                {
                    int _518 = _470 | _516;
                    _234 = as_type<float>(_518);
                }
            }
        }
        float _520 = _234;
        float _522 = _520 * 0.15915493667125701904296875;
        float _524 = _382 * 0.3183098733425140380859375;
        float _526 = _522 * 6.283185482025146484375;
        float _528 = cos(_526);
        float _530 = _522 * 6.283185482025146484375;
        float _532 = sin(_530);
        float _534 = fma(_524, _528, 0.5);
        float _536 = fma(_524, _532, 0.5);
        _97 = _534;
        _101 = _536;
    }
    float _538 = _97;
    float _540 = _101;
    float _542 = _538 + (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _544 = _540 + (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float2 _1343 = float2(_61, _59);
    float _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1343, float2(0.0), isnan(_1343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1343, float2(0.0), isnan(_1343))).w;
    float2 _1353 = float2(_542, _544);
    float4 _549 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1353, float2(0.0), isnan(_1353))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1353, float2(0.0), isnan(_1353))).xyzw;
    float _551 = _549.x;
    float _553 = _549.y;
    float _555 = _549.z;
    float _557 = _549.w;
    float _559 = in.m_33.y;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = in.m_33.z;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = in.m_33.x;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_33.w;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _585 = _583 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _587 = _57 * _563;
    float _589 = _57 * _569;
    float _591 = _57 * _575;
    float _593 = _57 * _581;
    float _595 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _597 = _595 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _599 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _601 = _599 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _603 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _605 = _603 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _607 = _557 * _546;
    float _609 = fma(_551, _585, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _611 = fma(_553, _597, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _613 = fma(_555, _601, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _615 = fma(_607, _605, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _617 = _609 * _591;
    float _619 = precise::clamp(_617, 0.0, 1.0);
    float _621 = _611 * _587;
    float _623 = precise::clamp(_621, 0.0, 1.0);
    float _625 = _613 * _589;
    float _627 = precise::clamp(_625, 0.0, 1.0);
    float _629 = _615 * _593;
    float _631 = precise::clamp(_629, 0.0, 1.0);
    out.m_36.x = _619;
    out.m_36.y = _623;
    out.m_36.z = _627;
    out.m_36.w = _631;
    return out;
}

