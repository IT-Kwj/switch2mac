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
    float2 _399 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _416 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_416, float2(0.0), isnan(_416))).x;
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
    float _184 = _138 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
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
    float _218 = exp2(_216);
    float _220 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _222 = fma(_192, _220, _138);
    float _224 = fma(_194, _220, _140);
    float _226 = fma(_196, _220, _104);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _234 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[15].x, _184);
    float _236 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _230);
    float _238 = _138 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _232);
    float _242 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[15].z, _234);
    float _244 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _246 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = _240 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _250 = _242 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _244);
    float _254 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _258 = 1.0 / _250;
    float _260 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _252);
    float _262 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _254);
    float _264 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[12].x, _238);
    float _266 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].x, _176);
    float _268 = _256 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _270 = _262 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[12].z, _264);
    float _274 = 1.0 / _248;
    float _276 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _266);
    float _278 = _260 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _282 = _276 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _284 = _280 * _258;
    float _286 = _282 * _258;
    float _288 = _270 * _274;
    float _290 = precise::clamp(_288, 0.0, 1.0);
    float _292 = _268 * _274;
    float _294 = _278 * _274;
    float _296 = _290 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _298 = _296 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _300 = _296 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _302 = fma(_298, 0.5, _292);
    float _304 = fma(_298, -0.5, _292);
    float _306 = fma(_300, 0.5, _294);
    float2 _846 = float2(_284, _286);
    float2 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_846, float2(0.0), isnan(_846))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_846, float2(0.0), isnan(_846))).xy;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = fma(_300, -0.5, _294);
    float3 _862 = float3(_306, _302, float(0));
    float3 _866 = select(_862, float3(0.0), isnan(_862));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _866.xy, uint(rint(_866.z)), _290);
    float3 _873 = float3(_316, _302, float(0));
    float3 _875 = select(_873, float3(0.0), isnan(_873));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _875.xy, uint(rint(_875.z)), _290);
    float3 _882 = float3(_306, _304, float(0));
    float3 _884 = select(_882, float3(0.0), isnan(_882));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _884.xy, uint(rint(_884.z)), _290);
    float3 _891 = float3(_316, _304, float(0));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _893.xy, uint(rint(_893.z)), _290);
    float _326 = _138 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _328 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[14].x, _326);
    float _330 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[14].z, _328);
    float _332 = _330 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _334 = precise::min(_332, 1.0);
    float _336 = -_312;
    float _338 = fma(_336, _312, _314);
    float _340 = -_312;
    float _342 = _334 + _340;
    float _344 = -_104;
    float _346 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _348 = _344 + _346;
    float _350 = fma(_342, _342, _338);
    bool _354 = _342 <= 0.001000000047497451305389404296875;
    float _356 = float(_354);
    float _358 = _318 + _320;
    float _360 = -_104;
    float _362 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _364 = _360 + _362;
    float _366 = _348 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = 1.0 / _350;
    float _372 = _358 + _322;
    float _374 = _364 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _372 + _324;
    float _380 = fma(_378, 0.25, _368);
    float _382 = _338 * _370;
    float _384 = precise::max(_382, _356);
    float _386 = precise::min(_384, 1.0);
    float _388 = _376 + _386;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _380;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _388;
    return out;
}

