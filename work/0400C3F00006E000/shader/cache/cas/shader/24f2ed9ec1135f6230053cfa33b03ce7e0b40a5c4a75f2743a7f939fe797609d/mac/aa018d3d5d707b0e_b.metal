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
    float2 _466 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _483 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = rsqrt(_134);
    float _140 = rsqrt(_136);
    float _142 = _112 * _138;
    float _144 = _124 * _138;
    float _146 = _104 * _138;
    float _148 = -_66;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[46].z, _150);
    float _154 = _152 * _68;
    float _156 = _128 * _140;
    float _158 = _108 * _140;
    float _160 = _116 * _140;
    float _162 = _152 * _70;
    float _164 = _142 * _156;
    float _166 = _144 * _158;
    float _168 = -_164;
    float _170 = fma(_144, _160, _168);
    float _172 = _146 * _160;
    float _174 = -_166;
    float _176 = fma(_146, _156, _174);
    float _178 = _170 * _170;
    float _180 = -_172;
    float _182 = fma(_142, _158, _180);
    float _184 = _154 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _186 = fma(_176, _176, _178);
    float _188 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[15].x, _184);
    float _190 = fma(_182, _182, _186);
    float _192 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].z, _188);
    float _194 = rsqrt(_190);
    float _196 = _192 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _198 = 1.0 / _196;
    float _200 = _170 * _194;
    float _202 = _176 * _194;
    float _204 = _182 * _194;
    float _206 = _200 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _208 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].x, _206);
    float _210 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _212 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].z, _208);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = abs(_220);
    float _224 = log2(_222);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _228 = exp2(_226);
    float _230 = _228 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _232 = fma(_200, _230, _154);
    float _234 = fma(_202, _230, _162);
    float _236 = fma(_204, _230, _152);
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _240 = _232 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _242 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[3].x, _238);
    float _244 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _246 = _232 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].x, _240);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[3].z, _242);
    float _252 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _256 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].x, _244);
    float _258 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _260 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = 1.0 / _254;
    float _264 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _266 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _268 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = _154 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _274 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _272);
    float _276 = _268 * _262;
    float _278 = _260 * _262;
    float _280 = _270 * _262;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _154 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _286 = fma(_210, 0.5, _276);
    float _288 = fma(_210, 1.5, _276);
    float _290 = fma(_210, -0.5, _276);
    float _292 = fma(_210, -1.5, _276);
    float _294 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[12].x, _284);
    float _296 = rint(_282);
    float _298 = precise::max(_296, 0.0);
    uint _301 = uint(_298);
    uint _303 = clamp(_301, 0u, 65535u);
    float _305 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _307 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].z, _274);
    float _309 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].z, _294);
    float _311 = fma(_305, 1.5, _278);
    float _313 = fma(_305, 0.5, _278);
    float _315 = _309 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _317 = _307 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _929 = float3(_288, _311, float(int(_303)));
    float3 _933 = select(_929, float3(0.0), isnan(_929));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _933.xy, uint(rint(_933.z)), 1.0);
    float3 _941 = float3(_286, _311, float(int(_303)));
    float3 _943 = select(_941, float3(0.0), isnan(_941));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _943.xy, uint(rint(_943.z)), 1.0);
    float3 _951 = float3(_290, _311, float(int(_303)));
    float3 _953 = select(_951, float3(0.0), isnan(_951));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _953.xy, uint(rint(_953.z)), 1.0);
    float3 _961 = float3(_292, _311, float(int(_303)));
    float3 _963 = select(_961, float3(0.0), isnan(_961));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _963.xy, uint(rint(_963.z)), 1.0);
    float3 _971 = float3(_286, _313, float(int(_303)));
    float3 _973 = select(_971, float3(0.0), isnan(_971));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _973.xy, uint(rint(_973.z)), 1.0);
    float3 _981 = float3(_290, _313, float(int(_303)));
    float3 _983 = select(_981, float3(0.0), isnan(_981));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _983.xy, uint(rint(_983.z)), 1.0);
    float3 _991 = float3(_288, _313, float(int(_303)));
    float3 _993 = select(_991, float3(0.0), isnan(_991));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _993.xy, uint(rint(_993.z)), 1.0);
    float _333 = _317 * _198;
    float _335 = fma(_305, -0.5, _278);
    float _337 = _315 * _198;
    float3 _1010 = float3(_292, _313, float(int(_303)));
    float3 _1012 = select(_1010, float3(0.0), isnan(_1010));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1012.xy, uint(rint(_1012.z)), 1.0);
    float3 _1020 = float3(_288, _335, float(int(_303)));
    float3 _1022 = select(_1020, float3(0.0), isnan(_1020));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1022.xy, uint(rint(_1022.z)), 1.0);
    float3 _1030 = float3(_286, _335, float(int(_303)));
    float3 _1032 = select(_1030, float3(0.0), isnan(_1030));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1032.xy, uint(rint(_1032.z)), 1.0);
    float3 _1040 = float3(_290, _335, float(int(_303)));
    float3 _1042 = select(_1040, float3(0.0), isnan(_1040));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1042.xy, uint(rint(_1042.z)), 1.0);
    float2 _1047 = float2(_337, _333);
    float2 _349 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1047, float2(0.0), isnan(_1047))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1047, float2(0.0), isnan(_1047))).xy;
    float _351 = _349.x;
    float _353 = _349.y;
    float _355 = fma(_305, -1.5, _278);
    float3 _1065 = float3(_292, _335, float(int(_303)));
    float3 _1067 = select(_1065, float3(0.0), isnan(_1065));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1067.xy, uint(rint(_1067.z)), 1.0);
    float3 _1075 = float3(_288, _355, float(int(_303)));
    float3 _1077 = select(_1075, float3(0.0), isnan(_1075));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1077.xy, uint(rint(_1077.z)), 1.0);
    float3 _1085 = float3(_286, _355, float(int(_303)));
    float3 _1087 = select(_1085, float3(0.0), isnan(_1085));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1087.xy, uint(rint(_1087.z)), 1.0);
    float3 _1095 = float3(_290, _355, float(int(_303)));
    float3 _1097 = select(_1095, float3(0.0), isnan(_1095));
    float _363 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1097.xy, uint(rint(_1097.z)), 1.0);
    float3 _1105 = float3(_292, _355, float(int(_303)));
    float3 _1107 = select(_1105, float3(0.0), isnan(_1105));
    float _365 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1107.xy, uint(rint(_1107.z)), 1.0);
    float2 _1112 = float2(_52, _54);
    float _367 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1112, float2(0.0), isnan(_1112))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1112, float2(0.0), isnan(_1112))).x;
    float _369 = _154 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _371 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[14].x, _369);
    float _373 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].z, _371);
    float _375 = _373 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _377 = precise::min(_375, 1.0);
    float _379 = -_152;
    float _381 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _383 = _379 + _381;
    float _385 = _383 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = _319 + _321;
    float _391 = _389 + _323;
    float _393 = _391 + _325;
    float _395 = _393 + _331;
    float _397 = _395 + _327;
    float _399 = _397 + _329;
    float _401 = _399 + _339;
    float _403 = _401 + _341;
    float _405 = -_351;
    float _407 = fma(_405, _351, _353);
    float _409 = -_351;
    float _411 = _377 + _409;
    float _413 = _403 + _343;
    float _415 = fma(_411, _411, _407);
    bool _419 = _411 <= 0.001000000047497451305389404296875;
    float _421 = float(_419);
    float _423 = _413 + _345;
    float _425 = 1.0 / _415;
    float _427 = _423 + _357;
    float _429 = _427 + _359;
    float _431 = _429 + _361;
    float _433 = _431 + _363;
    float _435 = -_152;
    float _437 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _439 = _435 + _437;
    float _441 = _407 * _425;
    float _443 = _433 + _365;
    float _445 = _439 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = precise::max(_441, _421);
    float _451 = fma(_443, 0.0625, _387);
    float _453 = precise::min(_449, 1.0);
    float _455 = _447 + _453;
    out.m_45.x = _367;
    out.m_45.y = _451;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _455;
    return out;
}

