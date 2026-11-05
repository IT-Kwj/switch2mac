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
    float _85 = _69 * _83;
    float _87 = _73 * _83;
    float _89 = _71 * _83;
    float _91 = fma(_85, 6.19999980926513671875, 1.7000000476837158203125);
    float _93 = fma(_85, 6.19999980926513671875, 0.5);
    float _95 = fma(_89, 6.19999980926513671875, 1.7000000476837158203125);
    float _97 = fma(_85, _91, 0.0599999986588954925537109375);
    float _99 = fma(_87, 6.19999980926513671875, 1.7000000476837158203125);
    float _101 = 1.0 / _97;
    float _103 = fma(_87, _99, 0.0599999986588954925537109375);
    float _105 = fma(_89, _95, 0.0599999986588954925537109375);
    float _107 = _85 * _93;
    float _109 = fma(_87, 6.19999980926513671875, 0.5);
    float _111 = 1.0 / _103;
    float _113 = _87 * _109;
    float _115 = 1.0 / _105;
    float _117 = _107 * _101;
    float _119 = fma(_89, 6.19999980926513671875, 0.5);
    float _121 = _89 * _119;
    float _123 = _113 * _111;
    float _125 = abs(_117);
    float _127 = log2(_125);
    float _129 = _121 * _115;
    float _131 = abs(_123);
    float _133 = log2(_131);
    float _135 = abs(_129);
    float _137 = log2(_135);
    float _139 = _127 * 2.2000000476837158203125;
    float _141 = _133 * 2.2000000476837158203125;
    float _143 = exp2(_139);
    float _145 = _137 * 2.2000000476837158203125;
    float _147 = exp2(_141);
    float _149 = exp2(_145);
    float _151 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _153 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _155 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _551 = float3(_151, _155, _153);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_551, float3(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_551, float3(0.0), isnan(_551))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _89 * 0.586600005626678466796875;
    float _169 = fma(_85, 0.29890000820159912109375, _167);
    float _171 = fma(_87, 0.1143999993801116943359375, _169);
    float _173 = _171 * (-1.44269502162933349609375);
    float _175 = exp2(_173);
    float _177 = -_175;
    float _179 = _177 + 1.0;
    bool _183 = _179 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _185 = isnan(_179);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _191 = _187 || _189;
    float _193 = _147;
    float _195 = _85;
    float _197 = _143;
    float _199 = _175;
    float _201 = _155;
    float _203 = _171;
    if (_191)
    {
        _193 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _205 = _193;
    float _207 = _205;
    if (_191)
    {
        float _209 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _211 = _179 + _209;
        _195 = _211;
    }
    float _213 = _195;
    float _215 = _213;
    if (_191)
    {
        float _217 = -_205;
        float _219 = _217 + 1.00000095367431640625;
        _197 = _219;
    }
    float _221 = _197;
    if (_191)
    {
        float _223 = -_205;
        float _225 = _223 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _199 = _225;
    }
    float _227 = _199;
    float _229 = 0.0;
    float _231 = _227;
    if (_191)
    {
        float _233 = 1.0 / _221;
        _229 = _233;
    }
    float _235 = _229;
    if (_191)
    {
        float _237 = _213 * _235;
        _201 = _237;
    }
    float _239 = _201;
    float _241 = _239;
    if (_191)
    {
        float _243 = _227 * _235;
        _207 = _243;
    }
    float _245 = _207;
    float _247 = _245;
    if (_191)
    {
        float _249 = -_239;
        float _251 = _249 + 1.0;
        _215 = _251;
    }
    float _253 = _215;
    if (_191)
    {
        float _255 = _245 + (-1.0);
        _231 = _255;
    }
    float _257 = _231;
    float _259 = _257;
    if (_191)
    {
        float _261 = _245 * _239;
        _247 = _261;
    }
    float _263 = _247;
    float _265 = _253;
    if (_191)
    {
        float _267 = abs(_253);
        float _269 = log2(_267);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _271;
    if (_191)
    {
        float _275 = _271 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _203 = _275;
    }
    float _277 = _203;
    if (!_191)
    {
        _273 = _179;
    }
    float _279 = _273;
    float _281 = _277;
    float _283 = _279;
    if (_191)
    {
        float _285 = exp2(_277);
        _281 = _285;
    }
    float _287 = _281;
    if (_191)
    {
        float _289 = fma(_257, _287, 1.0);
        _259 = _289;
    }
    float _291 = _259;
    float _293 = _235;
    if (_191)
    {
        float _295 = 1.0 / _291;
        _293 = _295;
    }
    float _297 = _293;
    if (_191)
    {
        float _299 = _263 * _297;
        _241 = _299;
    }
    float _301 = _241;
    if (_191)
    {
        float _303 = fma(_221, _301, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _283 = _303;
    }
    float _305 = _283;
    float _307 = abs(_163);
    float _309 = log2(_307);
    float _311 = abs(_161);
    float _313 = log2(_311);
    float _315 = abs(_165);
    float _317 = log2(_315);
    float _319 = _309 * 2.2000000476837158203125;
    float _321 = _313 * 2.2000000476837158203125;
    float _323 = exp2(_319);
    float _325 = -_179;
    float _327 = _325 + _305;
    float _329 = _327 + 1.0;
    float _331 = _317 * 2.2000000476837158203125;
    float _333 = exp2(_321);
    float _335 = exp2(_331);
    float _337 = _323 * 0.586600005626678466796875;
    float _339 = abs(_329);
    float _341 = log2(_339);
    float _343 = fma(_333, 0.29890000820159912109375, _337);
    float _345 = fma(_335, 0.1143999993801116943359375, _343);
    float _347 = spvFAdd(_345, 9.9999999747524270787835121154785e-07);
    float _349 = _341 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _351 = 1.0 / _347;
    float _353 = exp2(_349);
    float _355 = fma(_333, _351, -1.0);
    float _357 = fma(_323, _351, -1.0);
    float _359 = fma(_335, _351, -1.0);
    float _361 = fma(_353, _355, 1.0);
    float _363 = fma(_353, _357, 1.0);
    float _365 = fma(_353, _359, 1.0);
    float _367 = _361 * _305;
    float _369 = _363 * _305;
    float _371 = _365 * _305;
    float _373 = precise::max(0.0, _367);
    float _375 = precise::max(0.0, _369);
    float _377 = precise::max(0.0, _371);
    float _379 = precise::min(_373, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _381 = precise::min(_375, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _383 = precise::min(_377, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _379;
    out.m_39.y = _381;
    out.m_39.z = _383;
    out.m_39.w = _75;
    return out;
}

