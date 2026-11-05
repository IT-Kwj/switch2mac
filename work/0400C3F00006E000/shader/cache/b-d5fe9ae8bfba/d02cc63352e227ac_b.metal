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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = 1.0 / _63;
    float _109 = _107 * _69;
    float _111 = _107 * _75;
    float _113 = _107 * _81;
    float _115 = _107 * _87;
    float _117 = _107 * _99;
    float _119 = 1.0 / _109;
    float _121 = _111 * _119;
    float _123 = _113 * _119;
    float _125 = _107 * _93;
    float _127 = _107 * _105;
    float2 _623 = float2(_121, _123);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_623, float2(0.0), isnan(_623))).x;
    float2 _634 = float2(_115, _125);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _650 = float2(_117, _127);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_650, float2(0.0), isnan(_650))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = in.m_41.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_41.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_41.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_43.y;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_43.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_43.z;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_37.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _196 = _194 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _198 = _107 * _156;
    float _200 = _107 * _162;
    float _202 = _107 * _168;
    float _204 = _198 * _198;
    float _206 = fma(_200, _200, _204);
    float _208 = fma(_202, _202, _206);
    float _210 = _107 * _174;
    float _212 = rsqrt(_208);
    float _214 = in.m_45.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = _198 * _212;
    float _222 = _107 * _180;
    float _224 = _200 * _212;
    float _226 = 1.0 / _196;
    float _228 = _210 * _220;
    float _230 = _202 * _212;
    float _232 = fma(_222, _224, _228);
    float _234 = _107 * _186;
    float _236 = in.m_47.w;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = fma(_234, _230, _232);
    float _244 = _107 * _192;
    float _246 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _248 = abs(_242);
    float _250 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _252 = _248 + _250;
    float _254 = _244 * _119;
    float _256 = _252 * _226;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _262 = fma(_254, (*spvDescriptorSet0.fp_c8)._m0[30].w, _260);
    float _264 = in.m_49.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = fma(_258, -2.0, 3.0);
    float _272 = _258 * _258;
    float _274 = 1.0 / _262;
    float _276 = _270 * _272;
    float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _280 = _274 * _278;
    float _282 = in.m_51.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_45.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_51.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_45.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_51.z;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _314 = fma(_129, (*spvDescriptorSet0.fp_c8)._m0[30].w, _312);
    float _316 = 1.0 / _314;
    float _318 = _140 * _150;
    float _320 = _107 * _240;
    float _322 = _318 * _320;
    float _324 = _107 * _218;
    float _326 = _324 * _322;
    float _328 = 0.0 + _326;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _334 = -_280;
    float _336 = fma(_316, _332, _334);
    float _338 = _336 * _246;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _330 * _340;
    float _344 = _107 * _268;
    float _346 = _342 * _276;
    float _348 = _346 * _344;
    bool _352 = _348 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _354 = isnan(_348);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _360 = _356 || _358;
    float _362 = in.m_45.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_47.x;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_47.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_47.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = _280;
    if (!_360)
    {
        discard_fragment();
    }
    float _388 = _134 * _134;
    float _390 = _136 * _136;
    float _392 = _144 * _144;
    float _394 = _146 * _146;
    float _396 = _107 * _292;
    float _398 = _138 * _138;
    float _400 = _388 * _392;
    float _402 = _390 * _394;
    float _404 = _107 * _286;
    float _406 = _148 * _148;
    float _408 = _107 * _304;
    float _410 = _107 * _310;
    float _412 = _398 * _406;
    float _414 = _107 * _366;
    float _416 = _107 * _298;
    float _418 = -_410;
    float _420 = _408 + _418;
    float _422 = _107 * _372;
    float _424 = -_404;
    float _426 = _414 + _424;
    float _428 = -_416;
    float _430 = _396 + _428;
    float _432 = fma(_412, _420, _410);
    float _434 = _107 * _384;
    float _436 = fma(_400, _426, _404);
    float _438 = fma(_402, _430, _416);
    float _440 = _107 * _378;
    float _442 = _432 * _434;
    float _444 = _436 * _422;
    float _446 = _438 * _440;
    float _448 = _420;
    if (!_360)
    {
        out.m_54.x = _444;
        out.m_54.y = _446;
        out.m_54.z = _442;
        out.m_54.w = _326;
        return out;
    }
    float _450 = _446 * 0.715200006961822509765625;
    float _452 = in.m_56.w;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_56.y;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_56.x;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = fma(_444, 0.2125999927520751953125, _450);
    float _472 = in.m_56.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_442, 0.072200000286102294921875, _470);
    bool _480 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _482 = 1.0 / _478;
    if (_480)
    {
        float _484 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _486 = _280 + _484;
        _386 = _486;
    }
    float _488 = _386;
    if (_480)
    {
        float _490 = _488 * 8.0;
        float _492 = precise::clamp(_490, 0.0, 1.0);
        _448 = _492;
    }
    float _494 = _448;
    float _496 = _482 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = fma(_498, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _502 = _107 * _456;
    float _504 = _107 * _462;
    float _506 = _107 * _468;
    float _508 = _500 * _502;
    float _510 = 0.0 + _348;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _107 * _476;
    float _516 = fma(_444, _508, _506);
    float _518 = _512;
    if (_480)
    {
        float _520 = _512 * _494;
        _518 = _520;
    }
    float _522 = _518;
    float _524 = fma(_446, _508, _504);
    float _526 = fma(_442, _508, _514);
    float _528 = 0.0 + _522;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    out.m_54.x = _516;
    out.m_54.y = _524;
    out.m_54.z = _526;
    out.m_54.w = _530;
    return out;
}

