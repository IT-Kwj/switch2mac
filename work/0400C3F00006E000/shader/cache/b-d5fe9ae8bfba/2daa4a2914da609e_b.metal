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
    float2 _459 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = in.m_36.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _60 * _81;
    float _85 = _69 * _83;
    float _87 = _73 * _83;
    float _89 = _71 * _83;
    bool _93 = _85 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _95 = isnan(_85);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _101 = _97 || _99;
    bool _103 = _87 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _105 = isnan(_87);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _111 = _107 || _109;
    bool _113 = !_101;
    float _115 = _113 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _117 = !_101;
    float _119 = _117 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _121 = _89 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _123 = isnan(_89);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _129 = _125 || _127;
    bool _131 = !_111;
    float _133 = _131 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _135 = fma(_85, _115, _119);
    bool _137 = !_111;
    float _139 = _137 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _141 = !_129;
    float _143 = _141 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _145 = 1.0 / _135;
    bool _147 = !_129;
    float _149 = _147 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _151 = fma(_87, _133, _139);
    float _153 = fma(_89, _143, _149);
    float _155 = 1.0 / _151;
    bool _157 = !_101;
    float _159 = _157 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _161 = !_101;
    float _163 = _161 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _165 = !_129;
    float _167 = _165 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _169 = !_111;
    float _171 = _169 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _173 = 1.0 / _153;
    bool _175 = !_111;
    float _177 = _175 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _179 = fma(_85, _159, _163);
    bool _181 = !_129;
    float _183 = _181 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _185 = fma(_87, _177, _171);
    float _187 = _179 * _145;
    float _189 = fma(_89, _167, _183);
    float _191 = _185 * _155;
    float _193 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _195 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _197 = _189 * _173;
    float _199 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _702 = float3(_193, _199, _195);
    float3 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_702, float3(0.0), isnan(_702))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_702, float3(0.0), isnan(_702))).xyz;
    float _205 = _203.x;
    float _207 = _203.y;
    float _209 = _203.z;
    float _211 = _89 * 0.586600005626678466796875;
    float _213 = fma(_85, 0.29890000820159912109375, _211);
    float _215 = fma(_87, 0.1143999993801116943359375, _213);
    float _217 = _215 * (-1.44269502162933349609375);
    float _219 = exp2(_217);
    float _221 = -_219;
    float _223 = _221 + 1.0;
    bool _225 = _223 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _227 = isnan(_223);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _233 = _229 || _231;
    float _235 = _155;
    float _237 = _85;
    float _239 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _241 = _219;
    float _243 = _199;
    float _245 = _195;
    if (_233)
    {
        _235 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _247 = _235;
    if (_233)
    {
        float _249 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _251 = _223 + _249;
        _237 = _251;
    }
    float _253 = _237;
    if (_233)
    {
        float _255 = -_247;
        float _257 = _255 + 1.00000095367431640625;
        _239 = _257;
    }
    float _259 = _239;
    if (_233)
    {
        float _261 = -_247;
        float _263 = _261 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _241 = _263;
    }
    float _265 = _241;
    float _267 = _87;
    float _269 = _265;
    if (_233)
    {
        float _271 = 1.0 / _259;
        _267 = _271;
    }
    float _273 = _267;
    float _275 = _273;
    if (_233)
    {
        float _277 = _253 * _273;
        _243 = _277;
    }
    float _279 = _243;
    float _281 = _279;
    if (_233)
    {
        float _283 = _265 * _273;
        _275 = _283;
    }
    float _285 = _275;
    float _287 = _285;
    if (_233)
    {
        float _289 = -_279;
        float _291 = _289 + 1.0;
        _245 = _291;
    }
    float _293 = _245;
    if (_233)
    {
        float _295 = _285 + (-1.0);
        _269 = _295;
    }
    float _297 = _269;
    float _299 = _297;
    if (_233)
    {
        float _301 = _285 * _279;
        _281 = _301;
    }
    float _303 = _281;
    float _305 = _303;
    if (!_233)
    {
        _287 = _223;
    }
    float _307 = _287;
    float _309 = _253;
    float _311 = _307;
    if (_233)
    {
        float _313 = abs(_293);
        float _315 = log2(_313);
        _309 = _315;
    }
    float _317 = _309;
    float _319 = _317;
    if (_233)
    {
        float _321 = _317 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _319 = _321;
    }
    float _323 = _319;
    float _325 = _323;
    if (_233)
    {
        float _327 = exp2(_323);
        _325 = _327;
    }
    float _329 = _325;
    if (_233)
    {
        float _331 = fma(_297, _329, 1.0);
        _299 = _331;
    }
    float _333 = _299;
    float _335 = _247;
    if (_233)
    {
        float _337 = 1.0 / _333;
        _335 = _337;
    }
    float _339 = _335;
    if (_233)
    {
        float _341 = _303 * _339;
        _305 = _341;
    }
    float _343 = _305;
    if (_233)
    {
        float _345 = fma(_259, _343, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _311 = _345;
    }
    float _347 = _311;
    float _349 = -_223;
    float _351 = _349 + _347;
    float _353 = _351 + 1.0;
    float _355 = abs(_353);
    float _357 = log2(_355);
    float _359 = abs(_207);
    float _361 = log2(_359);
    float _363 = abs(_205);
    float _365 = log2(_363);
    float _367 = abs(_209);
    float _369 = log2(_367);
    float _371 = _361 * 2.2000000476837158203125;
    float _373 = _365 * 2.2000000476837158203125;
    float _375 = exp2(_371);
    float _377 = _369 * 2.2000000476837158203125;
    float _379 = exp2(_373);
    float _381 = exp2(_377);
    float _383 = _375 * 0.586600005626678466796875;
    float _385 = fma(_379, 0.29890000820159912109375, _383);
    float _387 = fma(_381, 0.1143999993801116943359375, _385);
    float _389 = spvFAdd(_387, 9.9999999747524270787835121154785e-07);
    float _391 = _357 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _393 = 1.0 / _389;
    float _395 = exp2(_391);
    float _397 = fma(_379, _393, -1.0);
    float _399 = fma(_375, _393, -1.0);
    float _401 = fma(_381, _393, -1.0);
    float _403 = fma(_395, _397, 1.0);
    float _405 = fma(_395, _399, 1.0);
    float _407 = fma(_395, _401, 1.0);
    float _409 = _403 * _347;
    float _411 = _405 * _347;
    float _413 = _407 * _347;
    float _415 = precise::max(0.0, _409);
    float _417 = precise::max(0.0, _411);
    float _419 = precise::max(0.0, _413);
    float _421 = precise::min(_415, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _423 = precise::min(_417, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _425 = precise::min(_419, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _421;
    out.m_39.y = _423;
    out.m_39.z = _425;
    out.m_39.w = _75;
    return out;
}

