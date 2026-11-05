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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _263 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).w;
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
    float _93 = 1.0 / _91;
    float _95 = _71 * _93;
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = fma(_97, -2.0, 3.0);
    float _101 = _97 * _97;
    float _103 = _65 * _83;
    float _105 = _99 * _101;
    float _107 = _103 * _105;
    float _109 = _65 * _89;
    float _111 = 0.0 + _107;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _113 * _109;
    bool _119 = _115 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _121 = isnan(_115);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _127 = _123 || _125;
    float _129 = in.m_37.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_37.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_37.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    if (!_127)
    {
        discard_fragment();
    }
    float _147 = _65 * _133;
    float _149 = _65 * _139;
    float _151 = _65 * _145;
    if (!_127)
    {
        out.m_42.x = _147;
        out.m_42.y = _149;
        out.m_42.z = _151;
        out.m_42.w = _107;
        return out;
    }
    float _153 = _149 * 0.715200006961822509765625;
    float _155 = 0.0 + _115;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_147, 0.2125999927520751953125, _153);
    bool _161 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _163 = fma(_151, 0.072200000286102294921875, _159);
    float _165 = 1.0 / _163;
    float _167 = _165 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _173 = _147 * _171;
    float _175 = _149 * _171;
    float _177 = _151 * _171;
    float _179 = _171;
    if (!_161)
    {
        _179 = _157;
    }
    float _181 = _179;
    bool _183 = !_161;
    float _185 = _181;
    if (!_183)
    {
        float _187 = in.m_44.w;
        float _189 = gl_FragCoord.w;
        float _191 = _187 * _189;
        float _193 = in.m_44.z;
        float _195 = gl_FragCoord.w;
        float _197 = _193 * _195;
        float _199 = _65 * _191;
        float _201 = _65 * _197;
        float _203 = 1.0 / _199;
        float _205 = _201 * _203;
        float _207 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _209 = fma(_205, (*spvDescriptorSet0.fp_c8)._m0[30].w, _207);
        float _211 = 1.0 / _209;
        float _213 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _215 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _217 = fma(_211, _213, _215);
        float _219 = _217 * 8.0;
        float _221 = precise::clamp(_219, 0.0, 1.0);
        float _223 = _157 * _221;
        _185 = _223;
    }
    float _225 = _185;
    float _227 = 0.0 + _225;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    out.m_42.x = _173;
    out.m_42.y = _175;
    out.m_42.z = _177;
    out.m_42.w = _229;
    return out;
}

