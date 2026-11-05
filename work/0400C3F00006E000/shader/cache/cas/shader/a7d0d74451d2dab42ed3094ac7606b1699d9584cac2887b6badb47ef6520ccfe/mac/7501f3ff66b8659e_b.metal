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
    float2 _433 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_433, float2(0.0), isnan(_433))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _450 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_450, float2(0.0), isnan(_450))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_450, float2(0.0), isnan(_450))).xyzw;
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
    float _101 = abs(_72);
    float _103 = log2(_101);
    float _105 = abs(_76);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = exp2(_109);
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_111);
    float _119 = exp2(_115);
    float _121 = _83 + _113;
    float _123 = _121 * _95;
    float _125 = _81 + _117;
    float _127 = _123 * 0.586600005626678466796875;
    float _129 = _123 * (-1.44269502162933349609375);
    float _131 = _125 * _95;
    float _133 = _85 + _119;
    float _135 = fma(_131, 0.29890000820159912109375, _127);
    float _137 = _131 * (-1.44269502162933349609375);
    float _139 = exp2(_129);
    float _141 = _133 * _95;
    float _143 = fma(_141, 0.1143999993801116943359375, _135);
    float _145 = _141 * (-1.44269502162933349609375);
    float _147 = exp2(_137);
    float _149 = _143 * (-1.44269502162933349609375);
    float _151 = exp2(_149);
    float _153 = 1.0 / _143;
    float _155 = -_147;
    float _157 = _155 + 1.0;
    float _159 = exp2(_145);
    float _161 = -_151;
    float _163 = _161 + 1.0;
    float _165 = -_139;
    float _167 = _165 + 1.0;
    float _169 = _163 * _153;
    float _171 = _131 * _169;
    float _173 = _123 * _169;
    float _175 = _141 * _169;
    float _177 = _163 * _163;
    float _179 = -_159;
    float _181 = _179 + 1.0;
    float _183 = -_171;
    float _185 = _157 + _183;
    float _187 = -_173;
    float _189 = _167 + _187;
    float _191 = -_175;
    float _193 = _181 + _191;
    float _195 = fma(_177, _185, _171);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = fma(_177, _189, _173);
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = fma(_177, _193, _175);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _209 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _211 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _640 = float3(_207, _209, _211);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_640, float3(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_640, float3(0.0), isnan(_640))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    bool _223 = _163 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _225 = isnan(_163);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _231 = _227 || _229;
    float _233 = 0.0;
    float _235 = _201;
    float _237 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _239 = _149;
    float _241 = _159;
    float _243 = _211;
    float _245 = _153;
    if (_231)
    {
        _233 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _247 = _233;
    float _249 = _247;
    if (_231)
    {
        float _251 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _253 = _163 + _251;
        _235 = _253;
    }
    float _255 = _235;
    float _257 = _255;
    if (_231)
    {
        float _259 = -_247;
        float _261 = _259 + 1.00000095367431640625;
        _237 = _261;
    }
    float _263 = _237;
    float _265 = _171;
    if (_231)
    {
        float _267 = 1.0 / _263;
        _265 = _267;
    }
    float _269 = _265;
    if (_231)
    {
        float _271 = _255 * _269;
        _239 = _271;
    }
    float _273 = _239;
    float _275 = _273;
    if (_231)
    {
        float _277 = -_247;
        float _279 = _277 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _257 = _279;
    }
    float _281 = _257;
    float _283 = _281;
    if (_231)
    {
        float _285 = -_273;
        float _287 = _285 + 1.0;
        _241 = _287;
    }
    float _289 = _241;
    float _291 = _289;
    if (_231)
    {
        float _293 = abs(_289);
        float _295 = log2(_293);
        _291 = _295;
    }
    float _297 = _291;
    if (_231)
    {
        float _299 = _281 * _269;
        _243 = _299;
    }
    float _301 = _243;
    float _303 = _301;
    if (_231)
    {
        float _305 = _301 + (-1.0);
        _283 = _305;
    }
    float _307 = _283;
    float _309 = _307;
    if (_231)
    {
        float _311 = _301 * _273;
        _275 = _311;
    }
    float _313 = _275;
    if (!_231)
    {
        _303 = _163;
    }
    float _315 = _303;
    float _317 = _315;
    if (_231)
    {
        float _319 = _297 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _245 = _319;
    }
    float _321 = _245;
    float _323 = _175;
    if (_231)
    {
        float _325 = exp2(_321);
        _323 = _325;
    }
    float _327 = _323;
    if (_231)
    {
        float _329 = fma(_307, _327, 1.0);
        _309 = _329;
    }
    float _331 = _309;
    float _333 = _331;
    if (_231)
    {
        float _335 = 1.0 / _331;
        _333 = _335;
    }
    float _337 = _333;
    if (_231)
    {
        float _339 = _313 * _337;
        _249 = _339;
    }
    float _341 = _249;
    if (_231)
    {
        float _343 = fma(_263, _341, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _317 = _343;
    }
    float _345 = _317;
    float _347 = -_163;
    float _349 = _347 + _345;
    float _351 = _349 + 1.0;
    float _353 = abs(_351);
    float _355 = log2(_353);
    float _357 = _217 * 0.586600005626678466796875;
    float _359 = fma(_215, 0.29890000820159912109375, _357);
    float _361 = fma(_219, 0.1143999993801116943359375, _359);
    float _363 = spvFAdd(_361, 9.9999999747524270787835121154785e-07);
    float _365 = _355 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _367 = 1.0 / _363;
    float _369 = exp2(_365);
    float _371 = fma(_215, _367, -1.0);
    float _373 = fma(_217, _367, -1.0);
    float _375 = fma(_219, _367, -1.0);
    float _377 = fma(_369, _371, 1.0);
    float _379 = fma(_369, _373, 1.0);
    float _381 = fma(_369, _375, 1.0);
    float _383 = _377 * _345;
    float _385 = _379 * _345;
    float _387 = _381 * _345;
    float _389 = precise::max(0.0, _383);
    float _391 = precise::max(0.0, _385);
    float _393 = precise::max(0.0, _387);
    float _395 = precise::min(_389, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _397 = precise::min(_391, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _399 = precise::min(_393, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _395;
    out.m_41.y = _397;
    out.m_41.z = _399;
    out.m_41.w = _87;
    return out;
}

