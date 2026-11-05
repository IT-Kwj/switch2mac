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
    float2 _351 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = in.m_36.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _60 * _81;
    float _85 = _73 * _83;
    float _87 = _69 * _83;
    float _89 = _71 * _83;
    float _91 = spvFAdd(_85, 1.0);
    float _93 = spvFAdd(_87, 1.0);
    float _95 = spvFAdd(_89, 1.0);
    float _97 = 1.0 / _91;
    float _99 = 1.0 / _93;
    float _101 = 1.0 / _95;
    float _103 = _85 * _97;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _107 = _87 * _99;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _111 = _89 * _101;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _432 = float3(_109, _113, _105);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float3(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float3(0.0), isnan(_432))).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _89 * 0.586600005626678466796875;
    float _127 = fma(_87, 0.29890000820159912109375, _125);
    float _129 = fma(_85, 0.1143999993801116943359375, _127);
    float _131 = _129 * (-1.44269502162933349609375);
    float _133 = exp2(_131);
    float _135 = -_133;
    float _137 = _135 + 1.0;
    bool _141 = _137 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _143 = isnan(_137);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _149 = _145 || _147;
    float _151 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _153 = _111;
    float _155 = _89;
    float _157 = _133;
    float _159 = _125;
    float _161 = _95;
    float _163 = _105;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _165 = _151;
    if (_149)
    {
        float _167 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _169 = _137 + _167;
        _153 = _169;
    }
    float _171 = _153;
    float _173 = _171;
    if (_149)
    {
        float _175 = -_165;
        float _177 = _175 + 1.00000095367431640625;
        _155 = _177;
    }
    float _179 = _155;
    if (_149)
    {
        float _181 = -_165;
        float _183 = _181 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _157 = _183;
    }
    float _185 = _157;
    float _187 = _101;
    float _189 = _185;
    if (_149)
    {
        float _191 = 1.0 / _179;
        _187 = _191;
    }
    float _193 = _187;
    if (_149)
    {
        float _195 = _171 * _193;
        _159 = _195;
    }
    float _197 = _159;
    float _199 = _197;
    if (_149)
    {
        float _201 = _185 * _193;
        _173 = _201;
    }
    float _203 = _173;
    float _205 = _203;
    if (_149)
    {
        float _207 = -_197;
        float _209 = _207 + 1.0;
        _161 = _209;
    }
    float _211 = _161;
    if (_149)
    {
        float _213 = _203 + (-1.0);
        _189 = _213;
    }
    float _215 = _189;
    float _217 = _215;
    if (_149)
    {
        float _219 = _203 * _197;
        _199 = _219;
    }
    float _221 = _199;
    float _223 = _221;
    if (!_149)
    {
        _205 = _137;
    }
    float _225 = _205;
    float _227 = _211;
    float _229 = _225;
    if (_149)
    {
        float _231 = abs(_211);
        float _233 = log2(_231);
        _227 = _233;
    }
    float _235 = _227;
    if (_149)
    {
        float _237 = _235 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _163 = _237;
    }
    float _239 = _163;
    float _241 = _99;
    if (_149)
    {
        float _243 = exp2(_239);
        _241 = _243;
    }
    float _245 = _241;
    if (_149)
    {
        float _247 = fma(_215, _245, 1.0);
        _217 = _247;
    }
    float _249 = _217;
    float _251 = _249;
    if (_149)
    {
        float _253 = 1.0 / _249;
        _251 = _253;
    }
    float _255 = _251;
    if (_149)
    {
        float _257 = _221 * _255;
        _223 = _257;
    }
    float _259 = _223;
    if (_149)
    {
        float _261 = fma(_179, _259, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _229 = _261;
    }
    float _263 = _229;
    float _265 = -_137;
    float _267 = _265 + _263;
    float _269 = _267 + 1.0;
    float _271 = abs(_269);
    float _273 = log2(_271);
    float _275 = _121 * 0.586600005626678466796875;
    float _277 = fma(_119, 0.29890000820159912109375, _275);
    float _279 = _273 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _281 = fma(_123, 0.1143999993801116943359375, _277);
    float _283 = exp2(_279);
    float _285 = spvFAdd(_281, 9.9999999747524270787835121154785e-07);
    float _287 = 1.0 / _285;
    float _289 = fma(_119, _287, -1.0);
    float _291 = fma(_121, _287, -1.0);
    float _293 = fma(_123, _287, -1.0);
    float _295 = fma(_283, _289, 1.0);
    float _297 = fma(_283, _291, 1.0);
    float _299 = fma(_283, _293, 1.0);
    float _301 = _295 * _263;
    float _303 = _297 * _263;
    float _305 = _299 * _263;
    float _307 = precise::max(0.0, _301);
    float _309 = precise::max(0.0, _303);
    float _311 = precise::max(0.0, _305);
    float _313 = precise::min(_307, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _315 = precise::min(_309, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _317 = precise::min(_311, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _313;
    out.m_39.y = _315;
    out.m_39.z = _317;
    out.m_39.w = _75;
    return out;
}

