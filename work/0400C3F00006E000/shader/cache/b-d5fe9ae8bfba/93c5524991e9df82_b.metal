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
    float2 _482 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _499 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_499, float2(0.0), isnan(_499))).x;
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
    float _184 = -_66;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _188 = _174 * _174;
    float _190 = fma(_178, _178, _188);
    float _192 = 1.0 / _186;
    float _194 = fma(_182, _182, _190);
    float _196 = rsqrt(_194);
    float _198 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _200 = _192 * _198;
    float _202 = _200 * _68;
    float _204 = _200 * _70;
    float _206 = _202 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _208 = _174 * _196;
    float _210 = _178 * _196;
    float _212 = _182 * _196;
    float _214 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[15].x, _206);
    float _216 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _220 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].z, _214);
    float _222 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _224 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _226 = _220 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _228 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _222);
    float _230 = abs(_228);
    float _232 = -_230;
    float _234 = _232 + 1.0;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = 1.0 / _226;
    float _240 = abs(_236);
    float _242 = log2(_240);
    float _244 = _242 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _246 = exp2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _250 = fma(_208, _248, _202);
    float _252 = fma(_210, _248, _204);
    float _254 = fma(_212, _248, _200);
    float _256 = _250 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _258 = _250 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _260 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[3].x, _256);
    float _262 = _250 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _264 = _250 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _266 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].z, _260);
    float _268 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].x, _262);
    float _270 = _266 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _272 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[1].x, _258);
    float _274 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[2].x, _264);
    float _276 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, _268);
    float _278 = 1.0 / _270;
    float _280 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _282 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _274);
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _286 = _280 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _288 = _282 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _290 = _284 * _278;
    float _292 = _288 * _278;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _286 * _278;
    float _298 = _202 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _300 = fma(_224, 0.5, _290);
    float _302 = fma(_224, 1.5, _290);
    float _304 = fma(_224, -0.5, _290);
    float _306 = fma(_224, -1.5, _290);
    float _308 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[12].x, _298);
    float _310 = rint(_294);
    float _312 = precise::max(_310, 0.0);
    uint _315 = uint(_312);
    uint _317 = clamp(_315, 0u, 65535u);
    float _319 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _321 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[13].x, _218);
    float _323 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[12].z, _308);
    float _325 = fma(_319, 1.5, _296);
    float _327 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[13].z, _321);
    float _329 = fma(_319, 0.5, _296);
    float _331 = _323 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _333 = _327 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _961 = float3(_302, _325, float(int(_317)));
    float3 _965 = select(_961, float3(0.0), isnan(_961));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _965.xy, uint(rint(_965.z)), 1.0);
    float3 _973 = float3(_300, _325, float(int(_317)));
    float3 _975 = select(_973, float3(0.0), isnan(_973));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _975.xy, uint(rint(_975.z)), 1.0);
    float3 _983 = float3(_304, _325, float(int(_317)));
    float3 _985 = select(_983, float3(0.0), isnan(_983));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _985.xy, uint(rint(_985.z)), 1.0);
    float3 _993 = float3(_306, _325, float(int(_317)));
    float3 _995 = select(_993, float3(0.0), isnan(_993));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _995.xy, uint(rint(_995.z)), 1.0);
    float3 _1003 = float3(_300, _329, float(int(_317)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1005.xy, uint(rint(_1005.z)), 1.0);
    float3 _1013 = float3(_304, _329, float(int(_317)));
    float3 _1015 = select(_1013, float3(0.0), isnan(_1013));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1015.xy, uint(rint(_1015.z)), 1.0);
    float3 _1023 = float3(_302, _329, float(int(_317)));
    float3 _1025 = select(_1023, float3(0.0), isnan(_1023));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1025.xy, uint(rint(_1025.z)), 1.0);
    float _349 = _333 * _238;
    float _351 = fma(_319, -0.5, _296);
    float _353 = _331 * _238;
    float3 _1042 = float3(_306, _329, float(int(_317)));
    float3 _1044 = select(_1042, float3(0.0), isnan(_1042));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1044.xy, uint(rint(_1044.z)), 1.0);
    float3 _1052 = float3(_302, _351, float(int(_317)));
    float3 _1054 = select(_1052, float3(0.0), isnan(_1052));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1054.xy, uint(rint(_1054.z)), 1.0);
    float3 _1062 = float3(_300, _351, float(int(_317)));
    float3 _1064 = select(_1062, float3(0.0), isnan(_1062));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1064.xy, uint(rint(_1064.z)), 1.0);
    float3 _1072 = float3(_304, _351, float(int(_317)));
    float3 _1074 = select(_1072, float3(0.0), isnan(_1072));
    float _361 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1074.xy, uint(rint(_1074.z)), 1.0);
    float2 _1079 = float2(_353, _349);
    float2 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1079, float2(0.0), isnan(_1079))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1079, float2(0.0), isnan(_1079))).xy;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = fma(_319, -1.5, _296);
    float3 _1097 = float3(_306, _351, float(int(_317)));
    float3 _1099 = select(_1097, float3(0.0), isnan(_1097));
    float _373 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1099.xy, uint(rint(_1099.z)), 1.0);
    float3 _1107 = float3(_302, _371, float(int(_317)));
    float3 _1109 = select(_1107, float3(0.0), isnan(_1107));
    float _375 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1109.xy, uint(rint(_1109.z)), 1.0);
    float3 _1117 = float3(_300, _371, float(int(_317)));
    float3 _1119 = select(_1117, float3(0.0), isnan(_1117));
    float _377 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1119.xy, uint(rint(_1119.z)), 1.0);
    float3 _1127 = float3(_304, _371, float(int(_317)));
    float3 _1129 = select(_1127, float3(0.0), isnan(_1127));
    float _379 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1129.xy, uint(rint(_1129.z)), 1.0);
    float3 _1137 = float3(_306, _371, float(int(_317)));
    float3 _1139 = select(_1137, float3(0.0), isnan(_1137));
    float _381 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1139.xy, uint(rint(_1139.z)), 1.0);
    float2 _1144 = float2(_52, _54);
    float _383 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1144, float2(0.0), isnan(_1144))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1144, float2(0.0), isnan(_1144))).x;
    float _385 = _202 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _387 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[14].x, _385);
    float _389 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[14].z, _387);
    float _391 = _389 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _393 = precise::min(_391, 1.0);
    float _395 = -_200;
    float _397 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _399 = _395 + _397;
    float _401 = _399 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = _335 + _337;
    float _407 = _405 + _339;
    float _409 = _407 + _341;
    float _411 = _409 + _347;
    float _413 = _411 + _343;
    float _415 = _413 + _345;
    float _417 = _415 + _355;
    float _419 = _417 + _357;
    float _421 = -_367;
    float _423 = fma(_421, _367, _369);
    float _425 = -_367;
    float _427 = _393 + _425;
    float _429 = _419 + _359;
    float _431 = fma(_427, _427, _423);
    bool _435 = _427 <= 0.001000000047497451305389404296875;
    float _437 = float(_435);
    float _439 = _429 + _361;
    float _441 = 1.0 / _431;
    float _443 = _439 + _373;
    float _445 = _443 + _375;
    float _447 = _445 + _377;
    float _449 = _447 + _379;
    float _451 = -_200;
    float _453 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _455 = _451 + _453;
    float _457 = _423 * _441;
    float _459 = _449 + _381;
    float _461 = _455 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _463 = precise::clamp(_461, 0.0, 1.0);
    float _465 = precise::max(_457, _437);
    float _467 = fma(_459, 0.0625, _403);
    float _469 = precise::min(_465, 1.0);
    float _471 = _463 + _469;
    out.m_45.x = _383;
    out.m_45.y = _467;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _471;
    return out;
}

