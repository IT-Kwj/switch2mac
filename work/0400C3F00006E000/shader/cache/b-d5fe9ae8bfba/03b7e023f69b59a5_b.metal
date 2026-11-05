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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_36.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_36.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _475 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_475, float2(0.0), isnan(_475))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _492 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _81 + _72;
    float _99 = _85 + _76;
    float _101 = _83 + _74;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    bool _111 = _103 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _113 = isnan(_103);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _119 = _115 || _117;
    bool _121 = _105 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _123 = isnan(_105);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _129 = _125 || _127;
    bool _131 = !_119;
    float _133 = _131 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _135 = !_119;
    float _137 = _135 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _139 = _107 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _141 = isnan(_107);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _147 = _143 || _145;
    bool _149 = !_129;
    float _151 = _149 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _153 = fma(_103, _133, _137);
    bool _155 = !_129;
    float _157 = _155 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _159 = !_147;
    float _161 = _159 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _163 = 1.0 / _153;
    bool _165 = !_147;
    float _167 = _165 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _169 = fma(_105, _151, _157);
    bool _171 = !_129;
    float _173 = _171 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _175 = fma(_107, _161, _167);
    bool _177 = !_119;
    float _179 = _177 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _181 = 1.0 / _169;
    bool _183 = !_119;
    float _185 = _183 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _187 = !_147;
    float _189 = _187 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _191 = !_147;
    float _193 = _191 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _195 = fma(_103, _179, _185);
    bool _197 = !_129;
    float _199 = _197 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _201 = 1.0 / _175;
    float _203 = fma(_107, _189, _193);
    float _205 = fma(_105, _199, _173);
    float _207 = _205 * _181;
    float _209 = _195 * _163;
    float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _213 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _215 = _203 * _201;
    float _217 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _741 = float3(_213, _217, _211);
    float3 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_741, float3(0.0), isnan(_741))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_741, float3(0.0), isnan(_741))).xyz;
    float _221 = _219.x;
    float _223 = _219.y;
    float _225 = _219.z;
    float _227 = _107 * 0.586600005626678466796875;
    float _229 = fma(_103, 0.29890000820159912109375, _227);
    float _231 = fma(_105, 0.1143999993801116943359375, _229);
    float _233 = _231 * (-1.44269502162933349609375);
    float _235 = exp2(_233);
    float _237 = -_235;
    float _239 = _237 + 1.0;
    bool _241 = _239 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _243 = isnan(_239);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _249 = _245 || _247;
    float _251 = _163;
    float _253 = _107;
    float _255 = _211;
    float _257 = _227;
    float _259 = _173;
    float _261 = _235;
    float _263 = _169;
    if (_249)
    {
        _251 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _265 = _251;
    if (_249)
    {
        float _267 = -_265;
        float _269 = _267 + 1.00000095367431640625;
        _253 = _269;
    }
    float _271 = _253;
    float _273 = _181;
    if (_249)
    {
        float _275 = 1.0 / _271;
        _273 = _275;
    }
    float _277 = _273;
    if (_249)
    {
        float _279 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _281 = _239 + _279;
        _255 = _281;
    }
    float _283 = _255;
    float _285 = _283;
    if (_249)
    {
        float _287 = _283 * _277;
        _257 = _287;
    }
    float _289 = _257;
    float _291 = _289;
    if (_249)
    {
        float _293 = -_265;
        float _295 = _293 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _285 = _295;
    }
    float _297 = _285;
    float _299 = _297;
    if (_249)
    {
        float _301 = -_289;
        float _303 = _301 + 1.0;
        _259 = _303;
    }
    float _305 = _259;
    if (_249)
    {
        float _307 = _297 * _277;
        _299 = _307;
    }
    float _309 = _299;
    float _311 = _309;
    if (_249)
    {
        float _313 = _309 + (-1.0);
        _261 = _313;
    }
    float _315 = _261;
    float _317 = _305;
    float _319 = _315;
    if (_249)
    {
        float _321 = abs(_305);
        float _323 = log2(_321);
        _317 = _323;
    }
    float _325 = _317;
    if (_249)
    {
        float _327 = _309 * _289;
        _291 = _327;
    }
    float _329 = _291;
    float _331 = _329;
    if (!_249)
    {
        _311 = _239;
    }
    float _333 = _311;
    float _335 = _333;
    if (_249)
    {
        float _337 = _325 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _263 = _337;
    }
    float _339 = _263;
    float _341 = _193;
    if (_249)
    {
        float _343 = exp2(_339);
        _341 = _343;
    }
    float _345 = _341;
    if (_249)
    {
        float _347 = fma(_315, _345, 1.0);
        _319 = _347;
    }
    float _349 = _319;
    float _351 = _349;
    if (_249)
    {
        float _353 = 1.0 / _349;
        _351 = _353;
    }
    float _355 = _351;
    if (_249)
    {
        float _357 = _329 * _355;
        _331 = _357;
    }
    float _359 = _331;
    if (_249)
    {
        float _361 = fma(_271, _359, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _335 = _361;
    }
    float _363 = _335;
    float _365 = -_239;
    float _367 = _365 + _363;
    float _369 = _367 + 1.0;
    float _371 = abs(_369);
    float _373 = log2(_371);
    float _375 = abs(_223);
    float _377 = log2(_375);
    float _379 = abs(_221);
    float _381 = log2(_379);
    float _383 = abs(_225);
    float _385 = log2(_383);
    float _387 = _377 * 0.4545454680919647216796875;
    float _389 = _373 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _391 = _381 * 0.4545454680919647216796875;
    float _393 = exp2(_387);
    float _395 = _385 * 0.4545454680919647216796875;
    float _397 = exp2(_391);
    float _399 = exp2(_395);
    float _401 = _393 * 0.586600005626678466796875;
    float _403 = fma(_397, 0.29890000820159912109375, _401);
    float _405 = exp2(_389);
    float _407 = fma(_399, 0.1143999993801116943359375, _403);
    float _409 = spvFAdd(_407, 9.9999999747524270787835121154785e-07);
    float _411 = 1.0 / _409;
    float _413 = fma(_397, _411, -1.0);
    float _415 = fma(_393, _411, -1.0);
    float _417 = fma(_399, _411, -1.0);
    float _419 = fma(_405, _413, 1.0);
    float _421 = fma(_405, _415, 1.0);
    float _423 = fma(_405, _417, 1.0);
    float _425 = _419 * _363;
    float _427 = _421 * _363;
    float _429 = _423 * _363;
    float _431 = precise::max(0.0, _425);
    float _433 = precise::max(0.0, _427);
    float _435 = precise::max(0.0, _429);
    float _437 = precise::min(_431, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _439 = precise::min(_433, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _441 = precise::min(_435, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _437;
    out.m_41.y = _439;
    out.m_41.z = _441;
    out.m_41.w = _87;
    return out;
}

