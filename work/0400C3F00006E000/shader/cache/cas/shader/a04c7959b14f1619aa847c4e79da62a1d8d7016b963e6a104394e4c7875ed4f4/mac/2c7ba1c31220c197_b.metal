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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_44 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_42 [[user(locn6)]];
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
    float2 _277 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).w;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_35.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _65 * _77;
    float _93 = _65 * _83;
    float _95 = in.m_35.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_35.z;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _65 * _99;
    float _109 = _65 * _105;
    float _111 = _71 * _91;
    float _113 = 0.0 + _111;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _93;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    if (!_129)
    {
        discard_fragment();
    }
    float _131 = _65 * _89;
    if (!_129)
    {
        out.m_40.x = _131;
        out.m_40.y = _107;
        out.m_40.z = _109;
        out.m_40.w = _111;
        return out;
    }
    float _133 = _107 * 0.715200006961822509765625;
    float _135 = in.m_42.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_42.z;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_42.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = fma(_131, 0.2125999927520751953125, _133);
    float _155 = in.m_42.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = fma(_109, 0.072200000286102294921875, _153);
    bool _163 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _165 = 1.0 / _161;
    float _167 = _165 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _65 * _139;
    float _173 = fma(_169, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _175 = _65 * _145;
    float _177 = _173 * _171;
    float _179 = 0.0 + _117;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _65 * _151;
    float _185 = _65 * _159;
    float _187 = fma(_109, _177, _175);
    float _189 = fma(_131, _177, _183);
    float _191 = fma(_107, _177, _185);
    float _193 = _175;
    if (!_163)
    {
        _193 = _181;
    }
    float _195 = _193;
    bool _197 = !_163;
    float _199 = _195;
    if (!_197)
    {
        float _201 = in.m_44.w;
        float _203 = gl_FragCoord.w;
        float _205 = _201 * _203;
        float _207 = in.m_44.z;
        float _209 = gl_FragCoord.w;
        float _211 = _207 * _209;
        float _213 = _65 * _205;
        float _215 = _65 * _211;
        float _217 = 1.0 / _213;
        float _219 = _215 * _217;
        float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _223 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
        float _225 = 1.0 / _223;
        float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _229 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _231 = fma(_225, _227, _229);
        float _233 = _231 * 8.0;
        float _235 = precise::clamp(_233, 0.0, 1.0);
        float _237 = _181 * _235;
        _199 = _237;
    }
    float _239 = _199;
    float _241 = 0.0 + _239;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    out.m_40.x = _189;
    out.m_40.y = _191;
    out.m_40.z = _187;
    out.m_40.w = _243;
    return out;
}

