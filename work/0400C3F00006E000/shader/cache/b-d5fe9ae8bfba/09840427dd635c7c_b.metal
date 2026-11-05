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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_22Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3153 = false;
    bool _1601 = false;
    bool _421 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_60.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_63.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_127);
        out.gl_Position.z = _3452;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_65.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_63.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_165);
        out.gl_Position.z = _3521;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_70.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_70.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_72.x;
    float _395 = in.m_72.y;
    out.m_74.x = _385;
    out.m_74.y = _387;
    out.m_74.z = _389;
    out.m_74.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _419;
    if (!_401)
    {
        float _403 = in.m_70.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_111);
        float _425 = 1.0 / _423;
        float _427 = _145 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_70.x;
    float _433 = in.m_70.y;
    float _435 = in.m_70.z;
    float _437 = in.m_70.w;
    float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _451 = _449 != 0;
    float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _461 = _459 != 0;
    float _463 = in.m_60.x;
    float _465 = in.m_60.y;
    float _467 = in.m_60.z;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _475 = _437 > 0.5;
    float _477 = 1.0 / _471;
    float _479 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _481 = _431 > 0.5;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _485 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _491 = -_185;
    int _493 = _475 ? as_type<int>(_491) : as_type<int>(_185);
    float _495 = -_473;
    float _497 = fma(_479, 2.0, _495);
    bool _499 = _433 > 0.5;
    float _501 = 1.0 / _489;
    float _503 = -_181;
    int _505 = _481 ? as_type<int>(_503) : as_type<int>(_181);
    float _507 = fma(_485, -2.0, _483);
    float _509 = _435 * 2.0;
    float _511 = _465 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _513 = _431 * 2.0;
    float _515 = -_185;
    float _517 = _499 ? _515 : _185;
    float _519 = -_145;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[76].x, _497);
    float _523 = _465 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _525 = _465 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _527 = !_443;
    float _529 = _527 ? _181 : as_type<float>(_505);
    float _531 = floor(_509);
    float _533 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _549 = _547 != 0;
    float _551 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _553 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _555 = _537 * _477;
    float _557 = _433 * 2.0;
    float _559 = _433 + _435;
    float _561 = floor(_513);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _563;
    float _567 = _559 + (-1.0);
    float _569 = _565 * _501;
    bool _571 = !_447;
    float _573 = _571 ? _185 : _517;
    float _575 = _433 + _431;
    float _577 = floor(_557);
    bool _579 = _435 > 0.5;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _583 = !_457;
    float _585 = _583 ? _185 : as_type<float>(_493);
    float _587 = _575 + (-1.0);
    float _589 = -_181;
    int _591 = _579 ? as_type<int>(_589) : as_type<int>(_181);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _595 = _429 + _593;
    bool _597 = _531 > 0.0;
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _601 = !_451;
    float _603 = _601 ? _181 : as_type<float>(_591);
    float _605 = fma(_569, _595, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _607 = _531 >= 0.0;
    bool _609 = isnan(_531);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
    bool _619 = _561 >= 0.0;
    bool _621 = isnan(_561);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    float _629 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
    float _631 = _531;
    float _633 = _517;
    float _635 = _587;
    if (!_461)
    {
        _631 = _433;
    }
    float _637 = _631;
    float _639 = _453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _641 = _637;
    if (!_461)
    {
        _633 = _435;
    }
    float _643 = _633;
    float _645 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _507);
    float _647 = _643;
    if (!_461)
    {
        _635 = _435;
    }
    float _649 = _635;
    float _651 = _573 + (-0.5);
    bool _653 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _655 = isnan(_429);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _629 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _667 = _649;
    if (_461)
    {
        _641 = _431;
    }
    float _669 = _641;
    float _671 = _617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_461)
    {
        _647 = _433;
    }
    float _673 = _647;
    float _675 = -_663;
    float _677 = _675 + 1.0;
    if (_461)
    {
        _667 = _433;
    }
    float _679 = _667;
    bool _681 = _561 > 0.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _685 = _429 + _683;
    int _687 = _615 ? 0 : 1;
    int _689 = _627 ? 0 : 1;
    float _691 = fma(_555, _685, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _695 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _697 = isnan(_429);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    bool _707 = _577 > 0.0;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _711 = _577 >= 0.0;
    bool _713 = isnan(_577);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[6].z, _551);
    bool _723 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _725 = isnan(_429);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[83].w, _709);
    float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _739 = _733 * _677;
    float _741 = -_733;
    float _743 = _741 + 1.0;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _747 = _439 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _749 = _705 * _743;
    float _751 = _529 + 0.5;
    float _753 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[83].z, _745);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _757 = _669 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _759 = fma(_747, _751, _521);
    float _761 = _605 * _749;
    float _763 = -_639;
    float _765 = -_645;
    float _767 = fma(_763, _651, _765);
    float _769 = -_755;
    float _771 = fma(_757, 2.0, _769);
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _775 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _777 = -_705;
    float _779 = _777 + 1.0;
    int _781 = ~_687;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _737 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _789 = fma(_775, -2.0, _773);
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[131].x, _761);
    int _793 = _785;
    if (!_597)
    {
        int _795 = ~_687;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = _693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _803 = _603 + 0.5;
    float _805 = _585 + (-0.5);
    float _807 = -_145;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _771);
    float _811 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _789);
    float _813 = fma(_691, _739, _791);
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = _665 + _815;
    bool _819 = !_541;
    int _821 = _819 ? 0 : 1;
    float _823 = fma(_787, _803, _809);
    float _825 = -_801;
    float _827 = -_811;
    float _829 = fma(_825, _805, _827);
    float _831 = _721 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _835 = _671 + _833;
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _839 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[133].x, _813);
    int _841 = ~_689;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    int _851 = _845;
    if (!_681)
    {
        int _853 = ~_689;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _861 = _831 + _859;
    int _863 = abs(_821);
    float _865 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[28].x, _837);
    float _867 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _753);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[28].z, _865);
    float _873 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _875 = -_867;
    float _877 = _875 + 1.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _881 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].z, _869);
    float _883 = -_873;
    float _885 = _883 + 1.0;
    float _887 = -_877;
    float _889 = fma(_603, _887, _823);
    float _891 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].w, _879);
    float _893 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _881);
    float _895 = _817 * _817;
    float _897 = fma(_585, _885, _829);
    bool _899 = _871 >= 0.0;
    float _901 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    float _903 = -_893;
    float _905 = _903 + 1.0;
    float _907 = _849 * _145;
    float _909 = fma(_835, _835, _895);
    float _911 = -_901;
    float _913 = _911 + 1.0;
    float _915 = -_905;
    float _917 = fma(_529, _915, _759);
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _921 = fma(_861, _861, _909);
    float _923 = exp2(_907);
    float _925 = fma(_573, _913, _767);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _929 = 1.0 + _927;
    float _931 = _905;
    float _933 = 1.0;
    if (_899)
    {
        _931 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _931;
    float _937 = rsqrt(_921);
    float _939 = in.m_76.x;
    float _941 = in.m_76.y;
    float _943 = in.m_76.z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _839 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _953 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = 1.0 / _929;
    int _959 = as_type<int>(_935);
    if (_899)
    {
        float _961 = _935 * 5.0;
        _959 = as_type<int>(_961);
    }
    int _963 = _959;
    bool _965 = !_545;
    int _967 = _965 ? 0 : 1;
    out.m_78.x = _917;
    out.m_78.y = _925;
    out.m_78.z = _889;
    out.m_78.w = _897;
    float _969 = float(_863);
    float _971 = float(_799);
    out.m_80.x = _953;
    out.m_80.y = _955;
    out.m_80.z = _949;
    out.m_80.w = _951;
    int _973 = abs(_967);
    bool _975 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _977 = isnan(0.0);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _983 = _979 || _981;
    if (_899)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4845 = as_type<float>(_963);
        out.gl_Position.z = _4845;
    }
    float _985 = _969 * _971;
    bool _987 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _995 = _991 || _993;
    if (_899)
    {
        out.m_63.x = 0.0;
    }
    float _997 = -_923;
    float _999 = _997 + 1.0;
    bool _1001 = !_549;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = _817 * _937;
    float _1007 = _835 * _937;
    if (_899)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1009 = -_1005;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _1013 = _861 * _937;
    float _1015 = -_1007;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _1019 = float(_973);
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1023 = _1011 + _1021;
    float _1025 = -_1013;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _831);
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1017 + _1029;
    float _1033 = float(_857);
    float _1035 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1039 = _1027 + _1037;
    float _1041 = _983 ? _999 : 0.0;
    float _1043 = _985 * (-2.0);
    float _1045 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1035);
    float _1047 = _1019 * _1033;
    float _1049 = _431 + (-0.5);
    float _1051 = _1043;
    float _1053 = _1023;
    if (_995)
    {
        float _1055 = _1041 * _957;
        _149 = _1055;
    }
    float _1057 = _149;
    float _1059 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1045);
    float _1061 = fma(_1043, _939, _939);
    float _1063 = fma(_599, _1043, _599);
    int _1065 = _719 ? 0 : 1;
    float _1067 = _433 + (-0.5);
    bool _1069 = _1059 >= 0.0;
    float _1071 = _1047 * (-2.0);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1061);
    int _1075 = abs(_1003);
    float _1077 = fma(_1071, _941, _941);
    float _1079 = fma(_1063, _1057, _1073);
    int _1081 = ~_1065;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    float _1087 = fma(_581, _1071, _581);
    float _1089 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1077);
    int _1091 = _1085;
    if (!_707)
    {
        int _1093 = ~_1065;
        int _1095 = _1093 + 1;
        _1091 = _1095;
    }
    int _1097 = _1091;
    float _1099 = _1079 * 0.15915493667125701904296875;
    int _1101 = _1097;
    if (_1069)
    {
        _1051 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1103 = _1051;
    float _1105 = float(_1075);
    float _1107 = _1099 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = float(_1097);
    if (_1069)
    {
        float _1113 = _1103 * 5.0;
        _1101 = as_type<int>(_1113);
    }
    int _1115 = _1101;
    if (_1069)
    {
        out.m_63.x = 0.0;
    }
    float _1117 = fma(_1087, _1057, _1089);
    float _1119 = _1105 * _1111;
    if (_1069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5067 = as_type<float>(_1115);
        out.gl_Position.z = _5067;
    }
    float _1121 = _1099 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    if (_1069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1125 = -_665;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1129 = _435 + _431;
    float _1131 = -_671;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1117 * 0.15915493667125701904296875;
    float _1137 = _1127 * _1127;
    float _1139 = _1129 + (-1.0);
    float _1141 = -_831;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1145 = _1119 * (-2.0);
    float _1147 = fma(_1133, _1133, _1137);
    float _1149 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1151 = -_1005;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _817);
    float _1155 = _435 + (-0.5);
    float _1157 = fma(_1143, _1143, _1147);
    float _1159 = fma(_1145, _943, _943);
    float _1161 = -_1007;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[18].w, _835);
    float _1165 = _1153 * _1153;
    float _1167 = fma(_1149, _1145, _1149);
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1171 = rsqrt(_1157);
    float _1173 = fma(_1163, _1163, _1165);
    float _1175 = -_1013;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _1179 = fma(_1167, _1057, _1169);
    float _1181 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1185 = fma(_1177, _1177, _1173);
    float _1187 = _1179 * 0.15915493667125701904296875;
    float _1189 = _1135 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = _1133 * _1171;
    float _1195 = _1143 * _1171;
    float _1197 = _1127 * _1171;
    float _1199 = _1135 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1205 = _1193 * _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1195 * _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1213 = _1197 * _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1217 = -_1205;
    float _1219 = fma(_1195, _1215, _1217);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1223 = -_1209;
    float _1225 = fma(_1197, _1221, _1223);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = -_1213;
    float _1231 = fma(_1193, _1227, _1229);
    float _1233 = _1187 * 6.283185482025146484375;
    float _1235 = sin(_1233);
    float _1237 = _1219 * _1219;
    float _1239 = _1109 * _1191;
    float _1241 = fma(_1225, _1225, _1237);
    float _1243 = _1123 * _1191;
    float _1245 = sqrt(_1185);
    float _1247 = fma(_1231, _1231, _1241);
    float _1249 = _1123 * _1201;
    float _1251 = _1187 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = fma(_1235, _1249, _1239);
    float _1257 = fma(_1235, _1239, _1249);
    float _1259 = rsqrt(_1247);
    float _1261 = _937 * _1245;
    float _1263 = _1109 * _1201;
    float _1265 = _1261 * _1181;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1269 = _1267 * 0.5;
    float _1271 = _1123 * _1253;
    float _1273 = _1201 * _1253;
    float _1275 = _1109 * _1253;
    float _1277 = _1191 * _1253;
    float _1279 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1283 = -_1263;
    float _1285 = fma(_1235, _1243, _1283);
    float _1287 = _1261 * _1279;
    float _1289 = _1281 * _1265;
    float _1291 = -_1243;
    float _1293 = fma(_1235, _1263, _1291);
    float _1295 = _1225 * _1259;
    float _1297 = _1183 * _1287;
    float _1299 = _1219 * _1259;
    float _1301 = _1271 * _1289;
    float _1303 = _1231 * _1259;
    float _1305 = -_1289;
    float _1307 = _1235 * _1305;
    float _1309 = _1195 * _1299;
    float _1311 = fma(_1255, _1297, _1301);
    float _1313 = _1197 * _1295;
    float _1315 = _1275 * _1289;
    float _1317 = fma(_1273, _1297, _1307);
    float _1319 = fma(_1285, _1269, _1311);
    float _1321 = -_1309;
    float _1323 = fma(_1197, _1303, _1321);
    float _1325 = -_1313;
    float _1327 = fma(_1193, _1299, _1325);
    float _1329 = fma(_1293, _1297, _1315);
    float _1331 = fma(_1277, _1269, _1317);
    float _1333 = _1323 * _1319;
    float _1335 = _1327 * _1319;
    float _1337 = fma(_1257, _1269, _1329);
    float _1339 = _1193 * _1303;
    float _1341 = fma(_1295, _1331, _1333);
    float _1343 = fma(_1303, _1331, _1335);
    float _1345 = _1271 * _1323;
    float _1347 = -_1339;
    float _1349 = fma(_1195, _1295, _1347);
    float _1351 = fma(_1193, _1337, _1341);
    float _1353 = fma(_1195, _1337, _1343);
    float _1355 = _1271 * _1327;
    float _1357 = _1349 * _1319;
    float _1359 = _671 + _1351;
    float _1361 = _831 + _1353;
    float _1363 = _1271 * _1349;
    float _1365 = _1255 * _1323;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1369 = _1359 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1361 + _1371;
    float _1375 = _1255 * _1349;
    float _1377 = _1255 * _1327;
    float _1379 = _1369 * _1369;
    float _1381 = _1373 * _1373;
    float _1383 = _1285 * _1327;
    float _1385 = fma(_1299, _1331, _1357);
    float _1387 = _1285 * _1323;
    float _1389 = _1379 + _1381;
    float _1391 = _1285 * _1349;
    float _1393 = fma(_1197, _1337, _1385);
    float _1395 = -_1235;
    float _1397 = fma(_1395, _1295, _1345);
    float _1399 = sqrt(_1389);
    float _1401 = -_1235;
    float _1403 = fma(_1401, _1299, _1363);
    float _1405 = -_1235;
    float _1407 = fma(_1405, _1303, _1355);
    float _1409 = _665 + _1393;
    float _1411 = fma(_1273, _1295, _1365);
    float _1413 = fma(_1273, _1299, _1375);
    float _1415 = fma(_1273, _1303, _1377);
    float _1417 = fma(_1277, _1295, _1387);
    float _1419 = fma(_1277, _1299, _1391);
    float _1421 = fma(_1275, _1193, _1397);
    float _1423 = fma(_1275, _1197, _1403);
    float _1425 = fma(_1277, _1303, _1383);
    float _1427 = fma(_1275, _1195, _1407);
    bool _1429 = _1399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1295;
    float _1433 = _1379;
    float _1435 = _1381;
    float _1437 = _1359;
    float _1439 = _1361;
    float _1441 = _1423;
    int _1443 = as_type<int>(_1387);
    float _1445 = _1383;
    float _1447 = _1345;
    if (!_1429)
    {
        _1431 = _1409;
    }
    float _1449 = _1431;
    bool _1451 = !_1429;
    float _1453 = _1449;
    if (!_1451)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1399 + _1457;
        float _1461 = rsqrt(_1389);
        float _1463 = _1459 * _1455;
        float _1465 = _1409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1463 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = fma(_1471, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1479 = _1461 * _1477;
        float _1481 = _1475 + (-1.0);
        float _1483 = fma(_1369, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1485 = fma(_1373, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1487 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1491 = _1483 + _1489;
        float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1495 = _1485 + _1493;
        float _1497 = fma(_1409, _1475, _1487);
        float _1499 = _1491 * _1491;
        float _1501 = _1495 * _1495;
        _1453 = _1497;
        _1433 = _1499;
        _1435 = _1501;
        _1437 = _1483;
        _1439 = _1485;
    }
    float _1503 = _1453;
    float _1505 = _1433;
    float _1507 = _1435;
    float _1509 = _1437;
    float _1511 = _1439;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1515 = _1503 + _1513;
    float _1517 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1519 = fma(_1293, _1193, _1411);
    float _1521 = fma(_1257, _1193, _1417);
    float _1523 = fma(_1515, _1515, _1505);
    float _1525 = fma(_1257, _1197, _1419);
    float _1527 = fma(_1257, _1195, _1425);
    float _1529 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1531 = _1523 + _1507;
    float _1533 = _1517 * _1421;
    float _1535 = fma(_1293, _1197, _1413);
    float _1537 = fma(_1293, _1195, _1415);
    float _1539 = _1517 * _1423;
    float _1541 = _1517 * _1427;
    float _1543 = sqrt(_1531);
    float _1545 = fma(_1529, _1519, _1533);
    float _1547 = fma(_1529, _1535, _1539);
    float _1549 = fma(_1529, _1537, _1541);
    float _1551 = _1521 + _1545;
    float _1553 = _1525 + _1547;
    float _1555 = _1527 + _1549;
    out.m_82.x = _1551;
    out.m_82.y = _1553;
    out.m_82.z = _1555;
    bool _1557 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1559 = isnan(_1543);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1565 = _1561 || _1563;
    if (!_1565)
    {
        _1441 = 1.0;
    }
    float _1567 = _1441;
    bool _1569 = !_1565;
    float _1571 = _1567;
    if (!_1569)
    {
        bool _1573 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1575 = isnan(_1543);
        bool _1577 = _1573 || _1575;
        bool _1579 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1581 = _1577 || _1579;
        if (!_1581)
        {
            float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1585 = _1543 + _1583;
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1595 = 1.0 / _1589;
            float _1597 = _1585 * _1595;
            float _1599 = fma(_1597, _1593, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1571 = _1599;
            _1601 = true;
        }
        else
        {
            bool _1603 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1605 = isnan(_1543);
            bool _1607 = _1603 || _1605;
            bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1611 = _1607 || _1609;
            if (!_1611)
            {
                float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1615 = _1543 + _1613;
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1617 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1625 = 1.0 / _1619;
                float _1627 = _1615 * _1625;
                float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1571 = _1629;
                _1601 = true;
            }
            else
            {
                _1571 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1601 = false;
    float _1631 = _1571;
    float _1633 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1635 = _1011 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1637 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1633);
    float _1639 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1637);
    float _1641 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1643 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1645 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1647 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1641);
    float _1649 = floor(_1643);
    float _1651 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1647);
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1655 = 1.0 / _1645;
    float _1657 = _1653 + _1645;
    float _1659 = -_1649;
    float _1661 = _1643 + _1659;
    float _1663 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _1665 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1663);
    float _1667 = _1657 * _1655;
    float _1669 = _1667 * 0.5;
    float _1671 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _1673 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1665);
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1675);
    float _1679 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1671);
    float _1681 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1683 = 1.0 / _1677;
    float _1685 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1687 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1679);
    float _1689 = _1011 + _1685;
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1693 = trunc(_1681);
    int _1695 = int(_1693);
    float _1697 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1671);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1663);
    float _1701 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1697);
    float _1703 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1699);
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1707 = _1683 * _1705;
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1713 = trunc(_1691);
    int _1715 = int(_1713);
    bool _1717 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1719 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1721 = !_1717;
    int _1723 = _1721 ? 0 : 1;
    float _1725 = trunc(_1709);
    int _1727 = int(_1725);
    int _1729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1731 = _1695 + _1729;
    int _1733 = _1731 + 1;
    int _1735 = 2;
    int _1737 = _1733;
    float _1739 = _1681;
    if (!_1717)
    {
        _1735 = 1;
    }
    int _1741 = _1735;
    float _1743 = trunc(_1711);
    int _1745 = int(_1743);
    int _1747 = _1741;
    if (!_1719)
    {
        _1747 = _1723;
    }
    int _1749 = _1747;
    int _1751 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1753 = _1715 + _1751;
    int _1755 = _1753 + 1;
    int _1757 = _1749 << 6;
    bool _1759 = _1755 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1761 = _1757 + 96;
    uint _1764 = uint(int(uint(_1761) >> uint(2)));
    uint _1766 = uint(int(uint(int(_1764)) >> uint(2)));
    int _1768 = int(_1764) & 3;
    float _1770 = (*spvDescriptorSet0.vp_c15)._m0[int(_1766)][_1768];
    int _1772 = int(_1764) + 1;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    int _1776 = _1772 & 3;
    float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
    int _1780 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1782 = _1727 + _1780;
    int _1784 = _1782 + 1;
    int _1786 = _1755 | _1733;
    bool _1788 = _1784 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1792 = _1745 + _1790;
    int _1794 = _1792 + 1;
    int _1796 = _1757 + 104;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    bool _1814 = _1786 < 0;
    bool _1816 = _1814 || _1759;
    int _1818 = _1784 | _1794;
    bool _1820 = _1733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1822 = _1820 || _1816;
    bool _1824 = _1818 < 0;
    bool _1826 = _1824 || _1788;
    int _1828 = _1757 + 48;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c15)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    bool _1846 = _1794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1848 = _1846 || _1826;
    int _1850 = _1757 + 64;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c15)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[int(_1862)][_1864];
    int _1868 = _1755;
    int _1870 = _1784;
    float _1872 = as_type<float>(_1749);
    if (!_1822)
    {
        int _1874 = _1733 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1876 = _1874 + _1755;
        _1868 = _1876;
    }
    int _1878 = _1868;
    if (!_1848)
    {
        int _1880 = _1794 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1882 = _1880 + _1784;
        _1870 = _1882;
    }
    int _1884 = _1870;
    int _1886 = _1757 + 56;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
    float _1904 = 0.0;
    if (!_1848)
    {
        float _1906 = floor(_1711);
        _1904 = _1906;
    }
    float _1908 = _1904;
    if (!_1848)
    {
        int _1910 = _1884 << 2;
        _1443 = _1910;
    }
    int _1912 = _1443;
    int _1914 = _1912;
    if (!_1848)
    {
        uint _1916 = uint(int(uint(_1884) >> uint(2)));
        _1737 = int(_1916);
    }
    int _1918 = _1737;
    float _1920 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1848)
    {
        int _1922 = 12 & _1912;
        _1914 = _1922;
    }
    int _1924 = _1914;
    int _1926 = _1757 + 72;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    uint _1930 = uint(int(uint(int(_1928)) >> uint(2)));
    int _1932 = int(_1928) & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    int _1936 = int(_1928) + 1;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    int _1940 = _1936 & 3;
    float _1942 = (*spvDescriptorSet0.vp_c15)._m0[int(_1938)][_1940];
    if (!_1848)
    {
        int _1944 = _1918 << 4;
        int _1946 = _1944 + _1924;
        _1445 = as_type<float>(_1946);
    }
    float _1948 = _1445;
    float _1950 = _1689 * _1778;
    float _1952 = _1948;
    int _1954 = as_type<int>(_1950);
    int _1956 = as_type<int>(_1770);
    if (!_1848)
    {
        int _1958 = as_type<int>(_1948) + 400;
        uint _1960 = uint(int(uint(_1958) >> uint(2)));
        uint _1962 = uint(int(uint(int(_1960)) >> uint(2)));
        int _1964 = int(_1960) & 3;
        float _1966 = (*spvDescriptorSet0.vp_c15)._m0[int(_1962)][_1964];
        _1952 = _1966;
    }
    float _1968 = _1952;
    float _1970 = fma(_1017, _1770, _1950);
    if (!_1822)
    {
        int _1972 = _1878 << 2;
        _1954 = _1972;
    }
    int _1974 = _1954;
    float _1976 = _1908;
    int _1978 = _1974;
    if (!_1848)
    {
        float _1980 = -_1908;
        float _1982 = _1711 + _1980;
        _1976 = _1982;
    }
    float _1984 = _1976;
    if (!_1822)
    {
        uint _1986 = uint(int(uint(_1878) >> uint(2)));
        _1956 = int(_1986);
    }
    int _1988 = _1956;
    float _1990 = fma(_1027, _1804, _1970);
    if (!_1822)
    {
        int _1992 = 12 & _1974;
        _1978 = _1992;
    }
    int _1994 = _1978;
    float _1996 = floor(_1920);
    float _1998 = _1990 + _1812;
    if (!_1822)
    {
        int _2000 = _1988 << 4;
        int _2002 = _2000 + _1994;
        _1447 = as_type<float>(_2002);
    }
    float _2004 = _1447;
    int _2006 = _1757 + 88;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c15)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c15)._m0[int(_2018)][_2020];
    float _2024 = _1689 * _1844;
    float _2026 = 1.0 / _1998;
    float _2028 = fma(_1017, _1836, _2024);
    int _2030 = _1757 + 80;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[int(_2042)][_2044];
    float _2048 = _1689 * _1866;
    float _2050 = _1866;
    float _2052 = _2048;
    if (!_1822)
    {
        float _2054 = floor(_1691);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = -_1996;
    float _2060 = _1920 + _2058;
    float _2062 = fma(_1017, _1858, _2048);
    float _2064 = _2004;
    if (!_1822)
    {
        int _2066 = as_type<int>(_2004) + 400;
        uint _2068 = uint(int(uint(_2066) >> uint(2)));
        uint _2070 = uint(int(uint(int(_2068)) >> uint(2)));
        int _2072 = int(_2068) & 3;
        float _2074 = (*spvDescriptorSet0.vp_c15)._m0[int(_2070)][_2072];
        _2064 = _2074;
    }
    float _2076 = _2064;
    float _2078 = fma(_1027, _1894, _2028);
    float _2080 = _1894;
    if (!_1848)
    {
        float _2082 = floor(_1709);
        _2052 = _2082;
    }
    float _2084 = _2052;
    float _2086 = _2078 + _1902;
    float _2088 = _2086 * _2026;
    float _2090 = _1902;
    if (!_1822)
    {
        float _2092 = floor(_1681);
        _2090 = _2092;
    }
    float _2094 = _2090;
    float _2096 = fma(_1027, _1934, _2062);
    float _2098 = _2056;
    if (!_1822)
    {
        float _2100 = -_2056;
        float _2102 = _1691 + _2100;
        _2098 = _2102;
    }
    float _2104 = _2098;
    bool _2106 = _2088 >= 0.0;
    float _2108 = _2096 + _1942;
    bool _2110 = _2088 <= 1.0;
    bool _2112 = _2110 && _2106;
    if (!_1848)
    {
        float _2114 = rint(_1968);
        float _2116 = precise::max(_2114, 0.0);
        uint _2118 = uint(_2116);
        uint _2120 = clamp(_2118, 0u, 65535u);
        _2080 = as_type<float>(_2120);
    }
    float _2122 = _2080;
    float _2124 = _2108 * _2026;
    bool _2126 = _2124 >= 0.0;
    bool _2128 = _2126 && _2112;
    float _2130 = _2094;
    float _2132 = _2124;
    if (!_1822)
    {
        float _2134 = -_2094;
        float _2136 = _1681 + _2134;
        _1739 = _2136;
    }
    float _2138 = _1739;
    if (!_1848)
    {
        float _2140 = -_2084;
        float _2142 = _1709 + _2140;
        _2130 = _2142;
    }
    float _2144 = _2130;
    bool _2146 = _2124 <= 1.0;
    bool _2148 = _2146 && _2128;
    float _2150 = _1689 * _2046;
    float _2152 = fma(_1017, _2038, _2150);
    if (_2148)
    {
        float _2154 = float(_1749);
        _1872 = _2154;
    }
    float _2156 = _1872;
    float _2158 = _1858;
    if (!_1822)
    {
        float _2160 = rint(_2076);
        float _2162 = precise::max(_2160, 0.0);
        uint _2164 = uint(_2162);
        uint _2166 = clamp(_2164, 0u, 65535u);
        _2158 = as_type<float>(_2166);
    }
    float _2168 = _2158;
    float _2170 = fma(_1027, _2014, _2152);
    float _2172 = fma(_1017, 6.2500002968590706586837768554688e-05, 0.5);
    float _2174 = _2170 + _2022;
    float _2176 = fma(_1027, 6.2500002968590706586837768554688e-05, 0.5);
    float _2178 = _2150;
    if (_2148)
    {
        float _2180 = rint(_2156);
        float _2182 = precise::max(_2180, 0.0);
        uint _2184 = uint(_2182);
        uint _2186 = clamp(_2184, 0u, 65535u);
        _2178 = as_type<float>(_2186);
    }
    float _2188 = _2178;
    float _2190 = _2174 * _2026;
    float2 _6819 = float2(_2172, _2176);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6819, float2(0.0), isnan(_6819)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6819, float2(0.0), isnan(_6819)), level(0.0)).x;
    float2 _6829 = float2(_1661, _2060);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6829, float2(0.0), isnan(_6829)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6829, float2(0.0), isnan(_6829)), level(0.0)).x;
    float _2196 = _2168;
    if (!_1822)
    {
        float3 _6844 = float3(_2104, _2138, float(as_type<int>(_2168)));
        float3 _6848 = select(_6844, float3(0.0), isnan(_6844));
        float _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6848.xy, uint(rint(_6848.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6848.xy, uint(rint(_6848.z)), level(0.0)).x;
        _2196 = _2198;
    }
    float _2200 = _2196;
    float _2202 = _2122;
    if (!_1848)
    {
        float3 _6864 = float3(_2144, _1984, float(as_type<int>(_2122)));
        float3 _6866 = select(_6864, float3(0.0), isnan(_6864));
        float _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6866.xy, uint(rint(_6866.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6866.xy, uint(rint(_6866.z)), level(0.0)).x;
        _2202 = _2204;
    }
    float _2206 = _2202;
    float _2208 = _1691;
    if (_2148)
    {
        float3 _6881 = float3(_2088, _2124, float(as_type<int>(_2188)));
        float3 _6883 = select(_6881, float3(0.0), isnan(_6881));
        float _2210 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6883.xy, uint(rint(_6883.z)), _2190, level(0.0));
        _2208 = _2210;
    }
    float _2212 = _2208;
    float _2214 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2216 = _1503 + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2220 = _1509 + _2218;
    bool _2222 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan(0.5);
    bool _2230 = _2226 || _2228;
    float _2232 = fma(_2216, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2234 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2236 = _1511 + _2234;
    float _2238 = fma(_2220, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2240 = -_1005;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2244 = fma(_2236, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2246 = -_1007;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2250 = -_1013;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2244);
    float _2254 = _2248;
    float _2256 = _2252;
    if (_2230)
    {
        _2132 = _2242;
    }
    float _2258 = _2132;
    float _2260 = _2258;
    if (!_2230)
    {
        float _2262 = _1023 * _1023;
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2266 = -_831;
        float _2268 = _2266 + _2244;
        float _2270 = -_665;
        float _2272 = _2270 + _2232;
        float _2274 = fma(_1031, _1031, _2262);
        float _2276 = -_671;
        float _2278 = _2276 + _2238;
        float _2280 = fma(_1039, _1039, _2274);
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2284 = sqrt(_2280);
        float _2286 = 1.0 / _1261;
        float _2288 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2290 = precise::min(_2284, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2292 = _2290 * _2264;
        float _2294 = _2292 * _2286;
        float _2296 = _2288 * _2294;
        float _2298 = _2268 * _2294;
        float _2300 = fma(_2272, _2296, _1011);
        float _2302 = fma(_2278, _2296, _1017);
        float _2304 = fma(_2288, _2298, _1027);
        _2260 = _2300;
        _2254 = _2302;
        _2256 = _2304;
    }
    float _2306 = _2260;
    float _2308 = _2254;
    float _2310 = _2256;
    float _2312 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2318 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(0.5);
    bool _2326 = _2322 || _2324;
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2312);
    float _2330 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2314);
    float _2332 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2316);
    float _2334 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2336 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2328);
    float _2338 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2330);
    float _2340 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2342 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2334);
    float _2344 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2346 = _2338 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2348 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2350 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2342);
    float _2352 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2356 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2358 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2360 = abs(_2192);
    bool _2362 = _2360 != 0.0;
    bool _2364 = isnan(_2360);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan(0.0);
    bool _2370 = _2366 || _2368;
    float _2372 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2352);
    float _2374 = _2350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2376 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2358);
    float _2378 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2354);
    float _2380 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2356);
    float _2382 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2372);
    float _2384 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2376);
    float _2386 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2378);
    float _2388 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    float _2390 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2382);
    float _2392 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2384);
    float _2394 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2386);
    float _2396 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2388);
    float _2398 = _2374;
    float _2400 = _2356;
    float _2402 = _2384;
    float _2404 = _2380;
    if (_2326)
    {
        _2398 = 1.0;
    }
    float _2406 = _2398;
    float _2408 = _2406;
    if (_2370)
    {
        _2400 = _2392;
    }
    float _2410 = _2400;
    float _2412 = _2410;
    if (!_2370)
    {
        _2412 = 0.0;
    }
    float _2414 = _2412;
    float _2416 = _2414;
    if (!_2326)
    {
        float _2418 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2420 = _2418 * 0.15915493667125701904296875;
        float _2422 = _2420 * 6.283185482025146484375;
        float _2424 = cos(_2422);
        float _2426 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2428 = _2426 * 0.15915493667125701904296875;
        float _2430 = _2420 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = 1.0 / _2424;
        float _2436 = _2428 * 6.283185482025146484375;
        float _2438 = cos(_2436);
        float _2440 = _2432 * _2434;
        float _2442 = _2428 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2446;
        float _2450 = _2438 * _2440;
        float _2452 = 1.0 / _2448;
        float _2454 = 1.0 / _2450;
        float _2456 = _2444 * _2454;
        float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2460 = fma(_1707, _2456, _2458);
        float _2462 = _2460 * _2452;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        _2402 = _2452;
        _1053 = _2428;
        _2404 = _2454;
        _2408 = _2464;
    }
    float _2466 = _2402;
    float _2468 = _1053;
    float _2470 = _2404;
    float _2472 = _2408;
    out.gl_Position.x = _2390;
    out.gl_Position.y = _2394;
    out.gl_Position.z = _2396;
    out.gl_Position.w = _2392;
    float _2474 = _2466;
    float _2476 = _2468;
    float _2478 = _2470;
    if (!_2370)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1822)
    {
        int _2480 = _1878 << 4;
        int _2482 = _2480 + 2048;
        uint _2484 = uint(int(uint(_2482) >> uint(2)));
        uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
        int _2488 = int(_2484) & 3;
        float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
        int _2492 = int(_2484) + 1;
        uint _2494 = uint(int(uint(_2492) >> uint(2)));
        int _2496 = _2492 & 3;
        float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
        int _2500 = _2482 + 8;
        uint _2502 = uint(int(uint(_2500) >> uint(2)));
        uint _2504 = uint(int(uint(int(_2502)) >> uint(2)));
        int _2506 = int(_2502) & 3;
        float _2508 = (*spvDescriptorSet0.vp_c15)._m0[int(_2504)][_2506];
        int _2510 = int(_2502) + 1;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        int _2514 = _2510 & 3;
        float _2516 = (*spvDescriptorSet0.vp_c15)._m0[int(_2512)][_2514];
        float _2518 = _1635 * _2498;
        float _2520 = fma(_1017, _2490, _2518);
        float _2522 = fma(_1027, _2508, _2520);
        float _2524 = _2522 + _2516;
        float _2526 = precise::clamp(_2524, 0.0, 1.0);
        float _2528 = -_2526;
        float _2530 = _2528 + _2200;
        float _2532 = fma(_2530, 500.0, 1.5);
        float _2534 = exp2(_2532);
        float _2536 = 0.0 + _2534;
        float _2538 = precise::clamp(_2536, 0.0, 1.0);
        bool _2540 = _2538 >= 1.0;
        bool _2542 = isnan(_2538);
        bool _2544 = _2540 || _2542;
        bool _2546 = isnan(1.0);
        bool _2548 = _2544 || _2546;
        _2474 = _2490;
        _2476 = _2498;
        if (!_2548)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2548)
        {
            _2416 = 0.0;
        }
    }
    float _2550 = _2474;
    float _2552 = _2476;
    float _2554 = _2416;
    float _2556 = _2552;
    float _2558 = _2550;
    if (_1848)
    {
        _2478 = 1.0;
    }
    float _2560 = _2478;
    float _2562 = _2560;
    if (!_1848)
    {
        int _2564 = _1884 << 4;
        int _2566 = _2564 + 2048;
        uint _2568 = uint(int(uint(_2566) >> uint(2)));
        uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
        int _2572 = int(_2568) & 3;
        float _2574 = (*spvDescriptorSet0.vp_c15)._m0[int(_2570)][_2572];
        int _2576 = int(_2568) + 1;
        uint _2578 = uint(int(uint(_2576) >> uint(2)));
        int _2580 = _2576 & 3;
        float _2582 = (*spvDescriptorSet0.vp_c15)._m0[int(_2578)][_2580];
        int _2584 = _2566 + 8;
        uint _2586 = uint(int(uint(_2584) >> uint(2)));
        uint _2588 = uint(int(uint(int(_2586)) >> uint(2)));
        int _2590 = int(_2586) & 3;
        float _2592 = (*spvDescriptorSet0.vp_c15)._m0[int(_2588)][_2590];
        int _2594 = int(_2586) + 1;
        uint _2596 = uint(int(uint(_2594) >> uint(2)));
        int _2598 = _2594 & 3;
        float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
        float _2602 = _1689 * _2582;
        float _2604 = fma(_1017, _2574, _2602);
        float _2606 = fma(_1027, _2592, _2604);
        float _2608 = _2606 + _2600;
        float _2610 = precise::clamp(_2608, 0.0, 1.0);
        float _2612 = -_2610;
        float _2614 = _2612 + _2206;
        float _2616 = fma(_2614, 500.0, 1.5);
        float _2618 = exp2(_2616);
        float _2620 = 0.0 + _2618;
        float _2622 = precise::clamp(_2620, 0.0, 1.0);
        _2556 = _2582;
        _2558 = _2574;
        _2562 = _2622;
    }
    float _2624 = _2556;
    float _2626 = _2558;
    float _2628 = _2562;
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2632 = _2306 + _2630;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2308 + _2634;
    float _2638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2640 = _2310 + _2638;
    float _2642 = _2632 * _2632;
    float _2644 = fma(_2636, _2636, _2642);
    float _2646 = fma(_2640, _2640, _2644);
    float _2648 = rsqrt(_2646);
    float _2650 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2652 = _2636 * _2650;
    float _2654 = _2640 * _2650;
    float _2656 = _2652 * _2652;
    float _2658 = _2654 * _2654;
    float _2660 = _2656 + _2658;
    float _2662 = sqrt(_2660);
    bool _2664 = _2662 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2668 = _2662 + _2666;
    float _2670 = _2640;
    float _2672 = _2660;
    float _2674 = _2668;
    float _2676 = _2624;
    float _2678 = _2626;
    float _2680 = _2632;
    float _2682 = _2652;
    if (_2664)
    {
        float _2684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2684;
    }
    float _2686 = _2670;
    if (_2664)
    {
        float _2688 = rsqrt(_2660);
        _2672 = _2688;
    }
    float _2690 = _2672;
    float _2692 = _2690;
    if (_2664)
    {
        float _2694 = _2668 * _2686;
        _2674 = _2694;
    }
    float _2696 = _2674;
    if (_2664)
    {
        float _2698 = _2696 * 0.15915493667125701904296875;
        _2676 = _2698;
    }
    float _2700 = _2676;
    float _2702 = _2686;
    if (_2664)
    {
        float _2704 = _2700 * 6.283185482025146484375;
        float _2706 = sin(_2704);
        _2702 = _2706;
    }
    float _2708 = _2702;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2712 = precise::max(0.0, _2710);
    float _2714 = _2642;
    float _2716 = _2712;
    if (_2664)
    {
        float _2718 = _2700 * 6.283185482025146484375;
        float _2720 = cos(_2718);
        _2714 = _2720;
    }
    float _2722 = _2714;
    float _2724 = -_2650;
    float _2726 = -_2712;
    float _2728 = fma(_2632, _2724, _2726);
    if (_2664)
    {
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2716 = _2730;
    }
    float _2732 = _2716;
    float _2734 = _2708;
    float _2736 = _2732;
    if (_2664)
    {
        float _2738 = fma(_2708, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2678 = _2738;
    }
    float _2740 = _2678;
    float _2742 = _2740;
    if (!_2664)
    {
        _2734 = _2728;
    }
    float _2744 = _2734;
    float _2746 = _2744;
    float _2748 = _2722;
    if (_2664)
    {
        float _2750 = _2722 + (-1.0);
        _2680 = _2750;
    }
    float _2752 = _2680;
    float _2754 = _2752;
    if (_2664)
    {
        float _2756 = _2690 * _2740;
        _2742 = _2756;
    }
    float _2758 = _2742;
    if (!_2664)
    {
        _2692 = _2656;
    }
    float _2760 = _2692;
    float _2762 = _2760;
    if (_2664)
    {
        float _2764 = _2752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2736 = _2764;
    }
    float _2766 = _2736;
    if (_2664)
    {
        float _2768 = _2652 * _2758;
        _2682 = _2768;
    }
    float _2770 = _2682;
    if (!_2664)
    {
        _2754 = _2654;
    }
    float _2772 = _2754;
    float _2774 = _2772;
    if (_2664)
    {
        float _2776 = _2654 * _2758;
        _2774 = _2776;
    }
    float _2778 = _2774;
    if (_2664)
    {
        float _2780 = fma(_2728, _2722, _2766);
        _2746 = _2780;
    }
    float _2782 = _2746;
    if (_2664)
    {
        float _2784 = _2770 * _2770;
        _2762 = _2784;
    }
    float _2786 = _2762;
    float _2788 = sqrt(_2646);
    if (!_2664)
    {
        _2748 = _2658;
    }
    float _2790 = _2748;
    float _2792 = _2790;
    if (_2664)
    {
        float _2794 = _2778 * _2778;
        _2792 = _2794;
    }
    float _2796 = _2792;
    float _2798 = fma(_2782, _2782, _2786);
    float _2800 = _2798 + _2796;
    float _2802 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2804 = 1.0 / _2554;
    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2808 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2806);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = rsqrt(_2800);
    float _2814 = -_2810;
    float _2816 = _2814 + 1.0;
    float _2818 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2820 = -_2818;
    float _2822 = fma(_2820, _2802, 1.0);
    float _2824 = abs(_2816);
    float _2826 = log2(_2824);
    float _2828 = _2390 * _2804;
    float _2830 = fma(_2828, 0.5, 0.5);
    float _2832 = _2812 * _2770;
    float _2834 = _2812 * _2782;
    float _2836 = _2812 * _2778;
    float _2838 = log2(_2822);
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2842 = -_2840;
    float _2844 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2842);
    float _2846 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2848 = -_2836;
    float _2850 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2844);
    float _2852 = _2834 + 1.0;
    float _2854 = exp2(_2846);
    float _2856 = fma(_2850, -0.5, 0.5);
    float _2858 = fma(_2850, 0.5, 0.5);
    float _2860 = _2838 * 0.693147182464599609375;
    float _2862 = fma(_2858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2864 = sqrt(_2856);
    float _2866 = fma(_2858, _2862, -0.212114393711090087890625);
    float _2868 = fma(_2858, _2866, 1.570728778839111328125);
    float _2870 = _2394 * _2804;
    float _2872 = -_2834;
    float _2874 = fma(_2854, _2852, _2872);
    float _2876 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2878 = fma(_2870, -0.5, 0.5);
    float _2880 = fma(_2874, 0.5, 0.5);
    float _2882 = _2864 * 0.636619746685028076171875;
    float3 _7948 = float3(_2830, _2878, _2876);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7948, float3(0.0), isnan(_7948)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7948, float3(0.0), isnan(_7948)), level(0.0)).x;
    float _2886 = -_2868;
    float _2888 = fma(_2882, _2886, 1.0);
    float3 _7962 = float3(_2830, _2878, _2876);
    float4 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7962, float3(0.0), isnan(_7962)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7962, float3(0.0), isnan(_7962)), level(0.0)).xyzw;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float _2899 = _2891.w;
    float2 _7978 = float2(_2888, _2880);
    float3 _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7978, float2(0.0), isnan(_7978)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7978, float2(0.0), isnan(_7978)), level(0.0)).xyz;
    float _2905 = _2903.x;
    float _2907 = _2903.y;
    float _2909 = _2903.z;
    float _2911 = abs(_1707);
    float _2913 = log2(_2911);
    float _2915 = _2392 * 0.5;
    float _2917 = _2396 + _2392;
    float _2919 = _2390 + _2392;
    float _2921 = -_2194;
    float _2923 = _2921 + 1.0;
    float _2925 = fma(_2394, -0.5, _2915);
    float _2927 = _2917 * 0.5;
    float _2929 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2931 = _1707 <= 8000.0;
    bool _2933 = isnan(_1707);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan(8000.0);
    bool _2939 = _2935 || _2937;
    float _2941 = float(_2939);
    float _2943 = _2919 * 0.5;
    float _2945 = _2826;
    if (!_2148)
    {
        _2945 = 1.0;
    }
    float _2947 = _2945;
    float _2949 = _2947;
    if (_2148)
    {
        bool _2951 = _2212 >= _2190;
        bool _2953 = isnan(_2212);
        bool _2955 = _2951 || _2953;
        bool _2957 = isnan(_2190);
        bool _2959 = _2955 || _2957;
        float _2961 = float(_2959);
        _2949 = _2961;
    }
    float _2963 = _2949;
    float _2965 = exp2(_2929);
    float _2967 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_84.x = _2943;
    out.m_84.y = _2925;
    out.m_84.z = _2927;
    out.m_84.w = _2392;
    bool _2969 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2971 = isnan(_2788);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2977 = _2973 || _2975;
    float _2979 = _2963 * _2628;
    float _2981 = exp2(_2967);
    float _2983 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2985 = fma(_2981, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2987 = precise::clamp(_2985, 0.0, 1.0);
    float _2989 = fma(_2987, -2.0, 3.0);
    float _2991 = _2987 * _2987;
    float _2993 = _2991 * _2989;
    float _2995 = -_2993;
    float _2997 = _2995 + 1.0;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2993);
    float _3001 = _2941 * _2999;
    float _3003 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3005 = -_2965;
    float _3007 = _3005 + 1.0;
    float _3009 = _2923 * _3003;
    float _3011 = precise::clamp(_3009, 0.0, 1.0);
    float _3013 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3015 = _3003;
    float _3017 = _2979;
    if (!_2977)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3019 = _3015;
    float _3021 = -_3011;
    float _3023 = fma(_3021, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3025 = _3019;
    float _3027 = _3019;
    if (!_2977)
    {
        _933 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3029 = _933;
    float _3031 = -_2979;
    float _3033 = fma(_3031, _3023, 1.0);
    float _3035 = precise::clamp(_3033, 0.0, 1.0);
    float _3037 = _3035;
    float _3039 = _3029;
    float _3041 = _3029;
    if (!_2977)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3043 = _3017;
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3047 = _3043;
    float _3049 = _3043;
    if (!_2977)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3051 = _3037;
    out.m_86.x = _3045;
    float _3053 = _3013 * _2884;
    float _3055 = -_3013;
    float _3057 = _3055 + 1.0;
    float _3059 = _2899 * _3053;
    float _3061 = _2899 * _3057;
    float _3063 = _3057;
    float _3065 = _3053;
    float _3067 = _3051;
    float _3069 = _3051;
    if (!_2977)
    {
        _3063 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3071 = _3063;
    float _3073 = _2909 * _3053;
    float _3075 = fma(_2905, _3059, _2893);
    float _3077 = fma(_2907, _3059, _2895);
    float _3079 = _3071;
    float _3081 = _3071;
    if (!_2977)
    {
        _3065 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3083 = _3065;
    float _3085 = fma(_2899, _3073, _2897);
    out.m_88.x = _3075;
    out.m_88.y = _3077;
    out.m_88.z = _3085;
    out.m_88.w = _3061;
    bool _3087 = !_2977;
    float _3089 = _3083;
    float _3091 = _3083;
    if (!_3087)
    {
        bool _3093 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3095 = isnan(_2788);
        bool _3097 = _3093 || _3095;
        bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3101 = _3097 || _3099;
        if (!_3101)
        {
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3105 = _2788 + _3103;
            float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3107;
            float _3111 = 1.0 / _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3129 = _3105 * _3111;
            float _3131 = precise::clamp(_3129, 0.0, 1.0);
            float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3141 = fma(_3131, _3115, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3143 = fma(_3131, _3135, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3145 = fma(_3131, _3139, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3147 = fma(_3131, _3119, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3149 = fma(_3131, _3123, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3151 = fma(_3131, _3127, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3049 = _3145;
            _3069 = _3149;
            _3027 = _3143;
            _3081 = _3147;
            _3091 = _3141;
            _3041 = _3151;
            _3153 = true;
        }
        else
        {
            bool _3155 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3157 = isnan(_2788);
            bool _3159 = _3155 || _3157;
            bool _3161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3163 = _3159 || _3161;
            if (!_3163)
            {
                _3025 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3165 = _3025;
            _3027 = _3165;
            if (!_3163)
            {
                _3047 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3167 = _3047;
            _3049 = _3167;
            if (!_3163)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3169 = _3089;
            _3091 = _3169;
            if (!_3163)
            {
                _3079 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3171 = _3079;
            _3081 = _3171;
            if (!_3163)
            {
                _3067 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3173 = _3067;
            _3069 = _3173;
            if (!_3163)
            {
                _3039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3175 = _3039;
            bool _3177 = !_3163;
            _3041 = _3175;
            if (!_3177)
            {
                bool _3179 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3181 = isnan(_2788);
                bool _3183 = _3179 || _3181;
                bool _3185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3187 = _3183 || _3185;
                if (!_3187)
                {
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3191 = _2788 + _3189;
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3193;
                    float _3197 = 1.0 / _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3215 = _3191 * _3197;
                    float _3217 = precise::clamp(_3215, 0.0, 1.0);
                    float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3227 = fma(_3217, _3201, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3229 = fma(_3217, _3221, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3231 = fma(_3217, _3225, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3233 = fma(_3217, _3205, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3235 = fma(_3217, _3209, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3237 = fma(_3217, _3213, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3049 = _3231;
                    _3069 = _3235;
                    _3027 = _3229;
                    _3081 = _3233;
                    _3091 = _3227;
                    _3041 = _3237;
                    _3153 = true;
                }
                else
                {
                    _3049 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3069 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3027 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3081 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3153 = false;
    float _3239 = _3049;
    float _3241 = _3069;
    float _3243 = _3027;
    float _3245 = _3081;
    float _3247 = _3091;
    float _3249 = _3041;
    float _3251 = _2983 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3253 = fma(_1553, -0.5, 0.5);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = -_3239;
    float _3259 = _3257 + _3241;
    float _3261 = -_3243;
    float _3263 = _3261 + _3245;
    out.m_90.x = 0.0;
    float _3265 = -_3247;
    float _3267 = _3265 + _3249;
    float _3269 = fma(_3255, _3259, _3239);
    float _3271 = fma(_3255, _3263, _3243);
    bool _3273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3269 * 0.586610972881317138671875;
    float _3277 = fma(_3255, _3267, _3247);
    out.m_63.x = _3251;
    bool _3279 = _2472 > 0.0;
    bool _3281 = isnan(_2472);
    bool _3283 = _3279 || _3281;
    bool _3285 = isnan(0.0);
    bool _3287 = _3283 || _3285;
    float _3289 = fma(_3271, 0.298911988735198974609375, _3275);
    float _3291 = fma(_3277, 0.114477999508380889892578125, _3289);
    float _3293 = -_3291;
    float _3295 = _3271 + _3293;
    float _3297 = -_3291;
    float _3299 = _3269 + _3297;
    float _3301 = -_3291;
    float _3303 = _3277 + _3301;
    float _3305 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    float _3307 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    float _3309 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    bool _3311 = !_3273;
    if (!_3311)
    {
        float _3313 = -_2306;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3317 = -_2308;
        float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3321 = -_2310;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3325 = _3315 * _3315;
        float _3327 = fma(_3319, _3319, _3325);
        float _3329 = fma(_3323, _3323, _3327);
        float _3331 = sqrt(_3329);
        float _3333 = rsqrt(_3329);
        float _3335 = -_3331;
        float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3339 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3341 = precise::clamp(_3339, 0.0, 1.0);
        float _3343 = _3319 * _3333;
        float _3345 = _3315 * _3333;
        float _3347 = abs(_3341);
        float _3349 = log2(_3347);
        float _3351 = _3323 * _3333;
        float _3353 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3355 = _1553 * _3345;
        float _3357 = -_3345;
        float _3359 = -_3353;
        float _3361 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3359);
        float _3363 = fma(_1551, _3343, _3355);
        float _3365 = -_3351;
        float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3361);
        float _3369 = fma(_1555, _3351, _3363);
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3375 = _3367 + _3373;
        float _3377 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3379 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = exp2(_3377);
        float _3385 = _3383 * _3381;
        float _3387 = _3371 * _3385;
        float _3389 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3391 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3393 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3389;
        out.m_90.y = _3391;
        out.m_90.z = _3393;
    }
    out.m_92.x = _3305;
    out.m_92.y = _3307;
    out.m_92.z = _3309;
    if (_3287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3153 = false;
    bool _1601 = false;
    bool _421 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_60.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_63.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_127);
        out.gl_Position.z = _3452;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_65.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_63.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_165);
        out.gl_Position.z = _3521;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_70.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_70.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_72.x;
    float _395 = in.m_72.y;
    out.m_74.x = _385;
    out.m_74.y = _387;
    out.m_74.z = _389;
    out.m_74.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _419;
    if (!_401)
    {
        float _403 = in.m_70.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_111);
        float _425 = 1.0 / _423;
        float _427 = _145 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_70.x;
    float _433 = in.m_70.y;
    float _435 = in.m_70.z;
    float _437 = in.m_70.w;
    float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _451 = _449 != 0;
    float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _461 = _459 != 0;
    float _463 = in.m_60.x;
    float _465 = in.m_60.y;
    float _467 = in.m_60.z;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _475 = _437 > 0.5;
    float _477 = 1.0 / _471;
    float _479 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _481 = _431 > 0.5;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _485 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _491 = -_185;
    int _493 = _475 ? as_type<int>(_491) : as_type<int>(_185);
    float _495 = -_473;
    float _497 = fma(_479, 2.0, _495);
    bool _499 = _433 > 0.5;
    float _501 = 1.0 / _489;
    float _503 = -_181;
    int _505 = _481 ? as_type<int>(_503) : as_type<int>(_181);
    float _507 = fma(_485, -2.0, _483);
    float _509 = _435 * 2.0;
    float _511 = _465 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _513 = _431 * 2.0;
    float _515 = -_185;
    float _517 = _499 ? _515 : _185;
    float _519 = -_145;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[76].x, _497);
    float _523 = _465 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _525 = _465 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _527 = !_443;
    float _529 = _527 ? _181 : as_type<float>(_505);
    float _531 = floor(_509);
    float _533 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _549 = _547 != 0;
    float _551 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _553 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _555 = _537 * _477;
    float _557 = _433 * 2.0;
    float _559 = _433 + _435;
    float _561 = floor(_513);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _563;
    float _567 = _559 + (-1.0);
    float _569 = _565 * _501;
    bool _571 = !_447;
    float _573 = _571 ? _185 : _517;
    float _575 = _433 + _431;
    float _577 = floor(_557);
    bool _579 = _435 > 0.5;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _583 = !_457;
    float _585 = _583 ? _185 : as_type<float>(_493);
    float _587 = _575 + (-1.0);
    float _589 = -_181;
    int _591 = _579 ? as_type<int>(_589) : as_type<int>(_181);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _595 = _429 + _593;
    bool _597 = _531 > 0.0;
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _601 = !_451;
    float _603 = _601 ? _181 : as_type<float>(_591);
    float _605 = fma(_569, _595, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _607 = _531 >= 0.0;
    bool _609 = isnan(_531);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
    bool _619 = _561 >= 0.0;
    bool _621 = isnan(_561);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    float _629 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
    float _631 = _531;
    float _633 = _517;
    float _635 = _587;
    if (!_461)
    {
        _631 = _433;
    }
    float _637 = _631;
    float _639 = _453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _641 = _637;
    if (!_461)
    {
        _633 = _435;
    }
    float _643 = _633;
    float _645 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _507);
    float _647 = _643;
    if (!_461)
    {
        _635 = _435;
    }
    float _649 = _635;
    float _651 = _573 + (-0.5);
    bool _653 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _655 = isnan(_429);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _629 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _667 = _649;
    if (_461)
    {
        _641 = _431;
    }
    float _669 = _641;
    float _671 = _617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_461)
    {
        _647 = _433;
    }
    float _673 = _647;
    float _675 = -_663;
    float _677 = _675 + 1.0;
    if (_461)
    {
        _667 = _433;
    }
    float _679 = _667;
    bool _681 = _561 > 0.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _685 = _429 + _683;
    int _687 = _615 ? 0 : 1;
    int _689 = _627 ? 0 : 1;
    float _691 = fma(_555, _685, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _695 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _697 = isnan(_429);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    bool _707 = _577 > 0.0;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _711 = _577 >= 0.0;
    bool _713 = isnan(_577);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[6].z, _551);
    bool _723 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _725 = isnan(_429);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[83].w, _709);
    float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _739 = _733 * _677;
    float _741 = -_733;
    float _743 = _741 + 1.0;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _747 = _439 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _749 = _705 * _743;
    float _751 = _529 + 0.5;
    float _753 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[83].z, _745);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _757 = _669 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _759 = fma(_747, _751, _521);
    float _761 = _605 * _749;
    float _763 = -_639;
    float _765 = -_645;
    float _767 = fma(_763, _651, _765);
    float _769 = -_755;
    float _771 = fma(_757, 2.0, _769);
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _775 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _777 = -_705;
    float _779 = _777 + 1.0;
    int _781 = ~_687;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _737 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _789 = fma(_775, -2.0, _773);
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[131].x, _761);
    int _793 = _785;
    if (!_597)
    {
        int _795 = ~_687;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = _693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _803 = _603 + 0.5;
    float _805 = _585 + (-0.5);
    float _807 = -_145;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _771);
    float _811 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _789);
    float _813 = fma(_691, _739, _791);
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = _665 + _815;
    bool _819 = !_541;
    int _821 = _819 ? 0 : 1;
    float _823 = fma(_787, _803, _809);
    float _825 = -_801;
    float _827 = -_811;
    float _829 = fma(_825, _805, _827);
    float _831 = _721 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _835 = _671 + _833;
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _839 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[133].x, _813);
    int _841 = ~_689;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    int _851 = _845;
    if (!_681)
    {
        int _853 = ~_689;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _861 = _831 + _859;
    int _863 = abs(_821);
    float _865 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[28].x, _837);
    float _867 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _753);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[28].z, _865);
    float _873 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _875 = -_867;
    float _877 = _875 + 1.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _881 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].z, _869);
    float _883 = -_873;
    float _885 = _883 + 1.0;
    float _887 = -_877;
    float _889 = fma(_603, _887, _823);
    float _891 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].w, _879);
    float _893 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _881);
    float _895 = _817 * _817;
    float _897 = fma(_585, _885, _829);
    bool _899 = _871 >= 0.0;
    float _901 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    float _903 = -_893;
    float _905 = _903 + 1.0;
    float _907 = _849 * _145;
    float _909 = fma(_835, _835, _895);
    float _911 = -_901;
    float _913 = _911 + 1.0;
    float _915 = -_905;
    float _917 = fma(_529, _915, _759);
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _921 = fma(_861, _861, _909);
    float _923 = exp2(_907);
    float _925 = fma(_573, _913, _767);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _929 = 1.0 + _927;
    float _931 = _905;
    float _933 = 1.0;
    if (_899)
    {
        _931 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _931;
    float _937 = rsqrt(_921);
    float _939 = in.m_76.x;
    float _941 = in.m_76.y;
    float _943 = in.m_76.z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _839 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _953 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = 1.0 / _929;
    int _959 = as_type<int>(_935);
    if (_899)
    {
        float _961 = _935 * 5.0;
        _959 = as_type<int>(_961);
    }
    int _963 = _959;
    bool _965 = !_545;
    int _967 = _965 ? 0 : 1;
    out.m_78.x = _917;
    out.m_78.y = _925;
    out.m_78.z = _889;
    out.m_78.w = _897;
    float _969 = float(_863);
    float _971 = float(_799);
    out.m_80.x = _953;
    out.m_80.y = _955;
    out.m_80.z = _949;
    out.m_80.w = _951;
    int _973 = abs(_967);
    bool _975 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _977 = isnan(0.0);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _983 = _979 || _981;
    if (_899)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4845 = as_type<float>(_963);
        out.gl_Position.z = _4845;
    }
    float _985 = _969 * _971;
    bool _987 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _995 = _991 || _993;
    if (_899)
    {
        out.m_63.x = 0.0;
    }
    float _997 = -_923;
    float _999 = _997 + 1.0;
    bool _1001 = !_549;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = _817 * _937;
    float _1007 = _835 * _937;
    if (_899)
    {
        return out;
    }
    float _1009 = -_1005;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _1013 = _861 * _937;
    float _1015 = -_1007;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _1019 = float(_973);
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1023 = _1011 + _1021;
    float _1025 = -_1013;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _831);
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1017 + _1029;
    float _1033 = float(_857);
    float _1035 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1039 = _1027 + _1037;
    float _1041 = _983 ? _999 : 0.0;
    float _1043 = _985 * (-2.0);
    float _1045 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1035);
    float _1047 = _1019 * _1033;
    float _1049 = _431 + (-0.5);
    float _1051 = _1043;
    float _1053 = _1023;
    if (_995)
    {
        float _1055 = _1041 * _957;
        _149 = _1055;
    }
    float _1057 = _149;
    float _1059 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1045);
    float _1061 = fma(_1043, _939, _939);
    float _1063 = fma(_599, _1043, _599);
    int _1065 = _719 ? 0 : 1;
    float _1067 = _433 + (-0.5);
    bool _1069 = _1059 >= 0.0;
    float _1071 = _1047 * (-2.0);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1061);
    int _1075 = abs(_1003);
    float _1077 = fma(_1071, _941, _941);
    float _1079 = fma(_1063, _1057, _1073);
    int _1081 = ~_1065;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    float _1087 = fma(_581, _1071, _581);
    float _1089 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1077);
    int _1091 = _1085;
    if (!_707)
    {
        int _1093 = ~_1065;
        int _1095 = _1093 + 1;
        _1091 = _1095;
    }
    int _1097 = _1091;
    float _1099 = _1079 * 0.15915493667125701904296875;
    int _1101 = _1097;
    if (_1069)
    {
        _1051 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1103 = _1051;
    float _1105 = float(_1075);
    float _1107 = _1099 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = float(_1097);
    if (_1069)
    {
        float _1113 = _1103 * 5.0;
        _1101 = as_type<int>(_1113);
    }
    int _1115 = _1101;
    if (_1069)
    {
        out.m_63.x = 0.0;
    }
    float _1117 = fma(_1087, _1057, _1089);
    float _1119 = _1105 * _1111;
    if (_1069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5067 = as_type<float>(_1115);
        out.gl_Position.z = _5067;
    }
    float _1121 = _1099 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    if (_1069)
    {
        return out;
    }
    float _1125 = -_665;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1129 = _435 + _431;
    float _1131 = -_671;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1117 * 0.15915493667125701904296875;
    float _1137 = _1127 * _1127;
    float _1139 = _1129 + (-1.0);
    float _1141 = -_831;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1145 = _1119 * (-2.0);
    float _1147 = fma(_1133, _1133, _1137);
    float _1149 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1151 = -_1005;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _817);
    float _1155 = _435 + (-0.5);
    float _1157 = fma(_1143, _1143, _1147);
    float _1159 = fma(_1145, _943, _943);
    float _1161 = -_1007;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[18].w, _835);
    float _1165 = _1153 * _1153;
    float _1167 = fma(_1149, _1145, _1149);
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1171 = rsqrt(_1157);
    float _1173 = fma(_1163, _1163, _1165);
    float _1175 = -_1013;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _1179 = fma(_1167, _1057, _1169);
    float _1181 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1185 = fma(_1177, _1177, _1173);
    float _1187 = _1179 * 0.15915493667125701904296875;
    float _1189 = _1135 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = _1133 * _1171;
    float _1195 = _1143 * _1171;
    float _1197 = _1127 * _1171;
    float _1199 = _1135 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1205 = _1193 * _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1195 * _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1213 = _1197 * _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1217 = -_1205;
    float _1219 = fma(_1195, _1215, _1217);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1223 = -_1209;
    float _1225 = fma(_1197, _1221, _1223);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = -_1213;
    float _1231 = fma(_1193, _1227, _1229);
    float _1233 = _1187 * 6.283185482025146484375;
    float _1235 = sin(_1233);
    float _1237 = _1219 * _1219;
    float _1239 = _1109 * _1191;
    float _1241 = fma(_1225, _1225, _1237);
    float _1243 = _1123 * _1191;
    float _1245 = sqrt(_1185);
    float _1247 = fma(_1231, _1231, _1241);
    float _1249 = _1123 * _1201;
    float _1251 = _1187 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = fma(_1235, _1249, _1239);
    float _1257 = fma(_1235, _1239, _1249);
    float _1259 = rsqrt(_1247);
    float _1261 = _937 * _1245;
    float _1263 = _1109 * _1201;
    float _1265 = _1261 * _1181;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1269 = _1267 * 0.5;
    float _1271 = _1123 * _1253;
    float _1273 = _1201 * _1253;
    float _1275 = _1109 * _1253;
    float _1277 = _1191 * _1253;
    float _1279 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1283 = -_1263;
    float _1285 = fma(_1235, _1243, _1283);
    float _1287 = _1261 * _1279;
    float _1289 = _1281 * _1265;
    float _1291 = -_1243;
    float _1293 = fma(_1235, _1263, _1291);
    float _1295 = _1225 * _1259;
    float _1297 = _1183 * _1287;
    float _1299 = _1219 * _1259;
    float _1301 = _1271 * _1289;
    float _1303 = _1231 * _1259;
    float _1305 = -_1289;
    float _1307 = _1235 * _1305;
    float _1309 = _1195 * _1299;
    float _1311 = fma(_1255, _1297, _1301);
    float _1313 = _1197 * _1295;
    float _1315 = _1275 * _1289;
    float _1317 = fma(_1273, _1297, _1307);
    float _1319 = fma(_1285, _1269, _1311);
    float _1321 = -_1309;
    float _1323 = fma(_1197, _1303, _1321);
    float _1325 = -_1313;
    float _1327 = fma(_1193, _1299, _1325);
    float _1329 = fma(_1293, _1297, _1315);
    float _1331 = fma(_1277, _1269, _1317);
    float _1333 = _1323 * _1319;
    float _1335 = _1327 * _1319;
    float _1337 = fma(_1257, _1269, _1329);
    float _1339 = _1193 * _1303;
    float _1341 = fma(_1295, _1331, _1333);
    float _1343 = fma(_1303, _1331, _1335);
    float _1345 = _1271 * _1323;
    float _1347 = -_1339;
    float _1349 = fma(_1195, _1295, _1347);
    float _1351 = fma(_1193, _1337, _1341);
    float _1353 = fma(_1195, _1337, _1343);
    float _1355 = _1271 * _1327;
    float _1357 = _1349 * _1319;
    float _1359 = _671 + _1351;
    float _1361 = _831 + _1353;
    float _1363 = _1271 * _1349;
    float _1365 = _1255 * _1323;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1369 = _1359 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1361 + _1371;
    float _1375 = _1255 * _1349;
    float _1377 = _1255 * _1327;
    float _1379 = _1369 * _1369;
    float _1381 = _1373 * _1373;
    float _1383 = _1285 * _1327;
    float _1385 = fma(_1299, _1331, _1357);
    float _1387 = _1285 * _1323;
    float _1389 = _1379 + _1381;
    float _1391 = _1285 * _1349;
    float _1393 = fma(_1197, _1337, _1385);
    float _1395 = -_1235;
    float _1397 = fma(_1395, _1295, _1345);
    float _1399 = sqrt(_1389);
    float _1401 = -_1235;
    float _1403 = fma(_1401, _1299, _1363);
    float _1405 = -_1235;
    float _1407 = fma(_1405, _1303, _1355);
    float _1409 = _665 + _1393;
    float _1411 = fma(_1273, _1295, _1365);
    float _1413 = fma(_1273, _1299, _1375);
    float _1415 = fma(_1273, _1303, _1377);
    float _1417 = fma(_1277, _1295, _1387);
    float _1419 = fma(_1277, _1299, _1391);
    float _1421 = fma(_1275, _1193, _1397);
    float _1423 = fma(_1275, _1197, _1403);
    float _1425 = fma(_1277, _1303, _1383);
    float _1427 = fma(_1275, _1195, _1407);
    bool _1429 = _1399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1295;
    float _1433 = _1379;
    float _1435 = _1381;
    float _1437 = _1359;
    float _1439 = _1361;
    float _1441 = _1423;
    int _1443 = as_type<int>(_1387);
    float _1445 = _1383;
    float _1447 = _1345;
    if (!_1429)
    {
        _1431 = _1409;
    }
    float _1449 = _1431;
    bool _1451 = !_1429;
    float _1453 = _1449;
    if (!_1451)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1399 + _1457;
        float _1461 = rsqrt(_1389);
        float _1463 = _1459 * _1455;
        float _1465 = _1409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1463 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = fma(_1471, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1479 = _1461 * _1477;
        float _1481 = _1475 + (-1.0);
        float _1483 = fma(_1369, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1485 = fma(_1373, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1487 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1491 = _1483 + _1489;
        float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1495 = _1485 + _1493;
        float _1497 = fma(_1409, _1475, _1487);
        float _1499 = _1491 * _1491;
        float _1501 = _1495 * _1495;
        _1453 = _1497;
        _1433 = _1499;
        _1435 = _1501;
        _1437 = _1483;
        _1439 = _1485;
    }
    float _1503 = _1453;
    float _1505 = _1433;
    float _1507 = _1435;
    float _1509 = _1437;
    float _1511 = _1439;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1515 = _1503 + _1513;
    float _1517 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1519 = fma(_1293, _1193, _1411);
    float _1521 = fma(_1257, _1193, _1417);
    float _1523 = fma(_1515, _1515, _1505);
    float _1525 = fma(_1257, _1197, _1419);
    float _1527 = fma(_1257, _1195, _1425);
    float _1529 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1531 = _1523 + _1507;
    float _1533 = _1517 * _1421;
    float _1535 = fma(_1293, _1197, _1413);
    float _1537 = fma(_1293, _1195, _1415);
    float _1539 = _1517 * _1423;
    float _1541 = _1517 * _1427;
    float _1543 = sqrt(_1531);
    float _1545 = fma(_1529, _1519, _1533);
    float _1547 = fma(_1529, _1535, _1539);
    float _1549 = fma(_1529, _1537, _1541);
    float _1551 = _1521 + _1545;
    float _1553 = _1525 + _1547;
    float _1555 = _1527 + _1549;
    out.m_82.x = _1551;
    out.m_82.y = _1553;
    out.m_82.z = _1555;
    bool _1557 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1559 = isnan(_1543);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1565 = _1561 || _1563;
    if (!_1565)
    {
        _1441 = 1.0;
    }
    float _1567 = _1441;
    bool _1569 = !_1565;
    float _1571 = _1567;
    if (!_1569)
    {
        bool _1573 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1575 = isnan(_1543);
        bool _1577 = _1573 || _1575;
        bool _1579 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1581 = _1577 || _1579;
        if (!_1581)
        {
            float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1585 = _1543 + _1583;
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1595 = 1.0 / _1589;
            float _1597 = _1585 * _1595;
            float _1599 = fma(_1597, _1593, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1571 = _1599;
            _1601 = true;
        }
        else
        {
            bool _1603 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1605 = isnan(_1543);
            bool _1607 = _1603 || _1605;
            bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1611 = _1607 || _1609;
            if (!_1611)
            {
                float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1615 = _1543 + _1613;
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1617 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1625 = 1.0 / _1619;
                float _1627 = _1615 * _1625;
                float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1571 = _1629;
                _1601 = true;
            }
            else
            {
                _1571 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1601 = false;
    float _1631 = _1571;
    float _1633 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1635 = _1011 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1637 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1633);
    float _1639 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1637);
    float _1641 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1643 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1645 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1647 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1641);
    float _1649 = floor(_1643);
    float _1651 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1647);
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1655 = 1.0 / _1645;
    float _1657 = _1653 + _1645;
    float _1659 = -_1649;
    float _1661 = _1643 + _1659;
    float _1663 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _1665 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1663);
    float _1667 = _1657 * _1655;
    float _1669 = _1667 * 0.5;
    float _1671 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _1673 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1665);
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1675);
    float _1679 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1671);
    float _1681 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1683 = 1.0 / _1677;
    float _1685 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1687 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1679);
    float _1689 = _1011 + _1685;
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1693 = trunc(_1681);
    int _1695 = int(_1693);
    float _1697 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1671);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1663);
    float _1701 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1697);
    float _1703 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1699);
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1707 = _1683 * _1705;
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1713 = trunc(_1691);
    int _1715 = int(_1713);
    bool _1717 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1719 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1721 = !_1717;
    int _1723 = _1721 ? 0 : 1;
    float _1725 = trunc(_1709);
    int _1727 = int(_1725);
    int _1729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1731 = _1695 + _1729;
    int _1733 = _1731 + 1;
    int _1735 = 2;
    int _1737 = _1733;
    float _1739 = _1681;
    if (!_1717)
    {
        _1735 = 1;
    }
    int _1741 = _1735;
    float _1743 = trunc(_1711);
    int _1745 = int(_1743);
    int _1747 = _1741;
    if (!_1719)
    {
        _1747 = _1723;
    }
    int _1749 = _1747;
    int _1751 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1753 = _1715 + _1751;
    int _1755 = _1753 + 1;
    int _1757 = _1749 << 6;
    bool _1759 = _1755 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1761 = _1757 + 96;
    uint _1764 = uint(int(uint(_1761) >> uint(2)));
    uint _1766 = uint(int(uint(int(_1764)) >> uint(2)));
    int _1768 = int(_1764) & 3;
    float _1770 = (*spvDescriptorSet0.vp_c15)._m0[int(_1766)][_1768];
    int _1772 = int(_1764) + 1;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    int _1776 = _1772 & 3;
    float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
    int _1780 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1782 = _1727 + _1780;
    int _1784 = _1782 + 1;
    int _1786 = _1755 | _1733;
    bool _1788 = _1784 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1792 = _1745 + _1790;
    int _1794 = _1792 + 1;
    int _1796 = _1757 + 104;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    bool _1814 = _1786 < 0;
    bool _1816 = _1814 || _1759;
    int _1818 = _1784 | _1794;
    bool _1820 = _1733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1822 = _1820 || _1816;
    bool _1824 = _1818 < 0;
    bool _1826 = _1824 || _1788;
    int _1828 = _1757 + 48;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c15)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    bool _1846 = _1794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1848 = _1846 || _1826;
    int _1850 = _1757 + 64;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c15)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[int(_1862)][_1864];
    int _1868 = _1755;
    int _1870 = _1784;
    float _1872 = as_type<float>(_1749);
    if (!_1822)
    {
        int _1874 = _1733 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1876 = _1874 + _1755;
        _1868 = _1876;
    }
    int _1878 = _1868;
    if (!_1848)
    {
        int _1880 = _1794 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1882 = _1880 + _1784;
        _1870 = _1882;
    }
    int _1884 = _1870;
    int _1886 = _1757 + 56;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
    float _1904 = 0.0;
    if (!_1848)
    {
        float _1906 = floor(_1711);
        _1904 = _1906;
    }
    float _1908 = _1904;
    if (!_1848)
    {
        int _1910 = _1884 << 2;
        _1443 = _1910;
    }
    int _1912 = _1443;
    int _1914 = _1912;
    if (!_1848)
    {
        uint _1916 = uint(int(uint(_1884) >> uint(2)));
        _1737 = int(_1916);
    }
    int _1918 = _1737;
    float _1920 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1848)
    {
        int _1922 = 12 & _1912;
        _1914 = _1922;
    }
    int _1924 = _1914;
    int _1926 = _1757 + 72;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    uint _1930 = uint(int(uint(int(_1928)) >> uint(2)));
    int _1932 = int(_1928) & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    int _1936 = int(_1928) + 1;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    int _1940 = _1936 & 3;
    float _1942 = (*spvDescriptorSet0.vp_c15)._m0[int(_1938)][_1940];
    if (!_1848)
    {
        int _1944 = _1918 << 4;
        int _1946 = _1944 + _1924;
        _1445 = as_type<float>(_1946);
    }
    float _1948 = _1445;
    float _1950 = _1689 * _1778;
    float _1952 = _1948;
    int _1954 = as_type<int>(_1950);
    int _1956 = as_type<int>(_1770);
    if (!_1848)
    {
        int _1958 = as_type<int>(_1948) + 400;
        uint _1960 = uint(int(uint(_1958) >> uint(2)));
        uint _1962 = uint(int(uint(int(_1960)) >> uint(2)));
        int _1964 = int(_1960) & 3;
        float _1966 = (*spvDescriptorSet0.vp_c15)._m0[int(_1962)][_1964];
        _1952 = _1966;
    }
    float _1968 = _1952;
    float _1970 = fma(_1017, _1770, _1950);
    if (!_1822)
    {
        int _1972 = _1878 << 2;
        _1954 = _1972;
    }
    int _1974 = _1954;
    float _1976 = _1908;
    int _1978 = _1974;
    if (!_1848)
    {
        float _1980 = -_1908;
        float _1982 = _1711 + _1980;
        _1976 = _1982;
    }
    float _1984 = _1976;
    if (!_1822)
    {
        uint _1986 = uint(int(uint(_1878) >> uint(2)));
        _1956 = int(_1986);
    }
    int _1988 = _1956;
    float _1990 = fma(_1027, _1804, _1970);
    if (!_1822)
    {
        int _1992 = 12 & _1974;
        _1978 = _1992;
    }
    int _1994 = _1978;
    float _1996 = floor(_1920);
    float _1998 = _1990 + _1812;
    if (!_1822)
    {
        int _2000 = _1988 << 4;
        int _2002 = _2000 + _1994;
        _1447 = as_type<float>(_2002);
    }
    float _2004 = _1447;
    int _2006 = _1757 + 88;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c15)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c15)._m0[int(_2018)][_2020];
    float _2024 = _1689 * _1844;
    float _2026 = 1.0 / _1998;
    float _2028 = fma(_1017, _1836, _2024);
    int _2030 = _1757 + 80;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[int(_2042)][_2044];
    float _2048 = _1689 * _1866;
    float _2050 = _1866;
    float _2052 = _2048;
    if (!_1822)
    {
        float _2054 = floor(_1691);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = -_1996;
    float _2060 = _1920 + _2058;
    float _2062 = fma(_1017, _1858, _2048);
    float _2064 = _2004;
    if (!_1822)
    {
        int _2066 = as_type<int>(_2004) + 400;
        uint _2068 = uint(int(uint(_2066) >> uint(2)));
        uint _2070 = uint(int(uint(int(_2068)) >> uint(2)));
        int _2072 = int(_2068) & 3;
        float _2074 = (*spvDescriptorSet0.vp_c15)._m0[int(_2070)][_2072];
        _2064 = _2074;
    }
    float _2076 = _2064;
    float _2078 = fma(_1027, _1894, _2028);
    float _2080 = _1894;
    if (!_1848)
    {
        float _2082 = floor(_1709);
        _2052 = _2082;
    }
    float _2084 = _2052;
    float _2086 = _2078 + _1902;
    float _2088 = _2086 * _2026;
    float _2090 = _1902;
    if (!_1822)
    {
        float _2092 = floor(_1681);
        _2090 = _2092;
    }
    float _2094 = _2090;
    float _2096 = fma(_1027, _1934, _2062);
    float _2098 = _2056;
    if (!_1822)
    {
        float _2100 = -_2056;
        float _2102 = _1691 + _2100;
        _2098 = _2102;
    }
    float _2104 = _2098;
    bool _2106 = _2088 >= 0.0;
    float _2108 = _2096 + _1942;
    bool _2110 = _2088 <= 1.0;
    bool _2112 = _2110 && _2106;
    if (!_1848)
    {
        float _2114 = rint(_1968);
        float _2116 = precise::max(_2114, 0.0);
        uint _2118 = uint(_2116);
        uint _2120 = clamp(_2118, 0u, 65535u);
        _2080 = as_type<float>(_2120);
    }
    float _2122 = _2080;
    float _2124 = _2108 * _2026;
    bool _2126 = _2124 >= 0.0;
    bool _2128 = _2126 && _2112;
    float _2130 = _2094;
    float _2132 = _2124;
    if (!_1822)
    {
        float _2134 = -_2094;
        float _2136 = _1681 + _2134;
        _1739 = _2136;
    }
    float _2138 = _1739;
    if (!_1848)
    {
        float _2140 = -_2084;
        float _2142 = _1709 + _2140;
        _2130 = _2142;
    }
    float _2144 = _2130;
    bool _2146 = _2124 <= 1.0;
    bool _2148 = _2146 && _2128;
    float _2150 = _1689 * _2046;
    float _2152 = fma(_1017, _2038, _2150);
    if (_2148)
    {
        float _2154 = float(_1749);
        _1872 = _2154;
    }
    float _2156 = _1872;
    float _2158 = _1858;
    if (!_1822)
    {
        float _2160 = rint(_2076);
        float _2162 = precise::max(_2160, 0.0);
        uint _2164 = uint(_2162);
        uint _2166 = clamp(_2164, 0u, 65535u);
        _2158 = as_type<float>(_2166);
    }
    float _2168 = _2158;
    float _2170 = fma(_1027, _2014, _2152);
    float _2172 = fma(_1017, 6.2500002968590706586837768554688e-05, 0.5);
    float _2174 = _2170 + _2022;
    float _2176 = fma(_1027, 6.2500002968590706586837768554688e-05, 0.5);
    float _2178 = _2150;
    if (_2148)
    {
        float _2180 = rint(_2156);
        float _2182 = precise::max(_2180, 0.0);
        uint _2184 = uint(_2182);
        uint _2186 = clamp(_2184, 0u, 65535u);
        _2178 = as_type<float>(_2186);
    }
    float _2188 = _2178;
    float _2190 = _2174 * _2026;
    float2 _6819 = float2(_2172, _2176);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6819, float2(0.0), isnan(_6819)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6819, float2(0.0), isnan(_6819)), level(0.0)).x;
    float2 _6829 = float2(_1661, _2060);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6829, float2(0.0), isnan(_6829)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6829, float2(0.0), isnan(_6829)), level(0.0)).x;
    float _2196 = _2168;
    if (!_1822)
    {
        float3 _6844 = float3(_2104, _2138, float(as_type<int>(_2168)));
        float3 _6848 = select(_6844, float3(0.0), isnan(_6844));
        float _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6848.xy, uint(rint(_6848.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6848.xy, uint(rint(_6848.z)), level(0.0)).x;
        _2196 = _2198;
    }
    float _2200 = _2196;
    float _2202 = _2122;
    if (!_1848)
    {
        float3 _6864 = float3(_2144, _1984, float(as_type<int>(_2122)));
        float3 _6866 = select(_6864, float3(0.0), isnan(_6864));
        float _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6866.xy, uint(rint(_6866.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6866.xy, uint(rint(_6866.z)), level(0.0)).x;
        _2202 = _2204;
    }
    float _2206 = _2202;
    float _2208 = _1691;
    if (_2148)
    {
        float3 _6881 = float3(_2088, _2124, float(as_type<int>(_2188)));
        float3 _6883 = select(_6881, float3(0.0), isnan(_6881));
        float _2210 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6883.xy, uint(rint(_6883.z)), _2190, level(0.0));
        _2208 = _2210;
    }
    float _2212 = _2208;
    float _2214 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2216 = _1503 + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2220 = _1509 + _2218;
    bool _2222 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan(0.5);
    bool _2230 = _2226 || _2228;
    float _2232 = fma(_2216, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2234 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2236 = _1511 + _2234;
    float _2238 = fma(_2220, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2240 = -_1005;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2244 = fma(_2236, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2246 = -_1007;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2250 = -_1013;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2244);
    float _2254 = _2248;
    float _2256 = _2252;
    if (_2230)
    {
        _2132 = _2242;
    }
    float _2258 = _2132;
    float _2260 = _2258;
    if (!_2230)
    {
        float _2262 = _1023 * _1023;
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2266 = -_831;
        float _2268 = _2266 + _2244;
        float _2270 = -_665;
        float _2272 = _2270 + _2232;
        float _2274 = fma(_1031, _1031, _2262);
        float _2276 = -_671;
        float _2278 = _2276 + _2238;
        float _2280 = fma(_1039, _1039, _2274);
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2284 = sqrt(_2280);
        float _2286 = 1.0 / _1261;
        float _2288 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2290 = precise::min(_2284, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2292 = _2290 * _2264;
        float _2294 = _2292 * _2286;
        float _2296 = _2288 * _2294;
        float _2298 = _2268 * _2294;
        float _2300 = fma(_2272, _2296, _1011);
        float _2302 = fma(_2278, _2296, _1017);
        float _2304 = fma(_2288, _2298, _1027);
        _2260 = _2300;
        _2254 = _2302;
        _2256 = _2304;
    }
    float _2306 = _2260;
    float _2308 = _2254;
    float _2310 = _2256;
    float _2312 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2318 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(0.5);
    bool _2326 = _2322 || _2324;
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2312);
    float _2330 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2314);
    float _2332 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2316);
    float _2334 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2336 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2328);
    float _2338 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2330);
    float _2340 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2342 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2334);
    float _2344 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2346 = _2338 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2348 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2350 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2342);
    float _2352 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2356 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2358 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2360 = abs(_2192);
    bool _2362 = _2360 != 0.0;
    bool _2364 = isnan(_2360);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan(0.0);
    bool _2370 = _2366 || _2368;
    float _2372 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2352);
    float _2374 = _2350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2376 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2358);
    float _2378 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2354);
    float _2380 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2356);
    float _2382 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2372);
    float _2384 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2376);
    float _2386 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2378);
    float _2388 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    float _2390 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2382);
    float _2392 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2384);
    float _2394 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2386);
    float _2396 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2388);
    float _2398 = _2374;
    float _2400 = _2356;
    float _2402 = _2384;
    float _2404 = _2380;
    if (_2326)
    {
        _2398 = 1.0;
    }
    float _2406 = _2398;
    float _2408 = _2406;
    if (_2370)
    {
        _2400 = _2392;
    }
    float _2410 = _2400;
    float _2412 = _2410;
    if (!_2370)
    {
        _2412 = 0.0;
    }
    float _2414 = _2412;
    float _2416 = _2414;
    if (!_2326)
    {
        float _2418 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2420 = _2418 * 0.15915493667125701904296875;
        float _2422 = _2420 * 6.283185482025146484375;
        float _2424 = cos(_2422);
        float _2426 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2428 = _2426 * 0.15915493667125701904296875;
        float _2430 = _2420 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = 1.0 / _2424;
        float _2436 = _2428 * 6.283185482025146484375;
        float _2438 = cos(_2436);
        float _2440 = _2432 * _2434;
        float _2442 = _2428 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2446;
        float _2450 = _2438 * _2440;
        float _2452 = 1.0 / _2448;
        float _2454 = 1.0 / _2450;
        float _2456 = _2444 * _2454;
        float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2460 = fma(_1707, _2456, _2458);
        float _2462 = _2460 * _2452;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        _2402 = _2452;
        _1053 = _2428;
        _2404 = _2454;
        _2408 = _2464;
    }
    float _2466 = _2402;
    float _2468 = _1053;
    float _2470 = _2404;
    float _2472 = _2408;
    out.gl_Position.x = _2390;
    out.gl_Position.y = _2394;
    out.gl_Position.z = _2396;
    out.gl_Position.w = _2392;
    float _2474 = _2466;
    float _2476 = _2468;
    float _2478 = _2470;
    if (!_2370)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1822)
    {
        int _2480 = _1878 << 4;
        int _2482 = _2480 + 2048;
        uint _2484 = uint(int(uint(_2482) >> uint(2)));
        uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
        int _2488 = int(_2484) & 3;
        float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
        int _2492 = int(_2484) + 1;
        uint _2494 = uint(int(uint(_2492) >> uint(2)));
        int _2496 = _2492 & 3;
        float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
        int _2500 = _2482 + 8;
        uint _2502 = uint(int(uint(_2500) >> uint(2)));
        uint _2504 = uint(int(uint(int(_2502)) >> uint(2)));
        int _2506 = int(_2502) & 3;
        float _2508 = (*spvDescriptorSet0.vp_c15)._m0[int(_2504)][_2506];
        int _2510 = int(_2502) + 1;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        int _2514 = _2510 & 3;
        float _2516 = (*spvDescriptorSet0.vp_c15)._m0[int(_2512)][_2514];
        float _2518 = _1635 * _2498;
        float _2520 = fma(_1017, _2490, _2518);
        float _2522 = fma(_1027, _2508, _2520);
        float _2524 = _2522 + _2516;
        float _2526 = precise::clamp(_2524, 0.0, 1.0);
        float _2528 = -_2526;
        float _2530 = _2528 + _2200;
        float _2532 = fma(_2530, 500.0, 1.5);
        float _2534 = exp2(_2532);
        float _2536 = 0.0 + _2534;
        float _2538 = precise::clamp(_2536, 0.0, 1.0);
        bool _2540 = _2538 >= 1.0;
        bool _2542 = isnan(_2538);
        bool _2544 = _2540 || _2542;
        bool _2546 = isnan(1.0);
        bool _2548 = _2544 || _2546;
        _2474 = _2490;
        _2476 = _2498;
        if (!_2548)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2548)
        {
            _2416 = 0.0;
        }
    }
    float _2550 = _2474;
    float _2552 = _2476;
    float _2554 = _2416;
    float _2556 = _2552;
    float _2558 = _2550;
    if (_1848)
    {
        _2478 = 1.0;
    }
    float _2560 = _2478;
    float _2562 = _2560;
    if (!_1848)
    {
        int _2564 = _1884 << 4;
        int _2566 = _2564 + 2048;
        uint _2568 = uint(int(uint(_2566) >> uint(2)));
        uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
        int _2572 = int(_2568) & 3;
        float _2574 = (*spvDescriptorSet0.vp_c15)._m0[int(_2570)][_2572];
        int _2576 = int(_2568) + 1;
        uint _2578 = uint(int(uint(_2576) >> uint(2)));
        int _2580 = _2576 & 3;
        float _2582 = (*spvDescriptorSet0.vp_c15)._m0[int(_2578)][_2580];
        int _2584 = _2566 + 8;
        uint _2586 = uint(int(uint(_2584) >> uint(2)));
        uint _2588 = uint(int(uint(int(_2586)) >> uint(2)));
        int _2590 = int(_2586) & 3;
        float _2592 = (*spvDescriptorSet0.vp_c15)._m0[int(_2588)][_2590];
        int _2594 = int(_2586) + 1;
        uint _2596 = uint(int(uint(_2594) >> uint(2)));
        int _2598 = _2594 & 3;
        float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
        float _2602 = _1689 * _2582;
        float _2604 = fma(_1017, _2574, _2602);
        float _2606 = fma(_1027, _2592, _2604);
        float _2608 = _2606 + _2600;
        float _2610 = precise::clamp(_2608, 0.0, 1.0);
        float _2612 = -_2610;
        float _2614 = _2612 + _2206;
        float _2616 = fma(_2614, 500.0, 1.5);
        float _2618 = exp2(_2616);
        float _2620 = 0.0 + _2618;
        float _2622 = precise::clamp(_2620, 0.0, 1.0);
        _2556 = _2582;
        _2558 = _2574;
        _2562 = _2622;
    }
    float _2624 = _2556;
    float _2626 = _2558;
    float _2628 = _2562;
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2632 = _2306 + _2630;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2308 + _2634;
    float _2638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2640 = _2310 + _2638;
    float _2642 = _2632 * _2632;
    float _2644 = fma(_2636, _2636, _2642);
    float _2646 = fma(_2640, _2640, _2644);
    float _2648 = rsqrt(_2646);
    float _2650 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2652 = _2636 * _2650;
    float _2654 = _2640 * _2650;
    float _2656 = _2652 * _2652;
    float _2658 = _2654 * _2654;
    float _2660 = _2656 + _2658;
    float _2662 = sqrt(_2660);
    bool _2664 = _2662 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2668 = _2662 + _2666;
    float _2670 = _2640;
    float _2672 = _2660;
    float _2674 = _2668;
    float _2676 = _2624;
    float _2678 = _2626;
    float _2680 = _2632;
    float _2682 = _2652;
    if (_2664)
    {
        float _2684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2684;
    }
    float _2686 = _2670;
    if (_2664)
    {
        float _2688 = rsqrt(_2660);
        _2672 = _2688;
    }
    float _2690 = _2672;
    float _2692 = _2690;
    if (_2664)
    {
        float _2694 = _2668 * _2686;
        _2674 = _2694;
    }
    float _2696 = _2674;
    if (_2664)
    {
        float _2698 = _2696 * 0.15915493667125701904296875;
        _2676 = _2698;
    }
    float _2700 = _2676;
    float _2702 = _2686;
    if (_2664)
    {
        float _2704 = _2700 * 6.283185482025146484375;
        float _2706 = sin(_2704);
        _2702 = _2706;
    }
    float _2708 = _2702;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2712 = precise::max(0.0, _2710);
    float _2714 = _2642;
    float _2716 = _2712;
    if (_2664)
    {
        float _2718 = _2700 * 6.283185482025146484375;
        float _2720 = cos(_2718);
        _2714 = _2720;
    }
    float _2722 = _2714;
    float _2724 = -_2650;
    float _2726 = -_2712;
    float _2728 = fma(_2632, _2724, _2726);
    if (_2664)
    {
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2716 = _2730;
    }
    float _2732 = _2716;
    float _2734 = _2708;
    float _2736 = _2732;
    if (_2664)
    {
        float _2738 = fma(_2708, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2678 = _2738;
    }
    float _2740 = _2678;
    float _2742 = _2740;
    if (!_2664)
    {
        _2734 = _2728;
    }
    float _2744 = _2734;
    float _2746 = _2744;
    float _2748 = _2722;
    if (_2664)
    {
        float _2750 = _2722 + (-1.0);
        _2680 = _2750;
    }
    float _2752 = _2680;
    float _2754 = _2752;
    if (_2664)
    {
        float _2756 = _2690 * _2740;
        _2742 = _2756;
    }
    float _2758 = _2742;
    if (!_2664)
    {
        _2692 = _2656;
    }
    float _2760 = _2692;
    float _2762 = _2760;
    if (_2664)
    {
        float _2764 = _2752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2736 = _2764;
    }
    float _2766 = _2736;
    if (_2664)
    {
        float _2768 = _2652 * _2758;
        _2682 = _2768;
    }
    float _2770 = _2682;
    if (!_2664)
    {
        _2754 = _2654;
    }
    float _2772 = _2754;
    float _2774 = _2772;
    if (_2664)
    {
        float _2776 = _2654 * _2758;
        _2774 = _2776;
    }
    float _2778 = _2774;
    if (_2664)
    {
        float _2780 = fma(_2728, _2722, _2766);
        _2746 = _2780;
    }
    float _2782 = _2746;
    if (_2664)
    {
        float _2784 = _2770 * _2770;
        _2762 = _2784;
    }
    float _2786 = _2762;
    float _2788 = sqrt(_2646);
    if (!_2664)
    {
        _2748 = _2658;
    }
    float _2790 = _2748;
    float _2792 = _2790;
    if (_2664)
    {
        float _2794 = _2778 * _2778;
        _2792 = _2794;
    }
    float _2796 = _2792;
    float _2798 = fma(_2782, _2782, _2786);
    float _2800 = _2798 + _2796;
    float _2802 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2804 = 1.0 / _2554;
    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2808 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2806);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = rsqrt(_2800);
    float _2814 = -_2810;
    float _2816 = _2814 + 1.0;
    float _2818 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2820 = -_2818;
    float _2822 = fma(_2820, _2802, 1.0);
    float _2824 = abs(_2816);
    float _2826 = log2(_2824);
    float _2828 = _2390 * _2804;
    float _2830 = fma(_2828, 0.5, 0.5);
    float _2832 = _2812 * _2770;
    float _2834 = _2812 * _2782;
    float _2836 = _2812 * _2778;
    float _2838 = log2(_2822);
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2842 = -_2840;
    float _2844 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2842);
    float _2846 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2848 = -_2836;
    float _2850 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2844);
    float _2852 = _2834 + 1.0;
    float _2854 = exp2(_2846);
    float _2856 = fma(_2850, -0.5, 0.5);
    float _2858 = fma(_2850, 0.5, 0.5);
    float _2860 = _2838 * 0.693147182464599609375;
    float _2862 = fma(_2858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2864 = sqrt(_2856);
    float _2866 = fma(_2858, _2862, -0.212114393711090087890625);
    float _2868 = fma(_2858, _2866, 1.570728778839111328125);
    float _2870 = _2394 * _2804;
    float _2872 = -_2834;
    float _2874 = fma(_2854, _2852, _2872);
    float _2876 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2878 = fma(_2870, -0.5, 0.5);
    float _2880 = fma(_2874, 0.5, 0.5);
    float _2882 = _2864 * 0.636619746685028076171875;
    float3 _7948 = float3(_2830, _2878, _2876);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7948, float3(0.0), isnan(_7948)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7948, float3(0.0), isnan(_7948)), level(0.0)).x;
    float _2886 = -_2868;
    float _2888 = fma(_2882, _2886, 1.0);
    float3 _7962 = float3(_2830, _2878, _2876);
    float4 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7962, float3(0.0), isnan(_7962)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7962, float3(0.0), isnan(_7962)), level(0.0)).xyzw;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float _2899 = _2891.w;
    float2 _7978 = float2(_2888, _2880);
    float3 _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7978, float2(0.0), isnan(_7978)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7978, float2(0.0), isnan(_7978)), level(0.0)).xyz;
    float _2905 = _2903.x;
    float _2907 = _2903.y;
    float _2909 = _2903.z;
    float _2911 = abs(_1707);
    float _2913 = log2(_2911);
    float _2915 = _2392 * 0.5;
    float _2917 = _2396 + _2392;
    float _2919 = _2390 + _2392;
    float _2921 = -_2194;
    float _2923 = _2921 + 1.0;
    float _2925 = fma(_2394, -0.5, _2915);
    float _2927 = _2917 * 0.5;
    float _2929 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2931 = _1707 <= 8000.0;
    bool _2933 = isnan(_1707);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan(8000.0);
    bool _2939 = _2935 || _2937;
    float _2941 = float(_2939);
    float _2943 = _2919 * 0.5;
    float _2945 = _2826;
    if (!_2148)
    {
        _2945 = 1.0;
    }
    float _2947 = _2945;
    float _2949 = _2947;
    if (_2148)
    {
        bool _2951 = _2212 >= _2190;
        bool _2953 = isnan(_2212);
        bool _2955 = _2951 || _2953;
        bool _2957 = isnan(_2190);
        bool _2959 = _2955 || _2957;
        float _2961 = float(_2959);
        _2949 = _2961;
    }
    float _2963 = _2949;
    float _2965 = exp2(_2929);
    float _2967 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_84.x = _2943;
    out.m_84.y = _2925;
    out.m_84.z = _2927;
    out.m_84.w = _2392;
    bool _2969 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2971 = isnan(_2788);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2977 = _2973 || _2975;
    float _2979 = _2963 * _2628;
    float _2981 = exp2(_2967);
    float _2983 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2985 = fma(_2981, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2987 = precise::clamp(_2985, 0.0, 1.0);
    float _2989 = fma(_2987, -2.0, 3.0);
    float _2991 = _2987 * _2987;
    float _2993 = _2991 * _2989;
    float _2995 = -_2993;
    float _2997 = _2995 + 1.0;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2993);
    float _3001 = _2941 * _2999;
    float _3003 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3005 = -_2965;
    float _3007 = _3005 + 1.0;
    float _3009 = _2923 * _3003;
    float _3011 = precise::clamp(_3009, 0.0, 1.0);
    float _3013 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3015 = _3003;
    float _3017 = _2979;
    if (!_2977)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3019 = _3015;
    float _3021 = -_3011;
    float _3023 = fma(_3021, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3025 = _3019;
    float _3027 = _3019;
    if (!_2977)
    {
        _933 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3029 = _933;
    float _3031 = -_2979;
    float _3033 = fma(_3031, _3023, 1.0);
    float _3035 = precise::clamp(_3033, 0.0, 1.0);
    float _3037 = _3035;
    float _3039 = _3029;
    float _3041 = _3029;
    if (!_2977)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3043 = _3017;
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3047 = _3043;
    float _3049 = _3043;
    if (!_2977)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3051 = _3037;
    out.m_86.x = _3045;
    float _3053 = _3013 * _2884;
    float _3055 = -_3013;
    float _3057 = _3055 + 1.0;
    float _3059 = _2899 * _3053;
    float _3061 = _2899 * _3057;
    float _3063 = _3057;
    float _3065 = _3053;
    float _3067 = _3051;
    float _3069 = _3051;
    if (!_2977)
    {
        _3063 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3071 = _3063;
    float _3073 = _2909 * _3053;
    float _3075 = fma(_2905, _3059, _2893);
    float _3077 = fma(_2907, _3059, _2895);
    float _3079 = _3071;
    float _3081 = _3071;
    if (!_2977)
    {
        _3065 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3083 = _3065;
    float _3085 = fma(_2899, _3073, _2897);
    out.m_88.x = _3075;
    out.m_88.y = _3077;
    out.m_88.z = _3085;
    out.m_88.w = _3061;
    bool _3087 = !_2977;
    float _3089 = _3083;
    float _3091 = _3083;
    if (!_3087)
    {
        bool _3093 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3095 = isnan(_2788);
        bool _3097 = _3093 || _3095;
        bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3101 = _3097 || _3099;
        if (!_3101)
        {
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3105 = _2788 + _3103;
            float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3107;
            float _3111 = 1.0 / _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3129 = _3105 * _3111;
            float _3131 = precise::clamp(_3129, 0.0, 1.0);
            float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3141 = fma(_3131, _3115, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3143 = fma(_3131, _3135, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3145 = fma(_3131, _3139, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3147 = fma(_3131, _3119, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3149 = fma(_3131, _3123, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3151 = fma(_3131, _3127, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3049 = _3145;
            _3069 = _3149;
            _3027 = _3143;
            _3081 = _3147;
            _3091 = _3141;
            _3041 = _3151;
            _3153 = true;
        }
        else
        {
            bool _3155 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3157 = isnan(_2788);
            bool _3159 = _3155 || _3157;
            bool _3161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3163 = _3159 || _3161;
            if (!_3163)
            {
                _3025 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3165 = _3025;
            _3027 = _3165;
            if (!_3163)
            {
                _3047 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3167 = _3047;
            _3049 = _3167;
            if (!_3163)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3169 = _3089;
            _3091 = _3169;
            if (!_3163)
            {
                _3079 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3171 = _3079;
            _3081 = _3171;
            if (!_3163)
            {
                _3067 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3173 = _3067;
            _3069 = _3173;
            if (!_3163)
            {
                _3039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3175 = _3039;
            bool _3177 = !_3163;
            _3041 = _3175;
            if (!_3177)
            {
                bool _3179 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3181 = isnan(_2788);
                bool _3183 = _3179 || _3181;
                bool _3185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3187 = _3183 || _3185;
                if (!_3187)
                {
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3191 = _2788 + _3189;
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3193;
                    float _3197 = 1.0 / _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3215 = _3191 * _3197;
                    float _3217 = precise::clamp(_3215, 0.0, 1.0);
                    float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3227 = fma(_3217, _3201, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3229 = fma(_3217, _3221, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3231 = fma(_3217, _3225, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3233 = fma(_3217, _3205, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3235 = fma(_3217, _3209, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3237 = fma(_3217, _3213, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3049 = _3231;
                    _3069 = _3235;
                    _3027 = _3229;
                    _3081 = _3233;
                    _3091 = _3227;
                    _3041 = _3237;
                    _3153 = true;
                }
                else
                {
                    _3049 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3069 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3027 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3081 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3153 = false;
    float _3239 = _3049;
    float _3241 = _3069;
    float _3243 = _3027;
    float _3245 = _3081;
    float _3247 = _3091;
    float _3249 = _3041;
    float _3251 = _2983 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3253 = fma(_1553, -0.5, 0.5);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = -_3239;
    float _3259 = _3257 + _3241;
    float _3261 = -_3243;
    float _3263 = _3261 + _3245;
    out.m_90.x = 0.0;
    float _3265 = -_3247;
    float _3267 = _3265 + _3249;
    float _3269 = fma(_3255, _3259, _3239);
    float _3271 = fma(_3255, _3263, _3243);
    bool _3273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3269 * 0.586610972881317138671875;
    float _3277 = fma(_3255, _3267, _3247);
    out.m_63.x = _3251;
    bool _3279 = _2472 > 0.0;
    bool _3281 = isnan(_2472);
    bool _3283 = _3279 || _3281;
    bool _3285 = isnan(0.0);
    bool _3287 = _3283 || _3285;
    float _3289 = fma(_3271, 0.298911988735198974609375, _3275);
    float _3291 = fma(_3277, 0.114477999508380889892578125, _3289);
    float _3293 = -_3291;
    float _3295 = _3271 + _3293;
    float _3297 = -_3291;
    float _3299 = _3269 + _3297;
    float _3301 = -_3291;
    float _3303 = _3277 + _3301;
    float _3305 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    float _3307 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    float _3309 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    bool _3311 = !_3273;
    if (!_3311)
    {
        float _3313 = -_2306;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3317 = -_2308;
        float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3321 = -_2310;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3325 = _3315 * _3315;
        float _3327 = fma(_3319, _3319, _3325);
        float _3329 = fma(_3323, _3323, _3327);
        float _3331 = sqrt(_3329);
        float _3333 = rsqrt(_3329);
        float _3335 = -_3331;
        float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3339 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3341 = precise::clamp(_3339, 0.0, 1.0);
        float _3343 = _3319 * _3333;
        float _3345 = _3315 * _3333;
        float _3347 = abs(_3341);
        float _3349 = log2(_3347);
        float _3351 = _3323 * _3333;
        float _3353 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3355 = _1553 * _3345;
        float _3357 = -_3345;
        float _3359 = -_3353;
        float _3361 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3359);
        float _3363 = fma(_1551, _3343, _3355);
        float _3365 = -_3351;
        float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3361);
        float _3369 = fma(_1555, _3351, _3363);
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3375 = _3367 + _3373;
        float _3377 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3379 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = exp2(_3377);
        float _3385 = _3383 * _3381;
        float _3387 = _3371 * _3385;
        float _3389 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3391 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3393 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3389;
        out.m_90.y = _3391;
        out.m_90.z = _3393;
    }
    out.m_92.x = _3305;
    out.m_92.y = _3307;
    out.m_92.z = _3309;
    if (_3287)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3153 = false;
    bool _1601 = false;
    bool _421 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_60.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_63.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_127);
        out.gl_Position.z = _3452;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_65.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_63.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_165);
        out.gl_Position.z = _3521;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_70.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_70.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_72.x;
    float _395 = in.m_72.y;
    out.m_74.x = _385;
    out.m_74.y = _387;
    out.m_74.z = _389;
    out.m_74.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _419;
    if (!_401)
    {
        float _403 = in.m_70.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_111);
        float _425 = 1.0 / _423;
        float _427 = _145 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_70.x;
    float _433 = in.m_70.y;
    float _435 = in.m_70.z;
    float _437 = in.m_70.w;
    float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _451 = _449 != 0;
    float _453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _457 = _455 != 0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _461 = _459 != 0;
    float _463 = in.m_60.x;
    float _465 = in.m_60.y;
    float _467 = in.m_60.z;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _475 = _437 > 0.5;
    float _477 = 1.0 / _471;
    float _479 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _481 = _431 > 0.5;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _485 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _491 = -_185;
    int _493 = _475 ? as_type<int>(_491) : as_type<int>(_185);
    float _495 = -_473;
    float _497 = fma(_479, 2.0, _495);
    bool _499 = _433 > 0.5;
    float _501 = 1.0 / _489;
    float _503 = -_181;
    int _505 = _481 ? as_type<int>(_503) : as_type<int>(_181);
    float _507 = fma(_485, -2.0, _483);
    float _509 = _435 * 2.0;
    float _511 = _465 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _513 = _431 * 2.0;
    float _515 = -_185;
    float _517 = _499 ? _515 : _185;
    float _519 = -_145;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[76].x, _497);
    float _523 = _465 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _525 = _465 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _527 = !_443;
    float _529 = _527 ? _181 : as_type<float>(_505);
    float _531 = floor(_509);
    float _533 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].x, _523);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _541 = _539 != 0;
    int _543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _545 = _543 != 0;
    int _547 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _549 = _547 != 0;
    float _551 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].x, _525);
    float _553 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _555 = _537 * _477;
    float _557 = _433 * 2.0;
    float _559 = _433 + _435;
    float _561 = floor(_513);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _563;
    float _567 = _559 + (-1.0);
    float _569 = _565 * _501;
    bool _571 = !_447;
    float _573 = _571 ? _185 : _517;
    float _575 = _433 + _431;
    float _577 = floor(_557);
    bool _579 = _435 > 0.5;
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _583 = !_457;
    float _585 = _583 ? _185 : as_type<float>(_493);
    float _587 = _575 + (-1.0);
    float _589 = -_181;
    int _591 = _579 ? as_type<int>(_589) : as_type<int>(_181);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _595 = _429 + _593;
    bool _597 = _531 > 0.0;
    float _599 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _601 = !_451;
    float _603 = _601 ? _181 : as_type<float>(_591);
    float _605 = fma(_569, _595, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _607 = _531 >= 0.0;
    bool _609 = isnan(_531);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[4].z, _533);
    bool _619 = _561 >= 0.0;
    bool _621 = isnan(_561);
    bool _623 = _619 || _621;
    bool _625 = isnan(0.0);
    bool _627 = _623 || _625;
    float _629 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
    float _631 = _531;
    float _633 = _517;
    float _635 = _587;
    if (!_461)
    {
        _631 = _433;
    }
    float _637 = _631;
    float _639 = _453 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _641 = _637;
    if (!_461)
    {
        _633 = _435;
    }
    float _643 = _633;
    float _645 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _507);
    float _647 = _643;
    if (!_461)
    {
        _635 = _435;
    }
    float _649 = _635;
    float _651 = _573 + (-0.5);
    bool _653 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _655 = isnan(_429);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _629 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _667 = _649;
    if (_461)
    {
        _641 = _431;
    }
    float _669 = _641;
    float _671 = _617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    if (_461)
    {
        _647 = _433;
    }
    float _673 = _647;
    float _675 = -_663;
    float _677 = _675 + 1.0;
    if (_461)
    {
        _667 = _433;
    }
    float _679 = _667;
    bool _681 = _561 > 0.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _685 = _429 + _683;
    int _687 = _615 ? 0 : 1;
    int _689 = _627 ? 0 : 1;
    float _691 = fma(_555, _685, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _695 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _697 = isnan(_429);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    bool _707 = _577 > 0.0;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _711 = _577 >= 0.0;
    bool _713 = isnan(_577);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma(_467, (*spvDescriptorSet0.vp_c10)._m0[6].z, _551);
    bool _723 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _725 = isnan(_429);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[83].w, _709);
    float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _739 = _733 * _677;
    float _741 = -_733;
    float _743 = _741 + 1.0;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _747 = _439 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _749 = _705 * _743;
    float _751 = _529 + 0.5;
    float _753 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[83].z, _745);
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _757 = _669 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _759 = fma(_747, _751, _521);
    float _761 = _605 * _749;
    float _763 = -_639;
    float _765 = -_645;
    float _767 = fma(_763, _651, _765);
    float _769 = -_755;
    float _771 = fma(_757, 2.0, _769);
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _775 = _673 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _777 = -_705;
    float _779 = _777 + 1.0;
    int _781 = ~_687;
    int _783 = _781 + 1;
    int _785 = _783 + 1;
    float _787 = _737 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _789 = fma(_775, -2.0, _773);
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[131].x, _761);
    int _793 = _785;
    if (!_597)
    {
        int _795 = ~_687;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = _693 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _803 = _603 + 0.5;
    float _805 = _585 + (-0.5);
    float _807 = -_145;
    float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[81].x, _771);
    float _811 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _789);
    float _813 = fma(_691, _739, _791);
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _817 = _665 + _815;
    bool _819 = !_541;
    int _821 = _819 ? 0 : 1;
    float _823 = fma(_787, _803, _809);
    float _825 = -_801;
    float _827 = -_811;
    float _829 = fma(_825, _805, _827);
    float _831 = _721 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _835 = _671 + _833;
    float _837 = _817 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _839 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[133].x, _813);
    int _841 = ~_689;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    int _851 = _845;
    if (!_681)
    {
        int _853 = ~_689;
        int _855 = _853 + 1;
        _851 = _855;
    }
    int _857 = _851;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _861 = _831 + _859;
    int _863 = abs(_821);
    float _865 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[28].x, _837);
    float _867 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _753);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _871 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[28].z, _865);
    float _873 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _875 = -_867;
    float _877 = _875 + 1.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _881 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].z, _869);
    float _883 = -_873;
    float _885 = _883 + 1.0;
    float _887 = -_877;
    float _889 = fma(_603, _887, _823);
    float _891 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].w, _879);
    float _893 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _881);
    float _895 = _817 * _817;
    float _897 = fma(_585, _885, _829);
    bool _899 = _871 >= 0.0;
    float _901 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _891);
    float _903 = -_893;
    float _905 = _903 + 1.0;
    float _907 = _849 * _145;
    float _909 = fma(_835, _835, _895);
    float _911 = -_901;
    float _913 = _911 + 1.0;
    float _915 = -_905;
    float _917 = fma(_529, _915, _759);
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _921 = fma(_861, _861, _909);
    float _923 = exp2(_907);
    float _925 = fma(_573, _913, _767);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _929 = 1.0 + _927;
    float _931 = _905;
    float _933 = 1.0;
    if (_899)
    {
        _931 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _935 = _931;
    float _937 = rsqrt(_921);
    float _939 = in.m_76.x;
    float _941 = in.m_76.y;
    float _943 = in.m_76.z;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = _919 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _839 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _953 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = 1.0 / _929;
    int _959 = as_type<int>(_935);
    if (_899)
    {
        float _961 = _935 * 5.0;
        _959 = as_type<int>(_961);
    }
    int _963 = _959;
    bool _965 = !_545;
    int _967 = _965 ? 0 : 1;
    out.m_78.x = _917;
    out.m_78.y = _925;
    out.m_78.z = _889;
    out.m_78.w = _897;
    float _969 = float(_863);
    float _971 = float(_799);
    out.m_80.x = _953;
    out.m_80.y = _955;
    out.m_80.z = _949;
    out.m_80.w = _951;
    int _973 = abs(_967);
    bool _975 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _977 = isnan(0.0);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _983 = _979 || _981;
    if (_899)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4845 = as_type<float>(_963);
        out.gl_Position.z = _4845;
    }
    float _985 = _969 * _971;
    bool _987 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _989 = isnan(1.0);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _995 = _991 || _993;
    if (_899)
    {
        out.m_63.x = 0.0;
    }
    float _997 = -_923;
    float _999 = _997 + 1.0;
    bool _1001 = !_549;
    int _1003 = _1001 ? 0 : 1;
    float _1005 = _817 * _937;
    float _1007 = _835 * _937;
    if (_899)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1009 = -_1005;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _665);
    float _1013 = _861 * _937;
    float _1015 = -_1007;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _1019 = float(_973);
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1023 = _1011 + _1021;
    float _1025 = -_1013;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _831);
    float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1031 = _1017 + _1029;
    float _1033 = float(_857);
    float _1035 = _1023 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1039 = _1027 + _1037;
    float _1041 = _983 ? _999 : 0.0;
    float _1043 = _985 * (-2.0);
    float _1045 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1035);
    float _1047 = _1019 * _1033;
    float _1049 = _431 + (-0.5);
    float _1051 = _1043;
    float _1053 = _1023;
    if (_995)
    {
        float _1055 = _1041 * _957;
        _149 = _1055;
    }
    float _1057 = _149;
    float _1059 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1045);
    float _1061 = fma(_1043, _939, _939);
    float _1063 = fma(_599, _1043, _599);
    int _1065 = _719 ? 0 : 1;
    float _1067 = _433 + (-0.5);
    bool _1069 = _1059 >= 0.0;
    float _1071 = _1047 * (-2.0);
    float _1073 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1061);
    int _1075 = abs(_1003);
    float _1077 = fma(_1071, _941, _941);
    float _1079 = fma(_1063, _1057, _1073);
    int _1081 = ~_1065;
    int _1083 = _1081 + 1;
    int _1085 = _1083 + 1;
    float _1087 = fma(_581, _1071, _581);
    float _1089 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1077);
    int _1091 = _1085;
    if (!_707)
    {
        int _1093 = ~_1065;
        int _1095 = _1093 + 1;
        _1091 = _1095;
    }
    int _1097 = _1091;
    float _1099 = _1079 * 0.15915493667125701904296875;
    int _1101 = _1097;
    if (_1069)
    {
        _1051 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1103 = _1051;
    float _1105 = float(_1075);
    float _1107 = _1099 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = float(_1097);
    if (_1069)
    {
        float _1113 = _1103 * 5.0;
        _1101 = as_type<int>(_1113);
    }
    int _1115 = _1101;
    if (_1069)
    {
        out.m_63.x = 0.0;
    }
    float _1117 = fma(_1087, _1057, _1089);
    float _1119 = _1105 * _1111;
    if (_1069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5067 = as_type<float>(_1115);
        out.gl_Position.z = _5067;
    }
    float _1121 = _1099 * 6.283185482025146484375;
    float _1123 = cos(_1121);
    if (_1069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1125 = -_665;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1129 = _435 + _431;
    float _1131 = -_671;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1117 * 0.15915493667125701904296875;
    float _1137 = _1127 * _1127;
    float _1139 = _1129 + (-1.0);
    float _1141 = -_831;
    float _1143 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1145 = _1119 * (-2.0);
    float _1147 = fma(_1133, _1133, _1137);
    float _1149 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1151 = -_1005;
    float _1153 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _817);
    float _1155 = _435 + (-0.5);
    float _1157 = fma(_1143, _1143, _1147);
    float _1159 = fma(_1145, _943, _943);
    float _1161 = -_1007;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[18].w, _835);
    float _1165 = _1153 * _1153;
    float _1167 = fma(_1149, _1145, _1149);
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1159);
    float _1171 = rsqrt(_1157);
    float _1173 = fma(_1163, _1163, _1165);
    float _1175 = -_1013;
    float _1177 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _1179 = fma(_1167, _1057, _1169);
    float _1181 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1185 = fma(_1177, _1177, _1173);
    float _1187 = _1179 * 0.15915493667125701904296875;
    float _1189 = _1135 * 6.283185482025146484375;
    float _1191 = sin(_1189);
    float _1193 = _1133 * _1171;
    float _1195 = _1143 * _1171;
    float _1197 = _1127 * _1171;
    float _1199 = _1135 * 6.283185482025146484375;
    float _1201 = cos(_1199);
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1205 = _1193 * _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1209 = _1195 * _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1213 = _1197 * _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1217 = -_1205;
    float _1219 = fma(_1195, _1215, _1217);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1223 = -_1209;
    float _1225 = fma(_1197, _1221, _1223);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1229 = -_1213;
    float _1231 = fma(_1193, _1227, _1229);
    float _1233 = _1187 * 6.283185482025146484375;
    float _1235 = sin(_1233);
    float _1237 = _1219 * _1219;
    float _1239 = _1109 * _1191;
    float _1241 = fma(_1225, _1225, _1237);
    float _1243 = _1123 * _1191;
    float _1245 = sqrt(_1185);
    float _1247 = fma(_1231, _1231, _1241);
    float _1249 = _1123 * _1201;
    float _1251 = _1187 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = fma(_1235, _1249, _1239);
    float _1257 = fma(_1235, _1239, _1249);
    float _1259 = rsqrt(_1247);
    float _1261 = _937 * _1245;
    float _1263 = _1109 * _1201;
    float _1265 = _1261 * _1181;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1269 = _1267 * 0.5;
    float _1271 = _1123 * _1253;
    float _1273 = _1201 * _1253;
    float _1275 = _1109 * _1253;
    float _1277 = _1191 * _1253;
    float _1279 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1283 = -_1263;
    float _1285 = fma(_1235, _1243, _1283);
    float _1287 = _1261 * _1279;
    float _1289 = _1281 * _1265;
    float _1291 = -_1243;
    float _1293 = fma(_1235, _1263, _1291);
    float _1295 = _1225 * _1259;
    float _1297 = _1183 * _1287;
    float _1299 = _1219 * _1259;
    float _1301 = _1271 * _1289;
    float _1303 = _1231 * _1259;
    float _1305 = -_1289;
    float _1307 = _1235 * _1305;
    float _1309 = _1195 * _1299;
    float _1311 = fma(_1255, _1297, _1301);
    float _1313 = _1197 * _1295;
    float _1315 = _1275 * _1289;
    float _1317 = fma(_1273, _1297, _1307);
    float _1319 = fma(_1285, _1269, _1311);
    float _1321 = -_1309;
    float _1323 = fma(_1197, _1303, _1321);
    float _1325 = -_1313;
    float _1327 = fma(_1193, _1299, _1325);
    float _1329 = fma(_1293, _1297, _1315);
    float _1331 = fma(_1277, _1269, _1317);
    float _1333 = _1323 * _1319;
    float _1335 = _1327 * _1319;
    float _1337 = fma(_1257, _1269, _1329);
    float _1339 = _1193 * _1303;
    float _1341 = fma(_1295, _1331, _1333);
    float _1343 = fma(_1303, _1331, _1335);
    float _1345 = _1271 * _1323;
    float _1347 = -_1339;
    float _1349 = fma(_1195, _1295, _1347);
    float _1351 = fma(_1193, _1337, _1341);
    float _1353 = fma(_1195, _1337, _1343);
    float _1355 = _1271 * _1327;
    float _1357 = _1349 * _1319;
    float _1359 = _671 + _1351;
    float _1361 = _831 + _1353;
    float _1363 = _1271 * _1349;
    float _1365 = _1255 * _1323;
    float _1367 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1369 = _1359 + _1367;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1373 = _1361 + _1371;
    float _1375 = _1255 * _1349;
    float _1377 = _1255 * _1327;
    float _1379 = _1369 * _1369;
    float _1381 = _1373 * _1373;
    float _1383 = _1285 * _1327;
    float _1385 = fma(_1299, _1331, _1357);
    float _1387 = _1285 * _1323;
    float _1389 = _1379 + _1381;
    float _1391 = _1285 * _1349;
    float _1393 = fma(_1197, _1337, _1385);
    float _1395 = -_1235;
    float _1397 = fma(_1395, _1295, _1345);
    float _1399 = sqrt(_1389);
    float _1401 = -_1235;
    float _1403 = fma(_1401, _1299, _1363);
    float _1405 = -_1235;
    float _1407 = fma(_1405, _1303, _1355);
    float _1409 = _665 + _1393;
    float _1411 = fma(_1273, _1295, _1365);
    float _1413 = fma(_1273, _1299, _1375);
    float _1415 = fma(_1273, _1303, _1377);
    float _1417 = fma(_1277, _1295, _1387);
    float _1419 = fma(_1277, _1299, _1391);
    float _1421 = fma(_1275, _1193, _1397);
    float _1423 = fma(_1275, _1197, _1403);
    float _1425 = fma(_1277, _1303, _1383);
    float _1427 = fma(_1275, _1195, _1407);
    bool _1429 = _1399 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = _1295;
    float _1433 = _1379;
    float _1435 = _1381;
    float _1437 = _1359;
    float _1439 = _1361;
    float _1441 = _1423;
    int _1443 = as_type<int>(_1387);
    float _1445 = _1383;
    float _1447 = _1345;
    if (!_1429)
    {
        _1431 = _1409;
    }
    float _1449 = _1431;
    bool _1451 = !_1429;
    float _1453 = _1449;
    if (!_1451)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1399 + _1457;
        float _1461 = rsqrt(_1389);
        float _1463 = _1459 * _1455;
        float _1465 = _1409 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1463 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = fma(_1471, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1479 = _1461 * _1477;
        float _1481 = _1475 + (-1.0);
        float _1483 = fma(_1369, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1485 = fma(_1373, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1487 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1491 = _1483 + _1489;
        float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1495 = _1485 + _1493;
        float _1497 = fma(_1409, _1475, _1487);
        float _1499 = _1491 * _1491;
        float _1501 = _1495 * _1495;
        _1453 = _1497;
        _1433 = _1499;
        _1435 = _1501;
        _1437 = _1483;
        _1439 = _1485;
    }
    float _1503 = _1453;
    float _1505 = _1433;
    float _1507 = _1435;
    float _1509 = _1437;
    float _1511 = _1439;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1515 = _1503 + _1513;
    float _1517 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1519 = fma(_1293, _1193, _1411);
    float _1521 = fma(_1257, _1193, _1417);
    float _1523 = fma(_1515, _1515, _1505);
    float _1525 = fma(_1257, _1197, _1419);
    float _1527 = fma(_1257, _1195, _1425);
    float _1529 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1531 = _1523 + _1507;
    float _1533 = _1517 * _1421;
    float _1535 = fma(_1293, _1197, _1413);
    float _1537 = fma(_1293, _1195, _1415);
    float _1539 = _1517 * _1423;
    float _1541 = _1517 * _1427;
    float _1543 = sqrt(_1531);
    float _1545 = fma(_1529, _1519, _1533);
    float _1547 = fma(_1529, _1535, _1539);
    float _1549 = fma(_1529, _1537, _1541);
    float _1551 = _1521 + _1545;
    float _1553 = _1525 + _1547;
    float _1555 = _1527 + _1549;
    out.m_82.x = _1551;
    out.m_82.y = _1553;
    out.m_82.z = _1555;
    bool _1557 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1559 = isnan(_1543);
    bool _1561 = _1557 || _1559;
    bool _1563 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1565 = _1561 || _1563;
    if (!_1565)
    {
        _1441 = 1.0;
    }
    float _1567 = _1441;
    bool _1569 = !_1565;
    float _1571 = _1567;
    if (!_1569)
    {
        bool _1573 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1575 = isnan(_1543);
        bool _1577 = _1573 || _1575;
        bool _1579 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1581 = _1577 || _1579;
        if (!_1581)
        {
            float _1583 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1585 = _1543 + _1583;
            float _1587 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1589 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1593 = _1591 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1595 = 1.0 / _1589;
            float _1597 = _1585 * _1595;
            float _1599 = fma(_1597, _1593, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1571 = _1599;
            _1601 = true;
        }
        else
        {
            bool _1603 = _1543 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1605 = isnan(_1543);
            bool _1607 = _1603 || _1605;
            bool _1609 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1611 = _1607 || _1609;
            if (!_1611)
            {
                float _1613 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1615 = _1543 + _1613;
                float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1619 = _1617 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1623 = _1621 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1625 = 1.0 / _1619;
                float _1627 = _1615 * _1625;
                float _1629 = fma(_1627, _1623, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1571 = _1629;
                _1601 = true;
            }
            else
            {
                _1571 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1601 = false;
    float _1631 = _1571;
    float _1633 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1635 = _1011 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1637 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1633);
    float _1639 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1637);
    float _1641 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1643 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1645 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1647 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1641);
    float _1649 = floor(_1643);
    float _1651 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1647);
    float _1653 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1655 = 1.0 / _1645;
    float _1657 = _1653 + _1645;
    float _1659 = -_1649;
    float _1661 = _1643 + _1659;
    float _1663 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _1665 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1663);
    float _1667 = _1657 * _1655;
    float _1669 = _1667 * 0.5;
    float _1671 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _1673 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1665);
    float _1675 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1677 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1675);
    float _1679 = fma(_1635, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1671);
    float _1681 = _1673 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1683 = 1.0 / _1677;
    float _1685 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1687 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1679);
    float _1689 = _1011 + _1685;
    float _1691 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1693 = trunc(_1681);
    int _1695 = int(_1693);
    float _1697 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1671);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1663);
    float _1701 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1697);
    float _1703 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1699);
    float _1705 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1707 = _1683 * _1705;
    float _1709 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1713 = trunc(_1691);
    int _1715 = int(_1713);
    bool _1717 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1719 = _1707 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1721 = !_1717;
    int _1723 = _1721 ? 0 : 1;
    float _1725 = trunc(_1709);
    int _1727 = int(_1725);
    int _1729 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1731 = _1695 + _1729;
    int _1733 = _1731 + 1;
    int _1735 = 2;
    int _1737 = _1733;
    float _1739 = _1681;
    if (!_1717)
    {
        _1735 = 1;
    }
    int _1741 = _1735;
    float _1743 = trunc(_1711);
    int _1745 = int(_1743);
    int _1747 = _1741;
    if (!_1719)
    {
        _1747 = _1723;
    }
    int _1749 = _1747;
    int _1751 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1753 = _1715 + _1751;
    int _1755 = _1753 + 1;
    int _1757 = _1749 << 6;
    bool _1759 = _1755 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1761 = _1757 + 96;
    uint _1764 = uint(int(uint(_1761) >> uint(2)));
    uint _1766 = uint(int(uint(int(_1764)) >> uint(2)));
    int _1768 = int(_1764) & 3;
    float _1770 = (*spvDescriptorSet0.vp_c15)._m0[int(_1766)][_1768];
    int _1772 = int(_1764) + 1;
    uint _1774 = uint(int(uint(_1772) >> uint(2)));
    int _1776 = _1772 & 3;
    float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
    int _1780 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1782 = _1727 + _1780;
    int _1784 = _1782 + 1;
    int _1786 = _1755 | _1733;
    bool _1788 = _1784 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1790 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1792 = _1745 + _1790;
    int _1794 = _1792 + 1;
    int _1796 = _1757 + 104;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c15)._m0[int(_1808)][_1810];
    bool _1814 = _1786 < 0;
    bool _1816 = _1814 || _1759;
    int _1818 = _1784 | _1794;
    bool _1820 = _1733 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1822 = _1820 || _1816;
    bool _1824 = _1818 < 0;
    bool _1826 = _1824 || _1788;
    int _1828 = _1757 + 48;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c15)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    bool _1846 = _1794 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1848 = _1846 || _1826;
    int _1850 = _1757 + 64;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c15)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[int(_1862)][_1864];
    int _1868 = _1755;
    int _1870 = _1784;
    float _1872 = as_type<float>(_1749);
    if (!_1822)
    {
        int _1874 = _1733 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1876 = _1874 + _1755;
        _1868 = _1876;
    }
    int _1878 = _1868;
    if (!_1848)
    {
        int _1880 = _1794 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1882 = _1880 + _1784;
        _1870 = _1882;
    }
    int _1884 = _1870;
    int _1886 = _1757 + 56;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
    float _1904 = 0.0;
    if (!_1848)
    {
        float _1906 = floor(_1711);
        _1904 = _1906;
    }
    float _1908 = _1904;
    if (!_1848)
    {
        int _1910 = _1884 << 2;
        _1443 = _1910;
    }
    int _1912 = _1443;
    int _1914 = _1912;
    if (!_1848)
    {
        uint _1916 = uint(int(uint(_1884) >> uint(2)));
        _1737 = int(_1916);
    }
    int _1918 = _1737;
    float _1920 = fma(_1027, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1848)
    {
        int _1922 = 12 & _1912;
        _1914 = _1922;
    }
    int _1924 = _1914;
    int _1926 = _1757 + 72;
    uint _1928 = uint(int(uint(_1926) >> uint(2)));
    uint _1930 = uint(int(uint(int(_1928)) >> uint(2)));
    int _1932 = int(_1928) & 3;
    float _1934 = (*spvDescriptorSet0.vp_c15)._m0[int(_1930)][_1932];
    int _1936 = int(_1928) + 1;
    uint _1938 = uint(int(uint(_1936) >> uint(2)));
    int _1940 = _1936 & 3;
    float _1942 = (*spvDescriptorSet0.vp_c15)._m0[int(_1938)][_1940];
    if (!_1848)
    {
        int _1944 = _1918 << 4;
        int _1946 = _1944 + _1924;
        _1445 = as_type<float>(_1946);
    }
    float _1948 = _1445;
    float _1950 = _1689 * _1778;
    float _1952 = _1948;
    int _1954 = as_type<int>(_1950);
    int _1956 = as_type<int>(_1770);
    if (!_1848)
    {
        int _1958 = as_type<int>(_1948) + 400;
        uint _1960 = uint(int(uint(_1958) >> uint(2)));
        uint _1962 = uint(int(uint(int(_1960)) >> uint(2)));
        int _1964 = int(_1960) & 3;
        float _1966 = (*spvDescriptorSet0.vp_c15)._m0[int(_1962)][_1964];
        _1952 = _1966;
    }
    float _1968 = _1952;
    float _1970 = fma(_1017, _1770, _1950);
    if (!_1822)
    {
        int _1972 = _1878 << 2;
        _1954 = _1972;
    }
    int _1974 = _1954;
    float _1976 = _1908;
    int _1978 = _1974;
    if (!_1848)
    {
        float _1980 = -_1908;
        float _1982 = _1711 + _1980;
        _1976 = _1982;
    }
    float _1984 = _1976;
    if (!_1822)
    {
        uint _1986 = uint(int(uint(_1878) >> uint(2)));
        _1956 = int(_1986);
    }
    int _1988 = _1956;
    float _1990 = fma(_1027, _1804, _1970);
    if (!_1822)
    {
        int _1992 = 12 & _1974;
        _1978 = _1992;
    }
    int _1994 = _1978;
    float _1996 = floor(_1920);
    float _1998 = _1990 + _1812;
    if (!_1822)
    {
        int _2000 = _1988 << 4;
        int _2002 = _2000 + _1994;
        _1447 = as_type<float>(_2002);
    }
    float _2004 = _1447;
    int _2006 = _1757 + 88;
    uint _2008 = uint(int(uint(_2006) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c15)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c15)._m0[int(_2018)][_2020];
    float _2024 = _1689 * _1844;
    float _2026 = 1.0 / _1998;
    float _2028 = fma(_1017, _1836, _2024);
    int _2030 = _1757 + 80;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    uint _2034 = uint(int(uint(int(_2032)) >> uint(2)));
    int _2036 = int(_2032) & 3;
    float _2038 = (*spvDescriptorSet0.vp_c15)._m0[int(_2034)][_2036];
    int _2040 = int(_2032) + 1;
    uint _2042 = uint(int(uint(_2040) >> uint(2)));
    int _2044 = _2040 & 3;
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[int(_2042)][_2044];
    float _2048 = _1689 * _1866;
    float _2050 = _1866;
    float _2052 = _2048;
    if (!_1822)
    {
        float _2054 = floor(_1691);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = -_1996;
    float _2060 = _1920 + _2058;
    float _2062 = fma(_1017, _1858, _2048);
    float _2064 = _2004;
    if (!_1822)
    {
        int _2066 = as_type<int>(_2004) + 400;
        uint _2068 = uint(int(uint(_2066) >> uint(2)));
        uint _2070 = uint(int(uint(int(_2068)) >> uint(2)));
        int _2072 = int(_2068) & 3;
        float _2074 = (*spvDescriptorSet0.vp_c15)._m0[int(_2070)][_2072];
        _2064 = _2074;
    }
    float _2076 = _2064;
    float _2078 = fma(_1027, _1894, _2028);
    float _2080 = _1894;
    if (!_1848)
    {
        float _2082 = floor(_1709);
        _2052 = _2082;
    }
    float _2084 = _2052;
    float _2086 = _2078 + _1902;
    float _2088 = _2086 * _2026;
    float _2090 = _1902;
    if (!_1822)
    {
        float _2092 = floor(_1681);
        _2090 = _2092;
    }
    float _2094 = _2090;
    float _2096 = fma(_1027, _1934, _2062);
    float _2098 = _2056;
    if (!_1822)
    {
        float _2100 = -_2056;
        float _2102 = _1691 + _2100;
        _2098 = _2102;
    }
    float _2104 = _2098;
    bool _2106 = _2088 >= 0.0;
    float _2108 = _2096 + _1942;
    bool _2110 = _2088 <= 1.0;
    bool _2112 = _2110 && _2106;
    if (!_1848)
    {
        float _2114 = rint(_1968);
        float _2116 = precise::max(_2114, 0.0);
        uint _2118 = uint(_2116);
        uint _2120 = clamp(_2118, 0u, 65535u);
        _2080 = as_type<float>(_2120);
    }
    float _2122 = _2080;
    float _2124 = _2108 * _2026;
    bool _2126 = _2124 >= 0.0;
    bool _2128 = _2126 && _2112;
    float _2130 = _2094;
    float _2132 = _2124;
    if (!_1822)
    {
        float _2134 = -_2094;
        float _2136 = _1681 + _2134;
        _1739 = _2136;
    }
    float _2138 = _1739;
    if (!_1848)
    {
        float _2140 = -_2084;
        float _2142 = _1709 + _2140;
        _2130 = _2142;
    }
    float _2144 = _2130;
    bool _2146 = _2124 <= 1.0;
    bool _2148 = _2146 && _2128;
    float _2150 = _1689 * _2046;
    float _2152 = fma(_1017, _2038, _2150);
    if (_2148)
    {
        float _2154 = float(_1749);
        _1872 = _2154;
    }
    float _2156 = _1872;
    float _2158 = _1858;
    if (!_1822)
    {
        float _2160 = rint(_2076);
        float _2162 = precise::max(_2160, 0.0);
        uint _2164 = uint(_2162);
        uint _2166 = clamp(_2164, 0u, 65535u);
        _2158 = as_type<float>(_2166);
    }
    float _2168 = _2158;
    float _2170 = fma(_1027, _2014, _2152);
    float _2172 = fma(_1017, 6.2500002968590706586837768554688e-05, 0.5);
    float _2174 = _2170 + _2022;
    float _2176 = fma(_1027, 6.2500002968590706586837768554688e-05, 0.5);
    float _2178 = _2150;
    if (_2148)
    {
        float _2180 = rint(_2156);
        float _2182 = precise::max(_2180, 0.0);
        uint _2184 = uint(_2182);
        uint _2186 = clamp(_2184, 0u, 65535u);
        _2178 = as_type<float>(_2186);
    }
    float _2188 = _2178;
    float _2190 = _2174 * _2026;
    float2 _6819 = float2(_2172, _2176);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6819, float2(0.0), isnan(_6819)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6819, float2(0.0), isnan(_6819)), level(0.0)).x;
    float2 _6829 = float2(_1661, _2060);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6829, float2(0.0), isnan(_6829)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6829, float2(0.0), isnan(_6829)), level(0.0)).x;
    float _2196 = _2168;
    if (!_1822)
    {
        float3 _6844 = float3(_2104, _2138, float(as_type<int>(_2168)));
        float3 _6848 = select(_6844, float3(0.0), isnan(_6844));
        float _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6848.xy, uint(rint(_6848.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6848.xy, uint(rint(_6848.z)), level(0.0)).x;
        _2196 = _2198;
    }
    float _2200 = _2196;
    float _2202 = _2122;
    if (!_1848)
    {
        float3 _6864 = float3(_2144, _1984, float(as_type<int>(_2122)));
        float3 _6866 = select(_6864, float3(0.0), isnan(_6864));
        float _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6866.xy, uint(rint(_6866.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6866.xy, uint(rint(_6866.z)), level(0.0)).x;
        _2202 = _2204;
    }
    float _2206 = _2202;
    float _2208 = _1691;
    if (_2148)
    {
        float3 _6881 = float3(_2088, _2124, float(as_type<int>(_2188)));
        float3 _6883 = select(_6881, float3(0.0), isnan(_6881));
        float _2210 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6883.xy, uint(rint(_6883.z)), _2190, level(0.0));
        _2208 = _2210;
    }
    float _2212 = _2208;
    float _2214 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2216 = _1503 + _2214;
    float _2218 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2220 = _1509 + _2218;
    bool _2222 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan(0.5);
    bool _2230 = _2226 || _2228;
    float _2232 = fma(_2216, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2234 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2236 = _1511 + _2234;
    float _2238 = fma(_2220, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2240 = -_1005;
    float _2242 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2244 = fma(_2236, _1631, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2246 = -_1007;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2250 = -_1013;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2244);
    float _2254 = _2248;
    float _2256 = _2252;
    if (_2230)
    {
        _2132 = _2242;
    }
    float _2258 = _2132;
    float _2260 = _2258;
    if (!_2230)
    {
        float _2262 = _1023 * _1023;
        float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2266 = -_831;
        float _2268 = _2266 + _2244;
        float _2270 = -_665;
        float _2272 = _2270 + _2232;
        float _2274 = fma(_1031, _1031, _2262);
        float _2276 = -_671;
        float _2278 = _2276 + _2238;
        float _2280 = fma(_1039, _1039, _2274);
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2284 = sqrt(_2280);
        float _2286 = 1.0 / _1261;
        float _2288 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2290 = precise::min(_2284, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2292 = _2290 * _2264;
        float _2294 = _2292 * _2286;
        float _2296 = _2288 * _2294;
        float _2298 = _2268 * _2294;
        float _2300 = fma(_2272, _2296, _1011);
        float _2302 = fma(_2278, _2296, _1017);
        float _2304 = fma(_2288, _2298, _1027);
        _2260 = _2300;
        _2254 = _2302;
        _2256 = _2304;
    }
    float _2306 = _2260;
    float _2308 = _2254;
    float _2310 = _2256;
    float _2312 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2318 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(0.5);
    bool _2326 = _2322 || _2324;
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2312);
    float _2330 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2314);
    float _2332 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2316);
    float _2334 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2336 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2328);
    float _2338 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2330);
    float _2340 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2332);
    float _2342 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2334);
    float _2344 = _2336 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2346 = _2338 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2348 = _2340 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2350 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2342);
    float _2352 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2354 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2356 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2358 = _2344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2360 = abs(_2192);
    bool _2362 = _2360 != 0.0;
    bool _2364 = isnan(_2360);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan(0.0);
    bool _2370 = _2366 || _2368;
    float _2372 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2352);
    float _2374 = _2350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2376 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2358);
    float _2378 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2354);
    float _2380 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2356);
    float _2382 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2372);
    float _2384 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2376);
    float _2386 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2378);
    float _2388 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    float _2390 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2382);
    float _2392 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2384);
    float _2394 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2386);
    float _2396 = fma(_2374, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2388);
    float _2398 = _2374;
    float _2400 = _2356;
    float _2402 = _2384;
    float _2404 = _2380;
    if (_2326)
    {
        _2398 = 1.0;
    }
    float _2406 = _2398;
    float _2408 = _2406;
    if (_2370)
    {
        _2400 = _2392;
    }
    float _2410 = _2400;
    float _2412 = _2410;
    if (!_2370)
    {
        _2412 = 0.0;
    }
    float _2414 = _2412;
    float _2416 = _2414;
    if (!_2326)
    {
        float _2418 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2420 = _2418 * 0.15915493667125701904296875;
        float _2422 = _2420 * 6.283185482025146484375;
        float _2424 = cos(_2422);
        float _2426 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2428 = _2426 * 0.15915493667125701904296875;
        float _2430 = _2420 * 6.283185482025146484375;
        float _2432 = sin(_2430);
        float _2434 = 1.0 / _2424;
        float _2436 = _2428 * 6.283185482025146484375;
        float _2438 = cos(_2436);
        float _2440 = _2432 * _2434;
        float _2442 = _2428 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2446;
        float _2450 = _2438 * _2440;
        float _2452 = 1.0 / _2448;
        float _2454 = 1.0 / _2450;
        float _2456 = _2444 * _2454;
        float _2458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2460 = fma(_1707, _2456, _2458);
        float _2462 = _2460 * _2452;
        float _2464 = precise::clamp(_2462, 0.0, 1.0);
        _2402 = _2452;
        _1053 = _2428;
        _2404 = _2454;
        _2408 = _2464;
    }
    float _2466 = _2402;
    float _2468 = _1053;
    float _2470 = _2404;
    float _2472 = _2408;
    out.gl_Position.x = _2390;
    out.gl_Position.y = _2394;
    out.gl_Position.z = _2396;
    out.gl_Position.w = _2392;
    float _2474 = _2466;
    float _2476 = _2468;
    float _2478 = _2470;
    if (!_2370)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1822)
    {
        int _2480 = _1878 << 4;
        int _2482 = _2480 + 2048;
        uint _2484 = uint(int(uint(_2482) >> uint(2)));
        uint _2486 = uint(int(uint(int(_2484)) >> uint(2)));
        int _2488 = int(_2484) & 3;
        float _2490 = (*spvDescriptorSet0.vp_c15)._m0[int(_2486)][_2488];
        int _2492 = int(_2484) + 1;
        uint _2494 = uint(int(uint(_2492) >> uint(2)));
        int _2496 = _2492 & 3;
        float _2498 = (*spvDescriptorSet0.vp_c15)._m0[int(_2494)][_2496];
        int _2500 = _2482 + 8;
        uint _2502 = uint(int(uint(_2500) >> uint(2)));
        uint _2504 = uint(int(uint(int(_2502)) >> uint(2)));
        int _2506 = int(_2502) & 3;
        float _2508 = (*spvDescriptorSet0.vp_c15)._m0[int(_2504)][_2506];
        int _2510 = int(_2502) + 1;
        uint _2512 = uint(int(uint(_2510) >> uint(2)));
        int _2514 = _2510 & 3;
        float _2516 = (*spvDescriptorSet0.vp_c15)._m0[int(_2512)][_2514];
        float _2518 = _1635 * _2498;
        float _2520 = fma(_1017, _2490, _2518);
        float _2522 = fma(_1027, _2508, _2520);
        float _2524 = _2522 + _2516;
        float _2526 = precise::clamp(_2524, 0.0, 1.0);
        float _2528 = -_2526;
        float _2530 = _2528 + _2200;
        float _2532 = fma(_2530, 500.0, 1.5);
        float _2534 = exp2(_2532);
        float _2536 = 0.0 + _2534;
        float _2538 = precise::clamp(_2536, 0.0, 1.0);
        bool _2540 = _2538 >= 1.0;
        bool _2542 = isnan(_2538);
        bool _2544 = _2540 || _2542;
        bool _2546 = isnan(1.0);
        bool _2548 = _2544 || _2546;
        _2474 = _2490;
        _2476 = _2498;
        if (!_2548)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2548)
        {
            _2416 = 0.0;
        }
    }
    float _2550 = _2474;
    float _2552 = _2476;
    float _2554 = _2416;
    float _2556 = _2552;
    float _2558 = _2550;
    if (_1848)
    {
        _2478 = 1.0;
    }
    float _2560 = _2478;
    float _2562 = _2560;
    if (!_1848)
    {
        int _2564 = _1884 << 4;
        int _2566 = _2564 + 2048;
        uint _2568 = uint(int(uint(_2566) >> uint(2)));
        uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
        int _2572 = int(_2568) & 3;
        float _2574 = (*spvDescriptorSet0.vp_c15)._m0[int(_2570)][_2572];
        int _2576 = int(_2568) + 1;
        uint _2578 = uint(int(uint(_2576) >> uint(2)));
        int _2580 = _2576 & 3;
        float _2582 = (*spvDescriptorSet0.vp_c15)._m0[int(_2578)][_2580];
        int _2584 = _2566 + 8;
        uint _2586 = uint(int(uint(_2584) >> uint(2)));
        uint _2588 = uint(int(uint(int(_2586)) >> uint(2)));
        int _2590 = int(_2586) & 3;
        float _2592 = (*spvDescriptorSet0.vp_c15)._m0[int(_2588)][_2590];
        int _2594 = int(_2586) + 1;
        uint _2596 = uint(int(uint(_2594) >> uint(2)));
        int _2598 = _2594 & 3;
        float _2600 = (*spvDescriptorSet0.vp_c15)._m0[int(_2596)][_2598];
        float _2602 = _1689 * _2582;
        float _2604 = fma(_1017, _2574, _2602);
        float _2606 = fma(_1027, _2592, _2604);
        float _2608 = _2606 + _2600;
        float _2610 = precise::clamp(_2608, 0.0, 1.0);
        float _2612 = -_2610;
        float _2614 = _2612 + _2206;
        float _2616 = fma(_2614, 500.0, 1.5);
        float _2618 = exp2(_2616);
        float _2620 = 0.0 + _2618;
        float _2622 = precise::clamp(_2620, 0.0, 1.0);
        _2556 = _2582;
        _2558 = _2574;
        _2562 = _2622;
    }
    float _2624 = _2556;
    float _2626 = _2558;
    float _2628 = _2562;
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2632 = _2306 + _2630;
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2308 + _2634;
    float _2638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2640 = _2310 + _2638;
    float _2642 = _2632 * _2632;
    float _2644 = fma(_2636, _2636, _2642);
    float _2646 = fma(_2640, _2640, _2644);
    float _2648 = rsqrt(_2646);
    float _2650 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2652 = _2636 * _2650;
    float _2654 = _2640 * _2650;
    float _2656 = _2652 * _2652;
    float _2658 = _2654 * _2654;
    float _2660 = _2656 + _2658;
    float _2662 = sqrt(_2660);
    bool _2664 = _2662 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2668 = _2662 + _2666;
    float _2670 = _2640;
    float _2672 = _2660;
    float _2674 = _2668;
    float _2676 = _2624;
    float _2678 = _2626;
    float _2680 = _2632;
    float _2682 = _2652;
    if (_2664)
    {
        float _2684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2684;
    }
    float _2686 = _2670;
    if (_2664)
    {
        float _2688 = rsqrt(_2660);
        _2672 = _2688;
    }
    float _2690 = _2672;
    float _2692 = _2690;
    if (_2664)
    {
        float _2694 = _2668 * _2686;
        _2674 = _2694;
    }
    float _2696 = _2674;
    if (_2664)
    {
        float _2698 = _2696 * 0.15915493667125701904296875;
        _2676 = _2698;
    }
    float _2700 = _2676;
    float _2702 = _2686;
    if (_2664)
    {
        float _2704 = _2700 * 6.283185482025146484375;
        float _2706 = sin(_2704);
        _2702 = _2706;
    }
    float _2708 = _2702;
    float _2710 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2712 = precise::max(0.0, _2710);
    float _2714 = _2642;
    float _2716 = _2712;
    if (_2664)
    {
        float _2718 = _2700 * 6.283185482025146484375;
        float _2720 = cos(_2718);
        _2714 = _2720;
    }
    float _2722 = _2714;
    float _2724 = -_2650;
    float _2726 = -_2712;
    float _2728 = fma(_2632, _2724, _2726);
    if (_2664)
    {
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2716 = _2730;
    }
    float _2732 = _2716;
    float _2734 = _2708;
    float _2736 = _2732;
    if (_2664)
    {
        float _2738 = fma(_2708, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2678 = _2738;
    }
    float _2740 = _2678;
    float _2742 = _2740;
    if (!_2664)
    {
        _2734 = _2728;
    }
    float _2744 = _2734;
    float _2746 = _2744;
    float _2748 = _2722;
    if (_2664)
    {
        float _2750 = _2722 + (-1.0);
        _2680 = _2750;
    }
    float _2752 = _2680;
    float _2754 = _2752;
    if (_2664)
    {
        float _2756 = _2690 * _2740;
        _2742 = _2756;
    }
    float _2758 = _2742;
    if (!_2664)
    {
        _2692 = _2656;
    }
    float _2760 = _2692;
    float _2762 = _2760;
    if (_2664)
    {
        float _2764 = _2752 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2736 = _2764;
    }
    float _2766 = _2736;
    if (_2664)
    {
        float _2768 = _2652 * _2758;
        _2682 = _2768;
    }
    float _2770 = _2682;
    if (!_2664)
    {
        _2754 = _2654;
    }
    float _2772 = _2754;
    float _2774 = _2772;
    if (_2664)
    {
        float _2776 = _2654 * _2758;
        _2774 = _2776;
    }
    float _2778 = _2774;
    if (_2664)
    {
        float _2780 = fma(_2728, _2722, _2766);
        _2746 = _2780;
    }
    float _2782 = _2746;
    if (_2664)
    {
        float _2784 = _2770 * _2770;
        _2762 = _2784;
    }
    float _2786 = _2762;
    float _2788 = sqrt(_2646);
    if (!_2664)
    {
        _2748 = _2658;
    }
    float _2790 = _2748;
    float _2792 = _2790;
    if (_2664)
    {
        float _2794 = _2778 * _2778;
        _2792 = _2794;
    }
    float _2796 = _2792;
    float _2798 = fma(_2782, _2782, _2786);
    float _2800 = _2798 + _2796;
    float _2802 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2804 = 1.0 / _2554;
    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2808 = fma(_2788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2806);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = rsqrt(_2800);
    float _2814 = -_2810;
    float _2816 = _2814 + 1.0;
    float _2818 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2820 = -_2818;
    float _2822 = fma(_2820, _2802, 1.0);
    float _2824 = abs(_2816);
    float _2826 = log2(_2824);
    float _2828 = _2390 * _2804;
    float _2830 = fma(_2828, 0.5, 0.5);
    float _2832 = _2812 * _2770;
    float _2834 = _2812 * _2782;
    float _2836 = _2812 * _2778;
    float _2838 = log2(_2822);
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2842 = -_2840;
    float _2844 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2842);
    float _2846 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2848 = -_2836;
    float _2850 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2844);
    float _2852 = _2834 + 1.0;
    float _2854 = exp2(_2846);
    float _2856 = fma(_2850, -0.5, 0.5);
    float _2858 = fma(_2850, 0.5, 0.5);
    float _2860 = _2838 * 0.693147182464599609375;
    float _2862 = fma(_2858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2864 = sqrt(_2856);
    float _2866 = fma(_2858, _2862, -0.212114393711090087890625);
    float _2868 = fma(_2858, _2866, 1.570728778839111328125);
    float _2870 = _2394 * _2804;
    float _2872 = -_2834;
    float _2874 = fma(_2854, _2852, _2872);
    float _2876 = _2860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2878 = fma(_2870, -0.5, 0.5);
    float _2880 = fma(_2874, 0.5, 0.5);
    float _2882 = _2864 * 0.636619746685028076171875;
    float3 _7948 = float3(_2830, _2878, _2876);
    float _2884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7948, float3(0.0), isnan(_7948)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7948, float3(0.0), isnan(_7948)), level(0.0)).x;
    float _2886 = -_2868;
    float _2888 = fma(_2882, _2886, 1.0);
    float3 _7962 = float3(_2830, _2878, _2876);
    float4 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7962, float3(0.0), isnan(_7962)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7962, float3(0.0), isnan(_7962)), level(0.0)).xyzw;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float _2899 = _2891.w;
    float2 _7978 = float2(_2888, _2880);
    float3 _2903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7978, float2(0.0), isnan(_7978)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7978, float2(0.0), isnan(_7978)), level(0.0)).xyz;
    float _2905 = _2903.x;
    float _2907 = _2903.y;
    float _2909 = _2903.z;
    float _2911 = abs(_1707);
    float _2913 = log2(_2911);
    float _2915 = _2392 * 0.5;
    float _2917 = _2396 + _2392;
    float _2919 = _2390 + _2392;
    float _2921 = -_2194;
    float _2923 = _2921 + 1.0;
    float _2925 = fma(_2394, -0.5, _2915);
    float _2927 = _2917 * 0.5;
    float _2929 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2931 = _1707 <= 8000.0;
    bool _2933 = isnan(_1707);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan(8000.0);
    bool _2939 = _2935 || _2937;
    float _2941 = float(_2939);
    float _2943 = _2919 * 0.5;
    float _2945 = _2826;
    if (!_2148)
    {
        _2945 = 1.0;
    }
    float _2947 = _2945;
    float _2949 = _2947;
    if (_2148)
    {
        bool _2951 = _2212 >= _2190;
        bool _2953 = isnan(_2212);
        bool _2955 = _2951 || _2953;
        bool _2957 = isnan(_2190);
        bool _2959 = _2955 || _2957;
        float _2961 = float(_2959);
        _2949 = _2961;
    }
    float _2963 = _2949;
    float _2965 = exp2(_2929);
    float _2967 = _2913 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_84.x = _2943;
    out.m_84.y = _2925;
    out.m_84.z = _2927;
    out.m_84.w = _2392;
    bool _2969 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2971 = isnan(_2788);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2977 = _2973 || _2975;
    float _2979 = _2963 * _2628;
    float _2981 = exp2(_2967);
    float _2983 = _2472 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2985 = fma(_2981, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2987 = precise::clamp(_2985, 0.0, 1.0);
    float _2989 = fma(_2987, -2.0, 3.0);
    float _2991 = _2987 * _2987;
    float _2993 = _2991 * _2989;
    float _2995 = -_2993;
    float _2997 = _2995 + 1.0;
    float _2999 = fma(_2997, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2993);
    float _3001 = _2941 * _2999;
    float _3003 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3005 = -_2965;
    float _3007 = _3005 + 1.0;
    float _3009 = _2923 * _3003;
    float _3011 = precise::clamp(_3009, 0.0, 1.0);
    float _3013 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3015 = _3003;
    float _3017 = _2979;
    if (!_2977)
    {
        _3015 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3019 = _3015;
    float _3021 = -_3011;
    float _3023 = fma(_3021, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3025 = _3019;
    float _3027 = _3019;
    if (!_2977)
    {
        _933 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3029 = _933;
    float _3031 = -_2979;
    float _3033 = fma(_3031, _3023, 1.0);
    float _3035 = precise::clamp(_3033, 0.0, 1.0);
    float _3037 = _3035;
    float _3039 = _3029;
    float _3041 = _3029;
    if (!_2977)
    {
        _3017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3043 = _3017;
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3047 = _3043;
    float _3049 = _3043;
    if (!_2977)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3051 = _3037;
    out.m_86.x = _3045;
    float _3053 = _3013 * _2884;
    float _3055 = -_3013;
    float _3057 = _3055 + 1.0;
    float _3059 = _2899 * _3053;
    float _3061 = _2899 * _3057;
    float _3063 = _3057;
    float _3065 = _3053;
    float _3067 = _3051;
    float _3069 = _3051;
    if (!_2977)
    {
        _3063 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3071 = _3063;
    float _3073 = _2909 * _3053;
    float _3075 = fma(_2905, _3059, _2893);
    float _3077 = fma(_2907, _3059, _2895);
    float _3079 = _3071;
    float _3081 = _3071;
    if (!_2977)
    {
        _3065 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3083 = _3065;
    float _3085 = fma(_2899, _3073, _2897);
    out.m_88.x = _3075;
    out.m_88.y = _3077;
    out.m_88.z = _3085;
    out.m_88.w = _3061;
    bool _3087 = !_2977;
    float _3089 = _3083;
    float _3091 = _3083;
    if (!_3087)
    {
        bool _3093 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3095 = isnan(_2788);
        bool _3097 = _3093 || _3095;
        bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3101 = _3097 || _3099;
        if (!_3101)
        {
            float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3105 = _2788 + _3103;
            float _3107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3107;
            float _3111 = 1.0 / _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3119 = _3117 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3121 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3123 = _3121 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3129 = _3105 * _3111;
            float _3131 = precise::clamp(_3129, 0.0, 1.0);
            float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3141 = fma(_3131, _3115, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3143 = fma(_3131, _3135, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3145 = fma(_3131, _3139, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3147 = fma(_3131, _3119, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3149 = fma(_3131, _3123, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3151 = fma(_3131, _3127, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3049 = _3145;
            _3069 = _3149;
            _3027 = _3143;
            _3081 = _3147;
            _3091 = _3141;
            _3041 = _3151;
            _3153 = true;
        }
        else
        {
            bool _3155 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3157 = isnan(_2788);
            bool _3159 = _3155 || _3157;
            bool _3161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3163 = _3159 || _3161;
            if (!_3163)
            {
                _3025 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3165 = _3025;
            _3027 = _3165;
            if (!_3163)
            {
                _3047 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3167 = _3047;
            _3049 = _3167;
            if (!_3163)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3169 = _3089;
            _3091 = _3169;
            if (!_3163)
            {
                _3079 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3171 = _3079;
            _3081 = _3171;
            if (!_3163)
            {
                _3067 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3173 = _3067;
            _3069 = _3173;
            if (!_3163)
            {
                _3039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3175 = _3039;
            bool _3177 = !_3163;
            _3041 = _3175;
            if (!_3177)
            {
                bool _3179 = _2788 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3181 = isnan(_2788);
                bool _3183 = _3179 || _3181;
                bool _3185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3187 = _3183 || _3185;
                if (!_3187)
                {
                    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3191 = _2788 + _3189;
                    float _3193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3193;
                    float _3197 = 1.0 / _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3205 = _3203 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3209 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3215 = _3191 * _3197;
                    float _3217 = precise::clamp(_3215, 0.0, 1.0);
                    float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3221 = _3219 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3223 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3227 = fma(_3217, _3201, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3229 = fma(_3217, _3221, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3231 = fma(_3217, _3225, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3233 = fma(_3217, _3205, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3235 = fma(_3217, _3209, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3237 = fma(_3217, _3213, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3049 = _3231;
                    _3069 = _3235;
                    _3027 = _3229;
                    _3081 = _3233;
                    _3091 = _3227;
                    _3041 = _3237;
                    _3153 = true;
                }
                else
                {
                    _3049 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3069 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3027 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3081 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3153 = false;
    float _3239 = _3049;
    float _3241 = _3069;
    float _3243 = _3027;
    float _3245 = _3081;
    float _3247 = _3091;
    float _3249 = _3041;
    float _3251 = _2983 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3253 = fma(_1553, -0.5, 0.5);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = -_3239;
    float _3259 = _3257 + _3241;
    float _3261 = -_3243;
    float _3263 = _3261 + _3245;
    out.m_90.x = 0.0;
    float _3265 = -_3247;
    float _3267 = _3265 + _3249;
    float _3269 = fma(_3255, _3259, _3239);
    float _3271 = fma(_3255, _3263, _3243);
    bool _3273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3269 * 0.586610972881317138671875;
    float _3277 = fma(_3255, _3267, _3247);
    out.m_63.x = _3251;
    bool _3279 = _2472 > 0.0;
    bool _3281 = isnan(_2472);
    bool _3283 = _3279 || _3281;
    bool _3285 = isnan(0.0);
    bool _3287 = _3283 || _3285;
    float _3289 = fma(_3271, 0.298911988735198974609375, _3275);
    float _3291 = fma(_3277, 0.114477999508380889892578125, _3289);
    float _3293 = -_3291;
    float _3295 = _3271 + _3293;
    float _3297 = -_3291;
    float _3299 = _3269 + _3297;
    float _3301 = -_3291;
    float _3303 = _3277 + _3301;
    float _3305 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    float _3307 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    float _3309 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3291);
    bool _3311 = !_3273;
    if (!_3311)
    {
        float _3313 = -_2306;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3317 = -_2308;
        float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3321 = -_2310;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3325 = _3315 * _3315;
        float _3327 = fma(_3319, _3319, _3325);
        float _3329 = fma(_3323, _3323, _3327);
        float _3331 = sqrt(_3329);
        float _3333 = rsqrt(_3329);
        float _3335 = -_3331;
        float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3339 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3341 = precise::clamp(_3339, 0.0, 1.0);
        float _3343 = _3319 * _3333;
        float _3345 = _3315 * _3333;
        float _3347 = abs(_3341);
        float _3349 = log2(_3347);
        float _3351 = _3323 * _3333;
        float _3353 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3355 = _1553 * _3345;
        float _3357 = -_3345;
        float _3359 = -_3353;
        float _3361 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3359);
        float _3363 = fma(_1551, _3343, _3355);
        float _3365 = -_3351;
        float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3361);
        float _3369 = fma(_1555, _3351, _3363);
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3375 = _3367 + _3373;
        float _3377 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3379 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = exp2(_3377);
        float _3385 = _3383 * _3381;
        float _3387 = _3371 * _3385;
        float _3389 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3391 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3393 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3389;
        out.m_90.y = _3391;
        out.m_90.z = _3393;
    }
    out.m_92.x = _3305;
    out.m_92.y = _3307;
    out.m_92.z = _3309;
    if (_3287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

