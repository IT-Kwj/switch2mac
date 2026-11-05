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
    float2 _391 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_391, float2(0.0), isnan(_391))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _408 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _85 + _76;
    float _99 = _81 + _72;
    float _101 = _83 + _74;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = fma(_103, 2.4300000667572021484375, 0.589999973773956298828125);
    float _111 = fma(_105, 2.4300000667572021484375, 0.589999973773956298828125);
    float _113 = fma(_107, 2.4300000667572021484375, 0.589999973773956298828125);
    float _115 = fma(_103, _109, 0.14000000059604644775390625);
    float _117 = fma(_105, _111, 0.14000000059604644775390625);
    float _119 = fma(_107, _113, 0.14000000059604644775390625);
    float _121 = fma(_103, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _123 = 1.0 / _117;
    float _125 = fma(_105, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _127 = fma(_107, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _129 = _103 * _121;
    float _131 = _105 * _125;
    float _133 = _107 * _127;
    float _135 = 1.0 / _115;
    float _137 = 1.0 / _119;
    float _139 = _131 * _123;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = _129 * _135;
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _149 = _133 * _137;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _530 = float3(_153, _155, _147);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_530, float3(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_530, float3(0.0), isnan(_530))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _107 * 0.586600005626678466796875;
    float _167 = fma(_105, 0.29890000820159912109375, _165);
    float _169 = fma(_103, 0.1143999993801116943359375, _167);
    float _171 = _169 * (-1.44269502162933349609375);
    float _173 = exp2(_171);
    float _175 = -_173;
    float _177 = _175 + 1.0;
    bool _181 = _177 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _183 = isnan(_177);
    bool _185 = _181 || _183;
    bool _187 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _189 = _185 || _187;
    float _191 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _193 = _105;
    float _195 = _103;
    float _197 = _117;
    float _199 = _145;
    float _201 = _173;
    float _203 = _123;
    if (_189)
    {
        _191 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _205 = _191;
    if (_189)
    {
        float _207 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _209 = _177 + _207;
        _193 = _209;
    }
    float _211 = _193;
    float _213 = _211;
    if (_189)
    {
        float _215 = -_205;
        float _217 = _215 + 1.00000095367431640625;
        _195 = _217;
    }
    float _219 = _195;
    float _221 = _137;
    if (_189)
    {
        float _223 = 1.0 / _219;
        _221 = _223;
    }
    float _225 = _221;
    if (_189)
    {
        float _227 = _211 * _225;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229;
    if (_189)
    {
        float _233 = -_205;
        float _235 = _233 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _213 = _235;
    }
    float _237 = _213;
    float _239 = _237;
    if (_189)
    {
        float _241 = -_229;
        float _243 = _241 + 1.0;
        _199 = _243;
    }
    float _245 = _199;
    if (_189)
    {
        float _247 = _237 * _225;
        _239 = _247;
    }
    float _249 = _239;
    float _251 = _249;
    if (_189)
    {
        float _253 = _249 + (-1.0);
        _201 = _253;
    }
    float _255 = _201;
    float _257 = _245;
    float _259 = _255;
    if (_189)
    {
        float _261 = abs(_245);
        float _263 = log2(_261);
        _257 = _263;
    }
    float _265 = _257;
    if (_189)
    {
        float _267 = _249 * _229;
        _231 = _267;
    }
    float _269 = _231;
    float _271 = _269;
    if (!_189)
    {
        _251 = _177;
    }
    float _273 = _251;
    float _275 = _273;
    if (_189)
    {
        float _277 = _265 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _203 = _277;
    }
    float _279 = _203;
    float _281 = _279;
    if (_189)
    {
        float _283 = exp2(_279);
        _281 = _283;
    }
    float _285 = _281;
    if (_189)
    {
        float _287 = fma(_255, _285, 1.0);
        _259 = _287;
    }
    float _289 = _259;
    float _291 = _205;
    if (_189)
    {
        float _293 = 1.0 / _289;
        _291 = _293;
    }
    float _295 = _291;
    if (_189)
    {
        float _297 = _269 * _295;
        _271 = _297;
    }
    float _299 = _271;
    if (_189)
    {
        float _301 = fma(_219, _299, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _275 = _301;
    }
    float _303 = _275;
    float _305 = -_177;
    float _307 = _305 + _303;
    float _309 = _307 + 1.0;
    float _311 = abs(_309);
    float _313 = log2(_311);
    float _315 = _313 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _317 = exp2(_315);
    float _319 = _161 * 0.586600005626678466796875;
    float _321 = fma(_159, 0.29890000820159912109375, _319);
    float _323 = fma(_163, 0.1143999993801116943359375, _321);
    float _325 = spvFAdd(_323, 9.9999999747524270787835121154785e-07);
    float _327 = 1.0 / _325;
    float _329 = fma(_159, _327, -1.0);
    float _331 = fma(_161, _327, -1.0);
    float _333 = fma(_163, _327, -1.0);
    float _335 = fma(_317, _329, 1.0);
    float _337 = fma(_317, _331, 1.0);
    float _339 = fma(_317, _333, 1.0);
    float _341 = _335 * _303;
    float _343 = _337 * _303;
    float _345 = _339 * _303;
    float _347 = precise::max(0.0, _341);
    float _349 = precise::max(0.0, _343);
    float _351 = precise::max(0.0, _345);
    float _353 = precise::min(_347, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _355 = precise::min(_349, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _357 = precise::min(_351, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _353;
    out.m_41.y = _355;
    out.m_41.z = _357;
    out.m_41.w = _87;
    return out;
}

