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
    float2 _466 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _483 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float2 _491 = float2(_54, _56);
    float2 _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_491, float2(0.0), isnan(_491))).xy;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = in.m_40.y;
    float _80 = in.m_42.y;
    float _82 = in.m_40.x;
    float _84 = in.m_44.y;
    float _86 = in.m_42.x;
    float _88 = in.m_44.x;
    float _90 = -_62;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = -_66;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = 1.0 / _96;
    float _106 = 1.0 / _100;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _102 * _108;
    float _112 = _78 * _110;
    float _114 = _82 * _110;
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _118 = _104 * _116;
    float _120 = -_112;
    float _122 = fma(_118, _80, _120);
    float _124 = -_114;
    float _126 = fma(_118, _86, _124);
    float _128 = -_110;
    float _130 = _128 + _118;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _134 = _106 * _132;
    float _136 = _122 * _122;
    float _138 = -_112;
    float _140 = fma(_134, _84, _138);
    float _142 = -_114;
    float _144 = fma(_134, _88, _142);
    float _146 = fma(_126, _126, _136);
    float _148 = -_110;
    float _150 = _148 + _134;
    float _152 = _140 * _140;
    float _154 = fma(_130, _130, _146);
    float _156 = fma(_144, _144, _152);
    float _158 = fma(_150, _150, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _126 * _160;
    float _166 = _130 * _160;
    float _168 = _122 * _160;
    float _170 = _150 * _162;
    float _172 = _140 * _162;
    float _174 = _144 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = _182 * _182;
    float _192 = -_184;
    float _194 = fma(_164, _172, _192);
    float _196 = fma(_188, _188, _190);
    float _198 = fma(_194, _194, _196);
    float _200 = rsqrt(_198);
    float _202 = _182 * _200;
    float _204 = _188 * _200;
    float _206 = _194 * _200;
    float _208 = -_68;
    float _210 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _212 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _214 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _212);
    float _216 = 1.0 / _210;
    float _218 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _214);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = abs(_226);
    float _230 = log2(_228);
    float _232 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _234 = _216 * _232;
    float _236 = _234 * _78;
    float _238 = _234 * _82;
    float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _244 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[15].x, _240);
    float _246 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[15].z, _244);
    float _250 = exp2(_246);
    float _252 = _248 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = _236 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _256 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[12].x, _254);
    float _258 = 1.0 / _252;
    float _260 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[12].z, _256);
    float _262 = _260 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _264 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_202, _264, _236);
    float _268 = fma(_204, _264, _238);
    float _270 = fma(_206, _264, _234);
    float _272 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[13].x, _242);
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _276 = _262 * _258;
    float _278 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[13].z, _272);
    float _280 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _274);
    float _282 = _278 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _284 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _280);
    float _286 = fma(_76, 2.0, -1.0);
    float _288 = _282 * _258;
    float _290 = _284 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _292 = _266 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _294 = 1.0 / _290;
    float _296 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
    float _298 = _266 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _300 = _266 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _302 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _296);
    float _304 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _298);
    float _306 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _300);
    float _308 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _310 = fma(_74, 2.0, -1.0);
    float _312 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _304);
    float _314 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
    float _316 = _310 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _318 = _312 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _320 = _308 * _294;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _314 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _326 = _286 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _328 = _318 * _294;
    float _330 = fma(_316, 2.0, _54);
    float _332 = _324 * _294;
    float _334 = rint(_322);
    float _336 = precise::max(_334, 0.0);
    uint _339 = uint(_336);
    uint _341 = clamp(_339, 0u, 65535u);
    float _343 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _345 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _343, _328);
    float _347 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _328);
    float _349 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _332);
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _353 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _351, _332);
    float _355 = fma(_326, 2.0, _56);
    float3 _980 = float3(_328, _349, float(int(_341)));
    float3 _984 = select(_980, float3(0.0), isnan(_980));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _984.xy, uint(rint(_984.z)), 1.0);
    float3 _992 = float3(_347, _349, float(int(_341)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _994.xy, uint(rint(_994.z)), 1.0);
    float3 _1002 = float3(_345, _349, float(int(_341)));
    float3 _1004 = select(_1002, float3(0.0), isnan(_1002));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1004.xy, uint(rint(_1004.z)), 1.0);
    float3 _1012 = float3(_347, _332, float(int(_341)));
    float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1014.xy, uint(rint(_1014.z)), 1.0);
    float3 _1022 = float3(_328, _332, float(int(_341)));
    float3 _1024 = select(_1022, float3(0.0), isnan(_1022));
    float _365 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1024.xy, uint(rint(_1024.z)), 1.0);
    float2 _1029 = float2(_276, _288);
    float2 _367 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1029, float2(0.0), isnan(_1029))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1029, float2(0.0), isnan(_1029))).xy;
    float _369 = _367.x;
    float _371 = _367.y;
    float3 _1044 = float3(_345, _332, float(int(_341)));
    float3 _1046 = select(_1044, float3(0.0), isnan(_1044));
    float _373 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1046.xy, uint(rint(_1046.z)), 1.0);
    float3 _1054 = float3(_347, _353, float(int(_341)));
    float3 _1056 = select(_1054, float3(0.0), isnan(_1054));
    float _375 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1056.xy, uint(rint(_1056.z)), 1.0);
    float3 _1064 = float3(_328, _353, float(int(_341)));
    float3 _1066 = select(_1064, float3(0.0), isnan(_1064));
    float _377 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1066.xy, uint(rint(_1066.z)), 1.0);
    float3 _1074 = float3(_345, _353, float(int(_341)));
    float3 _1076 = select(_1074, float3(0.0), isnan(_1074));
    float _379 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1076.xy, uint(rint(_1076.z)), 1.0);
    float2 _1081 = float2(_330, _355);
    float _381 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1081, float2(0.0), isnan(_1081))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1081, float2(0.0), isnan(_1081))).x;
    float _383 = _236 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _385 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[14].x, _383);
    float _387 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[14].z, _385);
    float _389 = _387 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _391 = precise::min(_389, 1.0);
    float _393 = -_234;
    float _395 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _397 = _393 + _395;
    float _399 = -_234;
    float _401 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _403 = _399 + _401;
    float _405 = _397 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = _403 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = _359 + _357;
    float _415 = -_369;
    float _417 = fma(_415, _369, _371);
    float _419 = -_369;
    float _421 = _391 + _419;
    float _423 = _413 + _361;
    float _425 = fma(_421, _421, _417);
    float _427 = _423 + _363;
    bool _431 = _421 <= 0.001000000047497451305389404296875;
    float _433 = float(_431);
    float _435 = 1.0 / _425;
    float _437 = _427 + _365;
    float _439 = _437 + _373;
    float _441 = _439 + _375;
    float _443 = _417 * _435;
    float _445 = _441 + _377;
    float _447 = precise::max(_443, _433);
    float _449 = _445 + _379;
    float _451 = precise::min(_447, 1.0);
    float _453 = fma(_449, 0.111111111938953399658203125, _407);
    float _455 = _411 + _451;
    out.m_47.x = _381;
    out.m_47.y = _453;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _455;
    return out;
}

