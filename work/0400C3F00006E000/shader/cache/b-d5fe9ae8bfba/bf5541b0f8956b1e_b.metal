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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
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
    float2 _441 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _458 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_458, float2(0.0), isnan(_458))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
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
    float _104 = _70 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _72, _110);
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
    float _170 = _158 * _164;
    float _172 = -_166;
    float _174 = fma(_156, _164, _172);
    float _176 = -_168;
    float _178 = fma(_158, _160, _176);
    float _180 = -_170;
    float _182 = fma(_154, _162, _180);
    float _184 = _174 * _174;
    float _186 = fma(_178, _178, _184);
    float _188 = fma(_182, _182, _186);
    float _190 = rsqrt(_188);
    float _192 = _174 * _190;
    float _194 = _178 * _190;
    float _196 = _182 * _190;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = -_66;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _220 = 1.0 / _218;
    float _222 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _224 = exp2(_222);
    float _226 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _228 = _220 * _226;
    float _230 = _228 * _68;
    float _232 = _228 * _70;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _236 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[12].x, _234);
    float _238 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[12].z, _236);
    float _242 = fma(_192, _238, _230);
    float _244 = fma(_194, _238, _232);
    float _246 = fma(_196, _238, _228);
    float _248 = _230 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _254 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _256 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[15].x, _248);
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _260 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _254);
    float _264 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[15].z, _256);
    float _266 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].z, _258);
    float _268 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _260);
    float _270 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _274 = _266 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _276 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _278 = _268 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _280 = _270 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _282 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
    float _284 = 1.0 / _274;
    float _286 = _230 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _288 = _240 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _290 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
    float _292 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _294 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _296 = 1.0 / _272;
    float _298 = _278 * _284;
    float _300 = _294 * _284;
    float _302 = _280 * _284;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[13].x, _286);
    float _308 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _310 = fma(_304, _292, _298);
    float _312 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[13].z, _306);
    float _314 = fma(_304, _308, _300);
    float _316 = _312 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _894 = float3(_310, _314, float(0));
    float3 _898 = select(_894, float3(0.0), isnan(_894));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _898.xy, uint(rint(_898.z)), _304);
    float _320 = -_308;
    float _322 = fma(_304, _320, _300);
    float _324 = _288 * _296;
    float _326 = _316 * _296;
    float _328 = -_292;
    float _330 = fma(_304, _328, _298);
    float3 _923 = float3(_298, _314, float(0));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _925.xy, uint(rint(_925.z)), _304);
    float3 _932 = float3(_330, _314, float(0));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _934.xy, uint(rint(_934.z)), _304);
    float3 _941 = float3(_310, _300, float(0));
    float3 _943 = select(_941, float3(0.0), isnan(_941));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _943.xy, uint(rint(_943.z)), _304);
    float3 _950 = float3(_298, _300, float(0));
    float3 _952 = select(_950, float3(0.0), isnan(_950));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _952.xy, uint(rint(_952.z)), _304);
    float2 _958 = float2(_324, _326);
    float2 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_958, float2(0.0), isnan(_958))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_958, float2(0.0), isnan(_958))).xy;
    float _344 = _342.x;
    float _346 = _342.y;
    float3 _971 = float3(_330, _300, float(0));
    float3 _973 = select(_971, float3(0.0), isnan(_971));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _973.xy, uint(rint(_973.z)), _304);
    float3 _980 = float3(_310, _322, float(0));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _982.xy, uint(rint(_982.z)), _304);
    float3 _989 = float3(_298, _322, float(0));
    float3 _991 = select(_989, float3(0.0), isnan(_989));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _991.xy, uint(rint(_991.z)), _304);
    float3 _998 = float3(_330, _322, float(0));
    float3 _1000 = select(_998, float3(0.0), isnan(_998));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1000.xy, uint(rint(_1000.z)), _304);
    float2 _1006 = float2(_52, _54);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1006, float2(0.0), isnan(_1006))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1006, float2(0.0), isnan(_1006))).x;
    float _358 = _230 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _360 = -_228;
    float _362 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _364 = _360 + _362;
    float _366 = -_228;
    float _368 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _370 = _366 + _368;
    float _372 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[14].x, _358);
    float _374 = _364 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _370 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[14].z, _372);
    float _384 = _382 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _386 = precise::min(_384, 1.0);
    float _388 = _318 + _332;
    float _390 = _388 + _334;
    float _392 = _390 + _336;
    float _394 = -_344;
    float _396 = fma(_394, _344, _346);
    float _398 = -_344;
    float _400 = _386 + _398;
    float _402 = _392 + _338;
    float _404 = fma(_400, _400, _396);
    bool _408 = _400 <= 0.001000000047497451305389404296875;
    float _410 = float(_408);
    float _412 = 1.0 / _404;
    float _414 = _402 + _348;
    float _416 = _414 + _350;
    float _418 = _396 * _412;
    float _420 = _416 + _352;
    float _422 = precise::max(_418, _410);
    float _424 = _420 + _354;
    float _426 = precise::min(_422, 1.0);
    float _428 = fma(_424, 0.111111111938953399658203125, _376);
    float _430 = _380 + _426;
    out.m_45.x = _356;
    out.m_45.y = _428;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _430;
    return out;
}

