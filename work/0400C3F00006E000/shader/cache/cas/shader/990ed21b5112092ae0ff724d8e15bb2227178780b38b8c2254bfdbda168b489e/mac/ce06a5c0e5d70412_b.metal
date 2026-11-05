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
    float3 _554 = float3(_153, _155, _147);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_554, float3(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_554, float3(0.0), isnan(_554))).xyz;
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
    float _191 = _123;
    float _193 = _105;
    float _195 = _147;
    float _197 = _137;
    float _199 = _103;
    float _201 = _173;
    float _203 = _145;
    if (_189)
    {
        _191 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _205 = _191;
    if (_189)
    {
        float _207 = -_205;
        float _209 = _207 + 1.00000095367431640625;
        _193 = _209;
    }
    float _211 = _193;
    float _213 = 2.5099999904632568359375;
    if (_189)
    {
        float _215 = 1.0 / _211;
        _213 = _215;
    }
    float _217 = _213;
    if (_189)
    {
        float _219 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _221 = _177 + _219;
        _195 = _221;
    }
    float _223 = _195;
    float _225 = _223;
    if (_189)
    {
        float _227 = _223 * _217;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229;
    if (_189)
    {
        float _233 = -_205;
        float _235 = _233 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _225 = _235;
    }
    float _237 = _225;
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
        float _247 = _237 * _217;
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
        _251 = _267;
    }
    float _269 = _251;
    float _271 = _269;
    if (_189)
    {
        float _273 = _265 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _203 = _273;
    }
    float _275 = _203;
    float _277 = _275;
    if (_189)
    {
        float _279 = exp2(_275);
        _277 = _279;
    }
    float _281 = _277;
    if (_189)
    {
        float _283 = fma(_255, _281, 1.0);
        _259 = _283;
    }
    float _285 = _259;
    float _287 = _285;
    if (_189)
    {
        float _289 = 1.0 / _285;
        _287 = _289;
    }
    float _291 = _287;
    if (_189)
    {
        float _293 = _269 * _291;
        _231 = _293;
    }
    float _295 = _231;
    if (!_189)
    {
        _271 = _177;
    }
    float _297 = _271;
    float _299 = _297;
    if (_189)
    {
        float _301 = fma(_211, _295, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _299 = _301;
    }
    float _303 = _299;
    float _305 = abs(_161);
    float _307 = log2(_305);
    float _309 = abs(_159);
    float _311 = log2(_309);
    float _313 = abs(_163);
    float _315 = log2(_313);
    float _317 = _307 * 2.2000000476837158203125;
    float _319 = _311 * 2.2000000476837158203125;
    float _321 = exp2(_317);
    float _323 = -_177;
    float _325 = _323 + _303;
    float _327 = _325 + 1.0;
    float _329 = _315 * 2.2000000476837158203125;
    float _331 = exp2(_319);
    float _333 = exp2(_329);
    float _335 = _321 * 0.586600005626678466796875;
    float _337 = abs(_327);
    float _339 = log2(_337);
    float _341 = fma(_331, 0.29890000820159912109375, _335);
    float _343 = fma(_333, 0.1143999993801116943359375, _341);
    float _345 = spvFAdd(_343, 9.9999999747524270787835121154785e-07);
    float _347 = _339 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _349 = 1.0 / _345;
    float _351 = exp2(_347);
    float _353 = fma(_331, _349, -1.0);
    float _355 = fma(_321, _349, -1.0);
    float _357 = fma(_333, _349, -1.0);
    float _359 = fma(_351, _353, 1.0);
    float _361 = fma(_351, _355, 1.0);
    float _363 = fma(_351, _357, 1.0);
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

