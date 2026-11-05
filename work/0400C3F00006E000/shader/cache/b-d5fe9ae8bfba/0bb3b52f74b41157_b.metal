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
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _328 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_328, float2(0.0), isnan(_328))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = _64 * _58;
    float _70 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _72 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _74 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _78 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _70);
    float _80 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _72);
    float _82 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _84 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _74);
    float _86 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _88 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _80);
    float _90 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _92 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _84);
    float _94 = _86 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _96 = _88 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _98 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _82);
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _102 = 1.0 / _94;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _106 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _98);
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _110 = _96 * _102;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _108 * _102;
    float _116 = _100 * _102;
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].x, _76);
    float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _122 = fma(_90, 0.5, _114);
    float _124 = rint(_112);
    float _126 = precise::max(_124, 0.0);
    uint _129 = uint(_126);
    uint _131 = clamp(_129, 0u, 65535u);
    float _133 = fma(_90, 1.5, _114);
    float _135 = fma(_90, -0.5, _114);
    float _137 = fma(_90, -1.5, _114);
    float _139 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _141 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _118);
    float _143 = fma(_104, 1.5, _116);
    float _145 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].x, _120);
    float _147 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].x, _139);
    float _149 = _141 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _151 = fma(_104, 0.5, _116);
    float _153 = 1.0 / _149;
    float3 _539 = float3(_133, _143, float(int(_131)));
    float3 _543 = select(_539, float3(0.0), isnan(_539));
    float _155 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _543.xy, uint(rint(_543.z)), 1.0);
    float3 _551 = float3(_122, _143, float(int(_131)));
    float3 _553 = select(_551, float3(0.0), isnan(_551));
    float _157 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _553.xy, uint(rint(_553.z)), 1.0);
    float3 _561 = float3(_135, _143, float(int(_131)));
    float3 _563 = select(_561, float3(0.0), isnan(_561));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _563.xy, uint(rint(_563.z)), 1.0);
    float3 _571 = float3(_137, _143, float(int(_131)));
    float3 _573 = select(_571, float3(0.0), isnan(_571));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _573.xy, uint(rint(_573.z)), 1.0);
    float2 _578 = float2(_50, _52);
    float2 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_578, float2(0.0), isnan(_578))).xy;
    float _167 = _165.x;
    float _169 = _165.y;
    float3 _593 = float3(_122, _151, float(int(_131)));
    float3 _595 = select(_593, float3(0.0), isnan(_593));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _595.xy, uint(rint(_595.z)), 1.0);
    float3 _603 = float3(_135, _151, float(int(_131)));
    float3 _605 = select(_603, float3(0.0), isnan(_603));
    float _173 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _605.xy, uint(rint(_605.z)), 1.0);
    float _175 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _147);
    float _177 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _145);
    float _179 = fma(_104, -0.5, _116);
    float _181 = fma(_104, -1.5, _116);
    float _183 = _175 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _185 = _177 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _637 = float3(_133, _151, float(int(_131)));
    float3 _639 = select(_637, float3(0.0), isnan(_637));
    float _187 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _639.xy, uint(rint(_639.z)), 1.0);
    float _189 = _155 + _157;
    float _191 = _183 * _153;
    float _193 = _185 * _153;
    float _195 = _189 + _159;
    float _197 = _195 + _161;
    float _199 = fma(_167, 2.0, -1.0);
    float _201 = fma(_169, 2.0, -1.0);
    float3 _668 = float3(_137, _151, float(int(_131)));
    float3 _670 = select(_668, float3(0.0), isnan(_668));
    float _203 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _670.xy, uint(rint(_670.z)), 1.0);
    float3 _678 = float3(_133, _179, float(int(_131)));
    float3 _680 = select(_678, float3(0.0), isnan(_678));
    float _205 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _680.xy, uint(rint(_680.z)), 1.0);
    float3 _688 = float3(_122, _179, float(int(_131)));
    float3 _690 = select(_688, float3(0.0), isnan(_688));
    float _207 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _690.xy, uint(rint(_690.z)), 1.0);
    float3 _698 = float3(_135, _179, float(int(_131)));
    float3 _700 = select(_698, float3(0.0), isnan(_698));
    float _209 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _700.xy, uint(rint(_700.z)), 1.0);
    float3 _708 = float3(_137, _179, float(int(_131)));
    float3 _710 = select(_708, float3(0.0), isnan(_708));
    float _211 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _710.xy, uint(rint(_710.z)), 1.0);
    float2 _715 = float2(_191, _193);
    float2 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_715, float2(0.0), isnan(_715))).xy;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _199 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _221 = _201 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _223 = fma(_219, 2.0, _50);
    float _225 = fma(_221, 2.0, _52);
    float3 _745 = float3(_133, _181, float(int(_131)));
    float3 _747 = select(_745, float3(0.0), isnan(_745));
    float _227 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _747.xy, uint(rint(_747.z)), 1.0);
    float3 _755 = float3(_122, _181, float(int(_131)));
    float3 _757 = select(_755, float3(0.0), isnan(_755));
    float _229 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _757.xy, uint(rint(_757.z)), 1.0);
    float3 _765 = float3(_135, _181, float(int(_131)));
    float3 _767 = select(_765, float3(0.0), isnan(_765));
    float _231 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _767.xy, uint(rint(_767.z)), 1.0);
    float3 _775 = float3(_137, _181, float(int(_131)));
    float3 _777 = select(_775, float3(0.0), isnan(_775));
    float _233 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _777.xy, uint(rint(_777.z)), 1.0);
    float2 _782 = float2(_223, _225);
    float _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782))).x;
    float _237 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _239 = _197 + _187;
    float _241 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].x, _237);
    float _243 = _239 + _171;
    float _245 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _241);
    float _247 = _243 + _173;
    float _249 = _245 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _251 = precise::min(_249, 1.0);
    float _253 = -_64;
    float _255 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _257 = _253 + _255;
    float _259 = _257 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _247 + _203;
    float _265 = _263 + _205;
    float _267 = -_215;
    float _269 = fma(_267, _215, _217);
    float _271 = -_215;
    float _273 = _251 + _271;
    float _275 = _265 + _207;
    float _277 = fma(_273, _273, _269);
    bool _281 = _273 <= 0.001000000047497451305389404296875;
    float _283 = float(_281);
    float _285 = _275 + _209;
    float _287 = 1.0 / _277;
    float _289 = _285 + _211;
    float _291 = _289 + _227;
    float _293 = _291 + _229;
    float _295 = _269 * _287;
    float _297 = _293 + _231;
    float _299 = -_64;
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _303 = _299 + _301;
    float _305 = precise::max(_295, _283);
    float _307 = _297 + _233;
    float _309 = _303 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = precise::min(_305, 1.0);
    float _315 = fma(_307, 0.0625, _261);
    float _317 = _311 + _313;
    out.m_43.x = _235;
    out.m_43.y = _315;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _317;
    return out;
}

