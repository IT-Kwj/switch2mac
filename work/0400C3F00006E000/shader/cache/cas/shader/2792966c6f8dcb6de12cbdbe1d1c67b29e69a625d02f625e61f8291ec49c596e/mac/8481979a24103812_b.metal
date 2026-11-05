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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_52 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_39.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_39.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_41.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _59;
    float _93 = _91 * _65;
    float _95 = _91 * _71;
    float _97 = _91 * _77;
    float _99 = _91 * _83;
    float _101 = 1.0 / _93;
    float _103 = _91 * _89;
    float _105 = _95 * _101;
    float _107 = _97 * _101;
    float2 _382 = float2(_105, _107);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_382, float2(0.0), isnan(_382))).x;
    float2 _393 = float2(_99, _103);
    float2 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xw;
    float _115 = _113.x;
    float _117 = _113.y;
    float _119 = in.m_39.z;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_45.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_47.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _145 = _91 * _123;
    float _147 = _145 * _101;
    float _149 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c8)._m0[30].w, _149);
    float _153 = _91 * _129;
    float _155 = 1.0 / _151;
    float _157 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _159 = _155 * _157;
    float _161 = _91 * _141;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = 1.0 / _165;
    float _169 = _117 * _153;
    float _171 = _91 * _135;
    float _173 = _169 * _171;
    float _175 = 0.0 + _173;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _181 = -_159;
    float _183 = fma(_167, _179, _181);
    float _185 = _183 * _143;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _177 * _187;
    float _191 = _189 * _161;
    bool _195 = _191 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _197 = isnan(_191);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _203 = _199 || _201;
    float _205 = _115 * _115;
    float _207 = _205 * 0.5;
    float _209 = _191;
    if (!_203)
    {
        discard_fragment();
    }
    float _211 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.0416666679084300994873046875, 0.0199999995529651641845703125);
    float2 _544 = float2(_207, _211);
    float3 _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_544, float2(0.0), isnan(_544))).xyz;
    float _217 = _215.x;
    float _219 = _215.y;
    float _221 = _215.z;
    float _223 = _217 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _225 = _219 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _227 = _221 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    if (!_203)
    {
        out.m_50.x = _223;
        out.m_50.y = _225;
        out.m_50.z = _227;
        out.m_50.w = _173;
        return out;
    }
    float _229 = _225 * 0.715200006961822509765625;
    float _231 = in.m_52.w;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_52.x;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_52.y;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = fma(_223, 0.2125999927520751953125, _229);
    float _251 = in.m_52.z;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = fma(_227, 0.072200000286102294921875, _249);
    bool _259 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _261 = 1.0 / _257;
    float _263 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_259)
    {
        float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _267 = _159 + _265;
        _263 = _267;
    }
    float _269 = _263;
    float _271 = _261 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_273, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _277 = _91 * _235;
    float _279 = _91 * _247;
    float _281 = _275 * _277;
    float _283 = 0.0 + _191;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _285;
    if (_259)
    {
        float _289 = _269 * 8.0;
        float _291 = precise::clamp(_289, 0.0, 1.0);
        _209 = _291;
    }
    float _293 = _209;
    float _295 = _91 * _241;
    float _297 = _91 * _255;
    float _299 = fma(_225, _281, _279);
    if (_259)
    {
        float _301 = _285 * _293;
        _287 = _301;
    }
    float _303 = _287;
    float _305 = fma(_223, _281, _295);
    float _307 = fma(_227, _281, _297);
    float _309 = 0.0 + _303;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    out.m_50.x = _305;
    out.m_50.y = _299;
    out.m_50.z = _307;
    out.m_50.w = _311;
    return out;
}

