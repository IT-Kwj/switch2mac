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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_37 [[color(1)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _203 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float2(0.0), isnan(_203))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float2(0.0), isnan(_203))).x;
    float2 _215 = float2(_60, _62);
    float4 _67 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_215, float2(0.0), isnan(_215)), int2(0), component::x).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = in.m_31.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_31.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _58 * _81;
    float _91 = _58 * _87;
    float _93 = floor(_89);
    float _95 = floor(_91);
    float _97 = -_93;
    float _99 = _89 + _97;
    float _101 = -_64;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _105 = 1.0 / _103;
    float _107 = -_64;
    float _109 = _107 + _75;
    float _111 = -_64;
    float _113 = _111 + _71;
    float _115 = -_64;
    float _117 = _115 + _69;
    float _119 = -_64;
    float _121 = _119 + _73;
    float _123 = abs(_113);
    float _125 = -_123;
    float _127 = abs(_109);
    float _129 = _125 + _127;
    float _131 = -_95;
    float _133 = _91 + _131;
    float _135 = abs(_117);
    float _137 = abs(_121);
    float _139 = -_137;
    float _141 = _135 + _139;
    float _143 = _129 + _141;
    float _145 = -_141;
    float _147 = _129 + _145;
    float _149 = _105 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _151 = fma(_149, _143, _99);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = fma(_149, _147, _133);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = -_99;
    float _161 = _159 + _153;
    float _163 = -_133;
    float _165 = _163 + _157;
    float _167 = fma(_161, 0.5, 0.5);
    float _169 = fma(_165, 0.5, 0.5);
    out.gl_FragDepth = _143;
    out.m_37.x = _167;
    out.m_37.y = _169;
    return out;
}

