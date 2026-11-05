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
    float4 m_46 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_42 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _287 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).w;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _79;
    float _95 = _67 * _85;
    float _97 = in.m_35.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_35.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _67 * _101;
    float _111 = _67 * _107;
    float _113 = _73 * _93;
    float _115 = 0.0 + _113;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _117 * _95;
    bool _123 = _119 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _125 = isnan(_119);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _131 = _127 || _129;
    if (!_131)
    {
        discard_fragment();
    }
    float _133 = _67 * _91;
    if (!_131)
    {
        out.m_40.x = _133;
        out.m_40.y = _109;
        out.m_40.z = _111;
        out.m_40.w = _113;
        return out;
    }
    float _135 = _109 * 0.715200006961822509765625;
    float _137 = in.m_42.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_44.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_44.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = fma(_133, 0.2125999927520751953125, _135);
    float _157 = in.m_44.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_44.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = fma(_111, 0.072200000286102294921875, _155);
    bool _171 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _173 = 1.0 / _169;
    float _175 = _173 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _67 * _141;
    float _181 = fma(_177, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _183 = _67 * _147;
    float _185 = _67 * _153;
    float _187 = _119 * _179;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _67 * _161;
    float _193 = _181 * _183;
    float _195 = _67 * _167;
    float _197 = fma(_111, _193, _185);
    float _199 = fma(_133, _193, _191);
    float _201 = fma(_109, _193, _195);
    float _203 = _185;
    if (!_171)
    {
        _203 = _189;
    }
    float _205 = _203;
    bool _207 = !_171;
    float _209 = _205;
    if (!_207)
    {
        float _211 = in.m_46.w;
        float _213 = gl_FragCoord.w;
        float _215 = _211 * _213;
        float _217 = in.m_46.z;
        float _219 = gl_FragCoord.w;
        float _221 = _217 * _219;
        float _223 = _67 * _215;
        float _225 = _67 * _221;
        float _227 = 1.0 / _223;
        float _229 = _225 * _227;
        float _231 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _233 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[30].w, _231);
        float _235 = 1.0 / _233;
        float _237 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _241 = fma(_235, _237, _239);
        float _243 = _241 * 8.0;
        float _245 = precise::clamp(_243, 0.0, 1.0);
        float _247 = _189 * _245;
        _209 = _247;
    }
    float _249 = _209;
    float _251 = 0.0 + _249;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    out.m_40.x = _199;
    out.m_40.y = _201;
    out.m_40.z = _197;
    out.m_40.w = _253;
    return out;
}

