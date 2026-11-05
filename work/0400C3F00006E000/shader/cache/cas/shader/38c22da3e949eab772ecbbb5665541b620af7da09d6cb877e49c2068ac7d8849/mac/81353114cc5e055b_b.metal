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
    float2 _410 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _427 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).x;
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
    float _148 = _128 * _140;
    float _150 = _108 * _140;
    float _152 = _116 * _140;
    float _154 = _142 * _148;
    float _156 = _144 * _150;
    float _158 = -_154;
    float _160 = fma(_144, _152, _158);
    float _162 = -_156;
    float _164 = fma(_146, _148, _162);
    float _166 = _146 * _152;
    float _168 = _160 * _160;
    float _170 = -_166;
    float _172 = fma(_142, _150, _170);
    float _174 = fma(_164, _164, _168);
    float _176 = fma(_172, _172, _174);
    float _178 = rsqrt(_176);
    float _180 = _160 * _178;
    float _182 = _164 * _178;
    float _184 = _172 * _178;
    float _186 = _180 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[35].x, _186);
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].z, _188);
    float _192 = abs(_190);
    float _194 = -_192;
    float _196 = _194 + 1.0;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = abs(_198);
    float _202 = log2(_200);
    float _204 = _202 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _206 = exp2(_204);
    float _208 = -_66;
    float _210 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _212 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[46].z, _210);
    float _214 = _212 * _68;
    float _216 = _212 * _70;
    float _218 = _206 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _220 = fma(_180, _218, _214);
    float _222 = fma(_182, _218, _216);
    float _224 = fma(_184, _218, _212);
    float _226 = _214 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _232 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[15].x, _226);
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _230);
    float _238 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[15].z, _232);
    float _240 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].z, _234);
    float _242 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _244 = _238 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _246 = _240 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _252 = _214 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _254 = 1.0 / _246;
    float _256 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _258 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _250);
    float _260 = _214 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _262 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[12].x, _252);
    float _264 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _266 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _268 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[13].x, _260);
    float _270 = 1.0 / _244;
    float _272 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[12].z, _262);
    float _274 = _266 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _276 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[13].z, _268);
    float _278 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _280 = _242 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _282 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _286 = _274 * _254;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _278 * _254;
    float _292 = _280 * _254;
    float _294 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _296 = rint(_288);
    float _298 = precise::max(_296, 0.0);
    uint _301 = uint(_298);
    uint _303 = clamp(_301, 0u, 65535u);
    float _305 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _307 = fma(_294, 0.5, _290);
    float _309 = _282 * _270;
    float _311 = _284 * _270;
    float _313 = fma(_294, -0.5, _290);
    float _315 = fma(_305, 0.5, _292);
    float _317 = fma(_305, -0.5, _292);
    float2 _868 = float2(_309, _311);
    float2 _321 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_868, float2(0.0), isnan(_868))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_868, float2(0.0), isnan(_868))).xy;
    float _323 = _321.x;
    float _325 = _321.y;
    float3 _883 = float3(_307, _315, float(int(_303)));
    float3 _887 = select(_883, float3(0.0), isnan(_883));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _887.xy, uint(rint(_887.z)), 1.0);
    float3 _895 = float3(_313, _315, float(int(_303)));
    float3 _897 = select(_895, float3(0.0), isnan(_895));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _897.xy, uint(rint(_897.z)), 1.0);
    float3 _905 = float3(_307, _317, float(int(_303)));
    float3 _907 = select(_905, float3(0.0), isnan(_905));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _907.xy, uint(rint(_907.z)), 1.0);
    float3 _915 = float3(_313, _317, float(int(_303)));
    float3 _917 = select(_915, float3(0.0), isnan(_915));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _917.xy, uint(rint(_917.z)), 1.0);
    float2 _922 = float2(_52, _54);
    float _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_922, float2(0.0), isnan(_922))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_922, float2(0.0), isnan(_922))).x;
    float _337 = _214 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _339 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[14].x, _337);
    float _341 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[14].z, _339);
    float _343 = _341 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _345 = precise::min(_343, 1.0);
    float _347 = -_212;
    float _349 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _351 = _347 + _349;
    float _353 = -_212;
    float _355 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _357 = _353 + _355;
    float _359 = _351 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _357 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = -_323;
    float _369 = fma(_367, _323, _325);
    float _371 = -_323;
    float _373 = _345 + _371;
    float _375 = fma(_373, _373, _369);
    bool _379 = _373 <= 0.001000000047497451305389404296875;
    float _381 = float(_379);
    float _383 = 1.0 / _375;
    float _385 = _327 + _329;
    float _387 = _369 * _383;
    float _389 = _385 + _331;
    float _391 = precise::max(_387, _381);
    float _393 = _389 + _333;
    float _395 = precise::min(_391, 1.0);
    float _397 = fma(_393, 0.25, _361);
    float _399 = _365 + _395;
    out.m_45.x = _335;
    out.m_45.y = _397;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _399;
    return out;
}

