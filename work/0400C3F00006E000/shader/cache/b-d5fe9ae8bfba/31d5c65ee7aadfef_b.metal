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
    float2 _417 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_417, float2(0.0), isnan(_417))).xyzw;
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
    float _97 = fma(_87, 0.29890000820159912109375, _91);
    float _99 = _85 * (-1.44269502162933349609375);
    float _101 = exp2(_93);
    float _103 = fma(_89, 0.1143999993801116943359375, _97);
    float _105 = _103 * (-1.44269502162933349609375);
    float _107 = 1.0 / _103;
    float _109 = exp2(_105);
    float _111 = -_101;
    float _113 = _111 + 1.0;
    float _115 = exp2(_99);
    float _117 = exp2(_95);
    float _119 = -_109;
    float _121 = _119 + 1.0;
    float _123 = _121 * _107;
    float _125 = _121 * _121;
    float _127 = _87 * _123;
    float _129 = _85 * _123;
    float _131 = -_115;
    float _133 = _131 + 1.0;
    float _135 = _89 * _123;
    float _137 = -_127;
    float _139 = _113 + _137;
    float _141 = -_129;
    float _143 = _133 + _141;
    float _145 = -_117;
    float _147 = _145 + 1.0;
    float _149 = fma(_125, _139, _127);
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = fma(_125, _143, _129);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = -_135;
    float _159 = _147 + _157;
    float _161 = fma(_125, _159, _135);
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _167 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _571 = float3(_165, _167, _169);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_571, float3(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_571, float3(0.0), isnan(_571))).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    bool _183 = _121 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _185 = isnan(_121);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _191 = _187 || _189;
    float _193 = _127;
    float _195 = _155;
    float _197 = _117;
    float _199 = _123;
    float _201 = _105;
    float _203 = _169;
    if (_191)
    {
        _193 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _205 = _193;
    float _207 = _205;
    if (_191)
    {
        float _209 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _211 = _121 + _209;
        _195 = _211;
    }
    float _213 = _195;
    if (_191)
    {
        float _215 = -_205;
        float _217 = _215 + 1.00000095367431640625;
        _197 = _217;
    }
    float _219 = _197;
    float _221 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    if (_191)
    {
        float _223 = 1.0 / _219;
        _221 = _223;
    }
    float _225 = _221;
    float _227 = _225;
    if (_191)
    {
        float _229 = _213 * _225;
        _199 = _229;
    }
    float _231 = _199;
    float _233 = _231;
    if (_191)
    {
        float _235 = -_231;
        float _237 = _235 + 1.0;
        _201 = _237;
    }
    float _239 = _201;
    float _241 = _213;
    if (_191)
    {
        float _243 = abs(_239);
        float _245 = log2(_243);
        _241 = _245;
    }
    float _247 = _241;
    if (_191)
    {
        float _249 = -_205;
        float _251 = _249 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _203 = _251;
    }
    float _253 = _203;
    float _255 = _253;
    if (_191)
    {
        float _257 = _253 * _225;
        _227 = _257;
    }
    float _259 = _227;
    float _261 = _259;
    if (_191)
    {
        float _263 = _259 + (-1.0);
        _255 = _263;
    }
    float _265 = _255;
    float _267 = _265;
    if (_191)
    {
        float _269 = _259 * _231;
        _233 = _269;
    }
    float _271 = _233;
    if (!_191)
    {
        _261 = _121;
    }
    float _273 = _261;
    float _275 = _247;
    float _277 = _273;
    if (_191)
    {
        float _279 = _247 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _275 = _279;
    }
    float _281 = _275;
    float _283 = _281;
    if (_191)
    {
        float _285 = exp2(_281);
        _283 = _285;
    }
    float _287 = _283;
    if (_191)
    {
        float _289 = fma(_265, _287, 1.0);
        _267 = _289;
    }
    float _291 = _267;
    float _293 = _291;
    if (_191)
    {
        float _295 = 1.0 / _291;
        _293 = _295;
    }
    float _297 = _293;
    if (_191)
    {
        float _299 = _271 * _297;
        _207 = _299;
    }
    float _301 = _207;
    if (_191)
    {
        float _303 = fma(_219, _301, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _277 = _303;
    }
    float _305 = _277;
    float _307 = -_121;
    float _309 = _307 + _305;
    float _311 = _309 + 1.0;
    float _313 = abs(_311);
    float _315 = log2(_313);
    float _317 = abs(_177);
    float _319 = log2(_317);
    float _321 = abs(_175);
    float _323 = log2(_321);
    float _325 = abs(_179);
    float _327 = log2(_325);
    float _329 = _319 * 2.2000000476837158203125;
    float _331 = _323 * 2.2000000476837158203125;
    float _333 = exp2(_329);
    float _335 = _315 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _337 = _327 * 2.2000000476837158203125;
    float _339 = exp2(_331);
    float _341 = exp2(_337);
    float _343 = _333 * 0.586600005626678466796875;
    float _345 = fma(_339, 0.29890000820159912109375, _343);
    float _347 = exp2(_335);
    float _349 = fma(_341, 0.1143999993801116943359375, _345);
    float _351 = spvFAdd(_349, 9.9999999747524270787835121154785e-07);
    float _353 = 1.0 / _351;
    float _355 = fma(_333, _353, -1.0);
    float _357 = fma(_339, _353, -1.0);
    float _359 = fma(_341, _353, -1.0);
    float _361 = fma(_347, _355, 1.0);
    float _363 = fma(_347, _357, 1.0);
    float _365 = fma(_347, _359, 1.0);
    float _367 = _361 * _305;
    float _369 = _363 * _305;
    float _371 = _365 * _305;
    float _373 = precise::max(0.0, _367);
    float _375 = precise::max(0.0, _369);
    float _377 = precise::max(0.0, _371);
    float _379 = precise::min(_375, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _381 = precise::min(_373, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _383 = precise::min(_377, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _379;
    out.m_39.y = _381;
    out.m_39.z = _383;
    out.m_39.w = _75;
    return out;
}

