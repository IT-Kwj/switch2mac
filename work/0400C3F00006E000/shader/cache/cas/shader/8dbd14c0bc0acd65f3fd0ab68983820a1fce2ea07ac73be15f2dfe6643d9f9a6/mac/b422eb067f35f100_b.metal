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
    float2 _499 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _516 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = in.m_38.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _62 * _93;
    float _97 = abs(_72);
    float _99 = log2(_97);
    float _101 = abs(_76);
    float _103 = log2(_101);
    float _105 = abs(_74);
    float _107 = log2(_105);
    float _109 = _99 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _111 = _103 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _113 = exp2(_109);
    float _115 = _107 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _117 = exp2(_111);
    float _119 = exp2(_115);
    float _121 = _81 + _113;
    float _123 = _121 * _95;
    float _125 = _85 + _117;
    bool _129 = _123 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _131 = isnan(_123);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _137 = _133 || _135;
    float _139 = _125 * _95;
    bool _141 = !_137;
    float _143 = _141 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _145 = _83 + _119;
    bool _147 = !_137;
    float _149 = _147 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _151 = _139 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _153 = isnan(_139);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _159 = _155 || _157;
    float _161 = _145 * _95;
    float _163 = fma(_123, _149, _143);
    bool _165 = !_159;
    float _167 = _165 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _169 = _161 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _171 = isnan(_161);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _177 = _173 || _175;
    float _179 = 1.0 / _163;
    bool _181 = !_159;
    float _183 = _181 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _185 = !_177;
    float _187 = _185 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _189 = !_177;
    float _191 = _189 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _193 = fma(_139, _167, _183);
    bool _195 = !_159;
    float _197 = _195 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _199 = fma(_161, _187, _191);
    float _201 = 1.0 / _193;
    bool _203 = !_137;
    float _205 = _203 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _207 = !_177;
    float _209 = _207 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _211 = !_137;
    float _213 = _211 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _215 = !_159;
    float _217 = _215 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _219 = 1.0 / _199;
    bool _221 = !_177;
    float _223 = _221 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _225 = fma(_123, _205, _213);
    float _227 = fma(_139, _217, _197);
    float _229 = fma(_161, _209, _223);
    float _231 = _225 * _179;
    float _233 = _227 * _201;
    float _235 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _237 = _229 * _219;
    float _239 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _241 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _795 = float3(_239, _241, _235);
    float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_795, float3(0.0), isnan(_795))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_795, float3(0.0), isnan(_795))).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = _161 * 0.586600005626678466796875;
    float _253 = fma(_123, 0.29890000820159912109375, _251);
    float _255 = fma(_139, 0.1143999993801116943359375, _253);
    float _257 = _255 * (-1.44269502162933349609375);
    float _259 = exp2(_257);
    float _261 = -_259;
    float _263 = _261 + 1.0;
    bool _265 = _263 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _267 = isnan(_263);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _273 = _269 || _271;
    float _275 = _223;
    float _277 = _255;
    float _279 = (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _281 = _259;
    float _283 = _237;
    float _285 = _193;
    if (_273)
    {
        _275 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _287 = _275;
    if (_273)
    {
        float _289 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _291 = _263 + _289;
        _277 = _291;
    }
    float _293 = _277;
    if (_273)
    {
        float _295 = -_287;
        float _297 = _295 + 1.00000095367431640625;
        _279 = _297;
    }
    float _299 = _279;
    if (_273)
    {
        float _301 = -_287;
        float _303 = _301 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _281 = _303;
    }
    float _305 = _281;
    float _307 = _161;
    float _309 = _305;
    if (_273)
    {
        float _311 = 1.0 / _299;
        _307 = _311;
    }
    float _313 = _307;
    float _315 = _313;
    if (_273)
    {
        float _317 = _293 * _313;
        _283 = _317;
    }
    float _319 = _283;
    float _321 = _319;
    if (_273)
    {
        float _323 = _305 * _313;
        _315 = _323;
    }
    float _325 = _315;
    float _327 = _325;
    if (_273)
    {
        float _329 = -_319;
        float _331 = _329 + 1.0;
        _285 = _331;
    }
    float _333 = _285;
    if (_273)
    {
        float _335 = _325 + (-1.0);
        _309 = _335;
    }
    float _337 = _309;
    float _339 = _337;
    if (_273)
    {
        float _341 = _325 * _319;
        _321 = _341;
    }
    float _343 = _321;
    float _345 = _343;
    if (!_273)
    {
        _327 = _263;
    }
    float _347 = _327;
    float _349 = _293;
    float _351 = _347;
    if (_273)
    {
        float _353 = abs(_333);
        float _355 = log2(_353);
        _349 = _355;
    }
    float _357 = _349;
    float _359 = _357;
    if (_273)
    {
        float _361 = _357 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _359 = _361;
    }
    float _363 = _359;
    float _365 = _363;
    if (_273)
    {
        float _367 = exp2(_363);
        _365 = _367;
    }
    float _369 = _365;
    if (_273)
    {
        float _371 = fma(_337, _369, 1.0);
        _339 = _371;
    }
    float _373 = _339;
    float _375 = _179;
    if (_273)
    {
        float _377 = 1.0 / _373;
        _375 = _377;
    }
    float _379 = _375;
    if (_273)
    {
        float _381 = _343 * _379;
        _345 = _381;
    }
    float _383 = _345;
    if (_273)
    {
        float _385 = fma(_299, _383, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _351 = _385;
    }
    float _387 = _351;
    float _389 = -_263;
    float _391 = _389 + _387;
    float _393 = _391 + 1.0;
    float _395 = abs(_393);
    float _397 = log2(_395);
    float _399 = abs(_247);
    float _401 = log2(_399);
    float _403 = abs(_245);
    float _405 = log2(_403);
    float _407 = abs(_249);
    float _409 = log2(_407);
    float _411 = _401 * 0.4545454680919647216796875;
    float _413 = _405 * 0.4545454680919647216796875;
    float _415 = exp2(_411);
    float _417 = _397 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _419 = _409 * 0.4545454680919647216796875;
    float _421 = exp2(_413);
    float _423 = exp2(_419);
    float _425 = _415 * 0.586600005626678466796875;
    float _427 = fma(_421, 0.29890000820159912109375, _425);
    float _429 = exp2(_417);
    float _431 = fma(_423, 0.1143999993801116943359375, _427);
    float _433 = spvFAdd(_431, 9.9999999747524270787835121154785e-07);
    float _435 = 1.0 / _433;
    float _437 = fma(_421, _435, -1.0);
    float _439 = fma(_415, _435, -1.0);
    float _441 = fma(_423, _435, -1.0);
    float _443 = fma(_429, _437, 1.0);
    float _445 = fma(_429, _439, 1.0);
    float _447 = fma(_429, _441, 1.0);
    float _449 = _443 * _387;
    float _451 = _445 * _387;
    float _453 = _447 * _387;
    float _455 = precise::max(0.0, _449);
    float _457 = precise::max(0.0, _451);
    float _459 = precise::max(0.0, _453);
    float _461 = precise::min(_455, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _463 = precise::min(_457, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _465 = precise::min(_459, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _461;
    out.m_41.y = _463;
    out.m_41.z = _465;
    out.m_41.w = _87;
    return out;
}

