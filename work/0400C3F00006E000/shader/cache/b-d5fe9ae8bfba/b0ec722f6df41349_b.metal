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
    float2 _421 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_421, float2(0.0), isnan(_421))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _438 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).xyzw;
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
    float _127 = _123 * (-1.44269502162933349609375);
    float _129 = _125 * _95;
    float _131 = exp2(_127);
    float _133 = _83 + _119;
    float _135 = _129 * (-1.44269502162933349609375);
    float _137 = _133 * _95;
    float _139 = exp2(_135);
    float _141 = _137 * (-1.44269502162933349609375);
    float _143 = exp2(_141);
    float _145 = -_131;
    float _147 = _145 + 1.0;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _151 = -_139;
    float _153 = _151 + 1.0;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _157 = -_143;
    float _159 = _157 + 1.0;
    float _161 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _559 = float3(_149, _161, _155);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_559, float3(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_559, float3(0.0), isnan(_559))).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _137 * 0.586600005626678466796875;
    float _173 = fma(_123, 0.29890000820159912109375, _171);
    float _175 = fma(_129, 0.1143999993801116943359375, _173);
    float _177 = _175 * (-1.44269502162933349609375);
    float _179 = exp2(_177);
    float _181 = -_179;
    float _183 = _181 + 1.0;
    bool _187 = _183 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _189 = isnan(_183);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _195 = _191 || _193;
    float _197 = _159;
    float _199 = _123;
    float _201 = _143;
    float _203 = _179;
    float _205 = _117;
    float _207 = _175;
    if (_195)
    {
        _197 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _209 = _197;
    float _211 = _209;
    if (_195)
    {
        float _213 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _215 = _183 + _213;
        _199 = _215;
    }
    float _217 = _199;
    float _219 = _217;
    if (_195)
    {
        float _221 = -_209;
        float _223 = _221 + 1.00000095367431640625;
        _201 = _223;
    }
    float _225 = _201;
    if (_195)
    {
        float _227 = -_209;
        float _229 = _227 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _203 = _229;
    }
    float _231 = _203;
    float _233 = _95;
    float _235 = _231;
    if (_195)
    {
        float _237 = 1.0 / _225;
        _233 = _237;
    }
    float _239 = _233;
    if (_195)
    {
        float _241 = _217 * _239;
        _205 = _241;
    }
    float _243 = _205;
    if (_195)
    {
        float _245 = _231 * _239;
        _211 = _245;
    }
    float _247 = _211;
    float _249 = _247;
    if (_195)
    {
        float _251 = -_243;
        float _253 = _251 + 1.0;
        _219 = _253;
    }
    float _255 = _219;
    if (_195)
    {
        float _257 = _247 + (-1.0);
        _235 = _257;
    }
    float _259 = _235;
    float _261 = _259;
    if (_195)
    {
        float _263 = _247 * _243;
        _249 = _263;
    }
    float _265 = _249;
    float _267 = _255;
    if (_195)
    {
        float _269 = abs(_255);
        float _271 = log2(_269);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = _273;
    if (_195)
    {
        float _277 = _273 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _207 = _277;
    }
    float _279 = _207;
    if (!_195)
    {
        _275 = _183;
    }
    float _281 = _275;
    float _283 = _279;
    float _285 = _281;
    if (_195)
    {
        float _287 = exp2(_279);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _289;
    if (_195)
    {
        float _293 = fma(_259, _289, 1.0);
        _261 = _293;
    }
    float _295 = _261;
    float _297 = _239;
    if (_195)
    {
        float _299 = 1.0 / _295;
        _297 = _299;
    }
    float _301 = _297;
    if (_195)
    {
        float _303 = _265 * _301;
        _291 = _303;
    }
    float _305 = _291;
    if (_195)
    {
        float _307 = fma(_225, _305, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _285 = _307;
    }
    float _309 = _285;
    float _311 = -_183;
    float _313 = _311 + _309;
    float _315 = _313 + 1.0;
    float _317 = abs(_315);
    float _319 = log2(_317);
    float _321 = abs(_167);
    float _323 = log2(_321);
    float _325 = abs(_165);
    float _327 = log2(_325);
    float _329 = abs(_169);
    float _331 = log2(_329);
    float _333 = _323 * 0.4545454680919647216796875;
    float _335 = _327 * 0.4545454680919647216796875;
    float _337 = exp2(_333);
    float _339 = _319 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _341 = _331 * 0.4545454680919647216796875;
    float _343 = exp2(_335);
    float _345 = exp2(_341);
    float _347 = _337 * 0.586600005626678466796875;
    float _349 = fma(_343, 0.29890000820159912109375, _347);
    float _351 = exp2(_339);
    float _353 = fma(_345, 0.1143999993801116943359375, _349);
    float _355 = spvFAdd(_353, 9.9999999747524270787835121154785e-07);
    float _357 = 1.0 / _355;
    float _359 = fma(_343, _357, -1.0);
    float _361 = fma(_337, _357, -1.0);
    float _363 = fma(_345, _357, -1.0);
    float _365 = fma(_351, _359, 1.0);
    float _367 = fma(_351, _361, 1.0);
    float _369 = fma(_351, _363, 1.0);
    float _371 = _365 * _309;
    float _373 = _367 * _309;
    float _375 = _369 * _309;
    float _377 = precise::max(0.0, _371);
    float _379 = precise::max(0.0, _373);
    float _381 = precise::max(0.0, _375);
    float _383 = precise::min(_377, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _385 = precise::min(_379, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _387 = precise::min(_381, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _383;
    out.m_41.y = _385;
    out.m_41.z = _387;
    out.m_41.w = _87;
    return out;
}

