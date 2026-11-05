#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_46 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float _75 = in.m_39.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _71 + (-0.5);
    float _83 = _73 + (-0.5);
    float _85 = abs(_81);
    float _87 = abs(_83);
    float _89 = precise::max(_85, _87);
    bool _93 = _89 >= 16.0;
    float _95 = _83 * _83;
    float _97 = _83;
    float _99 = _81;
    int _102 = 1031798784;
    float _104 = _95;
    if (_93)
    {
        float _106 = fma(_73, 0.0625, -0.03125);
        _97 = _106;
    }
    float _108 = _97;
    float _110 = fma(_81, _81, _95);
    if (_93)
    {
        float _112 = fma(_71, 0.0625, -0.03125);
        _99 = _112;
    }
    float _114 = _99;
    float _116 = abs(_108);
    bool _118 = _116 != 0.0;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    float _128 = abs(_114);
    bool _130 = _128 == 0.0;
    float _132 = sqrt(_110);
    float _134 = abs(_114);
    bool _136 = _134 == 0.0;
    bool _138 = !_126;
    bool _140 = _136 && _138;
    bool _142 = false;
    if (_140)
    {
        bool _144 = as_type<int>(_114) >= 0;
        _142 = _144;
    }
    bool _146 = _142;
    int _148 = _146 ? (-1) : 0;
    if (_140)
    {
        int _150 = _146 ? 0 : 1078530011;
        _102 = _150;
    }
    int _152 = _102;
    int _154 = _152;
    if (_140)
    {
        int _156 = int(0x80000000) & as_type<int>(_108);
        int _158 = _152 | _156;
        _104 = as_type<float>(_158);
    }
    float _160 = _104;
    bool _162 = !_126;
    bool _164 = _162 && _130;
    float _166 = _160;
    float _168 = _160;
    if (!_164)
    {
        float _170 = abs(_108);
        bool _172 = _170 != as_type<float>(0x7f800000u /* inf */);
        bool _174 = isnan(_170);
        bool _176 = _172 || _174;
        bool _178 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _180 = _176 || _178;
        float _182 = abs(_114);
        bool _184 = _182 == as_type<float>(0x7f800000u /* inf */);
        float _186 = abs(_114);
        bool _188 = _186 == as_type<float>(0x7f800000u /* inf */);
        bool _190 = !_180;
        bool _192 = _188 && _190;
        if (_192)
        {
            bool _194 = as_type<int>(_114) >= 0;
            _148 = _194 ? (-1) : 0;
        }
        int _196 = _148;
        if (_192)
        {
            _154 = 1075235812;
        }
        int _198 = _154;
        int _200 = _198;
        if (_192)
        {
            int _202 = ~_196;
            int _204 = (_202 != 0) ? _198 : 1061752795;
            _200 = _204;
        }
        int _206 = _200;
        if (_192)
        {
            int _208 = int(0x80000000) & as_type<int>(_108);
            int _210 = _206 | _208;
            _166 = as_type<float>(_210);
        }
        float _212 = _166;
        bool _214 = !_180;
        bool _216 = _214 && _184;
        _168 = _212;
        if (!_216)
        {
            float _218 = abs(_108);
            float _220 = abs(_114);
            float _222 = precise::max(_218, _220);
            float _224 = abs(_108);
            float _226 = abs(_114);
            float _228 = precise::min(_224, _226);
            float _230 = 1.0 / _222;
            float _232 = abs(_108);
            float _234 = abs(_114);
            bool _236 = _232 > _234;
            bool _238 = as_type<int>(_114) >= 0;
            float _240 = _228 * _230;
            float _242 = _240 * _240;
            float _244 = _242 + 11.33538818359375;
            float _246 = fma(_242, _244, 28.84246826171875);
            float _248 = fma(_242, _246, 19.6966705322265625);
            float _250 = fma(_242, -0.82336294651031494140625, -5.674867153167724609375);
            float _252 = fma(_242, _250, -6.565555095672607421875);
            float _254 = 1.0 / _248;
            float _256 = _242 * _252;
            float _258 = abs(_108);
            float _260 = abs(_114);
            float _262 = _258 + _260;
            int _264 = as_type<int>(_108) & int(0x80000000);
            float _266 = _240 * _256;
            bool _268 = _262 > as_type<float>(0x7f800000u /* inf */);
            bool _270 = isnan(_262);
            bool _272 = _268 || _270;
            bool _274 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _276 = _272 || _274;
            float _278 = fma(_266, _254, _240);
            float _280 = _278;
            _168 = _262;
            if (_236)
            {
                float _282 = -_278;
                float _284 = _282 + 1.57079637050628662109375;
                _280 = _284;
            }
            float _286 = _280;
            int _288 = as_type<int>(_286);
            if (!_238)
            {
                float _290 = -_286;
                float _292 = _290 + 3.1415927410125732421875;
                _288 = as_type<int>(_292);
            }
            int _294 = _288;
            if (!_276)
            {
                int _296 = _264 | _294;
                _168 = as_type<float>(_296);
            }
        }
    }
    float _298 = _168;
    float _300 = _298 * 600.0;
    float _302 = in.m_41.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = _300 * 0.15915493667125701904296875;
    float _310 = precise::max(_132, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _312 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _314 = spvFAdd(_312, 0.7071068286895751953125);
    float _316 = _69 * _79;
    float _318 = precise::min(_310, 0.7071068286895751953125);
    float _320 = _308 * 6.283185482025146484375;
    float _322 = sin(_320);
    float _324 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _326 = _318 + _324;
    float _328 = 1.0 / _314;
    float _330 = fma(_322, 0.012500000186264514923095703125, 0.5);
    float _332 = precise::max(_330, 0.4000000059604644775390625);
    float _334 = _326 * _328;
    float _336 = precise::min(_332, 0.5);
    float _338 = _334 * _334;
    float _340 = _316 * _338;
    float _342 = fma(_336, 10.00000095367431640625, -4.000000476837158203125);
    float _344 = _69 * _306;
    float _346 = _342 * _340;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _348 * _344;
    bool _352 = _350 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _354 = isnan(_350);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _360 = _356 || _358;
    float _362 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.33333337306976318359375, _132);
    if (!_360)
    {
        discard_fragment();
    }
    float _364 = fma(_322, 0.02500000037252902984619140625, _362);
    float _366 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.004166667349636554718017578125;
    float _368 = _298 * 3.819718837738037109375;
    float _370 = _364 * 0.00999999977648258209228515625;
    float _372 = -_366;
    float _374 = fma(_298, 0.6366198062896728515625, _372);
    float2 _1017 = float2(_368, _370);
    float _376 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1017, float2(0.0), isnan(_1017))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1017, float2(0.0), isnan(_1017))).x;
    float _378 = _132 + _374;
    float2 _1030 = float2(_132, _378);
    float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1030, float2(0.0), isnan(_1030))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1030, float2(0.0), isnan(_1030))).xyz;
    float _384 = _382.x;
    float _386 = _382.y;
    float _388 = _382.z;
    float _390 = in.m_39.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_39.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_39.z;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = _342 * _342;
    float _410 = _69 * _406;
    float _412 = _376 * _376;
    float _414 = _69 * _394;
    float _416 = _412 * _408;
    float _418 = _386 * _416;
    float _420 = _384 * _416;
    float _422 = _388 * _416;
    float _424 = _69 * _400;
    float _426 = _420 * _414;
    float _428 = _422 * _410;
    float _430 = _418 * _424;
    if (!_360)
    {
        out.m_44.x = _426;
        out.m_44.y = _430;
        out.m_44.z = _428;
        out.m_44.w = _348;
        return out;
    }
    float _432 = _430 * 0.715200006961822509765625;
    float _434 = in.m_46.w;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_46.z;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_46.x;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = fma(_426, 0.2125999927520751953125, _432);
    float _454 = in.m_46.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = fma(_428, 0.072200000286102294921875, _452);
    bool _462 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _464 = 0.0 + _350;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = 1.0 / _460;
    float _470 = _468 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = _69 * _438;
    float _476 = fma(_472, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _478 = _69 * _444;
    float _480 = _69 * _450;
    float _482 = _476 * _474;
    float _484 = _69 * _458;
    float _486 = fma(_428, _482, _478);
    float _488 = fma(_426, _482, _480);
    float _490 = fma(_430, _482, _484);
    float _492 = _478;
    if (!_462)
    {
        _492 = _466;
    }
    float _494 = _492;
    bool _496 = !_462;
    float _498 = _494;
    if (!_496)
    {
        float _500 = in.m_48.w;
        float _502 = gl_FragCoord.w;
        float _504 = _500 * _502;
        float _506 = in.m_48.z;
        float _508 = gl_FragCoord.w;
        float _510 = _506 * _508;
        float _512 = _69 * _504;
        float _514 = _69 * _510;
        float _516 = 1.0 / _512;
        float _518 = _514 * _516;
        float _520 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _522 = fma(_518, (*spvDescriptorSet0.fp_c8)._m0[30].w, _520);
        float _524 = 1.0 / _522;
        float _526 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _528 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _530 = fma(_524, _526, _528);
        float _532 = _530 * 8.0;
        float _534 = precise::clamp(_532, 0.0, 1.0);
        float _536 = _466 * _534;
        _498 = _536;
    }
    float _538 = _498;
    float _540 = 0.0 + _538;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    out.m_44.x = _488;
    out.m_44.y = _490;
    out.m_44.z = _486;
    out.m_44.w = _542;
    return out;
}

