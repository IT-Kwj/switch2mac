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
    float4 m_46 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_37.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float _73 = in.m_39.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _69 + (-0.5);
    float _81 = _71 + (-0.5);
    float _83 = abs(_79);
    float _85 = abs(_81);
    float _87 = precise::max(_83, _85);
    bool _91 = _87 >= 16.0;
    float _93 = _81 * _81;
    float _95 = _81;
    float _97 = _79;
    int _100 = 1031798784;
    float _102 = _93;
    if (_91)
    {
        float _104 = fma(_71, 0.0625, -0.03125);
        _95 = _104;
    }
    float _106 = _95;
    float _108 = fma(_79, _79, _93);
    if (_91)
    {
        float _110 = fma(_69, 0.0625, -0.03125);
        _97 = _110;
    }
    float _112 = _97;
    float _114 = abs(_106);
    bool _116 = _114 != 0.0;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan(0.0);
    bool _124 = _120 || _122;
    float _126 = abs(_112);
    bool _128 = _126 == 0.0;
    float _130 = sqrt(_108);
    float _132 = abs(_112);
    bool _134 = _132 == 0.0;
    bool _136 = !_124;
    bool _138 = _134 && _136;
    bool _140 = false;
    if (_138)
    {
        bool _142 = as_type<int>(_112) >= 0;
        _140 = _142;
    }
    bool _144 = _140;
    int _146 = _144 ? (-1) : 0;
    if (_138)
    {
        int _148 = _144 ? 0 : 1078530011;
        _100 = _148;
    }
    int _150 = _100;
    int _152 = _150;
    if (_138)
    {
        int _154 = int(0x80000000) & as_type<int>(_106);
        int _156 = _150 | _154;
        _102 = as_type<float>(_156);
    }
    float _158 = _102;
    bool _160 = !_124;
    bool _162 = _160 && _128;
    float _164 = _158;
    float _166 = _158;
    if (!_162)
    {
        float _168 = abs(_106);
        bool _170 = _168 != as_type<float>(0x7f800000u /* inf */);
        bool _172 = isnan(_168);
        bool _174 = _170 || _172;
        bool _176 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _178 = _174 || _176;
        float _180 = abs(_112);
        bool _182 = _180 == as_type<float>(0x7f800000u /* inf */);
        float _184 = abs(_112);
        bool _186 = _184 == as_type<float>(0x7f800000u /* inf */);
        bool _188 = !_178;
        bool _190 = _186 && _188;
        if (_190)
        {
            bool _192 = as_type<int>(_112) >= 0;
            _146 = _192 ? (-1) : 0;
        }
        int _194 = _146;
        if (_190)
        {
            _152 = 1075235812;
        }
        int _196 = _152;
        int _198 = _196;
        if (_190)
        {
            int _200 = ~_194;
            int _202 = (_200 != 0) ? _196 : 1061752795;
            _198 = _202;
        }
        int _204 = _198;
        if (_190)
        {
            int _206 = int(0x80000000) & as_type<int>(_106);
            int _208 = _204 | _206;
            _164 = as_type<float>(_208);
        }
        float _210 = _164;
        bool _212 = !_178;
        bool _214 = _212 && _182;
        _166 = _210;
        if (!_214)
        {
            float _216 = abs(_106);
            float _218 = abs(_112);
            float _220 = precise::max(_216, _218);
            float _222 = abs(_106);
            float _224 = abs(_112);
            float _226 = precise::min(_222, _224);
            float _228 = 1.0 / _220;
            float _230 = abs(_106);
            float _232 = abs(_112);
            bool _234 = _230 > _232;
            bool _236 = as_type<int>(_112) >= 0;
            float _238 = _226 * _228;
            float _240 = _238 * _238;
            float _242 = _240 + 11.33538818359375;
            float _244 = fma(_240, _242, 28.84246826171875);
            float _246 = fma(_240, _244, 19.6966705322265625);
            float _248 = fma(_240, -0.82336294651031494140625, -5.674867153167724609375);
            float _250 = fma(_240, _248, -6.565555095672607421875);
            float _252 = 1.0 / _246;
            float _254 = _240 * _250;
            float _256 = abs(_106);
            float _258 = abs(_112);
            float _260 = _256 + _258;
            int _262 = as_type<int>(_106) & int(0x80000000);
            float _264 = _238 * _254;
            bool _266 = _260 > as_type<float>(0x7f800000u /* inf */);
            bool _268 = isnan(_260);
            bool _270 = _266 || _268;
            bool _272 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _274 = _270 || _272;
            float _276 = fma(_264, _252, _238);
            float _278 = _276;
            _166 = _260;
            if (_234)
            {
                float _280 = -_276;
                float _282 = _280 + 1.57079637050628662109375;
                _278 = _282;
            }
            float _284 = _278;
            int _286 = as_type<int>(_284);
            if (!_236)
            {
                float _288 = -_284;
                float _290 = _288 + 3.1415927410125732421875;
                _286 = as_type<int>(_290);
            }
            int _292 = _286;
            if (!_274)
            {
                int _294 = _262 | _292;
                _166 = as_type<float>(_294);
            }
        }
    }
    float _296 = _166;
    float _298 = _296 * 600.0;
    float _300 = in.m_41.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _298 * 0.15915493667125701904296875;
    float _308 = precise::max(_130, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _310 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _312 = spvFAdd(_310, 0.7071068286895751953125);
    float _314 = _67 * _77;
    float _316 = precise::min(_308, 0.7071068286895751953125);
    float _318 = _306 * 6.283185482025146484375;
    float _320 = sin(_318);
    float _322 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _324 = _316 + _322;
    float _326 = 1.0 / _312;
    float _328 = fma(_320, 0.012500000186264514923095703125, 0.5);
    float _330 = precise::max(_328, 0.4000000059604644775390625);
    float _332 = _324 * _326;
    float _334 = precise::min(_330, 0.5);
    float _336 = _332 * _332;
    float _338 = _314 * _336;
    float _340 = fma(_334, 10.00000095367431640625, -4.000000476837158203125);
    float _342 = _67 * _304;
    float _344 = _340 * _338;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = _346 * _342;
    bool _350 = _348 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _352 = isnan(_348);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _358 = _354 || _356;
    float _360 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.33333337306976318359375, _130);
    if (!_358)
    {
        discard_fragment();
    }
    float _362 = fma(_320, 0.02500000037252902984619140625, _360);
    float _364 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.004166667349636554718017578125;
    float _366 = _296 * 3.819718837738037109375;
    float _368 = _362 * 0.00999999977648258209228515625;
    float _370 = -_364;
    float _372 = fma(_296, 0.6366198062896728515625, _370);
    float2 _981 = float2(_366, _368);
    float _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_981, float2(0.0), isnan(_981))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_981, float2(0.0), isnan(_981))).x;
    float _376 = _130 + _372;
    float2 _994 = float2(_130, _376);
    float3 _380 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_994, float2(0.0), isnan(_994))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_994, float2(0.0), isnan(_994))).xyz;
    float _382 = _380.x;
    float _384 = _380.y;
    float _386 = _380.z;
    float _388 = in.m_39.x;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_39.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_39.z;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = _340 * _340;
    float _408 = _67 * _404;
    float _410 = _374 * _374;
    float _412 = _67 * _392;
    float _414 = _410 * _406;
    float _416 = _384 * _414;
    float _418 = _382 * _414;
    float _420 = _386 * _414;
    float _422 = _67 * _398;
    float _424 = _418 * _412;
    float _426 = _420 * _408;
    float _428 = _416 * _422;
    if (!_358)
    {
        out.m_44.x = _424;
        out.m_44.y = _428;
        out.m_44.z = _426;
        out.m_44.w = _346;
        return out;
    }
    float _430 = _428 * 0.715200006961822509765625;
    float _432 = fma(_424, 0.2125999927520751953125, _430);
    bool _434 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _436 = fma(_426, 0.072200000286102294921875, _432);
    float _438 = 1.0 / _436;
    float _440 = _438 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = fma(_442, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _446 = 0.0 + _348;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _424 * _444;
    float _452 = _428 * _444;
    float _454 = _426 * _444;
    float _456 = _444;
    if (!_434)
    {
        _456 = _448;
    }
    float _458 = _456;
    bool _460 = !_434;
    float _462 = _458;
    if (!_460)
    {
        float _464 = in.m_46.w;
        float _466 = gl_FragCoord.w;
        float _468 = _464 * _466;
        float _470 = in.m_46.z;
        float _472 = gl_FragCoord.w;
        float _474 = _470 * _472;
        float _476 = _67 * _468;
        float _478 = _67 * _474;
        float _480 = 1.0 / _476;
        float _482 = _478 * _480;
        float _484 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _486 = fma(_482, (*spvDescriptorSet0.fp_c8)._m0[30].w, _484);
        float _488 = 1.0 / _486;
        float _490 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _492 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _494 = fma(_488, _490, _492);
        float _496 = _494 * 8.0;
        float _498 = precise::clamp(_496, 0.0, 1.0);
        float _500 = _448 * _498;
        _462 = _500;
    }
    float _502 = _462;
    float _504 = 0.0 + _502;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    out.m_44.x = _450;
    out.m_44.y = _452;
    out.m_44.z = _454;
    out.m_44.w = _506;
    return out;
}

