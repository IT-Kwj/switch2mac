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
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_42 [[user(locn4), flat]];
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
    float _72 = in.m_40.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _469 = float2(_88, _86);
    float2 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469))).xy;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = in.m_42.x;
    float _100 = in.m_40.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_40.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _98 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _114 = _98 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _116 = _84 * _104;
    float _118 = _84 * _110;
    float _120 = fma(_112, _94, _116);
    float _122 = fma(_114, _96, _118);
    float2 _526 = float2(_120, _122);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_526, float2(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_526, float2(0.0), isnan(_526))).w;
    float _126 = in.m_44.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_46.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_48.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _84 * _130;
    float _146 = _84 * _136;
    float _148 = in.m_44.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_44.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = -_144;
    float _162 = _124 + _160;
    float _164 = _146 * _162;
    float _166 = _84 * _142;
    float _168 = 0.0 + _164;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _170 * _166;
    bool _176 = _172 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _178 = isnan(_172);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _184 = _180 || _182;
    float _186 = in.m_44.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    if (!_184)
    {
        discard_fragment();
    }
    float _192 = _84 * _152;
    float _194 = _84 * _158;
    float _196 = _84 * _190;
    if (!_184)
    {
        out.m_51.x = _192;
        out.m_51.y = _196;
        out.m_51.z = _194;
        out.m_51.w = _164;
        return out;
    }
    float _198 = in.m_53.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_53.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_53.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = _84 * _202;
    float _218 = _84 * _208;
    float _220 = _84 * _214;
    float _222 = _216 * _216;
    float _224 = in.m_55.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = fma(_218, _218, _222);
    float _232 = fma(_220, _220, _230);
    float _234 = rsqrt(_232);
    float _236 = _218 * _234;
    float _238 = _216 * _234;
    float _240 = _220 * _234;
    float _242 = _84 * _228;
    float _244 = abs(_236);
    float _246 = abs(_238);
    float _248 = precise::max(_244, _246);
    float _250 = abs(_240);
    float _252 = precise::max(_250, _248);
    float _254 = 1.0 / _252;
    float _256 = _238 * _254;
    float _258 = -_254;
    float _260 = _240 * _258;
    float _262 = precise::min(_242, 1.0);
    float _264 = _236 * _254;
    float3 _732 = float3(_264, _256, _260);
    float3 _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_732, float3(0.0), isnan(_732)), level(_262)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_732, float3(0.0), isnan(_732)), level(_262)).xyz;
    float _270 = _268.x;
    float _272 = _268.y;
    float _274 = _268.z;
    float _276 = in.m_57.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_57.z;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_57.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_59.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_59.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_59.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_61.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_61.w;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_61.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_61.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = _84 * _280;
    float _338 = _84 * _286;
    float _340 = _84 * _292;
    bool _342 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _344 = fma(_272, 0.20999999344348907470703125, _336);
    float _346 = fma(_274, 0.20999999344348907470703125, _338);
    float _348 = fma(_270, 0.20999999344348907470703125, _340);
    float _350 = _84 * _298;
    float _352 = _84 * _304;
    float _354 = _84 * _310;
    float _356 = _344 + _350;
    float _358 = _346 + _352;
    float _360 = _348 + _354;
    float _362 = _84 * _322;
    float _364 = _196 * _356;
    float _366 = _194 * _358;
    float _368 = _192 * _360;
    float _370 = 0.0 + _172;
    float _372 = precise::clamp(_370, 0.0, 1.0);
    float _374 = _84 * _316;
    float _376 = _84 * _328;
    float _378 = _84 * _334;
    float _380 = fma(_368, _362, _374);
    float _382 = fma(_364, _362, _376);
    float _384 = fma(_366, _362, _378);
    float _386 = _374;
    if (!_342)
    {
        _386 = _372;
    }
    float _388 = _386;
    bool _390 = !_342;
    float _392 = _388;
    if (!_390)
    {
        float _394 = in.m_63.w;
        float _396 = gl_FragCoord.w;
        float _398 = _394 * _396;
        float _400 = in.m_63.z;
        float _402 = gl_FragCoord.w;
        float _404 = _400 * _402;
        float _406 = _84 * _398;
        float _408 = _84 * _404;
        float _410 = 1.0 / _406;
        float _412 = _408 * _410;
        float _414 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _416 = fma(_412, (*spvDescriptorSet0.fp_c8)._m0[30].w, _414);
        float _418 = 1.0 / _416;
        float _420 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _424 = fma(_418, _420, _422);
        float _426 = _424 * 8.0;
        float _428 = precise::clamp(_426, 0.0, 1.0);
        float _430 = _372 * _428;
        _392 = _430;
    }
    float _432 = _392;
    float _434 = 0.0 + _432;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    out.m_51.x = _380;
    out.m_51.y = _382;
    out.m_51.z = _384;
    out.m_51.w = _436;
    return out;
}

