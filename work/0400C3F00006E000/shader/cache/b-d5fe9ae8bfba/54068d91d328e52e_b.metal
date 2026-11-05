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
    float2 _349 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_349, float2(0.0), isnan(_349))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _366 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_366, float2(0.0), isnan(_366))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _85 + _76;
    float _99 = _83 + _74;
    float _101 = _81 + _72;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _111 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _113 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _432 = float3(_113, _111, _109);
    float3 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float3(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float3(0.0), isnan(_432))).xyz;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _105 * 0.586600005626678466796875;
    float _125 = fma(_107, 0.29890000820159912109375, _123);
    float _127 = fma(_103, 0.1143999993801116943359375, _125);
    float _129 = _127 * (-1.44269502162933349609375);
    float _131 = exp2(_129);
    float _133 = -_131;
    float _135 = _133 + 1.0;
    bool _139 = _135 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _141 = isnan(_135);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _147 = _143 || _145;
    float _149 = 0.0;
    float _151 = _107;
    float _153 = _103;
    float _155 = _76;
    float _157 = _62;
    float _159 = _131;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _161 = _149;
    if (_147)
    {
        float _163 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _165 = _135 + _163;
        _151 = _165;
    }
    float _167 = _151;
    float _169 = _167;
    if (_147)
    {
        float _171 = -_161;
        float _173 = _171 + 1.00000095367431640625;
        _153 = _173;
    }
    float _175 = _153;
    float _177 = _95;
    if (_147)
    {
        float _179 = 1.0 / _175;
        _177 = _179;
    }
    float _181 = _177;
    if (_147)
    {
        float _183 = _167 * _181;
        _155 = _183;
    }
    float _185 = _155;
    float _187 = _185;
    if (_147)
    {
        float _189 = -_161;
        float _191 = _189 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _169 = _191;
    }
    float _193 = _169;
    float _195 = _193;
    if (_147)
    {
        float _197 = -_185;
        float _199 = _197 + 1.0;
        _157 = _199;
    }
    float _201 = _157;
    if (_147)
    {
        float _203 = _193 * _181;
        _195 = _203;
    }
    float _205 = _195;
    float _207 = _205;
    if (_147)
    {
        float _209 = _205 + (-1.0);
        _159 = _209;
    }
    float _211 = _159;
    float _213 = _201;
    float _215 = _211;
    if (_147)
    {
        float _217 = abs(_201);
        float _219 = log2(_217);
        _213 = _219;
    }
    float _221 = _213;
    if (_147)
    {
        float _223 = _205 * _185;
        _187 = _223;
    }
    float _225 = _187;
    float _227 = _225;
    if (!_147)
    {
        _207 = _135;
    }
    float _229 = _207;
    float _231 = 0.0;
    float _233 = _229;
    if (_147)
    {
        float _235 = _221 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _231 = _235;
    }
    float _237 = _231;
    float _239 = _237;
    if (_147)
    {
        float _241 = exp2(_237);
        _239 = _241;
    }
    float _243 = _239;
    if (_147)
    {
        float _245 = fma(_211, _243, 1.0);
        _215 = _245;
    }
    float _247 = _215;
    float _249 = _161;
    if (_147)
    {
        float _251 = 1.0 / _247;
        _249 = _251;
    }
    float _253 = _249;
    if (_147)
    {
        float _255 = _225 * _253;
        _227 = _255;
    }
    float _257 = _227;
    if (_147)
    {
        float _259 = fma(_175, _257, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _233 = _259;
    }
    float _261 = _233;
    float _263 = -_135;
    float _265 = _263 + _261;
    float _267 = _265 + 1.0;
    float _269 = abs(_267);
    float _271 = log2(_269);
    float _273 = _271 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _275 = exp2(_273);
    float _277 = _119 * 0.586600005626678466796875;
    float _279 = fma(_117, 0.29890000820159912109375, _277);
    float _281 = fma(_121, 0.1143999993801116943359375, _279);
    float _283 = spvFAdd(_281, 9.9999999747524270787835121154785e-07);
    float _285 = 1.0 / _283;
    float _287 = fma(_117, _285, -1.0);
    float _289 = fma(_119, _285, -1.0);
    float _291 = fma(_121, _285, -1.0);
    float _293 = fma(_275, _287, 1.0);
    float _295 = fma(_275, _289, 1.0);
    float _297 = fma(_275, _291, 1.0);
    float _299 = _293 * _261;
    float _301 = _295 * _261;
    float _303 = _297 * _261;
    float _305 = precise::max(0.0, _299);
    float _307 = precise::max(0.0, _301);
    float _309 = precise::max(0.0, _303);
    float _311 = precise::min(_305, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _313 = precise::min(_307, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _315 = precise::min(_309, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _311;
    out.m_41.y = _313;
    out.m_41.z = _315;
    out.m_41.w = _87;
    return out;
}

