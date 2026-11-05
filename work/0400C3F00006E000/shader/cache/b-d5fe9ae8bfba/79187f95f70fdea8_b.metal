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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
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
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
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
    float _86 = in.m_42.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.y;
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
    float2 _517 = float2(_112, _118);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_517, float2(0.0), isnan(_517))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_517, float2(0.0), isnan(_517))).w;
    float2 _528 = float2(_114, _116);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_528, float2(0.0), isnan(_528))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_528, float2(0.0), isnan(_528))).w;
    float2 _536 = float2(_122, _120);
    float _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_536, float2(0.0), isnan(_536))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_536, float2(0.0), isnan(_536))).w;
    float _130 = in.m_46.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_48.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_50.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _110 * _134;
    float _150 = _110 * _140;
    float _152 = _110 * _146;
    float _154 = _124 * _126;
    float _156 = -_148;
    float _158 = fma(_154, _128, _156);
    float _160 = _150 * _158;
    float _162 = 0.0 + _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 * _152;
    bool _170 = _166 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _172 = isnan(_166);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _178 = _174 || _176;
    float _180 = in.m_46.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_46.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_46.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_178)
    {
        discard_fragment();
    }
    float _198 = _110 * _184;
    float _200 = _110 * _190;
    float _202 = _110 * _196;
    if (!_178)
    {
        out.m_53.x = _198;
        out.m_53.y = _200;
        out.m_53.z = _202;
        out.m_53.w = _160;
        return out;
    }
    float _204 = in.m_55.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_55.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_55.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_57.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _110 * _208;
    float _230 = _110 * _214;
    float _232 = _110 * _220;
    float _234 = _228 * _228;
    float _236 = fma(_230, _230, _234);
    float _238 = fma(_232, _232, _236);
    float _240 = rsqrt(_238);
    float _242 = _230 * _240;
    float _244 = _228 * _240;
    float _246 = _232 * _240;
    float _248 = abs(_242);
    float _250 = abs(_244);
    float _252 = precise::max(_248, _250);
    float _254 = abs(_246);
    float _256 = precise::max(_254, _252);
    float _258 = _110 * _226;
    float _260 = 1.0 / _256;
    float _262 = precise::min(_258, 1.0);
    float _264 = -_260;
    float _266 = _246 * _264;
    float _268 = _242 * _260;
    float _270 = _244 * _260;
    float3 _748 = float3(_268, _270, _266);
    float3 _274 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_748, float3(0.0), isnan(_748)), level(_262)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_748, float3(0.0), isnan(_748)), level(_262)).xyz;
    float _276 = _274.x;
    float _278 = _274.y;
    float _280 = _274.z;
    float _282 = in.m_59.y;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_61.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_59.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_59.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_61.z;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_61.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_63.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_63.w;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_63.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_63.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = _110 * _286;
    float _344 = _110 * _298;
    float _346 = _110 * _304;
    float _348 = fma(_278, 0.20999999344348907470703125, _342);
    float _350 = _110 * _292;
    float _352 = fma(_280, 0.20999999344348907470703125, _344);
    float _354 = fma(_276, 0.20999999344348907470703125, _346);
    float _356 = _110 * _310;
    bool _358 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _360 = _110 * _316;
    float _362 = _348 + _350;
    float _364 = _352 + _356;
    float _366 = 0.0 + _166;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _354 + _360;
    float _372 = _110 * _328;
    float _374 = _202 * _364;
    float _376 = _110 * _322;
    float _378 = _198 * _370;
    float _380 = _200 * _362;
    float _382 = _110 * _334;
    float _384 = _110 * _340;
    float _386 = fma(_378, _372, _376);
    float _388 = _376;
    if (!_358)
    {
        _388 = _368;
    }
    float _390 = _388;
    float _392 = fma(_380, _372, _382);
    float _394 = fma(_374, _372, _384);
    bool _396 = !_358;
    float _398 = _390;
    if (!_396)
    {
        float _400 = in.m_65.w;
        float _402 = gl_FragCoord.w;
        float _404 = _400 * _402;
        float _406 = in.m_65.z;
        float _408 = gl_FragCoord.w;
        float _410 = _406 * _408;
        float _412 = _110 * _404;
        float _414 = _110 * _410;
        float _416 = 1.0 / _412;
        float _418 = _414 * _416;
        float _420 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _422 = fma(_418, (*spvDescriptorSet0.fp_c8)._m0[30].w, _420);
        float _424 = 1.0 / _422;
        float _426 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _428 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _430 = fma(_424, _426, _428);
        float _432 = _430 * 8.0;
        float _434 = precise::clamp(_432, 0.0, 1.0);
        float _436 = _368 * _434;
        _398 = _436;
    }
    float _438 = _398;
    float _440 = 0.0 + _438;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    out.m_53.x = _386;
    out.m_53.y = _392;
    out.m_53.z = _394;
    out.m_53.w = _442;
    return out;
}

