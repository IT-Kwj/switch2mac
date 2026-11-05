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
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float2 _223 = float2(_71, _73);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_223, float2(0.0), isnan(_223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_223, float2(0.0), isnan(_223))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float2 _242 = float2(_77, _75);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_242, float2(0.0), isnan(_242))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    int _101 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].x) & 128;
    bool _105 = _101 != 0;
    float _107 = precise::max(_98, _88);
    float _109 = 1.0 / _84;
    float _111 = _107;
    if (_105)
    {
        float _113 = precise::min(_98, _88);
        _111 = _113;
    }
    float _115 = _111;
    float _117 = -_94;
    float _119 = _117 + 1.000010013580322265625;
    float _121 = -_92;
    float _123 = _121 + 1.000010013580322265625;
    float _125 = -_96;
    float _127 = _125 + 1.000010013580322265625;
    float _129 = 1.0 / _82;
    float _131 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    bool _135 = _133 != 0.0;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan(0.0);
    bool _143 = _139 || _141;
    float _145 = 1.0 / _86;
    float _147 = -_119;
    float _149 = fma(_147, _109, 1.0);
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = -_123;
    float _155 = fma(_153, _129, 1.0);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].x, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _161 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _163 = -_127;
    float _165 = fma(_163, _145, 1.0);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    if (_143)
    {
        out.m_36.x = _159;
        out.m_36.y = _161;
        out.m_36.z = _169;
        out.m_36.w = _133;
        return out;
    }
    discard_fragment();
    return out;
}

