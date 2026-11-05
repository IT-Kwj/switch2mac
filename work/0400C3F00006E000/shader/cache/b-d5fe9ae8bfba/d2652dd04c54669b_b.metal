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
    float2 _394 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_394, float2(0.0), isnan(_394)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _412 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).x;
    float2 _420 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_420, float2(0.0), isnan(_420))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_38.x;
    float _80 = in.m_40.y;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_64;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = 1.0 / _94;
    float _104 = 1.0 / _98;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _100 * _106;
    float _110 = _76 * _108;
    float _112 = _78 * _108;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _102 * _114;
    float _118 = -_110;
    float _120 = fma(_116, _80, _118);
    float _122 = -_112;
    float _124 = fma(_116, _84, _122);
    float _126 = -_108;
    float _128 = _126 + _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _104 * _130;
    float _134 = _120 * _120;
    float _136 = -_110;
    float _138 = fma(_132, _82, _136);
    float _140 = -_112;
    float _142 = fma(_132, _86, _140);
    float _144 = -_108;
    float _146 = _144 + _132;
    float _148 = fma(_124, _124, _134);
    float _150 = _138 * _138;
    float _152 = fma(_128, _128, _148);
    float _154 = fma(_142, _142, _150);
    float _156 = fma(_146, _146, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = _124 * _158;
    float _164 = _128 * _158;
    float _166 = _120 * _158;
    float _168 = _146 * _160;
    float _170 = _138 * _160;
    float _172 = _142 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = -_176;
    float _184 = fma(_166, _168, _182);
    float _186 = _166 * _172;
    float _188 = _180 * _180;
    float _190 = -_186;
    float _192 = fma(_162, _170, _190);
    float _194 = -_66;
    float _196 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _198 = fma(_184, _184, _188);
    float _200 = fma(_192, _192, _198);
    float _202 = 1.0 / _196;
    float _204 = rsqrt(_200);
    float _206 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _208 = _202 * _206;
    float _210 = _180 * _204;
    float _212 = _184 * _204;
    float _214 = _192 * _204;
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
    float _240 = _210 * _238;
    float _242 = _212 * _238;
    float _244 = fma(_214, _238, _208);
    float _246 = fma(_208, _76, _240);
    float _248 = fma(_208, _78, _242);
    float _250 = _246 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _252);
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _260 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].x, _254);
    float _262 = _246 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _264 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _266 = 1.0 / _258;
    float _268 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _260);
    float _270 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _262);
    float _272 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].x, _264);
    float _274 = _268 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _276 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _270);
    float _278 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _280 = fma(_72, 2.0, -1.0);
    float _282 = fma(_74, 2.0, -1.0);
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _288 = _282 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _290 = _274 * _266;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _278 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _296 = _284 * _266;
    float _298 = fma(_286, 2.0, _52);
    float _300 = _294 * _266;
    float _302 = rint(_292);
    float _304 = precise::max(_302, 0.0);
    uint _307 = uint(_304);
    uint _309 = clamp(_307, 0u, 65535u);
    float _311 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _296);
    float _313 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _300);
    float _315 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _317 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _315, _296);
    float _319 = fma(_288, 2.0, _54);
    float _321 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _323 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _321, _300);
    float3 _844 = float3(_296, _313, float(int(_309)));
    float3 _848 = select(_844, float3(0.0), isnan(_844));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _848.xy, uint(rint(_848.z)), 1.0);
    float3 _856 = float3(_311, _313, float(int(_309)));
    float3 _858 = select(_856, float3(0.0), isnan(_856));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _858.xy, uint(rint(_858.z)), 1.0);
    float3 _866 = float3(_317, _313, float(int(_309)));
    float3 _868 = select(_866, float3(0.0), isnan(_866));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _868.xy, uint(rint(_868.z)), 1.0);
    float3 _876 = float3(_311, _300, float(int(_309)));
    float3 _878 = select(_876, float3(0.0), isnan(_876));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _878.xy, uint(rint(_878.z)), 1.0);
    float3 _886 = float3(_296, _300, float(int(_309)));
    float3 _888 = select(_886, float3(0.0), isnan(_886));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _888.xy, uint(rint(_888.z)), 1.0);
    float3 _896 = float3(_317, _300, float(int(_309)));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _898.xy, uint(rint(_898.z)), 1.0);
    float3 _906 = float3(_311, _323, float(int(_309)));
    float3 _908 = select(_906, float3(0.0), isnan(_906));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _908.xy, uint(rint(_908.z)), 1.0);
    float3 _916 = float3(_296, _323, float(int(_309)));
    float3 _918 = select(_916, float3(0.0), isnan(_916));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _918.xy, uint(rint(_918.z)), 1.0);
    float3 _926 = float3(_317, _323, float(int(_309)));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _928.xy, uint(rint(_928.z)), 1.0);
    float2 _933 = float2(_298, _319);
    float _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_933, float2(0.0), isnan(_933))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_933, float2(0.0), isnan(_933))).x;
    float _345 = _327 + _325;
    float _347 = _345 + _329;
    float _349 = _347 + _331;
    float _351 = _349 + _333;
    float _353 = _351 + _335;
    float _355 = _353 + _337;
    float _357 = _355 + _339;
    float _359 = -_208;
    float _361 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _363 = _359 + _361;
    float _365 = -_208;
    float _367 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _369 = _365 + _367;
    float _371 = _357 + _341;
    float _373 = _363 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _369 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[48].w, _375);
    float _383 = fma(_371, 0.111111111938953399658203125, _379);
    out.m_45.x = _343;
    out.m_45.y = _383;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _381;
    return out;
}

