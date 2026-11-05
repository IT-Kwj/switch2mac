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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texturecube<float> fp_t_tcb_1E [[id(10)]];
    sampler fp_t_tcb_1ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_1ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_46 [[user(locn2), flat]];
    float4 m_44 [[user(locn3), flat]];
    float4 m_67 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_50 [[user(locn6)]];
    float4 m_52 [[user(locn7), flat]];
    float4 m_48 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_42 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = in.m_44.x;
    float _100 = in.m_44.z;
    float _102 = in.m_46.x;
    float _104 = in.m_48.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_48.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = 1.0 / _76;
    float _118 = _96 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _120 = _96 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _122 = fma(_98, (*spvDescriptorSet0.fp_c8)._m0[2].x, _118);
    float _124 = fma(_98, (*spvDescriptorSet0.fp_c8)._m0[1].x, _120);
    float _126 = fma(_100, (*spvDescriptorSet0.fp_c8)._m0[2].z, _122);
    float _128 = fma(_100, (*spvDescriptorSet0.fp_c8)._m0[1].z, _124);
    float _130 = _116 * _82;
    float _132 = _116 * _88;
    float _134 = _116 * _94;
    float _136 = _126 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _138 = _130 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _140 = _130 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _142 = _128 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _144 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[2].x, _138);
    float _146 = _96 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _148 = _116 * _108;
    float _150 = fma(_134, (*spvDescriptorSet0.fp_c8)._m0[2].z, _144);
    float _152 = fma(_98, (*spvDescriptorSet0.fp_c8)._m0[0].x, _146);
    float _154 = _130 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _156 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[1].x, _140);
    float _158 = _150 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _160 = fma(_100, (*spvDescriptorSet0.fp_c8)._m0[0].z, _152);
    float _162 = _116 * _114;
    float _164 = fma(_134, (*spvDescriptorSet0.fp_c8)._m0[1].z, _156);
    float _166 = 1.0 / _158;
    float _168 = _160 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _170 = _164 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _172 = fma(_132, (*spvDescriptorSet0.fp_c8)._m0[0].x, _154);
    float _174 = fma(_134, (*spvDescriptorSet0.fp_c8)._m0[0].z, _172);
    float _176 = _136 * _166;
    float _178 = _174 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _180 = -_142;
    float _182 = fma(_170, _176, _180);
    float _184 = -_168;
    float _186 = fma(_178, _176, _184);
    float _188 = _132 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _190 = _134 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _192 = _182 + _102;
    float _194 = _186 + _102;
    float _196 = _192 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _198 = _194 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float2 _823 = float2(_148, _162);
    float _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_823, float2(0.0), isnan(_823))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_823, float2(0.0), isnan(_823))).w;
    float2 _834 = float2(_198, _196);
    float _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_834, float2(0.0), isnan(_834))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_834, float2(0.0), isnan(_834))).w;
    float2 _842 = float2(_188, _190);
    float _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_842, float2(0.0), isnan(_842))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_842, float2(0.0), isnan(_842))).w;
    float _206 = in.m_50.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_50.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _220 = _130 + _218;
    float _222 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _224 = _132 + _222;
    float _226 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _228 = _134 + _226;
    float _230 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _232 = _220 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _234 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _230);
    float _236 = fma(_224, (*spvDescriptorSet0.fp_c10)._m0[8].x, _232);
    float _238 = in.m_52.x;
    float _240 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _234);
    float _242 = fma(_228, (*spvDescriptorSet0.fp_c10)._m0[10].x, _236);
    float _244 = in.m_54.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = abs(_242);
    float _252 = 0.0 + _250;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = rsqrt(_240);
    float _258 = -_254;
    float _260 = _258 + 1.0;
    float _262 = -_260;
    float _264 = fma(_262, _260, 1.0);
    float _266 = _116 * _210;
    float _268 = _116 * _216;
    float _270 = _266 + (-0.5);
    float _272 = _268 + (-0.5);
    float _274 = _264 * _256;
    float _276 = _270 * _270;
    float _278 = in.m_56.w;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = fma(_272, _272, _276);
    float _286 = in.m_58.w;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = sqrt(_284);
    float _294 = _116 * _282;
    float _296 = in.m_58.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = _202 * _200;
    float _304 = _200 * _204;
    float _306 = _292 * 2.0;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _302 * _274;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _116 * _248;
    float _316 = _304 * _308;
    float _318 = precise::clamp(_316, 0.0, 1.0);
    float _320 = _116 * _290;
    float _322 = -_312;
    float _324 = _322 + _318;
    float _326 = fma(_238, _324, _312);
    float _328 = -_320;
    float _330 = _328 + _326;
    float _332 = _330 * _294;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _334 * _314;
    bool _340 = _336 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _342 = isnan(_336);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _348 = _344 || _346;
    float _350 = in.m_58.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_58.y;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    if (!_348)
    {
        discard_fragment();
    }
    float _362 = _116 * _300;
    float _364 = _116 * _354;
    float _366 = _116 * _360;
    if (!_348)
    {
        out.m_61.x = _364;
        out.m_61.y = _366;
        out.m_61.z = _362;
        out.m_61.w = _334;
        return out;
    }
    float _368 = in.m_63.w;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = _116 * _372;
    bool _376 = _374 != 1.0;
    bool _378 = isnan(_374);
    bool _380 = _376 || _378;
    bool _382 = isnan(1.0);
    bool _384 = _380 || _382;
    bool _386 = !_384;
    if (!_386)
    {
        float _388 = gl_FragCoord.x;
        float _390 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _392 = _388 / _390;
        float _394 = gl_FragCoord.y;
        float _396 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _398 = _394 / _396;
        float _400 = _374 * 256.0;
        float _402 = trunc(_400);
        int _405 = int(_402);
        uint _408 = uint(int(uint(_405) >> uint(7)));
        int _410 = int(_408) + _405;
        float _412 = trunc(_392);
        int _414 = int(_412);
        float _416 = trunc(_398);
        int _418 = int(_416);
        int _420 = _414 + 2;
        int _422 = _420 >> 1;
        uint _424 = uint(int(uint(_418) >> uint(1)));
        int _426 = _422 ^ int(_424);
        int _428 = _426 << 16;
        int _430 = _428 ^ _422;
        int _432 = 983055 & _430;
        int _434 = _432 << 6;
        int _436 = _434 + _432;
        int _438 = _436 & 13369548;
        uint _440 = uint(int(uint(_438) >> uint(3)));
        int _442 = _438 | int(_440);
        int _444 = _442 & 5570560;
        int _446 = _442 & 85;
        uint _448 = uint(int(uint(_444) >> uint(15)));
        int _450 = int(_448) + _446;
        bool _452 = uint(_410) > uint(_450);
        if (!_452)
        {
            discard_fragment();
        }
        if (!_452)
        {
            out.m_61.x = _364;
            out.m_61.y = _366;
            out.m_61.z = _362;
            out.m_61.w = _336;
            return out;
        }
    }
    float _454 = in.m_65.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = in.m_65.x;
    float _462 = gl_FragCoord.w;
    float _464 = _460 * _462;
    float _466 = in.m_65.z;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = in.m_63.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = _116 * _458;
    float _480 = _116 * _464;
    float _482 = _116 * _470;
    float _484 = _478 * _478;
    float _486 = fma(_480, _480, _484);
    float _488 = fma(_482, _482, _486);
    float _490 = rsqrt(_488);
    float _492 = _480 * _490;
    float _494 = _478 * _490;
    float _496 = _482 * _490;
    float _498 = _116 * _476;
    float _500 = abs(_492);
    float _502 = abs(_494);
    float _504 = precise::max(_500, _502);
    float _506 = abs(_496);
    float _508 = precise::max(_506, _504);
    float _510 = 1.0 / _508;
    float _512 = _492 * _510;
    float _514 = -_510;
    float _516 = _496 * _514;
    float _518 = precise::min(_498, 1.0);
    float _520 = _494 * _510;
    float3 _1321 = float3(_512, _520, _516);
    float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1321, float3(0.0), isnan(_1321)), level(_518)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1321, float3(0.0), isnan(_1321)), level(_518)).xyz;
    float _526 = _524.x;
    float _528 = _524.y;
    float _530 = _524.z;
    float _532 = in.m_67.x;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = in.m_67.y;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_67.z;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = in.m_69.x;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_69.y;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_69.z;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = _116 * _536;
    float _570 = _116 * _542;
    float _572 = _116 * _548;
    float _574 = _116 * _554;
    float _576 = _116 * _560;
    float _578 = _116 * _566;
    float _580 = fma(_526, 0.20999999344348907470703125, _568);
    float _582 = fma(_528, 0.20999999344348907470703125, _570);
    float _584 = fma(_530, 0.20999999344348907470703125, _572);
    float _586 = _580 + _574;
    float _588 = _582 + _576;
    float _590 = _584 + _578;
    float _592 = _364 * _586;
    float _594 = _366 * _588;
    float _596 = _362 * _590;
    float _598 = 0.0 + _336;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    out.m_61.x = _592;
    out.m_61.y = _594;
    out.m_61.z = _596;
    out.m_61.w = _600;
    return out;
}

