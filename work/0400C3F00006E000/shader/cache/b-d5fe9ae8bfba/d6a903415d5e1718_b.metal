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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
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
    float2 _414 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _432 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = _68 * _84;
    float _94 = _72 * _84;
    float _96 = -_92;
    float _98 = fma(_90, _70, _96);
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_94;
    float _108 = fma(_90, _76, _106);
    float _110 = -_84;
    float _112 = _110 + _90;
    float _114 = _98 * _98;
    float _116 = -_92;
    float _118 = fma(_104, _74, _116);
    float _120 = -_94;
    float _122 = fma(_104, _78, _120);
    float _124 = -_84;
    float _126 = _124 + _104;
    float _128 = fma(_108, _108, _114);
    float _130 = _118 * _118;
    float _132 = fma(_112, _112, _128);
    float _134 = fma(_122, _122, _130);
    float _136 = fma(_126, _126, _134);
    float _138 = rsqrt(_132);
    float _140 = rsqrt(_136);
    float _142 = _108 * _138;
    float _144 = _112 * _138;
    float _146 = _98 * _138;
    float _148 = _126 * _140;
    float _150 = _122 * _140;
    float _152 = _118 * _140;
    float _154 = _142 * _148;
    float _156 = _146 * _150;
    float _158 = _144 * _152;
    float _160 = -_154;
    float _162 = fma(_144, _150, _160);
    float _164 = -_156;
    float _166 = fma(_142, _152, _164);
    float _168 = -_158;
    float _170 = fma(_146, _148, _168);
    float _172 = -_66;
    float _174 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _176 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[46].z, _174);
    float _178 = _162 * _162;
    float _180 = fma(_170, _170, _178);
    float _182 = fma(_166, _166, _180);
    float _184 = rsqrt(_182);
    float _186 = _162 * _184;
    float _188 = _170 * _184;
    float _190 = _166 * _184;
    float _192 = _186 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].x, _192);
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].z, _194);
    float _198 = abs(_196);
    float _200 = -_198;
    float _202 = _200 + 1.0;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = abs(_204);
    float _208 = log2(_206);
    float _210 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _212 = exp2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _216 = _186 * _214;
    float _218 = _188 * _214;
    float _220 = fma(_190, _214, _176);
    float _222 = fma(_176, _68, _216);
    float _224 = fma(_176, _72, _218);
    float _226 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _228 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _226);
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _232 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[3].z, _228);
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _236 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _230);
    float _238 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _240 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _242 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[2].z, _236);
    float _244 = 1.0 / _234;
    float _246 = _242 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _248 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _238);
    float _250 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _240);
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _256 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].z, _248);
    float _258 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[1].z, _250);
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _264 = _246 * _244;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _260 * _244;
    float _270 = _262 * _244;
    float _272 = rint(_266);
    float _274 = precise::max(_272, 0.0);
    uint _277 = uint(_274);
    uint _279 = clamp(_277, 0u, 65535u);
    float _281 = fma(_254, 1.5, _268);
    float _283 = fma(_252, 1.5, _270);
    float _285 = fma(_254, 0.5, _268);
    float _287 = fma(_254, -0.5, _268);
    float3 _812 = float3(_281, _283, float(int(_279)));
    float3 _816 = select(_812, float3(0.0), isnan(_812));
    float _289 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _816.xy, uint(rint(_816.z)), 1.0);
    float3 _824 = float3(_285, _283, float(int(_279)));
    float3 _826 = select(_824, float3(0.0), isnan(_824));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _826.xy, uint(rint(_826.z)), 1.0);
    float3 _834 = float3(_287, _283, float(int(_279)));
    float3 _836 = select(_834, float3(0.0), isnan(_834));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _836.xy, uint(rint(_836.z)), 1.0);
    float2 _841 = float2(_52, _54);
    float2 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_841, float2(0.0), isnan(_841))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_841, float2(0.0), isnan(_841))).xy;
    float _299 = _297.x;
    float _301 = _297.y;
    float _303 = fma(_254, -1.5, _268);
    float _305 = fma(_252, 0.5, _270);
    float _307 = fma(_252, -0.5, _270);
    float _309 = fma(_252, -1.5, _270);
    float _311 = _289 + _291;
    float _313 = fma(_299, 2.0, -1.0);
    float _315 = fma(_301, 2.0, -1.0);
    float _317 = _311 + _293;
    float _319 = _313 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _886 = float3(_303, _283, float(int(_279)));
    float3 _888 = select(_886, float3(0.0), isnan(_886));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _888.xy, uint(rint(_888.z)), 1.0);
    float3 _896 = float3(_281, _305, float(int(_279)));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _898.xy, uint(rint(_898.z)), 1.0);
    float3 _906 = float3(_285, _305, float(int(_279)));
    float3 _908 = select(_906, float3(0.0), isnan(_906));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _908.xy, uint(rint(_908.z)), 1.0);
    float _327 = _315 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _920 = float3(_287, _305, float(int(_279)));
    float3 _922 = select(_920, float3(0.0), isnan(_920));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _922.xy, uint(rint(_922.z)), 1.0);
    float3 _930 = float3(_303, _305, float(int(_279)));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _932.xy, uint(rint(_932.z)), 1.0);
    float3 _940 = float3(_281, _307, float(int(_279)));
    float3 _942 = select(_940, float3(0.0), isnan(_940));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _942.xy, uint(rint(_942.z)), 1.0);
    float3 _950 = float3(_285, _307, float(int(_279)));
    float3 _952 = select(_950, float3(0.0), isnan(_950));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _952.xy, uint(rint(_952.z)), 1.0);
    float3 _960 = float3(_287, _307, float(int(_279)));
    float3 _962 = select(_960, float3(0.0), isnan(_960));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _962.xy, uint(rint(_962.z)), 1.0);
    float _339 = fma(_319, 2.0, _52);
    float _341 = fma(_327, 2.0, _54);
    float3 _976 = float3(_303, _307, float(int(_279)));
    float3 _978 = select(_976, float3(0.0), isnan(_976));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _978.xy, uint(rint(_978.z)), 1.0);
    float3 _986 = float3(_281, _309, float(int(_279)));
    float3 _988 = select(_986, float3(0.0), isnan(_986));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _988.xy, uint(rint(_988.z)), 1.0);
    float3 _996 = float3(_285, _309, float(int(_279)));
    float3 _998 = select(_996, float3(0.0), isnan(_996));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _998.xy, uint(rint(_998.z)), 1.0);
    float3 _1006 = float3(_287, _309, float(int(_279)));
    float3 _1008 = select(_1006, float3(0.0), isnan(_1006));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1008.xy, uint(rint(_1008.z)), 1.0);
    float3 _1016 = float3(_303, _309, float(int(_279)));
    float3 _1018 = select(_1016, float3(0.0), isnan(_1016));
    float _351 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1018.xy, uint(rint(_1018.z)), 1.0);
    float2 _1023 = float2(_339, _341);
    float _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1023, float2(0.0), isnan(_1023))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1023, float2(0.0), isnan(_1023))).x;
    float _355 = -_176;
    float _357 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _359 = _355 + _357;
    float _361 = _359 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[48].w, _363);
    float _367 = _317 + _321;
    float _369 = _367 + _323;
    float _371 = _369 + _325;
    float _373 = _371 + _329;
    float _375 = _373 + _331;
    float _377 = _375 + _333;
    float _379 = _377 + _335;
    float _381 = _379 + _337;
    float _383 = _381 + _343;
    float _385 = _383 + _345;
    float _387 = _385 + _347;
    float _389 = _387 + _349;
    float _391 = -_176;
    float _393 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _395 = _391 + _393;
    float _397 = _389 + _351;
    float _399 = _395 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = fma(_397, 0.0625, _401);
    out.m_45.x = _353;
    out.m_45.y = _403;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _365;
    return out;
}

