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
    float2 _426 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _443 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).x;
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
    float _176 = _168 * _168;
    float _178 = -_174;
    float _180 = fma(_150, _158, _178);
    float _182 = fma(_172, _172, _176);
    float _184 = fma(_180, _180, _182);
    float _186 = rsqrt(_184);
    float _188 = _168 * _186;
    float _190 = _172 * _186;
    float _192 = _180 * _186;
    float _194 = _188 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[35].x, _194);
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].z, _196);
    float _200 = abs(_198);
    float _202 = -_200;
    float _204 = _202 + 1.0;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = abs(_206);
    float _210 = log2(_208);
    float _212 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _214 = _138 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _216 = exp2(_212);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _220 = fma(_188, _218, _138);
    float _222 = fma(_190, _218, _140);
    float _224 = fma(_192, _218, _104);
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _228 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _226);
    float _230 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[15].x, _214);
    float _232 = _138 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].z, _228);
    float _236 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _230);
    float _238 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _232);
    float _240 = _234 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = _138 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _244 = _236 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _246 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = 1.0 / _240;
    float _250 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[12].x, _242);
    float _252 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _238);
    float _254 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _256 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _258 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _260 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _250);
    float _262 = _252 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _264 = 1.0 / _244;
    float _266 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].z, _254);
    float _268 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _256);
    float _270 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _258);
    float _272 = _260 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _274 = _266 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _276 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].z, _268);
    float _278 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].z, _270);
    float _280 = _274 * _248;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _286 = _278 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _288 = rint(_282);
    float _290 = precise::max(_288, 0.0);
    uint _293 = uint(_290);
    uint _295 = clamp(_293, 0u, 65535u);
    float _297 = _284 * _248;
    float _299 = _286 * _248;
    float _301 = _272 * _264;
    float _303 = _262 * _264;
    float _305 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _307 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _305, _297);
    float _309 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _299);
    float _311 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _297);
    float _313 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _315 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _313, _299);
    float3 _891 = float3(_297, _309, float(int(_295)));
    float3 _895 = select(_891, float3(0.0), isnan(_891));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _895.xy, uint(rint(_895.z)), 1.0);
    float3 _903 = float3(_311, _309, float(int(_295)));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _905.xy, uint(rint(_905.z)), 1.0);
    float3 _913 = float3(_307, _309, float(int(_295)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _915.xy, uint(rint(_915.z)), 1.0);
    float3 _923 = float3(_311, _299, float(int(_295)));
    float3 _925 = select(_923, float3(0.0), isnan(_923));
    float _323 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _925.xy, uint(rint(_925.z)), 1.0);
    float2 _930 = float2(_301, _303);
    float2 _327 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_930, float2(0.0), isnan(_930))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_930, float2(0.0), isnan(_930))).xy;
    float _329 = _327.x;
    float _331 = _327.y;
    float3 _945 = float3(_297, _299, float(int(_295)));
    float3 _947 = select(_945, float3(0.0), isnan(_945));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _947.xy, uint(rint(_947.z)), 1.0);
    float3 _955 = float3(_307, _299, float(int(_295)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _335 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _957.xy, uint(rint(_957.z)), 1.0);
    float3 _965 = float3(_311, _315, float(int(_295)));
    float3 _967 = select(_965, float3(0.0), isnan(_965));
    float _337 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _967.xy, uint(rint(_967.z)), 1.0);
    float3 _975 = float3(_297, _315, float(int(_295)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _977.xy, uint(rint(_977.z)), 1.0);
    float3 _985 = float3(_307, _315, float(int(_295)));
    float3 _987 = select(_985, float3(0.0), isnan(_985));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _987.xy, uint(rint(_987.z)), 1.0);
    float _343 = _138 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _345 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[14].x, _343);
    float _347 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _345);
    float _349 = _347 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _351 = precise::min(_349, 1.0);
    float _353 = -_329;
    float _355 = fma(_353, _329, _331);
    float _357 = -_329;
    float _359 = _351 + _357;
    float _361 = _319 + _317;
    float _363 = -_104;
    float _365 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _367 = _363 + _365;
    float _369 = fma(_359, _359, _355);
    float _371 = _361 + _321;
    bool _375 = _359 <= 0.001000000047497451305389404296875;
    float _377 = float(_375);
    float _379 = _367 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _371 + _323;
    float _385 = 1.0 / _369;
    float _387 = _383 + _333;
    float _389 = _387 + _335;
    float _391 = _389 + _337;
    float _393 = -_104;
    float _395 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _397 = _393 + _395;
    float _399 = _355 * _385;
    float _401 = _391 + _339;
    float _403 = _397 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = precise::max(_399, _377);
    float _409 = _401 + _341;
    float _411 = precise::min(_407, 1.0);
    float _413 = fma(_409, 0.111111111938953399658203125, _381);
    float _415 = _405 + _411;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _413;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _415;
    return out;
}

