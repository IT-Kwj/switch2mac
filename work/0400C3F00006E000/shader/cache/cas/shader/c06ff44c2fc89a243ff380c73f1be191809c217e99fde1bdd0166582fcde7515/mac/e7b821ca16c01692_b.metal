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
    float2 _451 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_451, float2(0.0), isnan(_451))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _468 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).xyzw;
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
    bool _183 = !_147;
    float _185 = _183 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _187 = !_119;
    float _189 = _187 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _191 = !_129;
    float _193 = _191 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _195 = !_147;
    float _197 = _195 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _199 = 1.0 / _175;
    float _201 = fma(_103, _179, _189);
    float _203 = fma(_105, _193, _173);
    float _205 = fma(_107, _185, _197);
    float _207 = _203 * _181;
    float _209 = _201 * _163;
    float _211 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _213 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _215 = _205 * _199;
    float _217 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _717 = float3(_213, _217, _211);
    float3 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_717, float3(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_717, float3(0.0), isnan(_717))).xyz;
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
    float _253 = _227;
    float _255 = _107;
    float _257 = _235;
    float _259 = _205;
    float _261 = _169;
    if (_249)
    {
        _251 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _263 = _251;
    if (_249)
    {
        float _265 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _267 = _239 + _265;
        _253 = _267;
    }
    float _269 = _253;
    float _271 = _269;
    if (_249)
    {
        float _273 = -_263;
        float _275 = _273 + 1.00000095367431640625;
        _255 = _275;
    }
    float _277 = _255;
    if (_249)
    {
        float _279 = -_263;
        float _281 = _279 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _257 = _281;
    }
    float _283 = _257;
    float _285 = _173;
    float _287 = _283;
    if (_249)
    {
        float _289 = 1.0 / _277;
        _285 = _289;
    }
    float _291 = _285;
    float _293 = _291;
    if (_249)
    {
        float _295 = _269 * _291;
        _271 = _295;
    }
    float _297 = _271;
    float _299 = _297;
    if (_249)
    {
        float _301 = _283 * _291;
        _287 = _301;
    }
    float _303 = _287;
    float _305 = _303;
    if (_249)
    {
        float _307 = -_297;
        float _309 = _307 + 1.0;
        _259 = _309;
    }
    float _311 = _259;
    if (_249)
    {
        float _313 = _303 + (-1.0);
        _293 = _313;
    }
    float _315 = _293;
    float _317 = _315;
    if (_249)
    {
        float _319 = _303 * _297;
        _299 = _319;
    }
    float _321 = _299;
    float _323 = _321;
    if (!_249)
    {
        _305 = _239;
    }
    float _325 = _305;
    float _327 = _311;
    float _329 = _325;
    if (_249)
    {
        float _331 = abs(_311);
        float _333 = log2(_331);
        _327 = _333;
    }
    float _335 = _327;
    if (_249)
    {
        float _337 = _335 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _261 = _337;
    }
    float _339 = _261;
    float _341 = _197;
    if (_249)
    {
        float _343 = exp2(_339);
        _341 = _343;
    }
    float _345 = _341;
    if (_249)
    {
        float _347 = fma(_315, _345, 1.0);
        _317 = _347;
    }
    float _349 = _317;
    float _351 = _349;
    if (_249)
    {
        float _353 = 1.0 / _349;
        _351 = _353;
    }
    float _355 = _351;
    if (_249)
    {
        float _357 = _321 * _355;
        _323 = _357;
    }
    float _359 = _323;
    if (_249)
    {
        float _361 = fma(_277, _359, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _329 = _361;
    }
    float _363 = _329;
    float _365 = -_239;
    float _367 = _365 + _363;
    float _369 = _367 + 1.0;
    float _371 = abs(_369);
    float _373 = log2(_371);
    float _375 = _373 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _377 = exp2(_375);
    float _379 = _223 * 0.586600005626678466796875;
    float _381 = fma(_221, 0.29890000820159912109375, _379);
    float _383 = fma(_225, 0.1143999993801116943359375, _381);
    float _385 = spvFAdd(_383, 9.9999999747524270787835121154785e-07);
    float _387 = 1.0 / _385;
    float _389 = fma(_221, _387, -1.0);
    float _391 = fma(_223, _387, -1.0);
    float _393 = fma(_225, _387, -1.0);
    float _395 = fma(_377, _389, 1.0);
    float _397 = fma(_377, _391, 1.0);
    float _399 = fma(_377, _393, 1.0);
    float _401 = _395 * _363;
    float _403 = _397 * _363;
    float _405 = _399 * _363;
    float _407 = precise::max(0.0, _401);
    float _409 = precise::max(0.0, _403);
    float _411 = precise::max(0.0, _405);
    float _413 = precise::min(_407, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _415 = precise::min(_409, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _417 = precise::min(_411, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _413;
    out.m_41.y = _415;
    out.m_41.z = _417;
    out.m_41.w = _87;
    return out;
}

