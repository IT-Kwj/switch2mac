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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.z;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _70;
    float _116 = _114 * _76;
    float _118 = _114 * _82;
    float _120 = _114 * _88;
    float _122 = _114 * _94;
    float _124 = 1.0 / _116;
    float _126 = _114 * _100;
    float _128 = _118 * _124;
    float _130 = _120 * _124;
    float _132 = _114 * _106;
    float _134 = _114 * _112;
    float2 _561 = float2(_128, _130);
    float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float2 _572 = float2(_122, _132);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_572, float2(0.0), isnan(_572))).w;
    float2 _580 = float2(_134, _126);
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_580, float2(0.0), isnan(_580))).w;
    float _142 = in.m_42.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_46.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_48.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_50.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _114 * _146;
    float _168 = _166 * _124;
    float _170 = in.m_52.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_168, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = 1.0 / _178;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = _180 * _182;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _188 = fma(_136, (*spvDescriptorSet0.fp_c8)._m0[30].w, _186);
    float _190 = -_140;
    float _192 = _138 + _190;
    float _194 = _114 * _152;
    float _196 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _198 = _192 * _194;
    float _200 = _114 * _158;
    float _202 = _114 * _174;
    float _204 = 1.0 / _188;
    float _206 = _200 * _198;
    float _208 = _114 * _164;
    float _210 = _208 * _206;
    float _212 = 0.0 + _210;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _218 = -_184;
    float _220 = fma(_204, _216, _218);
    float _222 = _220 * _196;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = _214 * _224;
    float _228 = _226 * _202;
    bool _232 = _228 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_228);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = in.m_48.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_48.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_48.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _184;
    if (!_240)
    {
        discard_fragment();
    }
    float _262 = _114 * _246;
    float _264 = _114 * _252;
    float _266 = _114 * _258;
    if (!_240)
    {
        out.m_55.x = _262;
        out.m_55.y = _264;
        out.m_55.z = _266;
        out.m_55.w = _210;
        return out;
    }
    float _268 = in.m_57.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_57.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_57.z;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = _114 * _272;
    float _288 = _114 * _278;
    float _290 = _114 * _284;
    float _292 = _286 * _286;
    float _294 = fma(_288, _288, _292);
    float _296 = fma(_290, _290, _294);
    float _298 = rsqrt(_296);
    float _300 = _288 * _298;
    float _302 = _286 * _298;
    float _304 = _290 * _298;
    float _306 = abs(_300);
    float _308 = abs(_302);
    float _310 = precise::max(_306, _308);
    float _312 = abs(_304);
    float _314 = precise::max(_312, _310);
    float _316 = 1.0 / _314;
    float _318 = _300 * _316;
    float _320 = _302 * _316;
    float _322 = -_316;
    float _324 = _304 * _322;
    float3 _854 = float3(_318, _320, _324);
    float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_854, float3(0.0), isnan(_854)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_854, float3(0.0), isnan(_854)), level(0.0)).xyz;
    float _330 = _328.x;
    float _332 = _328.y;
    float _334 = _328.z;
    float _336 = in.m_59.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_59.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_59.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_61.z;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_61.x;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_61.y;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_63.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_63.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_63.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_63.w;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    bool _396 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_396)
    {
        float _398 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _400 = _184 + _398;
        _260 = _400;
    }
    float _402 = _260;
    float _404 = _402;
    if (_396)
    {
        float _406 = _402 * 8.0;
        float _408 = precise::clamp(_406, 0.0, 1.0);
        _404 = _408;
    }
    float _410 = _404;
    float _412 = _114 * _340;
    float _414 = _114 * _346;
    float _416 = _114 * _358;
    float _418 = _114 * _364;
    float _420 = _114 * _382;
    float _422 = _114 * _388;
    float _424 = fma(_330, 0.20999999344348907470703125, _412);
    float _426 = _114 * _352;
    float _428 = fma(_334, 0.20999999344348907470703125, _414);
    float _430 = _114 * _370;
    float _432 = _424 + _418;
    float _434 = fma(_332, 0.20999999344348907470703125, _426);
    float _436 = _428 + _416;
    float _438 = 0.0 + _228;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = _114 * _376;
    float _444 = _434 + _430;
    float _446 = _114 * _394;
    float _448 = _262 * _432;
    float _450 = _266 * _436;
    float _452 = _264 * _444;
    float _454 = _440;
    if (_396)
    {
        float _456 = _440 * _410;
        _454 = _456;
    }
    float _458 = _454;
    float _460 = fma(_448, _446, _442);
    float _462 = fma(_450, _446, _422);
    float _464 = fma(_452, _446, _420);
    float _466 = 0.0 + _458;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    out.m_55.x = _460;
    out.m_55.y = _464;
    out.m_55.z = _462;
    out.m_55.w = _468;
    return out;
}

