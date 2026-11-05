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
    float2 _352 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _370 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370))).x;
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
    float _100 = -_96;
    float _102 = fma(_88, _70, _100);
    float _104 = -_96;
    float _106 = fma(_94, _72, _104);
    float _108 = -_98;
    float _110 = fma(_88, _74, _108);
    float _112 = -_98;
    float _114 = fma(_94, _76, _112);
    float _116 = _102 * _102;
    float _118 = _106 * _106;
    float _120 = -_82;
    float _122 = _120 + _88;
    float _124 = -_82;
    float _126 = _124 + _94;
    float _128 = fma(_110, _110, _116);
    float _130 = fma(_114, _114, _118);
    float _132 = fma(_122, _122, _128);
    float _134 = fma(_126, _126, _130);
    float _136 = rsqrt(_132);
    float _138 = rsqrt(_134);
    float _140 = _110 * _136;
    float _142 = _122 * _136;
    float _144 = _102 * _136;
    float _146 = -_64;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = _126 * _138;
    float _154 = _106 * _138;
    float _156 = _114 * _138;
    float _158 = _140 * _152;
    float _160 = _142 * _154;
    float _162 = -_158;
    float _164 = fma(_142, _156, _162);
    float _166 = _144 * _156;
    float _168 = -_160;
    float _170 = fma(_144, _152, _168);
    float _172 = _164 * _164;
    float _174 = -_166;
    float _176 = fma(_140, _154, _174);
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
    float _218 = fma(_188, _212, _150);
    float _220 = fma(_150, _66, _214);
    float _222 = fma(_150, _68, _216);
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
    float _248 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].z, _242);
    float _250 = 1.0 / _240;
    float _252 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _254 = _248 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _262 = _254 * _250;
    float _264 = _256 * _250;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _246 * _250;
    float _270 = fma(_266, _258, _262);
    float _272 = -_258;
    float _274 = fma(_266, _272, _262);
    float _276 = fma(_266, _260, _268);
    float _278 = -_260;
    float _280 = fma(_266, _278, _268);
    float3 _743 = float3(_270, _276, float(0));
    float3 _747 = select(_743, float3(0.0), isnan(_743));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _747.xy, uint(rint(_747.z)), _266);
    float3 _754 = float3(_262, _276, float(0));
    float3 _756 = select(_754, float3(0.0), isnan(_754));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _756.xy, uint(rint(_756.z)), _266);
    float3 _763 = float3(_274, _276, float(0));
    float3 _765 = select(_763, float3(0.0), isnan(_763));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _765.xy, uint(rint(_765.z)), _266);
    float3 _772 = float3(_270, _268, float(0));
    float3 _774 = select(_772, float3(0.0), isnan(_772));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _774.xy, uint(rint(_774.z)), _266);
    float3 _781 = float3(_262, _268, float(0));
    float3 _783 = select(_781, float3(0.0), isnan(_781));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _783.xy, uint(rint(_783.z)), _266);
    float3 _790 = float3(_274, _268, float(0));
    float3 _792 = select(_790, float3(0.0), isnan(_790));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _792.xy, uint(rint(_792.z)), _266);
    float3 _799 = float3(_270, _280, float(0));
    float3 _801 = select(_799, float3(0.0), isnan(_799));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _801.xy, uint(rint(_801.z)), _266);
    float3 _808 = float3(_262, _280, float(0));
    float3 _810 = select(_808, float3(0.0), isnan(_808));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _810.xy, uint(rint(_810.z)), _266);
    float3 _817 = float3(_274, _280, float(0));
    float3 _819 = select(_817, float3(0.0), isnan(_817));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _819.xy, uint(rint(_819.z)), _266);
    float2 _825 = float2(_50, _52);
    float _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_825, float2(0.0), isnan(_825))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_825, float2(0.0), isnan(_825))).x;
    float _302 = -_150;
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _306 = _302 + _304;
    float _308 = _306 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = _282 + _284;
    float _314 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[48].w, _310);
    float _316 = -_150;
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _320 = _316 + _318;
    float _322 = _312 + _286;
    float _324 = _320 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _322 + _288;
    float _330 = _328 + _290;
    float _332 = _330 + _292;
    float _334 = _332 + _294;
    float _336 = _334 + _296;
    float _338 = _336 + _298;
    float _340 = fma(_338, 0.111111111938953399658203125, _326);
    out.m_43.x = _300;
    out.m_43.y = _340;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _314;
    return out;
}

