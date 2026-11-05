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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _450 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _467 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_467, float2(0.0), isnan(_467))).x;
    float2 _475 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_475, float2(0.0), isnan(_475))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_40.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = _78 * _94;
    float _110 = _80 * _94;
    float _112 = -_108;
    float _114 = fma(_100, _82, _112);
    float _116 = -_108;
    float _118 = fma(_106, _84, _116);
    float _120 = -_110;
    float _122 = fma(_100, _86, _120);
    float _124 = -_110;
    float _126 = fma(_106, _88, _124);
    float _128 = _114 * _114;
    float _130 = _118 * _118;
    float _132 = -_94;
    float _134 = _132 + _100;
    float _136 = -_94;
    float _138 = _136 + _106;
    float _140 = fma(_122, _122, _128);
    float _142 = fma(_126, _126, _130);
    float _144 = fma(_134, _134, _140);
    float _146 = fma(_138, _138, _142);
    float _148 = rsqrt(_144);
    float _150 = rsqrt(_146);
    float _152 = _122 * _148;
    float _154 = _134 * _148;
    float _156 = _114 * _148;
    float _158 = _138 * _150;
    float _160 = _118 * _150;
    float _162 = _126 * _150;
    float _164 = _152 * _158;
    float _166 = _154 * _160;
    float _168 = -_164;
    float _170 = fma(_154, _162, _168);
    float _172 = -_166;
    float _174 = fma(_156, _158, _172);
    float _176 = _156 * _162;
    float _178 = _170 * _170;
    float _180 = -_176;
    float _182 = fma(_152, _160, _180);
    float _184 = fma(_174, _174, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _170 * _188;
    float _192 = _174 * _188;
    float _194 = _182 * _188;
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _216 = -_68;
    float _218 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _220 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[46].z, _218);
    float _222 = _220 * _78;
    float _224 = exp2(_214);
    float _226 = _220 * _80;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _230 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[15].x, _228);
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[15].z, _230);
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _236 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = _222 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _240 = 1.0 / _234;
    float _242 = fma(_190, _236, _222);
    float _244 = fma(_192, _236, _226);
    float _246 = fma(_194, _236, _220);
    float _248 = _222 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[12].x, _238);
    float _254 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[13].x, _248);
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _258 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[12].z, _252);
    float _260 = fma(_76, 2.0, -1.0);
    float _262 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[13].z, _254);
    float _264 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].z, _256);
    float _266 = _258 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _268 = _262 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _270 = _264 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _272 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _274 = _266 * _240;
    float _276 = _268 * _240;
    float _278 = 1.0 / _270;
    float _280 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
    float _282 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _284 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _286 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].z, _280);
    float _288 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
    float _290 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
    float _292 = _286 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _294 = fma(_74, 2.0, -1.0);
    float _296 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
    float _298 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
    float _300 = _294 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _302 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _304 = _292 * _278;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = _298 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _310 = _260 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _312 = _302 * _278;
    float _314 = fma(_300, 2.0, _54);
    float _316 = _308 * _278;
    float _318 = rint(_306);
    float _320 = precise::max(_318, 0.0);
    uint _323 = uint(_320);
    uint _325 = clamp(_323, 0u, 65535u);
    float _327 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _329 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _327, _312);
    float _331 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _312);
    float _333 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _316);
    float _335 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _337 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _335, _316);
    float _339 = fma(_310, 2.0, _56);
    float3 _948 = float3(_312, _333, float(int(_325)));
    float3 _952 = select(_948, float3(0.0), isnan(_948));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _952.xy, uint(rint(_952.z)), 1.0);
    float3 _960 = float3(_331, _333, float(int(_325)));
    float3 _962 = select(_960, float3(0.0), isnan(_960));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _962.xy, uint(rint(_962.z)), 1.0);
    float3 _970 = float3(_329, _333, float(int(_325)));
    float3 _972 = select(_970, float3(0.0), isnan(_970));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _972.xy, uint(rint(_972.z)), 1.0);
    float3 _980 = float3(_331, _316, float(int(_325)));
    float3 _982 = select(_980, float3(0.0), isnan(_980));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _982.xy, uint(rint(_982.z)), 1.0);
    float3 _990 = float3(_312, _316, float(int(_325)));
    float3 _992 = select(_990, float3(0.0), isnan(_990));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _992.xy, uint(rint(_992.z)), 1.0);
    float2 _997 = float2(_274, _276);
    float2 _351 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_997, float2(0.0), isnan(_997))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_997, float2(0.0), isnan(_997))).xy;
    float _353 = _351.x;
    float _355 = _351.y;
    float3 _1012 = float3(_329, _316, float(int(_325)));
    float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1014.xy, uint(rint(_1014.z)), 1.0);
    float3 _1022 = float3(_331, _337, float(int(_325)));
    float3 _1024 = select(_1022, float3(0.0), isnan(_1022));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1024.xy, uint(rint(_1024.z)), 1.0);
    float3 _1032 = float3(_312, _337, float(int(_325)));
    float3 _1034 = select(_1032, float3(0.0), isnan(_1032));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1034.xy, uint(rint(_1034.z)), 1.0);
    float3 _1042 = float3(_329, _337, float(int(_325)));
    float3 _1044 = select(_1042, float3(0.0), isnan(_1042));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1044.xy, uint(rint(_1044.z)), 1.0);
    float2 _1049 = float2(_314, _339);
    float _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1049, float2(0.0), isnan(_1049))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1049, float2(0.0), isnan(_1049))).x;
    float _367 = _222 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _369 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[14].x, _367);
    float _371 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[14].z, _369);
    float _373 = _371 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _375 = precise::min(_373, 1.0);
    float _377 = -_220;
    float _379 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _381 = _377 + _379;
    float _383 = -_220;
    float _385 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _387 = _383 + _385;
    float _389 = _381 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _387 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = _343 + _341;
    float _399 = -_353;
    float _401 = fma(_399, _353, _355);
    float _403 = -_353;
    float _405 = _375 + _403;
    float _407 = _397 + _345;
    float _409 = fma(_405, _405, _401);
    float _411 = _407 + _347;
    bool _415 = _405 <= 0.001000000047497451305389404296875;
    float _417 = float(_415);
    float _419 = 1.0 / _409;
    float _421 = _411 + _349;
    float _423 = _421 + _357;
    float _425 = _423 + _359;
    float _427 = _401 * _419;
    float _429 = _425 + _361;
    float _431 = precise::max(_427, _417);
    float _433 = _429 + _363;
    float _435 = precise::min(_431, 1.0);
    float _437 = fma(_433, 0.111111111938953399658203125, _391);
    float _439 = _395 + _435;
    out.m_47.x = _365;
    out.m_47.y = _437;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _439;
    return out;
}

