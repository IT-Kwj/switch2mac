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
    float2 _375 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).xyzw;
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
    float3 _456 = float3(_105, _113, _109);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_456, float3(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_456, float3(0.0), isnan(_456))).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _89 * 0.586600005626678466796875;
    float _127 = fma(_85, 0.29890000820159912109375, _125);
    float _129 = fma(_87, 0.1143999993801116943359375, _127);
    float _131 = _129 * (-1.44269502162933349609375);
    float _133 = exp2(_131);
    float _135 = -_133;
    float _137 = _135 + 1.0;
    bool _141 = _137 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _143 = isnan(_137);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _149 = _145 || _147;
    float _151 = _101;
    float _153 = _85;
    float _155 = _87;
    float _157 = _133;
    float _159 = _97;
    float _161 = _93;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _163 = _151;
    if (_149)
    {
        float _165 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _167 = _137 + _165;
        _153 = _167;
    }
    float _169 = _153;
    if (_149)
    {
        float _171 = -_163;
        float _173 = _171 + 1.00000095367431640625;
        _155 = _173;
    }
    float _175 = _155;
    if (_149)
    {
        float _177 = -_163;
        float _179 = _177 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _157 = _179;
    }
    float _181 = _157;
    float _183 = _103;
    float _185 = _181;
    if (_149)
    {
        float _187 = 1.0 / _175;
        _183 = _187;
    }
    float _189 = _183;
    float _191 = _189;
    if (_149)
    {
        float _193 = _169 * _189;
        _159 = _193;
    }
    float _195 = _159;
    float _197 = _195;
    if (_149)
    {
        float _199 = _181 * _189;
        _191 = _199;
    }
    float _201 = _191;
    float _203 = _201;
    if (_149)
    {
        float _205 = -_195;
        float _207 = _205 + 1.0;
        _161 = _207;
    }
    float _209 = _161;
    if (_149)
    {
        float _211 = _201 + (-1.0);
        _185 = _211;
    }
    float _213 = _185;
    float _215 = _213;
    if (_149)
    {
        float _217 = _201 * _195;
        _197 = _217;
    }
    float _219 = _197;
    float _221 = _219;
    if (!_149)
    {
        _203 = _137;
    }
    float _223 = _203;
    float _225 = _169;
    float _227 = _223;
    if (_149)
    {
        float _229 = abs(_209);
        float _231 = log2(_229);
        _225 = _231;
    }
    float _233 = _225;
    float _235 = _233;
    if (_149)
    {
        float _237 = _233 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _235 = _237;
    }
    float _239 = _235;
    float _241 = _239;
    if (_149)
    {
        float _243 = exp2(_239);
        _241 = _243;
    }
    float _245 = _241;
    if (_149)
    {
        float _247 = fma(_213, _245, 1.0);
        _215 = _247;
    }
    float _249 = _215;
    float _251 = _163;
    if (_149)
    {
        float _253 = 1.0 / _249;
        _251 = _253;
    }
    float _255 = _251;
    if (_149)
    {
        float _257 = _219 * _255;
        _221 = _257;
    }
    float _259 = _221;
    if (_149)
    {
        float _261 = fma(_175, _259, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _227 = _261;
    }
    float _263 = _227;
    float _265 = -_137;
    float _267 = _265 + _263;
    float _269 = _267 + 1.0;
    float _271 = abs(_269);
    float _273 = log2(_271);
    float _275 = abs(_121);
    float _277 = log2(_275);
    float _279 = abs(_119);
    float _281 = log2(_279);
    float _283 = abs(_123);
    float _285 = log2(_283);
    float _287 = _277 * 2.2000000476837158203125;
    float _289 = _281 * 2.2000000476837158203125;
    float _291 = exp2(_287);
    float _293 = _273 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _295 = _285 * 2.2000000476837158203125;
    float _297 = exp2(_289);
    float _299 = exp2(_295);
    float _301 = _291 * 0.586600005626678466796875;
    float _303 = fma(_297, 0.29890000820159912109375, _301);
    float _305 = exp2(_293);
    float _307 = fma(_299, 0.1143999993801116943359375, _303);
    float _309 = spvFAdd(_307, 9.9999999747524270787835121154785e-07);
    float _311 = 1.0 / _309;
    float _313 = fma(_297, _311, -1.0);
    float _315 = fma(_291, _311, -1.0);
    float _317 = fma(_299, _311, -1.0);
    float _319 = fma(_305, _313, 1.0);
    float _321 = fma(_305, _315, 1.0);
    float _323 = fma(_305, _317, 1.0);
    float _325 = _319 * _263;
    float _327 = _321 * _263;
    float _329 = _323 * _263;
    float _331 = precise::max(0.0, _325);
    float _333 = precise::max(0.0, _327);
    float _335 = precise::max(0.0, _329);
    float _337 = precise::min(_331, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _339 = precise::min(_333, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _341 = precise::min(_335, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _337;
    out.m_39.y = _339;
    out.m_39.z = _341;
    out.m_39.w = _75;
    return out;
}

