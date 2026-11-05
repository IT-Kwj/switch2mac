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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
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
    float2 _357 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _375 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = _66 * _82;
    float _92 = _70 * _82;
    float _94 = -_90;
    float _96 = fma(_88, _68, _94);
    float _98 = -_62;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = -_92;
    float _106 = fma(_88, _74, _104);
    float _108 = -_82;
    float _110 = _108 + _88;
    float _112 = _96 * _96;
    float _114 = -_90;
    float _116 = fma(_102, _72, _114);
    float _118 = -_92;
    float _120 = fma(_102, _76, _118);
    float _122 = -_82;
    float _124 = _122 + _102;
    float _126 = fma(_106, _106, _112);
    float _128 = _116 * _116;
    float _130 = -_64;
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _134 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[46].z, _132);
    float _136 = fma(_110, _110, _126);
    float _138 = fma(_120, _120, _128);
    float _140 = fma(_124, _124, _138);
    float _142 = rsqrt(_136);
    float _144 = rsqrt(_140);
    float _146 = _106 * _142;
    float _148 = _110 * _142;
    float _150 = _96 * _142;
    float _152 = _124 * _144;
    float _154 = _116 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = _150 * _156;
    float _164 = -_158;
    float _166 = fma(_148, _156, _164);
    float _168 = -_160;
    float _170 = fma(_150, _152, _168);
    float _172 = -_162;
    float _174 = fma(_146, _154, _172);
    float _176 = _166 * _166;
    float _178 = fma(_170, _170, _176);
    float _180 = fma(_174, _174, _178);
    float _182 = rsqrt(_180);
    float _184 = _166 * _182;
    float _186 = _170 * _182;
    float _188 = _174 * _182;
    float _190 = _184 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].x, _190);
    float _194 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].z, _192);
    float _196 = abs(_194);
    float _198 = -_196;
    float _200 = _198 + 1.0;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = abs(_202);
    float _206 = log2(_204);
    float _208 = _206 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _210 = exp2(_208);
    float _212 = _210 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _214 = _184 * _212;
    float _216 = _186 * _212;
    float _218 = fma(_188, _212, _134);
    float _220 = fma(_134, _66, _214);
    float _222 = fma(_134, _70, _216);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _226 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _224);
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[3].z, _226);
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _236 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _238 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _240 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _242 = 1.0 / _232;
    float _244 = _240 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _246 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _236);
    float _248 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _238);
    float _250 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].z, _246);
    float _252 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _258 = _244 * _242;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _256 * _242;
    float _264 = _254 * _242;
    float _266 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _262);
    float _268 = rint(_260);
    float _270 = precise::max(_268, 0.0);
    uint _273 = uint(_270);
    uint _275 = clamp(_273, 0u, 65535u);
    float _277 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _264);
    float _279 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _281 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _279, _264);
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _285 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _283, _262);
    float3 _758 = float3(_264, _266, float(int(_275)));
    float3 _762 = select(_758, float3(0.0), isnan(_758));
    float _287 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _762.xy, uint(rint(_762.z)), 1.0);
    float3 _770 = float3(_277, _266, float(int(_275)));
    float3 _772 = select(_770, float3(0.0), isnan(_770));
    float _289 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _772.xy, uint(rint(_772.z)), 1.0);
    float3 _780 = float3(_281, _266, float(int(_275)));
    float3 _782 = select(_780, float3(0.0), isnan(_780));
    float _291 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _782.xy, uint(rint(_782.z)), 1.0);
    float3 _790 = float3(_277, _262, float(int(_275)));
    float3 _792 = select(_790, float3(0.0), isnan(_790));
    float _293 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _792.xy, uint(rint(_792.z)), 1.0);
    float3 _800 = float3(_264, _262, float(int(_275)));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float _295 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _802.xy, uint(rint(_802.z)), 1.0);
    float3 _810 = float3(_281, _262, float(int(_275)));
    float3 _812 = select(_810, float3(0.0), isnan(_810));
    float _297 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _812.xy, uint(rint(_812.z)), 1.0);
    float3 _820 = float3(_277, _285, float(int(_275)));
    float3 _822 = select(_820, float3(0.0), isnan(_820));
    float _299 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _822.xy, uint(rint(_822.z)), 1.0);
    float3 _830 = float3(_264, _285, float(int(_275)));
    float3 _832 = select(_830, float3(0.0), isnan(_830));
    float _301 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _832.xy, uint(rint(_832.z)), 1.0);
    float3 _840 = float3(_281, _285, float(int(_275)));
    float3 _842 = select(_840, float3(0.0), isnan(_840));
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _842.xy, uint(rint(_842.z)), 1.0);
    float2 _847 = float2(_50, _52);
    float _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_847, float2(0.0), isnan(_847))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_847, float2(0.0), isnan(_847))).x;
    float _307 = _289 + _287;
    float _309 = _307 + _291;
    float _311 = _309 + _293;
    float _313 = _311 + _295;
    float _315 = _313 + _297;
    float _317 = _315 + _299;
    float _319 = _317 + _301;
    float _321 = -_134;
    float _323 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _325 = _321 + _323;
    float _327 = -_134;
    float _329 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _331 = _327 + _329;
    float _333 = _319 + _303;
    float _335 = _325 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = _331 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[48].w, _337);
    float _345 = fma(_333, 0.111111111938953399658203125, _341);
    out.m_43.x = _305;
    out.m_43.y = _345;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _343;
    return out;
}

