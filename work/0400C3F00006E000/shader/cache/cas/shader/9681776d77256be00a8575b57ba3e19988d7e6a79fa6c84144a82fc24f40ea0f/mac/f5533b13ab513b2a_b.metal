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
    float2 _435 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).xyzw;
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
    float _147 = fma(_87, _133, _139);
    bool _149 = !_129;
    float _151 = _149 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _153 = fma(_89, _143, _151);
    float _155 = 1.0 / _147;
    bool _157 = !_111;
    float _159 = _157 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _161 = !_101;
    float _163 = _161 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _165 = !_101;
    float _167 = _165 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _169 = !_129;
    float _171 = _169 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _173 = 1.0 / _153;
    bool _175 = !_129;
    float _177 = _175 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _179 = fma(_85, _167, _163);
    bool _181 = !_111;
    float _183 = _181 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _185 = fma(_89, _171, _177);
    float _187 = _179 * _145;
    float _189 = fma(_87, _183, _159);
    float _191 = _189 * _155;
    float _193 = _185 * _173;
    float _195 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _197 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _199 = fma(_193, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _678 = float3(_195, _199, _197);
    float3 _203 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_678, float3(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_678, float3(0.0), isnan(_678))).xyz;
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
    float _235 = _87;
    float _237 = _85;
    float _239 = _89;
    float _241 = _197;
    float _243 = _155;
    float _245 = _145;
    if (_233)
    {
        _235 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _247 = _235;
    float _249 = _247;
    if (_233)
    {
        float _251 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _253 = _223 + _251;
        _237 = _253;
    }
    float _255 = _237;
    float _257 = _255;
    if (_233)
    {
        float _259 = -_247;
        float _261 = _259 + 1.00000095367431640625;
        _239 = _261;
    }
    float _263 = _239;
    float _265 = _159;
    if (_233)
    {
        float _267 = 1.0 / _263;
        _265 = _267;
    }
    float _269 = _265;
    if (_233)
    {
        float _271 = _255 * _269;
        _241 = _271;
    }
    float _273 = _241;
    float _275 = _273;
    if (_233)
    {
        float _277 = -_247;
        float _279 = _277 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _257 = _279;
    }
    float _281 = _257;
    float _283 = _281;
    if (_233)
    {
        float _285 = -_273;
        float _287 = _285 + 1.0;
        _243 = _287;
    }
    float _289 = _243;
    if (_233)
    {
        float _291 = _281 * _269;
        _249 = _291;
    }
    float _293 = _249;
    float _295 = _293;
    if (_233)
    {
        float _297 = _293 + (-1.0);
        _283 = _297;
    }
    float _299 = _283;
    float _301 = _289;
    float _303 = _299;
    if (_233)
    {
        float _305 = abs(_289);
        float _307 = log2(_305);
        _301 = _307;
    }
    float _309 = _301;
    if (_233)
    {
        float _311 = _293 * _273;
        _275 = _311;
    }
    float _313 = _275;
    float _315 = _313;
    if (!_233)
    {
        _295 = _223;
    }
    float _317 = _295;
    float _319 = _317;
    if (_233)
    {
        float _321 = _309 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _245 = _321;
    }
    float _323 = _245;
    float _325 = _219;
    if (_233)
    {
        float _327 = exp2(_323);
        _325 = _327;
    }
    float _329 = _325;
    if (_233)
    {
        float _331 = fma(_299, _329, 1.0);
        _303 = _331;
    }
    float _333 = _303;
    float _335 = _333;
    if (_233)
    {
        float _337 = 1.0 / _333;
        _335 = _337;
    }
    float _339 = _335;
    if (_233)
    {
        float _341 = _313 * _339;
        _315 = _341;
    }
    float _343 = _315;
    if (_233)
    {
        float _345 = fma(_263, _343, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _319 = _345;
    }
    float _347 = _319;
    float _349 = -_223;
    float _351 = _349 + _347;
    float _353 = _351 + 1.0;
    float _355 = abs(_353);
    float _357 = log2(_355);
    float _359 = _207 * 0.586600005626678466796875;
    float _361 = fma(_205, 0.29890000820159912109375, _359);
    float _363 = _357 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _365 = fma(_209, 0.1143999993801116943359375, _361);
    float _367 = exp2(_363);
    float _369 = spvFAdd(_365, 9.9999999747524270787835121154785e-07);
    float _371 = 1.0 / _369;
    float _373 = fma(_205, _371, -1.0);
    float _375 = fma(_207, _371, -1.0);
    float _377 = fma(_209, _371, -1.0);
    float _379 = fma(_367, _373, 1.0);
    float _381 = fma(_367, _375, 1.0);
    float _383 = fma(_367, _377, 1.0);
    float _385 = _379 * _347;
    float _387 = _381 * _347;
    float _389 = _383 * _347;
    float _391 = precise::max(0.0, _385);
    float _393 = precise::max(0.0, _387);
    float _395 = precise::max(0.0, _389);
    float _397 = precise::min(_391, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _399 = precise::min(_393, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _401 = precise::min(_395, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _397;
    out.m_39.y = _399;
    out.m_39.z = _401;
    out.m_39.w = _75;
    return out;
}

