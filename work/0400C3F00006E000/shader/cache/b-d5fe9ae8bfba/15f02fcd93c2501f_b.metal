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
    float2 _304 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _322 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).x;
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
    float _130 = fma(_110, _110, _126);
    float _132 = fma(_120, _120, _128);
    float _134 = fma(_124, _124, _132);
    float _136 = rsqrt(_130);
    float _138 = rsqrt(_134);
    float _140 = _106 * _136;
    float _142 = _110 * _136;
    float _144 = _96 * _136;
    float _146 = _124 * _138;
    float _148 = _120 * _138;
    float _150 = _116 * _138;
    float _152 = _140 * _146;
    float _154 = _142 * _150;
    float _156 = -_152;
    float _158 = fma(_142, _148, _156);
    float _160 = _144 * _148;
    float _162 = -_154;
    float _164 = fma(_144, _146, _162);
    float _166 = _158 * _158;
    float _168 = -_160;
    float _170 = fma(_140, _150, _168);
    float _172 = fma(_164, _164, _166);
    float _174 = fma(_170, _170, _172);
    float _176 = rsqrt(_174);
    float _178 = _158 * _176;
    float _180 = _164 * _176;
    float _182 = _170 * _176;
    float _184 = _178 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _186 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[35].x, _184);
    float _188 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[35].z, _186);
    float _190 = abs(_188);
    float _192 = -_190;
    float _194 = _192 + 1.0;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = abs(_196);
    float _200 = log2(_198);
    float _202 = _200 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _204 = exp2(_202);
    float _206 = -_64;
    float _208 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _210 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[46].z, _208);
    float _212 = _204 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _214 = _178 * _212;
    float _216 = _180 * _212;
    float _218 = fma(_182, _212, _210);
    float _220 = fma(_210, _66, _214);
    float _222 = fma(_210, _70, _216);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _228 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _224);
    float _230 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _232 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _226);
    float _236 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[3].z, _228);
    float _238 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[1].z, _234);
    float _240 = _236 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _230);
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _232);
    float _246 = _238 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _248 = 1.0 / _240;
    float _250 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].z, _242);
    float _252 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _258 = _246 * _248;
    float _260 = _254 * _248;
    float _262 = _256 * _248;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float3 _663 = float3(_260, _258, float(0));
    float3 _667 = select(_663, float3(0.0), isnan(_663));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _667.xy, uint(rint(_667.z)), _264);
    float2 _673 = float2(_50, _52);
    float _268 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_673, float2(0.0), isnan(_673))).x;
    float _270 = -_210;
    float _272 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _274 = _270 + _272;
    float _276 = -_210;
    float _278 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _280 = _276 + _278;
    float _282 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = _280 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[48].w, _284);
    float _292 = _288 + _266;
    out.m_43.x = _268;
    out.m_43.y = _292;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _290;
    return out;
}

