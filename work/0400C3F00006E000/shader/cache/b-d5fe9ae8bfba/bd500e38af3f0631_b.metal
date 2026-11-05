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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _611 = float2(_104, _110);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611))).w;
    float2 _622 = float2(_106, _108);
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_622, float2(0.0), isnan(_622))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_622, float2(0.0), isnan(_622))).w;
    float _116 = in.m_46.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_48.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_50.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _102 * _120;
    float _136 = _102 * _126;
    float _138 = in.m_42.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = -_134;
    float _146 = fma(_112, _114, _144);
    float _148 = _136 * _146;
    float _150 = _102 * _132;
    float _152 = 0.0 + _148;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _154 * _150;
    bool _160 = _156 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_156);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_42.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    if (!_168)
    {
        discard_fragment();
    }
    float _176 = _102 * _142;
    float _178 = _102 * _174;
    float2 _719 = float2(_176, _178);
    float2 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_719, float2(0.0), isnan(_719))).xy;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = in.m_46.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_46.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_46.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = _102 * _192;
    float _208 = _102 * _198;
    float _210 = _102 * _204;
    if (!_168)
    {
        out.m_53.x = _206;
        out.m_53.y = _208;
        out.m_53.z = _210;
        out.m_53.w = _148;
        return out;
    }
    float _212 = in.m_55.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_55.x;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_55.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_57.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_57.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_57.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_59.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_59.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_59.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = _186 * _186;
    float _268 = fma(_184, _184, _266);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = sqrt(_274);
    float _278 = _102 * _216;
    float _280 = _102 * _222;
    float _282 = _102 * _228;
    float _284 = _102 * _234;
    float _286 = _278 * _278;
    float _288 = _102 * _246;
    float _290 = _102 * _252;
    float _292 = _102 * _258;
    float _294 = fma(_280, _280, _286);
    float _296 = _102 * _240;
    float _298 = _284 * _284;
    float _300 = _290 * _290;
    float _302 = fma(_282, _282, _294);
    float _304 = _102 * _264;
    float _306 = fma(_296, _296, _298);
    float _308 = fma(_292, _292, _300);
    float _310 = fma(_288, _288, _306);
    float _312 = fma(_304, _304, _308);
    float _314 = rsqrt(_302);
    float _316 = rsqrt(_310);
    float _318 = rsqrt(_312);
    float _320 = _316 * _186;
    float _322 = _314 * _184;
    float _324 = in.m_61.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = _284 * _320;
    float _332 = _296 * _320;
    float _334 = _288 * _320;
    float _336 = _318 * _276;
    float _338 = fma(_278, _322, _330);
    float _340 = fma(_280, _322, _332);
    float _342 = fma(_282, _322, _334);
    float _344 = fma(_290, _336, _338);
    float _346 = fma(_292, _336, _340);
    float _348 = fma(_304, _336, _342);
    float _350 = _344 * _344;
    float _352 = fma(_346, _346, _350);
    float _354 = fma(_348, _348, _352);
    float _356 = rsqrt(_354);
    float _358 = _346 * _356;
    float _360 = _344 * _356;
    float _362 = _348 * _356;
    float _364 = abs(_358);
    float _366 = abs(_360);
    float _368 = precise::max(_364, _366);
    float _370 = abs(_362);
    float _372 = precise::max(_370, _368);
    float _374 = _102 * _328;
    float _376 = 1.0 / _372;
    float _378 = _360 * _376;
    float _380 = _358 * _376;
    float _382 = -_376;
    float _384 = _362 * _382;
    float _386 = precise::min(_374, 1.0);
    float3 _1020 = float3(_380, _378, _384);
    float3 _390 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1020, float3(0.0), isnan(_1020)), level(_386)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1020, float3(0.0), isnan(_1020)), level(_386)).xyz;
    float _392 = _390.x;
    float _394 = _390.y;
    float _396 = _390.z;
    float _398 = in.m_63.x;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_63.y;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_63.z;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_65.y;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_65.z;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_65.x;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_67.x;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_67.w;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_67.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_67.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = _102 * _402;
    float _460 = _102 * _408;
    float _462 = _102 * _414;
    bool _464 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _466 = fma(_394, 0.20999999344348907470703125, _460);
    float _468 = fma(_396, 0.20999999344348907470703125, _462);
    float _470 = _102 * _420;
    float _472 = fma(_392, 0.20999999344348907470703125, _458);
    float _474 = _102 * _426;
    float _476 = _102 * _432;
    float _478 = _466 + _470;
    float _480 = _102 * _456;
    float _482 = _468 + _474;
    float _484 = _472 + _476;
    float _486 = _208 * _478;
    float _488 = 0.0 + _156;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = _210 * _482;
    float _494 = _206 * _484;
    float _496 = _102 * _438;
    float _498 = _102 * _444;
    float _500 = _102 * _450;
    float _502 = fma(_494, _498, _496);
    float _504 = fma(_486, _498, _500);
    float _506 = fma(_492, _498, _480);
    float _508 = _496;
    if (!_464)
    {
        _508 = _490;
    }
    float _510 = _508;
    bool _512 = !_464;
    float _514 = _510;
    if (!_512)
    {
        float _516 = in.m_69.w;
        float _518 = gl_FragCoord.w;
        float _520 = _516 * _518;
        float _522 = in.m_69.z;
        float _524 = gl_FragCoord.w;
        float _526 = _522 * _524;
        float _528 = _102 * _520;
        float _530 = _102 * _526;
        float _532 = 1.0 / _528;
        float _534 = _530 * _532;
        float _536 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _538 = fma(_534, (*spvDescriptorSet0.fp_c8)._m0[30].w, _536);
        float _540 = 1.0 / _538;
        float _542 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _544 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _546 = fma(_540, _542, _544);
        float _548 = _546 * 8.0;
        float _550 = precise::clamp(_548, 0.0, 1.0);
        float _552 = _490 * _550;
        _514 = _552;
    }
    float _554 = _514;
    float _556 = 0.0 + _554;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    out.m_53.x = _502;
    out.m_53.y = _504;
    out.m_53.z = _506;
    out.m_53.w = _558;
    return out;
}

