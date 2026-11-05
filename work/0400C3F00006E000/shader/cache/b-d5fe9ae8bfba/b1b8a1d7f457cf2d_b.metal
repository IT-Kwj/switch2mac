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
    float2 _415 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _432 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = abs(_72);
    float _99 = log2(_97);
    float _101 = abs(_76);
    float _103 = log2(_101);
    float _105 = abs(_74);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = exp2(_109);
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_111);
    float _119 = exp2(_115);
    float _121 = _81 + _113;
    float _123 = _121 * _95;
    float _125 = _85 + _117;
    float _127 = fma(_123, 2.4300000667572021484375, 0.589999973773956298828125);
    float _129 = _125 * _95;
    float _131 = fma(_123, _127, 0.14000000059604644775390625);
    float _133 = _83 + _119;
    float _135 = fma(_129, 2.4300000667572021484375, 0.589999973773956298828125);
    float _137 = 1.0 / _131;
    float _139 = _133 * _95;
    float _141 = fma(_129, _135, 0.14000000059604644775390625);
    float _143 = fma(_129, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _145 = fma(_123, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _147 = fma(_139, 2.4300000667572021484375, 0.589999973773956298828125);
    float _149 = _129 * _143;
    float _151 = 1.0 / _141;
    float _153 = fma(_139, _147, 0.14000000059604644775390625);
    float _155 = fma(_139, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _157 = _123 * _145;
    float _159 = _139 * _155;
    float _161 = 1.0 / _153;
    float _163 = _157 * _137;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _169 = _149 * _151;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _175 = _159 * _161;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _584 = float3(_167, _179, _173);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_584, float3(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_584, float3(0.0), isnan(_584))).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _139 * 0.586600005626678466796875;
    float _191 = fma(_123, 0.29890000820159912109375, _189);
    float _193 = fma(_129, 0.1143999993801116943359375, _191);
    float _195 = _193 * (-1.44269502162933349609375);
    float _197 = exp2(_195);
    float _199 = -_197;
    float _201 = _199 + 1.0;
    bool _205 = _201 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _207 = isnan(_201);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _213 = _209 || _211;
    float _215 = _129;
    float _217 = _123;
    float _219 = _151;
    float _221 = _179;
    float _223 = _167;
    float _225 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    if (_213)
    {
        _215 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _227 = _215;
    float _229 = _227;
    if (_213)
    {
        float _231 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _233 = _201 + _231;
        _217 = _233;
    }
    float _235 = _217;
    float _237 = _235;
    if (_213)
    {
        float _239 = -_227;
        float _241 = _239 + 1.00000095367431640625;
        _219 = _241;
    }
    float _243 = _219;
    float _245 = 2.4300000667572021484375;
    if (_213)
    {
        float _247 = 1.0 / _243;
        _245 = _247;
    }
    float _249 = _245;
    if (_213)
    {
        float _251 = _235 * _249;
        _221 = _251;
    }
    float _253 = _221;
    float _255 = _253;
    if (_213)
    {
        float _257 = -_227;
        float _259 = _257 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _237 = _259;
    }
    float _261 = _237;
    float _263 = _261;
    if (_213)
    {
        float _265 = -_253;
        float _267 = _265 + 1.0;
        _223 = _267;
    }
    float _269 = _223;
    if (_213)
    {
        float _271 = _261 * _249;
        _229 = _271;
    }
    float _273 = _229;
    float _275 = _273;
    if (_213)
    {
        float _277 = _273 + (-1.0);
        _263 = _277;
    }
    float _279 = _263;
    float _281 = _269;
    float _283 = _279;
    if (_213)
    {
        float _285 = abs(_269);
        float _287 = log2(_285);
        _281 = _287;
    }
    float _289 = _281;
    if (_213)
    {
        float _291 = _273 * _253;
        _255 = _291;
    }
    float _293 = _255;
    float _295 = _293;
    if (!_213)
    {
        _275 = _201;
    }
    float _297 = _275;
    float _299 = _297;
    if (_213)
    {
        float _301 = _289 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _225 = _301;
    }
    float _303 = _225;
    float _305 = _117;
    if (_213)
    {
        float _307 = exp2(_303);
        _305 = _307;
    }
    float _309 = _305;
    if (_213)
    {
        float _311 = fma(_279, _309, 1.0);
        _283 = _311;
    }
    float _313 = _283;
    float _315 = _313;
    if (_213)
    {
        float _317 = 1.0 / _313;
        _315 = _317;
    }
    float _319 = _315;
    if (_213)
    {
        float _321 = _293 * _319;
        _295 = _321;
    }
    float _323 = _295;
    if (_213)
    {
        float _325 = fma(_243, _323, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _299 = _325;
    }
    float _327 = _299;
    float _329 = -_201;
    float _331 = _329 + _327;
    float _333 = _331 + 1.0;
    float _335 = abs(_333);
    float _337 = log2(_335);
    float _339 = _185 * 0.586600005626678466796875;
    float _341 = fma(_183, 0.29890000820159912109375, _339);
    float _343 = _337 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _345 = fma(_187, 0.1143999993801116943359375, _341);
    float _347 = exp2(_343);
    float _349 = spvFAdd(_345, 9.9999999747524270787835121154785e-07);
    float _351 = 1.0 / _349;
    float _353 = fma(_183, _351, -1.0);
    float _355 = fma(_185, _351, -1.0);
    float _357 = fma(_187, _351, -1.0);
    float _359 = fma(_347, _353, 1.0);
    float _361 = fma(_347, _355, 1.0);
    float _363 = fma(_347, _357, 1.0);
    float _365 = _359 * _327;
    float _367 = _361 * _327;
    float _369 = _363 * _327;
    float _371 = precise::max(0.0, _365);
    float _373 = precise::max(0.0, _367);
    float _375 = precise::max(0.0, _369);
    float _377 = precise::min(_371, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _379 = precise::min(_373, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _381 = precise::min(_375, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _377;
    out.m_41.y = _379;
    out.m_41.z = _381;
    out.m_41.w = _87;
    return out;
}

