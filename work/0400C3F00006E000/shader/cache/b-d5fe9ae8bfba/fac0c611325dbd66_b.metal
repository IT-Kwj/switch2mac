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
    float _97 = abs(_76);
    float _99 = log2(_97);
    float _101 = abs(_74);
    float _103 = log2(_101);
    float _105 = abs(_72);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = exp2(_109);
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_111);
    float _119 = exp2(_115);
    float _121 = _85 + _113;
    float _123 = _121 * _95;
    float _125 = _83 + _117;
    float _127 = spvFAdd(_123, 1.0);
    float _129 = _125 * _95;
    float _131 = 1.0 / _127;
    float _133 = _81 + _119;
    float _135 = spvFAdd(_129, 1.0);
    float _137 = _133 * _95;
    float _139 = 1.0 / _135;
    float _141 = spvFAdd(_137, 1.0);
    float _143 = 1.0 / _141;
    float _145 = _123 * _131;
    float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _149 = _129 * _139;
    float _151 = _137 * _143;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _155 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _549 = float3(_153, _155, _147);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_549, float3(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_549, float3(0.0), isnan(_549))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _129 * 0.586600005626678466796875;
    float _167 = fma(_137, 0.29890000820159912109375, _165);
    float _169 = fma(_123, 0.1143999993801116943359375, _167);
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
    float _193 = _137;
    float _195 = _139;
    float _197 = _173;
    float _199 = _113;
    float _201 = _149;
    if (_189)
    {
        _191 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _203 = _191;
    if (_189)
    {
        float _205 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _207 = _177 + _205;
        _193 = _207;
    }
    float _209 = _193;
    if (_189)
    {
        float _211 = -_203;
        float _213 = _211 + 1.00000095367431640625;
        _195 = _213;
    }
    float _215 = _195;
    if (_189)
    {
        float _217 = -_203;
        float _219 = _217 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _197 = _219;
    }
    float _221 = _197;
    float _223 = _123;
    float _225 = _221;
    if (_189)
    {
        float _227 = 1.0 / _215;
        _223 = _227;
    }
    float _229 = _223;
    float _231 = _229;
    if (_189)
    {
        float _233 = _209 * _229;
        _199 = _233;
    }
    float _235 = _199;
    float _237 = _235;
    if (_189)
    {
        float _239 = _221 * _229;
        _231 = _239;
    }
    float _241 = _231;
    float _243 = _241;
    if (_189)
    {
        float _245 = -_235;
        float _247 = _245 + 1.0;
        _201 = _247;
    }
    float _249 = _201;
    if (_189)
    {
        float _251 = _241 + (-1.0);
        _225 = _251;
    }
    float _253 = _225;
    float _255 = _253;
    if (_189)
    {
        float _257 = _241 * _235;
        _237 = _257;
    }
    float _259 = _237;
    float _261 = _259;
    if (!_189)
    {
        _243 = _177;
    }
    float _263 = _243;
    float _265 = _209;
    float _267 = _263;
    if (_189)
    {
        float _269 = abs(_249);
        float _271 = log2(_269);
        _265 = _271;
    }
    float _273 = _265;
    float _275 = _273;
    if (_189)
    {
        float _277 = _273 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _275 = _277;
    }
    float _279 = _275;
    float _281 = _279;
    if (_189)
    {
        float _283 = exp2(_279);
        _281 = _283;
    }
    float _285 = _281;
    if (_189)
    {
        float _287 = fma(_253, _285, 1.0);
        _255 = _287;
    }
    float _289 = _255;
    float _291 = _203;
    if (_189)
    {
        float _293 = 1.0 / _289;
        _291 = _293;
    }
    float _295 = _291;
    if (_189)
    {
        float _297 = _259 * _295;
        _261 = _297;
    }
    float _299 = _261;
    if (_189)
    {
        float _301 = fma(_215, _299, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _267 = _301;
    }
    float _303 = _267;
    float _305 = -_177;
    float _307 = _305 + _303;
    float _309 = _307 + 1.0;
    float _311 = abs(_309);
    float _313 = log2(_311);
    float _315 = abs(_161);
    float _317 = log2(_315);
    float _319 = abs(_159);
    float _321 = log2(_319);
    float _323 = abs(_163);
    float _325 = log2(_323);
    float _327 = _317 * 0.4545454680919647216796875;
    float _329 = _321 * 0.4545454680919647216796875;
    float _331 = exp2(_327);
    float _333 = _313 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _335 = _325 * 0.4545454680919647216796875;
    float _337 = exp2(_329);
    float _339 = exp2(_335);
    float _341 = _331 * 0.586600005626678466796875;
    float _343 = fma(_337, 0.29890000820159912109375, _341);
    float _345 = exp2(_333);
    float _347 = fma(_339, 0.1143999993801116943359375, _343);
    float _349 = spvFAdd(_347, 9.9999999747524270787835121154785e-07);
    float _351 = 1.0 / _349;
    float _353 = fma(_337, _351, -1.0);
    float _355 = fma(_331, _351, -1.0);
    float _357 = fma(_339, _351, -1.0);
    float _359 = fma(_345, _353, 1.0);
    float _361 = fma(_345, _355, 1.0);
    float _363 = fma(_345, _357, 1.0);
    float _365 = _359 * _303;
    float _367 = _361 * _303;
    float _369 = _363 * _303;
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

