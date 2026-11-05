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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _59 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _61 = _57 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _63 = _59 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _65 = 1.0 / _43;
    float _67 = _65 * _49;
    float _69 = _65 * _55;
    float _71 = _67 + (-0.5);
    float _73 = fma(_69, -8.7422776573475857730954885482788e-08, 4.3711388286737928865477442741394e-08);
    float _75 = _69 + (-0.5);
    float _77 = -_71;
    float _79 = -_73;
    float _81 = _77 + _79;
    float _83 = -_75;
    float _85 = fma(_71, -8.7422776573475857730954885482788e-08, _83);
    float _87 = _61 * 1.5;
    float _89 = _63 * 1.5;
    float _91 = fma(_87, _81, 0.5);
    float _93 = fma(_89, _85, 0.5);
    float2 _397 = float2(_91, _93);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xw;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _101 * 0.699999988079071044921875;
    bool _107 = _103 > 0.0;
    bool _109 = isnan(_103);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    if (!_115)
    {
        discard_fragment();
    }
    if (!_115)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _117 = _63 * 2.0;
    float _119 = _61 * 2.0;
    float _121 = _81 + 0.5;
    float _123 = fma(_85, _117, 0.5);
    float _125 = fma(_85, 4.0, 0.5);
    float _127 = fma(_81, _119, 0.5);
    float _129 = floor(_121);
    float _131 = floor(_123);
    float _133 = floor(_125);
    float _135 = -_129;
    float _137 = _121 + _135;
    float _139 = floor(_127);
    float _141 = -_131;
    float _143 = _123 + _141;
    float _145 = -_133;
    float _147 = _125 + _145;
    float2 _478 = float2(_137, _147);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).y;
    float _151 = -_139;
    float _153 = _127 + _151;
    float2 _491 = float2(_153, _143);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).z;
    float _157 = in.m_34.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_34.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_34.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_36.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _185 = _183 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _187 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _189 = _187 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _193 = _191 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _195 = fma(_99, _185, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _197 = fma(_99, _189, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _199 = fma(_99, _193, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _201 = in.m_34.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _65 * _161;
    float _209 = _65 * _167;
    float _211 = _65 * _173;
    float _213 = _65 * _179;
    float _215 = _195 * _207;
    float _217 = _197 * _209;
    float _219 = _199 * _211;
    float _221 = -_213;
    float _223 = _221 + 1.0;
    float _225 = (*spvDescriptorSet0.fp_c3)._m0[18].y + 1.0;
    float _227 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 0.0199999995529651641845703125;
    float _229 = _225 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _231 = _213 * _227;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _223 * _227;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = -(*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _241 = _229 + _239;
    float _243 = _65 * _205;
    float _245 = _149 + _155;
    float _247 = fma(_233, -2.0, 3.0);
    float _249 = _233 * _233;
    float _251 = precise::max(_245, _241);
    float _253 = _247 * _249;
    float _255 = precise::min(_229, _251);
    float _257 = -_241;
    float _259 = _257 + _255;
    float _261 = fma(_237, -2.0, 3.0);
    float _263 = _237 * _237;
    float _265 = _259 * _181;
    float _267 = _261 * _263;
    float _269 = _101 * _265;
    float _271 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _273 = _271 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _275 = _267 * _253;
    float _277 = fma(_269, _273, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _279 = abs(_275);
    float _281 = log2(_279);
    float _283 = _277 * _243;
    float _285 = -_283;
    float _287 = _285 + 1.0;
    float _289 = fma(_103, _287, _283);
    float _291 = 1.0 / _289;
    float _293 = _281 * 2.2000000476837158203125;
    float _295 = exp2(_293);
    float _297 = _291 * _283;
    float _299 = _215 * _297;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _217 * _297;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _219 * _297;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = _289 * _295;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    out.m_32.x = _301;
    out.m_32.y = _305;
    out.m_32.z = _309;
    out.m_32.w = _313;
    return out;
}

