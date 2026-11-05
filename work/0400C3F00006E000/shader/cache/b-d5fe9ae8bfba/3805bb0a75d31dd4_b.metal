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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_40.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _70;
    float _98 = _96 * _76;
    float _100 = _96 * _82;
    float _102 = _96 * _88;
    float _104 = _96 * _94;
    float2 _519 = float2(_98, _102);
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).w;
    float2 _530 = float2(_100, _104);
    float _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_530, float2(0.0), isnan(_530))).w;
    float _110 = in.m_42.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_44.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_46.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _96 * _114;
    float _136 = _96 * _120;
    float _138 = _96 * _126;
    float _140 = in.m_42.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_44.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _106 * _108;
    float _154 = _96 * _132;
    float _156 = -_134;
    float _158 = fma(_152, _136, _156);
    float _160 = _138 * _158;
    float _162 = 0.0 + _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 * _154;
    bool _170 = _166 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _172 = isnan(_166);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _178 = _174 || _176;
    float _180 = in.m_44.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_178)
    {
        discard_fragment();
    }
    float _186 = _96 * _144;
    float _188 = _96 * _184;
    float _190 = in.m_44.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = _186 * _188;
    float _198 = in.m_42.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _96 * _194;
    float _206 = in.m_42.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _96 * _202;
    float _214 = _212 * _204;
    float _216 = _96 * _210;
    float _218 = _96 * _150;
    float _220 = _216 * _218;
    if (!_178)
    {
        out.m_51.x = _196;
        out.m_51.y = _214;
        out.m_51.z = _220;
        out.m_51.w = _160;
        return out;
    }
    float _222 = in.m_53.y;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_53.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_53.z;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = _96 * _226;
    float _242 = _96 * _232;
    float _244 = _96 * _238;
    float _246 = _240 * _240;
    float _248 = in.m_55.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = fma(_242, _242, _246);
    float _256 = fma(_244, _244, _254);
    float _258 = rsqrt(_256);
    float _260 = _242 * _258;
    float _262 = _240 * _258;
    float _264 = _244 * _258;
    float _266 = _96 * _252;
    float _268 = abs(_260);
    float _270 = abs(_262);
    float _272 = precise::max(_268, _270);
    float _274 = abs(_264);
    float _276 = precise::max(_274, _272);
    float _278 = 1.0 / _276;
    float _280 = _262 * _278;
    float _282 = -_278;
    float _284 = _264 * _282;
    float _286 = precise::min(_266, 1.0);
    float _288 = _260 * _278;
    float3 _791 = float3(_288, _280, _284);
    float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_791, float3(0.0), isnan(_791)), level(_286)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_791, float3(0.0), isnan(_791)), level(_286)).xyz;
    float _294 = _292.x;
    float _296 = _292.y;
    float _298 = _292.z;
    float _300 = in.m_57.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_55.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_57.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_57.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_59.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_59.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_59.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_61.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_61.w;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_61.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_61.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _96 * _304;
    float _368 = _96 * _310;
    float _370 = _96 * _316;
    float _372 = _96 * _322;
    float _374 = _166 * _368;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _96 * _328;
    float _380 = _96 * _334;
    float _382 = _96 * _364;
    float _384 = fma(_296, 0.20999999344348907470703125, _366);
    float _386 = fma(_294, 0.20999999344348907470703125, _370);
    float _388 = fma(_298, 0.20999999344348907470703125, _372);
    float _390 = _96 * _340;
    bool _392 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _394 = _386 + _378;
    float _396 = _384 + _380;
    float _398 = _388 + _390;
    float _400 = _96 * _352;
    float _402 = _196 * _394;
    float _404 = _214 * _396;
    float _406 = _220 * _398;
    float _408 = _96 * _346;
    float _410 = _96 * _358;
    float _412 = fma(_406, _400, _382);
    float _414 = fma(_402, _400, _408);
    float _416 = fma(_404, _400, _410);
    bool _418 = !_392;
    float _420 = _376;
    if (!_418)
    {
        float _422 = in.m_63.w;
        float _424 = gl_FragCoord.w;
        float _426 = _422 * _424;
        float _428 = in.m_63.z;
        float _430 = gl_FragCoord.w;
        float _432 = _428 * _430;
        float _434 = _96 * _426;
        float _436 = _96 * _432;
        float _438 = 1.0 / _434;
        float _440 = _436 * _438;
        float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _444 = fma(_440, (*spvDescriptorSet0.fp_c8)._m0[30].w, _442);
        float _446 = 1.0 / _444;
        float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _450 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _452 = fma(_446, _448, _450);
        float _454 = _452 * 8.0;
        float _456 = precise::clamp(_454, 0.0, 1.0);
        float _458 = _376 * _456;
        _420 = _458;
    }
    float _460 = _420;
    float _462 = 0.0 + _460;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    out.m_51.x = _414;
    out.m_51.y = _416;
    out.m_51.z = _412;
    out.m_51.w = _464;
    return out;
}

