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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.z;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _252 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_252, float2(0.0), isnan(_252))).w;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _65 * _77;
    float _93 = _65 * _83;
    float _95 = in.m_35.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_35.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _71 * _91;
    float _109 = _65 * _89;
    float _111 = _93 * _107;
    float _113 = 0.0 + _111;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _109;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    float _131 = in.m_35.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    if (!_129)
    {
        discard_fragment();
    }
    float _137 = _65 * _99;
    float _139 = _65 * _105;
    float _141 = _65 * _135;
    if (!_129)
    {
        out.m_42.x = _137;
        out.m_42.y = _141;
        out.m_42.z = _139;
        out.m_42.w = _111;
        return out;
    }
    float _143 = _141 * 0.715200006961822509765625;
    float _145 = 0.0 + _117;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = fma(_137, 0.2125999927520751953125, _143);
    bool _151 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _153 = fma(_139, 0.072200000286102294921875, _149);
    float _155 = 1.0 / _153;
    float _157 = _155 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _163 = _137 * _161;
    float _165 = _141 * _161;
    float _167 = _139 * _161;
    float _169 = _161;
    if (!_151)
    {
        _169 = _147;
    }
    float _171 = _169;
    bool _173 = !_151;
    float _175 = _171;
    if (!_173)
    {
        float _177 = in.m_44.w;
        float _179 = gl_FragCoord.w;
        float _181 = _177 * _179;
        float _183 = in.m_44.z;
        float _185 = gl_FragCoord.w;
        float _187 = _183 * _185;
        float _189 = _65 * _181;
        float _191 = _65 * _187;
        float _193 = 1.0 / _189;
        float _195 = _191 * _193;
        float _197 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _199 = fma(_195, (*spvDescriptorSet0.fp_c8)._m0[30].w, _197);
        float _201 = 1.0 / _199;
        float _203 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _207 = fma(_201, _203, _205);
        float _209 = _207 * 8.0;
        float _211 = precise::clamp(_209, 0.0, 1.0);
        float _213 = _147 * _211;
        _175 = _213;
    }
    float _215 = _175;
    float _217 = 0.0 + _215;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    out.m_42.x = _163;
    out.m_42.y = _165;
    out.m_42.z = _167;
    out.m_42.w = _219;
    return out;
}

