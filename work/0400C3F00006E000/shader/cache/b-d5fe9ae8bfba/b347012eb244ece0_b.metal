#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    texture3d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_34.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_34.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _393 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = in.m_36.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _60 * _81;
    float _85 = _71 * _83;
    float _87 = _69 * _83;
    float _89 = _73 * _83;
    float _91 = _85 * 0.586600005626678466796875;
    float _93 = _87 * (-1.44269502162933349609375);
    float _95 = _89 * (-1.44269502162933349609375);
    float _97 = _85 * (-1.44269502162933349609375);
    float _99 = fma(_87, 0.29890000820159912109375, _91);
    float _101 = exp2(_93);
    float _103 = fma(_89, 0.1143999993801116943359375, _99);
    float _105 = _103 * (-1.44269502162933349609375);
    float _107 = 1.0 / _103;
    float _109 = exp2(_105);
    float _111 = -_101;
    float _113 = _111 + 1.0;
    float _115 = exp2(_95);
    float _117 = exp2(_97);
    float _119 = -_109;
    float _121 = _119 + 1.0;
    float _123 = _121 * _107;
    float _125 = _85 * _123;
    float _127 = _87 * _123;
    float _129 = _89 * _123;
    float _131 = -_115;
    float _133 = _131 + 1.0;
    float _135 = _121 * _121;
    float _137 = -_127;
    float _139 = _113 + _137;
    float _141 = -_117;
    float _143 = _141 + 1.0;
    float _145 = -_129;
    float _147 = _133 + _145;
    float _149 = fma(_135, _139, _127);
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = -_125;
    float _155 = _143 + _153;
    float _157 = fma(_135, _147, _129);
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = fma(_135, _155, _125);
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _167 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _547 = float3(_167, _169, _165);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_547, float3(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_547, float3(0.0), isnan(_547))).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    bool _183 = _121 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _185 = isnan(_121);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _191 = _187 || _189;
    float _193 = _125;
    float _195 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _197 = _151;
    float _199 = _163;
    float _201 = _115;
    float _203 = _165;
    float _205 = _127;
    if (_191)
    {
        _193 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _207 = _193;
    float _209 = _207;
    if (_191)
    {
        float _211 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _213 = _121 + _211;
        _195 = _213;
    }
    float _215 = _195;
    float _217 = _215;
    if (_191)
    {
        float _219 = -_207;
        float _221 = _219 + 1.00000095367431640625;
        _197 = _221;
    }
    float _223 = _197;
    float _225 = 0.0;
    if (_191)
    {
        float _227 = 1.0 / _223;
        _225 = _227;
    }
    float _229 = _225;
    if (_191)
    {
        float _231 = _215 * _229;
        _199 = _231;
    }
    float _233 = _199;
    float _235 = _233;
    if (_191)
    {
        float _237 = -_233;
        float _239 = _237 + 1.0;
        _201 = _239;
    }
    float _241 = _201;
    float _243 = _241;
    if (_191)
    {
        float _245 = abs(_241);
        float _247 = log2(_245);
        _243 = _247;
    }
    float _249 = _243;
    if (_191)
    {
        float _251 = -_207;
        float _253 = _251 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _203 = _253;
    }
    float _255 = _203;
    float _257 = _255;
    if (_191)
    {
        float _259 = _255 * _229;
        _217 = _259;
    }
    float _261 = _217;
    float _263 = _261;
    if (_191)
    {
        float _265 = _261 + (-1.0);
        _257 = _265;
    }
    float _267 = _257;
    float _269 = _267;
    if (_191)
    {
        float _271 = _261 * _233;
        _235 = _271;
    }
    float _273 = _235;
    if (!_191)
    {
        _263 = _121;
    }
    float _275 = _263;
    float _277 = _275;
    if (_191)
    {
        float _279 = _249 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _205 = _279;
    }
    float _281 = _205;
    float _283 = _123;
    if (_191)
    {
        float _285 = exp2(_281);
        _283 = _285;
    }
    float _287 = _283;
    if (_191)
    {
        float _289 = fma(_267, _287, 1.0);
        _269 = _289;
    }
    float _291 = _269;
    float _293 = _291;
    if (_191)
    {
        float _295 = 1.0 / _291;
        _293 = _295;
    }
    float _297 = _293;
    if (_191)
    {
        float _299 = _273 * _297;
        _209 = _299;
    }
    float _301 = _209;
    if (_191)
    {
        float _303 = fma(_223, _301, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _277 = _303;
    }
    float _305 = _277;
    float _307 = -_121;
    float _309 = _307 + _305;
    float _311 = _309 + 1.0;
    float _313 = abs(_311);
    float _315 = log2(_313);
    float _317 = _177 * 0.586600005626678466796875;
    float _319 = fma(_175, 0.29890000820159912109375, _317);
    float _321 = fma(_179, 0.1143999993801116943359375, _319);
    float _323 = spvFAdd(_321, 9.9999999747524270787835121154785e-07);
    float _325 = _315 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _327 = 1.0 / _323;
    float _329 = exp2(_325);
    float _331 = fma(_175, _327, -1.0);
    float _333 = fma(_177, _327, -1.0);
    float _335 = fma(_179, _327, -1.0);
    float _337 = fma(_329, _331, 1.0);
    float _339 = fma(_329, _333, 1.0);
    float _341 = fma(_329, _335, 1.0);
    float _343 = _337 * _305;
    float _345 = _339 * _305;
    float _347 = _341 * _305;
    float _349 = precise::max(0.0, _343);
    float _351 = precise::max(0.0, _345);
    float _353 = precise::max(0.0, _347);
    float _355 = precise::min(_349, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _357 = precise::min(_351, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _359 = precise::min(_353, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _355;
    out.m_39.y = _357;
    out.m_39.z = _359;
    out.m_39.w = _75;
    return out;
}

