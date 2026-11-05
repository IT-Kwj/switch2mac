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
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_61 [[user(locn2), flat]];
    float4 m_42 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _72;
    float _112 = _110 * _78;
    float _114 = _110 * _84;
    float _116 = _110 * _90;
    float _118 = _110 * _96;
    float _120 = _110 * _102;
    float _122 = _110 * _108;
    float2 _627 = float2(_112, _116);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_627, float2(0.0), isnan(_627))).w;
    float2 _638 = float2(_114, _118);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_638, float2(0.0), isnan(_638))).w;
    float2 _646 = float2(_122, _120);
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_646, float2(0.0), isnan(_646))).w;
    float _130 = in.m_46.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_48.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = (*spvDescriptorSet0.fp_c7)._m0[2].y * (*spvDescriptorSet0.fp_c7)._m0[2].y;
    float _144 = in.m_50.w;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_52.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = fma((*spvDescriptorSet0.fp_c7)._m0[2].x, (*spvDescriptorSet0.fp_c7)._m0[2].x, _142);
    float _158 = fma((*spvDescriptorSet0.fp_c7)._m0[2].z, (*spvDescriptorSet0.fp_c7)._m0[2].z, _156);
    float _160 = sqrt(_158);
    float _162 = precise::max(_160, 0.20000000298023223876953125);
    float _164 = precise::min(_162, 0.5);
    float _166 = fma(_164, 3.3333332538604736328125, -1.6666667461395263671875);
    float _168 = in.m_50.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_50.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_50.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_48.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_48.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = _110 * _196;
    float _200 = precise::max(_124, _126);
    float _202 = -_128;
    float _204 = _200 + _202;
    float _206 = _204 + _166;
    float _208 = (-1.0) + (*spvDescriptorSet0.fp_c10)._m0[3].x;
    float _210 = _110 * _134;
    float _212 = _206 + _208;
    float _214 = _210 + (-1.0);
    float _216 = _212 + _214;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _110 * _140;
    float _222 = _110 * _148;
    float _224 = -_220;
    float _226 = _224 + _218;
    float _228 = _110 * _154;
    float _230 = _222 * _226;
    float _232 = 0.0 + _230;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _234 * _228;
    bool _240 = _236 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _242 = isnan(_236);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _248 = _244 || _246;
    float _250 = in.m_54.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_54.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_54.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    if (!_248)
    {
        discard_fragment();
    }
    float _268 = in.m_48.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = _126 * 0.5;
    float _276 = precise::max(_124, _274);
    float _278 = _110 * _178;
    float _280 = _276 * _276;
    float _282 = _110 * _184;
    float _284 = _110 * _254;
    float _286 = _110 * _260;
    float _288 = _110 * _266;
    float _290 = _284 * _284;
    float _292 = fma(_286, _286, _290);
    float _294 = _110 * _172;
    float _296 = fma(_288, _288, _292);
    float _298 = -_280;
    float _300 = _298 + 1.0;
    float _302 = rsqrt(_296);
    float _304 = _294 * _300;
    float _306 = _278 * _300;
    float _308 = _282 * _300;
    float _310 = _110 * _190;
    float _312 = _110 * _272;
    float _314 = fma(_280, _310, _306);
    float _316 = fma(_280, _198, _308);
    float _318 = fma(_280, _312, _304);
    float _320 = _286 * _302;
    float _322 = _284 * _302;
    float _324 = _288 * _302;
    if (!_248)
    {
        out.m_57.x = _318;
        out.m_57.y = _314;
        out.m_57.z = _316;
        out.m_57.w = _230;
        return out;
    }
    float _326 = in.m_59.w;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_61.x;
    float _334 = in.m_59.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = _322 * _322;
    float _342 = fma(_320, _320, _340);
    float _344 = fma(_324, _324, _342);
    float _346 = rsqrt(_344);
    float _348 = _110 * _330;
    bool _350 = _348 != 1.0;
    bool _352 = isnan(_348);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    bool _360 = !_358;
    if (!_360)
    {
        float _362 = gl_FragCoord.x;
        float _364 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _366 = _362 / _364;
        float _368 = gl_FragCoord.y;
        float _370 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _372 = _368 / _370;
        float _374 = _348 * 256.0;
        float _376 = trunc(_374);
        int _379 = int(_376);
        uint _382 = uint(int(uint(_379) >> uint(7)));
        int _384 = int(_382) + _379;
        float _386 = trunc(_366);
        int _388 = int(_386);
        float _390 = trunc(_372);
        int _392 = int(_390);
        int _394 = _388 + 2;
        int _396 = _394 >> 1;
        uint _398 = uint(int(uint(_392) >> uint(1)));
        int _400 = _396 ^ int(_398);
        int _402 = _400 << 16;
        int _404 = _402 ^ _396;
        int _406 = 983055 & _404;
        int _408 = _406 << 6;
        int _410 = _408 + _406;
        int _412 = _410 & 13369548;
        uint _414 = uint(int(uint(_412) >> uint(3)));
        int _416 = _412 | int(_414);
        int _418 = _416 & 5570560;
        int _420 = _416 & 85;
        uint _422 = uint(int(uint(_418) >> uint(15)));
        int _424 = int(_422) + _420;
        bool _426 = uint(_384) > uint(_424);
        if (!_426)
        {
            discard_fragment();
        }
        if (!_426)
        {
            out.m_57.x = _318;
            out.m_57.y = _314;
            out.m_57.z = _316;
            out.m_57.w = _236;
            return out;
        }
    }
    float _428 = abs(_320);
    float _430 = abs(_322);
    float _432 = precise::max(_428, _430);
    float _434 = _322 * _346;
    float _436 = _110 * _338;
    float _438 = abs(_324);
    float _440 = precise::max(_438, _432);
    float _442 = -_332;
    float _444 = fma(_442, _332, 1.0);
    float _446 = fma(_434, 0.5, 0.5);
    float _448 = 1.0 / _440;
    float _450 = -_446;
    float _452 = fma(_450, _446, 1.0);
    float _454 = -_280;
    float _456 = _454 + _452;
    float _458 = _456 * _444;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = _436 + _460;
    float _464 = _320 * _448;
    float _466 = _322 * _448;
    float _468 = -_448;
    float _470 = _324 * _468;
    float _472 = precise::min(_462, 1.0);
    float3 _1160 = float3(_464, _466, _470);
    float3 _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1160, float3(0.0), isnan(_1160)), level(_472)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1160, float3(0.0), isnan(_1160)), level(_472)).xyz;
    float _478 = _476.x;
    float _480 = _476.y;
    float _482 = _476.z;
    float _484 = in.m_63.x;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = in.m_63.y;
    float _492 = gl_FragCoord.w;
    float _494 = _490 * _492;
    float _496 = in.m_63.z;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_65.x;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_65.y;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_65.z;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = _110 * _488;
    float _522 = _110 * _494;
    float _524 = _110 * _500;
    float _526 = _110 * _506;
    float _528 = _110 * _512;
    float _530 = _110 * _518;
    float _532 = fma(_478, 0.20999999344348907470703125, _520);
    float _534 = fma(_480, 0.20999999344348907470703125, _522);
    float _536 = fma(_482, 0.20999999344348907470703125, _524);
    float _538 = _532 + _526;
    float _540 = _534 + _528;
    float _542 = _536 + _530;
    float _544 = _318 * _538;
    float _546 = _314 * _540;
    float _548 = _316 * _542;
    float _550 = 0.0 + _236;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    out.m_57.x = _544;
    out.m_57.y = _546;
    out.m_57.z = _548;
    out.m_57.w = _552;
    return out;
}

