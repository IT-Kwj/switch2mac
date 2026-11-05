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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_50 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_39.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_41.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _57;
    float _91 = _89 * _63;
    float _93 = _89 * _69;
    float _95 = _89 * _75;
    float _97 = _89 * _81;
    float _99 = 1.0 / _91;
    float _101 = _89 * _87;
    float _103 = _93 * _99;
    float _105 = _95 * _99;
    float2 _364 = float2(_103, _105);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float2 _375 = float2(_97, _101);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_375, float2(0.0), isnan(_375))).w;
    float _111 = in.m_39.z;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_43.w;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_45.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _131 = _89 * _115;
    float _133 = _131 * _99;
    float _135 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _137 = fma(_133, (*spvDescriptorSet0.fp_c8)._m0[30].w, _135);
    float _139 = 1.0 / _137;
    float _141 = _89 * _121;
    float _143 = _89 * _127;
    float _145 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _147 = _139 * _145;
    float _149 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _151 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _149);
    float _153 = _109 * _141;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = 1.0 / _151;
    float _161 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _163 = -_147;
    float _165 = fma(_159, _161, _163);
    float _167 = _165 * _129;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _157 * _169;
    float _173 = _171 * _143;
    bool _177 = _173 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _179 = isnan(_173);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _185 = _181 || _183;
    float _187 = _109 * _109;
    float _189 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.25, 0.125);
    if (!_185)
    {
        discard_fragment();
    }
    float2 _504 = float2(_187, _189);
    float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_504, float2(0.0), isnan(_504))).xyz;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c9)._m0[106].x, _187);
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c9)._m0[106].x, _187);
    float _205 = fma(_199, (*spvDescriptorSet0.fp_c9)._m0[106].x, _187);
    if (!_185)
    {
        out.m_48.x = _201;
        out.m_48.y = _203;
        out.m_48.z = _205;
        out.m_48.w = _153;
        return out;
    }
    float _207 = _203 * 0.715200006961822509765625;
    float _209 = in.m_50.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_50.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_50.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = fma(_201, 0.2125999927520751953125, _207);
    float _229 = in.m_50.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = fma(_205, 0.072200000286102294921875, _227);
    bool _237 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _239 = 1.0 / _235;
    float _241 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_237)
    {
        float _243 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _245 = _147 + _243;
        _241 = _245;
    }
    float _247 = _241;
    float _249 = _239 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = fma(_251, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _255 = _89 * _213;
    float _257 = _89 * _225;
    float _259 = _253 * _255;
    float _261 = 0.0 + _173;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = _255;
    float _267 = _263;
    if (_237)
    {
        float _269 = _247 * 8.0;
        float _271 = precise::clamp(_269, 0.0, 1.0);
        _265 = _271;
    }
    float _273 = _265;
    float _275 = _89 * _219;
    float _277 = _89 * _233;
    float _279 = fma(_203, _259, _257);
    if (_237)
    {
        float _281 = _263 * _273;
        _267 = _281;
    }
    float _283 = _267;
    float _285 = fma(_201, _259, _275);
    float _287 = fma(_205, _259, _277);
    float _289 = 0.0 + _283;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    out.m_48.x = _285;
    out.m_48.y = _279;
    out.m_48.z = _287;
    out.m_48.w = _291;
    return out;
}

