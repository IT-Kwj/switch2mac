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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _478 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _495 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_60;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _88;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _84;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _68 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _70, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = _120 * _154;
    float _160 = _124 * _154;
    float _162 = _116 * _154;
    float _164 = _144 * _156;
    float _166 = _134 * _156;
    float _168 = _138 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_170;
    float _176 = fma(_160, _168, _174);
    float _178 = -_172;
    float _180 = fma(_162, _164, _178);
    float _182 = _162 * _168;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _186 = _112 * _184;
    float _188 = _176 * _176;
    float _190 = -_182;
    float _192 = fma(_158, _166, _190);
    float _194 = _186 * _66;
    float _196 = fma(_180, _180, _188);
    float _198 = _186 * _68;
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _202 = fma(_192, _192, _196);
    float _204 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[15].x, _200);
    float _206 = rsqrt(_202);
    float _208 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].z, _204);
    float _210 = _176 * _206;
    float _212 = _180 * _206;
    float _214 = _192 * _206;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[35].z, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = abs(_228);
    float _232 = log2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _236 = exp2(_234);
    float _238 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = fma(_210, _238, _194);
    float _242 = fma(_212, _238, _198);
    float _244 = fma(_214, _238, _186);
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _248 = _240 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].x, _246);
    float _252 = _240 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _254 = _240 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _250);
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].x, _252);
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _262 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _264 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _258);
    float _266 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].x, _254);
    float _268 = 1.0 / _260;
    float _270 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _274 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _266);
    float _276 = _270 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _278 = _274 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _282 = _194 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _286 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[12].x, _282);
    float _288 = _276 * _268;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _272 * _268;
    float _294 = _278 * _268;
    float _296 = rint(_290);
    float _298 = precise::max(_296, 0.0);
    uint _301 = uint(_298);
    uint _303 = clamp(_301, 0u, 65535u);
    float _305 = fma(_280, 0.5, _292);
    float _307 = fma(_280, 1.5, _292);
    float _309 = fma(_280, -0.5, _292);
    float _311 = fma(_280, -1.5, _292);
    float _313 = _194 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _315 = fma(_284, 1.5, _294);
    float _317 = fma(_284, 0.5, _294);
    float _319 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _313);
    float3 _933 = float3(_307, _315, float(int(_303)));
    float3 _937 = select(_933, float3(0.0), isnan(_933));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _937.xy, uint(rint(_937.z)), 1.0);
    float3 _945 = float3(_305, _315, float(int(_303)));
    float3 _947 = select(_945, float3(0.0), isnan(_945));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _947.xy, uint(rint(_947.z)), 1.0);
    float3 _955 = float3(_309, _315, float(int(_303)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _957.xy, uint(rint(_957.z)), 1.0);
    float3 _965 = float3(_311, _315, float(int(_303)));
    float3 _967 = select(_965, float3(0.0), isnan(_965));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _967.xy, uint(rint(_967.z)), 1.0);
    float3 _975 = float3(_305, _317, float(int(_303)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _977.xy, uint(rint(_977.z)), 1.0);
    float _331 = _208 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _333 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[12].z, _286);
    float _335 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[13].z, _319);
    float _337 = 1.0 / _331;
    float _339 = _333 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _341 = _335 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _343 = fma(_284, -0.5, _294);
    float3 _1012 = float3(_309, _317, float(int(_303)));
    float3 _1014 = select(_1012, float3(0.0), isnan(_1012));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1014.xy, uint(rint(_1014.z)), 1.0);
    float3 _1022 = float3(_307, _317, float(int(_303)));
    float3 _1024 = select(_1022, float3(0.0), isnan(_1022));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1024.xy, uint(rint(_1024.z)), 1.0);
    float3 _1032 = float3(_311, _317, float(int(_303)));
    float3 _1034 = select(_1032, float3(0.0), isnan(_1032));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1034.xy, uint(rint(_1034.z)), 1.0);
    float3 _1042 = float3(_307, _343, float(int(_303)));
    float3 _1044 = select(_1042, float3(0.0), isnan(_1042));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1044.xy, uint(rint(_1044.z)), 1.0);
    float3 _1052 = float3(_305, _343, float(int(_303)));
    float3 _1054 = select(_1052, float3(0.0), isnan(_1052));
    float _353 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1054.xy, uint(rint(_1054.z)), 1.0);
    float3 _1062 = float3(_309, _343, float(int(_303)));
    float3 _1064 = select(_1062, float3(0.0), isnan(_1062));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1064.xy, uint(rint(_1064.z)), 1.0);
    float _357 = _339 * _337;
    float _359 = _341 * _337;
    float _361 = fma(_284, -1.5, _294);
    float2 _1078 = float2(_357, _359);
    float2 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1078, float2(0.0), isnan(_1078))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1078, float2(0.0), isnan(_1078))).xy;
    float _367 = _365.x;
    float _369 = _365.y;
    float3 _1093 = float3(_311, _343, float(int(_303)));
    float3 _1095 = select(_1093, float3(0.0), isnan(_1093));
    float _371 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1095.xy, uint(rint(_1095.z)), 1.0);
    float3 _1103 = float3(_307, _361, float(int(_303)));
    float3 _1105 = select(_1103, float3(0.0), isnan(_1103));
    float _373 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1105.xy, uint(rint(_1105.z)), 1.0);
    float3 _1113 = float3(_305, _361, float(int(_303)));
    float3 _1115 = select(_1113, float3(0.0), isnan(_1113));
    float _375 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1115.xy, uint(rint(_1115.z)), 1.0);
    float3 _1123 = float3(_309, _361, float(int(_303)));
    float3 _1125 = select(_1123, float3(0.0), isnan(_1123));
    float _377 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1125.xy, uint(rint(_1125.z)), 1.0);
    float3 _1133 = float3(_311, _361, float(int(_303)));
    float3 _1135 = select(_1133, float3(0.0), isnan(_1133));
    float _379 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1135.xy, uint(rint(_1135.z)), 1.0);
    float _381 = _194 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _383 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[14].x, _381);
    float _385 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[14].z, _383);
    float _387 = _385 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _389 = precise::min(_387, 1.0);
    float _391 = -_186;
    float _393 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _395 = _391 + _393;
    float _397 = _395 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = _321 + _323;
    float _403 = _401 + _325;
    float _405 = _403 + _327;
    float _407 = _405 + _347;
    float _409 = _407 + _329;
    float _411 = _409 + _345;
    float _413 = _411 + _349;
    float _415 = -_367;
    float _417 = fma(_415, _367, _369);
    float _419 = -_367;
    float _421 = _389 + _419;
    float _423 = _413 + _351;
    float _425 = fma(_421, _421, _417);
    float _427 = _423 + _353;
    bool _431 = _421 <= 0.001000000047497451305389404296875;
    float _433 = float(_431);
    float _435 = _427 + _355;
    float _437 = 1.0 / _425;
    float _439 = _435 + _371;
    float _441 = _439 + _373;
    float _443 = _441 + _375;
    float _445 = _417 * _437;
    float _447 = _443 + _377;
    float _449 = -_186;
    float _451 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _453 = _449 + _451;
    float _455 = precise::max(_445, _433);
    float _457 = _447 + _379;
    float _459 = _453 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = precise::min(_455, 1.0);
    float _465 = fma(_457, 0.0625, _461);
    float _467 = _399 + _463;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _465;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _467;
    return out;
}

