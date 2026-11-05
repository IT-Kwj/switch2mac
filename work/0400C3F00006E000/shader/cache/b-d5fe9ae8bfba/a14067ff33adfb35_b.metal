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
    float4 m_33 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
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
    float2 _319 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_319, float2(0.0), isnan(_319))).w;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _79;
    float _95 = _67 * _85;
    float _97 = in.m_37.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _73 * _93;
    float _105 = _67 * _91;
    float _107 = _95 * _103;
    float _109 = 0.0 + _107;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = _111 * _105;
    bool _117 = _113 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _119 = isnan(_113);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _125 = _121 || _123;
    float _127 = in.m_35.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    if (!_125)
    {
        discard_fragment();
    }
    float _133 = _67 * _101;
    float _135 = in.m_35.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _67 * _131;
    float _143 = in.m_35.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _133 * _141;
    float _151 = in.m_37.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _67 * _147;
    float _159 = in.m_37.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _67 * _155;
    float _167 = _165 * _157;
    float _169 = _67 * _163;
    float _171 = _67 * _139;
    float _173 = _169 * _171;
    if (!_125)
    {
        out.m_42.x = _149;
        out.m_42.y = _167;
        out.m_42.z = _173;
        out.m_42.w = _107;
        return out;
    }
    float _175 = _167 * 0.715200006961822509765625;
    float _177 = in.m_44.w;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_44.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_44.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = fma(_149, 0.2125999927520751953125, _175);
    float _197 = in.m_44.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = fma(_173, 0.072200000286102294921875, _195);
    bool _205 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _207 = 1.0 / _203;
    float _209 = _207 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_211, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _215 = _67 * _181;
    float _217 = 0.0 + _113;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _67 * _187;
    float _223 = _67 * _201;
    float _225 = _213 * _215;
    float _227 = _67 * _193;
    float _229 = fma(_173, _225, _221);
    float _231 = fma(_149, _225, _227);
    float _233 = fma(_167, _225, _223);
    float _235 = _221;
    if (!_205)
    {
        _235 = _219;
    }
    float _237 = _235;
    bool _239 = !_205;
    float _241 = _237;
    if (!_239)
    {
        float _243 = in.m_46.w;
        float _245 = gl_FragCoord.w;
        float _247 = _243 * _245;
        float _249 = in.m_46.z;
        float _251 = gl_FragCoord.w;
        float _253 = _249 * _251;
        float _255 = _67 * _247;
        float _257 = _67 * _253;
        float _259 = 1.0 / _255;
        float _261 = _257 * _259;
        float _263 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _265 = fma(_261, (*spvDescriptorSet0.fp_c8)._m0[30].w, _263);
        float _267 = 1.0 / _265;
        float _269 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _273 = fma(_267, _269, _271);
        float _275 = _273 * 8.0;
        float _277 = precise::clamp(_275, 0.0, 1.0);
        float _279 = _219 * _277;
        _241 = _279;
    }
    float _281 = _241;
    float _283 = 0.0 + _281;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    out.m_42.x = _231;
    out.m_42.y = _233;
    out.m_42.z = _229;
    out.m_42.w = _285;
    return out;
}

