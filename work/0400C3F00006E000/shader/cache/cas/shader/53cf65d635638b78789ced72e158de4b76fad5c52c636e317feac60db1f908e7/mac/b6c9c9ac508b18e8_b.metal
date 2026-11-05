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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
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
    float2 _502 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _519 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _118 * _152;
    float _158 = _122 * _152;
    float _160 = _114 * _152;
    float _162 = _142 * _154;
    float _164 = _132 * _154;
    float _166 = _136 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_168;
    float _176 = fma(_158, _166, _174);
    float _178 = -_170;
    float _180 = fma(_160, _162, _178);
    float _182 = -_172;
    float _184 = fma(_156, _164, _182);
    float _186 = -_68;
    float _188 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _190 = _176 * _176;
    float _192 = fma(_180, _180, _190);
    float _194 = 1.0 / _188;
    float _196 = fma(_184, _184, _192);
    float _198 = rsqrt(_196);
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _202 = _194 * _200;
    float _204 = _202 * _70;
    float _206 = _202 * _72;
    float _208 = _176 * _198;
    float _210 = _180 * _198;
    float _212 = _184 * _198;
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _220 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _222 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _224 = abs(_222);
    float _226 = -_224;
    float _228 = _226 + 1.0;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = abs(_230);
    float _234 = log2(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _238 = exp2(_236);
    float _240 = _238 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _242 = fma(_208, _240, _204);
    float _244 = fma(_210, _240, _206);
    float _246 = fma(_212, _240, _202);
    float _248 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _250 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _248);
    float _252 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _254 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].z, _250);
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _252);
    float _258 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _260 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _262 = _254 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _264 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].z, _256);
    float _266 = 1.0 / _262;
    float _268 = _264 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _270 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _258);
    float _272 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _274 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _270);
    float _276 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _278 = _274 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _280 = _276 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _282 = _268 * _266;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _278 * _266;
    float _288 = _280 * _266;
    float _290 = rint(_284);
    float _292 = precise::max(_290, 0.0);
    uint _295 = uint(_292);
    uint _297 = clamp(_295, 0u, 65535u);
    float _299 = fma(_218, 1.5, _286);
    float _301 = fma(_220, 1.5, _288);
    float _303 = fma(_218, 0.5, _286);
    float _305 = fma(_218, -0.5, _286);
    float _307 = fma(_218, -1.5, _286);
    float3 _919 = float3(_299, _301, float(int(_297)));
    float3 _923 = select(_919, float3(0.0), isnan(_919));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _923.xy, uint(rint(_923.z)), 1.0);
    float3 _931 = float3(_303, _301, float(int(_297)));
    float3 _933 = select(_931, float3(0.0), isnan(_931));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _933.xy, uint(rint(_933.z)), 1.0);
    float3 _941 = float3(_305, _301, float(int(_297)));
    float3 _943 = select(_941, float3(0.0), isnan(_941));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _943.xy, uint(rint(_943.z)), 1.0);
    float3 _951 = float3(_307, _301, float(int(_297)));
    float3 _953 = select(_951, float3(0.0), isnan(_951));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _953.xy, uint(rint(_953.z)), 1.0);
    float2 _958 = float2(_54, _56);
    float2 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_958, float2(0.0), isnan(_958))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_958, float2(0.0), isnan(_958))).xy;
    float _321 = _319.x;
    float _323 = _319.y;
    float _325 = _204 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _327 = _204 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _329 = fma(_220, 0.5, _288);
    float _331 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[15].x, _325);
    float _333 = _204 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _335 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[13].x, _327);
    float _337 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[15].z, _331);
    float _339 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[13].z, _335);
    float _341 = _337 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _343 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[12].x, _333);
    float _345 = fma(_220, -0.5, _288);
    float _347 = fma(_220, -1.5, _288);
    float _349 = _339 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _351 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[12].z, _343);
    float _353 = 1.0 / _341;
    float _355 = _351 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _357 = _355 * _353;
    float _359 = _349 * _353;
    float _361 = _309 + _311;
    float _363 = _361 + _313;
    float _365 = fma(_321, 2.0, -1.0);
    float _367 = fma(_323, 2.0, -1.0);
    float _369 = _363 + _315;
    float3 _1062 = float3(_303, _329, float(int(_297)));
    float3 _1064 = select(_1062, float3(0.0), isnan(_1062));
    float _371 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1064.xy, uint(rint(_1064.z)), 1.0);
    float3 _1072 = float3(_299, _329, float(int(_297)));
    float3 _1074 = select(_1072, float3(0.0), isnan(_1072));
    float _373 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1074.xy, uint(rint(_1074.z)), 1.0);
    float3 _1082 = float3(_305, _329, float(int(_297)));
    float3 _1084 = select(_1082, float3(0.0), isnan(_1082));
    float _375 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1084.xy, uint(rint(_1084.z)), 1.0);
    float3 _1092 = float3(_307, _329, float(int(_297)));
    float3 _1094 = select(_1092, float3(0.0), isnan(_1092));
    float _377 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1094.xy, uint(rint(_1094.z)), 1.0);
    float3 _1102 = float3(_299, _345, float(int(_297)));
    float3 _1104 = select(_1102, float3(0.0), isnan(_1102));
    float _379 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1104.xy, uint(rint(_1104.z)), 1.0);
    float3 _1112 = float3(_303, _345, float(int(_297)));
    float3 _1114 = select(_1112, float3(0.0), isnan(_1112));
    float _381 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1114.xy, uint(rint(_1114.z)), 1.0);
    float3 _1122 = float3(_305, _345, float(int(_297)));
    float3 _1124 = select(_1122, float3(0.0), isnan(_1122));
    float _383 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1124.xy, uint(rint(_1124.z)), 1.0);
    float2 _1129 = float2(_357, _359);
    float2 _385 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1129, float2(0.0), isnan(_1129))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1129, float2(0.0), isnan(_1129))).xy;
    float _387 = _385.x;
    float _389 = _385.y;
    float _391 = _365 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _393 = _367 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _395 = fma(_391, 2.0, _54);
    float _397 = fma(_393, 2.0, _56);
    float3 _1159 = float3(_307, _345, float(int(_297)));
    float3 _1161 = select(_1159, float3(0.0), isnan(_1159));
    float _399 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1161.xy, uint(rint(_1161.z)), 1.0);
    float3 _1169 = float3(_299, _347, float(int(_297)));
    float3 _1171 = select(_1169, float3(0.0), isnan(_1169));
    float _401 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1171.xy, uint(rint(_1171.z)), 1.0);
    float3 _1179 = float3(_303, _347, float(int(_297)));
    float3 _1181 = select(_1179, float3(0.0), isnan(_1179));
    float _403 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1181.xy, uint(rint(_1181.z)), 1.0);
    float3 _1189 = float3(_305, _347, float(int(_297)));
    float3 _1191 = select(_1189, float3(0.0), isnan(_1189));
    float _405 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1191.xy, uint(rint(_1191.z)), 1.0);
    float3 _1199 = float3(_307, _347, float(int(_297)));
    float3 _1201 = select(_1199, float3(0.0), isnan(_1199));
    float _407 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1201.xy, uint(rint(_1201.z)), 1.0);
    float2 _1206 = float2(_395, _397);
    float _409 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1206, float2(0.0), isnan(_1206))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1206, float2(0.0), isnan(_1206))).x;
    float _411 = _204 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _413 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[14].x, _411);
    float _415 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[14].z, _413);
    float _417 = _415 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _419 = precise::min(_417, 1.0);
    float _421 = -_202;
    float _423 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _425 = _421 + _423;
    float _427 = -_202;
    float _429 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _431 = _427 + _429;
    float _433 = _425 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _431 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = _369 + _373;
    float _443 = _441 + _371;
    float _445 = _443 + _375;
    float _447 = -_387;
    float _449 = fma(_447, _387, _389);
    float _451 = -_387;
    float _453 = _419 + _451;
    float _455 = _445 + _377;
    float _457 = fma(_453, _453, _449);
    float _459 = _455 + _379;
    bool _463 = _453 <= 0.001000000047497451305389404296875;
    float _465 = float(_463);
    float _467 = _459 + _381;
    float _469 = 1.0 / _457;
    float _471 = _467 + _383;
    float _473 = _471 + _399;
    float _475 = _473 + _401;
    float _477 = _475 + _403;
    float _479 = _449 * _469;
    float _481 = _477 + _405;
    float _483 = precise::max(_479, _465);
    float _485 = _481 + _407;
    float _487 = precise::min(_483, 1.0);
    float _489 = fma(_485, 0.0625, _435);
    float _491 = _439 + _487;
    out.m_47.x = _409;
    out.m_47.y = _489;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _491;
    return out;
}

