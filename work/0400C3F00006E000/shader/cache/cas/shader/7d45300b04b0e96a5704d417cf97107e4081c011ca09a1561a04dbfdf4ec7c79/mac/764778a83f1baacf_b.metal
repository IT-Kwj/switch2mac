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
    float _97 = abs(_74);
    float _99 = log2(_97);
    float _101 = abs(_76);
    float _103 = log2(_101);
    float _105 = abs(_72);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = exp2(_109);
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_111);
    float _119 = exp2(_115);
    float _121 = _83 + _113;
    float _123 = _121 * _95;
    float _125 = _85 + _117;
    float _127 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _129 = _125 * _95;
    float _131 = _81 + _119;
    float _133 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _135 = _131 * _95;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _486 = float3(_137, _127, _133);
    float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_486, float3(0.0), isnan(_486))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_486, float3(0.0), isnan(_486))).xyz;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _123 * 0.586600005626678466796875;
    float _149 = fma(_135, 0.29890000820159912109375, _147);
    float _151 = fma(_129, 0.1143999993801116943359375, _149);
    float _153 = _151 * (-1.44269502162933349609375);
    float _155 = exp2(_153);
    float _157 = -_155;
    float _159 = _157 + 1.0;
    bool _163 = _159 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _171 = _167 || _169;
    float _173 = _129;
    float _175 = _147;
    float _177 = _107;
    float _179 = _119;
    float _181 = _103;
    float _183 = _113;
    if (_171)
    {
        _173 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _185 = _173;
    float _187 = _185;
    if (_171)
    {
        float _189 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _191 = _159 + _189;
        _175 = _191;
    }
    float _193 = _175;
    float _195 = _193;
    if (_171)
    {
        float _197 = -_185;
        float _199 = _197 + 1.00000095367431640625;
        _177 = _199;
    }
    float _201 = _177;
    float _203 = 0.0;
    if (_171)
    {
        float _205 = 1.0 / _201;
        _203 = _205;
    }
    float _207 = _203;
    if (_171)
    {
        float _209 = _193 * _207;
        _179 = _209;
    }
    float _211 = _179;
    float _213 = _211;
    if (_171)
    {
        float _215 = -_185;
        float _217 = _215 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _195 = _217;
    }
    float _219 = _195;
    float _221 = _219;
    if (_171)
    {
        float _223 = -_211;
        float _225 = _223 + 1.0;
        _181 = _225;
    }
    float _227 = _181;
    if (_171)
    {
        float _229 = _219 * _207;
        _187 = _229;
    }
    float _231 = _187;
    float _233 = _231;
    if (_171)
    {
        float _235 = _231 + (-1.0);
        _221 = _235;
    }
    float _237 = _221;
    float _239 = _227;
    float _241 = _237;
    if (_171)
    {
        float _243 = abs(_227);
        float _245 = log2(_243);
        _239 = _245;
    }
    float _247 = _239;
    if (_171)
    {
        float _249 = _231 * _211;
        _213 = _249;
    }
    float _251 = _213;
    float _253 = _251;
    if (!_171)
    {
        _233 = _159;
    }
    float _255 = _233;
    float _257 = _255;
    if (_171)
    {
        float _259 = _247 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _183 = _259;
    }
    float _261 = _183;
    float _263 = _117;
    if (_171)
    {
        float _265 = exp2(_261);
        _263 = _265;
    }
    float _267 = _263;
    if (_171)
    {
        float _269 = fma(_237, _267, 1.0);
        _241 = _269;
    }
    float _271 = _241;
    float _273 = _271;
    if (_171)
    {
        float _275 = 1.0 / _271;
        _273 = _275;
    }
    float _277 = _273;
    if (_171)
    {
        float _279 = _251 * _277;
        _253 = _279;
    }
    float _281 = _253;
    if (_171)
    {
        float _283 = fma(_201, _281, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _257 = _283;
    }
    float _285 = _257;
    float _287 = -_159;
    float _289 = _287 + _285;
    float _291 = _289 + 1.0;
    float _293 = abs(_291);
    float _295 = log2(_293);
    float _297 = _143 * 0.586600005626678466796875;
    float _299 = fma(_141, 0.29890000820159912109375, _297);
    float _301 = _295 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _303 = fma(_145, 0.1143999993801116943359375, _299);
    float _305 = exp2(_301);
    float _307 = spvFAdd(_303, 9.9999999747524270787835121154785e-07);
    float _309 = 1.0 / _307;
    float _311 = fma(_141, _309, -1.0);
    float _313 = fma(_143, _309, -1.0);
    float _315 = fma(_145, _309, -1.0);
    float _317 = fma(_305, _311, 1.0);
    float _319 = fma(_305, _313, 1.0);
    float _321 = fma(_305, _315, 1.0);
    float _323 = _317 * _285;
    float _325 = _319 * _285;
    float _327 = _321 * _285;
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

