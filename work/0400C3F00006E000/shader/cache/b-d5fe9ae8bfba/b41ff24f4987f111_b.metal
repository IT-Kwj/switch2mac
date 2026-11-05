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
    float _87 = _71 * _83;
    float _89 = _69 * _83;
    float _91 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _93 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _95 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _417 = float3(_95, _93, _91);
    float3 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_417, float3(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_417, float3(0.0), isnan(_417))).xyz;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = _87 * 0.586600005626678466796875;
    float _109 = fma(_89, 0.29890000820159912109375, _107);
    float _111 = fma(_85, 0.1143999993801116943359375, _109);
    float _113 = _111 * (-1.44269502162933349609375);
    float _115 = exp2(_113);
    float _117 = -_115;
    float _119 = _117 + 1.0;
    bool _123 = _119 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _125 = isnan(_119);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _131 = _127 || _129;
    float _133 = 0.0;
    float _135 = _89;
    float _137 = _85;
    float _139 = _115;
    float _141 = _111;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _143 = _133;
    float _145 = _143;
    if (_131)
    {
        float _147 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _149 = _119 + _147;
        _135 = _149;
    }
    float _151 = _135;
    float _153 = _151;
    if (_131)
    {
        float _155 = -_143;
        float _157 = _155 + 1.00000095367431640625;
        _137 = _157;
    }
    float _159 = _137;
    if (_131)
    {
        float _161 = -_143;
        float _163 = _161 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _139 = _163;
    }
    float _165 = _139;
    float _167 = 0.0;
    float _169 = _165;
    if (_131)
    {
        float _171 = 1.0 / _159;
        _167 = _171;
    }
    float _173 = _167;
    float _175 = 0.0;
    if (_131)
    {
        float _177 = _151 * _173;
        _175 = _177;
    }
    float _179 = _175;
    if (_131)
    {
        float _181 = _165 * _173;
        _145 = _181;
    }
    float _183 = _145;
    float _185 = _183;
    if (_131)
    {
        float _187 = -_179;
        float _189 = _187 + 1.0;
        _153 = _189;
    }
    float _191 = _153;
    if (_131)
    {
        float _193 = _183 + (-1.0);
        _169 = _193;
    }
    float _195 = _169;
    float _197 = _195;
    if (_131)
    {
        float _199 = _183 * _179;
        _185 = _199;
    }
    float _201 = _185;
    float _203 = _191;
    if (_131)
    {
        float _205 = abs(_191);
        float _207 = log2(_205);
        _203 = _207;
    }
    float _209 = _203;
    float _211 = _209;
    if (_131)
    {
        float _213 = _209 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _141 = _213;
    }
    float _215 = _141;
    if (!_131)
    {
        _211 = _119;
    }
    float _217 = _211;
    float _219 = _215;
    float _221 = _217;
    if (_131)
    {
        float _223 = exp2(_215);
        _219 = _223;
    }
    float _225 = _219;
    float _227 = _225;
    if (_131)
    {
        float _229 = fma(_195, _225, 1.0);
        _197 = _229;
    }
    float _231 = _197;
    float _233 = _173;
    if (_131)
    {
        float _235 = 1.0 / _231;
        _233 = _235;
    }
    float _237 = _233;
    if (_131)
    {
        float _239 = _201 * _237;
        _227 = _239;
    }
    float _241 = _227;
    if (_131)
    {
        float _243 = fma(_159, _241, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _221 = _243;
    }
    float _245 = _221;
    float _247 = -_119;
    float _249 = _247 + _245;
    float _251 = _249 + 1.0;
    float _253 = abs(_251);
    float _255 = log2(_253);
    float _257 = abs(_103);
    float _259 = log2(_257);
    float _261 = abs(_101);
    float _263 = log2(_261);
    float _265 = abs(_105);
    float _267 = log2(_265);
    float _269 = _259 * 0.4545454680919647216796875;
    float _271 = _263 * 0.4545454680919647216796875;
    float _273 = exp2(_269);
    float _275 = _255 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _277 = _267 * 0.4545454680919647216796875;
    float _279 = exp2(_271);
    float _281 = exp2(_277);
    float _283 = _273 * 0.586600005626678466796875;
    float _285 = fma(_279, 0.29890000820159912109375, _283);
    float _287 = exp2(_275);
    float _289 = fma(_281, 0.1143999993801116943359375, _285);
    float _291 = spvFAdd(_289, 9.9999999747524270787835121154785e-07);
    float _293 = 1.0 / _291;
    float _295 = fma(_279, _293, -1.0);
    float _297 = fma(_273, _293, -1.0);
    float _299 = fma(_281, _293, -1.0);
    float _301 = fma(_287, _295, 1.0);
    float _303 = fma(_287, _297, 1.0);
    float _305 = fma(_287, _299, 1.0);
    float _307 = _301 * _245;
    float _309 = _303 * _245;
    float _311 = _305 * _245;
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

