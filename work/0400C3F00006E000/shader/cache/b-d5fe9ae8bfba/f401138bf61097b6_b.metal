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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_41 [[user(locn3), flat]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_56 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.y;
    float _85 = in.m_43.x;
    float _87 = in.m_43.y;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = 1.0 / _63;
    float _103 = _83 * (-0.00999999977648258209228515625);
    float _105 = _101 * _69;
    float _107 = _101 * _75;
    float _109 = in.m_37.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = fma(_105, 2.0, -1.0);
    float _117 = fma(_107, 2.0, -1.0);
    float _119 = in.m_37.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _117 * _117;
    float _127 = abs(_115);
    float _129 = abs(_117);
    float _131 = precise::max(_127, _129);
    float _133 = fma(_115, _115, _125);
    bool _137 = _131 >= 16.0;
    float _139 = _101 * _81;
    float _141 = fma(_103, (*spvDescriptorSet0.fp_c9)._m0[191].x, _133);
    float _143 = 1.0 / _139;
    float _145 = _117;
    float _147 = _115;
    int _150 = as_type<int>(_83);
    if (_137)
    {
        float _152 = _117 * 0.0625;
        _145 = _152;
    }
    float _154 = _145;
    if (_137)
    {
        float _156 = _115 * 0.0625;
        _147 = _156;
    }
    float _158 = _147;
    float _160 = abs(_154);
    bool _162 = _160 != 0.0;
    bool _164 = isnan(_160);
    bool _166 = _162 || _164;
    bool _168 = isnan(0.0);
    bool _170 = _166 || _168;
    float _172 = abs(_158);
    bool _174 = _172 == 0.0;
    float _176 = abs(_158);
    bool _178 = _176 == 0.0;
    bool _180 = !_170;
    bool _182 = _178 && _180;
    bool _184 = false;
    if (_182)
    {
        bool _186 = as_type<int>(_158) >= 0;
        _184 = _186;
    }
    bool _188 = _184;
    int _190 = _188 ? (-1) : 0;
    if (_182)
    {
        int _192 = _188 ? 0 : 1078530011;
        _150 = _192;
    }
    int _194 = _150;
    int _196 = _194;
    if (_182)
    {
        int _198 = int(0x80000000) & as_type<int>(_154);
        int _200 = _194 | _198;
        _196 = _200;
    }
    int _202 = _196;
    bool _204 = !_170;
    bool _206 = _204 && _174;
    int _208 = _202;
    float _210 = as_type<float>(_202);
    if (!_206)
    {
        float _212 = abs(_154);
        bool _214 = _212 != as_type<float>(0x7f800000u /* inf */);
        bool _216 = isnan(_212);
        bool _218 = _214 || _216;
        bool _220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _222 = _218 || _220;
        float _224 = abs(_158);
        bool _226 = _224 == as_type<float>(0x7f800000u /* inf */);
        float _228 = abs(_158);
        bool _230 = _228 == as_type<float>(0x7f800000u /* inf */);
        bool _232 = !_222;
        bool _234 = _230 && _232;
        if (_234)
        {
            bool _236 = as_type<int>(_158) >= 0;
            _190 = _236 ? (-1) : 0;
        }
        int _238 = _190;
        if (_234)
        {
            _208 = 1075235812;
        }
        int _240 = _208;
        int _242 = _240;
        if (_234)
        {
            int _244 = ~_238;
            int _246 = (_244 != 0) ? _240 : 1061752795;
            _242 = _246;
        }
        int _248 = _242;
        float _250 = as_type<float>(_248);
        if (_234)
        {
            int _252 = int(0x80000000) & as_type<int>(_154);
            int _254 = _248 | _252;
            _250 = as_type<float>(_254);
        }
        float _256 = _250;
        bool _258 = !_222;
        bool _260 = _258 && _226;
        _210 = _256;
        if (!_260)
        {
            float _262 = abs(_158);
            float _264 = abs(_154);
            float _266 = precise::max(_262, _264);
            float _268 = abs(_158);
            float _270 = abs(_154);
            float _272 = precise::min(_268, _270);
            float _274 = 1.0 / _266;
            float _276 = abs(_154);
            float _278 = abs(_158);
            bool _280 = _276 > _278;
            bool _282 = as_type<int>(_158) >= 0;
            float _284 = _272 * _274;
            float _286 = _284 * _284;
            float _288 = _286 + 11.33538818359375;
            float _290 = fma(_286, _288, 28.84246826171875);
            float _292 = fma(_286, _290, 19.6966705322265625);
            float _294 = fma(_286, -0.82336294651031494140625, -5.674867153167724609375);
            float _296 = fma(_286, _294, -6.565555095672607421875);
            float _298 = 1.0 / _292;
            float _300 = _286 * _296;
            float _302 = abs(_158);
            float _304 = abs(_154);
            float _306 = _302 + _304;
            int _308 = as_type<int>(_154) & int(0x80000000);
            float _310 = _284 * _300;
            bool _312 = _306 > as_type<float>(0x7f800000u /* inf */);
            bool _314 = isnan(_306);
            bool _316 = _312 || _314;
            bool _318 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _320 = _316 || _318;
            float _322 = fma(_310, _298, _284);
            float _324 = _322;
            _210 = _306;
            if (_280)
            {
                float _326 = -_322;
                float _328 = _326 + 1.57079637050628662109375;
                _324 = _328;
            }
            float _330 = _324;
            int _332 = as_type<int>(_330);
            if (!_282)
            {
                float _334 = -_330;
                float _336 = _334 + 3.1415927410125732421875;
                _332 = as_type<int>(_336);
            }
            int _338 = _332;
            if (!_320)
            {
                int _340 = _308 | _338;
                _210 = as_type<float>(_340);
            }
        }
    }
    float _342 = _210;
    float _344 = _342 * 0.159154951572418212890625;
    float _346 = _101 * _93;
    float _348 = _101 * _99;
    float _350 = _141 + _85;
    float _352 = abs(_344);
    float _354 = _87 + _352;
    float _356 = _346 * _143;
    float _358 = _348 * _143;
    float _360 = _101 * _123;
    float _362 = _101 * _113;
    float2 _1053 = float2(_350, _354);
    float _364 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1053, float2(0.0), isnan(_1053))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1053, float2(0.0), isnan(_1053))).w;
    float2 _1063 = float2(_356, _358);
    float _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1063, float2(0.0), isnan(_1063))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1063, float2(0.0), isnan(_1063))).x;
    float2 _1071 = float2(_362, _360);
    float _368 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1071, float2(0.0), isnan(_1071))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1071, float2(0.0), isnan(_1071))).w;
    float _370 = in.m_39.z;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_45.w;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_47.w;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_49.x;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = _101 * _374;
    float _396 = _101 * _380;
    float _398 = _394 * _143;
    float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _402 = fma(_398, (*spvDescriptorSet0.fp_c8)._m0[30].w, _400);
    float _404 = 1.0 / _402;
    float _406 = in.m_47.y;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_47.z;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = _101 * _410;
    float _420 = _364 * _396;
    float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _424 = fma(_366, (*spvDescriptorSet0.fp_c8)._m0[30].w, _422);
    float _426 = precise::max(_420, 0.20000000298023223876953125);
    float _428 = 1.0 / _424;
    float _430 = precise::max(0.0, _368);
    float _432 = precise::min(_426, 0.5);
    float _434 = precise::min(_430, 0.800000011920928955078125);
    float _436 = fma(_432, 0.833333313465118408203125, -0.16666667163372039794921875);
    float _438 = fma(_434, 1.25, _436);
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _444 = _404 * _442;
    float _446 = _101 * _386;
    float _448 = fma(_396, 0.25, _440);
    float _450 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _452 = -_444;
    float _454 = fma(_428, _450, _452);
    float _456 = _446 * _448;
    float _458 = abs(_454);
    bool _460 = _458 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _462 = float(_460);
    float _464 = _101 * _392;
    float _466 = 0.0 + _456;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _468 * _462;
    float _472 = _470 * _464;
    bool _474 = _472 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _476 = isnan(_472);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _482 = _478 || _480;
    float _484 = in.m_51.x;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_51.y;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_51.z;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_47.x;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = _444;
    if (!_482)
    {
        discard_fragment();
    }
    float _510 = _101 * _488;
    float _512 = _101 * _494;
    float _514 = _101 * _500;
    float _516 = _101 * _506;
    float _518 = _101 * _416;
    float _520 = -_512;
    float _522 = _520 + _418;
    float _524 = -_510;
    float _526 = _524 + _516;
    float _528 = -_514;
    float _530 = _528 + _518;
    float _532 = fma(_440, _522, _512);
    float _534 = fma(_440, _526, _510);
    float _536 = fma(_440, _530, _514);
    if (!_482)
    {
        out.m_54.x = _534;
        out.m_54.y = _532;
        out.m_54.z = _536;
        out.m_54.w = _456;
        return out;
    }
    float _538 = _532 * 0.715200006961822509765625;
    float _540 = in.m_56.w;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_56.x;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_56.y;
    float _554 = gl_FragCoord.w;
    float _556 = _552 * _554;
    float _558 = fma(_534, 0.2125999927520751953125, _538);
    float _560 = in.m_56.z;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = fma(_536, 0.072200000286102294921875, _558);
    bool _568 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _570 = 1.0 / _566;
    if (_568)
    {
        float _572 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _574 = _444 + _572;
        _508 = _574;
    }
    float _576 = _508;
    float _578 = _570 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = fma(_580, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _584 = _101 * _544;
    float _586 = _582 * _584;
    float _588 = 0.0 + _472;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = _584;
    float _594 = _590;
    if (_568)
    {
        float _596 = _576 * 8.0;
        float _598 = precise::clamp(_596, 0.0, 1.0);
        _592 = _598;
    }
    float _600 = _592;
    float _602 = _101 * _550;
    float _604 = _101 * _556;
    float _606 = _101 * _564;
    if (_568)
    {
        float _608 = _590 * _600;
        _594 = _608;
    }
    float _610 = _594;
    float _612 = fma(_534, _586, _602);
    float _614 = fma(_532, _586, _604);
    float _616 = fma(_536, _586, _606);
    float _618 = 0.0 + _610;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    out.m_54.x = _612;
    out.m_54.y = _614;
    out.m_54.z = _616;
    out.m_54.w = _620;
    return out;
}

