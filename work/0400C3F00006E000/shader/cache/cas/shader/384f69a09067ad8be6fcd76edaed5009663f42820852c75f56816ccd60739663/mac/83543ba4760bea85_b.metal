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
    float2 _430 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _447 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).x;
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
    float _218 = _214 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _220 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[13].x, _218);
    float _222 = _206 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _224 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[13].z, _220);
    float _226 = fma(_180, _222, _214);
    float _228 = fma(_182, _222, _216);
    float _230 = fma(_184, _222, _212);
    float _232 = _214 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _234 = _226 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _236 = _224 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _238 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[15].x, _232);
    float _240 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].x, _234);
    float _242 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[3].z, _240);
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _246 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[15].z, _238);
    float _248 = _214 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _250 = _246 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _252 = 1.0 / _244;
    float _254 = _226 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _256 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[12].x, _248);
    float _258 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].x, _254);
    float _260 = _226 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _262 = _226 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _264 = 1.0 / _250;
    float _266 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[2].z, _258);
    float _268 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].x, _260);
    float _270 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].x, _262);
    float _272 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[12].z, _256);
    float _274 = _266 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _276 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].z, _268);
    float _278 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[1].z, _270);
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _282 = _274 * _252;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _276 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _288 = _278 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _290 = rint(_284);
    float _292 = precise::max(_290, 0.0);
    uint _295 = uint(_292);
    uint _297 = clamp(_295, 0u, 65535u);
    float _299 = _286 * _252;
    float _301 = _288 * _252;
    float _303 = _280 * _264;
    float _305 = _236 * _264;
    float _307 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _301);
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _311 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _309, _299);
    float _313 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _299);
    float _315 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _317 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _315, _301);
    float3 _895 = float3(_299, _307, float(int(_297)));
    float3 _899 = select(_895, float3(0.0), isnan(_895));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _899.xy, uint(rint(_899.z)), 1.0);
    float3 _907 = float3(_313, _307, float(int(_297)));
    float3 _909 = select(_907, float3(0.0), isnan(_907));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _909.xy, uint(rint(_909.z)), 1.0);
    float3 _917 = float3(_311, _307, float(int(_297)));
    float3 _919 = select(_917, float3(0.0), isnan(_917));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _919.xy, uint(rint(_919.z)), 1.0);
    float3 _927 = float3(_313, _301, float(int(_297)));
    float3 _929 = select(_927, float3(0.0), isnan(_927));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _929.xy, uint(rint(_929.z)), 1.0);
    float3 _937 = float3(_299, _301, float(int(_297)));
    float3 _939 = select(_937, float3(0.0), isnan(_937));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _939.xy, uint(rint(_939.z)), 1.0);
    float2 _944 = float2(_303, _305);
    float2 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_944, float2(0.0), isnan(_944))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_944, float2(0.0), isnan(_944))).xy;
    float _333 = _331.x;
    float _335 = _331.y;
    float3 _959 = float3(_311, _301, float(int(_297)));
    float3 _961 = select(_959, float3(0.0), isnan(_959));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _961.xy, uint(rint(_961.z)), 1.0);
    float3 _969 = float3(_313, _317, float(int(_297)));
    float3 _971 = select(_969, float3(0.0), isnan(_969));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _971.xy, uint(rint(_971.z)), 1.0);
    float3 _979 = float3(_299, _317, float(int(_297)));
    float3 _981 = select(_979, float3(0.0), isnan(_979));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _981.xy, uint(rint(_981.z)), 1.0);
    float3 _989 = float3(_311, _317, float(int(_297)));
    float3 _991 = select(_989, float3(0.0), isnan(_989));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _991.xy, uint(rint(_991.z)), 1.0);
    float2 _996 = float2(_52, _54);
    float _345 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_996, float2(0.0), isnan(_996))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_996, float2(0.0), isnan(_996))).x;
    float _347 = _214 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _349 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[14].x, _347);
    float _351 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[14].z, _349);
    float _353 = _351 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _355 = precise::min(_353, 1.0);
    float _357 = -_212;
    float _359 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _361 = _357 + _359;
    float _363 = -_212;
    float _365 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _367 = _363 + _365;
    float _369 = _361 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = _367 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _321 + _319;
    float _379 = _377 + _323;
    float _381 = -_333;
    float _383 = fma(_381, _333, _335);
    float _385 = -_333;
    float _387 = _355 + _385;
    float _389 = _379 + _325;
    float _391 = fma(_387, _387, _383);
    float _393 = _389 + _327;
    bool _397 = _387 <= 0.001000000047497451305389404296875;
    float _399 = float(_397);
    float _401 = _393 + _337;
    float _403 = 1.0 / _391;
    float _405 = _401 + _339;
    float _407 = _405 + _341;
    float _409 = _407 + _343;
    float _411 = fma(_409, 0.111111111938953399658203125, _371);
    float _413 = _383 * _403;
    float _415 = precise::max(_413, _399);
    float _417 = precise::min(_415, 1.0);
    float _419 = _375 + _417;
    out.m_45.x = _345;
    out.m_45.y = _411;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _419;
    return out;
}

