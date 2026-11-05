#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _419 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _436 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_436, float2(0.0), isnan(_436))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _72 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _70, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = rsqrt(_148);
    float _154 = _116 * _150;
    float _156 = _120 * _150;
    float _158 = _112 * _150;
    float _160 = _140 * _152;
    float _162 = _130 * _152;
    float _164 = _134 * _152;
    float _166 = _154 * _160;
    float _168 = _156 * _162;
    float _170 = -_166;
    float _172 = fma(_156, _164, _170);
    float _174 = _158 * _164;
    float _176 = -_168;
    float _178 = fma(_158, _160, _176);
    float _180 = _172 * _172;
    float _182 = -_174;
    float _184 = fma(_154, _162, _182);
    float _186 = -_66;
    float _188 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _190 = fma(_178, _178, _180);
    float _192 = fma(_184, _184, _190);
    float _194 = 1.0 / _188;
    float _196 = rsqrt(_192);
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _200 = _194 * _198;
    float _202 = _200 * _68;
    float _204 = _200 * _72;
    float _206 = _172 * _196;
    float _208 = _178 * _196;
    float _210 = _184 * _196;
    float _212 = _202 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _214 = _206 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _218 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[15].x, _212);
    float _220 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _222 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[13].x, _216);
    float _224 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].z, _220);
    float _226 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[13].z, _222);
    float _228 = abs(_224);
    float _230 = -_228;
    float _232 = _230 + 1.0;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _226 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _238 = abs(_234);
    float _240 = log2(_238);
    float _242 = _240 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _244 = exp2(_242);
    float _246 = _244 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _248 = fma(_206, _246, _202);
    float _250 = fma(_208, _246, _204);
    float _252 = fma(_210, _246, _200);
    float _254 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].z, _218);
    float _256 = _248 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _258 = _202 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _260 = _248 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _262 = _254 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _264 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].x, _256);
    float _266 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[12].x, _258);
    float _268 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _270 = 1.0 / _262;
    float _272 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].z, _264);
    float _274 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[12].z, _266);
    float _276 = _248 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _278 = _248 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _282 = _274 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _284 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
    float _286 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
    float _288 = 1.0 / _280;
    float _290 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _292 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
    float _294 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].z, _286);
    float _296 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _298 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _300 = _282 * _270;
    float _302 = _236 * _270;
    float _304 = _294 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float2 _846 = float2(_300, _302);
    float2 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_846, float2(0.0), isnan(_846))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_846, float2(0.0), isnan(_846))).xy;
    float _310 = _308.x;
    float _312 = _308.y;
    float _314 = _304 * _288;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _298 * _288;
    float _320 = _296 * _288;
    float _322 = _316 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _324 = _322 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _326 = _322 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _328 = fma(_324, 0.5, _318);
    float _330 = fma(_324, -0.5, _318);
    float _332 = fma(_326, 0.5, _320);
    float _334 = fma(_326, -0.5, _320);
    float3 _898 = float3(_328, _332, float(0));
    float3 _902 = select(_898, float3(0.0), isnan(_898));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _902.xy, uint(rint(_902.z)), _316);
    float3 _909 = float3(_330, _332, float(0));
    float3 _911 = select(_909, float3(0.0), isnan(_909));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _911.xy, uint(rint(_911.z)), _316);
    float3 _918 = float3(_328, _334, float(0));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _920.xy, uint(rint(_920.z)), _316);
    float3 _927 = float3(_330, _334, float(0));
    float3 _929 = select(_927, float3(0.0), isnan(_927));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _929.xy, uint(rint(_929.z)), _316);
    float2 _935 = float2(_52, _54);
    float _344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_935, float2(0.0), isnan(_935))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_935, float2(0.0), isnan(_935))).x;
    float _346 = _202 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _348 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[14].x, _346);
    float _350 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[14].z, _348);
    float _352 = _350 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _354 = precise::min(_352, 1.0);
    float _356 = -_200;
    float _358 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _360 = _356 + _358;
    float _362 = -_200;
    float _364 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _366 = _362 + _364;
    float _368 = _360 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _366 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = -_310;
    float _378 = fma(_376, _310, _312);
    float _380 = -_310;
    float _382 = _354 + _380;
    float _384 = fma(_382, _382, _378);
    bool _388 = _382 <= 0.001000000047497451305389404296875;
    float _390 = float(_388);
    float _392 = 1.0 / _384;
    float _394 = _336 + _338;
    float _396 = _378 * _392;
    float _398 = _394 + _340;
    float _400 = precise::max(_396, _390);
    float _402 = _398 + _342;
    float _404 = precise::min(_400, 1.0);
    float _406 = fma(_402, 0.25, _370);
    float _408 = _374 + _404;
    out.m_45.x = _344;
    out.m_45.y = _406;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _408;
    return out;
}

