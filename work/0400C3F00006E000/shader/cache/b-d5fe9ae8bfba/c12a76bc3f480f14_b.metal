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
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
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
    float2 _314;
    _314.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_67, _69));
    _314.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_67, _69));
    float _71 = _314.x;
    float _73 = _71 * 256.0;
    int _76 = int(_73);
    float _78 = float(uint(_76));
    float _80 = _78 * 0.00390625;
    float _82 = precise::min(_80, 2.0);
    float2 _334 = float2(_67, _69);
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334)), level(_82)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334)), level(_82)).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = in.m_35.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_37.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _65 * _99;
    float _109 = _65 * _105;
    float _111 = in.m_39.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_35.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_39.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_35.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_39.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _65 * _121;
    float _143 = _65 * _127;
    float _145 = _65 * _139;
    float _147 = _93 * _107;
    float _149 = 0.0 + _147;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _151 * _109;
    bool _157 = _153 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _159 = isnan(_153);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _165 = _161 || _163;
    float _167 = in.m_35.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    if (!_165)
    {
        discard_fragment();
    }
    float _173 = _65 * _115;
    float _175 = -_143;
    float _177 = _141 + _175;
    float _179 = _89 * _89;
    float _181 = _91 * _91;
    float _183 = fma(_179, _177, _143);
    float _185 = _65 * _171;
    float _187 = _65 * _133;
    float _189 = -_173;
    float _191 = _185 + _189;
    float _193 = -_145;
    float _195 = _187 + _193;
    float _197 = _87 * _87;
    float _199 = fma(_181, _195, _145);
    float _201 = fma(_197, _191, _173);
    if (!_165)
    {
        out.m_42.x = _201;
        out.m_42.y = _183;
        out.m_42.z = _199;
        out.m_42.w = _147;
        return out;
    }
    float _203 = _183 * 0.715200006961822509765625;
    float _205 = 0.0 + _153;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_201, 0.2125999927520751953125, _203);
    bool _211 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _213 = fma(_199, 0.072200000286102294921875, _209);
    float _215 = 1.0 / _213;
    float _217 = _215 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_219, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _223 = _201 * _221;
    float _225 = _183 * _221;
    float _227 = _199 * _221;
    float _229 = _221;
    if (!_211)
    {
        _229 = _207;
    }
    float _231 = _229;
    bool _233 = !_211;
    float _235 = _231;
    if (!_233)
    {
        float _237 = in.m_44.w;
        float _239 = gl_FragCoord.w;
        float _241 = _237 * _239;
        float _243 = in.m_44.z;
        float _245 = gl_FragCoord.w;
        float _247 = _243 * _245;
        float _249 = _65 * _241;
        float _251 = _65 * _247;
        float _253 = 1.0 / _249;
        float _255 = _251 * _253;
        float _257 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _259 = fma(_255, (*spvDescriptorSet0.fp_c8)._m0[30].w, _257);
        float _261 = 1.0 / _259;
        float _263 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _267 = fma(_261, _263, _265);
        float _269 = _267 * 8.0;
        float _271 = precise::clamp(_269, 0.0, 1.0);
        float _273 = _207 * _271;
        _235 = _273;
    }
    float _275 = _235;
    float _277 = 0.0 + _275;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    out.m_42.x = _223;
    out.m_42.y = _225;
    out.m_42.z = _227;
    out.m_42.w = _279;
    return out;
}

