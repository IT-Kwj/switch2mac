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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _196 = float2(_69, _71);
    float2 _79 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_196, float2(0.0), isnan(_196)), int2(0), component::x).xz;
    float _81 = _79.x;
    float _83 = _79.y;
    float2 _211 = float2(_73, _75);
    float3 _87 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_211, float2(0.0), isnan(_211)), int2(0), component::x).xzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = precise::max(_81, _83);
    float _97 = precise::max(_89, _91);
    float _99 = precise::min(_81, _83);
    float _101 = precise::min(_89, _91);
    float _103 = precise::max(_95, _97);
    float _105 = precise::min(_99, _101);
    float _107 = precise::max(_93, _103);
    float _109 = precise::min(_93, _105);
    float _111 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = -_109;
    float _115 = _107 + _113;
    float _117 = precise::max(_111, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _121 = _115 >= _117;
    bool _123 = isnan(_115);
    bool _125 = _121 || _123;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = !_129;
    if (!_131)
    {
        float2 _282 = float2(_73, _75);
        float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_282, float2(0.0), isnan(_282))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_282, float2(0.0), isnan(_282))).xyzw;
        float _136 = _134.x;
        float _138 = _134.y;
        float _140 = _134.z;
        float _142 = _134.w;
        out.m_34.x = _136;
        out.m_34.y = _138;
        out.m_34.z = _140;
        out.m_34.w = _142;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = 0.0;
    return out;
}

