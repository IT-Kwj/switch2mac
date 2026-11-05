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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    sampler fp_t_tcb_ESmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_41 [[user(locn3), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _51;
    float _61 = _59 * _57;
    bool _65 = _61 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _67 = isnan(_61);
    bool _69 = _65 || _67;
    bool _71 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _73 = _69 || _71;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.x;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    if (!_73)
    {
        discard_fragment();
    }
    float _95 = in.m_37.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = (*spvDescriptorSet0.fp_c8)._m0[2].y * (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = fma((*spvDescriptorSet0.fp_c8)._m0[2].x, (*spvDescriptorSet0.fp_c10)._m0[8].w, _101);
    float _117 = fma((*spvDescriptorSet0.fp_c8)._m0[2].z, (*spvDescriptorSet0.fp_c10)._m0[10].w, _115);
    float _119 = _59 * _79;
    float _121 = _117 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _123 = _87 * _119;
    float _125 = _59 * _93;
    float _127 = -_121;
    float _129 = precise::max(_127, 10.0);
    float _131 = _59 * _85;
    float _133 = _125 * _123;
    float _135 = precise::min(_129, 20.0);
    float _137 = 1.0 / _131;
    float _139 = fma(_135, 0.100000001490116119384765625, -1.0);
    float _141 = _59 * _99;
    float _143 = _139 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _145 = _141 * _123;
    float _147 = _59 * _113;
    float _149 = _133 * _143;
    float _151 = _145 * _143;
    float _153 = _59 * _107;
    float _155 = _149 * (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _157 = fma(_147, _137, _151);
    float _159 = fma(_153, _137, _155);
    float2 _393 = float2(_159, _157);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_393, float2(0.0), isnan(_393))).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = in.m_39.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = _59 * _175;
    if (!_73)
    {
        out.m_44.x = _165;
        out.m_44.y = _167;
        out.m_44.z = _169;
        out.m_44.w = 1.0;
        return out;
    }
    bool _179 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _181 = 0.0 + _61;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    bool _185 = !_179;
    float _187 = _183;
    if (!_185)
    {
        float _189 = _177 * _137;
        float _191 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _193 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[30].w, _191);
        float _195 = 1.0 / _193;
        float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _199 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _201 = fma(_195, _197, _199);
        float _203 = _201 * 8.0;
        float _205 = precise::clamp(_203, 0.0, 1.0);
        float _207 = _183 * _205;
        _187 = _207;
    }
    float _209 = _187;
    float _211 = 0.0 + _209;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    out.m_44.x = _165;
    out.m_44.y = _167;
    out.m_44.z = _169;
    out.m_44.w = _213;
    return out;
}

