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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texturecube<float> fp_t_tcb_1E [[id(4)]];
    sampler fp_t_tcb_1ESmplr [[id(5)]];
    sampler fp_t_tcb_1ESmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_33.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _63;
    float _85 = _83 * _69;
    float _87 = _83 * _75;
    float _89 = _83 * _81;
    float _91 = _85 * _87;
    float _93 = 0.0 + _91;
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = _95 * _89;
    bool _100 = _97 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _102 = isnan(_97);
    bool _104 = _100 || _102;
    bool _106 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _108 = _104 || _106;
    float _110 = in.m_33.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_33.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_35.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_33.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_35.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_35.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    if (!_108)
    {
        discard_fragment();
    }
    float _146 = _83 * _114;
    float _148 = _83 * _120;
    float _150 = _83 * _126;
    float _152 = _83 * _132;
    float _154 = _83 * _138;
    float _156 = _83 * _144;
    float _158 = _146 * _150;
    float _160 = _152 * _154;
    float _162 = _148 * _156;
    if (!_108)
    {
        out.m_40.x = _158;
        out.m_40.y = _160;
        out.m_40.z = _162;
        out.m_40.w = _91;
        return out;
    }
    float _164 = in.m_42.w;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _83 * _168;
    bool _172 = _170 != 1.0;
    bool _174 = isnan(_170);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    bool _182 = !_180;
    if (!_182)
    {
        float _184 = gl_FragCoord.x;
        float _186 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _188 = _184 / _186;
        float _190 = gl_FragCoord.y;
        float _192 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _194 = _190 / _192;
        float _196 = _170 * 256.0;
        float _198 = trunc(_196);
        int _201 = int(_198);
        uint _204 = uint(int(uint(_201) >> uint(7)));
        int _206 = int(_204) + _201;
        float _208 = trunc(_188);
        int _210 = int(_208);
        float _212 = trunc(_194);
        int _214 = int(_212);
        int _216 = _210 + 2;
        int _218 = _216 >> 1;
        uint _220 = uint(int(uint(_214) >> uint(1)));
        int _222 = _218 ^ int(_220);
        int _224 = _222 << 16;
        int _226 = _224 ^ _218;
        int _228 = 983055 & _226;
        int _230 = _228 << 6;
        int _232 = _230 + _228;
        int _234 = _232 & 13369548;
        uint _236 = uint(int(uint(_234) >> uint(3)));
        int _238 = _234 | int(_236);
        int _240 = _238 & 5570560;
        int _242 = _238 & 85;
        uint _244 = uint(int(uint(_240) >> uint(15)));
        int _246 = int(_244) + _242;
        bool _248 = uint(_206) > uint(_246);
        if (!_248)
        {
            discard_fragment();
        }
        if (!_248)
        {
            out.m_40.x = _158;
            out.m_40.y = _160;
            out.m_40.z = _162;
            out.m_40.w = _97;
            return out;
        }
    }
    float _250 = in.m_44.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _258 = in.m_44.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_44.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_42.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = _83 * _254;
    bool _278 = as_type<int>(_256) != 0;
    float _280 = _83 * _262;
    bool _282 = !_278;
    float _284 = -_276;
    float _286 = _282 ? _284 : _276;
    float _288 = _83 * _268;
    bool _290 = !_278;
    float _292 = -_280;
    float _294 = _290 ? _292 : _280;
    float _296 = _286 * _286;
    bool _298 = !_278;
    float _300 = -_288;
    float _302 = _298 ? _300 : _288;
    float _304 = fma(_294, _294, _296);
    float _306 = fma(_302, _302, _304);
    float _308 = rsqrt(_306);
    float _310 = _294 * _308;
    float _312 = _286 * _308;
    float _314 = _302 * _308;
    float _316 = _83 * _274;
    float _318 = abs(_310);
    float _320 = abs(_312);
    float _322 = precise::max(_318, _320);
    float _324 = abs(_314);
    float _326 = precise::max(_324, _322);
    float _328 = 1.0 / _326;
    float _330 = _310 * _328;
    float _332 = -_328;
    float _334 = _314 * _332;
    float _336 = precise::min(_316, 1.0);
    float _338 = _312 * _328;
    float3 _926 = float3(_330, _338, _334);
    float3 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_926, float3(0.0), isnan(_926)), level(_336)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_926, float3(0.0), isnan(_926)), level(_336)).xyz;
    float _344 = _342.x;
    float _346 = _342.y;
    float _348 = _342.z;
    float _350 = in.m_50.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_50.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_50.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_52.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_52.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_52.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_54.x;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_54.w;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_54.y;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_54.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _83 * _354;
    float _412 = _83 * _360;
    float _414 = _83 * _366;
    bool _416 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _418 = _83 * _396;
    float _420 = fma(_348, 0.20999999344348907470703125, _412);
    float _422 = fma(_344, 0.20999999344348907470703125, _414);
    float _424 = _83 * _372;
    float _426 = fma(_346, 0.20999999344348907470703125, _410);
    float _428 = _83 * _378;
    float _430 = _83 * _384;
    float _432 = _420 + _424;
    float _434 = _422 + _428;
    float _436 = _426 + _430;
    float _438 = _162 * _432;
    float _440 = 0.0 + _97;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _158 * _434;
    float _446 = _83 * _390;
    float _448 = _160 * _436;
    float _450 = _83 * _402;
    float _452 = _83 * _408;
    float _454 = fma(_444, _418, _446);
    float _456 = _446;
    if (!_416)
    {
        _456 = _442;
    }
    float _458 = _456;
    float _460 = fma(_448, _418, _450);
    float _462 = fma(_438, _418, _452);
    bool _464 = !_416;
    float _466 = _458;
    if (!_464)
    {
        float _468 = in.m_56.w;
        float _470 = gl_FragCoord.w;
        float _472 = _468 * _470;
        float _474 = in.m_56.z;
        float _476 = gl_FragCoord.w;
        float _478 = _474 * _476;
        float _480 = _83 * _472;
        float _482 = _83 * _478;
        float _484 = 1.0 / _480;
        float _486 = _482 * _484;
        float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _490 = fma(_486, (*spvDescriptorSet0.fp_c8)._m0[30].w, _488);
        float _492 = 1.0 / _490;
        float _494 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _496 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _498 = fma(_492, _494, _496);
        float _500 = _498 * 8.0;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = _442 * _502;
        _466 = _504;
    }
    float _506 = _466;
    float _508 = 0.0 + _506;
    float _510 = precise::clamp(_508, 0.0, 1.0);
    out.m_40.x = _454;
    out.m_40.y = _460;
    out.m_40.z = _462;
    out.m_40.w = _510;
    return out;
}

