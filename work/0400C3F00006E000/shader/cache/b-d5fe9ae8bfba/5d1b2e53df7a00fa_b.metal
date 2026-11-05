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
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.w;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _43;
    float _83 = _81 * _49;
    float _85 = _81 * _55;
    float _87 = _81 * _61;
    float _89 = _81 * _67;
    float _91 = _81 * _73;
    float _93 = _81 * _79;
    float _95 = 1.0 / _83;
    float _97 = 1.0 / _85;
    float _99 = _87 * _95;
    float _101 = _89 * _95;
    float _103 = _91 * _97;
    float _105 = _93 * _97;
    float2 _267 = float2(_99, _101);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float2 _286 = float2(_103, _105);
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_286, float2(0.0), isnan(_286))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_286, float2(0.0), isnan(_286))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    int _129 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _133 = _129 != 0;
    float _135 = precise::max(_116, _126);
    float _137 = -_126;
    float _139 = _137 + 1.0;
    float _141 = _135;
    if (_133)
    {
        float _143 = precise::min(_116, _126);
        _141 = _143;
    }
    float _145 = _141;
    float _147 = _110 * _139;
    float _149 = _112 * _139;
    float _151 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _114 * _139;
    float _157 = fma(_120, _126, _147);
    float _159 = fma(_122, _126, _149);
    bool _161 = _153 != 0.0;
    bool _163 = isnan(_153);
    bool _165 = _161 || _163;
    bool _167 = isnan(0.0);
    bool _169 = _165 || _167;
    float _171 = fma(_124, _126, _155);
    float _173 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _175 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    if (_169)
    {
        out.m_36.x = _173;
        out.m_36.y = _175;
        out.m_36.z = _177;
        out.m_36.w = _153;
        return out;
    }
    discard_fragment();
    return out;
}

