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
    float2 _457 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_457, float2(0.0), isnan(_457))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _474 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).xyzw;
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
    float _129 = _125 * _95;
    float _131 = _85 + _119;
    float _133 = fma(_129, 0.29890000820159912109375, _127);
    float _135 = _129 * (-1.44269502162933349609375);
    float _137 = _123 * (-1.44269502162933349609375);
    float _139 = _131 * _95;
    float _141 = fma(_139, 0.1143999993801116943359375, _133);
    float _143 = _139 * (-1.44269502162933349609375);
    float _145 = exp2(_135);
    float _147 = _141 * (-1.44269502162933349609375);
    float _149 = exp2(_147);
    float _151 = 1.0 / _141;
    float _153 = -_145;
    float _155 = _153 + 1.0;
    float _157 = exp2(_143);
    float _159 = -_149;
    float _161 = _159 + 1.0;
    float _163 = exp2(_137);
    float _165 = _161 * _151;
    float _167 = _129 * _165;
    float _169 = _123 * _165;
    float _171 = _139 * _165;
    float _173 = -_157;
    float _175 = _173 + 1.0;
    float _177 = _161 * _161;
    float _179 = -_167;
    float _181 = _155 + _179;
    float _183 = -_171;
    float _185 = _175 + _183;
    float _187 = fma(_177, _181, _167);
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = -_163;
    float _193 = _191 + 1.0;
    float _195 = fma(_177, _185, _171);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = -_169;
    float _201 = _193 + _199;
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _205 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _207 = fma(_177, _201, _169);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _664 = float3(_205, _211, _203);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_664, float3(0.0), isnan(_664))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_664, float3(0.0), isnan(_664))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    bool _223 = _161 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _225 = isnan(_161);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _231 = _227 || _229;
    float _233 = _169;
    float _235 = _209;
    float _237 = _147;
    float _239 = _171;
    float _241 = _167;
    float _243 = _203;
    if (_231)
    {
        _233 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _245 = _233;
    float _247 = _245;
    if (_231)
    {
        float _249 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _251 = _161 + _249;
        _235 = _251;
    }
    float _253 = _235;
    if (_231)
    {
        float _255 = -_245;
        float _257 = _255 + 1.00000095367431640625;
        _237 = _257;
    }
    float _259 = _237;
    float _261 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    if (_231)
    {
        float _263 = 1.0 / _259;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = _265;
    if (_231)
    {
        float _269 = _253 * _265;
        _239 = _269;
    }
    float _271 = _239;
    float _273 = _271;
    if (_231)
    {
        float _275 = -_271;
        float _277 = _275 + 1.0;
        _241 = _277;
    }
    float _279 = _241;
    float _281 = _253;
    if (_231)
    {
        float _283 = abs(_279);
        float _285 = log2(_283);
        _281 = _285;
    }
    float _287 = _281;
    if (_231)
    {
        float _289 = -_245;
        float _291 = _289 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _243 = _291;
    }
    float _293 = _243;
    float _295 = _293;
    if (_231)
    {
        float _297 = _293 * _265;
        _267 = _297;
    }
    float _299 = _267;
    float _301 = _299;
    if (_231)
    {
        float _303 = _299 + (-1.0);
        _295 = _303;
    }
    float _305 = _295;
    float _307 = _305;
    if (_231)
    {
        float _309 = _299 * _271;
        _273 = _309;
    }
    float _311 = _273;
    if (!_231)
    {
        _301 = _161;
    }
    float _313 = _301;
    float _315 = _287;
    float _317 = _313;
    if (_231)
    {
        float _319 = _287 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _315 = _319;
    }
    float _321 = _315;
    float _323 = _321;
    if (_231)
    {
        float _325 = exp2(_321);
        _323 = _325;
    }
    float _327 = _323;
    if (_231)
    {
        float _329 = fma(_305, _327, 1.0);
        _307 = _329;
    }
    float _331 = _307;
    float _333 = _331;
    if (_231)
    {
        float _335 = 1.0 / _331;
        _333 = _335;
    }
    float _337 = _333;
    if (_231)
    {
        float _339 = _311 * _337;
        _247 = _339;
    }
    float _341 = _247;
    if (_231)
    {
        float _343 = fma(_259, _341, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _317 = _343;
    }
    float _345 = _317;
    float _347 = -_161;
    float _349 = _347 + _345;
    float _351 = _349 + 1.0;
    float _353 = abs(_351);
    float _355 = log2(_353);
    float _357 = abs(_217);
    float _359 = log2(_357);
    float _361 = abs(_215);
    float _363 = log2(_361);
    float _365 = abs(_219);
    float _367 = log2(_365);
    float _369 = _359 * 2.2000000476837158203125;
    float _371 = _363 * 2.2000000476837158203125;
    float _373 = exp2(_369);
    float _375 = _355 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _377 = _367 * 2.2000000476837158203125;
    float _379 = exp2(_371);
    float _381 = exp2(_377);
    float _383 = _373 * 0.586600005626678466796875;
    float _385 = fma(_379, 0.29890000820159912109375, _383);
    float _387 = exp2(_375);
    float _389 = fma(_381, 0.1143999993801116943359375, _385);
    float _391 = spvFAdd(_389, 9.9999999747524270787835121154785e-07);
    float _393 = 1.0 / _391;
    float _395 = fma(_373, _393, -1.0);
    float _397 = fma(_379, _393, -1.0);
    float _399 = fma(_381, _393, -1.0);
    float _401 = fma(_387, _395, 1.0);
    float _403 = fma(_387, _397, 1.0);
    float _405 = fma(_387, _399, 1.0);
    float _407 = _401 * _345;
    float _409 = _403 * _345;
    float _411 = _405 * _345;
    float _413 = precise::max(0.0, _407);
    float _415 = precise::max(0.0, _409);
    float _417 = precise::max(0.0, _411);
    float _419 = precise::min(_415, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _421 = precise::min(_413, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _423 = precise::min(_417, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _419;
    out.m_41.y = _421;
    out.m_41.z = _423;
    out.m_41.w = _87;
    return out;
}

