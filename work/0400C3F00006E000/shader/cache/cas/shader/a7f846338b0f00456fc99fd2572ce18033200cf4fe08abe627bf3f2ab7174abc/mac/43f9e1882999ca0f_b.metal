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
    texture2d_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
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
    float2 _406 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _423 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _66 * _82;
    float _98 = _68 * _82;
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_96;
    float _108 = fma(_88, _70, _106);
    float _110 = -_96;
    float _112 = fma(_94, _72, _110);
    float _114 = -_98;
    float _116 = fma(_88, _74, _114);
    float _118 = -_98;
    float _120 = fma(_94, _76, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_82;
    float _128 = _126 + _88;
    float _130 = -_82;
    float _132 = _130 + _94;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = _104 * _66;
    float _140 = _104 * _68;
    float _142 = fma(_128, _128, _134);
    float _144 = fma(_132, _132, _136);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _116 * _146;
    float _152 = _128 * _146;
    float _154 = _108 * _146;
    float _156 = _132 * _148;
    float _158 = _112 * _148;
    float _160 = _120 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _158;
    float _166 = -_162;
    float _168 = fma(_152, _160, _166);
    float _170 = -_164;
    float _172 = fma(_154, _156, _170);
    float _174 = _154 * _160;
    float _176 = _138 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _178 = _168 * _168;
    float _180 = -_174;
    float _182 = fma(_150, _158, _180);
    float _184 = _138 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _186 = fma(_172, _172, _178);
    float _188 = fma(_182, _182, _186);
    float _190 = rsqrt(_188);
    float _192 = _168 * _190;
    float _194 = _172 * _190;
    float _196 = _182 * _190;
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _218 = _138 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _220 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[15].x, _218);
    float _222 = exp2(_216);
    float _224 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _220);
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _228 = 1.0 / _226;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _232 = fma(_192, _230, _138);
    float _234 = fma(_194, _230, _140);
    float _236 = fma(_196, _230, _104);
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
    float _258 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[12].x, _184);
    float _260 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _262 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _176);
    float _264 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _266 = 1.0 / _254;
    float _268 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _258);
    float _270 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _274 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[2].z, _260);
    float _276 = _270 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _278 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _280 = _274 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _282 = _276 * _228;
    float _284 = _272 * _266;
    float _286 = _268 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _288 = _280 * _266;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _294 = _278 * _266;
    float _296 = _286 * _228;
    float _298 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _300 = fma(_292, 0.5, _284);
    float _302 = rint(_290);
    float _304 = precise::max(_302, 0.0);
    uint _307 = uint(_304);
    uint _309 = clamp(_307, 0u, 65535u);
    float _311 = fma(_292, -0.5, _284);
    float _313 = fma(_298, 0.5, _294);
    float2 _861 = float2(_296, _282);
    float2 _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_861, float2(0.0), isnan(_861))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_861, float2(0.0), isnan(_861))).xy;
    float _319 = _317.x;
    float _321 = _317.y;
    float _323 = fma(_298, -0.5, _294);
    float3 _879 = float3(_300, _313, float(int(_309)));
    float3 _883 = select(_879, float3(0.0), isnan(_879));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _883.xy, uint(rint(_883.z)), 1.0);
    float3 _891 = float3(_311, _313, float(int(_309)));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _893.xy, uint(rint(_893.z)), 1.0);
    float3 _901 = float3(_300, _323, float(int(_309)));
    float3 _903 = select(_901, float3(0.0), isnan(_901));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _903.xy, uint(rint(_903.z)), 1.0);
    float3 _911 = float3(_311, _323, float(int(_309)));
    float3 _913 = select(_911, float3(0.0), isnan(_911));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _913.xy, uint(rint(_913.z)), 1.0);
    float _333 = _138 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _335 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[14].x, _333);
    float _337 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _335);
    float _339 = _337 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _341 = precise::min(_339, 1.0);
    float _343 = -_319;
    float _345 = fma(_343, _319, _321);
    float _347 = -_319;
    float _349 = _341 + _347;
    float _351 = -_104;
    float _353 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _355 = _351 + _353;
    float _357 = fma(_349, _349, _345);
    bool _361 = _349 <= 0.001000000047497451305389404296875;
    float _363 = float(_361);
    float _365 = _355 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = 1.0 / _357;
    float _371 = _325 + _327;
    float _373 = -_104;
    float _375 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _377 = _373 + _375;
    float _379 = _371 + _329;
    float _381 = _377 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _345 * _369;
    float _387 = precise::max(_385, _363);
    float _389 = _379 + _331;
    float _391 = precise::min(_387, 1.0);
    float _393 = fma(_389, 0.25, _367);
    float _395 = _383 + _391;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _393;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _395;
    return out;
}

