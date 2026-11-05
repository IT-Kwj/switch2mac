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
    float2 _357 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).xyzw;
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
    float3 _442 = float3(_113, _119, _107);
    float3 _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_442, float3(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_442, float3(0.0), isnan(_442))).xyz;
    float _125 = _123.x;
    float _127 = _123.y;
    float _129 = _123.z;
    float _131 = _89 * 0.586600005626678466796875;
    float _133 = fma(_87, 0.29890000820159912109375, _131);
    float _135 = fma(_85, 0.1143999993801116943359375, _133);
    float _137 = _135 * (-1.44269502162933349609375);
    float _139 = exp2(_137);
    float _141 = -_139;
    float _143 = _141 + 1.0;
    bool _147 = _143 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _149 = isnan(_143);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _159 = _117;
    float _161 = _89;
    float _163 = _139;
    float _165 = _131;
    float _167 = _101;
    float _169 = _107;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _171 = _157;
    if (_155)
    {
        float _173 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _175 = _143 + _173;
        _159 = _175;
    }
    float _177 = _159;
    float _179 = _177;
    if (_155)
    {
        float _181 = -_171;
        float _183 = _181 + 1.00000095367431640625;
        _161 = _183;
    }
    float _185 = _161;
    if (_155)
    {
        float _187 = -_171;
        float _189 = _187 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _163 = _189;
    }
    float _191 = _163;
    float _193 = 0.0;
    float _195 = _191;
    if (_155)
    {
        float _197 = 1.0 / _185;
        _193 = _197;
    }
    float _199 = _193;
    if (_155)
    {
        float _201 = _177 * _199;
        _165 = _201;
    }
    float _203 = _165;
    float _205 = _203;
    if (_155)
    {
        float _207 = _191 * _199;
        _179 = _207;
    }
    float _209 = _179;
    float _211 = _209;
    if (_155)
    {
        float _213 = -_203;
        float _215 = _213 + 1.0;
        _167 = _215;
    }
    float _217 = _167;
    if (_155)
    {
        float _219 = _209 + (-1.0);
        _195 = _219;
    }
    float _221 = _195;
    float _223 = _221;
    if (_155)
    {
        float _225 = _209 * _203;
        _205 = _225;
    }
    float _227 = _205;
    float _229 = _227;
    if (!_155)
    {
        _211 = _143;
    }
    float _231 = _211;
    float _233 = _217;
    float _235 = _231;
    if (_155)
    {
        float _237 = abs(_217);
        float _239 = log2(_237);
        _233 = _239;
    }
    float _241 = _233;
    if (_155)
    {
        float _243 = _241 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _169 = _243;
    }
    float _245 = _169;
    float _247 = 0.0;
    if (_155)
    {
        float _249 = exp2(_245);
        _247 = _249;
    }
    float _251 = _247;
    if (_155)
    {
        float _253 = fma(_221, _251, 1.0);
        _223 = _253;
    }
    float _255 = _223;
    float _257 = _255;
    if (_155)
    {
        float _259 = 1.0 / _255;
        _257 = _259;
    }
    float _261 = _257;
    if (_155)
    {
        float _263 = _227 * _261;
        _229 = _263;
    }
    float _265 = _229;
    if (_155)
    {
        float _267 = fma(_185, _265, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _235 = _267;
    }
    float _269 = _235;
    float _271 = -_143;
    float _273 = _271 + _269;
    float _275 = _273 + 1.0;
    float _277 = abs(_275);
    float _279 = log2(_277);
    float _281 = _127 * 0.586600005626678466796875;
    float _283 = fma(_125, 0.29890000820159912109375, _281);
    float _285 = _279 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _287 = fma(_129, 0.1143999993801116943359375, _283);
    float _289 = exp2(_285);
    float _291 = spvFAdd(_287, 9.9999999747524270787835121154785e-07);
    float _293 = 1.0 / _291;
    float _295 = fma(_125, _293, -1.0);
    float _297 = fma(_127, _293, -1.0);
    float _299 = fma(_129, _293, -1.0);
    float _301 = fma(_289, _295, 1.0);
    float _303 = fma(_289, _297, 1.0);
    float _305 = fma(_289, _299, 1.0);
    float _307 = _301 * _269;
    float _309 = _303 * _269;
    float _311 = _305 * _269;
    float _313 = precise::max(0.0, _307);
    float _315 = precise::max(0.0, _309);
    float _317 = precise::max(0.0, _311);
    float _319 = precise::min(_313, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _321 = precise::min(_315, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _323 = precise::min(_317, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_39.x = _319;
    out.m_39.y = _321;
    out.m_39.z = _323;
    out.m_39.w = _75;
    return out;
}

