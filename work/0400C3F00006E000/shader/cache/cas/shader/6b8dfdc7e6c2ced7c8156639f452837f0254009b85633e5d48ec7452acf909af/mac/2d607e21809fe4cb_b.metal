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
    float2 _475 = float2(_64, _66);
    float3 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_475, float2(0.0), isnan(_475))).xyz;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float2 _492 = float2(_64, _66);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).xyzw;
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
    float _143 = _141 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _145 = _83 + _119;
    bool _147 = _139 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _149 = isnan(_139);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _155 = _151 || _153;
    float _157 = _145 * _95;
    bool _159 = !_137;
    float _161 = _159 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _163 = !_155;
    float _165 = _163 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _167 = !_155;
    float _169 = _167 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _171 = fma(_123, _143, _161);
    bool _173 = _157 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _175 = isnan(_157);
    bool _177 = _173 || _175;
    bool _179 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _181 = _177 || _179;
    float _183 = fma(_139, _165, _169);
    bool _185 = !_181;
    float _187 = _185 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _189 = 1.0 / _171;
    bool _191 = !_181;
    float _193 = _191 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _195 = fma(_157, _187, _193);
    bool _197 = !_155;
    float _199 = _197 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _201 = 1.0 / _183;
    bool _203 = !_137;
    float _205 = _203 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _207 = !_137;
    float _209 = _207 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _211 = !_181;
    float _213 = _211 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _215 = !_181;
    float _217 = _215 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _219 = 1.0 / _195;
    bool _221 = !_155;
    float _223 = _221 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _225 = fma(_123, _209, _205);
    float _227 = fma(_157, _213, _217);
    float _229 = fma(_139, _223, _199);
    float _231 = _225 * _189;
    float _233 = _229 * _201;
    float _235 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _237 = _227 * _219;
    float _239 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _241 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _771 = float3(_239, _241, _235);
    float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_771, float3(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_771, float3(0.0), isnan(_771))).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = _157 * 0.586600005626678466796875;
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
    float _275 = _139;
    float _277 = _123;
    float _279 = _157;
    float _281 = _235;
    float _283 = _201;
    float _285 = _189;
    if (_273)
    {
        _275 = (*spvDescriptorSet0.fp_c3)._m0[8].y;
    }
    float _287 = _275;
    float _289 = _287;
    if (_273)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _293 = _263 + _291;
        _277 = _293;
    }
    float _295 = _277;
    float _297 = _295;
    if (_273)
    {
        float _299 = -_287;
        float _301 = _299 + 1.00000095367431640625;
        _279 = _301;
    }
    float _303 = _279;
    float _305 = _199;
    if (_273)
    {
        float _307 = 1.0 / _303;
        _305 = _307;
    }
    float _309 = _305;
    if (_273)
    {
        float _311 = _295 * _309;
        _281 = _311;
    }
    float _313 = _281;
    float _315 = _313;
    if (_273)
    {
        float _317 = -_287;
        float _319 = _317 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        _297 = _319;
    }
    float _321 = _297;
    float _323 = _321;
    if (_273)
    {
        float _325 = -_313;
        float _327 = _325 + 1.0;
        _283 = _327;
    }
    float _329 = _283;
    if (_273)
    {
        float _331 = _321 * _309;
        _289 = _331;
    }
    float _333 = _289;
    float _335 = _333;
    if (_273)
    {
        float _337 = _333 + (-1.0);
        _323 = _337;
    }
    float _339 = _323;
    float _341 = _329;
    float _343 = _339;
    if (_273)
    {
        float _345 = abs(_329);
        float _347 = log2(_345);
        _341 = _347;
    }
    float _349 = _341;
    if (_273)
    {
        float _351 = _333 * _313;
        _315 = _351;
    }
    float _353 = _315;
    float _355 = _353;
    if (!_273)
    {
        _335 = _263;
    }
    float _357 = _335;
    float _359 = _357;
    if (_273)
    {
        float _361 = _349 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        _285 = _361;
    }
    float _363 = _285;
    float _365 = _259;
    if (_273)
    {
        float _367 = exp2(_363);
        _365 = _367;
    }
    float _369 = _365;
    if (_273)
    {
        float _371 = fma(_339, _369, 1.0);
        _343 = _371;
    }
    float _373 = _343;
    float _375 = _373;
    if (_273)
    {
        float _377 = 1.0 / _373;
        _375 = _377;
    }
    float _379 = _375;
    if (_273)
    {
        float _381 = _353 * _379;
        _355 = _381;
    }
    float _383 = _355;
    if (_273)
    {
        float _385 = fma(_303, _383, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _359 = _385;
    }
    float _387 = _359;
    float _389 = -_263;
    float _391 = _389 + _387;
    float _393 = _391 + 1.0;
    float _395 = abs(_393);
    float _397 = log2(_395);
    float _399 = _247 * 0.586600005626678466796875;
    float _401 = fma(_245, 0.29890000820159912109375, _399);
    float _403 = _397 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _405 = fma(_249, 0.1143999993801116943359375, _401);
    float _407 = exp2(_403);
    float _409 = spvFAdd(_405, 9.9999999747524270787835121154785e-07);
    float _411 = 1.0 / _409;
    float _413 = fma(_245, _411, -1.0);
    float _415 = fma(_247, _411, -1.0);
    float _417 = fma(_249, _411, -1.0);
    float _419 = fma(_407, _413, 1.0);
    float _421 = fma(_407, _415, 1.0);
    float _423 = fma(_407, _417, 1.0);
    float _425 = _419 * _387;
    float _427 = _421 * _387;
    float _429 = _423 * _387;
    float _431 = precise::max(0.0, _425);
    float _433 = precise::max(0.0, _427);
    float _435 = precise::max(0.0, _429);
    float _437 = precise::min(_431, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _439 = precise::min(_433, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _441 = precise::min(_435, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_41.x = _437;
    out.m_41.y = _439;
    out.m_41.z = _441;
    out.m_41.w = _87;
    return out;
}

