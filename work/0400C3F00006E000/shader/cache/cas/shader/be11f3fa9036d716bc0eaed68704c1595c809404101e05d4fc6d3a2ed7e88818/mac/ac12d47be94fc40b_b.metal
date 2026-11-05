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
    constant _16* fp_c15 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _249 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_249, float2(0.0), isnan(_249))).w;
    float _69 = in.m_33.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _61 * _73;
    float _83 = _61 * _79;
    float _85 = fma(_81, 8000.0, (*spvDescriptorSet0.fp_c15)._m0[631].z);
    float _87 = fma(_81, 8000.0, (*spvDescriptorSet0.fp_c15)._m0[632].z);
    float _89 = fma(_83, -8000.0, (*spvDescriptorSet0.fp_c15)._m0[631].x);
    float _91 = _85 * _85;
    float _93 = _87 * _87;
    float _95 = fma(_81, 8000.0, (*spvDescriptorSet0.fp_c15)._m0[633].z);
    float _97 = fma(_81, 8000.0, (*spvDescriptorSet0.fp_c15)._m0[634].z);
    float _99 = fma(_89, _89, _91);
    float _101 = fma(_83, -8000.0, (*spvDescriptorSet0.fp_c15)._m0[633].x);
    float _103 = _95 * _95;
    float _105 = fma(_83, -8000.0, (*spvDescriptorSet0.fp_c15)._m0[632].x);
    float _107 = fma(_83, -8000.0, (*spvDescriptorSet0.fp_c15)._m0[634].x);
    float _109 = _97 * _97;
    float _111 = fma(_101, _101, _103);
    float _113 = fma(_105, _105, _93);
    float _115 = sqrt(_99);
    float _117 = fma(_107, _107, _109);
    float _119 = in.m_35.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_37.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = sqrt(_113);
    float _133 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _135 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _133;
    float _137 = sqrt(_111);
    float _139 = sqrt(_117);
    float _141 = precise::min(_115, _131);
    float _143 = precise::min(_137, _139);
    float _145 = _61 * _123;
    float _147 = precise::min(_141, _143);
    float _149 = 1.0 / _135;
    float _151 = precise::max(_147, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _153 = precise::min(_151, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _155 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _157 = _153 + _155;
    float _159 = _157 * _149;
    float _161 = in.m_35.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_35.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _67 * _67;
    float _175 = _173 * _173;
    float _177 = _159 * _159;
    float _179 = _145 * _175;
    float _181 = _61 * _129;
    float _183 = _179 * _177;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _185 * _181;
    bool _191 = _187 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _193 = isnan(_187);
    bool _195 = _191 || _193;
    bool _197 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _199 = _195 || _197;
    float _201 = in.m_35.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    if (!_199)
    {
        discard_fragment();
    }
    float _207 = _61 * _205;
    float _209 = _61 * _165;
    float _211 = _61 * _171;
    if (!_199)
    {
        out.m_40.x = _207;
        out.m_40.y = _209;
        out.m_40.z = _211;
        out.m_40.w = _185;
        return out;
    }
    float _213 = 0.0 + _187;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    out.m_40.x = _207;
    out.m_40.y = _209;
    out.m_40.z = _211;
    out.m_40.w = _215;
    return out;
}

