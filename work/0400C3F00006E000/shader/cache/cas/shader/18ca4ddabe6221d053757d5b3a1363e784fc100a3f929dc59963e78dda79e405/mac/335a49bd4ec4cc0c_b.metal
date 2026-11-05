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
    float2 _367 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_367, float2(0.0), isnan(_367))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _384 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _81 + _72;
    float _99 = _85 + _76;
    float _101 = _83 + _74;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = spvFAdd(_103, 1.0);
    float _111 = spvFAdd(_105, 1.0);
    float _113 = spvFAdd(_107, 1.0);
    float _115 = 1.0 / _109;
    float _117 = 1.0 / _111;
    float _119 = 1.0 / _113;
    float _121 = _103 * _115;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _125 = _105 * _117;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _129 = _107 * _119;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _471 = float3(_123, _131, _127);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_471, float3(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_471, float3(0.0), isnan(_471))).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _107 * 0.586600005626678466796875;
    float _143 = fma(_103, 0.29890000820159912109375, _141);
    float _145 = fma(_105, 0.1143999993801116943359375, _143);
    float _147 = _145 * (-1.44269502162933349609375);
    float _149 = exp2(_147);
    float _151 = -_149;
    float _153 = _151 + 1.0;
    bool _157 = _153 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _159 = isnan(_153);
    bool _161 = _157 || _159;
    bool _163 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _165 = _161 || _163;
    float _167 = _103;
    float _169 = _119;
    float _171 = _105;
    float _173 = _115;
    float _175 = _129;
    float _177 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _179 = _167;
    float _181 = _179;
    if (_165)
    {
        float _183 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _185 = _153 + _183;
        _169 = _185;
    }
    float _187 = _169;
    float _189 = _187;
    if (_165)
    {
        float _191 = -_179;
        float _193 = _191 + 1.00000095367431640625;
        _171 = _193;
    }
    float _195 = _171;
    float _197 = 0.0;
    if (_165)
    {
        float _199 = 1.0 / _195;
        _197 = _199;
    }
    float _201 = _197;
    if (_165)
    {
        float _203 = _187 * _201;
        _173 = _203;
    }
    float _205 = _173;
    float _207 = _205;
    if (_165)
    {
        float _209 = -_179;
        float _211 = _209 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _189 = _211;
    }
    float _213 = _189;
    float _215 = _213;
    if (_165)
    {
        float _217 = -_205;
        float _219 = _217 + 1.0;
        _175 = _219;
    }
    float _221 = _175;
    if (_165)
    {
        float _223 = _213 * _201;
        _215 = _223;
    }
    float _225 = _215;
    float _227 = _225;
    if (_165)
    {
        float _229 = _225 + (-1.0);
        _181 = _229;
    }
    float _231 = _181;
    float _233 = _221;
    float _235 = _231;
    if (_165)
    {
        float _237 = abs(_221);
        float _239 = log2(_237);
        _233 = _239;
    }
    float _241 = _233;
    if (_165)
    {
        float _243 = _225 * _205;
        _207 = _243;
    }
    float _245 = _207;
    float _247 = _245;
    if (!_165)
    {
        _227 = _153;
    }
    float _249 = _227;
    float _251 = _249;
    if (_165)
    {
        float _253 = _241 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _177 = _253;
    }
    float _255 = _177;
    float _257 = _149;
    if (_165)
    {
        float _259 = exp2(_255);
        _257 = _259;
    }
    float _261 = _257;
    if (_165)
    {
        float _263 = fma(_231, _261, 1.0);
        _235 = _263;
    }
    float _265 = _235;
    float _267 = _265;
    if (_165)
    {
        float _269 = 1.0 / _265;
        _267 = _269;
    }
    float _271 = _267;
    if (_165)
    {
        float _273 = _245 * _271;
        _247 = _273;
    }
    float _275 = _247;
    if (_165)
    {
        float _277 = fma(_195, _275, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _251 = _277;
    }
    float _279 = _251;
    float _281 = -_153;
    float _283 = _281 + _279;
    float _285 = _283 + 1.0;
    float _287 = abs(_285);
    float _289 = log2(_287);
    float _291 = _289 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _293 = exp2(_291);
    float _295 = _137 * 0.586600005626678466796875;
    float _297 = fma(_135, 0.29890000820159912109375, _295);
    float _299 = fma(_139, 0.1143999993801116943359375, _297);
    float _301 = spvFAdd(_299, 9.9999999747524270787835121154785e-07);
    float _303 = 1.0 / _301;
    float _305 = fma(_135, _303, -1.0);
    float _307 = fma(_137, _303, -1.0);
    float _309 = fma(_139, _303, -1.0);
    float _311 = fma(_293, _305, 1.0);
    float _313 = fma(_293, _307, 1.0);
    float _315 = fma(_293, _309, 1.0);
    float _317 = _311 * _279;
    float _319 = _313 * _279;
    float _321 = _315 * _279;
    float _323 = precise::max(0.0, _317);
    float _325 = precise::max(0.0, _319);
    float _327 = precise::max(0.0, _321);
    float _329 = precise::min(_323, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _331 = precise::min(_325, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _333 = precise::min(_327, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _329;
    out.m_41.y = _331;
    out.m_41.z = _333;
    out.m_41.w = _87;
    return out;
}

