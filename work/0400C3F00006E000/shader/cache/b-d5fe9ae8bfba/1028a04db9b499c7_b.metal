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
    float2 _358 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_358, float2(0.0), isnan(_358)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _376 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376))).x;
    float2 _384 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_384, float2(0.0), isnan(_384))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_40.y;
    float _80 = in.m_38.x;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_62;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _76 * _92;
    float _102 = _80 * _92;
    float _104 = -_100;
    float _106 = fma(_98, _78, _104);
    float _108 = -_64;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[46].z, _110);
    float _114 = -_102;
    float _116 = fma(_98, _84, _114);
    float _118 = -_92;
    float _120 = _118 + _98;
    float _122 = _106 * _106;
    float _124 = -_100;
    float _126 = fma(_112, _82, _124);
    float _128 = -_102;
    float _130 = fma(_112, _86, _128);
    float _132 = -_92;
    float _134 = _132 + _112;
    float _136 = fma(_116, _116, _122);
    float _138 = _126 * _126;
    float _140 = fma(_120, _120, _136);
    float _142 = fma(_130, _130, _138);
    float _144 = fma(_134, _134, _142);
    float _146 = rsqrt(_140);
    float _148 = rsqrt(_144);
    float _150 = _116 * _146;
    float _152 = _120 * _146;
    float _154 = _106 * _146;
    float _156 = _134 * _148;
    float _158 = _130 * _148;
    float _160 = _126 * _148;
    float _162 = -_66;
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _166 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[46].z, _164);
    float _168 = _150 * _156;
    float _170 = _152 * _160;
    float _172 = -_168;
    float _174 = fma(_152, _158, _172);
    float _176 = _154 * _158;
    float _178 = -_170;
    float _180 = fma(_154, _156, _178);
    float _182 = _174 * _174;
    float _184 = -_176;
    float _186 = fma(_150, _160, _184);
    float _188 = fma(_180, _180, _182);
    float _190 = fma(_186, _186, _188);
    float _192 = rsqrt(_190);
    float _194 = _174 * _192;
    float _196 = _180 * _192;
    float _198 = _186 * _192;
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].x, _200);
    float _204 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[35].z, _202);
    float _206 = abs(_204);
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = abs(_212);
    float _216 = log2(_214);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _220 = exp2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _224 = _194 * _222;
    float _226 = _196 * _222;
    float _228 = fma(_198, _222, _166);
    float _230 = fma(_166, _76, _224);
    float _232 = fma(_166, _80, _226);
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[3].x, _234);
    float _240 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _242 = _230 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _244 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _238);
    float _246 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _240);
    float _248 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[1].x, _242);
    float _250 = _244 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _252 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _254 = _246 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _256 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _258 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].x, _252);
    float _260 = 1.0 / _250;
    float _262 = _256 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _264 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, _258);
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _268 = _254 * _260;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _266 * _260;
    float _274 = fma(_72, 2.0, -1.0);
    float _276 = fma(_74, 2.0, -1.0);
    float _278 = rint(_270);
    float _280 = precise::max(_278, 0.0);
    uint _283 = uint(_280);
    uint _285 = clamp(_283, 0u, 65535u);
    float _287 = _262 * _260;
    float _289 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _291 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _293 = _276 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _295 = _274 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _297 = fma(_289, 0.5, _272);
    float _299 = fma(_289, -0.5, _272);
    float _301 = fma(_293, 2.0, _54);
    float _303 = fma(_291, 0.5, _287);
    float _305 = fma(_291, -0.5, _287);
    float _307 = fma(_295, 2.0, _52);
    float3 _788 = float3(_297, _303, float(int(_285)));
    float3 _792 = select(_788, float3(0.0), isnan(_788));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _792.xy, uint(rint(_792.z)), 1.0);
    float3 _800 = float3(_299, _303, float(int(_285)));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _802.xy, uint(rint(_802.z)), 1.0);
    float3 _810 = float3(_297, _305, float(int(_285)));
    float3 _812 = select(_810, float3(0.0), isnan(_810));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _812.xy, uint(rint(_812.z)), 1.0);
    float3 _820 = float3(_299, _305, float(int(_285)));
    float3 _822 = select(_820, float3(0.0), isnan(_820));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _822.xy, uint(rint(_822.z)), 1.0);
    float2 _827 = float2(_307, _301);
    float _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_827, float2(0.0), isnan(_827))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_827, float2(0.0), isnan(_827))).x;
    float _319 = -_166;
    float _321 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _323 = _319 + _321;
    float _325 = _323 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[48].w, _327);
    float _331 = _309 + _311;
    float _333 = _331 + _313;
    float _335 = -_166;
    float _337 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _339 = _335 + _337;
    float _341 = _333 + _315;
    float _343 = _339 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_341, 0.25, _345);
    out.m_45.x = _317;
    out.m_45.y = _347;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _329;
    return out;
}

