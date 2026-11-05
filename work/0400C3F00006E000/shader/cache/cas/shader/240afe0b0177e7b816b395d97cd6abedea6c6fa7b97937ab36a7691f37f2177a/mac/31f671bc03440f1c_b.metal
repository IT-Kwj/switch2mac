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
    float2 _332 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_332, float2(0.0), isnan(_332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_332, float2(0.0), isnan(_332))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _56;
    float _72 = _68 * _58;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _78 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = _70 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _82 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _74);
    float _84 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _76);
    float _86 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _88 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _90 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _82);
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _84);
    float _94 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _86);
    float _96 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _100 = _92 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _102 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _78);
    float _104 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _106 = 1.0 / _98;
    float _108 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _102);
    float _110 = _104 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _112 = _108 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _114 = _100 * _106;
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _110 * _106;
    float _120 = _112 * _106;
    float _122 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _80);
    float _124 = _70 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _126 = fma(_88, 0.5, _118);
    float _128 = rint(_116);
    float _130 = precise::max(_128, 0.0);
    uint _133 = uint(_130);
    uint _135 = clamp(_133, 0u, 65535u);
    float _137 = fma(_88, 1.5, _118);
    float _139 = fma(_88, -0.5, _118);
    float _141 = fma(_88, -1.5, _118);
    float _143 = _70 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _145 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[15].z, _122);
    float _147 = fma(_96, 1.5, _120);
    float _149 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _124);
    float _151 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _143);
    float _153 = _145 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _155 = fma(_96, 0.5, _120);
    float _157 = 1.0 / _153;
    float3 _547 = float3(_137, _147, float(int(_135)));
    float3 _551 = select(_547, float3(0.0), isnan(_547));
    float _159 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _551.xy, uint(rint(_551.z)), 1.0);
    float3 _559 = float3(_126, _147, float(int(_135)));
    float3 _561 = select(_559, float3(0.0), isnan(_559));
    float _161 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _561.xy, uint(rint(_561.z)), 1.0);
    float3 _569 = float3(_139, _147, float(int(_135)));
    float3 _571 = select(_569, float3(0.0), isnan(_569));
    float _163 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _571.xy, uint(rint(_571.z)), 1.0);
    float3 _579 = float3(_141, _147, float(int(_135)));
    float3 _581 = select(_579, float3(0.0), isnan(_579));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _581.xy, uint(rint(_581.z)), 1.0);
    float2 _586 = float2(_50, _52);
    float2 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_586, float2(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_586, float2(0.0), isnan(_586))).xy;
    float _171 = _169.x;
    float _173 = _169.y;
    float3 _601 = float3(_126, _155, float(int(_135)));
    float3 _603 = select(_601, float3(0.0), isnan(_601));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _603.xy, uint(rint(_603.z)), 1.0);
    float3 _611 = float3(_139, _155, float(int(_135)));
    float3 _613 = select(_611, float3(0.0), isnan(_611));
    float _177 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _613.xy, uint(rint(_613.z)), 1.0);
    float _179 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[12].z, _151);
    float _181 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[13].z, _149);
    float _183 = fma(_96, -0.5, _120);
    float _185 = fma(_96, -1.5, _120);
    float _187 = _179 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _189 = _181 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float3 _645 = float3(_137, _155, float(int(_135)));
    float3 _647 = select(_645, float3(0.0), isnan(_645));
    float _191 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _647.xy, uint(rint(_647.z)), 1.0);
    float _193 = _159 + _161;
    float _195 = _187 * _157;
    float _197 = _189 * _157;
    float _199 = _193 + _163;
    float _201 = _199 + _165;
    float _203 = fma(_171, 2.0, -1.0);
    float _205 = fma(_173, 2.0, -1.0);
    float3 _676 = float3(_141, _155, float(int(_135)));
    float3 _678 = select(_676, float3(0.0), isnan(_676));
    float _207 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _678.xy, uint(rint(_678.z)), 1.0);
    float3 _686 = float3(_137, _183, float(int(_135)));
    float3 _688 = select(_686, float3(0.0), isnan(_686));
    float _209 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _688.xy, uint(rint(_688.z)), 1.0);
    float3 _696 = float3(_126, _183, float(int(_135)));
    float3 _698 = select(_696, float3(0.0), isnan(_696));
    float _211 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _698.xy, uint(rint(_698.z)), 1.0);
    float3 _706 = float3(_139, _183, float(int(_135)));
    float3 _708 = select(_706, float3(0.0), isnan(_706));
    float _213 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _708.xy, uint(rint(_708.z)), 1.0);
    float3 _716 = float3(_141, _183, float(int(_135)));
    float3 _718 = select(_716, float3(0.0), isnan(_716));
    float _215 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _718.xy, uint(rint(_718.z)), 1.0);
    float2 _723 = float2(_195, _197);
    float2 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_723, float2(0.0), isnan(_723))).xy;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _203 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _225 = _205 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _227 = fma(_223, 2.0, _50);
    float _229 = fma(_225, 2.0, _52);
    float3 _753 = float3(_137, _185, float(int(_135)));
    float3 _755 = select(_753, float3(0.0), isnan(_753));
    float _231 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _755.xy, uint(rint(_755.z)), 1.0);
    float3 _763 = float3(_126, _185, float(int(_135)));
    float3 _765 = select(_763, float3(0.0), isnan(_763));
    float _233 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _765.xy, uint(rint(_765.z)), 1.0);
    float3 _773 = float3(_139, _185, float(int(_135)));
    float3 _775 = select(_773, float3(0.0), isnan(_773));
    float _235 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _775.xy, uint(rint(_775.z)), 1.0);
    float3 _783 = float3(_141, _185, float(int(_135)));
    float3 _785 = select(_783, float3(0.0), isnan(_783));
    float _237 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _785.xy, uint(rint(_785.z)), 1.0);
    float2 _790 = float2(_227, _229);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_790, float2(0.0), isnan(_790))).x;
    float _241 = _70 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _243 = _201 + _191;
    float _245 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _241);
    float _247 = _243 + _175;
    float _249 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[14].z, _245);
    float _251 = _247 + _177;
    float _253 = _249 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _255 = precise::min(_253, 1.0);
    float _257 = -_68;
    float _259 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _261 = _257 + _259;
    float _263 = _261 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _251 + _207;
    float _269 = _267 + _209;
    float _271 = -_219;
    float _273 = fma(_271, _219, _221);
    float _275 = -_219;
    float _277 = _255 + _275;
    float _279 = _269 + _211;
    float _281 = fma(_277, _277, _273);
    bool _285 = _277 <= 0.001000000047497451305389404296875;
    float _287 = float(_285);
    float _289 = _279 + _213;
    float _291 = 1.0 / _281;
    float _293 = _289 + _215;
    float _295 = _293 + _231;
    float _297 = _295 + _233;
    float _299 = _273 * _291;
    float _301 = _297 + _235;
    float _303 = -_68;
    float _305 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _307 = _303 + _305;
    float _309 = precise::max(_299, _287);
    float _311 = _301 + _237;
    float _313 = _307 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = precise::min(_309, 1.0);
    float _319 = fma(_311, 0.0625, _265);
    float _321 = _315 + _317;
    out.m_43.x = _239;
    out.m_43.y = _319;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _321;
    return out;
}

