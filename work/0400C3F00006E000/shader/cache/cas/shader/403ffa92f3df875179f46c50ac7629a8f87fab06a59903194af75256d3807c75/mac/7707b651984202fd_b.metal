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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _617 = float2(_88, _86);
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_617, float2(0.0), isnan(_617))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_617, float2(0.0), isnan(_617))).w;
    float _92 = in.m_40.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_40.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _84 * _96;
    float _106 = _84 * _102;
    float _108 = fma(_90, (*spvDescriptorSet0.fp_c9)._m0[191].x, _106);
    float _110 = fma(_90, (*spvDescriptorSet0.fp_c9)._m0[191].x, _104);
    float2 _663 = float2(_110, _108);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).w;
    float _114 = in.m_42.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_44.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_46.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = _84 * _118;
    float _134 = _84 * _124;
    float _136 = -_132;
    float _138 = _136 + 1.0;
    float _140 = -_138;
    float _142 = fma(_112, _134, _140);
    float _144 = _84 * _130;
    float _146 = _142 * 100.00009918212890625;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = fma(_148, -2.0, 3.0);
    float _152 = _148 * _148;
    float _154 = _150 * _152;
    float _156 = 0.0 + _154;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * _144;
    bool _164 = _160 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _172 = _168 || _170;
    if (!_172)
    {
        discard_fragment();
    }
    if (!_172)
    {
        out.m_49.x = 0.006000000052154064178466796875;
        out.m_49.y = 0.00200000009499490261077880859375;
        out.m_49.z = 0.001000000047497451305389404296875;
        out.m_49.w = _154;
        return out;
    }
    float _174 = in.m_51.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _84 * _178;
    bool _182 = _180 != 1.0;
    bool _184 = isnan(_180);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    bool _192 = !_190;
    if (!_192)
    {
        float _194 = gl_FragCoord.x;
        float _196 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _198 = _194 / _196;
        float _200 = gl_FragCoord.y;
        float _202 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _204 = _200 / _202;
        float _206 = _180 * 256.0;
        float _208 = trunc(_206);
        int _211 = int(_208);
        float _213 = trunc(_198);
        int _215 = int(_213);
        float _217 = trunc(_204);
        int _219 = int(_217);
        int _221 = _215 + 2;
        int _223 = _221 >> 1;
        uint _226 = uint(int(uint(_219) >> uint(1)));
        int _228 = _223 ^ int(_226);
        int _230 = _228 << 16;
        int _232 = _230 ^ _223;
        int _234 = 983055 & _232;
        int _236 = _234 << 6;
        int _238 = _236 + _234;
        int _240 = _238 & 13369548;
        uint _242 = uint(int(uint(_240) >> uint(3)));
        int _244 = _240 | int(_242);
        uint _246 = uint(int(uint(_211) >> uint(7)));
        int _248 = int(_246) + _211;
        int _250 = _244 & 5570560;
        int _252 = _244 & 85;
        uint _254 = uint(int(uint(_250) >> uint(15)));
        int _256 = int(_254) + _252;
        bool _258 = uint(_248) > uint(_256);
        if (!_258)
        {
            discard_fragment();
        }
        if (!_258)
        {
            out.m_49.x = 0.006000000052154064178466796875;
            out.m_49.y = 0.00200000009499490261077880859375;
            out.m_49.z = 0.001000000047497451305389404296875;
            out.m_49.w = _160;
            return out;
        }
    }
    float _260 = in.m_53.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_53.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_53.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _84 * _264;
    float _280 = _84 * _270;
    float _282 = _84 * _276;
    float _284 = _278 * _278;
    float _286 = fma(_280, _280, _284);
    float _288 = fma(_282, _282, _286);
    float _290 = rsqrt(_288);
    float _292 = _280 * _290;
    float _294 = _278 * _290;
    float _296 = _282 * _290;
    float _298 = abs(_292);
    float _300 = abs(_294);
    float _302 = precise::max(_298, _300);
    float _304 = abs(_296);
    float _306 = precise::max(_304, _302);
    float _308 = 1.0 / _306;
    float _310 = -_308;
    float _312 = _296 * _310;
    float _314 = _292 * _308;
    float _316 = _294 * _308;
    float3 _977 = float3(_314, _316, _312);
    float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_977, float3(0.0), isnan(_977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_977, float3(0.0), isnan(_977)), level(0.0)).xyz;
    float _322 = _320.x;
    float _324 = _320.y;
    float _326 = _320.z;
    float _328 = in.m_42.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_55.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_42.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_55.x;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_42.z;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_55.z;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = _142 * 3.3333339691162109375;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = in.m_57.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_57.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_57.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = fma(_366, -2.0, 3.0);
    float _388 = _366 * _366;
    float _390 = _386 * _388;
    float _392 = _84 * _332;
    float _394 = _84 * _338;
    float _396 = _84 * _344;
    float _398 = _84 * _350;
    float _400 = _84 * _356;
    float _402 = -_394;
    float _404 = _392 + _402;
    float _406 = _84 * _362;
    float _408 = -_398;
    float _410 = _396 + _408;
    float _412 = in.m_59.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = fma(_390, _404, _394);
    float _420 = -_406;
    float _422 = _400 + _420;
    float _424 = fma(_390, _410, _398);
    float _426 = in.m_59.z;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = _418 * 0.715200006961822509765625;
    float _434 = fma(_390, _422, _406);
    float _436 = in.m_59.y;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = in.m_61.w;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = fma(_424, 0.2125999927520751953125, _432);
    float _450 = in.m_61.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_61.y;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = fma(_434, 0.072200000286102294921875, _448);
    float _464 = in.m_61.z;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = 1.0 / _462;
    float _472 = _470 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    float _476 = fma(_474, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _478 = _84 * _416;
    float _480 = _84 * _430;
    float _482 = _84 * _440;
    float _484 = _424 * _476;
    float _486 = _418 * _476;
    float _488 = _434 * _476;
    float _490 = _84 * _384;
    float _492 = _84 * _446;
    float _494 = _84 * _468;
    bool _496 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _498 = _84 * _454;
    float _500 = fma(_326, 0.20999999344348907470703125, _480);
    float _502 = fma(_322, 0.20999999344348907470703125, _478);
    float _504 = _84 * _372;
    float _506 = fma(_324, 0.20999999344348907470703125, _482);
    float _508 = _84 * _378;
    float _510 = _500 + _504;
    float _512 = _506 + _490;
    float _514 = _502 + _508;
    float _516 = 0.0 + _160;
    float _518 = precise::clamp(_516, 0.0, 1.0);
    float _520 = fma(_510, 0.001000000047497451305389404296875, _488);
    float _522 = fma(_512, 0.00200000009499490261077880859375, _486);
    float _524 = fma(_514, 0.006000000052154064178466796875, _484);
    float _526 = _84 * _460;
    float _528 = fma(_520, _492, _494);
    float _530 = _494;
    if (!_496)
    {
        _530 = _518;
    }
    float _532 = _530;
    float _534 = fma(_524, _492, _498);
    float _536 = fma(_522, _492, _526);
    bool _538 = !_496;
    float _540 = _532;
    if (!_538)
    {
        float _542 = in.m_63.w;
        float _544 = gl_FragCoord.w;
        float _546 = _542 * _544;
        float _548 = in.m_63.z;
        float _550 = gl_FragCoord.w;
        float _552 = _548 * _550;
        float _554 = _84 * _546;
        float _556 = _84 * _552;
        float _558 = 1.0 / _554;
        float _560 = _556 * _558;
        float _562 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _564 = fma(_560, (*spvDescriptorSet0.fp_c8)._m0[30].w, _562);
        float _566 = 1.0 / _564;
        float _568 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _570 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _572 = fma(_566, _568, _570);
        float _574 = _572 * 8.0;
        float _576 = precise::clamp(_574, 0.0, 1.0);
        float _578 = _518 * _576;
        _540 = _578;
    }
    float _580 = _540;
    float _582 = 0.0 + _580;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    out.m_49.x = _534;
    out.m_49.y = _536;
    out.m_49.z = _528;
    out.m_49.w = _584;
    return out;
}

