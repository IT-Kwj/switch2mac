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
    float2 _373 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_373, float2(0.0), isnan(_373))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _390 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = _83 + _74;
    float _99 = _81 + _72;
    float _101 = _85 + _76;
    float _103 = _97 * _95;
    float _105 = _99 * _95;
    float _107 = _101 * _95;
    float _109 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _111 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _113 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _456 = float3(_111, _109, _113);
    float3 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_456, float3(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_456, float3(0.0), isnan(_456))).xyz;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _103 * 0.586600005626678466796875;
    float _125 = fma(_105, 0.29890000820159912109375, _123);
    float _127 = fma(_107, 0.1143999993801116943359375, _125);
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
    float _151 = _105;
    float _153 = _113;
    float _155 = _95;
    float _157 = _107;
    float _159 = _131;
    float _161 = _62;
    if (_147)
    {
        _149 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _163 = _149;
    if (_147)
    {
        float _165 = -_163;
        float _167 = _165 + 1.00000095367431640625;
        _151 = _167;
    }
    float _169 = _151;
    float _171 = 0.0;
    if (_147)
    {
        float _173 = 1.0 / _169;
        _171 = _173;
    }
    float _175 = _171;
    if (_147)
    {
        float _177 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _179 = _135 + _177;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = _181;
    if (_147)
    {
        float _185 = _181 * _175;
        _155 = _185;
    }
    float _187 = _155;
    float _189 = _187;
    if (_147)
    {
        float _191 = -_163;
        float _193 = _191 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _183 = _193;
    }
    float _195 = _183;
    float _197 = _195;
    if (_147)
    {
        float _199 = -_187;
        float _201 = _199 + 1.0;
        _157 = _201;
    }
    float _203 = _157;
    if (_147)
    {
        float _205 = _195 * _175;
        _197 = _205;
    }
    float _207 = _197;
    float _209 = _207;
    if (_147)
    {
        float _211 = _207 + (-1.0);
        _159 = _211;
    }
    float _213 = _159;
    float _215 = _203;
    float _217 = _213;
    if (_147)
    {
        float _219 = abs(_203);
        float _221 = log2(_219);
        _215 = _221;
    }
    float _223 = _215;
    if (_147)
    {
        float _225 = _207 * _187;
        _209 = _225;
    }
    float _227 = _209;
    float _229 = _227;
    if (_147)
    {
        float _231 = _223 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _161 = _231;
    }
    float _233 = _161;
    float _235 = _233;
    if (_147)
    {
        float _237 = exp2(_233);
        _235 = _237;
    }
    float _239 = _235;
    if (_147)
    {
        float _241 = fma(_213, _239, 1.0);
        _217 = _241;
    }
    float _243 = _217;
    float _245 = _243;
    if (_147)
    {
        float _247 = 1.0 / _243;
        _245 = _247;
    }
    float _249 = _245;
    if (_147)
    {
        float _251 = _227 * _249;
        _189 = _251;
    }
    float _253 = _189;
    if (!_147)
    {
        _229 = _135;
    }
    float _255 = _229;
    float _257 = _255;
    if (_147)
    {
        float _259 = fma(_169, _253, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _257 = _259;
    }
    float _261 = _257;
    float _263 = abs(_119);
    float _265 = log2(_263);
    float _267 = abs(_117);
    float _269 = log2(_267);
    float _271 = abs(_121);
    float _273 = log2(_271);
    float _275 = _265 * 0.4545454680919647216796875;
    float _277 = _269 * 0.4545454680919647216796875;
    float _279 = exp2(_275);
    float _281 = -_135;
    float _283 = _281 + _261;
    float _285 = _283 + 1.0;
    float _287 = _273 * 0.4545454680919647216796875;
    float _289 = exp2(_277);
    float _291 = exp2(_287);
    float _293 = _279 * 0.586600005626678466796875;
    float _295 = abs(_285);
    float _297 = log2(_295);
    float _299 = fma(_289, 0.29890000820159912109375, _293);
    float _301 = fma(_291, 0.1143999993801116943359375, _299);
    float _303 = spvFAdd(_301, 9.9999999747524270787835121154785e-07);
    float _305 = _297 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _307 = 1.0 / _303;
    float _309 = exp2(_305);
    float _311 = fma(_289, _307, -1.0);
    float _313 = fma(_279, _307, -1.0);
    float _315 = fma(_291, _307, -1.0);
    float _317 = fma(_309, _311, 1.0);
    float _319 = fma(_309, _313, 1.0);
    float _321 = fma(_309, _315, 1.0);
    float _323 = _317 * _261;
    float _325 = _319 * _261;
    float _327 = _321 * _261;
    float _329 = precise::max(0.0, _323);
    float _331 = precise::max(0.0, _325);
    float _333 = precise::max(0.0, _327);
    float _335 = precise::min(_329, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _337 = precise::min(_331, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _339 = precise::min(_333, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _335;
    out.m_41.y = _337;
    out.m_41.z = _339;
    out.m_41.w = _87;
    return out;
}

