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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_43 [[user(locn2), flat]];
    float4 m_50 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _534 = float2(_73, _75);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_534, float2(0.0), isnan(_534))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = in.m_39.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _71 * _91;
    float _101 = -_99;
    float _103 = _101 + 1.0;
    float _105 = in.m_43.z;
    float _107 = in.m_37.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = precise::max(_81, _83);
    float _115 = 0.0 + _113;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = precise::max(_103, _117);
    float _121 = precise::min(_119, 1.0);
    float _123 = -_103;
    float _125 = _123 + _121;
    float _127 = _71 * _97;
    float _129 = precise::max(_85, _125);
    float _131 = 0.0 + _129;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _133 * _127;
    bool _139 = _135 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _141 = isnan(_135);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _147 = _143 || _145;
    float _149 = in.m_43.x;
    float _151 = _149;
    float _153 = _105;
    if (!_147)
    {
        discard_fragment();
    }
    float _155 = abs(_149);
    float _157 = abs(_105);
    float _159 = precise::max(_155, _157);
    bool _161 = _159 >= 16.0;
    int _164 = as_type<int>(_159);
    if (_161)
    {
        float _166 = _149 * 0.0625;
        _151 = _166;
    }
    float _168 = _151;
    if (_161)
    {
        float _170 = _105 * 0.0625;
        _153 = _170;
    }
    float _172 = _153;
    float _174 = abs(_168);
    bool _176 = _174 != 0.0;
    bool _178 = isnan(_174);
    bool _180 = _176 || _178;
    bool _182 = isnan(0.0);
    bool _184 = _180 || _182;
    float _186 = abs(_172);
    bool _188 = _186 == 0.0;
    float _190 = abs(_172);
    bool _192 = _190 == 0.0;
    bool _194 = !_184;
    bool _196 = _192 && _194;
    bool _198 = false;
    if (_196)
    {
        bool _200 = as_type<int>(_172) >= 0;
        _198 = _200;
    }
    bool _202 = _198;
    int _204 = _202 ? (-1) : 0;
    if (_196)
    {
        int _206 = _202 ? 0 : 1078530011;
        _164 = _206;
    }
    int _208 = _164;
    int _210 = _208;
    if (_196)
    {
        int _212 = int(0x80000000) & as_type<int>(_168);
        int _214 = _208 | _212;
        _210 = _214;
    }
    int _216 = _210;
    bool _218 = !_184;
    bool _220 = _218 && _188;
    int _222 = _216;
    float _224 = as_type<float>(_216);
    if (!_220)
    {
        float _226 = abs(_168);
        bool _228 = _226 != as_type<float>(0x7f800000u /* inf */);
        bool _230 = isnan(_226);
        bool _232 = _228 || _230;
        bool _234 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _236 = _232 || _234;
        float _238 = abs(_172);
        bool _240 = _238 == as_type<float>(0x7f800000u /* inf */);
        float _242 = abs(_172);
        bool _244 = _242 == as_type<float>(0x7f800000u /* inf */);
        bool _246 = !_236;
        bool _248 = _244 && _246;
        if (_248)
        {
            bool _250 = as_type<int>(_172) >= 0;
            _204 = _250 ? (-1) : 0;
        }
        int _252 = _204;
        if (_248)
        {
            _222 = 1075235812;
        }
        int _254 = _222;
        int _256 = _254;
        if (_248)
        {
            int _258 = ~_252;
            int _260 = (_258 != 0) ? _254 : 1061752795;
            _256 = _260;
        }
        int _262 = _256;
        float _264 = as_type<float>(_262);
        if (_248)
        {
            int _266 = int(0x80000000) & as_type<int>(_168);
            int _268 = _262 | _266;
            _264 = as_type<float>(_268);
        }
        float _270 = _264;
        bool _272 = !_236;
        bool _274 = _272 && _240;
        _224 = _270;
        if (!_274)
        {
            float _276 = abs(_168);
            float _278 = abs(_172);
            float _280 = precise::max(_276, _278);
            float _282 = abs(_168);
            float _284 = abs(_172);
            float _286 = precise::min(_282, _284);
            float _288 = 1.0 / _280;
            float _290 = abs(_168);
            float _292 = abs(_172);
            bool _294 = _290 > _292;
            bool _296 = as_type<int>(_172) >= 0;
            float _298 = abs(_168);
            float _300 = abs(_172);
            float _302 = _298 + _300;
            int _304 = as_type<int>(_168) & int(0x80000000);
            bool _306 = _302 > as_type<float>(0x7f800000u /* inf */);
            bool _308 = isnan(_302);
            bool _310 = _306 || _308;
            bool _312 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _314 = _310 || _312;
            float _316 = _286 * _288;
            float _318 = _316 * _316;
            float _320 = _318 + 11.33538818359375;
            float _322 = fma(_318, _320, 28.84246826171875);
            float _324 = fma(_318, _322, 19.6966705322265625);
            float _326 = fma(_318, -0.82336294651031494140625, -5.674867153167724609375);
            float _328 = fma(_318, _326, -6.565555095672607421875);
            float _330 = 1.0 / _324;
            float _332 = _318 * _328;
            float _334 = _316 * _332;
            float _336 = fma(_334, _330, _316);
            float _338 = _336;
            _224 = _302;
            if (_294)
            {
                float _340 = -_336;
                float _342 = _340 + 1.57079637050628662109375;
                _338 = _342;
            }
            float _344 = _338;
            int _346 = as_type<int>(_344);
            if (!_296)
            {
                float _348 = -_344;
                float _350 = _348 + 3.1415927410125732421875;
                _346 = as_type<int>(_350);
            }
            int _352 = _346;
            if (!_314)
            {
                int _354 = _304 | _352;
                _224 = as_type<float>(_354);
            }
        }
    }
    float _356 = _224;
    float _358 = _356 * 0.3183098733425140380859375;
    float _360 = _71 * _111;
    float _362 = abs(_358);
    float _364 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.001000000047497451305389404296875, _362);
    float2 _947 = float2(_360, _364);
    float3 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_947, float2(0.0), isnan(_947))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_947, float2(0.0), isnan(_947))).xyz;
    float _368 = _366.x;
    float _370 = _366.y;
    float _372 = _366.z;
    float _374 = in.m_45.w;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = _103 * _85;
    float _382 = _129 * _129;
    float _384 = _71 * _378;
    float _386 = _370 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _388 = _368 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _390 = _372 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _392 = -_386;
    float _394 = _392 + 1.0;
    float _396 = -_388;
    float _398 = _396 + 1.0;
    float _400 = -_390;
    float _402 = _400 + 1.0;
    float _404 = fma(_382, _394, _386);
    float _406 = fma(_382, _398, _388);
    float _408 = fma(_382, _402, _390);
    float _410 = _380 * 10.0;
    float _412 = _404 * _384;
    float _414 = _406 * _384;
    float _416 = _408 * _384;
    float _418 = fma(_370, _410, _412);
    float _420 = fma(_368, _410, _414);
    float _422 = fma(_372, _410, _416);
    if (!_147)
    {
        out.m_48.x = _420;
        out.m_48.y = _418;
        out.m_48.z = _422;
        out.m_48.w = _129;
        return out;
    }
    float _424 = _418 * 0.715200006961822509765625;
    float _426 = 0.0 + _135;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = fma(_420, 0.2125999927520751953125, _424);
    bool _432 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _434 = fma(_422, 0.072200000286102294921875, _430);
    float _436 = 1.0 / _434;
    float _438 = _436 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = fma(_440, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _444 = _420 * _442;
    float _446 = _418 * _442;
    float _448 = _422 * _442;
    float _450 = _442;
    if (!_432)
    {
        _450 = _428;
    }
    float _452 = _450;
    bool _454 = !_432;
    float _456 = _452;
    if (!_454)
    {
        float _458 = in.m_50.w;
        float _460 = gl_FragCoord.w;
        float _462 = _458 * _460;
        float _464 = in.m_50.z;
        float _466 = gl_FragCoord.w;
        float _468 = _464 * _466;
        float _470 = _71 * _462;
        float _472 = _71 * _468;
        float _474 = 1.0 / _470;
        float _476 = _472 * _474;
        float _478 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _480 = fma(_476, (*spvDescriptorSet0.fp_c8)._m0[30].w, _478);
        float _482 = 1.0 / _480;
        float _484 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _486 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _488 = fma(_482, _484, _486);
        float _490 = _488 * 8.0;
        float _492 = precise::clamp(_490, 0.0, 1.0);
        float _494 = _428 * _492;
        _456 = _494;
    }
    float _496 = _456;
    float _498 = 0.0 + _496;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    out.m_48.x = _444;
    out.m_48.y = _446;
    out.m_48.z = _448;
    out.m_48.w = _500;
    return out;
}

