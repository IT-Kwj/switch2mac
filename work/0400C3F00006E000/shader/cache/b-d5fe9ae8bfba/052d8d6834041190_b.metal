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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_42 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _240 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_240, float2(0.0), isnan(_240))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_240, float2(0.0), isnan(_240))).w;
    float _71 = in.m_35.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_35.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = in.m_35.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _63 * _97;
    float _107 = _63 * _103;
    float _109 = _69 * _89;
    float _111 = 0.0 + _109;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _113 * _91;
    bool _119 = _115 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _121 = isnan(_115);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _127 = _123 || _125;
    if (!_127)
    {
        discard_fragment();
    }
    float _129 = _63 * _87;
    if (!_127)
    {
        out.m_40.x = _129;
        out.m_40.y = _105;
        out.m_40.z = _107;
        out.m_40.w = _109;
        return out;
    }
    float _131 = _105 * 0.715200006961822509765625;
    float _133 = 0.0 + _115;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = fma(_129, 0.2125999927520751953125, _131);
    bool _139 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _141 = fma(_107, 0.072200000286102294921875, _137);
    float _143 = 1.0 / _141;
    float _145 = _143 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _151 = _129 * _149;
    float _153 = _105 * _149;
    float _155 = _107 * _149;
    float _157 = _149;
    if (!_139)
    {
        _157 = _135;
    }
    float _159 = _157;
    bool _161 = !_139;
    float _163 = _159;
    if (!_161)
    {
        float _165 = in.m_42.w;
        float _167 = gl_FragCoord.w;
        float _169 = _165 * _167;
        float _171 = in.m_42.z;
        float _173 = gl_FragCoord.w;
        float _175 = _171 * _173;
        float _177 = _63 * _169;
        float _179 = _63 * _175;
        float _181 = 1.0 / _177;
        float _183 = _179 * _181;
        float _185 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _187 = fma(_183, (*spvDescriptorSet0.fp_c8)._m0[30].w, _185);
        float _189 = 1.0 / _187;
        float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _193 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _195 = fma(_189, _191, _193);
        float _197 = _195 * 8.0;
        float _199 = precise::clamp(_197, 0.0, 1.0);
        float _201 = _135 * _199;
        _163 = _201;
    }
    float _203 = _163;
    float _205 = 0.0 + _203;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    out.m_40.x = _151;
    out.m_40.y = _153;
    out.m_40.z = _155;
    out.m_40.w = _207;
    return out;
}

