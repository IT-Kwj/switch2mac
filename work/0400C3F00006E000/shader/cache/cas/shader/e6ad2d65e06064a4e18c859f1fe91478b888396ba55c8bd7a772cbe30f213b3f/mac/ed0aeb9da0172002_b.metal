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
    float2 _330 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _348 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348))).x;
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
    float _152 = -_64;
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _156 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[46].z, _154);
    float _158 = _140 * _146;
    float _160 = _142 * _150;
    float _162 = -_158;
    float _164 = fma(_142, _148, _162);
    float _166 = _144 * _148;
    float _168 = -_160;
    float _170 = fma(_144, _146, _168);
    float _172 = _164 * _164;
    float _174 = -_166;
    float _176 = fma(_140, _150, _174);
    float _178 = fma(_170, _170, _172);
    float _180 = fma(_176, _176, _178);
    float _182 = rsqrt(_180);
    float _184 = _164 * _182;
    float _186 = _170 * _182;
    float _188 = _176 * _182;
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
    float _218 = fma(_188, _212, _156);
    float _220 = fma(_156, _66, _214);
    float _222 = fma(_156, _70, _216);
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _226 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[3].x, _224);
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[3].z, _226);
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _234 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _236 = _220 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _238 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _240 = 1.0 / _232;
    float _242 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].z, _234);
    float _244 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _236);
    float _246 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[1].x, _238);
    float _248 = _242 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _250 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _252 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[1].z, _246);
    float _254 = _250 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _258 = _248 * _240;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _254 * _240;
    float _264 = _256 * _240;
    float _266 = _260 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _270 = _266 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _272 = fma(_268, 0.5, _262);
    float _274 = fma(_270, 0.5, _264);
    float _276 = fma(_268, -0.5, _262);
    float _278 = fma(_270, -0.5, _264);
    float3 _717 = float3(_272, _274, float(0));
    float3 _721 = select(_717, float3(0.0), isnan(_717));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _721.xy, uint(rint(_721.z)), _260);
    float3 _728 = float3(_276, _274, float(0));
    float3 _730 = select(_728, float3(0.0), isnan(_728));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _730.xy, uint(rint(_730.z)), _260);
    float3 _737 = float3(_272, _278, float(0));
    float3 _739 = select(_737, float3(0.0), isnan(_737));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _739.xy, uint(rint(_739.z)), _260);
    float3 _746 = float3(_276, _278, float(0));
    float3 _748 = select(_746, float3(0.0), isnan(_746));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _748.xy, uint(rint(_748.z)), _260);
    float2 _754 = float2(_50, _52);
    float _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float _290 = -_156;
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _294 = _290 + _292;
    float _296 = _294 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[48].w, _298);
    float _302 = _280 + _282;
    float _304 = _302 + _284;
    float _306 = -_156;
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _310 = _306 + _308;
    float _312 = _304 + _286;
    float _314 = _310 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = fma(_312, 0.25, _316);
    out.m_43.x = _288;
    out.m_43.y = _318;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _300;
    return out;
}

