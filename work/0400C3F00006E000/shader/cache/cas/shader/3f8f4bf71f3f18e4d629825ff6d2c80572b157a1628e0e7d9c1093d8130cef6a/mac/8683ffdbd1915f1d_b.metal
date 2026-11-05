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
    float2 _399 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).xyzw;
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
    float _91 = fma(_85, 2.4300000667572021484375, 0.589999973773956298828125);
    float _93 = fma(_85, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _95 = fma(_89, 2.4300000667572021484375, 0.589999973773956298828125);
    float _97 = fma(_85, _91, 0.14000000059604644775390625);
    float _99 = fma(_87, 2.4300000667572021484375, 0.589999973773956298828125);
    float _101 = fma(_89, _95, 0.14000000059604644775390625);
    float _103 = fma(_89, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _105 = _85 * _93;
    float _107 = fma(_87, _99, 0.14000000059604644775390625);
    float _109 = 1.0 / _97;
    float _111 = fma(_87, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _113 = _89 * _103;
    float _115 = _87 * _111;
    float _117 = 1.0 / _107;
    float _119 = 1.0 / _101;
    float _121 = _105 * _109;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _127 = _115 * _117;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _133 = _113 * _119;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _515 = float3(_125, _137, _131);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_515, float3(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_515, float3(0.0), isnan(_515))).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _89 * 0.586600005626678466796875;
    float _151 = fma(_85, 0.29890000820159912109375, _149);
    float _153 = fma(_87, 0.1143999993801116943359375, _151);
    float _155 = _153 * (-1.44269502162933349609375);
    float _157 = exp2(_155);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    bool _165 = _161 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _167 = isnan(_161);
    bool _169 = _165 || _167;
    bool _171 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _173 = _169 || _171;
    float _175 = _101;
    float _177 = _85;
    float _179 = _87;
    float _181 = _157;
    float _183 = _119;
    float _185 = _153;
    if (_173)
    {
        _175 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _187 = _175;
    float _189 = _187;
    if (_173)
    {
        float _191 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _193 = _161 + _191;
        _177 = _193;
    }
    float _195 = _177;
    float _197 = _195;
    if (_173)
    {
        float _199 = -_187;
        float _201 = _199 + 1.00000095367431640625;
        _179 = _201;
    }
    float _203 = _179;
    if (_173)
    {
        float _205 = -_187;
        float _207 = _205 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _181 = _207;
    }
    float _209 = _181;
    float _211 = 2.5099999904632568359375;
    float _213 = _209;
    if (_173)
    {
        float _215 = 1.0 / _203;
        _211 = _215;
    }
    float _217 = _211;
    if (_173)
    {
        float _219 = _195 * _217;
        _183 = _219;
    }
    float _221 = _183;
    float _223 = _221;
    if (_173)
    {
        float _225 = _209 * _217;
        _189 = _225;
    }
    float _227 = _189;
    float _229 = _227;
    if (_173)
    {
        float _231 = -_221;
        float _233 = _231 + 1.0;
        _197 = _233;
    }
    float _235 = _197;
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
        _229 = _243;
    }
    float _245 = _229;
    float _247 = _235;
    if (_173)
    {
        float _249 = abs(_235);
        float _251 = log2(_249);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = _253;
    if (_173)
    {
        float _257 = _253 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _185 = _257;
    }
    float _259 = _185;
    if (!_173)
    {
        _255 = _161;
    }
    float _261 = _255;
    float _263 = _259;
    float _265 = _261;
    if (_173)
    {
        float _267 = exp2(_259);
        _263 = _267;
    }
    float _269 = _263;
    if (_173)
    {
        float _271 = fma(_239, _269, 1.0);
        _241 = _271;
    }
    float _273 = _241;
    float _275 = _217;
    if (_173)
    {
        float _277 = 1.0 / _273;
        _275 = _277;
    }
    float _279 = _275;
    if (_173)
    {
        float _281 = _245 * _279;
        _223 = _281;
    }
    float _283 = _223;
    if (_173)
    {
        float _285 = fma(_203, _283, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _265 = _285;
    }
    float _287 = _265;
    float _289 = abs(_145);
    float _291 = log2(_289);
    float _293 = abs(_143);
    float _295 = log2(_293);
    float _297 = abs(_147);
    float _299 = log2(_297);
    float _301 = _291 * 0.4545454680919647216796875;
    float _303 = _295 * 0.4545454680919647216796875;
    float _305 = exp2(_301);
    float _307 = -_161;
    float _309 = _307 + _287;
    float _311 = _309 + 1.0;
    float _313 = _299 * 0.4545454680919647216796875;
    float _315 = exp2(_303);
    float _317 = exp2(_313);
    float _319 = _305 * 0.586600005626678466796875;
    float _321 = abs(_311);
    float _323 = log2(_321);
    float _325 = fma(_315, 0.29890000820159912109375, _319);
    float _327 = fma(_317, 0.1143999993801116943359375, _325);
    float _329 = spvFAdd(_327, 9.9999999747524270787835121154785e-07);
    float _331 = _323 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _333 = 1.0 / _329;
    float _335 = exp2(_331);
    float _337 = fma(_315, _333, -1.0);
    float _339 = fma(_305, _333, -1.0);
    float _341 = fma(_317, _333, -1.0);
    float _343 = fma(_335, _337, 1.0);
    float _345 = fma(_335, _339, 1.0);
    float _347 = fma(_335, _341, 1.0);
    float _349 = _343 * _287;
    float _351 = _345 * _287;
    float _353 = _347 * _287;
    float _355 = precise::max(0.0, _349);
    float _357 = precise::max(0.0, _351);
    float _359 = precise::max(0.0, _353);
    float _361 = precise::min(_355, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _363 = precise::min(_357, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _365 = precise::min(_359, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _361;
    out.m_39.y = _363;
    out.m_39.z = _365;
    out.m_39.w = _75;
    return out;
}

