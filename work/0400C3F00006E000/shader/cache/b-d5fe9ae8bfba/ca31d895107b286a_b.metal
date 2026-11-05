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
    float2 _381 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).xyzw;
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
    float _91 = _85 * (-1.44269502162933349609375);
    float _93 = _87 * (-1.44269502162933349609375);
    float _95 = _89 * (-1.44269502162933349609375);
    float _97 = exp2(_91);
    float _99 = exp2(_93);
    float _101 = exp2(_95);
    float _103 = -_97;
    float _105 = _103 + 1.0;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _109 = -_99;
    float _111 = _109 + 1.0;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _115 = -_101;
    float _117 = _115 + 1.0;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _466 = float3(_107, _119, _113);
    float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_466, float3(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_466, float3(0.0), isnan(_466))).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _89 * 0.586600005626678466796875;
    float _133 = fma(_85, 0.29890000820159912109375, _131);
    float _135 = fma(_87, 0.1143999993801116943359375, _133);
    float _137 = _135 * (-1.44269502162933349609375);
    float _139 = exp2(_137);
    float _141 = -_139;
    float _143 = _141 + 1.0;
    bool _147 = _143 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _149 = isnan(_143);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _155 = _151 || _153;
    float _157 = _99;
    float _159 = _85;
    float _161 = _87;
    float _163 = _139;
    float _165 = _135;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _167 = _157;
    float _169 = _167;
    if (_155)
    {
        float _171 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _173 = _143 + _171;
        _159 = _173;
    }
    float _175 = _159;
    float _177 = _175;
    if (_155)
    {
        float _179 = -_167;
        float _181 = _179 + 1.00000095367431640625;
        _161 = _181;
    }
    float _183 = _161;
    if (_155)
    {
        float _185 = -_167;
        float _187 = _185 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _163 = _187;
    }
    float _189 = _163;
    float _191 = 0.0;
    float _193 = _189;
    if (_155)
    {
        float _195 = 1.0 / _183;
        _191 = _195;
    }
    float _197 = _191;
    float _199 = 0.0;
    if (_155)
    {
        float _201 = _175 * _197;
        _199 = _201;
    }
    float _203 = _199;
    if (_155)
    {
        float _205 = _189 * _197;
        _169 = _205;
    }
    float _207 = _169;
    float _209 = _207;
    if (_155)
    {
        float _211 = -_203;
        float _213 = _211 + 1.0;
        _177 = _213;
    }
    float _215 = _177;
    if (_155)
    {
        float _217 = _207 + (-1.0);
        _193 = _217;
    }
    float _219 = _193;
    float _221 = _219;
    if (_155)
    {
        float _223 = _207 * _203;
        _209 = _223;
    }
    float _225 = _209;
    float _227 = _215;
    if (_155)
    {
        float _229 = abs(_215);
        float _231 = log2(_229);
        _227 = _231;
    }
    float _233 = _227;
    float _235 = _233;
    if (_155)
    {
        float _237 = _233 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _165 = _237;
    }
    float _239 = _165;
    if (!_155)
    {
        _235 = _143;
    }
    float _241 = _235;
    float _243 = _239;
    float _245 = _241;
    if (_155)
    {
        float _247 = exp2(_239);
        _243 = _247;
    }
    float _249 = _243;
    float _251 = _249;
    if (_155)
    {
        float _253 = fma(_219, _249, 1.0);
        _221 = _253;
    }
    float _255 = _221;
    float _257 = _197;
    if (_155)
    {
        float _259 = 1.0 / _255;
        _257 = _259;
    }
    float _261 = _257;
    if (_155)
    {
        float _263 = _225 * _261;
        _251 = _263;
    }
    float _265 = _251;
    if (_155)
    {
        float _267 = fma(_183, _265, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _245 = _267;
    }
    float _269 = _245;
    float _271 = -_143;
    float _273 = _271 + _269;
    float _275 = _273 + 1.0;
    float _277 = abs(_275);
    float _279 = log2(_277);
    float _281 = abs(_127);
    float _283 = log2(_281);
    float _285 = abs(_125);
    float _287 = log2(_285);
    float _289 = abs(_129);
    float _291 = log2(_289);
    float _293 = _283 * 0.4545454680919647216796875;
    float _295 = _287 * 0.4545454680919647216796875;
    float _297 = exp2(_293);
    float _299 = _279 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _301 = _291 * 0.4545454680919647216796875;
    float _303 = exp2(_295);
    float _305 = exp2(_301);
    float _307 = _297 * 0.586600005626678466796875;
    float _309 = fma(_303, 0.29890000820159912109375, _307);
    float _311 = exp2(_299);
    float _313 = fma(_305, 0.1143999993801116943359375, _309);
    float _315 = spvFAdd(_313, 9.9999999747524270787835121154785e-07);
    float _317 = 1.0 / _315;
    float _319 = fma(_303, _317, -1.0);
    float _321 = fma(_297, _317, -1.0);
    float _323 = fma(_305, _317, -1.0);
    float _325 = fma(_311, _319, 1.0);
    float _327 = fma(_311, _321, 1.0);
    float _329 = fma(_311, _323, 1.0);
    float _331 = _325 * _269;
    float _333 = _327 * _269;
    float _335 = _329 * _269;
    float _337 = precise::max(0.0, _331);
    float _339 = precise::max(0.0, _333);
    float _341 = precise::max(0.0, _335);
    float _343 = precise::min(_337, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _345 = precise::min(_339, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _347 = precise::min(_341, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _343;
    out.m_39.y = _345;
    out.m_39.z = _347;
    out.m_39.w = _75;
    return out;
}

