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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_53 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _68;
    float _96 = _94 * _74;
    float _98 = _94 * _80;
    float _100 = _94 * _86;
    float _102 = _94 * _92;
    float2 _560;
    _560.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_96, _98));
    _560.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_96, _98));
    float _104 = _560.x;
    float _106 = _104 * 256.0;
    int _109 = int(_106);
    float2 _571;
    _571.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_100, _102));
    _571.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_100, _102));
    float _111 = _571.x;
    float _113 = _111 * 256.0;
    int _115 = int(_113);
    float _117 = float(uint(_109));
    float _119 = float(uint(_115));
    float _121 = _117 * 0.00390625;
    float _123 = _119 * 0.00390625;
    float _125 = precise::min(_121, 2.0);
    float _127 = precise::min(_123, 2.0);
    float2 _597 = float2(_96, _98);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597)), level(_125)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597)), level(_125)).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float2 _617 = float2(_100, _102);
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_617, float2(0.0), isnan(_617)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_617, float2(0.0), isnan(_617)), level(_127)).w;
    float _142 = in.m_42.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_44.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_46.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _94 * _146;
    float _162 = in.m_44.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = -_140;
    float _170 = _138 + _168;
    float _172 = _94 * _152;
    float _174 = -_160;
    float _176 = _170 + _174;
    float _178 = _94 * _158;
    float _180 = _172 * _176;
    float _182 = 0.0 + _180;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = _184 * _178;
    bool _190 = _186 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _192 = isnan(_186);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _198 = _194 || _196;
    float _200 = in.m_42.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_42.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_44.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_42.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_44.z;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    if (!_198)
    {
        discard_fragment();
    }
    float _230 = _94 * _166;
    float _232 = _136 * _136;
    float _234 = _94 * _204;
    float _236 = _94 * _210;
    float _238 = _94 * _216;
    float _240 = _94 * _222;
    float _242 = _94 * _228;
    float _244 = -_230;
    float _246 = _236 + _244;
    float _248 = -_238;
    float _250 = _234 + _248;
    float _252 = _132 * _132;
    float _254 = -_242;
    float _256 = _240 + _254;
    float _258 = _134 * _134;
    float _260 = fma(_252, _246, _230);
    float _262 = fma(_232, _256, _242);
    float _264 = fma(_258, _250, _238);
    if (!_198)
    {
        out.m_49.x = _260;
        out.m_49.y = _264;
        out.m_49.z = _262;
        out.m_49.w = _180;
        return out;
    }
    float _266 = in.m_51.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_51.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_51.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_53.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _94 * _270;
    float _292 = _94 * _276;
    float _294 = _94 * _282;
    float _296 = _290 * _290;
    float _298 = fma(_292, _292, _296);
    float _300 = fma(_294, _294, _298);
    float _302 = rsqrt(_300);
    float _304 = _292 * _302;
    float _306 = _290 * _302;
    float _308 = _294 * _302;
    float _310 = abs(_304);
    float _312 = abs(_306);
    float _314 = precise::max(_310, _312);
    float _316 = abs(_308);
    float _318 = precise::max(_316, _314);
    float _320 = _94 * _288;
    float _322 = 1.0 / _318;
    float _324 = precise::min(_320, 1.0);
    float _326 = -_322;
    float _328 = _308 * _326;
    float _330 = _304 * _322;
    float _332 = _306 * _322;
    float3 _896 = float3(_330, _332, _328);
    float3 _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_896, float3(0.0), isnan(_896)), level(_324)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_896, float3(0.0), isnan(_896)), level(_324)).xyz;
    float _338 = _336.x;
    float _340 = _336.y;
    float _342 = _336.z;
    float _344 = in.m_55.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_55.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_55.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_57.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_57.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_57.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_59.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_59.w;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_59.y;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_59.z;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    bool _404 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _406 = _94 * _348;
    float _408 = _94 * _354;
    float _410 = _94 * _360;
    float _412 = fma(_340, 0.20999999344348907470703125, _408);
    float _414 = fma(_342, 0.20999999344348907470703125, _410);
    float _416 = fma(_338, 0.20999999344348907470703125, _406);
    float _418 = _94 * _366;
    float _420 = _94 * _372;
    float _422 = _94 * _378;
    float _424 = _412 + _418;
    float _426 = _414 + _420;
    float _428 = _416 + _422;
    float _430 = 0.0 + _186;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _264 * _424;
    float _436 = _262 * _426;
    float _438 = _260 * _428;
    float _440 = _94 * _384;
    float _442 = _94 * _390;
    float _444 = _94 * _396;
    float _446 = _94 * _402;
    float _448 = fma(_438, _442, _440);
    float _450 = fma(_434, _442, _444);
    float _452 = fma(_436, _442, _446);
    float _454 = _440;
    if (!_404)
    {
        _454 = _432;
    }
    float _456 = _454;
    bool _458 = !_404;
    float _460 = _456;
    if (!_458)
    {
        float _462 = in.m_61.w;
        float _464 = gl_FragCoord.w;
        float _466 = _462 * _464;
        float _468 = in.m_61.z;
        float _470 = gl_FragCoord.w;
        float _472 = _468 * _470;
        float _474 = _94 * _466;
        float _476 = _94 * _472;
        float _478 = 1.0 / _474;
        float _480 = _476 * _478;
        float _482 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _484 = fma(_480, (*spvDescriptorSet0.fp_c8)._m0[30].w, _482);
        float _486 = 1.0 / _484;
        float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _490 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _492 = fma(_486, _488, _490);
        float _494 = _492 * 8.0;
        float _496 = precise::clamp(_494, 0.0, 1.0);
        float _498 = _432 * _496;
        _460 = _498;
    }
    float _500 = _460;
    float _502 = 0.0 + _500;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    out.m_49.x = _448;
    out.m_49.y = _450;
    out.m_49.z = _452;
    out.m_49.w = _504;
    return out;
}

