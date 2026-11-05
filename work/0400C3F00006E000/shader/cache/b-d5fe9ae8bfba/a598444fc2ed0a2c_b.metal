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
    float _85 = _73 * _83;
    float _87 = _71 * _83;
    float _89 = _69 * _83;
    float _91 = fma(_85, 2.4300000667572021484375, 0.589999973773956298828125);
    float _93 = fma(_87, 2.4300000667572021484375, 0.589999973773956298828125);
    float _95 = fma(_89, 2.4300000667572021484375, 0.589999973773956298828125);
    float _97 = fma(_85, _91, 0.14000000059604644775390625);
    float _99 = fma(_87, _93, 0.14000000059604644775390625);
    float _101 = fma(_89, _95, 0.14000000059604644775390625);
    float _103 = fma(_85, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _105 = 1.0 / _97;
    float _107 = fma(_89, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _109 = fma(_87, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _111 = _85 * _103;
    float _113 = _89 * _107;
    float _115 = _87 * _109;
    float _117 = 1.0 / _101;
    float _119 = 1.0 / _99;
    float _121 = _111 * _105;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _127 = _113 * _117;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _115 * _119;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _137 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _491 = float3(_135, _137, _125);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_491, float3(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_491, float3(0.0), isnan(_491))).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _87 * 0.586600005626678466796875;
    float _151 = fma(_89, 0.29890000820159912109375, _149);
    float _153 = fma(_85, 0.1143999993801116943359375, _151);
    float _155 = _153 * (-1.44269502162933349609375);
    float _157 = exp2(_155);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    bool _165 = _161 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _167 = isnan(_161);
    bool _169 = _165 || _167;
    bool _171 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _173 = _169 || _171;
    float _175 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _177 = _87;
    float _179 = _125;
    float _181 = _157;
    float _183 = _149;
    float _185 = _97;
    float _187 = _117;
    if (_173)
    {
        _175 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _189 = _175;
    if (_173)
    {
        float _191 = -_189;
        float _193 = _191 + 1.00000095367431640625;
        _177 = _193;
    }
    float _195 = _177;
    if (_173)
    {
        float _197 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _199 = _161 + _197;
        _179 = _199;
    }
    float _201 = _179;
    float _203 = _201;
    if (_173)
    {
        float _205 = -_189;
        float _207 = _205 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _181 = _207;
    }
    float _209 = _181;
    float _211 = 0.0;
    float _213 = _209;
    if (_173)
    {
        float _215 = 1.0 / _195;
        _211 = _215;
    }
    float _217 = _211;
    if (_173)
    {
        float _219 = _201 * _217;
        _183 = _219;
    }
    float _221 = _183;
    float _223 = _221;
    if (_173)
    {
        float _225 = _209 * _217;
        _203 = _225;
    }
    float _227 = _203;
    float _229 = _227;
    if (_173)
    {
        float _231 = -_221;
        float _233 = _231 + 1.0;
        _185 = _233;
    }
    float _235 = _185;
    if (_173)
    {
        float _237 = _227 + (-1.0);
        _213 = _237;
    }
    float _239 = _213;
    float _241 = _239;
    if (_173)
    {
        float _243 = _227 * _221;
        _223 = _243;
    }
    float _245 = _223;
    float _247 = _245;
    if (!_173)
    {
        _229 = _161;
    }
    float _249 = _229;
    float _251 = _235;
    float _253 = _249;
    if (_173)
    {
        float _255 = abs(_235);
        float _257 = log2(_255);
        _251 = _257;
    }
    float _259 = _251;
    if (_173)
    {
        float _261 = _259 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _187 = _261;
    }
    float _263 = _187;
    float _265 = _105;
    if (_173)
    {
        float _267 = exp2(_263);
        _265 = _267;
    }
    float _269 = _265;
    if (_173)
    {
        float _271 = fma(_239, _269, 1.0);
        _241 = _271;
    }
    float _273 = _241;
    float _275 = _273;
    if (_173)
    {
        float _277 = 1.0 / _273;
        _275 = _277;
    }
    float _279 = _275;
    if (_173)
    {
        float _281 = _245 * _279;
        _247 = _281;
    }
    float _283 = _247;
    if (_173)
    {
        float _285 = fma(_195, _283, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _253 = _285;
    }
    float _287 = _253;
    float _289 = -_161;
    float _291 = _289 + _287;
    float _293 = _291 + 1.0;
    float _295 = abs(_293);
    float _297 = log2(_295);
    float _299 = _145 * 0.586600005626678466796875;
    float _301 = fma(_143, 0.29890000820159912109375, _299);
    float _303 = _297 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _305 = fma(_147, 0.1143999993801116943359375, _301);
    float _307 = exp2(_303);
    float _309 = spvFAdd(_305, 9.9999999747524270787835121154785e-07);
    float _311 = 1.0 / _309;
    float _313 = fma(_143, _311, -1.0);
    float _315 = fma(_145, _311, -1.0);
    float _317 = fma(_147, _311, -1.0);
    float _319 = fma(_307, _313, 1.0);
    float _321 = fma(_307, _315, 1.0);
    float _323 = fma(_307, _317, 1.0);
    float _325 = _319 * _287;
    float _327 = _321 * _287;
    float _329 = _323 * _287;
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

