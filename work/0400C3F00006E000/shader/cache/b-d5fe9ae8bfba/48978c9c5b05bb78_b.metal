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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_112 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_92 [[user(locn5)]];
    float4 m_104 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_100 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_110 [[user(locn14)]];
    float4 m_106 [[user(locn15)]];
    float4 m_108 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_86 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_78 [[attribute(8)]];
    float4 m_80 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5439 = false;
    bool _4040 = false;
    bool _571 = false;
    bool _465 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_58.w;
    float _128 = in.m_60.w;
    float _130 = trunc(_126);
    int _133 = int(_130);
    float _135 = -_128;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _137;
    bool _141 = _133 >= 1;
    float _143 = 0.0;
    float _145 = _128;
    float _147 = _137;
    if (!_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _143;
    if (!_141)
    {
        out.m_65.x = 0.0;
    }
    int _151 = 0;
    if (!_141)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    int _157 = _155;
    if (!_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5749 = as_type<float>(_155);
        out.gl_Position.z = _5749;
    }
    if (!_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _159 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_128);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = float(_133);
    bool _171 = _137 >= _169;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    float _177 = 1.0 / _169;
    if (_175)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _179 = _145;
    if (_175)
    {
        out.m_65.x = 0.0;
    }
    float _181 = _137 * _177;
    float _183 = _181;
    if (_175)
    {
        float _185 = _179 * 5.0;
        _157 = as_type<int>(_185);
    }
    int _187 = _157;
    out.m_63.x = _181;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5812 = as_type<float>(_187);
        out.gl_Position.z = _5812;
    }
    if (_175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_70.x;
    float _193 = in.m_70.y;
    float _195 = in.m_70.z;
    float _197 = in.m_72.x;
    float _199 = in.m_72.y;
    float _201 = in.m_72.z;
    float _203 = in.m_74.x;
    float _205 = in.m_74.y;
    float _207 = in.m_74.z;
    float _209 = in.m_76.x;
    float _211 = in.m_76.y;
    float _213 = in.m_76.z;
    int _215 = as_type<int>(_189) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_189) & 2;
    bool _221 = _219 != 0;
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = _193 * _199;
    float _227 = _193 * _205;
    float _229 = fma(_191, _197, _225);
    float _231 = _193 * _211;
    float _233 = fma(_191, _203, _227);
    float _235 = fma(_195, _201, _229);
    float _237 = fma(_191, _209, _231);
    float _239 = fma(_195, _207, _233);
    float _241 = fma(_195, _213, _237);
    bool _243 = !_217;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_221;
    float _249 = _247 ? (-0.5) : 0.5;
    bool _251 = !_223;
    float _253 = _239;
    float _255 = _241;
    float _257 = _235;
    float _275;
    if (!_251)
    {
        float _259 = in.m_78.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        _275 = _181;
    }
    _277 = false;
    float _279 = _275;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _279 + _285;
    bool _289 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_279);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _279 + _313;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _307;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _311;
    float _325 = _315 * _319;
    bool _327 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_279);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _283 * _321;
    bool _341 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_279);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -_299;
    float _355 = _353 + 1.0;
    bool _357 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_279);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = _351 * _355;
    float _375 = _287 * _323;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _367 * _371;
    float _395 = -_367;
    float _397 = _395 + 1.0;
    float _399 = fma(_387, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = _337 * _397;
    float _405 = -_337;
    float _407 = _405 + 1.0;
    float _409 = fma(_391, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = _399 * _403;
    float _413 = _401 * _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _415;
    float _419 = fma(_383, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _421;
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _429 = fma(_417, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _431 = fma(_423, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _433 = fma(_409, _393, _425);
    float _435 = fma(_419, _393, _427);
    float _437 = fma(_429, _373, _433);
    float _439 = fma(_431, _373, _435);
    float _441 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _437);
    float _443 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _439);
    bool _445 = !_317;
    float _463;
    if (!_445)
    {
        float _447 = in.m_78.x;
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _447 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        _463 = _181;
    }
    _465 = false;
    float _467 = _463;
    float _469 = in.m_80.x;
    float _471 = in.m_80.y;
    bool _473 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = isnan(_467);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _507 = _467 + _505;
    float _509 = -_483;
    float _511 = _509 + 1.0;
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _515 = 1.0 / _487;
    float _517 = _499 * _511;
    float _519 = -_499;
    float _521 = _519 + 1.0;
    float _523 = _443 * _471;
    float _525 = _441 * _469;
    float _527 = _503 * _515;
    float _529 = fma(_527, _507, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = _529 * _517;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _541 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[116].x, _539);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_82.x = _541;
    out.m_82.y = _537;
    out.m_82.z = _549;
    out.m_82.w = _547;
    bool _551 = !_513;
    float _569;
    if (!_551)
    {
        float _553 = in.m_78.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        _569 = _181;
    }
    _571 = false;
    float _573 = _569;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _577 = _573 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _587;
    bool _591 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _593 = isnan(_573);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _581;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _613 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _615 = isnan(_573);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    bool _625 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_573);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _585;
    float _639 = -_623;
    float _641 = _639 + 1.0;
    bool _643 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _645 = _589 * _603;
    bool _647 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _649 = isnan(_573);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _607;
    float _661 = -_601;
    float _663 = _661 + 1.0;
    float _665 = fma(_645, _577, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _667 = _601 * _641;
    float _669 = -_657;
    float _671 = _669 + 1.0;
    float _673 = _657 * _663;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _679;
    float _683 = 1.0 / _611;
    float _685 = _635 * _671;
    float _687 = _677 * _637;
    float _689 = -_635;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _697 = _665 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _701 = _573 + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _705 = _573 + _703;
    float _707 = _681 * _659;
    bool _709 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _711 = isnan(_573);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_687, _701, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _723 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[131].x, _697);
    float _725 = fma(_707, _705, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _729 = _573 + _727;
    float _731 = -_719;
    float _733 = _731 + 1.0;
    float _735 = fma(_721, _673, _723);
    float _737 = _695 * _683;
    float _739 = _623 * _733;
    float _741 = fma(_725, _667, _735);
    float _743 = fma(_737, _729, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _747 = fma(_743, _739, _741);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _755 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[135].x, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_84.x = _751;
    out.m_84.y = _757;
    out.m_84.z = _759;
    out.m_84.w = _761;
    bool _763 = !_643;
    float _765 = _761;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _769 = _751;
    if (!_763)
    {
        float _771 = in.m_78.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _183 = _785;
    }
    float _787 = _183;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _791 = int(_789);
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _795 = int(_793);
    float _797 = float(_791);
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _801 = int(_799);
    float _803 = float(_795);
    float _805 = 1.0 / _797;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _809 = int(_807);
    float _811 = float(uint(_801));
    int _813 = ~_801;
    int _815 = _813 + 1;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _819 = _817 != 0;
    float _821 = 1.0 / _803;
    float _823 = _805 * _137;
    float _825 = 1.0 / _811;
    float _827 = float(uint(_809));
    if (_819)
    {
        _765 = 1.0;
    }
    float _829 = _765;
    int _831 = 0;
    float _833 = _829;
    if (_819)
    {
        _831 = 0;
    }
    int _835 = _831;
    float _837 = trunc(_823);
    int _839 = int(_837);
    float _841 = _821 * _137;
    float _843 = 1.0 / _827;
    int _845 = as_type<int>(_825) + (-2);
    float _847 = trunc(_841);
    int _849 = int(_847);
    float _851 = float(uint(_839));
    float _853 = as_type<float>(_845) * _851;
    int _855 = as_type<int>(_843) + (-2);
    float _857 = _851;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _861 = as_type<int>(_853);
    int _863 = _835;
    if (_819)
    {
        float _865 = in.m_78.x;
        float _867 = in.m_78.y;
        _857 = _865;
        _859 = _867;
    }
    float _869 = _857;
    float _871 = _859;
    float _873 = trunc(_853);
    float _875 = precise::max(_873, 0.0);
    uint _878 = uint(_875);
    int _880 = ~_809;
    int _882 = _880 + 1;
    float _884 = float(uint(_849));
    if (_819)
    {
        _861 = 0;
    }
    int _886 = _861;
    float _888 = as_type<float>(_855) * _884;
    float _890 = trunc(_888);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    int _896 = _815 * int(_878);
    int _898 = _896 + _839;
    float _900 = float(uint(_898));
    float _902 = _900;
    float _904 = _869;
    float _906 = _871;
    int _908 = _886;
    if (_819)
    {
        _767 = _869;
    }
    float _910 = _767;
    float _912 = as_type<float>(_845) * _900;
    float _914 = _910;
    if (_819)
    {
        _769 = _910;
    }
    float _916 = _769;
    float _918 = _916;
    if (_819)
    {
        _902 = _871;
    }
    float _920 = _902;
    float _922 = trunc(_912);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _882 * int(_894);
    int _930 = _928 + _849;
    float _932 = float(uint(_930));
    float _934 = as_type<float>(_855) * _932;
    float _936 = _932;
    float _938 = _934;
    float _940 = _920;
    if (_819)
    {
        _936 = 1.0;
    }
    float _942 = _936;
    float _944 = trunc(_934);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    float _950 = _942;
    if (_819)
    {
        _938 = _910;
    }
    float _952 = _938;
    float _954 = _952;
    if (!_819)
    {
        float _956 = in.m_78.x;
        float _958 = in.m_78.y;
        float _960 = in.m_78.z;
        float _962 = _956 * 3.1415927410125732421875;
        float _964 = _962 * 0.15915493667125701904296875;
        float _966 = _958 * 3.1415927410125732421875;
        float _968 = _966 * 0.15915493667125701904296875;
        float _970 = _964 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        _833 = 7.345489978790283203125;
        _904 = _956;
        _950 = 5.839270114898681640625;
        _954 = _960;
        _906 = _958;
        _914 = _958;
        _863 = 1;
        _908 = 2;
        _918 = _972;
        _940 = _976;
    }
    float _978 = _833;
    float _980 = _904;
    float _982 = _950;
    float _984 = _954;
    float _986 = _906;
    float _988 = _914;
    int _990 = _863;
    int _992 = _908;
    float _994 = _918;
    float _996 = _940;
    float _998 = _978 * _980;
    float _1000 = _982 * _984;
    int _1002 = int(_894) + int(_948);
    float _1004 = in.m_78.z;
    float _1006 = in.m_78.w;
    float _1008 = floor(_998);
    int _1010 = ~_809;
    int _1012 = _1010 + 1;
    float _1014 = _986 * 2.0;
    int _1016 = int(_878) + int(_926);
    float _1018 = _978 * _988;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1022 = _787 + _1020;
    int _1024 = ~_801;
    int _1026 = _1024 + 1;
    float _1028 = floor(_1000);
    float _1030 = float(_809);
    int _1032 = _1012 * _1002;
    int _1034 = _1032 + _849;
    int _1036 = _1026 * _1016;
    int _1038 = _1036 + _839;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1042 = _787 + _1040;
    bool _1044 = uint(_1034) >= uint(_809);
    float _1046 = -_1008;
    float _1048 = _998 + _1046;
    bool _1050 = uint(_1038) >= uint(_801);
    float _1052 = floor(_1014);
    bool _1054 = !_1044;
    int _1056 = _1054 ? 0 : (-1);
    float _1058 = _1048 * _1030;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1062 = _1060 != 0;
    int _1064 = ~_1002;
    int _1066 = _1064 + _1056;
    int _1068 = _1066 + 1;
    float _1070 = -_1028;
    float _1072 = _1000 + _1070;
    bool _1074 = !_1050;
    int _1076 = _1074 ? 0 : (-1);
    float _1078 = trunc(_1058);
    int _1080 = int(_1078);
    bool _1082 = !_1062;
    int _1084 = _1082 ? 0 : 1;
    bool _1086 = _1004 > 0.5;
    float _1088 = float(_849);
    bool _1090 = _986 > 0.5;
    int _1092 = ~_1016;
    int _1094 = _1092 + _1076;
    int _1096 = _1094 + 1;
    bool _1098 = _1088 >= _1030;
    bool _1100 = isnan(_1088);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(_1030);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1120 = _1118 != 0;
    int _1122 = _801 * _1096;
    int _1124 = _1122 + _839;
    float _1126 = -_249;
    int _1128 = _1086 ? as_type<int>(_1126) : as_type<int>(_249);
    float _1130 = trunc(_1108);
    int _1132 = int(_1130);
    float _1134 = -_245;
    int _1136 = _1090 ? as_type<int>(_1134) : as_type<int>(_245);
    int _1138 = abs(_1084);
    bool _1140 = !_1120;
    float _1142 = _1140 ? _249 : as_type<float>(_1128);
    int _1144 = _809 * _1068;
    int _1146 = _1144 + _849;
    bool _1148 = !_1116;
    float _1150 = _1148 ? _245 : as_type<float>(_1136);
    int _1152 = _1080 * _1138;
    int _1154 = _1152 + _849;
    float _1156 = float(_801);
    float _1158 = _177 * _137;
    float _1160 = float(_839);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1172 = _1170 != 0;
    float _1174 = _1030 * _1158;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1178 = _1176 != 0;
    bool _1180 = _1160 >= _1156;
    bool _1182 = isnan(_1160);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(_1156);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = trunc(_1174);
    int _1198 = int(_1196);
    bool _1200 = !_1164;
    int _1202 = _1200 ? 0 : 1;
    bool _1204 = !_1172;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1178;
    float _1222 = _1220 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1224 = trunc(_1190);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1230 = _1228 != 0;
    bool _1232 = !_1210;
    int _1234 = _1232 ? 0 : 1;
    bool _1236 = _809 == 0;
    int _1238 = ~_1132;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    bool _1244 = !_1236;
    int _1246 = _1244 ? _1146 : (-1);
    float _1248 = _1072 * _1156;
    int _1250 = _809 + (-1);
    int _1252 = _1246 * _1242;
    bool _1254 = !_1214;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = _1156 * _1158;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1262 = _1260 != 0;
    int _1264 = _1132 * _1250;
    int _1266 = _1264 + _1252;
    int _1268 = abs(_1194);
    float _1270 = as_type<float>(_1132);
    float _1272 = _1222;
    float _1274 = as_type<float>(_992);
    float _1276 = _1150;
    if (_1230)
    {
        float _1278 = in.m_78.w;
        _1270 = _1278;
    }
    float _1280 = _1270;
    bool _1282 = !_1262;
    float _1284 = _1282 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1286 = trunc(_1248);
    int _1288 = int(_1286);
    int _1290 = abs(_1256);
    bool _1292 = _801 == 0;
    int _1294 = abs(_1202);
    float _1296 = trunc(_1258);
    int _1298 = int(_1296);
    int _1300 = ~_1226;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1292;
    int _1308 = _1306 ? _1124 : (-1);
    int _1310 = _1266 * _1268;
    int _1312 = _801 + (-1);
    int _1314 = _1308 * _1304;
    int _1316 = abs(_1206);
    int _1318 = _1198 * _1294;
    int _1320 = _1318 + _1310;
    int _1322 = abs(as_type<int>(_1284));
    int _1324 = _1226 * _1312;
    int _1326 = _1324 + _1314;
    int _1328 = abs(as_type<int>(_1222));
    float _1330 = _1284;
    if (_1230)
    {
        float _1332 = _1280 * 3.1415927410125732421875;
        _1272 = _1332;
    }
    float _1334 = _1272;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1338 = _1336 != 0;
    int _1340 = _1154 * _1316;
    int _1342 = _1340 + _1320;
    int _1344 = abs(_1234);
    int _1346 = _1288 * _1322;
    int _1348 = _1346 + _839;
    bool _1350 = !_1218;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = _1326 * _1290;
    bool _1356 = !_1338;
    int _1358 = _1356 ? 0 : 1;
    float _1360 = _1334;
    bool _1362 = _1338;
    if (_1230)
    {
        float _1364 = _1334 * 0.15915493667125701904296875;
        _1360 = _1364;
    }
    float _1366 = _1360;
    int _1368 = _1080 * _1328;
    int _1370 = _1368 + _1342;
    int _1372 = abs(_1352);
    float _1374 = _980 * 2.0;
    int _1376 = abs(_1358);
    int _1378 = _1298 * _1344;
    int _1380 = _1378 + _1354;
    float _1382 = _1366;
    if (_1230)
    {
        float _1384 = _1366 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        _1382 = _1386;
    }
    float _1388 = _1382;
    float _1390 = float(uint(_1370));
    float _1392 = 0.0;
    if (!_1230)
    {
        _1392 = _245;
    }
    float _1394 = _1392;
    int _1396 = _1348 * _1372;
    int _1398 = _1396 + _1380;
    int _1400 = ~_801;
    int _1402 = _1400 + 1;
    float _1404 = as_type<float>(_855) * _1390;
    bool _1406 = _809 == 0;
    int _1408 = _1288 * _1376;
    int _1410 = _1408 + _1398;
    float _1412 = -_245;
    int _1414 = _1086 ? as_type<int>(_1412) : as_type<int>(_245);
    float _1416 = floor(_1374);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1420 = _1418 != 0;
    float _1422 = float(uint(_1410));
    bool _1424 = !_1420;
    float _1426 = _1424 ? _245 : as_type<float>(_1414);
    float _1428 = _1394;
    if (_1230)
    {
        bool _1430 = _1388 > 0.5;
        _1362 = _1430;
    }
    bool _1432 = _1362;
    float _1434 = trunc(_1404);
    float _1436 = precise::max(_1434, 0.0);
    uint _1438 = uint(_1436);
    float _1440 = as_type<float>(_845) * _1422;
    int _1442 = ~_809;
    int _1444 = _1442 + 1;
    if (_1230)
    {
        float _1446 = -_245;
        float _1448 = _1432 ? _1446 : _245;
        _1428 = _1448;
    }
    float _1450 = _1428;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1454 = _1452 != 0;
    float _1456 = trunc(_1440);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = _1444 * int(_1438);
    int _1464 = _1462 + _1370;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1470 = as_type<float>(_1380);
    float _1472 = 1.4012984643248170709237295832899e-45;
    if (_1454)
    {
        float _1474 = in.m_78.x;
        _1470 = _1474;
    }
    float _1476 = _1470;
    float _1478 = 0.0;
    if (!_1454)
    {
        _1478 = _249;
    }
    float _1480 = _1478;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1484 = float(uint(_1464));
    int _1486 = _1402 * int(_1460);
    int _1488 = _1486 + _1410;
    float _1490 = as_type<float>(_855) * _1484;
    float _1492 = float(uint(_1488));
    float _1494 = trunc(_1490);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1504 = as_type<float>(_845) * _1492;
    int _1506 = ~_809;
    int _1508 = _1506 + 1;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1512 = trunc(_1504);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1522 = int(_1438) + int(_1498);
    float _1524 = as_type<float>(_1498);
    float _1526 = _1480;
    if (_1454)
    {
        float _1528 = _1476 * 3.1415927410125732421875;
        _1524 = _1528;
    }
    float _1530 = _1524;
    int _1532 = ~_801;
    int _1534 = _1532 + 1;
    float _1536 = 1.0 / _1520;
    int _1538 = _1508 * _1522;
    int _1540 = _1538 + _1370;
    float _1542 = _1530;
    if (_1454)
    {
        float _1544 = _1530 * 0.15915493667125701904296875;
        _1542 = _1544;
    }
    float _1546 = _1542;
    int _1548 = int(_1460) + int(_1516);
    bool _1550 = uint(_1540) >= uint(_809);
    float _1552 = _1546;
    if (_1454)
    {
        float _1554 = _1546 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1552 = _1556;
    }
    float _1558 = _1552;
    bool _1560 = !_1550;
    int _1562 = _1560 ? 0 : (-1);
    int _1564 = _1534 * _1548;
    int _1566 = _1564 + _1410;
    int _1568 = ~_1522;
    int _1570 = _1568 + _1562;
    int _1572 = _1570 + 1;
    bool _1574 = uint(_1566) >= uint(_801);
    int _1576 = _809 * _1572;
    int _1578 = _1576 + _1370;
    bool _1580 = !_1574;
    int _1582 = _1580 ? 0 : (-1);
    bool _1584 = _1574;
    if (_1454)
    {
        bool _1586 = _1558 > 0.5;
        _1584 = _1586;
    }
    bool _1588 = _1584;
    bool _1590 = !_1406;
    int _1592 = _1590 ? _1578 : (-1);
    if (_1454)
    {
        float _1594 = -_249;
        float _1596 = _1588 ? _1594 : _249;
        _1526 = _1596;
    }
    float _1598 = _1526;
    int _1600 = ~_1548;
    int _1602 = _1600 + _1582;
    int _1604 = _1602 + 1;
    int _1606 = _1592 & 3;
    bool _1608 = _1606 != 0;
    bool _1610 = _1006 > 0.5;
    int _1612 = _801 * _1604;
    int _1614 = _1612 + _1410;
    float _1616 = -_249;
    int _1618 = _1090 ? as_type<int>(_1616) : as_type<int>(_249);
    bool _1620 = uint(_1606) > 1u;
    float _1622 = -_249;
    int _1624 = _1610 ? as_type<int>(_1622) : as_type<int>(_249);
    int _1626 = _1592 & 3;
    bool _1628 = _1626 != 0;
    bool _1630 = !_1292;
    int _1632 = _1630 ? _1614 : (-1);
    int _1634 = _1628 ? 0 : 1;
    int _1636 = _1632 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = ~_1634;
    int _1642 = _1640 + 1;
    int _1644 = _1642 + 1;
    int _1646 = _1644;
    if (!_1620)
    {
        int _1648 = ~_1634;
        int _1650 = _1648 + 1;
        _1646 = _1650;
    }
    int _1652 = _1646;
    bool _1654 = uint(_1636) >= 2u;
    int _1656 = _1632 & 3;
    bool _1658 = _1656 != 0;
    int _1660 = _1654 ? 0 : 1;
    bool _1662 = _1636 != 3;
    int _1664 = ~_1660;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    int _1670 = _1658 ? 0 : 1;
    bool _1672 = uint(_1636) > 1u;
    int _1674 = ~_1670;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    int _1680 = int(_1662);
    int _1682 = _1672 ? 2 : 0;
    int _1684 = _1680 | _1682;
    int _1686 = _1638 ? 4 : 0;
    int _1688 = _1684 | _1686;
    int _1690 = _1112 ? 8 : 0;
    int _1692 = _1688 | _1690;
    int _1694 = _1608 ? 16 : 0;
    int _1696 = _1692 | _1694;
    int _1698 = _1292 ? 32 : 0;
    int _1700 = _1696 | _1698;
    int _1702 = _1406 ? 64 : 0;
    int _1704 = _1700 | _1702;
    int _1706 = _1704 & 4;
    int _1708 = int(_1662);
    int _1710 = _1672 ? 2 : 0;
    int _1712 = _1708 | _1710;
    int _1714 = _1638 ? 4 : 0;
    int _1716 = _1712 | _1714;
    int _1718 = _1112 ? 8 : 0;
    int _1720 = _1716 | _1718;
    int _1722 = _1608 ? 16 : 0;
    int _1724 = _1720 | _1722;
    int _1726 = _1292 ? 32 : 0;
    int _1728 = _1724 | _1726;
    int _1730 = _1406 ? 64 : 0;
    int _1732 = _1728 | _1730;
    int _1734 = _1732 & 16;
    int _1736 = _1668;
    int _1738 = _1678;
    if (_1662)
    {
        int _1740 = ~_1660;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    int _1746 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1748 = _1746 != 0;
    float _1750 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1752 = int(_1750);
    if (!_1672)
    {
        int _1754 = ~_1670;
        int _1756 = _1754 + 1;
        _1738 = _1756;
    }
    int _1758 = _1738;
    bool _1760 = !_1748;
    float _1762 = _1760 ? _249 : as_type<float>(_1618);
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1766 = _1764 != 0;
    bool _1768 = !_1112;
    float _1770 = _1768 ? _249 : as_type<float>(_1624);
    float _1772 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1774 = int(_1772);
    bool _1776 = !_1766;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1782 = _1780 != 0;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1794 = _1792 != 0;
    int _1796 = abs(_1758);
    float _1798 = float(uint(_1752));
    bool _1800 = !_1782;
    int _1802 = _1800 ? 0 : 1;
    bool _1804 = _980 > 0.5;
    float _1806 = 1.0 / _1798;
    int _1808 = ~_1752;
    int _1810 = _1808 + 1;
    float _1812 = float(_1774);
    float _1814 = -_245;
    int _1816 = _1804 ? as_type<int>(_1814) : as_type<int>(_245);
    int _1818 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1820 = _1818 != 0;
    float _1822 = 1.0 / _1812;
    int _1824 = ~_1752;
    int _1826 = _1824 + 1;
    bool _1828 = !_1820;
    float _1830 = _1828 ? _245 : as_type<float>(_1816);
    bool _1832 = _990 != 1;
    int _1834 = as_type<int>(_1806) + (-2);
    bool _1836 = !_1786;
    int _1838 = _1836 ? 0 : 1;
    bool _1840 = _1052 >= 0.0;
    bool _1842 = isnan(_1052);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    int _1850 = abs(_1838);
    bool _1852 = !_1790;
    int _1854 = _1852 ? 0 : 1;
    float _1856 = _1822 * _137;
    float _1858 = _1806;
    if (!_1832)
    {
        _1858 = _986;
    }
    float _1860 = _1858;
    float _1862 = _1860;
    if (!_1832)
    {
        _1330 = _986;
    }
    float _1864 = _1330;
    float _1866 = trunc(_1856);
    int _1868 = int(_1866);
    float _1870 = _1864;
    if (!_1832)
    {
        _1472 = _1004;
    }
    float _1872 = _1472;
    float _1874 = _1872;
    if (_1832)
    {
        _1862 = _980;
    }
    float _1876 = _1862;
    if (_1832)
    {
        _1870 = _980;
    }
    float _1878 = _1870;
    if (_1832)
    {
        _1874 = _986;
    }
    float _1880 = _1874;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1466);
    float _1884 = float(uint(_1868));
    float _1886 = as_type<float>(_1834) * _1884;
    float _1888 = _1884;
    float _1890 = _1886;
    if (!_1832)
    {
        _1888 = _1004;
    }
    float _1892 = _1888;
    float _1894 = _1892;
    if (_1832)
    {
        _1894 = _986;
    }
    float _1896 = _1894;
    float _1898 = trunc(_1886);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    bool _1904 = _992 != 2;
    if (_1904)
    {
        _1274 = _980;
    }
    float _1906 = _1274;
    int _1908 = _1810 * int(_1902);
    int _1910 = _1908 + _1868;
    float _1912 = _1906;
    if (_1904)
    {
        _1890 = _986;
    }
    float _1914 = _1890;
    float _1916 = _1914;
    if (!_1904)
    {
        _1912 = _1004;
    }
    float _1918 = _1912;
    float _1920 = float(uint(_1910));
    if (!_1904)
    {
        _1916 = _980;
    }
    float _1922 = _1916;
    float _1924 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1926 = _1416 >= 0.0;
    bool _1928 = isnan(_1416);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan(0.0);
    bool _1934 = _1930 || _1932;
    float _1936 = as_type<float>(_1834) * _1920;
    float _1938 = -_1468;
    float _1940 = fma(_1924, 2.0, _1938);
    int _1942 = _1934 ? 0 : 1;
    bool _1944 = _1416 > 0.0;
    float _1946 = trunc(_1936);
    float _1948 = precise::max(_1946, 0.0);
    uint _1950 = uint(_1948);
    int _1952 = ~_1942;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    float _1958 = floor(_1018);
    int _1960 = _1956;
    if (!_1944)
    {
        int _1962 = ~_1942;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    bool _1968 = _1052 > 0.0;
    int _1970 = int(_1902) + int(_1950);
    float _1972 = float(_1752);
    float _1974 = float(_1868);
    int _1976 = _1826 * _1970;
    int _1978 = _1976 + _1868;
    float _1980 = -_1958;
    float _1982 = _1018 + _1980;
    bool _1984 = _1974 >= _1972;
    bool _1986 = isnan(_1974);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(_1972);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    int _1996 = _1848 ? 0 : 1;
    bool _1998 = uint(_1978) >= uint(_1752);
    int _2000 = ~_1996;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = trunc(_1994);
    int _2008 = int(_2006);
    int _2010 = _2004;
    if (!_1968)
    {
        int _2012 = ~_1996;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    float _2018 = _1982 * _1972;
    bool _2020 = !_1998;
    int _2022 = _2020 ? 0 : (-1);
    float _2024 = _1972 * _1158;
    bool _2026 = !_1794;
    int _2028 = _2026 ? 0 : 1;
    float _2030 = _1004 * 2.0;
    int _2032 = ~_1970;
    int _2034 = _2032 + _2022;
    int _2036 = _2034 + 1;
    float _2038 = trunc(_2018);
    int _2040 = int(_2038);
    bool _2042 = _1706 != 0;
    int _2044 = abs(_1778);
    int _2046 = _1752 * _2036;
    int _2048 = _2046 + _1868;
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2052 = _2050 != 0;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2056 = _2054 != 0;
    int _2058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2060 = _2058 != 0;
    bool _2062 = _1752 == 0;
    float _2064 = floor(_2030);
    int _2066 = ~_2008;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    bool _2072 = !_2062;
    int _2074 = _2072 ? _2048 : (-1);
    float _2076 = float(uint(_1154));
    int _2078 = _1752 + (-1);
    int _2080 = _2074 * _2070;
    float _2082 = trunc(_2024);
    int _2084 = int(_2082);
    int _2086 = _2040 * _2044;
    int _2088 = _2086 + _1868;
    int _2090 = abs(_1802);
    int _2092 = _2008 * _2078;
    int _2094 = _2092 + _2080;
    float _2096 = float(uint(_1348));
    float _2098 = as_type<float>(_855) * _2076;
    bool _2100 = _2064 >= 0.0;
    bool _2102 = isnan(_2064);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan(0.0);
    bool _2108 = _2104 || _2106;
    float _2110 = as_type<float>(_845) * _2096;
    bool _2112 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2120 = _2116 || _2118;
    float _2122 = trunc(_2098);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    int _2128 = _2094 * _1850;
    int _2130 = abs(_1854);
    float _2132 = trunc(_2110);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    int _2138 = _2084 * _2090;
    int _2140 = _2138 + _2128;
    float _2142 = float(uint(_2088));
    int _2144 = ~_809;
    int _2146 = _2144 + 1;
    int _2148 = _2088 * _2130;
    int _2150 = _2148 + _2140;
    int _2152 = _2108 ? 0 : 1;
    int _2154 = abs(_2028);
    bool _2156 = _2064 > 0.0;
    float _2158 = as_type<float>(_1834) * _2142;
    int _2160 = ~_801;
    int _2162 = _2160 + 1;
    int _2164 = _2146 * int(_2126);
    int _2166 = _2164 + _1154;
    int _2168 = _2162 * int(_2136);
    int _2170 = _2168 + _1348;
    float _2172 = float(uint(_2166));
    float _2174 = trunc(_2158);
    float _2176 = precise::max(_2174, 0.0);
    uint _2178 = uint(_2176);
    int _2180 = _2040 * _2154;
    int _2182 = _2180 + _2150;
    int _2184 = ~_1752;
    int _2186 = _2184 + 1;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2190 = float(uint(_2170));
    float _2192 = as_type<float>(_855) * _2172;
    float _2194 = float(uint(_2182));
    float _2196 = _980 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2198 = ~_2152;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = as_type<float>(_845) * _2190;
    int _2206 = _2202;
    if (!_2156)
    {
        int _2208 = ~_2152;
        int _2210 = _2208 + 1;
        _2206 = _2210;
    }
    int _2212 = _2206;
    float _2214 = as_type<float>(_1834) * _2194;
    float _2216 = -_2188;
    float _2218 = fma(_2196, 2.0, _2216);
    float _2220 = trunc(_2192);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    int _2226 = _2186 * int(_2178);
    int _2228 = _2226 + _2088;
    int _2230 = ~_809;
    int _2232 = _2230 + 1;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2238 = float(uint(_2228));
    float _2240 = trunc(_2214);
    float _2242 = precise::max(_2240, 0.0);
    uint _2244 = uint(_2242);
    float _2246 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2234);
    float _2248 = _994 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _2250 = ~_1752;
    int _2252 = _2250 + 1;
    float _2254 = as_type<float>(_1834) * _2238;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2258 = -_2236;
    float _2260 = fma(_2248, 2.0, _2258);
    float _2262 = trunc(_2204);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    int _2268 = int(_2126) + int(_2224);
    float _2270 = _986 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2274 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2246);
    float _2276 = fma(_2270, -2.0, _2256);
    float _2278 = trunc(_2254);
    float _2280 = precise::max(_2278, 0.0);
    uint _2282 = uint(_2280);
    int _2284 = _2252 * int(_2244);
    int _2286 = _2284 + _2182;
    float _2288 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2272);
    float _2290 = _996 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2292 = _2232 * _2268;
    int _2294 = _2292 + _1154;
    float _2296 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2298 = float(uint(_2286));
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2302 = int(_2136) + int(_2266);
    float _2304 = -_1482;
    float _2306 = fma(_2296, 2.0, _2304);
    bool _2308 = uint(_2294) >= uint(_809);
    float _2310 = as_type<float>(_1834) * _2298;
    float _2312 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2314 = log2(_2312);
    int _2316 = ~_801;
    int _2318 = _2316 + 1;
    float _2320 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2322 = !_2308;
    int _2324 = _2322 ? 0 : (-1);
    float _2326 = fma(_2290, -2.0, _1502);
    int _2328 = int(_2178) + int(_2282);
    int _2330 = _2318 * _2302;
    int _2332 = _2330 + _1348;
    int _2334 = ~_1752;
    int _2336 = _2334 + 1;
    float _2338 = trunc(_2310);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_2320, -2.0, _1510);
    float _2346 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2300);
    bool _2348 = uint(_2332) >= uint(_801);
    int _2350 = _2336 * _2328;
    int _2352 = _2350 + _2088;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2356 = _2314 * _137;
    bool _2358 = !_2348;
    int _2360 = _2358 ? 0 : (-1);
    float _2362 = -_137;
    float _2364 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2218);
    bool _2366 = uint(_2352) >= uint(_1752);
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2370 = ~_1752;
    int _2372 = _2370 + 1;
    float _2374 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2354);
    bool _2376 = !_2366;
    int _2378 = _2376 ? 0 : (-1);
    float _2380 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2368);
    int _2382 = int(_2244) + int(_2342);
    float _2384 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2386 = exp2(_2356);
    float _2388 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2276);
    int _2390 = _2372 * _2382;
    int _2392 = _2390 + _2182;
    float _2394 = fma(_2384, -2.0, _1500);
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2398 = uint(_2392) >= uint(_1752);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2402 = 1.0 + _2400;
    float _2404 = in.m_58.x;
    float _2406 = in.m_58.y;
    float _2408 = in.m_58.z;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2412 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2288);
    float _2414 = -_137;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2260);
    float _2418 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2326);
    float _2420 = 1.0 / _2402;
    float _2422 = -_2386;
    float _2424 = _2422 + 1.0;
    float _2426 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1882);
    float _2428 = -_137;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2306);
    float _2432 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2344);
    float _2434 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _249);
    float _2436 = _2120 ? _2424 : 0.0;
    float _2438 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2410);
    bool _2440 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2442 = isnan(1.0);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2448 = _2444 || _2446;
    float _2450 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2396);
    float _2452 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2380);
    float _2454 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2438);
    float _2456 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2374);
    float _2458 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2346);
    float _2460 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2450);
    float _2462 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2394);
    float _2464 = -_137;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1940);
    bool _2468 = !_2398;
    int _2470 = _2468 ? 0 : (-1);
    float _2472 = _205 * _2406;
    float _2474 = _211 * _2406;
    float _2476 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_2448)
    {
        float _2478 = _2436 * _2420;
        _147 = _2478;
    }
    float _2480 = _147;
    float _2482 = _199 * _2406;
    float _2484 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2486 = fma(_203, _2404, _2472);
    bool _2488 = _1636 != 3;
    float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2492 = _2490 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2498 = fma(_197, _2404, _2482);
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2502 = _2500 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2504 = !_2056;
    int _2506 = _2504 ? 0 : 1;
    float _2508 = 1.0 / _2492;
    float _2510 = fma(_209, _2404, _2474);
    bool _2512 = _1734 != 0;
    float _2514 = fma(_207, _2408, _2486);
    bool _2516 = !_2042;
    int _2518 = _2516 ? 0 : 1;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2524 = !_2488;
    int _2526 = _2524 ? 0 : (-1);
    float _2528 = _2484 * _2434;
    float _2530 = 1.0 / _2496;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2534 = _2532 != 0;
    float _2536 = fma(_213, _2408, _2510);
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2540 = _2538 != 0;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2548 = _2546 != 0;
    float _2550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _2552 = 1.0 / _2502;
    float _2554 = _2476 * _2550;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2564;
    float _2568 = fma(_201, _2408, _2498);
    float _2570 = 1.0 / _2522;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2576 = _2562 * _1536;
    float _2578 = _2566 * _2508;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2584 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2586 = isnan(_787);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2558 * _2530;
    float _2598 = 1.0 / _2544;
    bool _2600 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2602 = isnan(_787);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2608 = _2604 || _2606;
    float _2610 = float(_2608);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2614 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2612;
    float _2616 = -_2594;
    float _2618 = _2616 + 1.0;
    float _2620 = _2582 * _2552;
    bool _2622 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2624 = isnan(_787);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2610;
    float _2636 = _2634 + 1.0;
    float _2638 = _2610 * _2618;
    float _2640 = 1.0 / _2574;
    float _2642 = _2614 * _2570;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2648 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2650 = isnan(_787);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2656 = _2652 || _2654;
    float _2658 = float(_2656);
    float _2660 = -_2632;
    float _2662 = _2660 + 1.0;
    bool _2664 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2666 = isnan(_787);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = _2632 * _2636;
    float _2678 = _2646 * _2598;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2680;
    float _2684 = _2658 * _2662;
    float _2686 = -_2658;
    float _2688 = _2686 + 1.0;
    bool _2690 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2692 = isnan(_787);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = -_2674;
    float _2704 = _2702 + 1.0;
    bool _2706 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2708 = isnan(_787);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2674 * _2688;
    float _2720 = _2682 * _2640;
    float _2722 = in.m_72.w;
    float _2724 = _2700 * _2704;
    float _2726 = -_2700;
    float _2728 = _2726 + 1.0;
    bool _2730 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2732 = isnan(_787);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = in.m_74.w;
    float _2744 = -_2716;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2596, _1022, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2750 = _2716 * _2728;
    float _2752 = in.m_76.w;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2756 = _787 + _2754;
    float _2758 = _2740 * _2746;
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2762 = _787 + _2760;
    float _2764 = fma(_2578, _1042, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2766 = fma(_2620, _2756, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2768 = _2748 * _2758;
    float _2770 = -_2740;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2576, _2762, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2778 = _787 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2782 = _787 + _2780;
    float _2784 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2768);
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2788 = _787 + _2786;
    bool _2790 = !_2052;
    int _2792 = _2790 ? 0 : 1;
    float _2794 = fma(_2678, _2782, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2796 = fma(_2774, _2750, _2784);
    float _2798 = fma(_2720, _2788, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2800 = _2568 + _2722;
    float _2802 = _986 + _980;
    float _2804 = fma(_2764, _2724, _2796);
    float _2806 = _2514 + _2742;
    float _2808 = _2802 + (-1.0);
    float _2810 = fma(_2642, _2778, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2812 = _2536 + _2752;
    int _2814 = abs(_2792);
    float _2816 = in.m_86.x;
    float _2818 = in.m_86.y;
    float _2820 = in.m_86.z;
    float _2822 = fma(_2808, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2824 = float(_2212);
    float _2826 = _980 + _1004;
    float _2828 = float(_2814);
    float _2830 = _980 + (-0.5);
    float _2832 = _986 + _1004;
    float _2834 = fma(_2766, _2718, _2804);
    float _2836 = _2828 * _2824;
    float _2838 = _2826 + (-1.0);
    float _2840 = _2832 + (-1.0);
    int _2842 = abs(_2506);
    float _2844 = _2836 * (-2.0);
    float _2846 = _1598 + (-0.5);
    float _2848 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2850 = !_2060;
    int _2852 = _2850 ? 0 : 1;
    float _2854 = fma(_2810, _2684, _2834);
    float _2856 = -_2846;
    float _2858 = -_2418;
    float _2860 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2858);
    float _2862 = float(_1966);
    float _2864 = fma(_2822, _2844, _2822);
    int _2866 = abs(_2852);
    float _2868 = _1450 + 0.5;
    float _2870 = fma(_2844, _2816, _2816);
    float _2872 = float(_2842);
    float _2874 = fma(_2794, _2676, _2854);
    float _2876 = _1762 + (-0.5);
    float _2878 = fma(_2830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2870);
    float _2880 = fma(_2838, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2882 = _2872 * _2862;
    float _2884 = _986 + (-0.5);
    float _2886 = fma(_2864, _2480, _2878);
    float _2888 = float(_2016);
    float _2890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2892 = float(_2866);
    float _2894 = _2882 * (-2.0);
    float _2896 = _2886 * 0.15915493667125701904296875;
    float _2898 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2416);
    float _2900 = -_2876;
    float _2902 = -_2388;
    float _2904 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2902);
    float _2906 = _2892 * _2888;
    float _2908 = fma(_2894, _2818, _2818);
    float _2910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2912 = -_2274;
    float _2914 = _2912 + 1.0;
    float _2916 = _2906 * (-2.0);
    float _2918 = -_2412;
    float _2920 = _2918 + 1.0;
    float _2922 = fma(_2848, _2894, _2848);
    float _2924 = fma(_2884, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2908);
    float _2926 = fma(_2880, _2916, _2880);
    float _2928 = fma(_2916, _2820, _2820);
    float _2930 = -_2914;
    float _2932 = fma(_2930, _1450, _2898);
    float _2934 = fma(_2920, _1598, _2860);
    float _2936 = _1004 + (-0.5);
    float _2938 = _2890 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2940 = fma(_2922, _2480, _2924);
    float _2942 = _1830 + 0.5;
    float _2944 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2928);
    out.m_88.x = _2932;
    out.m_88.y = _2934;
    float _2946 = fma(_2798, _2638, _2874);
    float _2948 = _2940 * 0.15915493667125701904296875;
    float _2950 = fma(_2926, _2480, _2944);
    float _2952 = _2910 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2954 = _1426 + 0.5;
    float _2956 = fma(_2942, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2364);
    float _2958 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2946);
    float _2960 = _2896 * 6.283185482025146484375;
    float _2962 = sin(_2960);
    float _2964 = fma(_2952, _2954, _2430);
    float _2966 = _1770 + (-0.5);
    float _2968 = -_2452;
    float _2970 = _2968 + 1.0;
    float _2972 = -_2458;
    float _2974 = _2972 + 1.0;
    float _2976 = -_2426;
    float _2978 = _2976 + 1.0;
    float _2980 = -_2938;
    float _2982 = -_2462;
    float _2984 = fma(_2980, _2966, _2982);
    float _2986 = -_2454;
    float _2988 = _2986 + 1.0;
    float _2990 = _2950 * 0.15915493667125701904296875;
    float _2992 = _2948 * 6.283185482025146484375;
    float _2994 = sin(_2992);
    int _2996 = ~_2302;
    int _2998 = _2996 + _2360;
    int _3000 = _2998 + 1;
    float _3002 = fma(_1762, _2970, _2904);
    int _3004 = _1632 >> 31;
    float _3006 = -_2988;
    float _3008 = fma(_1830, _3006, _2956);
    float _3010 = -_2974;
    float _3012 = fma(_1426, _3010, _2964);
    float _3014 = fma(_1770, _2978, _2984);
    int _3016 = _801 * _3000;
    int _3018 = _3016 + _1348;
    float _3020 = _2948 * 6.283185482025146484375;
    float _3022 = cos(_3020);
    int _3024 = _3004 & 3;
    out.m_90.x = _2958;
    int _3026 = ~_2268;
    int _3028 = _3026 + _2324;
    int _3030 = _3028 + 1;
    int _3032 = ~_2328;
    int _3034 = _3032 + _2378;
    int _3036 = _3034 + 1;
    out.m_92.x = _3008;
    out.m_92.y = _3002;
    out.m_92.z = _3012;
    out.m_92.w = _3014;
    bool _3038 = _801 == 0;
    float _3040 = _2990 * 6.283185482025146484375;
    float _3042 = cos(_3040);
    int _3044 = _809 * _3030;
    int _3046 = _3044 + _1154;
    float _3048 = _2962 * _2994;
    int _3050 = _1752 * _3036;
    int _3052 = _3050 + _2088;
    bool _3054 = !_3038;
    int _3056 = _3054 ? _3018 : (-1);
    float _3058 = _2896 * 6.283185482025146484375;
    float _3060 = cos(_3058);
    float _3062 = _2962 * _3022;
    int _3064 = _1632 + _3024;
    float _3066 = _2990 * 6.283185482025146484375;
    float _3068 = sin(_3066);
    int _3070 = _3064 >> 2;
    float _3072 = _2962 * _3042;
    int _3074 = _3070 << 4;
    int _3076 = _3074 + 656;
    float _3078 = _3072 * _2528;
    float _3080 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3082 = _3060 * _3022;
    float _3084 = _3060 * _2994;
    float _3086 = _3060 * _3042;
    float _3088 = _3022 * _3042;
    float _3090 = _2994 * _3042;
    float _3092 = _3086 * _2528;
    float _3094 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3096 = -_3084;
    float _3098 = fma(_3068, _3062, _3096);
    float _3100 = fma(_3068, _3082, _3048);
    float _3102 = fma(_3068, _3048, _3082);
    float _3104 = -_2528;
    float _3106 = _3068 * _3104;
    uint _3108 = uint(int(uint(_3076) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c9)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    float _3124 = -_3062;
    float _3126 = fma(_3068, _3084, _3124);
    float _3128 = fma(_3100, _2554, _3092);
    float _3130 = fma(_3088, _2554, _3106);
    float _3132 = fma(_3098, _2554, _3078);
    float _3134 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3136 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3138 = -_3068;
    float _3140 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3094);
    float _3142 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3144 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3134);
    float _3146 = -_3068;
    float _3148 = fma(_3146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3136);
    int _3150 = _3076 + 8;
    uint _3152 = uint(int(uint(_3150) >> uint(2)));
    uint _3154 = uint(int(uint(int(_3152)) >> uint(2)));
    int _3156 = int(_3152) & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = int(_3152) + 1;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    int _3164 = _3160 & 3;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[int(_3162)][_3164];
    float _3168 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3170 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3172 = -_3068;
    float _3174 = fma(_3172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3142);
    float _3176 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3178 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3168);
    float _3180 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3170);
    float _3182 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3184 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3186 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3148);
    float _3188 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3140);
    float _3190 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3174);
    float _3192 = fma(_3090, _3080, _3130);
    float _3194 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3176);
    float _3196 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3182);
    float _3198 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3184);
    float _3200 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3202 = fma(_3126, _3080, _3128);
    float _3204 = fma(_3102, _3080, _3132);
    int _3206 = abs(_2518);
    float _3208 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3178);
    float _3210 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3144);
    float _3212 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3180);
    float _3214 = _249 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3216 = ~_2382;
    int _3218 = _3216 + _2470;
    int _3220 = _3218 + 1;
    float _3222 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3196);
    int _3224 = ~_1796;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    float _3230 = _3214 * _3186;
    float _3232 = _3214 * _3188;
    int _3234 = ~_3206;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    out.m_94.x = _3208;
    out.m_94.y = _3210;
    out.m_94.z = _3212;
    float _3240 = fma(_3200, _3210, _3230);
    float _3242 = fma(_3200, _3208, _3232);
    float _3244 = _3214 * _3190;
    int _3246 = _1752 * _3220;
    int _3248 = _3246 + _2182;
    float _3250 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3252 = _3228 * as_type<int>(_3122);
    float _3254 = fma(_3200, _3212, _3244);
    float _3256 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3258 = int(_3256);
    bool _3260 = !_2062;
    float _3262 = _3260 ? as_type<float>(_3248) : as_type<float>(0xffffffffu /* nan */);
    int _3264 = _3238 * as_type<int>(_3114);
    int _3266 = _3264 + _3252;
    int _3268 = abs(_2526);
    float _3270 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3272 = abs(_1744);
    float _3274 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3250);
    float _3276 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3198);
    float _3278 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3270);
    int _3280 = ~_3272;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    float _3286 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3274);
    int _3288 = ~_3268;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3278);
    float _3296 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3298 = _3284 * as_type<int>(_3158);
    int _3300 = _3298 + _3266;
    float _3302 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3304 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3306 = abs(_3258);
    int _3308 = _3292 * as_type<int>(_3166);
    int _3310 = _3308 + _3300;
    int _3312 = as_type<int>(_3262) >> 31;
    float _3314 = _2800 + _3304;
    bool _3316 = !_2540;
    int _3318 = _3316 ? 0 : 1;
    float _3320 = _2812 + _3302;
    int _3322 = _3312 & 3;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3326 = _3314 + _3324;
    bool _3328 = uint(_1606) >= 2u;
    float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3332 = _3320 + _3330;
    int _3334 = as_type<int>(_3262) + _3322;
    float _3336 = _3326 * _3326;
    int _3338 = _3328 ? 0 : 1;
    float _3340 = _3332 * _3332;
    int _3342 = _3334 >> 2;
    float _3344 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3194);
    bool _3346 = _1606 != 3;
    float _3348 = _3336 + _3340;
    int _3350 = _3342 << 4;
    int _3352 = _3350 + 800;
    float _3354 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3296);
    int _3356 = abs(_3318);
    float _3358 = sqrt(_3348);
    float _3360 = float(uint(_3306));
    uint _3362 = uint(int(uint(_3352) >> uint(2)));
    uint _3364 = uint(int(uint(int(_3362)) >> uint(2)));
    int _3366 = int(_3362) & 3;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[int(_3364)][_3366];
    int _3370 = int(_3362) + 1;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    int _3374 = _3370 & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = _1592 >> 31;
    float _3380 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3354);
    float _3382 = float(uint(_3258));
    int _3384 = ~_3356;
    int _3386 = _3384 + 1;
    int _3388 = _3386 + 1;
    float _3390 = 1.0 / _3360;
    int _3392 = _3378 & 3;
    float _3394 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3396 = ~_3338;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    int _3402 = _3310 * _3388;
    int _3404 = _1592 + _3392;
    float _3406 = _2806 + _3394;
    int _3408 = _3400;
    float _3410 = _3262;
    float _3412 = _3314;
    float _3414 = _3320;
    float _3416 = _2800;
    if (_3346)
    {
        int _3418 = ~_3338;
        int _3420 = _3418 + 1;
        _3408 = _3420;
    }
    int _3422 = _3408;
    float _3424 = 1.0 / _3382;
    int _3426 = _3404 >> 2;
    int _3428 = _3056 * _3356;
    int _3430 = _3428 + _3402;
    bool _3432 = _3358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3434 = _3426 << 4;
    int _3436 = _3434 + 368;
    int _3438 = abs(_3430);
    uint _3440 = uint(int(uint(_3436) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    float _3456 = float(uint(_3430));
    int _3458 = as_type<int>(_3390) + (-2);
    int _3460 = as_type<int>(_3262) & 3;
    bool _3462 = _3460 != 0;
    int _3464 = as_type<int>(_3424) + (-2);
    int _3466 = _3436 + 8;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    uint _3470 = uint(int(uint(int(_3468)) >> uint(2)));
    int _3472 = int(_3468) & 3;
    float _3474 = (*spvDescriptorSet0.vp_c9)._m0[int(_3470)][_3472];
    int _3476 = int(_3468) + 1;
    uint _3478 = uint(int(uint(_3476) >> uint(2)));
    int _3480 = _3476 & 3;
    float _3482 = (*spvDescriptorSet0.vp_c9)._m0[int(_3478)][_3480];
    int _3484 = _3462 ? 0 : 1;
    int _3486 = as_type<int>(_3262) & 3;
    bool _3488 = _3486 != 0;
    float _3490 = as_type<float>(_3464) * _3456;
    bool _3492 = !_2512;
    int _3494 = _3492 ? 0 : 1;
    float _3496 = _3390;
    if (!_3432)
    {
        _3496 = _3336;
    }
    float _3498 = _3496;
    float _3500 = float(uint(_3438));
    float _3502 = trunc(_3490);
    float _3504 = precise::max(_3502, 0.0);
    uint _3506 = uint(_3504);
    bool _3508 = _1606 != 3;
    int _3510 = ~_3258;
    int _3512 = _3510 + 1;
    float _3514 = as_type<float>(_3458) * _3500;
    int _3516 = ~_3306;
    int _3518 = _3516 + 1;
    float _3520 = _3500;
    float _3522 = _3498;
    if (!_3432)
    {
        _3410 = _3340;
    }
    float _3524 = _3410;
    float _3526 = _3524;
    if (!_3432)
    {
        _3520 = _3406;
    }
    float _3528 = _3520;
    float _3530 = trunc(_3514);
    float _3532 = precise::max(_3530, 0.0);
    uint _3534 = uint(_3532);
    int _3536 = ~_3484;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    bool _3542 = uint(_3486) > 1u;
    bool _3544 = !_3432;
    float _3546 = _3528;
    int _3548 = _3540;
    if (!_3544)
    {
        float _3550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3554 = _3358 + _3552;
        float _3556 = rsqrt(_3348);
        float _3558 = _3554 * _3550;
        float _3560 = _3406 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3562 = _3558 * 0.15915493667125701904296875;
        float _3564 = _3562 * 6.283185482025146484375;
        float _3566 = sin(_3564);
        float _3568 = _3562 * 6.283185482025146484375;
        float _3570 = cos(_3568);
        float _3572 = fma(_3566, _3560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3574 = _3556 * _3572;
        float _3576 = fma(_3326, _3574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3578 = _3570 + (-1.0);
        float _3580 = fma(_3332, _3574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3584 = _3576 + _3582;
        float _3586 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3590 = _3580 + _3588;
        float _3592 = _3584 * _3584;
        float _3594 = fma(_3406, _3570, _3586);
        float _3596 = _3590 * _3590;
        _3546 = _3594;
        _3522 = _3592;
        _3526 = _3596;
        _3412 = _3576;
        _3414 = _3580;
    }
    float _3598 = _3546;
    float _3600 = _3522;
    float _3602 = _3526;
    float _3604 = _3412;
    float _3606 = _3414;
    if (!_3542)
    {
        int _3608 = ~_3484;
        int _3610 = _3608 + 1;
        _3548 = _3610;
    }
    int _3612 = _3548;
    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3616 = _3598 + _3614;
    int _3618 = _3352 + 8;
    uint _3620 = uint(int(uint(_3618) >> uint(2)));
    uint _3622 = uint(int(uint(int(_3620)) >> uint(2)));
    int _3624 = int(_3620) & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = int(_3620) + 1;
    uint _3630 = uint(int(uint(_3628) >> uint(2)));
    int _3632 = _3628 & 3;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[int(_3630)][_3632];
    float _3636 = -_2460;
    float _3638 = _3636 + 1.0;
    float _3640 = fma(_3616, _3616, _3600);
    bool _3642 = !_3488;
    int _3644 = _3642 ? 0 : 1;
    int _3646 = _3512 * int(_3506);
    int _3648 = _3646 + _3430;
    int _3650 = abs(_1652);
    int _3652 = _3518 * int(_3534);
    int _3654 = _3652 + _3438;
    int _3656 = abs(_3494);
    float _3658 = float(uint(_3648));
    float _3660 = float(uint(_3654));
    int _3662 = abs(_3644);
    float _3664 = as_type<float>(_3464) * _3658;
    bool _3666 = _3486 != 3;
    float _3668 = as_type<float>(_3458) * _3660;
    int _3670 = ~_3650;
    int _3672 = _3670 + 1;
    int _3674 = _3672 + 1;
    int _3676 = abs(_3612);
    float _3678 = trunc(_3668);
    float _3680 = precise::max(_3678, 0.0);
    uint _3682 = uint(_3680);
    int _3684 = _3674 * as_type<int>(_3454);
    int _3686 = abs(_3422);
    bool _3688 = uint(_3486) >= 2u;
    int _3690 = ~_3676;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    float _3696 = trunc(_3664);
    float _3698 = precise::max(_3696, 0.0);
    uint _3700 = uint(_3698);
    int _3702 = ~_3656;
    int _3704 = _3702 + 1;
    int _3706 = _3704 + 1;
    int _3708 = _3694 * as_type<int>(_3376);
    int _3710 = _3688 ? 0 : 1;
    int _3712 = _3706 * as_type<int>(_3446);
    int _3714 = _3712 + _3684;
    int _3716 = ~_3662;
    int _3718 = _3716 + 1;
    int _3720 = _3718 + 1;
    float _3722 = _3640 + _3602;
    int _3724 = ~_3686;
    int _3726 = _3724 + 1;
    int _3728 = _3726 + 1;
    int _3730 = ~_3710;
    int _3732 = _3730 + 1;
    int _3734 = _3732 + 1;
    int _3736 = _3720 * as_type<int>(_3368);
    int _3738 = _3736 + _3708;
    bool _3740 = _3486 != 3;
    int _3742 = _3728 * as_type<int>(_3474);
    int _3744 = _3742 + _3714;
    int _3746 = _3734;
    if (_3666)
    {
        int _3748 = ~_3710;
        int _3750 = _3748 + 1;
        _3746 = _3750;
    }
    int _3752 = _3746;
    float _3754 = sqrt(_3722);
    int _3756 = int(_3534) + int(_3682);
    int _3758 = abs(_3752);
    int _3760 = ~_3306;
    int _3762 = _3760 + 1;
    bool _3764 = !_3508;
    int _3766 = _3764 ? 0 : (-1);
    bool _3768 = !_3740;
    int _3770 = _3768 ? 0 : (-1);
    int _3772 = _3762 * _3756;
    int _3774 = _3772 + _3438;
    int _3776 = abs(_3766);
    int _3778 = ~_3758;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    int _3784 = abs(_3770);
    int _3786 = ~_3258;
    int _3788 = _3786 + 1;
    int _3790 = _3782 * as_type<int>(_3626);
    int _3792 = _3790 + _3738;
    int _3794 = int(_3506) + int(_3700);
    float _3796 = fma(_3214, _3214, 1.0);
    int _3798 = ~_3776;
    int _3800 = _3798 + 1;
    int _3802 = _3800 + 1;
    int _3804 = ~_3784;
    int _3806 = _3804 + 1;
    int _3808 = _3806 + 1;
    int _3810 = _3788 * _3794;
    int _3812 = _3810 + _3430;
    bool _3814 = uint(_3774) >= uint(_3306);
    int _3816 = _3802 * as_type<int>(_3482);
    int _3818 = _3816 + _3744;
    float _3820 = rsqrt(_3796);
    int _3822 = _3808 * as_type<int>(_3634);
    int _3824 = _3822 + _3792;
    bool _3826 = !_3814;
    int _3828 = _3826 ? 0 : (-1);
    int _3830 = _3430 ^ _3258;
    bool _3832 = uint(_3812) >= uint(_3258);
    int _3834 = ~_3828;
    int _3836 = _3756 + _3834;
    int _3838 = _3836 + 1;
    float _3840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3842 = uint(int(uint(_3830) >> uint(31)));
    bool _3844 = !_3832;
    int _3846 = _3844 ? 0 : (-1);
    bool _3848 = !_2534;
    int _3850 = _3848 ? 0 : 1;
    int _3852 = ~int(_3842);
    int _3854 = _3852 + 1;
    float _3856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3858 = ~_3794;
    int _3860 = _3858 + _3846;
    int _3862 = _3860 + 1;
    bool _3864 = !_2548;
    int _3866 = _3864 ? 0 : 1;
    int _3868 = abs(_3850);
    int _3870 = _3258 * _3862;
    int _3872 = _3870 + _3430;
    int _3874 = _3838 ^ _3854;
    int _3876 = abs(_3866);
    int _3878 = ~_3868;
    int _3880 = _3878 + 1;
    int _3882 = _3880 + 1;
    bool _3884 = _3258 == 0;
    bool _3886 = _3258 == 0;
    int _3888 = _3818 * _3882;
    int _3890 = ~_3854;
    int _3892 = _3890 + _3874;
    int _3894 = _3892 + 1;
    float _3896 = _3856 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3898 = ~_3876;
    int _3900 = _3898 + 1;
    int _3902 = _3900 + 1;
    bool _3904 = !_3884;
    int _3906 = _3904 ? _3872 : (-1);
    bool _3908 = !_3886;
    int _3910 = _3908 ? _3894 : (-1);
    int _3912 = _3824 * _3902;
    bool _3914 = _809 == 0;
    float _3916 = float(_3906);
    float _3918 = _3840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3920 = float(_3910);
    bool _3922 = !_3914;
    int _3924 = _3922 ? _3046 : (-1);
    float _3926 = fma(_3918, _3916, _2466);
    float _3928 = _1150 + 0.5;
    float _3930 = -_2432;
    float _3932 = fma(_3896, _3920, _3930);
    bool _3934 = !_2062;
    int _3936 = _3934 ? _3052 : (-1);
    float _3938 = _1142 + (-0.5);
    int _3940 = _3924 * _3868;
    int _3942 = _3940 + _3888;
    float _3944 = _3214 * _3820;
    float _3946 = fma(_3918, _3928, _3926);
    float _3948 = -_3896;
    float _3950 = fma(_3948, _3938, _3932);
    float _3952 = -_2456;
    float _3954 = _3952 + 1.0;
    int _3956 = _3936 * _3876;
    int _3958 = _3956 + _3912;
    float _3960 = -_3344;
    float _3962 = _3944 * _3960;
    float _3964 = -_3222;
    float _3966 = _3944 * _3964;
    float _3968 = -_3276;
    float _3970 = _3944 * _3968;
    float _3972 = fma(_1142, _3954, _3950);
    float _3974 = fma(_3820, _3188, _3962);
    float _3976 = fma(_3820, _3186, _3966);
    float _3978 = -_3638;
    float _3980 = fma(_1150, _3978, _3946);
    float _3982 = fma(_3820, _3190, _3970);
    float _3984 = _3344 + _3242;
    float _3986 = float(_3942);
    float _3988 = _3222 + _3240;
    float _3990 = float(_3958);
    float _3992 = _3276 + _3254;
    out.m_96.x = _3974;
    out.m_96.y = _3976;
    out.m_96.z = _3982;
    bool _3994 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3996 = isnan(_3754);
    bool _3998 = _3994 || _3996;
    bool _4000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4002 = _3998 || _4000;
    out.m_98.x = _3986;
    out.m_98.w = _3990;
    out.m_100.x = _3980;
    out.m_100.y = _3972;
    float _4004 = _3966;
    if (!_4002)
    {
        _4004 = 1.0;
    }
    float _4006 = _4004;
    out.m_102.x = _3984;
    out.m_102.y = _3988;
    out.m_102.z = _3992;
    bool _4008 = !_4002;
    float _4010 = _4006;
    if (!_4008)
    {
        bool _4012 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4014 = isnan(_3754);
        bool _4016 = _4012 || _4014;
        bool _4018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4020 = _4016 || _4018;
        if (!_4020)
        {
            float _4022 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4024 = _3754 + _4022;
            float _4026 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4028 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4026;
            float _4030 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4032 = _4030 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4034 = 1.0 / _4028;
            float _4036 = _4024 * _4034;
            float _4038 = fma(_4036, _4032, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4010 = _4038;
            _4040 = true;
        }
        else
        {
            bool _4042 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4044 = isnan(_3754);
            bool _4046 = _4042 || _4044;
            bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4050 = _4046 || _4048;
            if (!_4050)
            {
                float _4052 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4054 = _3754 + _4052;
                float _4056 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4058 = _4056 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4060 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4062 = _4060 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4064 = 1.0 / _4058;
                float _4066 = _4054 * _4064;
                float _4068 = fma(_4066, _4062, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4010 = _4068;
                _4040 = true;
            }
            else
            {
                _4010 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4040 = false;
    float _4070 = _4010;
    float _4072 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4074 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4076 = floor(_4072);
    float _4078 = floor(_4074);
    float _4080 = -_4076;
    float _4082 = _4072 + _4080;
    float _4084 = -_4078;
    float _4086 = _4074 + _4084;
    float2 _11548 = float2(_4082, _4086);
    float _4088 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11548, float2(0.0), isnan(_11548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11548, float2(0.0), isnan(_11548)), level(0.0)).x;
    float _4090 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4092 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4094 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4090);
    float _4096 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4098 = _3598 + _4096;
    float _4100 = _2806 + _4092;
    float _4102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4104 = _3604 + _4102;
    float _4106 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4094);
    float _4108 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4110 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4112 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4114 = _4106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4116 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4108);
    float _4118 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4110);
    float _4120 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4112);
    float _4122 = 1.0 / _4114;
    float _4124 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4116);
    float _4126 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4118);
    float _4128 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4120);
    float _4130 = fma(_4098, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4132 = _4124 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4134 = fma(_4104, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4136 = _4128 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4138 = -_2806;
    float _4140 = _4138 + _4130;
    float _4142 = _4132 + _4114;
    float _4144 = -_2800;
    float _4146 = _4144 + _4134;
    float _4148 = _4140 * _4140;
    bool _4150 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4152 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4154 = _4150 || _4152;
    bool _4156 = isnan(0.5);
    bool _4158 = _4154 || _4156;
    float _4160 = _4142 * _4122;
    float _4162 = _4160 * 0.5;
    float _4164 = fma(_4146, _4146, _4148);
    float _4166 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4168 = fma(_4162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4166);
    float _4170 = _4126 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4172 = trunc(_4136);
    int _4174 = int(_4172);
    float _4176 = 1.0 / _4168;
    float _4178 = trunc(_4170);
    int _4180 = int(_4178);
    int _4182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4184 = _4174 + _4182;
    int _4186 = _4184 + 1;
    float _4188 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4190 = _4176 * _4188;
    bool _4192 = _4190 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4194 = _4190 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4196 = !_4192;
    int _4198 = _4196 ? 0 : 1;
    int _4200 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4202 = _4180 + _4200;
    int _4204 = _4202 + 1;
    int _4206 = _4204 | _4186;
    int _4208 = 2;
    int _4210 = _4206;
    int _4212 = _4186;
    int _4214 = _4204;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4218 = _4134;
    if (!_4192)
    {
        _4208 = 1;
    }
    int _4220 = _4208;
    int _4222 = _4220;
    if (!_4194)
    {
        _4222 = _4198;
    }
    int _4224 = _4222;
    float _4226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4228 = _3606 + _4226;
    bool _4230 = _4204 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4232 = _4224 << 6;
    float _4234 = fma(_4228, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4236 = _4206 < 0;
    bool _4238 = _4236 || _4230;
    int _4240 = _4232 + 96;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    uint _4244 = uint(int(uint(int(_4242)) >> uint(2)));
    int _4246 = int(_4242) & 3;
    float _4248 = (*spvDescriptorSet0.vp_c15)._m0[int(_4244)][_4246];
    int _4250 = int(_4242) + 1;
    uint _4252 = uint(int(uint(_4250) >> uint(2)));
    int _4254 = _4250 & 3;
    float _4256 = (*spvDescriptorSet0.vp_c15)._m0[int(_4252)][_4254];
    float _4258 = -_2812;
    float _4260 = _4258 + _4234;
    bool _4262 = _4186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4264 = _4262 || _4238;
    float _4266 = fma(_4260, _4260, _4164);
    int _4268 = _4232 + 104;
    uint _4270 = uint(int(uint(_4268) >> uint(2)));
    uint _4272 = uint(int(uint(int(_4270)) >> uint(2)));
    int _4274 = int(_4270) & 3;
    float _4276 = (*spvDescriptorSet0.vp_c15)._m0[int(_4272)][_4274];
    int _4278 = int(_4270) + 1;
    uint _4280 = uint(int(uint(_4278) >> uint(2)));
    int _4282 = _4278 & 3;
    float _4284 = (*spvDescriptorSet0.vp_c15)._m0[int(_4280)][_4282];
    float _4286 = sqrt(_4266);
    float _4288 = as_type<float>(_4224);
    if (!_4264)
    {
        int _4290 = _4186 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4292 = _4290 + _4204;
        _4210 = _4292;
    }
    int _4294 = _4210;
    int _4296 = _4232 + 48;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    uint _4300 = uint(int(uint(int(_4298)) >> uint(2)));
    int _4302 = int(_4298) & 3;
    float _4304 = (*spvDescriptorSet0.vp_c15)._m0[int(_4300)][_4302];
    int _4306 = int(_4298) + 1;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    int _4310 = _4306 & 3;
    float _4312 = (*spvDescriptorSet0.vp_c15)._m0[int(_4308)][_4310];
    if (!_4264)
    {
        int _4314 = _4294 << 2;
        _4212 = _4314;
    }
    int _4316 = _4212;
    int _4318 = _4316;
    if (!_4264)
    {
        uint _4320 = uint(int(uint(_4294) >> uint(2)));
        _4214 = int(_4320);
    }
    int _4322 = _4214;
    if (!_4264)
    {
        int _4324 = 12 & _4316;
        _4318 = _4324;
    }
    int _4326 = _4318;
    int _4328 = _4232 + 64;
    uint _4330 = uint(int(uint(_4328) >> uint(2)));
    uint _4332 = uint(int(uint(int(_4330)) >> uint(2)));
    int _4334 = int(_4330) & 3;
    float _4336 = (*spvDescriptorSet0.vp_c15)._m0[int(_4332)][_4334];
    int _4338 = int(_4330) + 1;
    uint _4340 = uint(int(uint(_4338) >> uint(2)));
    int _4342 = _4338 & 3;
    float _4344 = (*spvDescriptorSet0.vp_c15)._m0[int(_4340)][_4342];
    bool _4346 = _4286 > 0.0;
    if (!_4264)
    {
        int _4348 = _4322 << 4;
        int _4350 = _4348 + _4326;
        _1276 = as_type<float>(_4350);
    }
    float _4352 = _1276;
    int _4354 = _4232 + 56;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    uint _4358 = uint(int(uint(int(_4356)) >> uint(2)));
    int _4360 = int(_4356) & 3;
    float _4362 = (*spvDescriptorSet0.vp_c15)._m0[int(_4358)][_4360];
    int _4364 = int(_4356) + 1;
    uint _4366 = uint(int(uint(_4364) >> uint(2)));
    int _4368 = _4364 & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    if (!_4346)
    {
        _4216 = _4130;
    }
    float _4372 = _4216;
    int _4374 = _4232 + 72;
    uint _4376 = uint(int(uint(_4374) >> uint(2)));
    uint _4378 = uint(int(uint(int(_4376)) >> uint(2)));
    int _4380 = int(_4376) & 3;
    float _4382 = (*spvDescriptorSet0.vp_c15)._m0[int(_4378)][_4380];
    int _4384 = int(_4376) + 1;
    uint _4386 = uint(int(uint(_4384) >> uint(2)));
    int _4388 = _4384 & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    float _4392 = _4100 * _4256;
    int _4394 = _4232 + 80;
    uint _4396 = uint(int(uint(_4394) >> uint(2)));
    uint _4398 = uint(int(uint(int(_4396)) >> uint(2)));
    int _4400 = int(_4396) & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    int _4404 = int(_4396) + 1;
    uint _4406 = uint(int(uint(_4404) >> uint(2)));
    int _4408 = _4404 & 3;
    float _4410 = (*spvDescriptorSet0.vp_c15)._m0[int(_4406)][_4408];
    float _4412 = fma(_2800, _4248, _4392);
    float _4414 = fma(_2812, _4276, _4412);
    int _4416 = _4232 + 88;
    uint _4418 = uint(int(uint(_4416) >> uint(2)));
    uint _4420 = uint(int(uint(int(_4418)) >> uint(2)));
    int _4422 = int(_4418) & 3;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[int(_4420)][_4422];
    int _4426 = int(_4418) + 1;
    uint _4428 = uint(int(uint(_4426) >> uint(2)));
    int _4430 = _4426 & 3;
    float _4432 = (*spvDescriptorSet0.vp_c15)._m0[int(_4428)][_4430];
    float _4434 = _4412;
    float _4436 = _4372;
    if (!_4264)
    {
        float _4438 = floor(_4170);
        _4434 = _4438;
    }
    float _4440 = _4434;
    float _4442 = _4414 + _4284;
    float _4444 = _4100 * _4312;
    float _4446 = _4352;
    float _4448 = _4444;
    float _4450 = _4336;
    float _4452 = _4312;
    if (!_4264)
    {
        int _4454 = as_type<int>(_4352) + 400;
        uint _4456 = uint(int(uint(_4454) >> uint(2)));
        uint _4458 = uint(int(uint(int(_4456)) >> uint(2)));
        int _4460 = int(_4456) & 3;
        float _4462 = (*spvDescriptorSet0.vp_c15)._m0[int(_4458)][_4460];
        _4446 = _4462;
    }
    float _4464 = _4446;
    float _4466 = 1.0 / _4442;
    float _4468 = fma(_2800, _4304, _4444);
    if (!_4346)
    {
        _4448 = _4234;
    }
    float _4470 = _4448;
    float _4472 = _4100 * _4344;
    float _4474 = fma(_2800, _4336, _4472);
    float _4476 = _4470;
    if (!_4346)
    {
        _4450 = _4134;
    }
    float _4478 = _4450;
    bool _4480 = !_4346;
    float _4482 = _4478;
    float _4484 = _4478;
    float _4486 = _4466;
    if (!_4480)
    {
        float _4488 = _239 * _239;
        float _4490 = fma(_235, _235, _4488);
        float _4492 = fma(_241, _241, _4490);
        float _4494 = rsqrt(_4266);
        float _4496 = sqrt(_4492);
        float _4498 = _4146 * _4494;
        float _4500 = _4140 * _4494;
        float _4502 = _4260 * _4494;
        bool _4504 = _4496 > 0.0;
        float _4506 = _4494;
        float _4508 = _4496;
        _4452 = _4498;
        if (!_4504)
        {
            _4482 = _4134;
        }
        float _4510 = _4482;
        _4484 = _4510;
        if (!_4504)
        {
            _4506 = _4130;
        }
        float _4512 = _4506;
        _4436 = _4512;
        if (!_4504)
        {
            _4508 = _4234;
        }
        float _4514 = _4508;
        bool _4516 = !_4504;
        _4476 = _4514;
        if (!_4516)
        {
            float _4518 = rsqrt(_4492);
            float _4520 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4522 = _239 * _4518;
            float _4524 = _235 * _4518;
            float _4526 = _4500 * _4522;
            float _4528 = _241 * _4518;
            float _4530 = fma(_4498, _4524, _4526);
            float _4532 = _4520 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4534 = fma(_4502, _4528, _4530);
            float _4536 = _4534 * _4532;
            float _4538 = fma(_235, _4536, _4134);
            float _4540 = fma(_239, _4536, _4130);
            float _4542 = fma(_241, _4536, _4234);
            _4484 = _4538;
            _4436 = _4540;
            _4476 = _4542;
        }
    }
    float _4544 = _4484;
    float _4546 = _4436;
    float _4548 = _4476;
    float _4550 = _4452;
    float _4552 = fma(_2812, _4362, _4468);
    float _4554 = fma(_2812, _4382, _4474);
    float _4556 = _4550;
    if (_4158)
    {
        _253 = _4544;
    }
    float _4558 = _253;
    float _4560 = _4558;
    if (_4158)
    {
        _255 = _4546;
    }
    float _4562 = _255;
    float _4564 = _4562;
    if (_4158)
    {
        _257 = _4548;
    }
    float _4566 = _257;
    float _4568 = _4566;
    if (!_4158)
    {
        float _4570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4572 = _2806 + _4570;
        float _4574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4576 = _2800 + _4574;
        float _4578 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4580 = -_2806;
        float _4582 = _4580 + _4546;
        float _4584 = _4572 * _4572;
        float _4586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4588 = _2812 + _4586;
        float _4590 = -_2800;
        float _4592 = _4590 + _4544;
        float _4594 = fma(_4576, _4576, _4584);
        float _4596 = fma(_4588, _4588, _4594);
        float _4598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4600 = _4578 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4602 = -_2812;
        float _4604 = _4602 + _4548;
        float _4606 = sqrt(_4596);
        float _4608 = precise::min(_4606, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4610 = _4608 * _4598;
        float _4612 = _4600 * _4610;
        float _4614 = fma(_4582, _4612, _2806);
        float _4616 = fma(_4592, _4612, _2800);
        float _4618 = fma(_4604, _4612, _2812);
        _4564 = _4614;
        _4560 = _4616;
        _4568 = _4618;
    }
    float _4620 = _4564;
    float _4622 = _4560;
    float _4624 = _4568;
    float _4626 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4628 = _4552 + _4370;
    float _4630 = _4554 + _4390;
    float _4632 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4634 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4636 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4626);
    float _4638 = _4628 * _4466;
    float _4640 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4642 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4632);
    float _4644 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4634);
    float _4646 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4636);
    float _4648 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4640);
    bool _4650 = _4638 >= 0.0;
    float _4652 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4642);
    float _4654 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4644);
    float _4656 = _4646 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4658 = _4630 * _4466;
    float _4660 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4648);
    bool _4662 = _4638 <= 1.0;
    bool _4664 = _4662 && _4650;
    float _4666 = _4654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4668 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4670 = _4660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _4672 = _4658 >= 0.0;
    bool _4674 = _4672 && _4664;
    float _4676 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4678 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4668);
    float _4680 = _4670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _4682 = _4658 <= 1.0;
    bool _4684 = _4682 && _4674;
    float _4686 = _4652 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4688 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4678);
    float _4690 = -_4680;
    float _4692 = fma(_4690, _4676, 1.0);
    float _4694 = _4100 * _4410;
    float _4696 = _4628;
    if (!_4264)
    {
        float _4698 = rint(_4464);
        float _4700 = precise::max(_4698, 0.0);
        uint _4702 = uint(_4700);
        uint _4704 = clamp(_4702, 0u, 65535u);
        _4696 = as_type<float>(_4704);
    }
    float _4706 = _4696;
    float _4708 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4688);
    float _4710 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4712 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4714 = fma(_2800, _4402, _4694);
    float _4716 = _4708;
    if (!_4264)
    {
        float _4718 = -_4440;
        float _4720 = _4170 + _4718;
        _4556 = _4720;
    }
    float _4722 = _4556;
    float _4724 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4710);
    float _4726 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4712);
    float _4728 = _4474;
    if (!_4264)
    {
        float _4730 = floor(_4136);
        _4728 = _4730;
    }
    float _4732 = _4728;
    if (_4684)
    {
        float _4734 = float(_4224);
        _4288 = _4734;
    }
    float _4736 = _4288;
    float _4738 = fma(_2812, _4424, _4714);
    float _4740 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4724);
    float _4742 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4726);
    float _4744 = _4738 + _4432;
    float _4746 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4740);
    float _4748 = log2(_4692);
    float _4750 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4742);
    float _4752 = _4744 * _4466;
    float _4754 = 1.0 / _4708;
    float _4756 = _4732;
    float _4758 = _4746;
    if (!_4264)
    {
        float _4760 = -_4732;
        float _4762 = _4136 + _4760;
        _4756 = _4762;
    }
    float _4764 = _4756;
    float _4766 = _4714;
    if (_4684)
    {
        float _4768 = rint(_4736);
        float _4770 = precise::max(_4768, 0.0);
        uint _4772 = uint(_4770);
        uint _4774 = clamp(_4772, 0u, 65535u);
        _4766 = as_type<float>(_4774);
    }
    float _4776 = _4766;
    float _4778 = _4748 * 0.693147182464599609375;
    float _4780 = _4764;
    if (!_4264)
    {
        float3 _12723 = float3(_4722, _4764, float(as_type<int>(_4706)));
        float3 _12727 = select(_12723, float3(0.0), isnan(_12723));
        float _4782 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12727.xy, uint(rint(_12727.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12727.xy, uint(rint(_12727.z)), level(0.0)).x;
        _4780 = _4782;
    }
    float _4784 = _4780;
    float _4786 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4788 = _4746 * _4754;
    float _4790 = _4750 * _4754;
    float _4792 = fma(_4788, 0.5, 0.5);
    float _4794 = fma(_4790, -0.5, 0.5);
    float _4796 = _4776;
    float _4798 = _4754;
    if (_4684)
    {
        float3 _12757 = float3(_4638, _4658, float(as_type<int>(_4776)));
        float3 _12759 = select(_12757, float3(0.0), isnan(_12757));
        float _4800 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12759.xy, uint(rint(_12759.z)), _4752, level(0.0));
        _4796 = _4800;
    }
    float _4802 = _4796;
    float3 _12769 = float3(_4792, _4794, _4786);
    float _4804 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12769, float3(0.0), isnan(_12769)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12769, float3(0.0), isnan(_12769)), level(0.0)).x;
    float3 _12778 = float3(_4792, _4794, _4786);
    float4 _4807 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12778, float3(0.0), isnan(_12778)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12778, float3(0.0), isnan(_12778)), level(0.0)).xyzw;
    float _4809 = _4807.x;
    float _4811 = _4807.y;
    float _4813 = _4807.z;
    float _4815 = _4807.w;
    if (_4264)
    {
        _4798 = 1.0;
    }
    float _4817 = _4798;
    bool _4819 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4823 = _4819 || _4821;
    bool _4825 = isnan(0.5);
    bool _4827 = _4823 || _4825;
    float _4829 = _4817;
    if (_4827)
    {
        _4486 = 1.0;
    }
    float _4831 = _4486;
    float _4833 = _4831;
    float _4835 = _4809;
    if (!_4827)
    {
        float _4837 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4839 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4841 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4839;
        float _4843 = _4837 * 0.15915493667125701904296875;
        float _4845 = _4843 * 6.283185482025146484375;
        float _4847 = cos(_4845);
        float _4849 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4851 = _4849 * 0.15915493667125701904296875;
        float _4853 = _4843 * 6.283185482025146484375;
        float _4855 = sin(_4853);
        float _4857 = 1.0 / _4847;
        float _4859 = _4851 * 6.283185482025146484375;
        float _4861 = cos(_4859);
        float _4863 = _4855 * _4857;
        float _4865 = _4851 * 6.283185482025146484375;
        float _4867 = sin(_4865);
        float _4869 = _4861 * _4863;
        float _4871 = 1.0 / _4841;
        float _4873 = 1.0 / _4869;
        float _4875 = _4867 * _4873;
        float _4877 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4879 = fma(_4190, _4875, _4877);
        float _4881 = _4879 * _4871;
        float _4883 = precise::clamp(_4881, 0.0, 1.0);
        _4833 = _4883;
    }
    float _4885 = _4833;
    if (!_4264)
    {
        int _4887 = _4294 << 4;
        int _4889 = _4887 + 2048;
        uint _4891 = uint(int(uint(_4889) >> uint(2)));
        uint _4893 = uint(int(uint(int(_4891)) >> uint(2)));
        int _4895 = int(_4891) & 3;
        float _4897 = (*spvDescriptorSet0.vp_c15)._m0[int(_4893)][_4895];
        int _4899 = int(_4891) + 1;
        uint _4901 = uint(int(uint(_4899) >> uint(2)));
        int _4903 = _4899 & 3;
        float _4905 = (*spvDescriptorSet0.vp_c15)._m0[int(_4901)][_4903];
        int _4907 = _4889 + 8;
        uint _4909 = uint(int(uint(_4907) >> uint(2)));
        uint _4911 = uint(int(uint(int(_4909)) >> uint(2)));
        int _4913 = int(_4909) & 3;
        float _4915 = (*spvDescriptorSet0.vp_c15)._m0[int(_4911)][_4913];
        int _4917 = int(_4909) + 1;
        uint _4919 = uint(int(uint(_4917) >> uint(2)));
        int _4921 = _4917 & 3;
        float _4923 = (*spvDescriptorSet0.vp_c15)._m0[int(_4919)][_4921];
        float _4925 = _4100 * _4905;
        float _4927 = fma(_2800, _4897, _4925);
        float _4929 = fma(_2812, _4915, _4927);
        float _4931 = _4929 + _4923;
        float _4933 = precise::clamp(_4931, 0.0, 1.0);
        float _4935 = -_4933;
        float _4937 = _4935 + _4784;
        float _4939 = fma(_4937, 500.0, 1.5);
        float _4941 = exp2(_4939);
        float _4943 = 0.0 + _4941;
        float _4945 = precise::clamp(_4943, 0.0, 1.0);
        _4829 = _4945;
    }
    float _4947 = _4829;
    float _4949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4951 = _4620 + _4949;
    float _4953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4955 = _4622 + _4953;
    float _4957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4959 = _4624 + _4957;
    float _4961 = _4951 * _4951;
    float _4963 = fma(_4955, _4955, _4961);
    float _4965 = fma(_4959, _4959, _4963);
    float _4967 = rsqrt(_4965);
    float _4969 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4971 = _4955 * _4969;
    float _4973 = _4959 * _4969;
    float _4975 = _4971 * _4971;
    float _4977 = _4973 * _4973;
    float _4979 = _4975 + _4977;
    float _4981 = sqrt(_4979);
    bool _4983 = _4981 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4987 = _4981 + _4985;
    float _4989 = _4959;
    float _4991 = _4967;
    float _4993 = _4987;
    float _4995 = _4951;
    if (_4983)
    {
        float _4997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4989 = _4997;
    }
    float _4999 = _4989;
    if (_4983)
    {
        float _5001 = rsqrt(_4979);
        _4991 = _5001;
    }
    float _5003 = _4991;
    float _5005 = _5003;
    if (_4983)
    {
        float _5007 = _4987 * _4999;
        _4993 = _5007;
    }
    float _5009 = _4993;
    if (_4983)
    {
        float _5011 = _5009 * 0.15915493667125701904296875;
        _3416 = _5011;
    }
    float _5013 = _3416;
    float _5015 = _4999;
    float _5017 = _5013;
    if (_4983)
    {
        float _5019 = _5013 * 6.283185482025146484375;
        float _5021 = sin(_5019);
        _5015 = _5021;
    }
    float _5023 = _5015;
    float _5025 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5027 = precise::max(0.0, _5025);
    float _5029 = _4961;
    float _5031 = _5027;
    if (_4983)
    {
        float _5033 = _5013 * 6.283185482025146484375;
        float _5035 = cos(_5033);
        _5029 = _5035;
    }
    float _5037 = _5029;
    float _5039 = -_4969;
    float _5041 = -_5027;
    float _5043 = fma(_4951, _5039, _5041);
    if (!_4983)
    {
        _4995 = _4973;
    }
    float _5045 = _4995;
    float _5047 = _5045;
    if (_4983)
    {
        float _5049 = _5043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5031 = _5049;
    }
    float _5051 = _5031;
    float _5053 = _5051;
    if (!_4983)
    {
        _5017 = _4975;
    }
    float _5055 = _5017;
    float _5057 = _5023;
    float _5059 = _5055;
    if (_4983)
    {
        float _5061 = fma(_5023, _5051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5057 = _5061;
    }
    float _5063 = _5057;
    float _5065 = _5063;
    float _5067 = _5037;
    if (_4983)
    {
        float _5069 = _5037 + (-1.0);
        _5053 = _5069;
    }
    float _5071 = _5053;
    float _5073 = _5071;
    if (_4983)
    {
        float _5075 = _5003 * _5063;
        _4218 = _5075;
    }
    float _5077 = _4218;
    if (!_4983)
    {
        _5005 = _4971;
    }
    float _5079 = _5005;
    float _5081 = _5079;
    if (_4983)
    {
        float _5083 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5073 = _5083;
    }
    float _5085 = _5073;
    if (_4983)
    {
        float _5087 = _4971 * _5077;
        _5081 = _5087;
    }
    float _5089 = _5081;
    if (!_4983)
    {
        _5065 = _5043;
    }
    float _5091 = _5065;
    float _5093 = _5091;
    if (_4983)
    {
        float _5095 = _4973 * _5077;
        _5047 = _5095;
    }
    float _5097 = _5047;
    if (_4983)
    {
        float _5099 = fma(_5043, _5037, _5085);
        _5093 = _5099;
    }
    float _5101 = _5093;
    if (_4983)
    {
        float _5103 = _5089 * _5089;
        _5059 = _5103;
    }
    float _5105 = _5059;
    if (!_4983)
    {
        _5067 = _4977;
    }
    float _5107 = _5067;
    float _5109 = _5107;
    if (_4983)
    {
        float _5111 = _5097 * _5097;
        _5109 = _5111;
    }
    float _5113 = _5109;
    float _5115 = sqrt(_4965);
    float _5117 = fma(_5101, _5101, _5105);
    float _5119 = _5117 + _5113;
    float _5121 = rsqrt(_5119);
    float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5125 = fma(_5115, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5123);
    float _5127 = precise::clamp(_5125, 0.0, 1.0);
    float _5129 = -_5127;
    float _5131 = _5129 + 1.0;
    float _5133 = abs(_5131);
    float _5135 = log2(_5133);
    float _5137 = _5121 * _5089;
    float _5139 = _5121 * _5101;
    float _5141 = _5121 * _5097;
    float _5143 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5145 = -_5143;
    float _5147 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5145);
    float _5149 = -_5141;
    float _5151 = fma(_5149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5147);
    float _5153 = _5135 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5155 = fma(_5151, -0.5, 0.5);
    float _5157 = fma(_5151, 0.5, 0.5);
    float _5159 = _5139 + 1.0;
    float _5161 = exp2(_5153);
    float _5163 = fma(_5157, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5165 = fma(_5157, _5163, -0.212114393711090087890625);
    float _5167 = sqrt(_5155);
    float _5169 = fma(_5157, _5165, 1.570728778839111328125);
    float _5171 = -_5139;
    float _5173 = fma(_5161, _5159, _5171);
    float _5175 = fma(_5173, 0.5, 0.5);
    float _5177 = _5167 * 0.636619746685028076171875;
    float _5179 = -_5169;
    float _5181 = fma(_5177, _5179, 1.0);
    float2 _13343 = float2(_5181, _5175);
    float3 _5185 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13343, float2(0.0), isnan(_13343)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13343, float2(0.0), isnan(_13343)), level(0.0)).xyz;
    float _5187 = _5185.x;
    float _5189 = _5185.y;
    float _5191 = _5185.z;
    float _5193 = abs(_4190);
    float _5195 = log2(_5193);
    float _5197 = _5135 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5199 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5201 = -_4088;
    float _5203 = _5201 + 1.0;
    float _5205 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5199);
    float _5207 = exp2(_5197);
    bool _5209 = _4190 <= 8000.0;
    bool _5211 = isnan(_4190);
    bool _5213 = _5209 || _5211;
    bool _5215 = isnan(8000.0);
    bool _5217 = _5213 || _5215;
    float _5219 = float(_5217);
    float _5221 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5205);
    bool _5223 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5225 = isnan(_5115);
    bool _5227 = _5223 || _5225;
    bool _5229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5231 = _5227 || _5229;
    float _5233 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5221);
    float _5235 = _5195 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5237 = _4708 * 0.5;
    float _5239 = _4746 + _4708;
    float _5241 = _5233 + _4708;
    out.gl_Position.x = _4746;
    out.gl_Position.y = _4750;
    out.gl_Position.z = _5233;
    out.gl_Position.w = _4708;
    float _5243 = fma(_4750, -0.5, _5237);
    float _5245 = exp2(_5235);
    float _5247 = _5241 * 0.5;
    float _5249 = _5239 * 0.5;
    out.m_104.x = _5249;
    out.m_104.y = _5243;
    out.m_104.z = _5247;
    out.m_104.w = _4708;
    float _5251 = -_5207;
    float _5253 = _5251 + 1.0;
    float _5255 = _5233;
    if (!_4684)
    {
        _4758 = 1.0;
    }
    float _5257 = _4758;
    float _5259 = _5257;
    if (_4684)
    {
        bool _5261 = _4802 >= _4752;
        bool _5263 = isnan(_4802);
        bool _5265 = _5261 || _5263;
        bool _5267 = isnan(_4752);
        bool _5269 = _5265 || _5267;
        float _5271 = float(_5269);
        _5259 = _5271;
    }
    float _5273 = _5259;
    float _5275 = fma(_5245, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5277 = precise::clamp(_5275, 0.0, 1.0);
    float _5279 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5281 = _5279;
    if (!_5231)
    {
        _4716 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5283 = _4716;
    float _5285 = fma(_5277, -2.0, 3.0);
    float _5287 = _5277 * _5277;
    float _5289 = _5279 * _4804;
    float _5291 = _5273 * _4947;
    float _5293 = _5283;
    float _5295 = _5283;
    if (!_5231)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5297 = _5255;
    float _5299 = _5287 * _5285;
    float _5301 = _4815 * _5289;
    float _5303 = -_5299;
    float _5305 = _5303 + 1.0;
    float _5307 = fma(_5305, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5299);
    float _5309 = _5219 * _5307;
    float _5311 = _5309 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5313 = _5203 * _5311;
    float _5315 = precise::clamp(_5313, 0.0, 1.0);
    float _5317 = -_5315;
    float _5319 = fma(_5317, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5321 = -_5291;
    float _5323 = fma(_5321, _5319, 1.0);
    float _5325 = precise::clamp(_5323, 0.0, 1.0);
    float _5327 = -_5279;
    float _5329 = _5327 + 1.0;
    float _5331 = _5329;
    float _5333 = _5325;
    float _5335 = _5297;
    float _5337 = _5297;
    if (!_5231)
    {
        _5281 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5339 = _5281;
    float _5341 = _5191 * _5289;
    float _5343 = fma(_5187, _5301, _4809);
    float _5345 = fma(_5189, _5301, _4811);
    float _5347 = _5325 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5349 = _4815 * _5329;
    float _5351 = fma(_4815, _5341, _4813);
    float _5353 = _4885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5355 = _5339;
    float _5357 = _5339;
    if (!_5231)
    {
        _4835 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5359 = _4835;
    out.m_106.x = _5347;
    float _5361 = _5359;
    float _5363 = _5359;
    if (!_5231)
    {
        _5331 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5365 = _5331;
    float _5367 = _5365;
    float _5369 = _5365;
    if (!_5231)
    {
        _5333 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5371 = _5333;
    out.m_108.x = _5343;
    out.m_108.y = _5345;
    out.m_108.z = _5351;
    out.m_108.w = _5349;
    bool _5373 = !_5231;
    float _5375 = _5371;
    float _5377 = _5371;
    if (!_5373)
    {
        bool _5379 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5381 = isnan(_5115);
        bool _5383 = _5379 || _5381;
        bool _5385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5387 = _5383 || _5385;
        if (!_5387)
        {
            float _5389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5391 = _5115 + _5389;
            float _5393 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5395 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5393;
            float _5397 = 1.0 / _5395;
            float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5401 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5403 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5405 = _5403 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5407 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5409 = _5407 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5411 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5413 = _5411 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5415 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5417 = _5415 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5419 = _5391 * _5397;
            float _5421 = precise::clamp(_5419, 0.0, 1.0);
            float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5425 = _5423 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5427 = fma(_5421, _5401, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5429 = fma(_5421, _5425, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5431 = fma(_5421, _5405, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5433 = fma(_5421, _5409, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5435 = fma(_5421, _5413, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5437 = fma(_5421, _5417, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5295 = _5429;
            _5369 = _5435;
            _5363 = _5427;
            _5357 = _5433;
            _5337 = _5431;
            _5377 = _5437;
            _5439 = true;
        }
        else
        {
            bool _5441 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5443 = isnan(_5115);
            bool _5445 = _5441 || _5443;
            bool _5447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5449 = _5445 || _5447;
            if (!_5449)
            {
                _5361 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5451 = _5361;
            _5363 = _5451;
            if (!_5449)
            {
                _5293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5453 = _5293;
            _5295 = _5453;
            if (!_5449)
            {
                _5335 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5455 = _5335;
            _5337 = _5455;
            if (!_5449)
            {
                _5355 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5457 = _5355;
            _5357 = _5457;
            if (!_5449)
            {
                _5367 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5459 = _5367;
            _5369 = _5459;
            if (!_5449)
            {
                _5375 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5461 = _5375;
            bool _5463 = !_5449;
            _5377 = _5461;
            if (!_5463)
            {
                bool _5465 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5467 = isnan(_5115);
                bool _5469 = _5465 || _5467;
                bool _5471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5473 = _5469 || _5471;
                if (!_5473)
                {
                    float _5475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5477 = _5115 + _5475;
                    float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5481 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5479;
                    float _5483 = 1.0 / _5481;
                    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5489 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5491 = _5489 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5493 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5495 = _5493 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5497 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5499 = _5497 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5501 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5503 = _5501 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5505 = _5477 * _5483;
                    float _5507 = precise::clamp(_5505, 0.0, 1.0);
                    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5511 = _5509 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5513 = fma(_5507, _5487, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5515 = fma(_5507, _5511, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5517 = fma(_5507, _5491, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5519 = fma(_5507, _5495, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5521 = fma(_5507, _5499, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5523 = fma(_5507, _5503, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5295 = _5515;
                    _5369 = _5521;
                    _5363 = _5513;
                    _5357 = _5519;
                    _5337 = _5517;
                    _5377 = _5523;
                    _5439 = true;
                }
                else
                {
                    _5295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5369 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5363 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5357 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5337 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5377 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5439 = false;
    float _5525 = _5295;
    float _5527 = _5369;
    float _5529 = _5363;
    float _5531 = _5357;
    float _5533 = _5337;
    float _5535 = _5377;
    float _5537 = fma(_3988, -0.5, 0.5);
    float _5539 = precise::clamp(_5537, 0.0, 1.0);
    float _5541 = -_5525;
    float _5543 = _5541 + _5527;
    float _5545 = _5353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5547 = -_5529;
    float _5549 = _5547 + _5531;
    float _5551 = fma(_5539, _5543, _5525);
    out.m_110.x = 0.0;
    float _5553 = -_5533;
    float _5555 = _5553 + _5535;
    float _5557 = fma(_5539, _5549, _5529);
    float _5559 = _5551 * 0.586610972881317138671875;
    out.m_65.x = _5545;
    bool _5561 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5563 = fma(_5539, _5555, _5533);
    float _5565 = fma(_5557, 0.298911988735198974609375, _5559);
    bool _5567 = _4885 > 0.0;
    bool _5569 = isnan(_4885);
    bool _5571 = _5567 || _5569;
    bool _5573 = isnan(0.0);
    bool _5575 = _5571 || _5573;
    float _5577 = fma(_5563, 0.114477999508380889892578125, _5565);
    float _5579 = -_5577;
    float _5581 = _5557 + _5579;
    float _5583 = -_5577;
    float _5585 = _5551 + _5583;
    float _5587 = -_5577;
    float _5589 = _5563 + _5587;
    float _5591 = fma(_5581, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    float _5593 = fma(_5585, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    float _5595 = fma(_5589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    bool _5597 = !_5561;
    if (!_5597)
    {
        float _5599 = -_4620;
        float _5601 = _5599 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5603 = -_4622;
        float _5605 = _5603 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5607 = -_4624;
        float _5609 = _5607 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5611 = _5601 * _5601;
        float _5613 = fma(_5605, _5605, _5611);
        float _5615 = fma(_5609, _5609, _5613);
        float _5617 = sqrt(_5615);
        float _5619 = rsqrt(_5615);
        float _5621 = -_5617;
        float _5623 = _5621 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5625 = _5623 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5627 = precise::clamp(_5625, 0.0, 1.0);
        float _5629 = _5605 * _5619;
        float _5631 = _5601 * _5619;
        float _5633 = abs(_5627);
        float _5635 = log2(_5633);
        float _5637 = _5609 * _5619;
        float _5639 = _5629 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5641 = _3988 * _5631;
        float _5643 = -_5631;
        float _5645 = -_5639;
        float _5647 = fma(_5643, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5645);
        float _5649 = fma(_3984, _5629, _5641);
        float _5651 = -_5637;
        float _5653 = fma(_5651, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5647);
        float _5655 = fma(_3992, _5637, _5649);
        float _5657 = precise::clamp(_5655, 0.0, 1.0);
        float _5659 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5661 = _5653 + _5659;
        float _5663 = _5635 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5665 = _5661 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        float _5669 = exp2(_5663);
        float _5671 = _5669 * _5667;
        float _5673 = _5657 * _5671;
        float _5675 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5677 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5679 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _5675;
        out.m_110.y = _5677;
        out.m_110.z = _5679;
    }
    out.m_112.x = _5591;
    out.m_112.y = _5593;
    out.m_112.z = _5595;
    if (_5575)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_65.x = 0.0;
    float _5681 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5681;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5439 = false;
    bool _4040 = false;
    bool _571 = false;
    bool _465 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_58.w;
    float _128 = in.m_60.w;
    float _130 = trunc(_126);
    int _133 = int(_130);
    float _135 = -_128;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _137;
    bool _141 = _133 >= 1;
    float _143 = 0.0;
    float _145 = _128;
    float _147 = _137;
    if (!_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _143;
    if (!_141)
    {
        out.m_65.x = 0.0;
    }
    int _151 = 0;
    if (!_141)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    int _157 = _155;
    if (!_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5749 = as_type<float>(_155);
        out.gl_Position.z = _5749;
    }
    if (!_141)
    {
        return out;
    }
    bool _159 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_128);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = float(_133);
    bool _171 = _137 >= _169;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    float _177 = 1.0 / _169;
    if (_175)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _179 = _145;
    if (_175)
    {
        out.m_65.x = 0.0;
    }
    float _181 = _137 * _177;
    float _183 = _181;
    if (_175)
    {
        float _185 = _179 * 5.0;
        _157 = as_type<int>(_185);
    }
    int _187 = _157;
    out.m_63.x = _181;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5812 = as_type<float>(_187);
        out.gl_Position.z = _5812;
    }
    if (_175)
    {
        return out;
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_70.x;
    float _193 = in.m_70.y;
    float _195 = in.m_70.z;
    float _197 = in.m_72.x;
    float _199 = in.m_72.y;
    float _201 = in.m_72.z;
    float _203 = in.m_74.x;
    float _205 = in.m_74.y;
    float _207 = in.m_74.z;
    float _209 = in.m_76.x;
    float _211 = in.m_76.y;
    float _213 = in.m_76.z;
    int _215 = as_type<int>(_189) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_189) & 2;
    bool _221 = _219 != 0;
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = _193 * _199;
    float _227 = _193 * _205;
    float _229 = fma(_191, _197, _225);
    float _231 = _193 * _211;
    float _233 = fma(_191, _203, _227);
    float _235 = fma(_195, _201, _229);
    float _237 = fma(_191, _209, _231);
    float _239 = fma(_195, _207, _233);
    float _241 = fma(_195, _213, _237);
    bool _243 = !_217;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_221;
    float _249 = _247 ? (-0.5) : 0.5;
    bool _251 = !_223;
    float _253 = _239;
    float _255 = _241;
    float _257 = _235;
    float _275;
    if (!_251)
    {
        float _259 = in.m_78.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        _275 = _181;
    }
    _277 = false;
    float _279 = _275;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _279 + _285;
    bool _289 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_279);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _279 + _313;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _307;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _311;
    float _325 = _315 * _319;
    bool _327 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_279);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _283 * _321;
    bool _341 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_279);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -_299;
    float _355 = _353 + 1.0;
    bool _357 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_279);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = _351 * _355;
    float _375 = _287 * _323;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _367 * _371;
    float _395 = -_367;
    float _397 = _395 + 1.0;
    float _399 = fma(_387, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = _337 * _397;
    float _405 = -_337;
    float _407 = _405 + 1.0;
    float _409 = fma(_391, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = _399 * _403;
    float _413 = _401 * _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _415;
    float _419 = fma(_383, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _421;
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _429 = fma(_417, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _431 = fma(_423, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _433 = fma(_409, _393, _425);
    float _435 = fma(_419, _393, _427);
    float _437 = fma(_429, _373, _433);
    float _439 = fma(_431, _373, _435);
    float _441 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _437);
    float _443 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _439);
    bool _445 = !_317;
    float _463;
    if (!_445)
    {
        float _447 = in.m_78.x;
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _447 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        _463 = _181;
    }
    _465 = false;
    float _467 = _463;
    float _469 = in.m_80.x;
    float _471 = in.m_80.y;
    bool _473 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = isnan(_467);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _507 = _467 + _505;
    float _509 = -_483;
    float _511 = _509 + 1.0;
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _515 = 1.0 / _487;
    float _517 = _499 * _511;
    float _519 = -_499;
    float _521 = _519 + 1.0;
    float _523 = _443 * _471;
    float _525 = _441 * _469;
    float _527 = _503 * _515;
    float _529 = fma(_527, _507, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = _529 * _517;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _541 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[116].x, _539);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_82.x = _541;
    out.m_82.y = _537;
    out.m_82.z = _549;
    out.m_82.w = _547;
    bool _551 = !_513;
    float _569;
    if (!_551)
    {
        float _553 = in.m_78.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        _569 = _181;
    }
    _571 = false;
    float _573 = _569;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _577 = _573 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _587;
    bool _591 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _593 = isnan(_573);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _581;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _613 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _615 = isnan(_573);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    bool _625 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_573);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _585;
    float _639 = -_623;
    float _641 = _639 + 1.0;
    bool _643 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _645 = _589 * _603;
    bool _647 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _649 = isnan(_573);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _607;
    float _661 = -_601;
    float _663 = _661 + 1.0;
    float _665 = fma(_645, _577, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _667 = _601 * _641;
    float _669 = -_657;
    float _671 = _669 + 1.0;
    float _673 = _657 * _663;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _679;
    float _683 = 1.0 / _611;
    float _685 = _635 * _671;
    float _687 = _677 * _637;
    float _689 = -_635;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _697 = _665 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _701 = _573 + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _705 = _573 + _703;
    float _707 = _681 * _659;
    bool _709 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _711 = isnan(_573);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_687, _701, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _723 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[131].x, _697);
    float _725 = fma(_707, _705, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _729 = _573 + _727;
    float _731 = -_719;
    float _733 = _731 + 1.0;
    float _735 = fma(_721, _673, _723);
    float _737 = _695 * _683;
    float _739 = _623 * _733;
    float _741 = fma(_725, _667, _735);
    float _743 = fma(_737, _729, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _747 = fma(_743, _739, _741);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _755 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[135].x, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_84.x = _751;
    out.m_84.y = _757;
    out.m_84.z = _759;
    out.m_84.w = _761;
    bool _763 = !_643;
    float _765 = _761;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _769 = _751;
    if (!_763)
    {
        float _771 = in.m_78.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _183 = _785;
    }
    float _787 = _183;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _791 = int(_789);
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _795 = int(_793);
    float _797 = float(_791);
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _801 = int(_799);
    float _803 = float(_795);
    float _805 = 1.0 / _797;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _809 = int(_807);
    float _811 = float(uint(_801));
    int _813 = ~_801;
    int _815 = _813 + 1;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _819 = _817 != 0;
    float _821 = 1.0 / _803;
    float _823 = _805 * _137;
    float _825 = 1.0 / _811;
    float _827 = float(uint(_809));
    if (_819)
    {
        _765 = 1.0;
    }
    float _829 = _765;
    int _831 = 0;
    float _833 = _829;
    if (_819)
    {
        _831 = 0;
    }
    int _835 = _831;
    float _837 = trunc(_823);
    int _839 = int(_837);
    float _841 = _821 * _137;
    float _843 = 1.0 / _827;
    int _845 = as_type<int>(_825) + (-2);
    float _847 = trunc(_841);
    int _849 = int(_847);
    float _851 = float(uint(_839));
    float _853 = as_type<float>(_845) * _851;
    int _855 = as_type<int>(_843) + (-2);
    float _857 = _851;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _861 = as_type<int>(_853);
    int _863 = _835;
    if (_819)
    {
        float _865 = in.m_78.x;
        float _867 = in.m_78.y;
        _857 = _865;
        _859 = _867;
    }
    float _869 = _857;
    float _871 = _859;
    float _873 = trunc(_853);
    float _875 = precise::max(_873, 0.0);
    uint _878 = uint(_875);
    int _880 = ~_809;
    int _882 = _880 + 1;
    float _884 = float(uint(_849));
    if (_819)
    {
        _861 = 0;
    }
    int _886 = _861;
    float _888 = as_type<float>(_855) * _884;
    float _890 = trunc(_888);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    int _896 = _815 * int(_878);
    int _898 = _896 + _839;
    float _900 = float(uint(_898));
    float _902 = _900;
    float _904 = _869;
    float _906 = _871;
    int _908 = _886;
    if (_819)
    {
        _767 = _869;
    }
    float _910 = _767;
    float _912 = as_type<float>(_845) * _900;
    float _914 = _910;
    if (_819)
    {
        _769 = _910;
    }
    float _916 = _769;
    float _918 = _916;
    if (_819)
    {
        _902 = _871;
    }
    float _920 = _902;
    float _922 = trunc(_912);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _882 * int(_894);
    int _930 = _928 + _849;
    float _932 = float(uint(_930));
    float _934 = as_type<float>(_855) * _932;
    float _936 = _932;
    float _938 = _934;
    float _940 = _920;
    if (_819)
    {
        _936 = 1.0;
    }
    float _942 = _936;
    float _944 = trunc(_934);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    float _950 = _942;
    if (_819)
    {
        _938 = _910;
    }
    float _952 = _938;
    float _954 = _952;
    if (!_819)
    {
        float _956 = in.m_78.x;
        float _958 = in.m_78.y;
        float _960 = in.m_78.z;
        float _962 = _956 * 3.1415927410125732421875;
        float _964 = _962 * 0.15915493667125701904296875;
        float _966 = _958 * 3.1415927410125732421875;
        float _968 = _966 * 0.15915493667125701904296875;
        float _970 = _964 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        _833 = 7.345489978790283203125;
        _904 = _956;
        _950 = 5.839270114898681640625;
        _954 = _960;
        _906 = _958;
        _914 = _958;
        _863 = 1;
        _908 = 2;
        _918 = _972;
        _940 = _976;
    }
    float _978 = _833;
    float _980 = _904;
    float _982 = _950;
    float _984 = _954;
    float _986 = _906;
    float _988 = _914;
    int _990 = _863;
    int _992 = _908;
    float _994 = _918;
    float _996 = _940;
    float _998 = _978 * _980;
    float _1000 = _982 * _984;
    int _1002 = int(_894) + int(_948);
    float _1004 = in.m_78.z;
    float _1006 = in.m_78.w;
    float _1008 = floor(_998);
    int _1010 = ~_809;
    int _1012 = _1010 + 1;
    float _1014 = _986 * 2.0;
    int _1016 = int(_878) + int(_926);
    float _1018 = _978 * _988;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1022 = _787 + _1020;
    int _1024 = ~_801;
    int _1026 = _1024 + 1;
    float _1028 = floor(_1000);
    float _1030 = float(_809);
    int _1032 = _1012 * _1002;
    int _1034 = _1032 + _849;
    int _1036 = _1026 * _1016;
    int _1038 = _1036 + _839;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1042 = _787 + _1040;
    bool _1044 = uint(_1034) >= uint(_809);
    float _1046 = -_1008;
    float _1048 = _998 + _1046;
    bool _1050 = uint(_1038) >= uint(_801);
    float _1052 = floor(_1014);
    bool _1054 = !_1044;
    int _1056 = _1054 ? 0 : (-1);
    float _1058 = _1048 * _1030;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1062 = _1060 != 0;
    int _1064 = ~_1002;
    int _1066 = _1064 + _1056;
    int _1068 = _1066 + 1;
    float _1070 = -_1028;
    float _1072 = _1000 + _1070;
    bool _1074 = !_1050;
    int _1076 = _1074 ? 0 : (-1);
    float _1078 = trunc(_1058);
    int _1080 = int(_1078);
    bool _1082 = !_1062;
    int _1084 = _1082 ? 0 : 1;
    bool _1086 = _1004 > 0.5;
    float _1088 = float(_849);
    bool _1090 = _986 > 0.5;
    int _1092 = ~_1016;
    int _1094 = _1092 + _1076;
    int _1096 = _1094 + 1;
    bool _1098 = _1088 >= _1030;
    bool _1100 = isnan(_1088);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(_1030);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1120 = _1118 != 0;
    int _1122 = _801 * _1096;
    int _1124 = _1122 + _839;
    float _1126 = -_249;
    int _1128 = _1086 ? as_type<int>(_1126) : as_type<int>(_249);
    float _1130 = trunc(_1108);
    int _1132 = int(_1130);
    float _1134 = -_245;
    int _1136 = _1090 ? as_type<int>(_1134) : as_type<int>(_245);
    int _1138 = abs(_1084);
    bool _1140 = !_1120;
    float _1142 = _1140 ? _249 : as_type<float>(_1128);
    int _1144 = _809 * _1068;
    int _1146 = _1144 + _849;
    bool _1148 = !_1116;
    float _1150 = _1148 ? _245 : as_type<float>(_1136);
    int _1152 = _1080 * _1138;
    int _1154 = _1152 + _849;
    float _1156 = float(_801);
    float _1158 = _177 * _137;
    float _1160 = float(_839);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1172 = _1170 != 0;
    float _1174 = _1030 * _1158;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1178 = _1176 != 0;
    bool _1180 = _1160 >= _1156;
    bool _1182 = isnan(_1160);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(_1156);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = trunc(_1174);
    int _1198 = int(_1196);
    bool _1200 = !_1164;
    int _1202 = _1200 ? 0 : 1;
    bool _1204 = !_1172;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1178;
    float _1222 = _1220 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1224 = trunc(_1190);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1230 = _1228 != 0;
    bool _1232 = !_1210;
    int _1234 = _1232 ? 0 : 1;
    bool _1236 = _809 == 0;
    int _1238 = ~_1132;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    bool _1244 = !_1236;
    int _1246 = _1244 ? _1146 : (-1);
    float _1248 = _1072 * _1156;
    int _1250 = _809 + (-1);
    int _1252 = _1246 * _1242;
    bool _1254 = !_1214;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = _1156 * _1158;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1262 = _1260 != 0;
    int _1264 = _1132 * _1250;
    int _1266 = _1264 + _1252;
    int _1268 = abs(_1194);
    float _1270 = as_type<float>(_1132);
    float _1272 = _1222;
    float _1274 = as_type<float>(_992);
    float _1276 = _1150;
    if (_1230)
    {
        float _1278 = in.m_78.w;
        _1270 = _1278;
    }
    float _1280 = _1270;
    bool _1282 = !_1262;
    float _1284 = _1282 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1286 = trunc(_1248);
    int _1288 = int(_1286);
    int _1290 = abs(_1256);
    bool _1292 = _801 == 0;
    int _1294 = abs(_1202);
    float _1296 = trunc(_1258);
    int _1298 = int(_1296);
    int _1300 = ~_1226;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1292;
    int _1308 = _1306 ? _1124 : (-1);
    int _1310 = _1266 * _1268;
    int _1312 = _801 + (-1);
    int _1314 = _1308 * _1304;
    int _1316 = abs(_1206);
    int _1318 = _1198 * _1294;
    int _1320 = _1318 + _1310;
    int _1322 = abs(as_type<int>(_1284));
    int _1324 = _1226 * _1312;
    int _1326 = _1324 + _1314;
    int _1328 = abs(as_type<int>(_1222));
    float _1330 = _1284;
    if (_1230)
    {
        float _1332 = _1280 * 3.1415927410125732421875;
        _1272 = _1332;
    }
    float _1334 = _1272;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1338 = _1336 != 0;
    int _1340 = _1154 * _1316;
    int _1342 = _1340 + _1320;
    int _1344 = abs(_1234);
    int _1346 = _1288 * _1322;
    int _1348 = _1346 + _839;
    bool _1350 = !_1218;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = _1326 * _1290;
    bool _1356 = !_1338;
    int _1358 = _1356 ? 0 : 1;
    float _1360 = _1334;
    bool _1362 = _1338;
    if (_1230)
    {
        float _1364 = _1334 * 0.15915493667125701904296875;
        _1360 = _1364;
    }
    float _1366 = _1360;
    int _1368 = _1080 * _1328;
    int _1370 = _1368 + _1342;
    int _1372 = abs(_1352);
    float _1374 = _980 * 2.0;
    int _1376 = abs(_1358);
    int _1378 = _1298 * _1344;
    int _1380 = _1378 + _1354;
    float _1382 = _1366;
    if (_1230)
    {
        float _1384 = _1366 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        _1382 = _1386;
    }
    float _1388 = _1382;
    float _1390 = float(uint(_1370));
    float _1392 = 0.0;
    if (!_1230)
    {
        _1392 = _245;
    }
    float _1394 = _1392;
    int _1396 = _1348 * _1372;
    int _1398 = _1396 + _1380;
    int _1400 = ~_801;
    int _1402 = _1400 + 1;
    float _1404 = as_type<float>(_855) * _1390;
    bool _1406 = _809 == 0;
    int _1408 = _1288 * _1376;
    int _1410 = _1408 + _1398;
    float _1412 = -_245;
    int _1414 = _1086 ? as_type<int>(_1412) : as_type<int>(_245);
    float _1416 = floor(_1374);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1420 = _1418 != 0;
    float _1422 = float(uint(_1410));
    bool _1424 = !_1420;
    float _1426 = _1424 ? _245 : as_type<float>(_1414);
    float _1428 = _1394;
    if (_1230)
    {
        bool _1430 = _1388 > 0.5;
        _1362 = _1430;
    }
    bool _1432 = _1362;
    float _1434 = trunc(_1404);
    float _1436 = precise::max(_1434, 0.0);
    uint _1438 = uint(_1436);
    float _1440 = as_type<float>(_845) * _1422;
    int _1442 = ~_809;
    int _1444 = _1442 + 1;
    if (_1230)
    {
        float _1446 = -_245;
        float _1448 = _1432 ? _1446 : _245;
        _1428 = _1448;
    }
    float _1450 = _1428;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1454 = _1452 != 0;
    float _1456 = trunc(_1440);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = _1444 * int(_1438);
    int _1464 = _1462 + _1370;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1470 = as_type<float>(_1380);
    float _1472 = 1.4012984643248170709237295832899e-45;
    if (_1454)
    {
        float _1474 = in.m_78.x;
        _1470 = _1474;
    }
    float _1476 = _1470;
    float _1478 = 0.0;
    if (!_1454)
    {
        _1478 = _249;
    }
    float _1480 = _1478;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1484 = float(uint(_1464));
    int _1486 = _1402 * int(_1460);
    int _1488 = _1486 + _1410;
    float _1490 = as_type<float>(_855) * _1484;
    float _1492 = float(uint(_1488));
    float _1494 = trunc(_1490);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1504 = as_type<float>(_845) * _1492;
    int _1506 = ~_809;
    int _1508 = _1506 + 1;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1512 = trunc(_1504);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1522 = int(_1438) + int(_1498);
    float _1524 = as_type<float>(_1498);
    float _1526 = _1480;
    if (_1454)
    {
        float _1528 = _1476 * 3.1415927410125732421875;
        _1524 = _1528;
    }
    float _1530 = _1524;
    int _1532 = ~_801;
    int _1534 = _1532 + 1;
    float _1536 = 1.0 / _1520;
    int _1538 = _1508 * _1522;
    int _1540 = _1538 + _1370;
    float _1542 = _1530;
    if (_1454)
    {
        float _1544 = _1530 * 0.15915493667125701904296875;
        _1542 = _1544;
    }
    float _1546 = _1542;
    int _1548 = int(_1460) + int(_1516);
    bool _1550 = uint(_1540) >= uint(_809);
    float _1552 = _1546;
    if (_1454)
    {
        float _1554 = _1546 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1552 = _1556;
    }
    float _1558 = _1552;
    bool _1560 = !_1550;
    int _1562 = _1560 ? 0 : (-1);
    int _1564 = _1534 * _1548;
    int _1566 = _1564 + _1410;
    int _1568 = ~_1522;
    int _1570 = _1568 + _1562;
    int _1572 = _1570 + 1;
    bool _1574 = uint(_1566) >= uint(_801);
    int _1576 = _809 * _1572;
    int _1578 = _1576 + _1370;
    bool _1580 = !_1574;
    int _1582 = _1580 ? 0 : (-1);
    bool _1584 = _1574;
    if (_1454)
    {
        bool _1586 = _1558 > 0.5;
        _1584 = _1586;
    }
    bool _1588 = _1584;
    bool _1590 = !_1406;
    int _1592 = _1590 ? _1578 : (-1);
    if (_1454)
    {
        float _1594 = -_249;
        float _1596 = _1588 ? _1594 : _249;
        _1526 = _1596;
    }
    float _1598 = _1526;
    int _1600 = ~_1548;
    int _1602 = _1600 + _1582;
    int _1604 = _1602 + 1;
    int _1606 = _1592 & 3;
    bool _1608 = _1606 != 0;
    bool _1610 = _1006 > 0.5;
    int _1612 = _801 * _1604;
    int _1614 = _1612 + _1410;
    float _1616 = -_249;
    int _1618 = _1090 ? as_type<int>(_1616) : as_type<int>(_249);
    bool _1620 = uint(_1606) > 1u;
    float _1622 = -_249;
    int _1624 = _1610 ? as_type<int>(_1622) : as_type<int>(_249);
    int _1626 = _1592 & 3;
    bool _1628 = _1626 != 0;
    bool _1630 = !_1292;
    int _1632 = _1630 ? _1614 : (-1);
    int _1634 = _1628 ? 0 : 1;
    int _1636 = _1632 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = ~_1634;
    int _1642 = _1640 + 1;
    int _1644 = _1642 + 1;
    int _1646 = _1644;
    if (!_1620)
    {
        int _1648 = ~_1634;
        int _1650 = _1648 + 1;
        _1646 = _1650;
    }
    int _1652 = _1646;
    bool _1654 = uint(_1636) >= 2u;
    int _1656 = _1632 & 3;
    bool _1658 = _1656 != 0;
    int _1660 = _1654 ? 0 : 1;
    bool _1662 = _1636 != 3;
    int _1664 = ~_1660;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    int _1670 = _1658 ? 0 : 1;
    bool _1672 = uint(_1636) > 1u;
    int _1674 = ~_1670;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    int _1680 = int(_1662);
    int _1682 = _1672 ? 2 : 0;
    int _1684 = _1680 | _1682;
    int _1686 = _1638 ? 4 : 0;
    int _1688 = _1684 | _1686;
    int _1690 = _1112 ? 8 : 0;
    int _1692 = _1688 | _1690;
    int _1694 = _1608 ? 16 : 0;
    int _1696 = _1692 | _1694;
    int _1698 = _1292 ? 32 : 0;
    int _1700 = _1696 | _1698;
    int _1702 = _1406 ? 64 : 0;
    int _1704 = _1700 | _1702;
    int _1706 = _1704 & 4;
    int _1708 = int(_1662);
    int _1710 = _1672 ? 2 : 0;
    int _1712 = _1708 | _1710;
    int _1714 = _1638 ? 4 : 0;
    int _1716 = _1712 | _1714;
    int _1718 = _1112 ? 8 : 0;
    int _1720 = _1716 | _1718;
    int _1722 = _1608 ? 16 : 0;
    int _1724 = _1720 | _1722;
    int _1726 = _1292 ? 32 : 0;
    int _1728 = _1724 | _1726;
    int _1730 = _1406 ? 64 : 0;
    int _1732 = _1728 | _1730;
    int _1734 = _1732 & 16;
    int _1736 = _1668;
    int _1738 = _1678;
    if (_1662)
    {
        int _1740 = ~_1660;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    int _1746 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1748 = _1746 != 0;
    float _1750 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1752 = int(_1750);
    if (!_1672)
    {
        int _1754 = ~_1670;
        int _1756 = _1754 + 1;
        _1738 = _1756;
    }
    int _1758 = _1738;
    bool _1760 = !_1748;
    float _1762 = _1760 ? _249 : as_type<float>(_1618);
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1766 = _1764 != 0;
    bool _1768 = !_1112;
    float _1770 = _1768 ? _249 : as_type<float>(_1624);
    float _1772 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1774 = int(_1772);
    bool _1776 = !_1766;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1782 = _1780 != 0;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1794 = _1792 != 0;
    int _1796 = abs(_1758);
    float _1798 = float(uint(_1752));
    bool _1800 = !_1782;
    int _1802 = _1800 ? 0 : 1;
    bool _1804 = _980 > 0.5;
    float _1806 = 1.0 / _1798;
    int _1808 = ~_1752;
    int _1810 = _1808 + 1;
    float _1812 = float(_1774);
    float _1814 = -_245;
    int _1816 = _1804 ? as_type<int>(_1814) : as_type<int>(_245);
    int _1818 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1820 = _1818 != 0;
    float _1822 = 1.0 / _1812;
    int _1824 = ~_1752;
    int _1826 = _1824 + 1;
    bool _1828 = !_1820;
    float _1830 = _1828 ? _245 : as_type<float>(_1816);
    bool _1832 = _990 != 1;
    int _1834 = as_type<int>(_1806) + (-2);
    bool _1836 = !_1786;
    int _1838 = _1836 ? 0 : 1;
    bool _1840 = _1052 >= 0.0;
    bool _1842 = isnan(_1052);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    int _1850 = abs(_1838);
    bool _1852 = !_1790;
    int _1854 = _1852 ? 0 : 1;
    float _1856 = _1822 * _137;
    float _1858 = _1806;
    if (!_1832)
    {
        _1858 = _986;
    }
    float _1860 = _1858;
    float _1862 = _1860;
    if (!_1832)
    {
        _1330 = _986;
    }
    float _1864 = _1330;
    float _1866 = trunc(_1856);
    int _1868 = int(_1866);
    float _1870 = _1864;
    if (!_1832)
    {
        _1472 = _1004;
    }
    float _1872 = _1472;
    float _1874 = _1872;
    if (_1832)
    {
        _1862 = _980;
    }
    float _1876 = _1862;
    if (_1832)
    {
        _1870 = _980;
    }
    float _1878 = _1870;
    if (_1832)
    {
        _1874 = _986;
    }
    float _1880 = _1874;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1466);
    float _1884 = float(uint(_1868));
    float _1886 = as_type<float>(_1834) * _1884;
    float _1888 = _1884;
    float _1890 = _1886;
    if (!_1832)
    {
        _1888 = _1004;
    }
    float _1892 = _1888;
    float _1894 = _1892;
    if (_1832)
    {
        _1894 = _986;
    }
    float _1896 = _1894;
    float _1898 = trunc(_1886);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    bool _1904 = _992 != 2;
    if (_1904)
    {
        _1274 = _980;
    }
    float _1906 = _1274;
    int _1908 = _1810 * int(_1902);
    int _1910 = _1908 + _1868;
    float _1912 = _1906;
    if (_1904)
    {
        _1890 = _986;
    }
    float _1914 = _1890;
    float _1916 = _1914;
    if (!_1904)
    {
        _1912 = _1004;
    }
    float _1918 = _1912;
    float _1920 = float(uint(_1910));
    if (!_1904)
    {
        _1916 = _980;
    }
    float _1922 = _1916;
    float _1924 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1926 = _1416 >= 0.0;
    bool _1928 = isnan(_1416);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan(0.0);
    bool _1934 = _1930 || _1932;
    float _1936 = as_type<float>(_1834) * _1920;
    float _1938 = -_1468;
    float _1940 = fma(_1924, 2.0, _1938);
    int _1942 = _1934 ? 0 : 1;
    bool _1944 = _1416 > 0.0;
    float _1946 = trunc(_1936);
    float _1948 = precise::max(_1946, 0.0);
    uint _1950 = uint(_1948);
    int _1952 = ~_1942;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    float _1958 = floor(_1018);
    int _1960 = _1956;
    if (!_1944)
    {
        int _1962 = ~_1942;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    bool _1968 = _1052 > 0.0;
    int _1970 = int(_1902) + int(_1950);
    float _1972 = float(_1752);
    float _1974 = float(_1868);
    int _1976 = _1826 * _1970;
    int _1978 = _1976 + _1868;
    float _1980 = -_1958;
    float _1982 = _1018 + _1980;
    bool _1984 = _1974 >= _1972;
    bool _1986 = isnan(_1974);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(_1972);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    int _1996 = _1848 ? 0 : 1;
    bool _1998 = uint(_1978) >= uint(_1752);
    int _2000 = ~_1996;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = trunc(_1994);
    int _2008 = int(_2006);
    int _2010 = _2004;
    if (!_1968)
    {
        int _2012 = ~_1996;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    float _2018 = _1982 * _1972;
    bool _2020 = !_1998;
    int _2022 = _2020 ? 0 : (-1);
    float _2024 = _1972 * _1158;
    bool _2026 = !_1794;
    int _2028 = _2026 ? 0 : 1;
    float _2030 = _1004 * 2.0;
    int _2032 = ~_1970;
    int _2034 = _2032 + _2022;
    int _2036 = _2034 + 1;
    float _2038 = trunc(_2018);
    int _2040 = int(_2038);
    bool _2042 = _1706 != 0;
    int _2044 = abs(_1778);
    int _2046 = _1752 * _2036;
    int _2048 = _2046 + _1868;
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2052 = _2050 != 0;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2056 = _2054 != 0;
    int _2058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2060 = _2058 != 0;
    bool _2062 = _1752 == 0;
    float _2064 = floor(_2030);
    int _2066 = ~_2008;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    bool _2072 = !_2062;
    int _2074 = _2072 ? _2048 : (-1);
    float _2076 = float(uint(_1154));
    int _2078 = _1752 + (-1);
    int _2080 = _2074 * _2070;
    float _2082 = trunc(_2024);
    int _2084 = int(_2082);
    int _2086 = _2040 * _2044;
    int _2088 = _2086 + _1868;
    int _2090 = abs(_1802);
    int _2092 = _2008 * _2078;
    int _2094 = _2092 + _2080;
    float _2096 = float(uint(_1348));
    float _2098 = as_type<float>(_855) * _2076;
    bool _2100 = _2064 >= 0.0;
    bool _2102 = isnan(_2064);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan(0.0);
    bool _2108 = _2104 || _2106;
    float _2110 = as_type<float>(_845) * _2096;
    bool _2112 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2120 = _2116 || _2118;
    float _2122 = trunc(_2098);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    int _2128 = _2094 * _1850;
    int _2130 = abs(_1854);
    float _2132 = trunc(_2110);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    int _2138 = _2084 * _2090;
    int _2140 = _2138 + _2128;
    float _2142 = float(uint(_2088));
    int _2144 = ~_809;
    int _2146 = _2144 + 1;
    int _2148 = _2088 * _2130;
    int _2150 = _2148 + _2140;
    int _2152 = _2108 ? 0 : 1;
    int _2154 = abs(_2028);
    bool _2156 = _2064 > 0.0;
    float _2158 = as_type<float>(_1834) * _2142;
    int _2160 = ~_801;
    int _2162 = _2160 + 1;
    int _2164 = _2146 * int(_2126);
    int _2166 = _2164 + _1154;
    int _2168 = _2162 * int(_2136);
    int _2170 = _2168 + _1348;
    float _2172 = float(uint(_2166));
    float _2174 = trunc(_2158);
    float _2176 = precise::max(_2174, 0.0);
    uint _2178 = uint(_2176);
    int _2180 = _2040 * _2154;
    int _2182 = _2180 + _2150;
    int _2184 = ~_1752;
    int _2186 = _2184 + 1;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2190 = float(uint(_2170));
    float _2192 = as_type<float>(_855) * _2172;
    float _2194 = float(uint(_2182));
    float _2196 = _980 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2198 = ~_2152;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = as_type<float>(_845) * _2190;
    int _2206 = _2202;
    if (!_2156)
    {
        int _2208 = ~_2152;
        int _2210 = _2208 + 1;
        _2206 = _2210;
    }
    int _2212 = _2206;
    float _2214 = as_type<float>(_1834) * _2194;
    float _2216 = -_2188;
    float _2218 = fma(_2196, 2.0, _2216);
    float _2220 = trunc(_2192);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    int _2226 = _2186 * int(_2178);
    int _2228 = _2226 + _2088;
    int _2230 = ~_809;
    int _2232 = _2230 + 1;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2238 = float(uint(_2228));
    float _2240 = trunc(_2214);
    float _2242 = precise::max(_2240, 0.0);
    uint _2244 = uint(_2242);
    float _2246 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2234);
    float _2248 = _994 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _2250 = ~_1752;
    int _2252 = _2250 + 1;
    float _2254 = as_type<float>(_1834) * _2238;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2258 = -_2236;
    float _2260 = fma(_2248, 2.0, _2258);
    float _2262 = trunc(_2204);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    int _2268 = int(_2126) + int(_2224);
    float _2270 = _986 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2274 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2246);
    float _2276 = fma(_2270, -2.0, _2256);
    float _2278 = trunc(_2254);
    float _2280 = precise::max(_2278, 0.0);
    uint _2282 = uint(_2280);
    int _2284 = _2252 * int(_2244);
    int _2286 = _2284 + _2182;
    float _2288 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2272);
    float _2290 = _996 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2292 = _2232 * _2268;
    int _2294 = _2292 + _1154;
    float _2296 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2298 = float(uint(_2286));
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2302 = int(_2136) + int(_2266);
    float _2304 = -_1482;
    float _2306 = fma(_2296, 2.0, _2304);
    bool _2308 = uint(_2294) >= uint(_809);
    float _2310 = as_type<float>(_1834) * _2298;
    float _2312 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2314 = log2(_2312);
    int _2316 = ~_801;
    int _2318 = _2316 + 1;
    float _2320 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2322 = !_2308;
    int _2324 = _2322 ? 0 : (-1);
    float _2326 = fma(_2290, -2.0, _1502);
    int _2328 = int(_2178) + int(_2282);
    int _2330 = _2318 * _2302;
    int _2332 = _2330 + _1348;
    int _2334 = ~_1752;
    int _2336 = _2334 + 1;
    float _2338 = trunc(_2310);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_2320, -2.0, _1510);
    float _2346 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2300);
    bool _2348 = uint(_2332) >= uint(_801);
    int _2350 = _2336 * _2328;
    int _2352 = _2350 + _2088;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2356 = _2314 * _137;
    bool _2358 = !_2348;
    int _2360 = _2358 ? 0 : (-1);
    float _2362 = -_137;
    float _2364 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2218);
    bool _2366 = uint(_2352) >= uint(_1752);
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2370 = ~_1752;
    int _2372 = _2370 + 1;
    float _2374 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2354);
    bool _2376 = !_2366;
    int _2378 = _2376 ? 0 : (-1);
    float _2380 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2368);
    int _2382 = int(_2244) + int(_2342);
    float _2384 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2386 = exp2(_2356);
    float _2388 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2276);
    int _2390 = _2372 * _2382;
    int _2392 = _2390 + _2182;
    float _2394 = fma(_2384, -2.0, _1500);
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2398 = uint(_2392) >= uint(_1752);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2402 = 1.0 + _2400;
    float _2404 = in.m_58.x;
    float _2406 = in.m_58.y;
    float _2408 = in.m_58.z;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2412 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2288);
    float _2414 = -_137;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2260);
    float _2418 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2326);
    float _2420 = 1.0 / _2402;
    float _2422 = -_2386;
    float _2424 = _2422 + 1.0;
    float _2426 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1882);
    float _2428 = -_137;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2306);
    float _2432 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2344);
    float _2434 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _249);
    float _2436 = _2120 ? _2424 : 0.0;
    float _2438 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2410);
    bool _2440 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2442 = isnan(1.0);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2448 = _2444 || _2446;
    float _2450 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2396);
    float _2452 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2380);
    float _2454 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2438);
    float _2456 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2374);
    float _2458 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2346);
    float _2460 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2450);
    float _2462 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2394);
    float _2464 = -_137;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1940);
    bool _2468 = !_2398;
    int _2470 = _2468 ? 0 : (-1);
    float _2472 = _205 * _2406;
    float _2474 = _211 * _2406;
    float _2476 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_2448)
    {
        float _2478 = _2436 * _2420;
        _147 = _2478;
    }
    float _2480 = _147;
    float _2482 = _199 * _2406;
    float _2484 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2486 = fma(_203, _2404, _2472);
    bool _2488 = _1636 != 3;
    float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2492 = _2490 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2498 = fma(_197, _2404, _2482);
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2502 = _2500 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2504 = !_2056;
    int _2506 = _2504 ? 0 : 1;
    float _2508 = 1.0 / _2492;
    float _2510 = fma(_209, _2404, _2474);
    bool _2512 = _1734 != 0;
    float _2514 = fma(_207, _2408, _2486);
    bool _2516 = !_2042;
    int _2518 = _2516 ? 0 : 1;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2524 = !_2488;
    int _2526 = _2524 ? 0 : (-1);
    float _2528 = _2484 * _2434;
    float _2530 = 1.0 / _2496;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2534 = _2532 != 0;
    float _2536 = fma(_213, _2408, _2510);
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2540 = _2538 != 0;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2548 = _2546 != 0;
    float _2550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _2552 = 1.0 / _2502;
    float _2554 = _2476 * _2550;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2564;
    float _2568 = fma(_201, _2408, _2498);
    float _2570 = 1.0 / _2522;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2576 = _2562 * _1536;
    float _2578 = _2566 * _2508;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2584 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2586 = isnan(_787);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2558 * _2530;
    float _2598 = 1.0 / _2544;
    bool _2600 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2602 = isnan(_787);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2608 = _2604 || _2606;
    float _2610 = float(_2608);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2614 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2612;
    float _2616 = -_2594;
    float _2618 = _2616 + 1.0;
    float _2620 = _2582 * _2552;
    bool _2622 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2624 = isnan(_787);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2610;
    float _2636 = _2634 + 1.0;
    float _2638 = _2610 * _2618;
    float _2640 = 1.0 / _2574;
    float _2642 = _2614 * _2570;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2648 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2650 = isnan(_787);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2656 = _2652 || _2654;
    float _2658 = float(_2656);
    float _2660 = -_2632;
    float _2662 = _2660 + 1.0;
    bool _2664 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2666 = isnan(_787);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = _2632 * _2636;
    float _2678 = _2646 * _2598;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2680;
    float _2684 = _2658 * _2662;
    float _2686 = -_2658;
    float _2688 = _2686 + 1.0;
    bool _2690 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2692 = isnan(_787);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = -_2674;
    float _2704 = _2702 + 1.0;
    bool _2706 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2708 = isnan(_787);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2674 * _2688;
    float _2720 = _2682 * _2640;
    float _2722 = in.m_72.w;
    float _2724 = _2700 * _2704;
    float _2726 = -_2700;
    float _2728 = _2726 + 1.0;
    bool _2730 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2732 = isnan(_787);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = in.m_74.w;
    float _2744 = -_2716;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2596, _1022, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2750 = _2716 * _2728;
    float _2752 = in.m_76.w;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2756 = _787 + _2754;
    float _2758 = _2740 * _2746;
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2762 = _787 + _2760;
    float _2764 = fma(_2578, _1042, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2766 = fma(_2620, _2756, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2768 = _2748 * _2758;
    float _2770 = -_2740;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2576, _2762, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2778 = _787 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2782 = _787 + _2780;
    float _2784 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2768);
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2788 = _787 + _2786;
    bool _2790 = !_2052;
    int _2792 = _2790 ? 0 : 1;
    float _2794 = fma(_2678, _2782, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2796 = fma(_2774, _2750, _2784);
    float _2798 = fma(_2720, _2788, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2800 = _2568 + _2722;
    float _2802 = _986 + _980;
    float _2804 = fma(_2764, _2724, _2796);
    float _2806 = _2514 + _2742;
    float _2808 = _2802 + (-1.0);
    float _2810 = fma(_2642, _2778, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2812 = _2536 + _2752;
    int _2814 = abs(_2792);
    float _2816 = in.m_86.x;
    float _2818 = in.m_86.y;
    float _2820 = in.m_86.z;
    float _2822 = fma(_2808, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2824 = float(_2212);
    float _2826 = _980 + _1004;
    float _2828 = float(_2814);
    float _2830 = _980 + (-0.5);
    float _2832 = _986 + _1004;
    float _2834 = fma(_2766, _2718, _2804);
    float _2836 = _2828 * _2824;
    float _2838 = _2826 + (-1.0);
    float _2840 = _2832 + (-1.0);
    int _2842 = abs(_2506);
    float _2844 = _2836 * (-2.0);
    float _2846 = _1598 + (-0.5);
    float _2848 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2850 = !_2060;
    int _2852 = _2850 ? 0 : 1;
    float _2854 = fma(_2810, _2684, _2834);
    float _2856 = -_2846;
    float _2858 = -_2418;
    float _2860 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2858);
    float _2862 = float(_1966);
    float _2864 = fma(_2822, _2844, _2822);
    int _2866 = abs(_2852);
    float _2868 = _1450 + 0.5;
    float _2870 = fma(_2844, _2816, _2816);
    float _2872 = float(_2842);
    float _2874 = fma(_2794, _2676, _2854);
    float _2876 = _1762 + (-0.5);
    float _2878 = fma(_2830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2870);
    float _2880 = fma(_2838, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2882 = _2872 * _2862;
    float _2884 = _986 + (-0.5);
    float _2886 = fma(_2864, _2480, _2878);
    float _2888 = float(_2016);
    float _2890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2892 = float(_2866);
    float _2894 = _2882 * (-2.0);
    float _2896 = _2886 * 0.15915493667125701904296875;
    float _2898 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2416);
    float _2900 = -_2876;
    float _2902 = -_2388;
    float _2904 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2902);
    float _2906 = _2892 * _2888;
    float _2908 = fma(_2894, _2818, _2818);
    float _2910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2912 = -_2274;
    float _2914 = _2912 + 1.0;
    float _2916 = _2906 * (-2.0);
    float _2918 = -_2412;
    float _2920 = _2918 + 1.0;
    float _2922 = fma(_2848, _2894, _2848);
    float _2924 = fma(_2884, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2908);
    float _2926 = fma(_2880, _2916, _2880);
    float _2928 = fma(_2916, _2820, _2820);
    float _2930 = -_2914;
    float _2932 = fma(_2930, _1450, _2898);
    float _2934 = fma(_2920, _1598, _2860);
    float _2936 = _1004 + (-0.5);
    float _2938 = _2890 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2940 = fma(_2922, _2480, _2924);
    float _2942 = _1830 + 0.5;
    float _2944 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2928);
    out.m_88.x = _2932;
    out.m_88.y = _2934;
    float _2946 = fma(_2798, _2638, _2874);
    float _2948 = _2940 * 0.15915493667125701904296875;
    float _2950 = fma(_2926, _2480, _2944);
    float _2952 = _2910 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2954 = _1426 + 0.5;
    float _2956 = fma(_2942, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2364);
    float _2958 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2946);
    float _2960 = _2896 * 6.283185482025146484375;
    float _2962 = sin(_2960);
    float _2964 = fma(_2952, _2954, _2430);
    float _2966 = _1770 + (-0.5);
    float _2968 = -_2452;
    float _2970 = _2968 + 1.0;
    float _2972 = -_2458;
    float _2974 = _2972 + 1.0;
    float _2976 = -_2426;
    float _2978 = _2976 + 1.0;
    float _2980 = -_2938;
    float _2982 = -_2462;
    float _2984 = fma(_2980, _2966, _2982);
    float _2986 = -_2454;
    float _2988 = _2986 + 1.0;
    float _2990 = _2950 * 0.15915493667125701904296875;
    float _2992 = _2948 * 6.283185482025146484375;
    float _2994 = sin(_2992);
    int _2996 = ~_2302;
    int _2998 = _2996 + _2360;
    int _3000 = _2998 + 1;
    float _3002 = fma(_1762, _2970, _2904);
    int _3004 = _1632 >> 31;
    float _3006 = -_2988;
    float _3008 = fma(_1830, _3006, _2956);
    float _3010 = -_2974;
    float _3012 = fma(_1426, _3010, _2964);
    float _3014 = fma(_1770, _2978, _2984);
    int _3016 = _801 * _3000;
    int _3018 = _3016 + _1348;
    float _3020 = _2948 * 6.283185482025146484375;
    float _3022 = cos(_3020);
    int _3024 = _3004 & 3;
    out.m_90.x = _2958;
    int _3026 = ~_2268;
    int _3028 = _3026 + _2324;
    int _3030 = _3028 + 1;
    int _3032 = ~_2328;
    int _3034 = _3032 + _2378;
    int _3036 = _3034 + 1;
    out.m_92.x = _3008;
    out.m_92.y = _3002;
    out.m_92.z = _3012;
    out.m_92.w = _3014;
    bool _3038 = _801 == 0;
    float _3040 = _2990 * 6.283185482025146484375;
    float _3042 = cos(_3040);
    int _3044 = _809 * _3030;
    int _3046 = _3044 + _1154;
    float _3048 = _2962 * _2994;
    int _3050 = _1752 * _3036;
    int _3052 = _3050 + _2088;
    bool _3054 = !_3038;
    int _3056 = _3054 ? _3018 : (-1);
    float _3058 = _2896 * 6.283185482025146484375;
    float _3060 = cos(_3058);
    float _3062 = _2962 * _3022;
    int _3064 = _1632 + _3024;
    float _3066 = _2990 * 6.283185482025146484375;
    float _3068 = sin(_3066);
    int _3070 = _3064 >> 2;
    float _3072 = _2962 * _3042;
    int _3074 = _3070 << 4;
    int _3076 = _3074 + 656;
    float _3078 = _3072 * _2528;
    float _3080 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3082 = _3060 * _3022;
    float _3084 = _3060 * _2994;
    float _3086 = _3060 * _3042;
    float _3088 = _3022 * _3042;
    float _3090 = _2994 * _3042;
    float _3092 = _3086 * _2528;
    float _3094 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3096 = -_3084;
    float _3098 = fma(_3068, _3062, _3096);
    float _3100 = fma(_3068, _3082, _3048);
    float _3102 = fma(_3068, _3048, _3082);
    float _3104 = -_2528;
    float _3106 = _3068 * _3104;
    uint _3108 = uint(int(uint(_3076) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c9)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    float _3124 = -_3062;
    float _3126 = fma(_3068, _3084, _3124);
    float _3128 = fma(_3100, _2554, _3092);
    float _3130 = fma(_3088, _2554, _3106);
    float _3132 = fma(_3098, _2554, _3078);
    float _3134 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3136 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3138 = -_3068;
    float _3140 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3094);
    float _3142 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3144 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3134);
    float _3146 = -_3068;
    float _3148 = fma(_3146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3136);
    int _3150 = _3076 + 8;
    uint _3152 = uint(int(uint(_3150) >> uint(2)));
    uint _3154 = uint(int(uint(int(_3152)) >> uint(2)));
    int _3156 = int(_3152) & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = int(_3152) + 1;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    int _3164 = _3160 & 3;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[int(_3162)][_3164];
    float _3168 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3170 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3172 = -_3068;
    float _3174 = fma(_3172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3142);
    float _3176 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3178 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3168);
    float _3180 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3170);
    float _3182 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3184 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3186 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3148);
    float _3188 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3140);
    float _3190 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3174);
    float _3192 = fma(_3090, _3080, _3130);
    float _3194 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3176);
    float _3196 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3182);
    float _3198 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3184);
    float _3200 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3202 = fma(_3126, _3080, _3128);
    float _3204 = fma(_3102, _3080, _3132);
    int _3206 = abs(_2518);
    float _3208 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3178);
    float _3210 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3144);
    float _3212 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3180);
    float _3214 = _249 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3216 = ~_2382;
    int _3218 = _3216 + _2470;
    int _3220 = _3218 + 1;
    float _3222 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3196);
    int _3224 = ~_1796;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    float _3230 = _3214 * _3186;
    float _3232 = _3214 * _3188;
    int _3234 = ~_3206;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    out.m_94.x = _3208;
    out.m_94.y = _3210;
    out.m_94.z = _3212;
    float _3240 = fma(_3200, _3210, _3230);
    float _3242 = fma(_3200, _3208, _3232);
    float _3244 = _3214 * _3190;
    int _3246 = _1752 * _3220;
    int _3248 = _3246 + _2182;
    float _3250 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3252 = _3228 * as_type<int>(_3122);
    float _3254 = fma(_3200, _3212, _3244);
    float _3256 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3258 = int(_3256);
    bool _3260 = !_2062;
    float _3262 = _3260 ? as_type<float>(_3248) : as_type<float>(0xffffffffu /* nan */);
    int _3264 = _3238 * as_type<int>(_3114);
    int _3266 = _3264 + _3252;
    int _3268 = abs(_2526);
    float _3270 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3272 = abs(_1744);
    float _3274 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3250);
    float _3276 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3198);
    float _3278 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3270);
    int _3280 = ~_3272;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    float _3286 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3274);
    int _3288 = ~_3268;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3278);
    float _3296 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3298 = _3284 * as_type<int>(_3158);
    int _3300 = _3298 + _3266;
    float _3302 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3304 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3306 = abs(_3258);
    int _3308 = _3292 * as_type<int>(_3166);
    int _3310 = _3308 + _3300;
    int _3312 = as_type<int>(_3262) >> 31;
    float _3314 = _2800 + _3304;
    bool _3316 = !_2540;
    int _3318 = _3316 ? 0 : 1;
    float _3320 = _2812 + _3302;
    int _3322 = _3312 & 3;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3326 = _3314 + _3324;
    bool _3328 = uint(_1606) >= 2u;
    float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3332 = _3320 + _3330;
    int _3334 = as_type<int>(_3262) + _3322;
    float _3336 = _3326 * _3326;
    int _3338 = _3328 ? 0 : 1;
    float _3340 = _3332 * _3332;
    int _3342 = _3334 >> 2;
    float _3344 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3194);
    bool _3346 = _1606 != 3;
    float _3348 = _3336 + _3340;
    int _3350 = _3342 << 4;
    int _3352 = _3350 + 800;
    float _3354 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3296);
    int _3356 = abs(_3318);
    float _3358 = sqrt(_3348);
    float _3360 = float(uint(_3306));
    uint _3362 = uint(int(uint(_3352) >> uint(2)));
    uint _3364 = uint(int(uint(int(_3362)) >> uint(2)));
    int _3366 = int(_3362) & 3;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[int(_3364)][_3366];
    int _3370 = int(_3362) + 1;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    int _3374 = _3370 & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = _1592 >> 31;
    float _3380 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3354);
    float _3382 = float(uint(_3258));
    int _3384 = ~_3356;
    int _3386 = _3384 + 1;
    int _3388 = _3386 + 1;
    float _3390 = 1.0 / _3360;
    int _3392 = _3378 & 3;
    float _3394 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3396 = ~_3338;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    int _3402 = _3310 * _3388;
    int _3404 = _1592 + _3392;
    float _3406 = _2806 + _3394;
    int _3408 = _3400;
    float _3410 = _3262;
    float _3412 = _3314;
    float _3414 = _3320;
    float _3416 = _2800;
    if (_3346)
    {
        int _3418 = ~_3338;
        int _3420 = _3418 + 1;
        _3408 = _3420;
    }
    int _3422 = _3408;
    float _3424 = 1.0 / _3382;
    int _3426 = _3404 >> 2;
    int _3428 = _3056 * _3356;
    int _3430 = _3428 + _3402;
    bool _3432 = _3358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3434 = _3426 << 4;
    int _3436 = _3434 + 368;
    int _3438 = abs(_3430);
    uint _3440 = uint(int(uint(_3436) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    float _3456 = float(uint(_3430));
    int _3458 = as_type<int>(_3390) + (-2);
    int _3460 = as_type<int>(_3262) & 3;
    bool _3462 = _3460 != 0;
    int _3464 = as_type<int>(_3424) + (-2);
    int _3466 = _3436 + 8;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    uint _3470 = uint(int(uint(int(_3468)) >> uint(2)));
    int _3472 = int(_3468) & 3;
    float _3474 = (*spvDescriptorSet0.vp_c9)._m0[int(_3470)][_3472];
    int _3476 = int(_3468) + 1;
    uint _3478 = uint(int(uint(_3476) >> uint(2)));
    int _3480 = _3476 & 3;
    float _3482 = (*spvDescriptorSet0.vp_c9)._m0[int(_3478)][_3480];
    int _3484 = _3462 ? 0 : 1;
    int _3486 = as_type<int>(_3262) & 3;
    bool _3488 = _3486 != 0;
    float _3490 = as_type<float>(_3464) * _3456;
    bool _3492 = !_2512;
    int _3494 = _3492 ? 0 : 1;
    float _3496 = _3390;
    if (!_3432)
    {
        _3496 = _3336;
    }
    float _3498 = _3496;
    float _3500 = float(uint(_3438));
    float _3502 = trunc(_3490);
    float _3504 = precise::max(_3502, 0.0);
    uint _3506 = uint(_3504);
    bool _3508 = _1606 != 3;
    int _3510 = ~_3258;
    int _3512 = _3510 + 1;
    float _3514 = as_type<float>(_3458) * _3500;
    int _3516 = ~_3306;
    int _3518 = _3516 + 1;
    float _3520 = _3500;
    float _3522 = _3498;
    if (!_3432)
    {
        _3410 = _3340;
    }
    float _3524 = _3410;
    float _3526 = _3524;
    if (!_3432)
    {
        _3520 = _3406;
    }
    float _3528 = _3520;
    float _3530 = trunc(_3514);
    float _3532 = precise::max(_3530, 0.0);
    uint _3534 = uint(_3532);
    int _3536 = ~_3484;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    bool _3542 = uint(_3486) > 1u;
    bool _3544 = !_3432;
    float _3546 = _3528;
    int _3548 = _3540;
    if (!_3544)
    {
        float _3550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3554 = _3358 + _3552;
        float _3556 = rsqrt(_3348);
        float _3558 = _3554 * _3550;
        float _3560 = _3406 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3562 = _3558 * 0.15915493667125701904296875;
        float _3564 = _3562 * 6.283185482025146484375;
        float _3566 = sin(_3564);
        float _3568 = _3562 * 6.283185482025146484375;
        float _3570 = cos(_3568);
        float _3572 = fma(_3566, _3560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3574 = _3556 * _3572;
        float _3576 = fma(_3326, _3574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3578 = _3570 + (-1.0);
        float _3580 = fma(_3332, _3574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3584 = _3576 + _3582;
        float _3586 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3590 = _3580 + _3588;
        float _3592 = _3584 * _3584;
        float _3594 = fma(_3406, _3570, _3586);
        float _3596 = _3590 * _3590;
        _3546 = _3594;
        _3522 = _3592;
        _3526 = _3596;
        _3412 = _3576;
        _3414 = _3580;
    }
    float _3598 = _3546;
    float _3600 = _3522;
    float _3602 = _3526;
    float _3604 = _3412;
    float _3606 = _3414;
    if (!_3542)
    {
        int _3608 = ~_3484;
        int _3610 = _3608 + 1;
        _3548 = _3610;
    }
    int _3612 = _3548;
    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3616 = _3598 + _3614;
    int _3618 = _3352 + 8;
    uint _3620 = uint(int(uint(_3618) >> uint(2)));
    uint _3622 = uint(int(uint(int(_3620)) >> uint(2)));
    int _3624 = int(_3620) & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = int(_3620) + 1;
    uint _3630 = uint(int(uint(_3628) >> uint(2)));
    int _3632 = _3628 & 3;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[int(_3630)][_3632];
    float _3636 = -_2460;
    float _3638 = _3636 + 1.0;
    float _3640 = fma(_3616, _3616, _3600);
    bool _3642 = !_3488;
    int _3644 = _3642 ? 0 : 1;
    int _3646 = _3512 * int(_3506);
    int _3648 = _3646 + _3430;
    int _3650 = abs(_1652);
    int _3652 = _3518 * int(_3534);
    int _3654 = _3652 + _3438;
    int _3656 = abs(_3494);
    float _3658 = float(uint(_3648));
    float _3660 = float(uint(_3654));
    int _3662 = abs(_3644);
    float _3664 = as_type<float>(_3464) * _3658;
    bool _3666 = _3486 != 3;
    float _3668 = as_type<float>(_3458) * _3660;
    int _3670 = ~_3650;
    int _3672 = _3670 + 1;
    int _3674 = _3672 + 1;
    int _3676 = abs(_3612);
    float _3678 = trunc(_3668);
    float _3680 = precise::max(_3678, 0.0);
    uint _3682 = uint(_3680);
    int _3684 = _3674 * as_type<int>(_3454);
    int _3686 = abs(_3422);
    bool _3688 = uint(_3486) >= 2u;
    int _3690 = ~_3676;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    float _3696 = trunc(_3664);
    float _3698 = precise::max(_3696, 0.0);
    uint _3700 = uint(_3698);
    int _3702 = ~_3656;
    int _3704 = _3702 + 1;
    int _3706 = _3704 + 1;
    int _3708 = _3694 * as_type<int>(_3376);
    int _3710 = _3688 ? 0 : 1;
    int _3712 = _3706 * as_type<int>(_3446);
    int _3714 = _3712 + _3684;
    int _3716 = ~_3662;
    int _3718 = _3716 + 1;
    int _3720 = _3718 + 1;
    float _3722 = _3640 + _3602;
    int _3724 = ~_3686;
    int _3726 = _3724 + 1;
    int _3728 = _3726 + 1;
    int _3730 = ~_3710;
    int _3732 = _3730 + 1;
    int _3734 = _3732 + 1;
    int _3736 = _3720 * as_type<int>(_3368);
    int _3738 = _3736 + _3708;
    bool _3740 = _3486 != 3;
    int _3742 = _3728 * as_type<int>(_3474);
    int _3744 = _3742 + _3714;
    int _3746 = _3734;
    if (_3666)
    {
        int _3748 = ~_3710;
        int _3750 = _3748 + 1;
        _3746 = _3750;
    }
    int _3752 = _3746;
    float _3754 = sqrt(_3722);
    int _3756 = int(_3534) + int(_3682);
    int _3758 = abs(_3752);
    int _3760 = ~_3306;
    int _3762 = _3760 + 1;
    bool _3764 = !_3508;
    int _3766 = _3764 ? 0 : (-1);
    bool _3768 = !_3740;
    int _3770 = _3768 ? 0 : (-1);
    int _3772 = _3762 * _3756;
    int _3774 = _3772 + _3438;
    int _3776 = abs(_3766);
    int _3778 = ~_3758;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    int _3784 = abs(_3770);
    int _3786 = ~_3258;
    int _3788 = _3786 + 1;
    int _3790 = _3782 * as_type<int>(_3626);
    int _3792 = _3790 + _3738;
    int _3794 = int(_3506) + int(_3700);
    float _3796 = fma(_3214, _3214, 1.0);
    int _3798 = ~_3776;
    int _3800 = _3798 + 1;
    int _3802 = _3800 + 1;
    int _3804 = ~_3784;
    int _3806 = _3804 + 1;
    int _3808 = _3806 + 1;
    int _3810 = _3788 * _3794;
    int _3812 = _3810 + _3430;
    bool _3814 = uint(_3774) >= uint(_3306);
    int _3816 = _3802 * as_type<int>(_3482);
    int _3818 = _3816 + _3744;
    float _3820 = rsqrt(_3796);
    int _3822 = _3808 * as_type<int>(_3634);
    int _3824 = _3822 + _3792;
    bool _3826 = !_3814;
    int _3828 = _3826 ? 0 : (-1);
    int _3830 = _3430 ^ _3258;
    bool _3832 = uint(_3812) >= uint(_3258);
    int _3834 = ~_3828;
    int _3836 = _3756 + _3834;
    int _3838 = _3836 + 1;
    float _3840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3842 = uint(int(uint(_3830) >> uint(31)));
    bool _3844 = !_3832;
    int _3846 = _3844 ? 0 : (-1);
    bool _3848 = !_2534;
    int _3850 = _3848 ? 0 : 1;
    int _3852 = ~int(_3842);
    int _3854 = _3852 + 1;
    float _3856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3858 = ~_3794;
    int _3860 = _3858 + _3846;
    int _3862 = _3860 + 1;
    bool _3864 = !_2548;
    int _3866 = _3864 ? 0 : 1;
    int _3868 = abs(_3850);
    int _3870 = _3258 * _3862;
    int _3872 = _3870 + _3430;
    int _3874 = _3838 ^ _3854;
    int _3876 = abs(_3866);
    int _3878 = ~_3868;
    int _3880 = _3878 + 1;
    int _3882 = _3880 + 1;
    bool _3884 = _3258 == 0;
    bool _3886 = _3258 == 0;
    int _3888 = _3818 * _3882;
    int _3890 = ~_3854;
    int _3892 = _3890 + _3874;
    int _3894 = _3892 + 1;
    float _3896 = _3856 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3898 = ~_3876;
    int _3900 = _3898 + 1;
    int _3902 = _3900 + 1;
    bool _3904 = !_3884;
    int _3906 = _3904 ? _3872 : (-1);
    bool _3908 = !_3886;
    int _3910 = _3908 ? _3894 : (-1);
    int _3912 = _3824 * _3902;
    bool _3914 = _809 == 0;
    float _3916 = float(_3906);
    float _3918 = _3840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3920 = float(_3910);
    bool _3922 = !_3914;
    int _3924 = _3922 ? _3046 : (-1);
    float _3926 = fma(_3918, _3916, _2466);
    float _3928 = _1150 + 0.5;
    float _3930 = -_2432;
    float _3932 = fma(_3896, _3920, _3930);
    bool _3934 = !_2062;
    int _3936 = _3934 ? _3052 : (-1);
    float _3938 = _1142 + (-0.5);
    int _3940 = _3924 * _3868;
    int _3942 = _3940 + _3888;
    float _3944 = _3214 * _3820;
    float _3946 = fma(_3918, _3928, _3926);
    float _3948 = -_3896;
    float _3950 = fma(_3948, _3938, _3932);
    float _3952 = -_2456;
    float _3954 = _3952 + 1.0;
    int _3956 = _3936 * _3876;
    int _3958 = _3956 + _3912;
    float _3960 = -_3344;
    float _3962 = _3944 * _3960;
    float _3964 = -_3222;
    float _3966 = _3944 * _3964;
    float _3968 = -_3276;
    float _3970 = _3944 * _3968;
    float _3972 = fma(_1142, _3954, _3950);
    float _3974 = fma(_3820, _3188, _3962);
    float _3976 = fma(_3820, _3186, _3966);
    float _3978 = -_3638;
    float _3980 = fma(_1150, _3978, _3946);
    float _3982 = fma(_3820, _3190, _3970);
    float _3984 = _3344 + _3242;
    float _3986 = float(_3942);
    float _3988 = _3222 + _3240;
    float _3990 = float(_3958);
    float _3992 = _3276 + _3254;
    out.m_96.x = _3974;
    out.m_96.y = _3976;
    out.m_96.z = _3982;
    bool _3994 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3996 = isnan(_3754);
    bool _3998 = _3994 || _3996;
    bool _4000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4002 = _3998 || _4000;
    out.m_98.x = _3986;
    out.m_98.w = _3990;
    out.m_100.x = _3980;
    out.m_100.y = _3972;
    float _4004 = _3966;
    if (!_4002)
    {
        _4004 = 1.0;
    }
    float _4006 = _4004;
    out.m_102.x = _3984;
    out.m_102.y = _3988;
    out.m_102.z = _3992;
    bool _4008 = !_4002;
    float _4010 = _4006;
    if (!_4008)
    {
        bool _4012 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4014 = isnan(_3754);
        bool _4016 = _4012 || _4014;
        bool _4018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4020 = _4016 || _4018;
        if (!_4020)
        {
            float _4022 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4024 = _3754 + _4022;
            float _4026 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4028 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4026;
            float _4030 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4032 = _4030 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4034 = 1.0 / _4028;
            float _4036 = _4024 * _4034;
            float _4038 = fma(_4036, _4032, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4010 = _4038;
            _4040 = true;
        }
        else
        {
            bool _4042 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4044 = isnan(_3754);
            bool _4046 = _4042 || _4044;
            bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4050 = _4046 || _4048;
            if (!_4050)
            {
                float _4052 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4054 = _3754 + _4052;
                float _4056 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4058 = _4056 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4060 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4062 = _4060 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4064 = 1.0 / _4058;
                float _4066 = _4054 * _4064;
                float _4068 = fma(_4066, _4062, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4010 = _4068;
                _4040 = true;
            }
            else
            {
                _4010 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4040 = false;
    float _4070 = _4010;
    float _4072 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4074 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4076 = floor(_4072);
    float _4078 = floor(_4074);
    float _4080 = -_4076;
    float _4082 = _4072 + _4080;
    float _4084 = -_4078;
    float _4086 = _4074 + _4084;
    float2 _11548 = float2(_4082, _4086);
    float _4088 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11548, float2(0.0), isnan(_11548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11548, float2(0.0), isnan(_11548)), level(0.0)).x;
    float _4090 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4092 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4094 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4090);
    float _4096 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4098 = _3598 + _4096;
    float _4100 = _2806 + _4092;
    float _4102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4104 = _3604 + _4102;
    float _4106 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4094);
    float _4108 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4110 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4112 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4114 = _4106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4116 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4108);
    float _4118 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4110);
    float _4120 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4112);
    float _4122 = 1.0 / _4114;
    float _4124 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4116);
    float _4126 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4118);
    float _4128 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4120);
    float _4130 = fma(_4098, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4132 = _4124 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4134 = fma(_4104, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4136 = _4128 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4138 = -_2806;
    float _4140 = _4138 + _4130;
    float _4142 = _4132 + _4114;
    float _4144 = -_2800;
    float _4146 = _4144 + _4134;
    float _4148 = _4140 * _4140;
    bool _4150 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4152 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4154 = _4150 || _4152;
    bool _4156 = isnan(0.5);
    bool _4158 = _4154 || _4156;
    float _4160 = _4142 * _4122;
    float _4162 = _4160 * 0.5;
    float _4164 = fma(_4146, _4146, _4148);
    float _4166 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4168 = fma(_4162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4166);
    float _4170 = _4126 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4172 = trunc(_4136);
    int _4174 = int(_4172);
    float _4176 = 1.0 / _4168;
    float _4178 = trunc(_4170);
    int _4180 = int(_4178);
    int _4182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4184 = _4174 + _4182;
    int _4186 = _4184 + 1;
    float _4188 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4190 = _4176 * _4188;
    bool _4192 = _4190 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4194 = _4190 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4196 = !_4192;
    int _4198 = _4196 ? 0 : 1;
    int _4200 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4202 = _4180 + _4200;
    int _4204 = _4202 + 1;
    int _4206 = _4204 | _4186;
    int _4208 = 2;
    int _4210 = _4206;
    int _4212 = _4186;
    int _4214 = _4204;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4218 = _4134;
    if (!_4192)
    {
        _4208 = 1;
    }
    int _4220 = _4208;
    int _4222 = _4220;
    if (!_4194)
    {
        _4222 = _4198;
    }
    int _4224 = _4222;
    float _4226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4228 = _3606 + _4226;
    bool _4230 = _4204 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4232 = _4224 << 6;
    float _4234 = fma(_4228, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4236 = _4206 < 0;
    bool _4238 = _4236 || _4230;
    int _4240 = _4232 + 96;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    uint _4244 = uint(int(uint(int(_4242)) >> uint(2)));
    int _4246 = int(_4242) & 3;
    float _4248 = (*spvDescriptorSet0.vp_c15)._m0[int(_4244)][_4246];
    int _4250 = int(_4242) + 1;
    uint _4252 = uint(int(uint(_4250) >> uint(2)));
    int _4254 = _4250 & 3;
    float _4256 = (*spvDescriptorSet0.vp_c15)._m0[int(_4252)][_4254];
    float _4258 = -_2812;
    float _4260 = _4258 + _4234;
    bool _4262 = _4186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4264 = _4262 || _4238;
    float _4266 = fma(_4260, _4260, _4164);
    int _4268 = _4232 + 104;
    uint _4270 = uint(int(uint(_4268) >> uint(2)));
    uint _4272 = uint(int(uint(int(_4270)) >> uint(2)));
    int _4274 = int(_4270) & 3;
    float _4276 = (*spvDescriptorSet0.vp_c15)._m0[int(_4272)][_4274];
    int _4278 = int(_4270) + 1;
    uint _4280 = uint(int(uint(_4278) >> uint(2)));
    int _4282 = _4278 & 3;
    float _4284 = (*spvDescriptorSet0.vp_c15)._m0[int(_4280)][_4282];
    float _4286 = sqrt(_4266);
    float _4288 = as_type<float>(_4224);
    if (!_4264)
    {
        int _4290 = _4186 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4292 = _4290 + _4204;
        _4210 = _4292;
    }
    int _4294 = _4210;
    int _4296 = _4232 + 48;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    uint _4300 = uint(int(uint(int(_4298)) >> uint(2)));
    int _4302 = int(_4298) & 3;
    float _4304 = (*spvDescriptorSet0.vp_c15)._m0[int(_4300)][_4302];
    int _4306 = int(_4298) + 1;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    int _4310 = _4306 & 3;
    float _4312 = (*spvDescriptorSet0.vp_c15)._m0[int(_4308)][_4310];
    if (!_4264)
    {
        int _4314 = _4294 << 2;
        _4212 = _4314;
    }
    int _4316 = _4212;
    int _4318 = _4316;
    if (!_4264)
    {
        uint _4320 = uint(int(uint(_4294) >> uint(2)));
        _4214 = int(_4320);
    }
    int _4322 = _4214;
    if (!_4264)
    {
        int _4324 = 12 & _4316;
        _4318 = _4324;
    }
    int _4326 = _4318;
    int _4328 = _4232 + 64;
    uint _4330 = uint(int(uint(_4328) >> uint(2)));
    uint _4332 = uint(int(uint(int(_4330)) >> uint(2)));
    int _4334 = int(_4330) & 3;
    float _4336 = (*spvDescriptorSet0.vp_c15)._m0[int(_4332)][_4334];
    int _4338 = int(_4330) + 1;
    uint _4340 = uint(int(uint(_4338) >> uint(2)));
    int _4342 = _4338 & 3;
    float _4344 = (*spvDescriptorSet0.vp_c15)._m0[int(_4340)][_4342];
    bool _4346 = _4286 > 0.0;
    if (!_4264)
    {
        int _4348 = _4322 << 4;
        int _4350 = _4348 + _4326;
        _1276 = as_type<float>(_4350);
    }
    float _4352 = _1276;
    int _4354 = _4232 + 56;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    uint _4358 = uint(int(uint(int(_4356)) >> uint(2)));
    int _4360 = int(_4356) & 3;
    float _4362 = (*spvDescriptorSet0.vp_c15)._m0[int(_4358)][_4360];
    int _4364 = int(_4356) + 1;
    uint _4366 = uint(int(uint(_4364) >> uint(2)));
    int _4368 = _4364 & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    if (!_4346)
    {
        _4216 = _4130;
    }
    float _4372 = _4216;
    int _4374 = _4232 + 72;
    uint _4376 = uint(int(uint(_4374) >> uint(2)));
    uint _4378 = uint(int(uint(int(_4376)) >> uint(2)));
    int _4380 = int(_4376) & 3;
    float _4382 = (*spvDescriptorSet0.vp_c15)._m0[int(_4378)][_4380];
    int _4384 = int(_4376) + 1;
    uint _4386 = uint(int(uint(_4384) >> uint(2)));
    int _4388 = _4384 & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    float _4392 = _4100 * _4256;
    int _4394 = _4232 + 80;
    uint _4396 = uint(int(uint(_4394) >> uint(2)));
    uint _4398 = uint(int(uint(int(_4396)) >> uint(2)));
    int _4400 = int(_4396) & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    int _4404 = int(_4396) + 1;
    uint _4406 = uint(int(uint(_4404) >> uint(2)));
    int _4408 = _4404 & 3;
    float _4410 = (*spvDescriptorSet0.vp_c15)._m0[int(_4406)][_4408];
    float _4412 = fma(_2800, _4248, _4392);
    float _4414 = fma(_2812, _4276, _4412);
    int _4416 = _4232 + 88;
    uint _4418 = uint(int(uint(_4416) >> uint(2)));
    uint _4420 = uint(int(uint(int(_4418)) >> uint(2)));
    int _4422 = int(_4418) & 3;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[int(_4420)][_4422];
    int _4426 = int(_4418) + 1;
    uint _4428 = uint(int(uint(_4426) >> uint(2)));
    int _4430 = _4426 & 3;
    float _4432 = (*spvDescriptorSet0.vp_c15)._m0[int(_4428)][_4430];
    float _4434 = _4412;
    float _4436 = _4372;
    if (!_4264)
    {
        float _4438 = floor(_4170);
        _4434 = _4438;
    }
    float _4440 = _4434;
    float _4442 = _4414 + _4284;
    float _4444 = _4100 * _4312;
    float _4446 = _4352;
    float _4448 = _4444;
    float _4450 = _4336;
    float _4452 = _4312;
    if (!_4264)
    {
        int _4454 = as_type<int>(_4352) + 400;
        uint _4456 = uint(int(uint(_4454) >> uint(2)));
        uint _4458 = uint(int(uint(int(_4456)) >> uint(2)));
        int _4460 = int(_4456) & 3;
        float _4462 = (*spvDescriptorSet0.vp_c15)._m0[int(_4458)][_4460];
        _4446 = _4462;
    }
    float _4464 = _4446;
    float _4466 = 1.0 / _4442;
    float _4468 = fma(_2800, _4304, _4444);
    if (!_4346)
    {
        _4448 = _4234;
    }
    float _4470 = _4448;
    float _4472 = _4100 * _4344;
    float _4474 = fma(_2800, _4336, _4472);
    float _4476 = _4470;
    if (!_4346)
    {
        _4450 = _4134;
    }
    float _4478 = _4450;
    bool _4480 = !_4346;
    float _4482 = _4478;
    float _4484 = _4478;
    float _4486 = _4466;
    if (!_4480)
    {
        float _4488 = _239 * _239;
        float _4490 = fma(_235, _235, _4488);
        float _4492 = fma(_241, _241, _4490);
        float _4494 = rsqrt(_4266);
        float _4496 = sqrt(_4492);
        float _4498 = _4146 * _4494;
        float _4500 = _4140 * _4494;
        float _4502 = _4260 * _4494;
        bool _4504 = _4496 > 0.0;
        float _4506 = _4494;
        float _4508 = _4496;
        _4452 = _4498;
        if (!_4504)
        {
            _4482 = _4134;
        }
        float _4510 = _4482;
        _4484 = _4510;
        if (!_4504)
        {
            _4506 = _4130;
        }
        float _4512 = _4506;
        _4436 = _4512;
        if (!_4504)
        {
            _4508 = _4234;
        }
        float _4514 = _4508;
        bool _4516 = !_4504;
        _4476 = _4514;
        if (!_4516)
        {
            float _4518 = rsqrt(_4492);
            float _4520 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4522 = _239 * _4518;
            float _4524 = _235 * _4518;
            float _4526 = _4500 * _4522;
            float _4528 = _241 * _4518;
            float _4530 = fma(_4498, _4524, _4526);
            float _4532 = _4520 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4534 = fma(_4502, _4528, _4530);
            float _4536 = _4534 * _4532;
            float _4538 = fma(_235, _4536, _4134);
            float _4540 = fma(_239, _4536, _4130);
            float _4542 = fma(_241, _4536, _4234);
            _4484 = _4538;
            _4436 = _4540;
            _4476 = _4542;
        }
    }
    float _4544 = _4484;
    float _4546 = _4436;
    float _4548 = _4476;
    float _4550 = _4452;
    float _4552 = fma(_2812, _4362, _4468);
    float _4554 = fma(_2812, _4382, _4474);
    float _4556 = _4550;
    if (_4158)
    {
        _253 = _4544;
    }
    float _4558 = _253;
    float _4560 = _4558;
    if (_4158)
    {
        _255 = _4546;
    }
    float _4562 = _255;
    float _4564 = _4562;
    if (_4158)
    {
        _257 = _4548;
    }
    float _4566 = _257;
    float _4568 = _4566;
    if (!_4158)
    {
        float _4570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4572 = _2806 + _4570;
        float _4574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4576 = _2800 + _4574;
        float _4578 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4580 = -_2806;
        float _4582 = _4580 + _4546;
        float _4584 = _4572 * _4572;
        float _4586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4588 = _2812 + _4586;
        float _4590 = -_2800;
        float _4592 = _4590 + _4544;
        float _4594 = fma(_4576, _4576, _4584);
        float _4596 = fma(_4588, _4588, _4594);
        float _4598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4600 = _4578 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4602 = -_2812;
        float _4604 = _4602 + _4548;
        float _4606 = sqrt(_4596);
        float _4608 = precise::min(_4606, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4610 = _4608 * _4598;
        float _4612 = _4600 * _4610;
        float _4614 = fma(_4582, _4612, _2806);
        float _4616 = fma(_4592, _4612, _2800);
        float _4618 = fma(_4604, _4612, _2812);
        _4564 = _4614;
        _4560 = _4616;
        _4568 = _4618;
    }
    float _4620 = _4564;
    float _4622 = _4560;
    float _4624 = _4568;
    float _4626 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4628 = _4552 + _4370;
    float _4630 = _4554 + _4390;
    float _4632 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4634 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4636 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4626);
    float _4638 = _4628 * _4466;
    float _4640 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4642 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4632);
    float _4644 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4634);
    float _4646 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4636);
    float _4648 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4640);
    bool _4650 = _4638 >= 0.0;
    float _4652 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4642);
    float _4654 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4644);
    float _4656 = _4646 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4658 = _4630 * _4466;
    float _4660 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4648);
    bool _4662 = _4638 <= 1.0;
    bool _4664 = _4662 && _4650;
    float _4666 = _4654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4668 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4670 = _4660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _4672 = _4658 >= 0.0;
    bool _4674 = _4672 && _4664;
    float _4676 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4678 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4668);
    float _4680 = _4670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _4682 = _4658 <= 1.0;
    bool _4684 = _4682 && _4674;
    float _4686 = _4652 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4688 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4678);
    float _4690 = -_4680;
    float _4692 = fma(_4690, _4676, 1.0);
    float _4694 = _4100 * _4410;
    float _4696 = _4628;
    if (!_4264)
    {
        float _4698 = rint(_4464);
        float _4700 = precise::max(_4698, 0.0);
        uint _4702 = uint(_4700);
        uint _4704 = clamp(_4702, 0u, 65535u);
        _4696 = as_type<float>(_4704);
    }
    float _4706 = _4696;
    float _4708 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4688);
    float _4710 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4712 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4714 = fma(_2800, _4402, _4694);
    float _4716 = _4708;
    if (!_4264)
    {
        float _4718 = -_4440;
        float _4720 = _4170 + _4718;
        _4556 = _4720;
    }
    float _4722 = _4556;
    float _4724 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4710);
    float _4726 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4712);
    float _4728 = _4474;
    if (!_4264)
    {
        float _4730 = floor(_4136);
        _4728 = _4730;
    }
    float _4732 = _4728;
    if (_4684)
    {
        float _4734 = float(_4224);
        _4288 = _4734;
    }
    float _4736 = _4288;
    float _4738 = fma(_2812, _4424, _4714);
    float _4740 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4724);
    float _4742 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4726);
    float _4744 = _4738 + _4432;
    float _4746 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4740);
    float _4748 = log2(_4692);
    float _4750 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4742);
    float _4752 = _4744 * _4466;
    float _4754 = 1.0 / _4708;
    float _4756 = _4732;
    float _4758 = _4746;
    if (!_4264)
    {
        float _4760 = -_4732;
        float _4762 = _4136 + _4760;
        _4756 = _4762;
    }
    float _4764 = _4756;
    float _4766 = _4714;
    if (_4684)
    {
        float _4768 = rint(_4736);
        float _4770 = precise::max(_4768, 0.0);
        uint _4772 = uint(_4770);
        uint _4774 = clamp(_4772, 0u, 65535u);
        _4766 = as_type<float>(_4774);
    }
    float _4776 = _4766;
    float _4778 = _4748 * 0.693147182464599609375;
    float _4780 = _4764;
    if (!_4264)
    {
        float3 _12723 = float3(_4722, _4764, float(as_type<int>(_4706)));
        float3 _12727 = select(_12723, float3(0.0), isnan(_12723));
        float _4782 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12727.xy, uint(rint(_12727.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12727.xy, uint(rint(_12727.z)), level(0.0)).x;
        _4780 = _4782;
    }
    float _4784 = _4780;
    float _4786 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4788 = _4746 * _4754;
    float _4790 = _4750 * _4754;
    float _4792 = fma(_4788, 0.5, 0.5);
    float _4794 = fma(_4790, -0.5, 0.5);
    float _4796 = _4776;
    float _4798 = _4754;
    if (_4684)
    {
        float3 _12757 = float3(_4638, _4658, float(as_type<int>(_4776)));
        float3 _12759 = select(_12757, float3(0.0), isnan(_12757));
        float _4800 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12759.xy, uint(rint(_12759.z)), _4752, level(0.0));
        _4796 = _4800;
    }
    float _4802 = _4796;
    float3 _12769 = float3(_4792, _4794, _4786);
    float _4804 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12769, float3(0.0), isnan(_12769)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12769, float3(0.0), isnan(_12769)), level(0.0)).x;
    float3 _12778 = float3(_4792, _4794, _4786);
    float4 _4807 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12778, float3(0.0), isnan(_12778)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12778, float3(0.0), isnan(_12778)), level(0.0)).xyzw;
    float _4809 = _4807.x;
    float _4811 = _4807.y;
    float _4813 = _4807.z;
    float _4815 = _4807.w;
    if (_4264)
    {
        _4798 = 1.0;
    }
    float _4817 = _4798;
    bool _4819 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4823 = _4819 || _4821;
    bool _4825 = isnan(0.5);
    bool _4827 = _4823 || _4825;
    float _4829 = _4817;
    if (_4827)
    {
        _4486 = 1.0;
    }
    float _4831 = _4486;
    float _4833 = _4831;
    float _4835 = _4809;
    if (!_4827)
    {
        float _4837 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4839 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4841 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4839;
        float _4843 = _4837 * 0.15915493667125701904296875;
        float _4845 = _4843 * 6.283185482025146484375;
        float _4847 = cos(_4845);
        float _4849 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4851 = _4849 * 0.15915493667125701904296875;
        float _4853 = _4843 * 6.283185482025146484375;
        float _4855 = sin(_4853);
        float _4857 = 1.0 / _4847;
        float _4859 = _4851 * 6.283185482025146484375;
        float _4861 = cos(_4859);
        float _4863 = _4855 * _4857;
        float _4865 = _4851 * 6.283185482025146484375;
        float _4867 = sin(_4865);
        float _4869 = _4861 * _4863;
        float _4871 = 1.0 / _4841;
        float _4873 = 1.0 / _4869;
        float _4875 = _4867 * _4873;
        float _4877 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4879 = fma(_4190, _4875, _4877);
        float _4881 = _4879 * _4871;
        float _4883 = precise::clamp(_4881, 0.0, 1.0);
        _4833 = _4883;
    }
    float _4885 = _4833;
    if (!_4264)
    {
        int _4887 = _4294 << 4;
        int _4889 = _4887 + 2048;
        uint _4891 = uint(int(uint(_4889) >> uint(2)));
        uint _4893 = uint(int(uint(int(_4891)) >> uint(2)));
        int _4895 = int(_4891) & 3;
        float _4897 = (*spvDescriptorSet0.vp_c15)._m0[int(_4893)][_4895];
        int _4899 = int(_4891) + 1;
        uint _4901 = uint(int(uint(_4899) >> uint(2)));
        int _4903 = _4899 & 3;
        float _4905 = (*spvDescriptorSet0.vp_c15)._m0[int(_4901)][_4903];
        int _4907 = _4889 + 8;
        uint _4909 = uint(int(uint(_4907) >> uint(2)));
        uint _4911 = uint(int(uint(int(_4909)) >> uint(2)));
        int _4913 = int(_4909) & 3;
        float _4915 = (*spvDescriptorSet0.vp_c15)._m0[int(_4911)][_4913];
        int _4917 = int(_4909) + 1;
        uint _4919 = uint(int(uint(_4917) >> uint(2)));
        int _4921 = _4917 & 3;
        float _4923 = (*spvDescriptorSet0.vp_c15)._m0[int(_4919)][_4921];
        float _4925 = _4100 * _4905;
        float _4927 = fma(_2800, _4897, _4925);
        float _4929 = fma(_2812, _4915, _4927);
        float _4931 = _4929 + _4923;
        float _4933 = precise::clamp(_4931, 0.0, 1.0);
        float _4935 = -_4933;
        float _4937 = _4935 + _4784;
        float _4939 = fma(_4937, 500.0, 1.5);
        float _4941 = exp2(_4939);
        float _4943 = 0.0 + _4941;
        float _4945 = precise::clamp(_4943, 0.0, 1.0);
        _4829 = _4945;
    }
    float _4947 = _4829;
    float _4949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4951 = _4620 + _4949;
    float _4953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4955 = _4622 + _4953;
    float _4957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4959 = _4624 + _4957;
    float _4961 = _4951 * _4951;
    float _4963 = fma(_4955, _4955, _4961);
    float _4965 = fma(_4959, _4959, _4963);
    float _4967 = rsqrt(_4965);
    float _4969 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4971 = _4955 * _4969;
    float _4973 = _4959 * _4969;
    float _4975 = _4971 * _4971;
    float _4977 = _4973 * _4973;
    float _4979 = _4975 + _4977;
    float _4981 = sqrt(_4979);
    bool _4983 = _4981 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4987 = _4981 + _4985;
    float _4989 = _4959;
    float _4991 = _4967;
    float _4993 = _4987;
    float _4995 = _4951;
    if (_4983)
    {
        float _4997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4989 = _4997;
    }
    float _4999 = _4989;
    if (_4983)
    {
        float _5001 = rsqrt(_4979);
        _4991 = _5001;
    }
    float _5003 = _4991;
    float _5005 = _5003;
    if (_4983)
    {
        float _5007 = _4987 * _4999;
        _4993 = _5007;
    }
    float _5009 = _4993;
    if (_4983)
    {
        float _5011 = _5009 * 0.15915493667125701904296875;
        _3416 = _5011;
    }
    float _5013 = _3416;
    float _5015 = _4999;
    float _5017 = _5013;
    if (_4983)
    {
        float _5019 = _5013 * 6.283185482025146484375;
        float _5021 = sin(_5019);
        _5015 = _5021;
    }
    float _5023 = _5015;
    float _5025 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5027 = precise::max(0.0, _5025);
    float _5029 = _4961;
    float _5031 = _5027;
    if (_4983)
    {
        float _5033 = _5013 * 6.283185482025146484375;
        float _5035 = cos(_5033);
        _5029 = _5035;
    }
    float _5037 = _5029;
    float _5039 = -_4969;
    float _5041 = -_5027;
    float _5043 = fma(_4951, _5039, _5041);
    if (!_4983)
    {
        _4995 = _4973;
    }
    float _5045 = _4995;
    float _5047 = _5045;
    if (_4983)
    {
        float _5049 = _5043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5031 = _5049;
    }
    float _5051 = _5031;
    float _5053 = _5051;
    if (!_4983)
    {
        _5017 = _4975;
    }
    float _5055 = _5017;
    float _5057 = _5023;
    float _5059 = _5055;
    if (_4983)
    {
        float _5061 = fma(_5023, _5051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5057 = _5061;
    }
    float _5063 = _5057;
    float _5065 = _5063;
    float _5067 = _5037;
    if (_4983)
    {
        float _5069 = _5037 + (-1.0);
        _5053 = _5069;
    }
    float _5071 = _5053;
    float _5073 = _5071;
    if (_4983)
    {
        float _5075 = _5003 * _5063;
        _4218 = _5075;
    }
    float _5077 = _4218;
    if (!_4983)
    {
        _5005 = _4971;
    }
    float _5079 = _5005;
    float _5081 = _5079;
    if (_4983)
    {
        float _5083 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5073 = _5083;
    }
    float _5085 = _5073;
    if (_4983)
    {
        float _5087 = _4971 * _5077;
        _5081 = _5087;
    }
    float _5089 = _5081;
    if (!_4983)
    {
        _5065 = _5043;
    }
    float _5091 = _5065;
    float _5093 = _5091;
    if (_4983)
    {
        float _5095 = _4973 * _5077;
        _5047 = _5095;
    }
    float _5097 = _5047;
    if (_4983)
    {
        float _5099 = fma(_5043, _5037, _5085);
        _5093 = _5099;
    }
    float _5101 = _5093;
    if (_4983)
    {
        float _5103 = _5089 * _5089;
        _5059 = _5103;
    }
    float _5105 = _5059;
    if (!_4983)
    {
        _5067 = _4977;
    }
    float _5107 = _5067;
    float _5109 = _5107;
    if (_4983)
    {
        float _5111 = _5097 * _5097;
        _5109 = _5111;
    }
    float _5113 = _5109;
    float _5115 = sqrt(_4965);
    float _5117 = fma(_5101, _5101, _5105);
    float _5119 = _5117 + _5113;
    float _5121 = rsqrt(_5119);
    float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5125 = fma(_5115, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5123);
    float _5127 = precise::clamp(_5125, 0.0, 1.0);
    float _5129 = -_5127;
    float _5131 = _5129 + 1.0;
    float _5133 = abs(_5131);
    float _5135 = log2(_5133);
    float _5137 = _5121 * _5089;
    float _5139 = _5121 * _5101;
    float _5141 = _5121 * _5097;
    float _5143 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5145 = -_5143;
    float _5147 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5145);
    float _5149 = -_5141;
    float _5151 = fma(_5149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5147);
    float _5153 = _5135 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5155 = fma(_5151, -0.5, 0.5);
    float _5157 = fma(_5151, 0.5, 0.5);
    float _5159 = _5139 + 1.0;
    float _5161 = exp2(_5153);
    float _5163 = fma(_5157, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5165 = fma(_5157, _5163, -0.212114393711090087890625);
    float _5167 = sqrt(_5155);
    float _5169 = fma(_5157, _5165, 1.570728778839111328125);
    float _5171 = -_5139;
    float _5173 = fma(_5161, _5159, _5171);
    float _5175 = fma(_5173, 0.5, 0.5);
    float _5177 = _5167 * 0.636619746685028076171875;
    float _5179 = -_5169;
    float _5181 = fma(_5177, _5179, 1.0);
    float2 _13343 = float2(_5181, _5175);
    float3 _5185 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13343, float2(0.0), isnan(_13343)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13343, float2(0.0), isnan(_13343)), level(0.0)).xyz;
    float _5187 = _5185.x;
    float _5189 = _5185.y;
    float _5191 = _5185.z;
    float _5193 = abs(_4190);
    float _5195 = log2(_5193);
    float _5197 = _5135 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5199 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5201 = -_4088;
    float _5203 = _5201 + 1.0;
    float _5205 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5199);
    float _5207 = exp2(_5197);
    bool _5209 = _4190 <= 8000.0;
    bool _5211 = isnan(_4190);
    bool _5213 = _5209 || _5211;
    bool _5215 = isnan(8000.0);
    bool _5217 = _5213 || _5215;
    float _5219 = float(_5217);
    float _5221 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5205);
    bool _5223 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5225 = isnan(_5115);
    bool _5227 = _5223 || _5225;
    bool _5229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5231 = _5227 || _5229;
    float _5233 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5221);
    float _5235 = _5195 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5237 = _4708 * 0.5;
    float _5239 = _4746 + _4708;
    float _5241 = _5233 + _4708;
    out.gl_Position.x = _4746;
    out.gl_Position.y = _4750;
    out.gl_Position.z = _5233;
    out.gl_Position.w = _4708;
    float _5243 = fma(_4750, -0.5, _5237);
    float _5245 = exp2(_5235);
    float _5247 = _5241 * 0.5;
    float _5249 = _5239 * 0.5;
    out.m_104.x = _5249;
    out.m_104.y = _5243;
    out.m_104.z = _5247;
    out.m_104.w = _4708;
    float _5251 = -_5207;
    float _5253 = _5251 + 1.0;
    float _5255 = _5233;
    if (!_4684)
    {
        _4758 = 1.0;
    }
    float _5257 = _4758;
    float _5259 = _5257;
    if (_4684)
    {
        bool _5261 = _4802 >= _4752;
        bool _5263 = isnan(_4802);
        bool _5265 = _5261 || _5263;
        bool _5267 = isnan(_4752);
        bool _5269 = _5265 || _5267;
        float _5271 = float(_5269);
        _5259 = _5271;
    }
    float _5273 = _5259;
    float _5275 = fma(_5245, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5277 = precise::clamp(_5275, 0.0, 1.0);
    float _5279 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5281 = _5279;
    if (!_5231)
    {
        _4716 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5283 = _4716;
    float _5285 = fma(_5277, -2.0, 3.0);
    float _5287 = _5277 * _5277;
    float _5289 = _5279 * _4804;
    float _5291 = _5273 * _4947;
    float _5293 = _5283;
    float _5295 = _5283;
    if (!_5231)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5297 = _5255;
    float _5299 = _5287 * _5285;
    float _5301 = _4815 * _5289;
    float _5303 = -_5299;
    float _5305 = _5303 + 1.0;
    float _5307 = fma(_5305, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5299);
    float _5309 = _5219 * _5307;
    float _5311 = _5309 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5313 = _5203 * _5311;
    float _5315 = precise::clamp(_5313, 0.0, 1.0);
    float _5317 = -_5315;
    float _5319 = fma(_5317, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5321 = -_5291;
    float _5323 = fma(_5321, _5319, 1.0);
    float _5325 = precise::clamp(_5323, 0.0, 1.0);
    float _5327 = -_5279;
    float _5329 = _5327 + 1.0;
    float _5331 = _5329;
    float _5333 = _5325;
    float _5335 = _5297;
    float _5337 = _5297;
    if (!_5231)
    {
        _5281 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5339 = _5281;
    float _5341 = _5191 * _5289;
    float _5343 = fma(_5187, _5301, _4809);
    float _5345 = fma(_5189, _5301, _4811);
    float _5347 = _5325 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5349 = _4815 * _5329;
    float _5351 = fma(_4815, _5341, _4813);
    float _5353 = _4885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5355 = _5339;
    float _5357 = _5339;
    if (!_5231)
    {
        _4835 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5359 = _4835;
    out.m_106.x = _5347;
    float _5361 = _5359;
    float _5363 = _5359;
    if (!_5231)
    {
        _5331 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5365 = _5331;
    float _5367 = _5365;
    float _5369 = _5365;
    if (!_5231)
    {
        _5333 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5371 = _5333;
    out.m_108.x = _5343;
    out.m_108.y = _5345;
    out.m_108.z = _5351;
    out.m_108.w = _5349;
    bool _5373 = !_5231;
    float _5375 = _5371;
    float _5377 = _5371;
    if (!_5373)
    {
        bool _5379 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5381 = isnan(_5115);
        bool _5383 = _5379 || _5381;
        bool _5385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5387 = _5383 || _5385;
        if (!_5387)
        {
            float _5389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5391 = _5115 + _5389;
            float _5393 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5395 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5393;
            float _5397 = 1.0 / _5395;
            float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5401 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5403 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5405 = _5403 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5407 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5409 = _5407 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5411 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5413 = _5411 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5415 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5417 = _5415 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5419 = _5391 * _5397;
            float _5421 = precise::clamp(_5419, 0.0, 1.0);
            float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5425 = _5423 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5427 = fma(_5421, _5401, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5429 = fma(_5421, _5425, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5431 = fma(_5421, _5405, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5433 = fma(_5421, _5409, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5435 = fma(_5421, _5413, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5437 = fma(_5421, _5417, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5295 = _5429;
            _5369 = _5435;
            _5363 = _5427;
            _5357 = _5433;
            _5337 = _5431;
            _5377 = _5437;
            _5439 = true;
        }
        else
        {
            bool _5441 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5443 = isnan(_5115);
            bool _5445 = _5441 || _5443;
            bool _5447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5449 = _5445 || _5447;
            if (!_5449)
            {
                _5361 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5451 = _5361;
            _5363 = _5451;
            if (!_5449)
            {
                _5293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5453 = _5293;
            _5295 = _5453;
            if (!_5449)
            {
                _5335 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5455 = _5335;
            _5337 = _5455;
            if (!_5449)
            {
                _5355 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5457 = _5355;
            _5357 = _5457;
            if (!_5449)
            {
                _5367 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5459 = _5367;
            _5369 = _5459;
            if (!_5449)
            {
                _5375 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5461 = _5375;
            bool _5463 = !_5449;
            _5377 = _5461;
            if (!_5463)
            {
                bool _5465 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5467 = isnan(_5115);
                bool _5469 = _5465 || _5467;
                bool _5471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5473 = _5469 || _5471;
                if (!_5473)
                {
                    float _5475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5477 = _5115 + _5475;
                    float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5481 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5479;
                    float _5483 = 1.0 / _5481;
                    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5489 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5491 = _5489 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5493 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5495 = _5493 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5497 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5499 = _5497 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5501 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5503 = _5501 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5505 = _5477 * _5483;
                    float _5507 = precise::clamp(_5505, 0.0, 1.0);
                    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5511 = _5509 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5513 = fma(_5507, _5487, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5515 = fma(_5507, _5511, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5517 = fma(_5507, _5491, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5519 = fma(_5507, _5495, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5521 = fma(_5507, _5499, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5523 = fma(_5507, _5503, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5295 = _5515;
                    _5369 = _5521;
                    _5363 = _5513;
                    _5357 = _5519;
                    _5337 = _5517;
                    _5377 = _5523;
                    _5439 = true;
                }
                else
                {
                    _5295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5369 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5363 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5357 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5337 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5377 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5439 = false;
    float _5525 = _5295;
    float _5527 = _5369;
    float _5529 = _5363;
    float _5531 = _5357;
    float _5533 = _5337;
    float _5535 = _5377;
    float _5537 = fma(_3988, -0.5, 0.5);
    float _5539 = precise::clamp(_5537, 0.0, 1.0);
    float _5541 = -_5525;
    float _5543 = _5541 + _5527;
    float _5545 = _5353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5547 = -_5529;
    float _5549 = _5547 + _5531;
    float _5551 = fma(_5539, _5543, _5525);
    out.m_110.x = 0.0;
    float _5553 = -_5533;
    float _5555 = _5553 + _5535;
    float _5557 = fma(_5539, _5549, _5529);
    float _5559 = _5551 * 0.586610972881317138671875;
    out.m_65.x = _5545;
    bool _5561 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5563 = fma(_5539, _5555, _5533);
    float _5565 = fma(_5557, 0.298911988735198974609375, _5559);
    bool _5567 = _4885 > 0.0;
    bool _5569 = isnan(_4885);
    bool _5571 = _5567 || _5569;
    bool _5573 = isnan(0.0);
    bool _5575 = _5571 || _5573;
    float _5577 = fma(_5563, 0.114477999508380889892578125, _5565);
    float _5579 = -_5577;
    float _5581 = _5557 + _5579;
    float _5583 = -_5577;
    float _5585 = _5551 + _5583;
    float _5587 = -_5577;
    float _5589 = _5563 + _5587;
    float _5591 = fma(_5581, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    float _5593 = fma(_5585, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    float _5595 = fma(_5589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    bool _5597 = !_5561;
    if (!_5597)
    {
        float _5599 = -_4620;
        float _5601 = _5599 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5603 = -_4622;
        float _5605 = _5603 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5607 = -_4624;
        float _5609 = _5607 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5611 = _5601 * _5601;
        float _5613 = fma(_5605, _5605, _5611);
        float _5615 = fma(_5609, _5609, _5613);
        float _5617 = sqrt(_5615);
        float _5619 = rsqrt(_5615);
        float _5621 = -_5617;
        float _5623 = _5621 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5625 = _5623 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5627 = precise::clamp(_5625, 0.0, 1.0);
        float _5629 = _5605 * _5619;
        float _5631 = _5601 * _5619;
        float _5633 = abs(_5627);
        float _5635 = log2(_5633);
        float _5637 = _5609 * _5619;
        float _5639 = _5629 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5641 = _3988 * _5631;
        float _5643 = -_5631;
        float _5645 = -_5639;
        float _5647 = fma(_5643, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5645);
        float _5649 = fma(_3984, _5629, _5641);
        float _5651 = -_5637;
        float _5653 = fma(_5651, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5647);
        float _5655 = fma(_3992, _5637, _5649);
        float _5657 = precise::clamp(_5655, 0.0, 1.0);
        float _5659 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5661 = _5653 + _5659;
        float _5663 = _5635 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5665 = _5661 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        float _5669 = exp2(_5663);
        float _5671 = _5669 * _5667;
        float _5673 = _5657 * _5671;
        float _5675 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5677 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5679 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _5675;
        out.m_110.y = _5677;
        out.m_110.z = _5679;
    }
    out.m_112.x = _5591;
    out.m_112.y = _5593;
    out.m_112.z = _5595;
    if (_5575)
    {
        return out;
    }
    out.m_65.x = 0.0;
    float _5681 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5681;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5439 = false;
    bool _4040 = false;
    bool _571 = false;
    bool _465 = false;
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_58.w;
    float _128 = in.m_60.w;
    float _130 = trunc(_126);
    int _133 = int(_130);
    float _135 = -_128;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _137;
    bool _141 = _133 >= 1;
    float _143 = 0.0;
    float _145 = _128;
    float _147 = _137;
    if (!_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _143;
    if (!_141)
    {
        out.m_65.x = 0.0;
    }
    int _151 = 0;
    if (!_141)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    int _157 = _155;
    if (!_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5749 = as_type<float>(_155);
        out.gl_Position.z = _5749;
    }
    if (!_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _159 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_128);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = float(_133);
    bool _171 = _137 >= _169;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    float _177 = 1.0 / _169;
    if (_175)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _179 = _145;
    if (_175)
    {
        out.m_65.x = 0.0;
    }
    float _181 = _137 * _177;
    float _183 = _181;
    if (_175)
    {
        float _185 = _179 * 5.0;
        _157 = as_type<int>(_185);
    }
    int _187 = _157;
    out.m_63.x = _181;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5812 = as_type<float>(_187);
        out.gl_Position.z = _5812;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_70.x;
    float _193 = in.m_70.y;
    float _195 = in.m_70.z;
    float _197 = in.m_72.x;
    float _199 = in.m_72.y;
    float _201 = in.m_72.z;
    float _203 = in.m_74.x;
    float _205 = in.m_74.y;
    float _207 = in.m_74.z;
    float _209 = in.m_76.x;
    float _211 = in.m_76.y;
    float _213 = in.m_76.z;
    int _215 = as_type<int>(_189) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_189) & 2;
    bool _221 = _219 != 0;
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _225 = _193 * _199;
    float _227 = _193 * _205;
    float _229 = fma(_191, _197, _225);
    float _231 = _193 * _211;
    float _233 = fma(_191, _203, _227);
    float _235 = fma(_195, _201, _229);
    float _237 = fma(_191, _209, _231);
    float _239 = fma(_195, _207, _233);
    float _241 = fma(_195, _213, _237);
    bool _243 = !_217;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_221;
    float _249 = _247 ? (-0.5) : 0.5;
    bool _251 = !_223;
    float _253 = _239;
    float _255 = _241;
    float _257 = _235;
    float _275;
    if (!_251)
    {
        float _259 = in.m_78.x;
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _259 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        _275 = _181;
    }
    _277 = false;
    float _279 = _275;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _279 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _279 + _285;
    bool _289 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_279);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _279 + _313;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _319 = 1.0 / _307;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _311;
    float _325 = _315 * _319;
    bool _327 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_279);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _283 * _321;
    bool _341 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _343 = isnan(_279);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -_299;
    float _355 = _353 + 1.0;
    bool _357 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _359 = isnan(_279);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = _351 * _355;
    float _375 = _287 * _323;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = _367 * _371;
    float _395 = -_367;
    float _397 = _395 + 1.0;
    float _399 = fma(_387, _339, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = fma(_379, _339, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _403 = _337 * _397;
    float _405 = -_337;
    float _407 = _405 + 1.0;
    float _409 = fma(_391, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _411 = _399 * _403;
    float _413 = _401 * _403;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _415;
    float _419 = fma(_383, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _421;
    float _425 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _427 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _429 = fma(_417, _375, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _431 = fma(_423, _375, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _433 = fma(_409, _393, _425);
    float _435 = fma(_419, _393, _427);
    float _437 = fma(_429, _373, _433);
    float _439 = fma(_431, _373, _435);
    float _441 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _437);
    float _443 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _439);
    bool _445 = !_317;
    float _463;
    if (!_445)
    {
        float _447 = in.m_78.x;
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _451 = _447 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        _463 = _181;
    }
    _465 = false;
    float _467 = _463;
    float _469 = in.m_80.x;
    float _471 = in.m_80.y;
    bool _473 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = isnan(_467);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _489 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _491 = isnan(_467);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _507 = _467 + _505;
    float _509 = -_483;
    float _511 = _509 + 1.0;
    bool _513 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _515 = 1.0 / _487;
    float _517 = _499 * _511;
    float _519 = -_499;
    float _521 = _519 + 1.0;
    float _523 = _443 * _471;
    float _525 = _441 * _469;
    float _527 = _503 * _515;
    float _529 = fma(_527, _507, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = _529 * _517;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _537 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _541 = _535 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[116].x, _539);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _549 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_82.x = _541;
    out.m_82.y = _537;
    out.m_82.z = _549;
    out.m_82.w = _547;
    bool _551 = !_513;
    float _569;
    if (!_551)
    {
        float _553 = in.m_78.x;
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _557 = _553 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        _569 = _181;
    }
    _571 = false;
    float _573 = _569;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _577 = _573 + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _587;
    bool _591 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _593 = isnan(_573);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = 1.0 / _581;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _613 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _615 = isnan(_573);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    bool _625 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_573);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = 1.0 / _585;
    float _639 = -_623;
    float _641 = _639 + 1.0;
    bool _643 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _645 = _589 * _603;
    bool _647 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _649 = isnan(_573);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _607;
    float _661 = -_601;
    float _663 = _661 + 1.0;
    float _665 = fma(_645, _577, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _667 = _601 * _641;
    float _669 = -_657;
    float _671 = _669 + 1.0;
    float _673 = _657 * _663;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _679;
    float _683 = 1.0 / _611;
    float _685 = _635 * _671;
    float _687 = _677 * _637;
    float _689 = -_635;
    float _691 = _689 + 1.0;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _697 = _665 * _685;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _701 = _573 + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _705 = _573 + _703;
    float _707 = _681 * _659;
    bool _709 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _711 = isnan(_573);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = fma(_687, _701, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _723 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[131].x, _697);
    float _725 = fma(_707, _705, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _729 = _573 + _727;
    float _731 = -_719;
    float _733 = _731 + 1.0;
    float _735 = fma(_721, _673, _723);
    float _737 = _695 * _683;
    float _739 = _623 * _733;
    float _741 = fma(_725, _667, _735);
    float _743 = fma(_737, _729, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _747 = fma(_743, _739, _741);
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = _745 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _755 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[135].x, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_84.x = _751;
    out.m_84.y = _757;
    out.m_84.z = _759;
    out.m_84.w = _761;
    bool _763 = !_643;
    float _765 = _761;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _769 = _751;
    if (!_763)
    {
        float _771 = in.m_78.x;
        float _773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _775 = _771 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _777 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _779 = _777 * _773;
        float _781 = floor(_779);
        float _783 = -_781;
        float _785 = _779 + _783;
        _183 = _785;
    }
    float _787 = _183;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _791 = int(_789);
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _795 = int(_793);
    float _797 = float(_791);
    float _799 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _801 = int(_799);
    float _803 = float(_795);
    float _805 = 1.0 / _797;
    float _807 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _809 = int(_807);
    float _811 = float(uint(_801));
    int _813 = ~_801;
    int _815 = _813 + 1;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _819 = _817 != 0;
    float _821 = 1.0 / _803;
    float _823 = _805 * _137;
    float _825 = 1.0 / _811;
    float _827 = float(uint(_809));
    if (_819)
    {
        _765 = 1.0;
    }
    float _829 = _765;
    int _831 = 0;
    float _833 = _829;
    if (_819)
    {
        _831 = 0;
    }
    int _835 = _831;
    float _837 = trunc(_823);
    int _839 = int(_837);
    float _841 = _821 * _137;
    float _843 = 1.0 / _827;
    int _845 = as_type<int>(_825) + (-2);
    float _847 = trunc(_841);
    int _849 = int(_847);
    float _851 = float(uint(_839));
    float _853 = as_type<float>(_845) * _851;
    int _855 = as_type<int>(_843) + (-2);
    float _857 = _851;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _861 = as_type<int>(_853);
    int _863 = _835;
    if (_819)
    {
        float _865 = in.m_78.x;
        float _867 = in.m_78.y;
        _857 = _865;
        _859 = _867;
    }
    float _869 = _857;
    float _871 = _859;
    float _873 = trunc(_853);
    float _875 = precise::max(_873, 0.0);
    uint _878 = uint(_875);
    int _880 = ~_809;
    int _882 = _880 + 1;
    float _884 = float(uint(_849));
    if (_819)
    {
        _861 = 0;
    }
    int _886 = _861;
    float _888 = as_type<float>(_855) * _884;
    float _890 = trunc(_888);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    int _896 = _815 * int(_878);
    int _898 = _896 + _839;
    float _900 = float(uint(_898));
    float _902 = _900;
    float _904 = _869;
    float _906 = _871;
    int _908 = _886;
    if (_819)
    {
        _767 = _869;
    }
    float _910 = _767;
    float _912 = as_type<float>(_845) * _900;
    float _914 = _910;
    if (_819)
    {
        _769 = _910;
    }
    float _916 = _769;
    float _918 = _916;
    if (_819)
    {
        _902 = _871;
    }
    float _920 = _902;
    float _922 = trunc(_912);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _882 * int(_894);
    int _930 = _928 + _849;
    float _932 = float(uint(_930));
    float _934 = as_type<float>(_855) * _932;
    float _936 = _932;
    float _938 = _934;
    float _940 = _920;
    if (_819)
    {
        _936 = 1.0;
    }
    float _942 = _936;
    float _944 = trunc(_934);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    float _950 = _942;
    if (_819)
    {
        _938 = _910;
    }
    float _952 = _938;
    float _954 = _952;
    if (!_819)
    {
        float _956 = in.m_78.x;
        float _958 = in.m_78.y;
        float _960 = in.m_78.z;
        float _962 = _956 * 3.1415927410125732421875;
        float _964 = _962 * 0.15915493667125701904296875;
        float _966 = _958 * 3.1415927410125732421875;
        float _968 = _966 * 0.15915493667125701904296875;
        float _970 = _964 * 6.283185482025146484375;
        float _972 = sin(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        _833 = 7.345489978790283203125;
        _904 = _956;
        _950 = 5.839270114898681640625;
        _954 = _960;
        _906 = _958;
        _914 = _958;
        _863 = 1;
        _908 = 2;
        _918 = _972;
        _940 = _976;
    }
    float _978 = _833;
    float _980 = _904;
    float _982 = _950;
    float _984 = _954;
    float _986 = _906;
    float _988 = _914;
    int _990 = _863;
    int _992 = _908;
    float _994 = _918;
    float _996 = _940;
    float _998 = _978 * _980;
    float _1000 = _982 * _984;
    int _1002 = int(_894) + int(_948);
    float _1004 = in.m_78.z;
    float _1006 = in.m_78.w;
    float _1008 = floor(_998);
    int _1010 = ~_809;
    int _1012 = _1010 + 1;
    float _1014 = _986 * 2.0;
    int _1016 = int(_878) + int(_926);
    float _1018 = _978 * _988;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1022 = _787 + _1020;
    int _1024 = ~_801;
    int _1026 = _1024 + 1;
    float _1028 = floor(_1000);
    float _1030 = float(_809);
    int _1032 = _1012 * _1002;
    int _1034 = _1032 + _849;
    int _1036 = _1026 * _1016;
    int _1038 = _1036 + _839;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1042 = _787 + _1040;
    bool _1044 = uint(_1034) >= uint(_809);
    float _1046 = -_1008;
    float _1048 = _998 + _1046;
    bool _1050 = uint(_1038) >= uint(_801);
    float _1052 = floor(_1014);
    bool _1054 = !_1044;
    int _1056 = _1054 ? 0 : (-1);
    float _1058 = _1048 * _1030;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1062 = _1060 != 0;
    int _1064 = ~_1002;
    int _1066 = _1064 + _1056;
    int _1068 = _1066 + 1;
    float _1070 = -_1028;
    float _1072 = _1000 + _1070;
    bool _1074 = !_1050;
    int _1076 = _1074 ? 0 : (-1);
    float _1078 = trunc(_1058);
    int _1080 = int(_1078);
    bool _1082 = !_1062;
    int _1084 = _1082 ? 0 : 1;
    bool _1086 = _1004 > 0.5;
    float _1088 = float(_849);
    bool _1090 = _986 > 0.5;
    int _1092 = ~_1016;
    int _1094 = _1092 + _1076;
    int _1096 = _1094 + 1;
    bool _1098 = _1088 >= _1030;
    bool _1100 = isnan(_1088);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(_1030);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1120 = _1118 != 0;
    int _1122 = _801 * _1096;
    int _1124 = _1122 + _839;
    float _1126 = -_249;
    int _1128 = _1086 ? as_type<int>(_1126) : as_type<int>(_249);
    float _1130 = trunc(_1108);
    int _1132 = int(_1130);
    float _1134 = -_245;
    int _1136 = _1090 ? as_type<int>(_1134) : as_type<int>(_245);
    int _1138 = abs(_1084);
    bool _1140 = !_1120;
    float _1142 = _1140 ? _249 : as_type<float>(_1128);
    int _1144 = _809 * _1068;
    int _1146 = _1144 + _849;
    bool _1148 = !_1116;
    float _1150 = _1148 ? _245 : as_type<float>(_1136);
    int _1152 = _1080 * _1138;
    int _1154 = _1152 + _849;
    float _1156 = float(_801);
    float _1158 = _177 * _137;
    float _1160 = float(_839);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1172 = _1170 != 0;
    float _1174 = _1030 * _1158;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1178 = _1176 != 0;
    bool _1180 = _1160 >= _1156;
    bool _1182 = isnan(_1160);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan(_1156);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = trunc(_1174);
    int _1198 = int(_1196);
    bool _1200 = !_1164;
    int _1202 = _1200 ? 0 : 1;
    bool _1204 = !_1172;
    int _1206 = _1204 ? 0 : 1;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1218 = _1216 != 0;
    bool _1220 = !_1178;
    float _1222 = _1220 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1224 = trunc(_1190);
    int _1226 = int(_1224);
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1230 = _1228 != 0;
    bool _1232 = !_1210;
    int _1234 = _1232 ? 0 : 1;
    bool _1236 = _809 == 0;
    int _1238 = ~_1132;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    bool _1244 = !_1236;
    int _1246 = _1244 ? _1146 : (-1);
    float _1248 = _1072 * _1156;
    int _1250 = _809 + (-1);
    int _1252 = _1246 * _1242;
    bool _1254 = !_1214;
    int _1256 = _1254 ? 0 : 1;
    float _1258 = _1156 * _1158;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1262 = _1260 != 0;
    int _1264 = _1132 * _1250;
    int _1266 = _1264 + _1252;
    int _1268 = abs(_1194);
    float _1270 = as_type<float>(_1132);
    float _1272 = _1222;
    float _1274 = as_type<float>(_992);
    float _1276 = _1150;
    if (_1230)
    {
        float _1278 = in.m_78.w;
        _1270 = _1278;
    }
    float _1280 = _1270;
    bool _1282 = !_1262;
    float _1284 = _1282 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1286 = trunc(_1248);
    int _1288 = int(_1286);
    int _1290 = abs(_1256);
    bool _1292 = _801 == 0;
    int _1294 = abs(_1202);
    float _1296 = trunc(_1258);
    int _1298 = int(_1296);
    int _1300 = ~_1226;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    bool _1306 = !_1292;
    int _1308 = _1306 ? _1124 : (-1);
    int _1310 = _1266 * _1268;
    int _1312 = _801 + (-1);
    int _1314 = _1308 * _1304;
    int _1316 = abs(_1206);
    int _1318 = _1198 * _1294;
    int _1320 = _1318 + _1310;
    int _1322 = abs(as_type<int>(_1284));
    int _1324 = _1226 * _1312;
    int _1326 = _1324 + _1314;
    int _1328 = abs(as_type<int>(_1222));
    float _1330 = _1284;
    if (_1230)
    {
        float _1332 = _1280 * 3.1415927410125732421875;
        _1272 = _1332;
    }
    float _1334 = _1272;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1338 = _1336 != 0;
    int _1340 = _1154 * _1316;
    int _1342 = _1340 + _1320;
    int _1344 = abs(_1234);
    int _1346 = _1288 * _1322;
    int _1348 = _1346 + _839;
    bool _1350 = !_1218;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = _1326 * _1290;
    bool _1356 = !_1338;
    int _1358 = _1356 ? 0 : 1;
    float _1360 = _1334;
    bool _1362 = _1338;
    if (_1230)
    {
        float _1364 = _1334 * 0.15915493667125701904296875;
        _1360 = _1364;
    }
    float _1366 = _1360;
    int _1368 = _1080 * _1328;
    int _1370 = _1368 + _1342;
    int _1372 = abs(_1352);
    float _1374 = _980 * 2.0;
    int _1376 = abs(_1358);
    int _1378 = _1298 * _1344;
    int _1380 = _1378 + _1354;
    float _1382 = _1366;
    if (_1230)
    {
        float _1384 = _1366 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        _1382 = _1386;
    }
    float _1388 = _1382;
    float _1390 = float(uint(_1370));
    float _1392 = 0.0;
    if (!_1230)
    {
        _1392 = _245;
    }
    float _1394 = _1392;
    int _1396 = _1348 * _1372;
    int _1398 = _1396 + _1380;
    int _1400 = ~_801;
    int _1402 = _1400 + 1;
    float _1404 = as_type<float>(_855) * _1390;
    bool _1406 = _809 == 0;
    int _1408 = _1288 * _1376;
    int _1410 = _1408 + _1398;
    float _1412 = -_245;
    int _1414 = _1086 ? as_type<int>(_1412) : as_type<int>(_245);
    float _1416 = floor(_1374);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1420 = _1418 != 0;
    float _1422 = float(uint(_1410));
    bool _1424 = !_1420;
    float _1426 = _1424 ? _245 : as_type<float>(_1414);
    float _1428 = _1394;
    if (_1230)
    {
        bool _1430 = _1388 > 0.5;
        _1362 = _1430;
    }
    bool _1432 = _1362;
    float _1434 = trunc(_1404);
    float _1436 = precise::max(_1434, 0.0);
    uint _1438 = uint(_1436);
    float _1440 = as_type<float>(_845) * _1422;
    int _1442 = ~_809;
    int _1444 = _1442 + 1;
    if (_1230)
    {
        float _1446 = -_245;
        float _1448 = _1432 ? _1446 : _245;
        _1428 = _1448;
    }
    float _1450 = _1428;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1454 = _1452 != 0;
    float _1456 = trunc(_1440);
    float _1458 = precise::max(_1456, 0.0);
    uint _1460 = uint(_1458);
    int _1462 = _1444 * int(_1438);
    int _1464 = _1462 + _1370;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1470 = as_type<float>(_1380);
    float _1472 = 1.4012984643248170709237295832899e-45;
    if (_1454)
    {
        float _1474 = in.m_78.x;
        _1470 = _1474;
    }
    float _1476 = _1470;
    float _1478 = 0.0;
    if (!_1454)
    {
        _1478 = _249;
    }
    float _1480 = _1478;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1484 = float(uint(_1464));
    int _1486 = _1402 * int(_1460);
    int _1488 = _1486 + _1410;
    float _1490 = as_type<float>(_855) * _1484;
    float _1492 = float(uint(_1488));
    float _1494 = trunc(_1490);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1504 = as_type<float>(_845) * _1492;
    int _1506 = ~_809;
    int _1508 = _1506 + 1;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1512 = trunc(_1504);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1522 = int(_1438) + int(_1498);
    float _1524 = as_type<float>(_1498);
    float _1526 = _1480;
    if (_1454)
    {
        float _1528 = _1476 * 3.1415927410125732421875;
        _1524 = _1528;
    }
    float _1530 = _1524;
    int _1532 = ~_801;
    int _1534 = _1532 + 1;
    float _1536 = 1.0 / _1520;
    int _1538 = _1508 * _1522;
    int _1540 = _1538 + _1370;
    float _1542 = _1530;
    if (_1454)
    {
        float _1544 = _1530 * 0.15915493667125701904296875;
        _1542 = _1544;
    }
    float _1546 = _1542;
    int _1548 = int(_1460) + int(_1516);
    bool _1550 = uint(_1540) >= uint(_809);
    float _1552 = _1546;
    if (_1454)
    {
        float _1554 = _1546 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1552 = _1556;
    }
    float _1558 = _1552;
    bool _1560 = !_1550;
    int _1562 = _1560 ? 0 : (-1);
    int _1564 = _1534 * _1548;
    int _1566 = _1564 + _1410;
    int _1568 = ~_1522;
    int _1570 = _1568 + _1562;
    int _1572 = _1570 + 1;
    bool _1574 = uint(_1566) >= uint(_801);
    int _1576 = _809 * _1572;
    int _1578 = _1576 + _1370;
    bool _1580 = !_1574;
    int _1582 = _1580 ? 0 : (-1);
    bool _1584 = _1574;
    if (_1454)
    {
        bool _1586 = _1558 > 0.5;
        _1584 = _1586;
    }
    bool _1588 = _1584;
    bool _1590 = !_1406;
    int _1592 = _1590 ? _1578 : (-1);
    if (_1454)
    {
        float _1594 = -_249;
        float _1596 = _1588 ? _1594 : _249;
        _1526 = _1596;
    }
    float _1598 = _1526;
    int _1600 = ~_1548;
    int _1602 = _1600 + _1582;
    int _1604 = _1602 + 1;
    int _1606 = _1592 & 3;
    bool _1608 = _1606 != 0;
    bool _1610 = _1006 > 0.5;
    int _1612 = _801 * _1604;
    int _1614 = _1612 + _1410;
    float _1616 = -_249;
    int _1618 = _1090 ? as_type<int>(_1616) : as_type<int>(_249);
    bool _1620 = uint(_1606) > 1u;
    float _1622 = -_249;
    int _1624 = _1610 ? as_type<int>(_1622) : as_type<int>(_249);
    int _1626 = _1592 & 3;
    bool _1628 = _1626 != 0;
    bool _1630 = !_1292;
    int _1632 = _1630 ? _1614 : (-1);
    int _1634 = _1628 ? 0 : 1;
    int _1636 = _1632 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = ~_1634;
    int _1642 = _1640 + 1;
    int _1644 = _1642 + 1;
    int _1646 = _1644;
    if (!_1620)
    {
        int _1648 = ~_1634;
        int _1650 = _1648 + 1;
        _1646 = _1650;
    }
    int _1652 = _1646;
    bool _1654 = uint(_1636) >= 2u;
    int _1656 = _1632 & 3;
    bool _1658 = _1656 != 0;
    int _1660 = _1654 ? 0 : 1;
    bool _1662 = _1636 != 3;
    int _1664 = ~_1660;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    int _1670 = _1658 ? 0 : 1;
    bool _1672 = uint(_1636) > 1u;
    int _1674 = ~_1670;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    int _1680 = int(_1662);
    int _1682 = _1672 ? 2 : 0;
    int _1684 = _1680 | _1682;
    int _1686 = _1638 ? 4 : 0;
    int _1688 = _1684 | _1686;
    int _1690 = _1112 ? 8 : 0;
    int _1692 = _1688 | _1690;
    int _1694 = _1608 ? 16 : 0;
    int _1696 = _1692 | _1694;
    int _1698 = _1292 ? 32 : 0;
    int _1700 = _1696 | _1698;
    int _1702 = _1406 ? 64 : 0;
    int _1704 = _1700 | _1702;
    int _1706 = _1704 & 4;
    int _1708 = int(_1662);
    int _1710 = _1672 ? 2 : 0;
    int _1712 = _1708 | _1710;
    int _1714 = _1638 ? 4 : 0;
    int _1716 = _1712 | _1714;
    int _1718 = _1112 ? 8 : 0;
    int _1720 = _1716 | _1718;
    int _1722 = _1608 ? 16 : 0;
    int _1724 = _1720 | _1722;
    int _1726 = _1292 ? 32 : 0;
    int _1728 = _1724 | _1726;
    int _1730 = _1406 ? 64 : 0;
    int _1732 = _1728 | _1730;
    int _1734 = _1732 & 16;
    int _1736 = _1668;
    int _1738 = _1678;
    if (_1662)
    {
        int _1740 = ~_1660;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    int _1746 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1748 = _1746 != 0;
    float _1750 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1752 = int(_1750);
    if (!_1672)
    {
        int _1754 = ~_1670;
        int _1756 = _1754 + 1;
        _1738 = _1756;
    }
    int _1758 = _1738;
    bool _1760 = !_1748;
    float _1762 = _1760 ? _249 : as_type<float>(_1618);
    int _1764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1766 = _1764 != 0;
    bool _1768 = !_1112;
    float _1770 = _1768 ? _249 : as_type<float>(_1624);
    float _1772 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1774 = int(_1772);
    bool _1776 = !_1766;
    int _1778 = _1776 ? 0 : 1;
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1782 = _1780 != 0;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1794 = _1792 != 0;
    int _1796 = abs(_1758);
    float _1798 = float(uint(_1752));
    bool _1800 = !_1782;
    int _1802 = _1800 ? 0 : 1;
    bool _1804 = _980 > 0.5;
    float _1806 = 1.0 / _1798;
    int _1808 = ~_1752;
    int _1810 = _1808 + 1;
    float _1812 = float(_1774);
    float _1814 = -_245;
    int _1816 = _1804 ? as_type<int>(_1814) : as_type<int>(_245);
    int _1818 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1820 = _1818 != 0;
    float _1822 = 1.0 / _1812;
    int _1824 = ~_1752;
    int _1826 = _1824 + 1;
    bool _1828 = !_1820;
    float _1830 = _1828 ? _245 : as_type<float>(_1816);
    bool _1832 = _990 != 1;
    int _1834 = as_type<int>(_1806) + (-2);
    bool _1836 = !_1786;
    int _1838 = _1836 ? 0 : 1;
    bool _1840 = _1052 >= 0.0;
    bool _1842 = isnan(_1052);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    int _1850 = abs(_1838);
    bool _1852 = !_1790;
    int _1854 = _1852 ? 0 : 1;
    float _1856 = _1822 * _137;
    float _1858 = _1806;
    if (!_1832)
    {
        _1858 = _986;
    }
    float _1860 = _1858;
    float _1862 = _1860;
    if (!_1832)
    {
        _1330 = _986;
    }
    float _1864 = _1330;
    float _1866 = trunc(_1856);
    int _1868 = int(_1866);
    float _1870 = _1864;
    if (!_1832)
    {
        _1472 = _1004;
    }
    float _1872 = _1472;
    float _1874 = _1872;
    if (_1832)
    {
        _1862 = _980;
    }
    float _1876 = _1862;
    if (_1832)
    {
        _1870 = _980;
    }
    float _1878 = _1870;
    if (_1832)
    {
        _1874 = _986;
    }
    float _1880 = _1874;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1466);
    float _1884 = float(uint(_1868));
    float _1886 = as_type<float>(_1834) * _1884;
    float _1888 = _1884;
    float _1890 = _1886;
    if (!_1832)
    {
        _1888 = _1004;
    }
    float _1892 = _1888;
    float _1894 = _1892;
    if (_1832)
    {
        _1894 = _986;
    }
    float _1896 = _1894;
    float _1898 = trunc(_1886);
    float _1900 = precise::max(_1898, 0.0);
    uint _1902 = uint(_1900);
    bool _1904 = _992 != 2;
    if (_1904)
    {
        _1274 = _980;
    }
    float _1906 = _1274;
    int _1908 = _1810 * int(_1902);
    int _1910 = _1908 + _1868;
    float _1912 = _1906;
    if (_1904)
    {
        _1890 = _986;
    }
    float _1914 = _1890;
    float _1916 = _1914;
    if (!_1904)
    {
        _1912 = _1004;
    }
    float _1918 = _1912;
    float _1920 = float(uint(_1910));
    if (!_1904)
    {
        _1916 = _980;
    }
    float _1922 = _1916;
    float _1924 = _1918 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1926 = _1416 >= 0.0;
    bool _1928 = isnan(_1416);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan(0.0);
    bool _1934 = _1930 || _1932;
    float _1936 = as_type<float>(_1834) * _1920;
    float _1938 = -_1468;
    float _1940 = fma(_1924, 2.0, _1938);
    int _1942 = _1934 ? 0 : 1;
    bool _1944 = _1416 > 0.0;
    float _1946 = trunc(_1936);
    float _1948 = precise::max(_1946, 0.0);
    uint _1950 = uint(_1948);
    int _1952 = ~_1942;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    float _1958 = floor(_1018);
    int _1960 = _1956;
    if (!_1944)
    {
        int _1962 = ~_1942;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    bool _1968 = _1052 > 0.0;
    int _1970 = int(_1902) + int(_1950);
    float _1972 = float(_1752);
    float _1974 = float(_1868);
    int _1976 = _1826 * _1970;
    int _1978 = _1976 + _1868;
    float _1980 = -_1958;
    float _1982 = _1018 + _1980;
    bool _1984 = _1974 >= _1972;
    bool _1986 = isnan(_1974);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(_1972);
    bool _1992 = _1988 || _1990;
    float _1994 = float(_1992);
    int _1996 = _1848 ? 0 : 1;
    bool _1998 = uint(_1978) >= uint(_1752);
    int _2000 = ~_1996;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = trunc(_1994);
    int _2008 = int(_2006);
    int _2010 = _2004;
    if (!_1968)
    {
        int _2012 = ~_1996;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    float _2018 = _1982 * _1972;
    bool _2020 = !_1998;
    int _2022 = _2020 ? 0 : (-1);
    float _2024 = _1972 * _1158;
    bool _2026 = !_1794;
    int _2028 = _2026 ? 0 : 1;
    float _2030 = _1004 * 2.0;
    int _2032 = ~_1970;
    int _2034 = _2032 + _2022;
    int _2036 = _2034 + 1;
    float _2038 = trunc(_2018);
    int _2040 = int(_2038);
    bool _2042 = _1706 != 0;
    int _2044 = abs(_1778);
    int _2046 = _1752 * _2036;
    int _2048 = _2046 + _1868;
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2052 = _2050 != 0;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2056 = _2054 != 0;
    int _2058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2060 = _2058 != 0;
    bool _2062 = _1752 == 0;
    float _2064 = floor(_2030);
    int _2066 = ~_2008;
    int _2068 = _2066 + 1;
    int _2070 = _2068 + 1;
    bool _2072 = !_2062;
    int _2074 = _2072 ? _2048 : (-1);
    float _2076 = float(uint(_1154));
    int _2078 = _1752 + (-1);
    int _2080 = _2074 * _2070;
    float _2082 = trunc(_2024);
    int _2084 = int(_2082);
    int _2086 = _2040 * _2044;
    int _2088 = _2086 + _1868;
    int _2090 = abs(_1802);
    int _2092 = _2008 * _2078;
    int _2094 = _2092 + _2080;
    float _2096 = float(uint(_1348));
    float _2098 = as_type<float>(_855) * _2076;
    bool _2100 = _2064 >= 0.0;
    bool _2102 = isnan(_2064);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan(0.0);
    bool _2108 = _2104 || _2106;
    float _2110 = as_type<float>(_845) * _2096;
    bool _2112 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2114 = isnan(0.0);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2120 = _2116 || _2118;
    float _2122 = trunc(_2098);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    int _2128 = _2094 * _1850;
    int _2130 = abs(_1854);
    float _2132 = trunc(_2110);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    int _2138 = _2084 * _2090;
    int _2140 = _2138 + _2128;
    float _2142 = float(uint(_2088));
    int _2144 = ~_809;
    int _2146 = _2144 + 1;
    int _2148 = _2088 * _2130;
    int _2150 = _2148 + _2140;
    int _2152 = _2108 ? 0 : 1;
    int _2154 = abs(_2028);
    bool _2156 = _2064 > 0.0;
    float _2158 = as_type<float>(_1834) * _2142;
    int _2160 = ~_801;
    int _2162 = _2160 + 1;
    int _2164 = _2146 * int(_2126);
    int _2166 = _2164 + _1154;
    int _2168 = _2162 * int(_2136);
    int _2170 = _2168 + _1348;
    float _2172 = float(uint(_2166));
    float _2174 = trunc(_2158);
    float _2176 = precise::max(_2174, 0.0);
    uint _2178 = uint(_2176);
    int _2180 = _2040 * _2154;
    int _2182 = _2180 + _2150;
    int _2184 = ~_1752;
    int _2186 = _2184 + 1;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2190 = float(uint(_2170));
    float _2192 = as_type<float>(_855) * _2172;
    float _2194 = float(uint(_2182));
    float _2196 = _980 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2198 = ~_2152;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = as_type<float>(_845) * _2190;
    int _2206 = _2202;
    if (!_2156)
    {
        int _2208 = ~_2152;
        int _2210 = _2208 + 1;
        _2206 = _2210;
    }
    int _2212 = _2206;
    float _2214 = as_type<float>(_1834) * _2194;
    float _2216 = -_2188;
    float _2218 = fma(_2196, 2.0, _2216);
    float _2220 = trunc(_2192);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    int _2226 = _2186 * int(_2178);
    int _2228 = _2226 + _2088;
    int _2230 = ~_809;
    int _2232 = _2230 + 1;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2236 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2238 = float(uint(_2228));
    float _2240 = trunc(_2214);
    float _2242 = precise::max(_2240, 0.0);
    uint _2244 = uint(_2242);
    float _2246 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2234);
    float _2248 = _994 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _2250 = ~_1752;
    int _2252 = _2250 + 1;
    float _2254 = as_type<float>(_1834) * _2238;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2258 = -_2236;
    float _2260 = fma(_2248, 2.0, _2258);
    float _2262 = trunc(_2204);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    int _2268 = int(_2126) + int(_2224);
    float _2270 = _986 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2274 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2246);
    float _2276 = fma(_2270, -2.0, _2256);
    float _2278 = trunc(_2254);
    float _2280 = precise::max(_2278, 0.0);
    uint _2282 = uint(_2280);
    int _2284 = _2252 * int(_2244);
    int _2286 = _2284 + _2182;
    float _2288 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2272);
    float _2290 = _996 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2292 = _2232 * _2268;
    int _2294 = _2292 + _1154;
    float _2296 = _1876 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2298 = float(uint(_2286));
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2302 = int(_2136) + int(_2266);
    float _2304 = -_1482;
    float _2306 = fma(_2296, 2.0, _2304);
    bool _2308 = uint(_2294) >= uint(_809);
    float _2310 = as_type<float>(_1834) * _2298;
    float _2312 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2314 = log2(_2312);
    int _2316 = ~_801;
    int _2318 = _2316 + 1;
    float _2320 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2322 = !_2308;
    int _2324 = _2322 ? 0 : (-1);
    float _2326 = fma(_2290, -2.0, _1502);
    int _2328 = int(_2178) + int(_2282);
    int _2330 = _2318 * _2302;
    int _2332 = _2330 + _1348;
    int _2334 = ~_1752;
    int _2336 = _2334 + 1;
    float _2338 = trunc(_2310);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_2320, -2.0, _1510);
    float _2346 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2300);
    bool _2348 = uint(_2332) >= uint(_801);
    int _2350 = _2336 * _2328;
    int _2352 = _2350 + _2088;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2356 = _2314 * _137;
    bool _2358 = !_2348;
    int _2360 = _2358 ? 0 : (-1);
    float _2362 = -_137;
    float _2364 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2218);
    bool _2366 = uint(_2352) >= uint(_1752);
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2370 = ~_1752;
    int _2372 = _2370 + 1;
    float _2374 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2354);
    bool _2376 = !_2366;
    int _2378 = _2376 ? 0 : (-1);
    float _2380 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2368);
    int _2382 = int(_2244) + int(_2342);
    float _2384 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2386 = exp2(_2356);
    float _2388 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2276);
    int _2390 = _2372 * _2382;
    int _2392 = _2390 + _2182;
    float _2394 = fma(_2384, -2.0, _1500);
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2398 = uint(_2392) >= uint(_1752);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2402 = 1.0 + _2400;
    float _2404 = in.m_58.x;
    float _2406 = in.m_58.y;
    float _2408 = in.m_58.z;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2412 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2288);
    float _2414 = -_137;
    float _2416 = fma(_2414, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2260);
    float _2418 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2326);
    float _2420 = 1.0 / _2402;
    float _2422 = -_2386;
    float _2424 = _2422 + 1.0;
    float _2426 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1882);
    float _2428 = -_137;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2306);
    float _2432 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2344);
    float _2434 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _249);
    float _2436 = _2120 ? _2424 : 0.0;
    float _2438 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2410);
    bool _2440 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2442 = isnan(1.0);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2448 = _2444 || _2446;
    float _2450 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2396);
    float _2452 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2380);
    float _2454 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2438);
    float _2456 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2374);
    float _2458 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2346);
    float _2460 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2450);
    float _2462 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2394);
    float _2464 = -_137;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1940);
    bool _2468 = !_2398;
    int _2470 = _2468 ? 0 : (-1);
    float _2472 = _205 * _2406;
    float _2474 = _211 * _2406;
    float _2476 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_2448)
    {
        float _2478 = _2436 * _2420;
        _147 = _2478;
    }
    float _2480 = _147;
    float _2482 = _199 * _2406;
    float _2484 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2486 = fma(_203, _2404, _2472);
    bool _2488 = _1636 != 3;
    float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2492 = _2490 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2498 = fma(_197, _2404, _2482);
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2502 = _2500 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2504 = !_2056;
    int _2506 = _2504 ? 0 : 1;
    float _2508 = 1.0 / _2492;
    float _2510 = fma(_209, _2404, _2474);
    bool _2512 = _1734 != 0;
    float _2514 = fma(_207, _2408, _2486);
    bool _2516 = !_2042;
    int _2518 = _2516 ? 0 : 1;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2522 = _2520 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2524 = !_2488;
    int _2526 = _2524 ? 0 : (-1);
    float _2528 = _2484 * _2434;
    float _2530 = 1.0 / _2496;
    int _2532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2534 = _2532 != 0;
    float _2536 = fma(_213, _2408, _2510);
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2540 = _2538 != 0;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2548 = _2546 != 0;
    float _2550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _245);
    float _2552 = 1.0 / _2502;
    float _2554 = _2476 * _2550;
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2556;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2562 = _2560 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2564;
    float _2568 = fma(_201, _2408, _2498);
    float _2570 = 1.0 / _2522;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2576 = _2562 * _1536;
    float _2578 = _2566 * _2508;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2584 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2586 = isnan(_787);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2558 * _2530;
    float _2598 = 1.0 / _2544;
    bool _2600 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2602 = isnan(_787);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2608 = _2604 || _2606;
    float _2610 = float(_2608);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2614 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2612;
    float _2616 = -_2594;
    float _2618 = _2616 + 1.0;
    float _2620 = _2582 * _2552;
    bool _2622 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2624 = isnan(_787);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2610;
    float _2636 = _2634 + 1.0;
    float _2638 = _2610 * _2618;
    float _2640 = 1.0 / _2574;
    float _2642 = _2614 * _2570;
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2646 = _2644 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2648 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2650 = isnan(_787);
    bool _2652 = _2648 || _2650;
    bool _2654 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2656 = _2652 || _2654;
    float _2658 = float(_2656);
    float _2660 = -_2632;
    float _2662 = _2660 + 1.0;
    bool _2664 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2666 = isnan(_787);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = _2632 * _2636;
    float _2678 = _2646 * _2598;
    float _2680 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2682 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2680;
    float _2684 = _2658 * _2662;
    float _2686 = -_2658;
    float _2688 = _2686 + 1.0;
    bool _2690 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2692 = isnan(_787);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = -_2674;
    float _2704 = _2702 + 1.0;
    bool _2706 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2708 = isnan(_787);
    bool _2710 = _2706 || _2708;
    bool _2712 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2714 = _2710 || _2712;
    float _2716 = float(_2714);
    float _2718 = _2674 * _2688;
    float _2720 = _2682 * _2640;
    float _2722 = in.m_72.w;
    float _2724 = _2700 * _2704;
    float _2726 = -_2700;
    float _2728 = _2726 + 1.0;
    bool _2730 = _787 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2732 = isnan(_787);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = in.m_74.w;
    float _2744 = -_2716;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2596, _1022, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2750 = _2716 * _2728;
    float _2752 = in.m_76.w;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2756 = _787 + _2754;
    float _2758 = _2740 * _2746;
    float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2762 = _787 + _2760;
    float _2764 = fma(_2578, _1042, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2766 = fma(_2620, _2756, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2768 = _2748 * _2758;
    float _2770 = -_2740;
    float _2772 = _2770 + 1.0;
    float _2774 = fma(_2576, _2762, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2776 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2778 = _787 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2782 = _787 + _2780;
    float _2784 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2768);
    float _2786 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2788 = _787 + _2786;
    bool _2790 = !_2052;
    int _2792 = _2790 ? 0 : 1;
    float _2794 = fma(_2678, _2782, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2796 = fma(_2774, _2750, _2784);
    float _2798 = fma(_2720, _2788, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2800 = _2568 + _2722;
    float _2802 = _986 + _980;
    float _2804 = fma(_2764, _2724, _2796);
    float _2806 = _2514 + _2742;
    float _2808 = _2802 + (-1.0);
    float _2810 = fma(_2642, _2778, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2812 = _2536 + _2752;
    int _2814 = abs(_2792);
    float _2816 = in.m_86.x;
    float _2818 = in.m_86.y;
    float _2820 = in.m_86.z;
    float _2822 = fma(_2808, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2824 = float(_2212);
    float _2826 = _980 + _1004;
    float _2828 = float(_2814);
    float _2830 = _980 + (-0.5);
    float _2832 = _986 + _1004;
    float _2834 = fma(_2766, _2718, _2804);
    float _2836 = _2828 * _2824;
    float _2838 = _2826 + (-1.0);
    float _2840 = _2832 + (-1.0);
    int _2842 = abs(_2506);
    float _2844 = _2836 * (-2.0);
    float _2846 = _1598 + (-0.5);
    float _2848 = fma(_2840, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2850 = !_2060;
    int _2852 = _2850 ? 0 : 1;
    float _2854 = fma(_2810, _2684, _2834);
    float _2856 = -_2846;
    float _2858 = -_2418;
    float _2860 = fma(_2856, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2858);
    float _2862 = float(_1966);
    float _2864 = fma(_2822, _2844, _2822);
    int _2866 = abs(_2852);
    float _2868 = _1450 + 0.5;
    float _2870 = fma(_2844, _2816, _2816);
    float _2872 = float(_2842);
    float _2874 = fma(_2794, _2676, _2854);
    float _2876 = _1762 + (-0.5);
    float _2878 = fma(_2830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2870);
    float _2880 = fma(_2838, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2882 = _2872 * _2862;
    float _2884 = _986 + (-0.5);
    float _2886 = fma(_2864, _2480, _2878);
    float _2888 = float(_2016);
    float _2890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2892 = float(_2866);
    float _2894 = _2882 * (-2.0);
    float _2896 = _2886 * 0.15915493667125701904296875;
    float _2898 = fma(_2868, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2416);
    float _2900 = -_2876;
    float _2902 = -_2388;
    float _2904 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2902);
    float _2906 = _2892 * _2888;
    float _2908 = fma(_2894, _2818, _2818);
    float _2910 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2912 = -_2274;
    float _2914 = _2912 + 1.0;
    float _2916 = _2906 * (-2.0);
    float _2918 = -_2412;
    float _2920 = _2918 + 1.0;
    float _2922 = fma(_2848, _2894, _2848);
    float _2924 = fma(_2884, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2908);
    float _2926 = fma(_2880, _2916, _2880);
    float _2928 = fma(_2916, _2820, _2820);
    float _2930 = -_2914;
    float _2932 = fma(_2930, _1450, _2898);
    float _2934 = fma(_2920, _1598, _2860);
    float _2936 = _1004 + (-0.5);
    float _2938 = _2890 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2940 = fma(_2922, _2480, _2924);
    float _2942 = _1830 + 0.5;
    float _2944 = fma(_2936, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2928);
    out.m_88.x = _2932;
    out.m_88.y = _2934;
    float _2946 = fma(_2798, _2638, _2874);
    float _2948 = _2940 * 0.15915493667125701904296875;
    float _2950 = fma(_2926, _2480, _2944);
    float _2952 = _2910 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2954 = _1426 + 0.5;
    float _2956 = fma(_2942, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2364);
    float _2958 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2946);
    float _2960 = _2896 * 6.283185482025146484375;
    float _2962 = sin(_2960);
    float _2964 = fma(_2952, _2954, _2430);
    float _2966 = _1770 + (-0.5);
    float _2968 = -_2452;
    float _2970 = _2968 + 1.0;
    float _2972 = -_2458;
    float _2974 = _2972 + 1.0;
    float _2976 = -_2426;
    float _2978 = _2976 + 1.0;
    float _2980 = -_2938;
    float _2982 = -_2462;
    float _2984 = fma(_2980, _2966, _2982);
    float _2986 = -_2454;
    float _2988 = _2986 + 1.0;
    float _2990 = _2950 * 0.15915493667125701904296875;
    float _2992 = _2948 * 6.283185482025146484375;
    float _2994 = sin(_2992);
    int _2996 = ~_2302;
    int _2998 = _2996 + _2360;
    int _3000 = _2998 + 1;
    float _3002 = fma(_1762, _2970, _2904);
    int _3004 = _1632 >> 31;
    float _3006 = -_2988;
    float _3008 = fma(_1830, _3006, _2956);
    float _3010 = -_2974;
    float _3012 = fma(_1426, _3010, _2964);
    float _3014 = fma(_1770, _2978, _2984);
    int _3016 = _801 * _3000;
    int _3018 = _3016 + _1348;
    float _3020 = _2948 * 6.283185482025146484375;
    float _3022 = cos(_3020);
    int _3024 = _3004 & 3;
    out.m_90.x = _2958;
    int _3026 = ~_2268;
    int _3028 = _3026 + _2324;
    int _3030 = _3028 + 1;
    int _3032 = ~_2328;
    int _3034 = _3032 + _2378;
    int _3036 = _3034 + 1;
    out.m_92.x = _3008;
    out.m_92.y = _3002;
    out.m_92.z = _3012;
    out.m_92.w = _3014;
    bool _3038 = _801 == 0;
    float _3040 = _2990 * 6.283185482025146484375;
    float _3042 = cos(_3040);
    int _3044 = _809 * _3030;
    int _3046 = _3044 + _1154;
    float _3048 = _2962 * _2994;
    int _3050 = _1752 * _3036;
    int _3052 = _3050 + _2088;
    bool _3054 = !_3038;
    int _3056 = _3054 ? _3018 : (-1);
    float _3058 = _2896 * 6.283185482025146484375;
    float _3060 = cos(_3058);
    float _3062 = _2962 * _3022;
    int _3064 = _1632 + _3024;
    float _3066 = _2990 * 6.283185482025146484375;
    float _3068 = sin(_3066);
    int _3070 = _3064 >> 2;
    float _3072 = _2962 * _3042;
    int _3074 = _3070 << 4;
    int _3076 = _3074 + 656;
    float _3078 = _3072 * _2528;
    float _3080 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3082 = _3060 * _3022;
    float _3084 = _3060 * _2994;
    float _3086 = _3060 * _3042;
    float _3088 = _3022 * _3042;
    float _3090 = _2994 * _3042;
    float _3092 = _3086 * _2528;
    float _3094 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3096 = -_3084;
    float _3098 = fma(_3068, _3062, _3096);
    float _3100 = fma(_3068, _3082, _3048);
    float _3102 = fma(_3068, _3048, _3082);
    float _3104 = -_2528;
    float _3106 = _3068 * _3104;
    uint _3108 = uint(int(uint(_3076) >> uint(2)));
    uint _3110 = uint(int(uint(int(_3108)) >> uint(2)));
    int _3112 = int(_3108) & 3;
    float _3114 = (*spvDescriptorSet0.vp_c9)._m0[int(_3110)][_3112];
    int _3116 = int(_3108) + 1;
    uint _3118 = uint(int(uint(_3116) >> uint(2)));
    int _3120 = _3116 & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    float _3124 = -_3062;
    float _3126 = fma(_3068, _3084, _3124);
    float _3128 = fma(_3100, _2554, _3092);
    float _3130 = fma(_3088, _2554, _3106);
    float _3132 = fma(_3098, _2554, _3078);
    float _3134 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3136 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3138 = -_3068;
    float _3140 = fma(_3138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3094);
    float _3142 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3144 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3134);
    float _3146 = -_3068;
    float _3148 = fma(_3146, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3136);
    int _3150 = _3076 + 8;
    uint _3152 = uint(int(uint(_3150) >> uint(2)));
    uint _3154 = uint(int(uint(int(_3152)) >> uint(2)));
    int _3156 = int(_3152) & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = int(_3152) + 1;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    int _3164 = _3160 & 3;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[int(_3162)][_3164];
    float _3168 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3170 = _3100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3172 = -_3068;
    float _3174 = fma(_3172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3142);
    float _3176 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3178 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3168);
    float _3180 = fma(_3088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3170);
    float _3182 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3184 = _3126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3186 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3148);
    float _3188 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3140);
    float _3190 = fma(_3072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3174);
    float _3192 = fma(_3090, _3080, _3130);
    float _3194 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3176);
    float _3196 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3182);
    float _3198 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3184);
    float _3200 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3202 = fma(_3126, _3080, _3128);
    float _3204 = fma(_3102, _3080, _3132);
    int _3206 = abs(_2518);
    float _3208 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3178);
    float _3210 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3144);
    float _3212 = fma(_3098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3180);
    float _3214 = _249 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3216 = ~_2382;
    int _3218 = _3216 + _2470;
    int _3220 = _3218 + 1;
    float _3222 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3196);
    int _3224 = ~_1796;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    float _3230 = _3214 * _3186;
    float _3232 = _3214 * _3188;
    int _3234 = ~_3206;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    out.m_94.x = _3208;
    out.m_94.y = _3210;
    out.m_94.z = _3212;
    float _3240 = fma(_3200, _3210, _3230);
    float _3242 = fma(_3200, _3208, _3232);
    float _3244 = _3214 * _3190;
    int _3246 = _1752 * _3220;
    int _3248 = _3246 + _2182;
    float _3250 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3252 = _3228 * as_type<int>(_3122);
    float _3254 = fma(_3200, _3212, _3244);
    float _3256 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3258 = int(_3256);
    bool _3260 = !_2062;
    float _3262 = _3260 ? as_type<float>(_3248) : as_type<float>(0xffffffffu /* nan */);
    int _3264 = _3238 * as_type<int>(_3114);
    int _3266 = _3264 + _3252;
    int _3268 = abs(_2526);
    float _3270 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3272 = abs(_1744);
    float _3274 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3250);
    float _3276 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3198);
    float _3278 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3270);
    int _3280 = ~_3272;
    int _3282 = _3280 + 1;
    int _3284 = _3282 + 1;
    float _3286 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3274);
    int _3288 = ~_3268;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3278);
    float _3296 = _3202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3298 = _3284 * as_type<int>(_3158);
    int _3300 = _3298 + _3266;
    float _3302 = _3286 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3304 = _3294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3306 = abs(_3258);
    int _3308 = _3292 * as_type<int>(_3166);
    int _3310 = _3308 + _3300;
    int _3312 = as_type<int>(_3262) >> 31;
    float _3314 = _2800 + _3304;
    bool _3316 = !_2540;
    int _3318 = _3316 ? 0 : 1;
    float _3320 = _2812 + _3302;
    int _3322 = _3312 & 3;
    float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3326 = _3314 + _3324;
    bool _3328 = uint(_1606) >= 2u;
    float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3332 = _3320 + _3330;
    int _3334 = as_type<int>(_3262) + _3322;
    float _3336 = _3326 * _3326;
    int _3338 = _3328 ? 0 : 1;
    float _3340 = _3332 * _3332;
    int _3342 = _3334 >> 2;
    float _3344 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3194);
    bool _3346 = _1606 != 3;
    float _3348 = _3336 + _3340;
    int _3350 = _3342 << 4;
    int _3352 = _3350 + 800;
    float _3354 = fma(_3192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3296);
    int _3356 = abs(_3318);
    float _3358 = sqrt(_3348);
    float _3360 = float(uint(_3306));
    uint _3362 = uint(int(uint(_3352) >> uint(2)));
    uint _3364 = uint(int(uint(int(_3362)) >> uint(2)));
    int _3366 = int(_3362) & 3;
    float _3368 = (*spvDescriptorSet0.vp_c9)._m0[int(_3364)][_3366];
    int _3370 = int(_3362) + 1;
    uint _3372 = uint(int(uint(_3370) >> uint(2)));
    int _3374 = _3370 & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = _1592 >> 31;
    float _3380 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3354);
    float _3382 = float(uint(_3258));
    int _3384 = ~_3356;
    int _3386 = _3384 + 1;
    int _3388 = _3386 + 1;
    float _3390 = 1.0 / _3360;
    int _3392 = _3378 & 3;
    float _3394 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3396 = ~_3338;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    int _3402 = _3310 * _3388;
    int _3404 = _1592 + _3392;
    float _3406 = _2806 + _3394;
    int _3408 = _3400;
    float _3410 = _3262;
    float _3412 = _3314;
    float _3414 = _3320;
    float _3416 = _2800;
    if (_3346)
    {
        int _3418 = ~_3338;
        int _3420 = _3418 + 1;
        _3408 = _3420;
    }
    int _3422 = _3408;
    float _3424 = 1.0 / _3382;
    int _3426 = _3404 >> 2;
    int _3428 = _3056 * _3356;
    int _3430 = _3428 + _3402;
    bool _3432 = _3358 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3434 = _3426 << 4;
    int _3436 = _3434 + 368;
    int _3438 = abs(_3430);
    uint _3440 = uint(int(uint(_3436) >> uint(2)));
    uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
    int _3444 = int(_3440) & 3;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[int(_3442)][_3444];
    int _3448 = int(_3440) + 1;
    uint _3450 = uint(int(uint(_3448) >> uint(2)));
    int _3452 = _3448 & 3;
    float _3454 = (*spvDescriptorSet0.vp_c9)._m0[int(_3450)][_3452];
    float _3456 = float(uint(_3430));
    int _3458 = as_type<int>(_3390) + (-2);
    int _3460 = as_type<int>(_3262) & 3;
    bool _3462 = _3460 != 0;
    int _3464 = as_type<int>(_3424) + (-2);
    int _3466 = _3436 + 8;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    uint _3470 = uint(int(uint(int(_3468)) >> uint(2)));
    int _3472 = int(_3468) & 3;
    float _3474 = (*spvDescriptorSet0.vp_c9)._m0[int(_3470)][_3472];
    int _3476 = int(_3468) + 1;
    uint _3478 = uint(int(uint(_3476) >> uint(2)));
    int _3480 = _3476 & 3;
    float _3482 = (*spvDescriptorSet0.vp_c9)._m0[int(_3478)][_3480];
    int _3484 = _3462 ? 0 : 1;
    int _3486 = as_type<int>(_3262) & 3;
    bool _3488 = _3486 != 0;
    float _3490 = as_type<float>(_3464) * _3456;
    bool _3492 = !_2512;
    int _3494 = _3492 ? 0 : 1;
    float _3496 = _3390;
    if (!_3432)
    {
        _3496 = _3336;
    }
    float _3498 = _3496;
    float _3500 = float(uint(_3438));
    float _3502 = trunc(_3490);
    float _3504 = precise::max(_3502, 0.0);
    uint _3506 = uint(_3504);
    bool _3508 = _1606 != 3;
    int _3510 = ~_3258;
    int _3512 = _3510 + 1;
    float _3514 = as_type<float>(_3458) * _3500;
    int _3516 = ~_3306;
    int _3518 = _3516 + 1;
    float _3520 = _3500;
    float _3522 = _3498;
    if (!_3432)
    {
        _3410 = _3340;
    }
    float _3524 = _3410;
    float _3526 = _3524;
    if (!_3432)
    {
        _3520 = _3406;
    }
    float _3528 = _3520;
    float _3530 = trunc(_3514);
    float _3532 = precise::max(_3530, 0.0);
    uint _3534 = uint(_3532);
    int _3536 = ~_3484;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    bool _3542 = uint(_3486) > 1u;
    bool _3544 = !_3432;
    float _3546 = _3528;
    int _3548 = _3540;
    if (!_3544)
    {
        float _3550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3554 = _3358 + _3552;
        float _3556 = rsqrt(_3348);
        float _3558 = _3554 * _3550;
        float _3560 = _3406 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3562 = _3558 * 0.15915493667125701904296875;
        float _3564 = _3562 * 6.283185482025146484375;
        float _3566 = sin(_3564);
        float _3568 = _3562 * 6.283185482025146484375;
        float _3570 = cos(_3568);
        float _3572 = fma(_3566, _3560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3574 = _3556 * _3572;
        float _3576 = fma(_3326, _3574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3578 = _3570 + (-1.0);
        float _3580 = fma(_3332, _3574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3582 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3584 = _3576 + _3582;
        float _3586 = _3578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3590 = _3580 + _3588;
        float _3592 = _3584 * _3584;
        float _3594 = fma(_3406, _3570, _3586);
        float _3596 = _3590 * _3590;
        _3546 = _3594;
        _3522 = _3592;
        _3526 = _3596;
        _3412 = _3576;
        _3414 = _3580;
    }
    float _3598 = _3546;
    float _3600 = _3522;
    float _3602 = _3526;
    float _3604 = _3412;
    float _3606 = _3414;
    if (!_3542)
    {
        int _3608 = ~_3484;
        int _3610 = _3608 + 1;
        _3548 = _3610;
    }
    int _3612 = _3548;
    float _3614 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3616 = _3598 + _3614;
    int _3618 = _3352 + 8;
    uint _3620 = uint(int(uint(_3618) >> uint(2)));
    uint _3622 = uint(int(uint(int(_3620)) >> uint(2)));
    int _3624 = int(_3620) & 3;
    float _3626 = (*spvDescriptorSet0.vp_c9)._m0[int(_3622)][_3624];
    int _3628 = int(_3620) + 1;
    uint _3630 = uint(int(uint(_3628) >> uint(2)));
    int _3632 = _3628 & 3;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[int(_3630)][_3632];
    float _3636 = -_2460;
    float _3638 = _3636 + 1.0;
    float _3640 = fma(_3616, _3616, _3600);
    bool _3642 = !_3488;
    int _3644 = _3642 ? 0 : 1;
    int _3646 = _3512 * int(_3506);
    int _3648 = _3646 + _3430;
    int _3650 = abs(_1652);
    int _3652 = _3518 * int(_3534);
    int _3654 = _3652 + _3438;
    int _3656 = abs(_3494);
    float _3658 = float(uint(_3648));
    float _3660 = float(uint(_3654));
    int _3662 = abs(_3644);
    float _3664 = as_type<float>(_3464) * _3658;
    bool _3666 = _3486 != 3;
    float _3668 = as_type<float>(_3458) * _3660;
    int _3670 = ~_3650;
    int _3672 = _3670 + 1;
    int _3674 = _3672 + 1;
    int _3676 = abs(_3612);
    float _3678 = trunc(_3668);
    float _3680 = precise::max(_3678, 0.0);
    uint _3682 = uint(_3680);
    int _3684 = _3674 * as_type<int>(_3454);
    int _3686 = abs(_3422);
    bool _3688 = uint(_3486) >= 2u;
    int _3690 = ~_3676;
    int _3692 = _3690 + 1;
    int _3694 = _3692 + 1;
    float _3696 = trunc(_3664);
    float _3698 = precise::max(_3696, 0.0);
    uint _3700 = uint(_3698);
    int _3702 = ~_3656;
    int _3704 = _3702 + 1;
    int _3706 = _3704 + 1;
    int _3708 = _3694 * as_type<int>(_3376);
    int _3710 = _3688 ? 0 : 1;
    int _3712 = _3706 * as_type<int>(_3446);
    int _3714 = _3712 + _3684;
    int _3716 = ~_3662;
    int _3718 = _3716 + 1;
    int _3720 = _3718 + 1;
    float _3722 = _3640 + _3602;
    int _3724 = ~_3686;
    int _3726 = _3724 + 1;
    int _3728 = _3726 + 1;
    int _3730 = ~_3710;
    int _3732 = _3730 + 1;
    int _3734 = _3732 + 1;
    int _3736 = _3720 * as_type<int>(_3368);
    int _3738 = _3736 + _3708;
    bool _3740 = _3486 != 3;
    int _3742 = _3728 * as_type<int>(_3474);
    int _3744 = _3742 + _3714;
    int _3746 = _3734;
    if (_3666)
    {
        int _3748 = ~_3710;
        int _3750 = _3748 + 1;
        _3746 = _3750;
    }
    int _3752 = _3746;
    float _3754 = sqrt(_3722);
    int _3756 = int(_3534) + int(_3682);
    int _3758 = abs(_3752);
    int _3760 = ~_3306;
    int _3762 = _3760 + 1;
    bool _3764 = !_3508;
    int _3766 = _3764 ? 0 : (-1);
    bool _3768 = !_3740;
    int _3770 = _3768 ? 0 : (-1);
    int _3772 = _3762 * _3756;
    int _3774 = _3772 + _3438;
    int _3776 = abs(_3766);
    int _3778 = ~_3758;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    int _3784 = abs(_3770);
    int _3786 = ~_3258;
    int _3788 = _3786 + 1;
    int _3790 = _3782 * as_type<int>(_3626);
    int _3792 = _3790 + _3738;
    int _3794 = int(_3506) + int(_3700);
    float _3796 = fma(_3214, _3214, 1.0);
    int _3798 = ~_3776;
    int _3800 = _3798 + 1;
    int _3802 = _3800 + 1;
    int _3804 = ~_3784;
    int _3806 = _3804 + 1;
    int _3808 = _3806 + 1;
    int _3810 = _3788 * _3794;
    int _3812 = _3810 + _3430;
    bool _3814 = uint(_3774) >= uint(_3306);
    int _3816 = _3802 * as_type<int>(_3482);
    int _3818 = _3816 + _3744;
    float _3820 = rsqrt(_3796);
    int _3822 = _3808 * as_type<int>(_3634);
    int _3824 = _3822 + _3792;
    bool _3826 = !_3814;
    int _3828 = _3826 ? 0 : (-1);
    int _3830 = _3430 ^ _3258;
    bool _3832 = uint(_3812) >= uint(_3258);
    int _3834 = ~_3828;
    int _3836 = _3756 + _3834;
    int _3838 = _3836 + 1;
    float _3840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3842 = uint(int(uint(_3830) >> uint(31)));
    bool _3844 = !_3832;
    int _3846 = _3844 ? 0 : (-1);
    bool _3848 = !_2534;
    int _3850 = _3848 ? 0 : 1;
    int _3852 = ~int(_3842);
    int _3854 = _3852 + 1;
    float _3856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3858 = ~_3794;
    int _3860 = _3858 + _3846;
    int _3862 = _3860 + 1;
    bool _3864 = !_2548;
    int _3866 = _3864 ? 0 : 1;
    int _3868 = abs(_3850);
    int _3870 = _3258 * _3862;
    int _3872 = _3870 + _3430;
    int _3874 = _3838 ^ _3854;
    int _3876 = abs(_3866);
    int _3878 = ~_3868;
    int _3880 = _3878 + 1;
    int _3882 = _3880 + 1;
    bool _3884 = _3258 == 0;
    bool _3886 = _3258 == 0;
    int _3888 = _3818 * _3882;
    int _3890 = ~_3854;
    int _3892 = _3890 + _3874;
    int _3894 = _3892 + 1;
    float _3896 = _3856 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _3898 = ~_3876;
    int _3900 = _3898 + 1;
    int _3902 = _3900 + 1;
    bool _3904 = !_3884;
    int _3906 = _3904 ? _3872 : (-1);
    bool _3908 = !_3886;
    int _3910 = _3908 ? _3894 : (-1);
    int _3912 = _3824 * _3902;
    bool _3914 = _809 == 0;
    float _3916 = float(_3906);
    float _3918 = _3840 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3920 = float(_3910);
    bool _3922 = !_3914;
    int _3924 = _3922 ? _3046 : (-1);
    float _3926 = fma(_3918, _3916, _2466);
    float _3928 = _1150 + 0.5;
    float _3930 = -_2432;
    float _3932 = fma(_3896, _3920, _3930);
    bool _3934 = !_2062;
    int _3936 = _3934 ? _3052 : (-1);
    float _3938 = _1142 + (-0.5);
    int _3940 = _3924 * _3868;
    int _3942 = _3940 + _3888;
    float _3944 = _3214 * _3820;
    float _3946 = fma(_3918, _3928, _3926);
    float _3948 = -_3896;
    float _3950 = fma(_3948, _3938, _3932);
    float _3952 = -_2456;
    float _3954 = _3952 + 1.0;
    int _3956 = _3936 * _3876;
    int _3958 = _3956 + _3912;
    float _3960 = -_3344;
    float _3962 = _3944 * _3960;
    float _3964 = -_3222;
    float _3966 = _3944 * _3964;
    float _3968 = -_3276;
    float _3970 = _3944 * _3968;
    float _3972 = fma(_1142, _3954, _3950);
    float _3974 = fma(_3820, _3188, _3962);
    float _3976 = fma(_3820, _3186, _3966);
    float _3978 = -_3638;
    float _3980 = fma(_1150, _3978, _3946);
    float _3982 = fma(_3820, _3190, _3970);
    float _3984 = _3344 + _3242;
    float _3986 = float(_3942);
    float _3988 = _3222 + _3240;
    float _3990 = float(_3958);
    float _3992 = _3276 + _3254;
    out.m_96.x = _3974;
    out.m_96.y = _3976;
    out.m_96.z = _3982;
    bool _3994 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3996 = isnan(_3754);
    bool _3998 = _3994 || _3996;
    bool _4000 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4002 = _3998 || _4000;
    out.m_98.x = _3986;
    out.m_98.w = _3990;
    out.m_100.x = _3980;
    out.m_100.y = _3972;
    float _4004 = _3966;
    if (!_4002)
    {
        _4004 = 1.0;
    }
    float _4006 = _4004;
    out.m_102.x = _3984;
    out.m_102.y = _3988;
    out.m_102.z = _3992;
    bool _4008 = !_4002;
    float _4010 = _4006;
    if (!_4008)
    {
        bool _4012 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4014 = isnan(_3754);
        bool _4016 = _4012 || _4014;
        bool _4018 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4020 = _4016 || _4018;
        if (!_4020)
        {
            float _4022 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4024 = _3754 + _4022;
            float _4026 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4028 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4026;
            float _4030 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4032 = _4030 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4034 = 1.0 / _4028;
            float _4036 = _4024 * _4034;
            float _4038 = fma(_4036, _4032, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4010 = _4038;
            _4040 = true;
        }
        else
        {
            bool _4042 = _3754 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4044 = isnan(_3754);
            bool _4046 = _4042 || _4044;
            bool _4048 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4050 = _4046 || _4048;
            if (!_4050)
            {
                float _4052 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4054 = _3754 + _4052;
                float _4056 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4058 = _4056 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4060 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4062 = _4060 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4064 = 1.0 / _4058;
                float _4066 = _4054 * _4064;
                float _4068 = fma(_4066, _4062, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4010 = _4068;
                _4040 = true;
            }
            else
            {
                _4010 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4040 = false;
    float _4070 = _4010;
    float _4072 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4074 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4076 = floor(_4072);
    float _4078 = floor(_4074);
    float _4080 = -_4076;
    float _4082 = _4072 + _4080;
    float _4084 = -_4078;
    float _4086 = _4074 + _4084;
    float2 _11548 = float2(_4082, _4086);
    float _4088 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11548, float2(0.0), isnan(_11548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11548, float2(0.0), isnan(_11548)), level(0.0)).x;
    float _4090 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4092 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4094 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4090);
    float _4096 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4098 = _3598 + _4096;
    float _4100 = _2806 + _4092;
    float _4102 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4104 = _3604 + _4102;
    float _4106 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4094);
    float _4108 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4110 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4112 = _4100 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4114 = _4106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4116 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4108);
    float _4118 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4110);
    float _4120 = fma(_2800, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4112);
    float _4122 = 1.0 / _4114;
    float _4124 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4116);
    float _4126 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4118);
    float _4128 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4120);
    float _4130 = fma(_4098, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4132 = _4124 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4134 = fma(_4104, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4136 = _4128 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _4138 = -_2806;
    float _4140 = _4138 + _4130;
    float _4142 = _4132 + _4114;
    float _4144 = -_2800;
    float _4146 = _4144 + _4134;
    float _4148 = _4140 * _4140;
    bool _4150 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4152 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4154 = _4150 || _4152;
    bool _4156 = isnan(0.5);
    bool _4158 = _4154 || _4156;
    float _4160 = _4142 * _4122;
    float _4162 = _4160 * 0.5;
    float _4164 = fma(_4146, _4146, _4148);
    float _4166 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4168 = fma(_4162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4166);
    float _4170 = _4126 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _4172 = trunc(_4136);
    int _4174 = int(_4172);
    float _4176 = 1.0 / _4168;
    float _4178 = trunc(_4170);
    int _4180 = int(_4178);
    int _4182 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4184 = _4174 + _4182;
    int _4186 = _4184 + 1;
    float _4188 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4190 = _4176 * _4188;
    bool _4192 = _4190 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _4194 = _4190 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _4196 = !_4192;
    int _4198 = _4196 ? 0 : 1;
    int _4200 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4202 = _4180 + _4200;
    int _4204 = _4202 + 1;
    int _4206 = _4204 | _4186;
    int _4208 = 2;
    int _4210 = _4206;
    int _4212 = _4186;
    int _4214 = _4204;
    float _4216 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4218 = _4134;
    if (!_4192)
    {
        _4208 = 1;
    }
    int _4220 = _4208;
    int _4222 = _4220;
    if (!_4194)
    {
        _4222 = _4198;
    }
    int _4224 = _4222;
    float _4226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4228 = _3606 + _4226;
    bool _4230 = _4204 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4232 = _4224 << 6;
    float _4234 = fma(_4228, _4070, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    bool _4236 = _4206 < 0;
    bool _4238 = _4236 || _4230;
    int _4240 = _4232 + 96;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    uint _4244 = uint(int(uint(int(_4242)) >> uint(2)));
    int _4246 = int(_4242) & 3;
    float _4248 = (*spvDescriptorSet0.vp_c15)._m0[int(_4244)][_4246];
    int _4250 = int(_4242) + 1;
    uint _4252 = uint(int(uint(_4250) >> uint(2)));
    int _4254 = _4250 & 3;
    float _4256 = (*spvDescriptorSet0.vp_c15)._m0[int(_4252)][_4254];
    float _4258 = -_2812;
    float _4260 = _4258 + _4234;
    bool _4262 = _4186 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4264 = _4262 || _4238;
    float _4266 = fma(_4260, _4260, _4164);
    int _4268 = _4232 + 104;
    uint _4270 = uint(int(uint(_4268) >> uint(2)));
    uint _4272 = uint(int(uint(int(_4270)) >> uint(2)));
    int _4274 = int(_4270) & 3;
    float _4276 = (*spvDescriptorSet0.vp_c15)._m0[int(_4272)][_4274];
    int _4278 = int(_4270) + 1;
    uint _4280 = uint(int(uint(_4278) >> uint(2)));
    int _4282 = _4278 & 3;
    float _4284 = (*spvDescriptorSet0.vp_c15)._m0[int(_4280)][_4282];
    float _4286 = sqrt(_4266);
    float _4288 = as_type<float>(_4224);
    if (!_4264)
    {
        int _4290 = _4186 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4292 = _4290 + _4204;
        _4210 = _4292;
    }
    int _4294 = _4210;
    int _4296 = _4232 + 48;
    uint _4298 = uint(int(uint(_4296) >> uint(2)));
    uint _4300 = uint(int(uint(int(_4298)) >> uint(2)));
    int _4302 = int(_4298) & 3;
    float _4304 = (*spvDescriptorSet0.vp_c15)._m0[int(_4300)][_4302];
    int _4306 = int(_4298) + 1;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    int _4310 = _4306 & 3;
    float _4312 = (*spvDescriptorSet0.vp_c15)._m0[int(_4308)][_4310];
    if (!_4264)
    {
        int _4314 = _4294 << 2;
        _4212 = _4314;
    }
    int _4316 = _4212;
    int _4318 = _4316;
    if (!_4264)
    {
        uint _4320 = uint(int(uint(_4294) >> uint(2)));
        _4214 = int(_4320);
    }
    int _4322 = _4214;
    if (!_4264)
    {
        int _4324 = 12 & _4316;
        _4318 = _4324;
    }
    int _4326 = _4318;
    int _4328 = _4232 + 64;
    uint _4330 = uint(int(uint(_4328) >> uint(2)));
    uint _4332 = uint(int(uint(int(_4330)) >> uint(2)));
    int _4334 = int(_4330) & 3;
    float _4336 = (*spvDescriptorSet0.vp_c15)._m0[int(_4332)][_4334];
    int _4338 = int(_4330) + 1;
    uint _4340 = uint(int(uint(_4338) >> uint(2)));
    int _4342 = _4338 & 3;
    float _4344 = (*spvDescriptorSet0.vp_c15)._m0[int(_4340)][_4342];
    bool _4346 = _4286 > 0.0;
    if (!_4264)
    {
        int _4348 = _4322 << 4;
        int _4350 = _4348 + _4326;
        _1276 = as_type<float>(_4350);
    }
    float _4352 = _1276;
    int _4354 = _4232 + 56;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    uint _4358 = uint(int(uint(int(_4356)) >> uint(2)));
    int _4360 = int(_4356) & 3;
    float _4362 = (*spvDescriptorSet0.vp_c15)._m0[int(_4358)][_4360];
    int _4364 = int(_4356) + 1;
    uint _4366 = uint(int(uint(_4364) >> uint(2)));
    int _4368 = _4364 & 3;
    float _4370 = (*spvDescriptorSet0.vp_c15)._m0[int(_4366)][_4368];
    if (!_4346)
    {
        _4216 = _4130;
    }
    float _4372 = _4216;
    int _4374 = _4232 + 72;
    uint _4376 = uint(int(uint(_4374) >> uint(2)));
    uint _4378 = uint(int(uint(int(_4376)) >> uint(2)));
    int _4380 = int(_4376) & 3;
    float _4382 = (*spvDescriptorSet0.vp_c15)._m0[int(_4378)][_4380];
    int _4384 = int(_4376) + 1;
    uint _4386 = uint(int(uint(_4384) >> uint(2)));
    int _4388 = _4384 & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    float _4392 = _4100 * _4256;
    int _4394 = _4232 + 80;
    uint _4396 = uint(int(uint(_4394) >> uint(2)));
    uint _4398 = uint(int(uint(int(_4396)) >> uint(2)));
    int _4400 = int(_4396) & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    int _4404 = int(_4396) + 1;
    uint _4406 = uint(int(uint(_4404) >> uint(2)));
    int _4408 = _4404 & 3;
    float _4410 = (*spvDescriptorSet0.vp_c15)._m0[int(_4406)][_4408];
    float _4412 = fma(_2800, _4248, _4392);
    float _4414 = fma(_2812, _4276, _4412);
    int _4416 = _4232 + 88;
    uint _4418 = uint(int(uint(_4416) >> uint(2)));
    uint _4420 = uint(int(uint(int(_4418)) >> uint(2)));
    int _4422 = int(_4418) & 3;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[int(_4420)][_4422];
    int _4426 = int(_4418) + 1;
    uint _4428 = uint(int(uint(_4426) >> uint(2)));
    int _4430 = _4426 & 3;
    float _4432 = (*spvDescriptorSet0.vp_c15)._m0[int(_4428)][_4430];
    float _4434 = _4412;
    float _4436 = _4372;
    if (!_4264)
    {
        float _4438 = floor(_4170);
        _4434 = _4438;
    }
    float _4440 = _4434;
    float _4442 = _4414 + _4284;
    float _4444 = _4100 * _4312;
    float _4446 = _4352;
    float _4448 = _4444;
    float _4450 = _4336;
    float _4452 = _4312;
    if (!_4264)
    {
        int _4454 = as_type<int>(_4352) + 400;
        uint _4456 = uint(int(uint(_4454) >> uint(2)));
        uint _4458 = uint(int(uint(int(_4456)) >> uint(2)));
        int _4460 = int(_4456) & 3;
        float _4462 = (*spvDescriptorSet0.vp_c15)._m0[int(_4458)][_4460];
        _4446 = _4462;
    }
    float _4464 = _4446;
    float _4466 = 1.0 / _4442;
    float _4468 = fma(_2800, _4304, _4444);
    if (!_4346)
    {
        _4448 = _4234;
    }
    float _4470 = _4448;
    float _4472 = _4100 * _4344;
    float _4474 = fma(_2800, _4336, _4472);
    float _4476 = _4470;
    if (!_4346)
    {
        _4450 = _4134;
    }
    float _4478 = _4450;
    bool _4480 = !_4346;
    float _4482 = _4478;
    float _4484 = _4478;
    float _4486 = _4466;
    if (!_4480)
    {
        float _4488 = _239 * _239;
        float _4490 = fma(_235, _235, _4488);
        float _4492 = fma(_241, _241, _4490);
        float _4494 = rsqrt(_4266);
        float _4496 = sqrt(_4492);
        float _4498 = _4146 * _4494;
        float _4500 = _4140 * _4494;
        float _4502 = _4260 * _4494;
        bool _4504 = _4496 > 0.0;
        float _4506 = _4494;
        float _4508 = _4496;
        _4452 = _4498;
        if (!_4504)
        {
            _4482 = _4134;
        }
        float _4510 = _4482;
        _4484 = _4510;
        if (!_4504)
        {
            _4506 = _4130;
        }
        float _4512 = _4506;
        _4436 = _4512;
        if (!_4504)
        {
            _4508 = _4234;
        }
        float _4514 = _4508;
        bool _4516 = !_4504;
        _4476 = _4514;
        if (!_4516)
        {
            float _4518 = rsqrt(_4492);
            float _4520 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4522 = _239 * _4518;
            float _4524 = _235 * _4518;
            float _4526 = _4500 * _4522;
            float _4528 = _241 * _4518;
            float _4530 = fma(_4498, _4524, _4526);
            float _4532 = _4520 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4534 = fma(_4502, _4528, _4530);
            float _4536 = _4534 * _4532;
            float _4538 = fma(_235, _4536, _4134);
            float _4540 = fma(_239, _4536, _4130);
            float _4542 = fma(_241, _4536, _4234);
            _4484 = _4538;
            _4436 = _4540;
            _4476 = _4542;
        }
    }
    float _4544 = _4484;
    float _4546 = _4436;
    float _4548 = _4476;
    float _4550 = _4452;
    float _4552 = fma(_2812, _4362, _4468);
    float _4554 = fma(_2812, _4382, _4474);
    float _4556 = _4550;
    if (_4158)
    {
        _253 = _4544;
    }
    float _4558 = _253;
    float _4560 = _4558;
    if (_4158)
    {
        _255 = _4546;
    }
    float _4562 = _255;
    float _4564 = _4562;
    if (_4158)
    {
        _257 = _4548;
    }
    float _4566 = _257;
    float _4568 = _4566;
    if (!_4158)
    {
        float _4570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4572 = _2806 + _4570;
        float _4574 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4576 = _2800 + _4574;
        float _4578 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4580 = -_2806;
        float _4582 = _4580 + _4546;
        float _4584 = _4572 * _4572;
        float _4586 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4588 = _2812 + _4586;
        float _4590 = -_2800;
        float _4592 = _4590 + _4544;
        float _4594 = fma(_4576, _4576, _4584);
        float _4596 = fma(_4588, _4588, _4594);
        float _4598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4600 = _4578 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4602 = -_2812;
        float _4604 = _4602 + _4548;
        float _4606 = sqrt(_4596);
        float _4608 = precise::min(_4606, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4610 = _4608 * _4598;
        float _4612 = _4600 * _4610;
        float _4614 = fma(_4582, _4612, _2806);
        float _4616 = fma(_4592, _4612, _2800);
        float _4618 = fma(_4604, _4612, _2812);
        _4564 = _4614;
        _4560 = _4616;
        _4568 = _4618;
    }
    float _4620 = _4564;
    float _4622 = _4560;
    float _4624 = _4568;
    float _4626 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4628 = _4552 + _4370;
    float _4630 = _4554 + _4390;
    float _4632 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4634 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4636 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4626);
    float _4638 = _4628 * _4466;
    float _4640 = _4620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4642 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4632);
    float _4644 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4634);
    float _4646 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4636);
    float _4648 = fma(_4622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4640);
    bool _4650 = _4638 >= 0.0;
    float _4652 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4642);
    float _4654 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4644);
    float _4656 = _4646 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4658 = _4630 * _4466;
    float _4660 = fma(_4624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4648);
    bool _4662 = _4638 <= 1.0;
    bool _4664 = _4662 && _4650;
    float _4666 = _4654 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4668 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4670 = _4660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _4672 = _4658 >= 0.0;
    bool _4674 = _4672 && _4664;
    float _4676 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4678 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4668);
    float _4680 = _4670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _4682 = _4658 <= 1.0;
    bool _4684 = _4682 && _4674;
    float _4686 = _4652 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4688 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4678);
    float _4690 = -_4680;
    float _4692 = fma(_4690, _4676, 1.0);
    float _4694 = _4100 * _4410;
    float _4696 = _4628;
    if (!_4264)
    {
        float _4698 = rint(_4464);
        float _4700 = precise::max(_4698, 0.0);
        uint _4702 = uint(_4700);
        uint _4704 = clamp(_4702, 0u, 65535u);
        _4696 = as_type<float>(_4704);
    }
    float _4706 = _4696;
    float _4708 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4688);
    float _4710 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4712 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4714 = fma(_2800, _4402, _4694);
    float _4716 = _4708;
    if (!_4264)
    {
        float _4718 = -_4440;
        float _4720 = _4170 + _4718;
        _4556 = _4720;
    }
    float _4722 = _4556;
    float _4724 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4710);
    float _4726 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4712);
    float _4728 = _4474;
    if (!_4264)
    {
        float _4730 = floor(_4136);
        _4728 = _4730;
    }
    float _4732 = _4728;
    if (_4684)
    {
        float _4734 = float(_4224);
        _4288 = _4734;
    }
    float _4736 = _4288;
    float _4738 = fma(_2812, _4424, _4714);
    float _4740 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4724);
    float _4742 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4726);
    float _4744 = _4738 + _4432;
    float _4746 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4740);
    float _4748 = log2(_4692);
    float _4750 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4742);
    float _4752 = _4744 * _4466;
    float _4754 = 1.0 / _4708;
    float _4756 = _4732;
    float _4758 = _4746;
    if (!_4264)
    {
        float _4760 = -_4732;
        float _4762 = _4136 + _4760;
        _4756 = _4762;
    }
    float _4764 = _4756;
    float _4766 = _4714;
    if (_4684)
    {
        float _4768 = rint(_4736);
        float _4770 = precise::max(_4768, 0.0);
        uint _4772 = uint(_4770);
        uint _4774 = clamp(_4772, 0u, 65535u);
        _4766 = as_type<float>(_4774);
    }
    float _4776 = _4766;
    float _4778 = _4748 * 0.693147182464599609375;
    float _4780 = _4764;
    if (!_4264)
    {
        float3 _12723 = float3(_4722, _4764, float(as_type<int>(_4706)));
        float3 _12727 = select(_12723, float3(0.0), isnan(_12723));
        float _4782 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12727.xy, uint(rint(_12727.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12727.xy, uint(rint(_12727.z)), level(0.0)).x;
        _4780 = _4782;
    }
    float _4784 = _4780;
    float _4786 = _4778 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4788 = _4746 * _4754;
    float _4790 = _4750 * _4754;
    float _4792 = fma(_4788, 0.5, 0.5);
    float _4794 = fma(_4790, -0.5, 0.5);
    float _4796 = _4776;
    float _4798 = _4754;
    if (_4684)
    {
        float3 _12757 = float3(_4638, _4658, float(as_type<int>(_4776)));
        float3 _12759 = select(_12757, float3(0.0), isnan(_12757));
        float _4800 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12759.xy, uint(rint(_12759.z)), _4752, level(0.0));
        _4796 = _4800;
    }
    float _4802 = _4796;
    float3 _12769 = float3(_4792, _4794, _4786);
    float _4804 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12769, float3(0.0), isnan(_12769)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12769, float3(0.0), isnan(_12769)), level(0.0)).x;
    float3 _12778 = float3(_4792, _4794, _4786);
    float4 _4807 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12778, float3(0.0), isnan(_12778)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12778, float3(0.0), isnan(_12778)), level(0.0)).xyzw;
    float _4809 = _4807.x;
    float _4811 = _4807.y;
    float _4813 = _4807.z;
    float _4815 = _4807.w;
    if (_4264)
    {
        _4798 = 1.0;
    }
    float _4817 = _4798;
    bool _4819 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4821 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4823 = _4819 || _4821;
    bool _4825 = isnan(0.5);
    bool _4827 = _4823 || _4825;
    float _4829 = _4817;
    if (_4827)
    {
        _4486 = 1.0;
    }
    float _4831 = _4486;
    float _4833 = _4831;
    float _4835 = _4809;
    if (!_4827)
    {
        float _4837 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4839 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4841 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4839;
        float _4843 = _4837 * 0.15915493667125701904296875;
        float _4845 = _4843 * 6.283185482025146484375;
        float _4847 = cos(_4845);
        float _4849 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4851 = _4849 * 0.15915493667125701904296875;
        float _4853 = _4843 * 6.283185482025146484375;
        float _4855 = sin(_4853);
        float _4857 = 1.0 / _4847;
        float _4859 = _4851 * 6.283185482025146484375;
        float _4861 = cos(_4859);
        float _4863 = _4855 * _4857;
        float _4865 = _4851 * 6.283185482025146484375;
        float _4867 = sin(_4865);
        float _4869 = _4861 * _4863;
        float _4871 = 1.0 / _4841;
        float _4873 = 1.0 / _4869;
        float _4875 = _4867 * _4873;
        float _4877 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4879 = fma(_4190, _4875, _4877);
        float _4881 = _4879 * _4871;
        float _4883 = precise::clamp(_4881, 0.0, 1.0);
        _4833 = _4883;
    }
    float _4885 = _4833;
    if (!_4264)
    {
        int _4887 = _4294 << 4;
        int _4889 = _4887 + 2048;
        uint _4891 = uint(int(uint(_4889) >> uint(2)));
        uint _4893 = uint(int(uint(int(_4891)) >> uint(2)));
        int _4895 = int(_4891) & 3;
        float _4897 = (*spvDescriptorSet0.vp_c15)._m0[int(_4893)][_4895];
        int _4899 = int(_4891) + 1;
        uint _4901 = uint(int(uint(_4899) >> uint(2)));
        int _4903 = _4899 & 3;
        float _4905 = (*spvDescriptorSet0.vp_c15)._m0[int(_4901)][_4903];
        int _4907 = _4889 + 8;
        uint _4909 = uint(int(uint(_4907) >> uint(2)));
        uint _4911 = uint(int(uint(int(_4909)) >> uint(2)));
        int _4913 = int(_4909) & 3;
        float _4915 = (*spvDescriptorSet0.vp_c15)._m0[int(_4911)][_4913];
        int _4917 = int(_4909) + 1;
        uint _4919 = uint(int(uint(_4917) >> uint(2)));
        int _4921 = _4917 & 3;
        float _4923 = (*spvDescriptorSet0.vp_c15)._m0[int(_4919)][_4921];
        float _4925 = _4100 * _4905;
        float _4927 = fma(_2800, _4897, _4925);
        float _4929 = fma(_2812, _4915, _4927);
        float _4931 = _4929 + _4923;
        float _4933 = precise::clamp(_4931, 0.0, 1.0);
        float _4935 = -_4933;
        float _4937 = _4935 + _4784;
        float _4939 = fma(_4937, 500.0, 1.5);
        float _4941 = exp2(_4939);
        float _4943 = 0.0 + _4941;
        float _4945 = precise::clamp(_4943, 0.0, 1.0);
        _4829 = _4945;
    }
    float _4947 = _4829;
    float _4949 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4951 = _4620 + _4949;
    float _4953 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4955 = _4622 + _4953;
    float _4957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4959 = _4624 + _4957;
    float _4961 = _4951 * _4951;
    float _4963 = fma(_4955, _4955, _4961);
    float _4965 = fma(_4959, _4959, _4963);
    float _4967 = rsqrt(_4965);
    float _4969 = _4967 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4971 = _4955 * _4969;
    float _4973 = _4959 * _4969;
    float _4975 = _4971 * _4971;
    float _4977 = _4973 * _4973;
    float _4979 = _4975 + _4977;
    float _4981 = sqrt(_4979);
    bool _4983 = _4981 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4985 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4987 = _4981 + _4985;
    float _4989 = _4959;
    float _4991 = _4967;
    float _4993 = _4987;
    float _4995 = _4951;
    if (_4983)
    {
        float _4997 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4989 = _4997;
    }
    float _4999 = _4989;
    if (_4983)
    {
        float _5001 = rsqrt(_4979);
        _4991 = _5001;
    }
    float _5003 = _4991;
    float _5005 = _5003;
    if (_4983)
    {
        float _5007 = _4987 * _4999;
        _4993 = _5007;
    }
    float _5009 = _4993;
    if (_4983)
    {
        float _5011 = _5009 * 0.15915493667125701904296875;
        _3416 = _5011;
    }
    float _5013 = _3416;
    float _5015 = _4999;
    float _5017 = _5013;
    if (_4983)
    {
        float _5019 = _5013 * 6.283185482025146484375;
        float _5021 = sin(_5019);
        _5015 = _5021;
    }
    float _5023 = _5015;
    float _5025 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5027 = precise::max(0.0, _5025);
    float _5029 = _4961;
    float _5031 = _5027;
    if (_4983)
    {
        float _5033 = _5013 * 6.283185482025146484375;
        float _5035 = cos(_5033);
        _5029 = _5035;
    }
    float _5037 = _5029;
    float _5039 = -_4969;
    float _5041 = -_5027;
    float _5043 = fma(_4951, _5039, _5041);
    if (!_4983)
    {
        _4995 = _4973;
    }
    float _5045 = _4995;
    float _5047 = _5045;
    if (_4983)
    {
        float _5049 = _5043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5031 = _5049;
    }
    float _5051 = _5031;
    float _5053 = _5051;
    if (!_4983)
    {
        _5017 = _4975;
    }
    float _5055 = _5017;
    float _5057 = _5023;
    float _5059 = _5055;
    if (_4983)
    {
        float _5061 = fma(_5023, _5051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5057 = _5061;
    }
    float _5063 = _5057;
    float _5065 = _5063;
    float _5067 = _5037;
    if (_4983)
    {
        float _5069 = _5037 + (-1.0);
        _5053 = _5069;
    }
    float _5071 = _5053;
    float _5073 = _5071;
    if (_4983)
    {
        float _5075 = _5003 * _5063;
        _4218 = _5075;
    }
    float _5077 = _4218;
    if (!_4983)
    {
        _5005 = _4971;
    }
    float _5079 = _5005;
    float _5081 = _5079;
    if (_4983)
    {
        float _5083 = _5071 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5073 = _5083;
    }
    float _5085 = _5073;
    if (_4983)
    {
        float _5087 = _4971 * _5077;
        _5081 = _5087;
    }
    float _5089 = _5081;
    if (!_4983)
    {
        _5065 = _5043;
    }
    float _5091 = _5065;
    float _5093 = _5091;
    if (_4983)
    {
        float _5095 = _4973 * _5077;
        _5047 = _5095;
    }
    float _5097 = _5047;
    if (_4983)
    {
        float _5099 = fma(_5043, _5037, _5085);
        _5093 = _5099;
    }
    float _5101 = _5093;
    if (_4983)
    {
        float _5103 = _5089 * _5089;
        _5059 = _5103;
    }
    float _5105 = _5059;
    if (!_4983)
    {
        _5067 = _4977;
    }
    float _5107 = _5067;
    float _5109 = _5107;
    if (_4983)
    {
        float _5111 = _5097 * _5097;
        _5109 = _5111;
    }
    float _5113 = _5109;
    float _5115 = sqrt(_4965);
    float _5117 = fma(_5101, _5101, _5105);
    float _5119 = _5117 + _5113;
    float _5121 = rsqrt(_5119);
    float _5123 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5125 = fma(_5115, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5123);
    float _5127 = precise::clamp(_5125, 0.0, 1.0);
    float _5129 = -_5127;
    float _5131 = _5129 + 1.0;
    float _5133 = abs(_5131);
    float _5135 = log2(_5133);
    float _5137 = _5121 * _5089;
    float _5139 = _5121 * _5101;
    float _5141 = _5121 * _5097;
    float _5143 = _5137 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5145 = -_5143;
    float _5147 = fma(_5139, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5145);
    float _5149 = -_5141;
    float _5151 = fma(_5149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5147);
    float _5153 = _5135 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5155 = fma(_5151, -0.5, 0.5);
    float _5157 = fma(_5151, 0.5, 0.5);
    float _5159 = _5139 + 1.0;
    float _5161 = exp2(_5153);
    float _5163 = fma(_5157, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5165 = fma(_5157, _5163, -0.212114393711090087890625);
    float _5167 = sqrt(_5155);
    float _5169 = fma(_5157, _5165, 1.570728778839111328125);
    float _5171 = -_5139;
    float _5173 = fma(_5161, _5159, _5171);
    float _5175 = fma(_5173, 0.5, 0.5);
    float _5177 = _5167 * 0.636619746685028076171875;
    float _5179 = -_5169;
    float _5181 = fma(_5177, _5179, 1.0);
    float2 _13343 = float2(_5181, _5175);
    float3 _5185 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_13343, float2(0.0), isnan(_13343)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_13343, float2(0.0), isnan(_13343)), level(0.0)).xyz;
    float _5187 = _5185.x;
    float _5189 = _5185.y;
    float _5191 = _5185.z;
    float _5193 = abs(_4190);
    float _5195 = log2(_5193);
    float _5197 = _5135 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5199 = _4656 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5201 = -_4088;
    float _5203 = _5201 + 1.0;
    float _5205 = fma(_4666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5199);
    float _5207 = exp2(_5197);
    bool _5209 = _4190 <= 8000.0;
    bool _5211 = isnan(_4190);
    bool _5213 = _5209 || _5211;
    bool _5215 = isnan(8000.0);
    bool _5217 = _5213 || _5215;
    float _5219 = float(_5217);
    float _5221 = fma(_4670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5205);
    bool _5223 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5225 = isnan(_5115);
    bool _5227 = _5223 || _5225;
    bool _5229 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5231 = _5227 || _5229;
    float _5233 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5221);
    float _5235 = _5195 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5237 = _4708 * 0.5;
    float _5239 = _4746 + _4708;
    float _5241 = _5233 + _4708;
    out.gl_Position.x = _4746;
    out.gl_Position.y = _4750;
    out.gl_Position.z = _5233;
    out.gl_Position.w = _4708;
    float _5243 = fma(_4750, -0.5, _5237);
    float _5245 = exp2(_5235);
    float _5247 = _5241 * 0.5;
    float _5249 = _5239 * 0.5;
    out.m_104.x = _5249;
    out.m_104.y = _5243;
    out.m_104.z = _5247;
    out.m_104.w = _4708;
    float _5251 = -_5207;
    float _5253 = _5251 + 1.0;
    float _5255 = _5233;
    if (!_4684)
    {
        _4758 = 1.0;
    }
    float _5257 = _4758;
    float _5259 = _5257;
    if (_4684)
    {
        bool _5261 = _4802 >= _4752;
        bool _5263 = isnan(_4802);
        bool _5265 = _5261 || _5263;
        bool _5267 = isnan(_4752);
        bool _5269 = _5265 || _5267;
        float _5271 = float(_5269);
        _5259 = _5271;
    }
    float _5273 = _5259;
    float _5275 = fma(_5245, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5277 = precise::clamp(_5275, 0.0, 1.0);
    float _5279 = _5253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5281 = _5279;
    if (!_5231)
    {
        _4716 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5283 = _4716;
    float _5285 = fma(_5277, -2.0, 3.0);
    float _5287 = _5277 * _5277;
    float _5289 = _5279 * _4804;
    float _5291 = _5273 * _4947;
    float _5293 = _5283;
    float _5295 = _5283;
    if (!_5231)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5297 = _5255;
    float _5299 = _5287 * _5285;
    float _5301 = _4815 * _5289;
    float _5303 = -_5299;
    float _5305 = _5303 + 1.0;
    float _5307 = fma(_5305, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5299);
    float _5309 = _5219 * _5307;
    float _5311 = _5309 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5313 = _5203 * _5311;
    float _5315 = precise::clamp(_5313, 0.0, 1.0);
    float _5317 = -_5315;
    float _5319 = fma(_5317, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5321 = -_5291;
    float _5323 = fma(_5321, _5319, 1.0);
    float _5325 = precise::clamp(_5323, 0.0, 1.0);
    float _5327 = -_5279;
    float _5329 = _5327 + 1.0;
    float _5331 = _5329;
    float _5333 = _5325;
    float _5335 = _5297;
    float _5337 = _5297;
    if (!_5231)
    {
        _5281 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5339 = _5281;
    float _5341 = _5191 * _5289;
    float _5343 = fma(_5187, _5301, _4809);
    float _5345 = fma(_5189, _5301, _4811);
    float _5347 = _5325 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5349 = _4815 * _5329;
    float _5351 = fma(_4815, _5341, _4813);
    float _5353 = _4885 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5355 = _5339;
    float _5357 = _5339;
    if (!_5231)
    {
        _4835 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5359 = _4835;
    out.m_106.x = _5347;
    float _5361 = _5359;
    float _5363 = _5359;
    if (!_5231)
    {
        _5331 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5365 = _5331;
    float _5367 = _5365;
    float _5369 = _5365;
    if (!_5231)
    {
        _5333 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5371 = _5333;
    out.m_108.x = _5343;
    out.m_108.y = _5345;
    out.m_108.z = _5351;
    out.m_108.w = _5349;
    bool _5373 = !_5231;
    float _5375 = _5371;
    float _5377 = _5371;
    if (!_5373)
    {
        bool _5379 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5381 = isnan(_5115);
        bool _5383 = _5379 || _5381;
        bool _5385 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5387 = _5383 || _5385;
        if (!_5387)
        {
            float _5389 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5391 = _5115 + _5389;
            float _5393 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5395 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5393;
            float _5397 = 1.0 / _5395;
            float _5399 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5401 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5403 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5405 = _5403 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5407 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5409 = _5407 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5411 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5413 = _5411 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5415 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5417 = _5415 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5419 = _5391 * _5397;
            float _5421 = precise::clamp(_5419, 0.0, 1.0);
            float _5423 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5425 = _5423 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5427 = fma(_5421, _5401, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5429 = fma(_5421, _5425, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5431 = fma(_5421, _5405, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5433 = fma(_5421, _5409, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5435 = fma(_5421, _5413, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5437 = fma(_5421, _5417, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5295 = _5429;
            _5369 = _5435;
            _5363 = _5427;
            _5357 = _5433;
            _5337 = _5431;
            _5377 = _5437;
            _5439 = true;
        }
        else
        {
            bool _5441 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5443 = isnan(_5115);
            bool _5445 = _5441 || _5443;
            bool _5447 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5449 = _5445 || _5447;
            if (!_5449)
            {
                _5361 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5451 = _5361;
            _5363 = _5451;
            if (!_5449)
            {
                _5293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5453 = _5293;
            _5295 = _5453;
            if (!_5449)
            {
                _5335 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5455 = _5335;
            _5337 = _5455;
            if (!_5449)
            {
                _5355 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5457 = _5355;
            _5357 = _5457;
            if (!_5449)
            {
                _5367 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5459 = _5367;
            _5369 = _5459;
            if (!_5449)
            {
                _5375 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5461 = _5375;
            bool _5463 = !_5449;
            _5377 = _5461;
            if (!_5463)
            {
                bool _5465 = _5115 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5467 = isnan(_5115);
                bool _5469 = _5465 || _5467;
                bool _5471 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5473 = _5469 || _5471;
                if (!_5473)
                {
                    float _5475 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5477 = _5115 + _5475;
                    float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5481 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5479;
                    float _5483 = 1.0 / _5481;
                    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5489 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5491 = _5489 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5493 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5495 = _5493 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5497 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5499 = _5497 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5501 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5503 = _5501 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5505 = _5477 * _5483;
                    float _5507 = precise::clamp(_5505, 0.0, 1.0);
                    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5511 = _5509 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5513 = fma(_5507, _5487, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5515 = fma(_5507, _5511, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5517 = fma(_5507, _5491, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5519 = fma(_5507, _5495, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5521 = fma(_5507, _5499, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5523 = fma(_5507, _5503, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5295 = _5515;
                    _5369 = _5521;
                    _5363 = _5513;
                    _5357 = _5519;
                    _5337 = _5517;
                    _5377 = _5523;
                    _5439 = true;
                }
                else
                {
                    _5295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5369 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5363 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5357 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5337 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5377 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5439 = false;
    float _5525 = _5295;
    float _5527 = _5369;
    float _5529 = _5363;
    float _5531 = _5357;
    float _5533 = _5337;
    float _5535 = _5377;
    float _5537 = fma(_3988, -0.5, 0.5);
    float _5539 = precise::clamp(_5537, 0.0, 1.0);
    float _5541 = -_5525;
    float _5543 = _5541 + _5527;
    float _5545 = _5353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5547 = -_5529;
    float _5549 = _5547 + _5531;
    float _5551 = fma(_5539, _5543, _5525);
    out.m_110.x = 0.0;
    float _5553 = -_5533;
    float _5555 = _5553 + _5535;
    float _5557 = fma(_5539, _5549, _5529);
    float _5559 = _5551 * 0.586610972881317138671875;
    out.m_65.x = _5545;
    bool _5561 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5563 = fma(_5539, _5555, _5533);
    float _5565 = fma(_5557, 0.298911988735198974609375, _5559);
    bool _5567 = _4885 > 0.0;
    bool _5569 = isnan(_4885);
    bool _5571 = _5567 || _5569;
    bool _5573 = isnan(0.0);
    bool _5575 = _5571 || _5573;
    float _5577 = fma(_5563, 0.114477999508380889892578125, _5565);
    float _5579 = -_5577;
    float _5581 = _5557 + _5579;
    float _5583 = -_5577;
    float _5585 = _5551 + _5583;
    float _5587 = -_5577;
    float _5589 = _5563 + _5587;
    float _5591 = fma(_5581, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    float _5593 = fma(_5585, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    float _5595 = fma(_5589, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5577);
    bool _5597 = !_5561;
    if (!_5597)
    {
        float _5599 = -_4620;
        float _5601 = _5599 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5603 = -_4622;
        float _5605 = _5603 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5607 = -_4624;
        float _5609 = _5607 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5611 = _5601 * _5601;
        float _5613 = fma(_5605, _5605, _5611);
        float _5615 = fma(_5609, _5609, _5613);
        float _5617 = sqrt(_5615);
        float _5619 = rsqrt(_5615);
        float _5621 = -_5617;
        float _5623 = _5621 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5625 = _5623 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5627 = precise::clamp(_5625, 0.0, 1.0);
        float _5629 = _5605 * _5619;
        float _5631 = _5601 * _5619;
        float _5633 = abs(_5627);
        float _5635 = log2(_5633);
        float _5637 = _5609 * _5619;
        float _5639 = _5629 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5641 = _3988 * _5631;
        float _5643 = -_5631;
        float _5645 = -_5639;
        float _5647 = fma(_5643, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5645);
        float _5649 = fma(_3984, _5629, _5641);
        float _5651 = -_5637;
        float _5653 = fma(_5651, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5647);
        float _5655 = fma(_3992, _5637, _5649);
        float _5657 = precise::clamp(_5655, 0.0, 1.0);
        float _5659 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5661 = _5653 + _5659;
        float _5663 = _5635 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5665 = _5661 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5667 = precise::clamp(_5665, 0.0, 1.0);
        float _5669 = exp2(_5663);
        float _5671 = _5669 * _5667;
        float _5673 = _5657 * _5671;
        float _5675 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5677 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5679 = _5673 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _5675;
        out.m_110.y = _5677;
        out.m_110.z = _5679;
    }
    out.m_112.x = _5591;
    out.m_112.y = _5593;
    out.m_112.z = _5595;
    if (_5575)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_65.x = 0.0;
    float _5681 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5681;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

