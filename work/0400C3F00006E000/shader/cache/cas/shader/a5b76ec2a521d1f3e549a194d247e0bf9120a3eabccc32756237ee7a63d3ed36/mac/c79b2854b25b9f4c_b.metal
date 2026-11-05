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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_14 [[id(12)]];
    sampler fp_t_tcb_14Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_16 [[id(14)]];
    sampler fp_t_tcb_16Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_18 [[id(16)]];
    sampler fp_t_tcb_18Smplr [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_ESmplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_12Smplr_w [[id(23)]];
    sampler fp_t_tcb_14Smplr_w [[id(24)]];
    sampler fp_t_tcb_16Smplr_w [[id(25)]];
    sampler fp_t_tcb_18Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
    float4 m_47 [[color(1)]];
    float4 m_49 [[color(2)]];
    float4 m_51 [[color(3)]];
    float4 m_53 [[color(4)]];
    float4 m_55 [[color(5)]];
    float4 m_57 [[color(6)]];
    float4 m_59 [[color(7)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_39.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_39.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _201 = float2(_82, _84);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_201, float2(0.0), isnan(_201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_201, float2(0.0), isnan(_201))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float2 _221 = float2(_82, _84);
    float4 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_221, float2(0.0), isnan(_221))).xyzw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    float _105 = _97.w;
    float2 _237 = float2(_82, _84);
    float4 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_237, float2(0.0), isnan(_237))).xyzw;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _107.z;
    float _115 = _107.w;
    float2 _253 = float2(_82, _84);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_253, float2(0.0), isnan(_253))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_253, float2(0.0), isnan(_253))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float2 _269 = float2(_82, _84);
    float4 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_269, float2(0.0), isnan(_269))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_269, float2(0.0), isnan(_269))).xyzw;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float _135 = _127.w;
    float2 _285 = float2(_82, _84);
    float4 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_285, float2(0.0), isnan(_285))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_285, float2(0.0), isnan(_285))).xyzw;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    float _145 = _137.w;
    float2 _301 = float2(_82, _84);
    float4 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_301, float2(0.0), isnan(_301))).xyzw;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float _155 = _147.w;
    float2 _317 = float2(_82, _84);
    float4 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_317, float2(0.0), isnan(_317))).xyzw;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _157.w;
    float2 _333 = float2(_82, _84);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_333, float2(0.0), isnan(_333))).x;
    out.gl_FragDepth = _167;
    out.m_45.x = _89;
    out.m_45.y = _91;
    out.m_45.z = _93;
    out.m_45.w = _95;
    out.m_47.x = _99;
    out.m_47.y = _101;
    out.m_47.z = _103;
    out.m_47.w = _105;
    out.m_49.x = _109;
    out.m_49.y = _111;
    out.m_49.z = _113;
    out.m_49.w = _115;
    out.m_51.x = _119;
    out.m_51.y = _121;
    out.m_51.z = _123;
    out.m_51.w = _125;
    out.m_53.x = _129;
    out.m_53.y = _131;
    out.m_53.z = _133;
    out.m_53.w = _135;
    out.m_55.x = _139;
    out.m_55.y = _141;
    out.m_55.z = _143;
    out.m_55.w = _145;
    out.m_57.x = _149;
    out.m_57.y = _151;
    out.m_57.z = _153;
    out.m_57.w = _155;
    out.m_59.x = _159;
    out.m_59.y = _161;
    out.m_59.z = _163;
    out.m_59.w = _165;
    return out;
}

